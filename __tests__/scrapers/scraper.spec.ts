import { Page, PageTraverseScraper } from '../../src/scrapers/page-traverse-scraper';
import { Table, TableScraper } from '../../src/scrapers/table-scraper';
import { html } from '../test-data/offline-sites/webscraper.io-tables';
import { Scrapeable } from '../../src/scrapers/traverse-scraper';
import { scrapeAndCollect } from '../../src/scrapers/collector';
import { Scraper } from '../../src/scrapers/scraper';
import { expectedTables } from '../test-data/test-tables';
import { Person } from '../test-data/Person';
import fetchMock from "jest-fetch-mock";
import { jest } from '@jest/globals';

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
    
    // Combines the functionality of TableScraper and PageTraverseScraper
    const scraper = new Scraper<PageWithTables<Person>>(baseUrl, async (response: Response, html: string) => {
      const tableScraperCallback = new TableScraper<Person>(baseUrl, () => new Person()).getScrapeCallback();
      const pageScraperCallback = new PageTraverseScraper(baseUrl).getScrapeCallback();

      const tables = await tableScraperCallback(response, html);
      const pages = await pageScraperCallback(response, html);

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
  
  it('should simply get no results if we fail to fetch the page', async () => {
    const baseUrl = 'https://test.example';
    const error = new Error('Failed to fetch');
    
    fetchMock.mockReject(error);
    
    const scraper = new Scraper<Simple>(baseUrl, (response: Response, html: string) => [new Simple(html)]);

    const disabledWarning = console.warn;
    console.warn = jest.fn();

    const results = await scrapeAndCollect(scraper);

    expect(console.warn).toBeCalledWith(`Error fetching ${baseUrl}: ${error}`);

    console.warn = disabledWarning;

    expect(results.length).toBe(0);
  });
});