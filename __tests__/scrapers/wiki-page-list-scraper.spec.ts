import { WikiPageListScraper, WikiPageIndexObject } from '../../src/scrapers/wiki-page-list-scraper';
import fetchMock from "jest-fetch-mock";

describe('WikiPageListScraper', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a pagelist json', async () => {
    const json = `[{"address":"GM:PlayerInitialSpawn","updateCount":18,"viewCount":83810}]`;

    fetchMock.mockResponseOnce(json);

    const scrapeCallback = new WikiPageListScraper("https://wiki.facepunch.com/gmod/~pagelist?format=json");

    return new Promise((resolve, reject) => {
      scrapeCallback.on('scraped', (url: string, pages: WikiPageIndexObject[]) => {
        expect(pages).toEqual([<WikiPageIndexObject>{
          address: 'GM:PlayerInitialSpawn',
          updateCount: 18,
          viewCount: 83810,
        }]);

        resolve(true);
      });

      scrapeCallback.scrape();
    });
  });
});
