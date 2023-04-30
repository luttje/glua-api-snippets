import { Page, PageTraverseScraper } from '../../src/scrapers/page-traverse-scraper';
import { html } from '../test-data/offline-sites/lutt.online';
import fetchMock from "jest-fetch-mock";

describe('PageTraverseScraper', () => {
  const baseUrl = 'https://lutt.online';

  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should limit to the base url provided upon instantiation', async () => {
    fetchMock.mockResponseOnce(html, {
      url: baseUrl,
    });

    const scraper = new PageTraverseScraper(baseUrl);
    let hasExternalLink = false;

    scraper.on('scraped', (url: string, pages: Page[]) => {
      const page = pages[0];

      expect(page.url).toMatch(baseUrl);
      
      for (const url of page.childUrls) {
        if (!url.startsWith(baseUrl))
          hasExternalLink = true;
      }
    });
    
    await scraper.scrape();

    // Validate this test is useful by checking that there are indeed external links
    expect(hasExternalLink).toBe(true);
  });

  it('should scrape data as the specified type', async () => {
    fetchMock.mockResponseOnce(html, {
      url: baseUrl,
    });

    const scraper = new PageTraverseScraper(baseUrl);

    scraper.on('scraped', (url: string, pages: Page[]) => {
      const page = pages[0];

      expect(page.title).toBe('Lutt.online');
    });

    await scraper.scrape();
  });

  it('should work with permanent redirects', async () => {
    fetchMock.dontMockOnce();
    
    const scraper = new PageTraverseScraper('https://www.lutt.online'); // Permanent redirect to https://lutt.online
    
    scraper.on('scraped', (url: string, pages: Page[]) => {
      const page = pages[0];
      
      expect(page.url).toMatch('https://lutt.online');
    });

    await scraper.scrape();
  });
  
  it('does not get stuck scraping an infinite loop', async () => {
    const baseUrl = 'https://test.example/';
    const htmlA = `<html><body><h1>Test A</h1><a href="${baseUrl}b">B</a></body></html>`;
    const htmlB = `<html><body><h1>Test B</h1><a href="${baseUrl}">A</a></body></html>`;

    let count = 0;

    fetchMock.mockResponse((req) => {
      count++;
      if (req.url.endsWith('/'))
        return Promise.resolve({
          body: htmlA,
          status: 200,
        });
      else if (req.url.endsWith('/b'))
        return Promise.resolve({
          body: htmlB,
          status: 200,
        });
      else
        return Promise.reject(new Error('Invalid URL'));
    });

    const scraper = new PageTraverseScraper<Page>(baseUrl);
    await scraper.scrape();

    // Check that the scraper doesn't get stuck in an infinite loop
    expect(count).toBe(2);
  });
});
