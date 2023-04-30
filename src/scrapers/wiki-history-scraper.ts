import { Page, PageTraverseScraper } from './page-traverse-scraper.js';
import { ScrapeCallback } from './scraper.js';
import * as cheerio from 'cheerio';

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

export class WikiHistoryPageScraper extends PageTraverseScraper<WikiHistoryPage> {
  constructor(baseUrl: string) {
    super(baseUrl, (url: string, title: string) => new WikiHistoryPage(url, title));
  }

  /**
   * Scrapes a wiki history page for information on wiki changes
   * 
   * @param response The response from the page
   * @param content The content of the request
   * 
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<WikiHistoryPage> {
    const baseScrapeCallback = super.getScrapeCallback();

    return async (response: Response, content: string): Promise<WikiHistoryPage[]> => {
      const pages = await baseScrapeCallback(response, content);

      if (pages.length === 0)
        return [];
      
      // There is only one page per response
      const page = pages[0];

      const $ = cheerio.load(content);
      const changeElements = $('table.changelist > tbody > .entry');

      if (!changeElements)
        return [page];
      
      for (const changeElement of changeElements) {
        const pageLinkElement = $(changeElement).find('.address');
        const pageLinkAnchorElement = pageLinkElement.find('a');
        const user = $(changeElement).find('.user a').text();
        const dateTime = new Date(pageLinkAnchorElement.attr('title') || '');
        const url = pageLinkAnchorElement.attr('href') || '';
        const change = $(pageLinkElement).text().replace($(pageLinkAnchorElement).text(), '').replace(/\s+/g, ' ');

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
