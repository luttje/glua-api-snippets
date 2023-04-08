import { html as html } from '../utils/offline-sites/gmod-wiki/recent-changes';
import fetchMock from "jest-fetch-mock";
import { WikiHistoryPage, WikiHistoryPageScraper } from '../../src/scrapers/wiki-history-scraper';

describe('GMod Wiki History Page Parse', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a hooks page', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/~recentchanges';
    
    fetchMock.mockResponseOnce(html, { url: baseUrl });

    const scraper = new WikiHistoryPageScraper(baseUrl);
    const results: WikiHistoryPage[] = [];

    scraper.on('scraped', (url: string, pages: WikiHistoryPage[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

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