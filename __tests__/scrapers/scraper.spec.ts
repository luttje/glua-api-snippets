import { Table, TableScraper } from '../../src/scrapers/table-scraper';
import { Page, PageScraper } from '../../src/scrapers/page-scraper';
import { Scrapeable, Scraper } from '../../src/scrapers/scraper';
import { html } from '../utils/offline-sites/webscraper.io-tables';
import { expectedTables } from '../utils/test-tables';
import { Person } from '../utils/Person';
import fetchMock from "jest-fetch-mock";
import { JSDOM } from 'jsdom';

class PageWithTables<T> implements Scrapeable {
  public childUrls: string[] = [];

  constructor(
    public url: string,
    public page: Page,
    public tables: Table<T>[] = []
  ) { }
}

describe('Scraper', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('can provide a scraper callback directly', async () => {
    const baseUrl = 'https://webscraper.io/test-sites/tables';
    
    fetchMock.mockResponseOnce(html, {
      url: baseUrl,
    });
    
    // Combines the functionality of TableScraper and PageScraper
    const scraper = new Scraper<PageWithTables<Person>>(baseUrl, (response: Response, dom: JSDOM) => {
      const tableScraperCallback = new TableScraper<Person>(baseUrl, () => new Person()).getScrapeCallback();
      const pageScraperCallback = new PageScraper(baseUrl).getScrapeCallback();

      const tables = tableScraperCallback(response, dom);
      const pages = pageScraperCallback(response, dom);

      return pages.map(page => new PageWithTables<Person>(baseUrl, page, tables));
    });

    const results: PageWithTables<Person>[] = [];

    scraper.on('scraped', (url: string, pages: PageWithTables<Person>[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

    expect(results.length).toBe(1);
    expect(results[0].tables).toEqual(expectedTables);

    // Check the page heading is scraped correctly
    expect(results[0].page.title).toBe('Web Scraper Test Sites');
  });
});