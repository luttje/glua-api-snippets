import { html } from '../test-data/offline-sites/webscraper.io-tables';
import { TableScraper } from '../../src/scrapers/table-scraper';
import { scrapeAndCollect } from '../../src/scrapers/collector';
import { expectedTables } from '../test-data/test-tables';
import { Person } from '../test-data/Person';
import fetchMock from "jest-fetch-mock";

describe('TableScraper', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should scrape table data as the specified type', async () => {
    fetchMock.mockResponseOnce(html);

    const scraper = new TableScraper<Person>('https://webscraper.io/test-sites/tables', () => new Person());
    const results = await scrapeAndCollect(scraper);

    expect(results).toEqual(expectedTables);
  });
});
