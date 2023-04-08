import { Table, TableScraper } from '../../src/scrapers/table-scraper';
import { html } from '../utils/offline-sites/webscraper.io-tables';
import { expectedTables } from '../utils/test-tables';
import { Person } from '../utils/Person';
import fetchMock from "jest-fetch-mock";

describe('TableScraper', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should scrape table data as the specified type', async () => {
    fetchMock.mockResponseOnce(html);

    const scraper = new TableScraper<Person>('https://webscraper.io/test-sites/tables', () => new Person());
    const results: Table<Person>[] = [];
    
    scraper.on('scraped', (url: string, tables: Table<Person>[]) => {
      results.push(...tables);
    });
    
    await scraper.scrape();

    expect(results).toEqual(expectedTables);
  });
});
