import { WikiHistoryPageScraper } from '../../src/scrapers/wiki-history-scraper';
import { html } from '../test-data/offline-sites/gmod-wiki/recent-changes';
import { scrapeAndCollect } from '../../src/scrapers/collector';
import fetchMock from "jest-fetch-mock";

describe('GMod Wiki History Page Parse', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a hooks page', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/~recentchanges';

    fetchMock.mockResponseOnce(html, { url: baseUrl });

    const scraper = new WikiHistoryPageScraper(baseUrl);
    const results = await scrapeAndCollect(scraper);

    expect(results.length).toEqual(1);
    expect(results[0].url).toEqual(baseUrl);
    expect(results[0].title).toEqual("Recent Changes - Garry's Mod Wiki");

    for (const item of results[0].history) {
      expect(item.dateTime).toBeTruthy();
      expect(item.change).not.toBeUndefined();
      expect(item.user).toBeTruthy();
      expect(item.url).toBeTruthy();
    }
  });
});
