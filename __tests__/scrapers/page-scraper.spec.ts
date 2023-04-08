import { PageScraper } from '../../src/scrapers/page-scraper';
import { html } from '../utils/offline-sites/lutt.online';
import fetchMock from "jest-fetch-mock";

describe('PageScraper', () => {
  const baseUrl = 'https://lutt.online';

  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should limit to the base url provided upon instantiation', async () => {
    fetchMock.mockResponseOnce(html, {
      url: baseUrl,
    });

    const scraper = new PageScraper(baseUrl);
    const results = await scraper.scrape();
    let hasExternalLink = false;

    for (const page of results) {
      expect(page.url).toMatch(baseUrl);
      
      for (const url of page.childUrls) {
        if (!url.startsWith(baseUrl))
          hasExternalLink = true;
      }
    }

    // Validate this test is useful by checking that there are indeed external links
    expect(hasExternalLink).toBe(true);
  });

  it('should scrape data as the specified type', async () => {
    fetchMock.mockResponseOnce(html, {
      url: baseUrl,
    });

    const scraper = new PageScraper(baseUrl);
    const results = await scraper.scrape();

    for (const page of results) {
      expect(page.title).toBe('Lutt.online');
    }
  });

  it('should work with permanent redirects', async () => {
    fetchMock.dontMockOnce();
    
    const scraper = new PageScraper('https://www.lutt.online'); // Permanent redirect to https://lutt.online
    const results = await scraper.scrape();

    for (const page of results) {
      expect(page.url).toMatch('https://lutt.online');
    }
  });
});
