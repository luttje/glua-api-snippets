import { Table, TableScraper } from '../../src/scrapers/table-scraper';
import { Page, PageScraper } from '../../src/scrapers/page-scraper';
import { Scrapeable, Scraper } from '../../src/scrapers/scraper';
import { html } from '../utils/offline-sites/webscraper.io-tables';
import { scrapeAndCollect } from '../../src/scrapers/collector';
import { expectedTables } from '../utils/test-tables';
import { Person } from '../utils/Person';
import fetchMock from "jest-fetch-mock";

class PageWithTables<T> implements Scrapeable {
  public childUrls: Set<string> = new Set();

  constructor(
    public url: string,
    public page: Page,
    public tables: Table<T>[] = []
  ) { }
}

class Simple implements Scrapeable {
  public childUrls: Set<string> = new Set();
  
  constructor(
    public content: string = 'test'
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
    const scraper = new Scraper<PageWithTables<Person>>(baseUrl, (response: Response, html: string) => {
      const tableScraperCallback = new TableScraper<Person>(baseUrl, () => new Person()).getScrapeCallback();
      const pageScraperCallback = new PageScraper(baseUrl).getScrapeCallback();

      const tables = tableScraperCallback(response, html);
      const pages = pageScraperCallback(response, html);

      return pages.map(page => new PageWithTables<Person>(baseUrl, page, tables));
    });

    const results = await scrapeAndCollect(scraper);

    expect(results.length).toBe(1);
    expect(results[0].tables).toEqual(expectedTables);

    // Check the page heading is scraped correctly
    expect(results[0].page.title).toBe('Web Scraper Test Sites');
  });

  it('should retry on failure', async () => {
    const baseUrl = 'https://test.example';
    const html = '<html><body><h1>Test</h1></body></html>';
    
    // Simply try 3 times in total with an exponential backoff delay between each attempt starting with 100ms
    fetchMock.mockResponses(
      (req) => Promise.reject(new Error('Failed to fetch')),
      (req) => Promise.reject(new Error('Failed to fetch')),
      (req) => Promise.resolve({
        body: html,
        status: 200,
      })
    );
    
    const scraper = new Scraper<Simple>(baseUrl, (response: Response, html: string) => [new Simple(html)]);
    scraper.setRetryOptions({
      retries: 2,
      retryDelay: function(attempt, error, response) {
        return Math.pow(2, attempt) * 100;
      }
    });
    const results = await scrapeAndCollect(scraper);

    expect(results.length).toBe(1);
    expect(results[0].content).toBe(html);
  });
});