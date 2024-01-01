import { Scrapeable, TraverseScraper } from './traverse-scraper.js';
import { ScrapeCallback } from './scraper.js';
import * as cheerio from 'cheerio';
import "reflect-metadata";

const tableColumnMetadataKey = Symbol("tableColumn");

export type TableColumnDefinition = {
  propertyKey: string | symbol,
  columnName: string,
  typeConverter: (value: string) => any
};

export function tableColumn(columnName: string): PropertyDecorator {
  return (target: Object, propertyKey: string | symbol): void => {
    const existingColumns: TableColumnDefinition[] = Reflect.getMetadata(tableColumnMetadataKey, target) || [];
    const propertyType = Reflect.getMetadata("design:type", target, propertyKey);

    existingColumns.push({
      propertyKey,
      columnName,
      typeConverter: (value: string) => {
        switch (propertyType) {
          case String:
            return value;
          case Number:
            return Number(value);
          case Boolean:
            return Boolean(value);
          default:
            return value;
        }
      }
    });

    Reflect.defineMetadata(tableColumnMetadataKey, existingColumns, target);
  };
}

export function getTableColumns(target: object): TableColumnDefinition[] {
  return Reflect.getMetadata(tableColumnMetadataKey, target) || [];
}

export class Row<T> {
  constructor(public data: T) { }
}

export class Table<T> implements Scrapeable {
  public url: string;
  public childUrls: Set<string> = new Set();

  constructor(url: string, public rows: Row<T>[] = []) {
    this.url = url;
  }

  public addRow(row: Row<T>) {
    this.rows.push(row);
  }
}

export class TableScraper<T extends object> extends TraverseScraper<Table<T>> {
  constructor(baseUrl: string, private readonly factory: () => T) {
    super(baseUrl);
  }

  public getScrapeCallback(): ScrapeCallback<Table<T>> {
    return (response: Response, content: string): Table<T>[] => {
      const results: Table<T>[] = [];
      const $ = cheerio.load(content);
      const tables = $('table');

      for (const table of tables) {
        const tableResult = this.fromTableElement($, table);

        if (tableResult)
          results.push(tableResult);
      }

      return results;
    };
  }

  private fromTableElement($: cheerio.CheerioAPI, tableElement: cheerio.Element): Table<T> | null {
    const tableResult = new Table<T>(this.baseUrl);
    let headingRows = $(tableElement).find('thead > tr');
    let shouldTrimHeadings = false;

    if (headingRows.length === 0) {
      headingRows = $(tableElement).find('tbody > tr:first-child');
      shouldTrimHeadings = true;
    }

    let headings : cheerio.Element[] | undefined;

    if (headingRows.length > 0)
      headings = $(headingRows[0]).find('th').toArray();

    if (!headings || headings.length === 0)
      throw new Error('No headings found in table');

    let rows = $(tableElement).find('tbody > tr').toArray();

    if (rows.length === 0)
      rows = $(tableElement).find('tr').toArray();

    if (shouldTrimHeadings)
      rows = rows.slice(headingRows.length);

    let isEmpty = true;

    for (const row of rows) {
      const rowResult = this.fromRowElement($, row, headings);

      if (rowResult === null)
        continue;

      tableResult.addRow(rowResult);
      isEmpty = false;
    }

    if (isEmpty)
      return null;

    return tableResult;
  }

  private fromRowElement($: cheerio.CheerioAPI, rowElement: cheerio.Element, headings: cheerio.Element[]): Row<T> | null {
    const cells = $(rowElement).find('td').toArray();
    const rowResult = this.factory();
    const allTableColumns = getTableColumns(rowResult);
    let isEmpty = true;

    for (let i = 0; i < cells.length; i++) {
      const cell = cells[i];
      const heading = headings[i];

      if (!heading)
        continue;

      const headingText = $(heading).text();

      if (!headingText)
        continue;

      let tableColumnDefinition = allTableColumns.find(column => column.columnName === headingText);

      if (!tableColumnDefinition) {
        const properties = Object.getOwnPropertyNames(rowResult);
        const propertyKey = properties.find(property => property.toLowerCase() === headingText.toLowerCase());

        if (!propertyKey)
          continue;

        tableColumnDefinition = {
          propertyKey,
          columnName: headingText,
          typeConverter: (value: string) => value
        };
      }

      const cellText = $(cell).text();

      if (!cellText)
        continue;

      (rowResult as any)[tableColumnDefinition.propertyKey] = tableColumnDefinition.typeConverter(cellText);
      isEmpty = false;
    }

    if (isEmpty)
      return null;

    return new Row<T>(rowResult);
  }
}
