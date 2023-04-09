import { Page, PageScraper } from './page-scraper.js';
import { ScrapeCallback } from './scraper.js';
import { JSDOM } from 'jsdom';

export interface WikiHistory {
  dateTime: Date;
  change: string;
  user: string;
  url: string;
}

export class WikiHistoryPage extends Page {
  public history: WikiHistory[] = [];

  constructor(url: string, title: string) {
    super(url, title);
  }
}

export class WikiHistoryPageScraper extends PageScraper<WikiHistoryPage> {
  constructor(baseUrl: string) {
    super(baseUrl, (url: string, title: string) => new WikiHistoryPage(url, title));
  }

  /**
   * Scrapes a wiki history page for information on wiki changes
   * 
   * @param response The response from the page
   * @param html The HTML content of the request
   * 
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<WikiHistoryPage> {
    const baseScrapeCallback = super.getScrapeCallback();

    return (response: Response, html: string): WikiHistoryPage[] => {
      const pages = baseScrapeCallback(response, html);

      if (pages.length === 0)
        return [];
      
      // There is only one page per response
      const page = pages[0];

      const dom = new JSDOM(html);
      const changeElements = dom.window.document.querySelectorAll('table.changelist > tbody > .entry');

      if (!changeElements)
        return [page];
      
      for (const changeElement of changeElements) {
        const pageLinkElement = changeElement.querySelector('.address') as HTMLElement;
        const pageLinkAnchorElement = pageLinkElement.querySelector('a') as HTMLAnchorElement;
        const user = changeElement.querySelector('.user a')?.textContent || '';
        const dateTime = new Date(pageLinkAnchorElement.title);
        const url = pageLinkAnchorElement.href;
        const change = pageLinkElement.textContent?.replace(pageLinkAnchorElement.textContent || '', '').replace(/\s+/g, ' ') || '';

        page.history.push({
          dateTime,
          user,
          change,
          url
        });
      }

      return [ page ];
    };
  }
}
