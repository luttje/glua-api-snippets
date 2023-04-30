import { JsonScraper } from '../../src/scrapers/json-scraper';
import fetchMock from "jest-fetch-mock";

type TestObject = {
  test: string;
  complex: {
    inner: string;
    with: {
      nested: number[];
    }
  }
}

describe('JsonScraper', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should deserialize JSON to described type', async () => {
    const json = JSON.stringify([
      {
        test: 'test',
        complex: {
          inner: 'inner',
          with: {
            nested: [1, 2, 3],
          }
        }
      }
    ]);

    fetchMock.mockResponseOnce(json);

    const scraper = new JsonScraper<TestObject>('https://www.whatever.example');

    scraper.on('scraped', (url: string, pages: TestObject[]) => {
      const page = pages[0];

      expect(page.test).toBe('test');
      expect(page.complex.inner).toBe('inner');
      expect(page.complex.with.nested).toEqual([1, 2, 3]);
    });

    await scraper.scrape();
  });
});
