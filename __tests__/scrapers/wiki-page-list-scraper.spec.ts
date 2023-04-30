import { WikiPageListScraper } from '../../src/scrapers/wiki-page-list-scraper';
import { WikiPage } from '../../src/scrapers/wiki-page-markup-scraper';
import { markup, json as hookJson } from '../test-data/offline-sites/gmod-wiki/hook-player-initial-spawn';
import fetchMock from "jest-fetch-mock";

describe('WikiPageListScraper', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a pagelist json', async () => {
    const json = `[{"address":"GM:PlayerInitialSpawn","updateCount":18,"viewCount":83810}]`;

    fetchMock.mockResponseOnce(json);
    fetchMock.mockResponseOnce(markup);

    const scrapeCallback = new WikiPageListScraper("https://wiki.facepunch.com/gmod/~pagelist?format=json");

    return new Promise((resolve, reject) => {
      scrapeCallback.on('scraped', (url: string, pages: WikiPage[]) => {
        expect(pages).toEqual([<WikiPage>hookJson]);

        resolve(true);
      });
    
      scrapeCallback.scrape();
    });
  });
});