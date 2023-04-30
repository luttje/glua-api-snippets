import { Scrapeable, TraverseScraper } from './traverse-scraper.js';
import { decodeEntities } from './decode-entities.js';
import { ScrapeCallback } from './scraper.js';

export class Page implements Scrapeable {
  public url: string;
  public title: string;
  public childUrls: Set<string> = new Set();

  constructor(url: string, title: string) {
    this.url = url;
    this.title = title;
  }
}

export class PageTraverseScraper<T extends Page = Page> extends TraverseScraper<T> {
  private readonly factory: (url: string, title: string) => T;

  constructor(baseUrl: string, factory?: (url: string, title: string) => T) {
    super(baseUrl);

    this.factory = factory ?? ((url: string, title: string) => new Page(url, title) as T);
  }

  /**
   * Scrapes a page for its URL and title, and returns a list of child URLs
   * 
   * @param response The response from the page
   * @param content The content of the request
   * 
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<T> {
    return (response: Response, content: string): T[] => {
      const results: T[] = [];

      const url = response.url;
      const title = decodeEntities(content.match(/<title>(.*?)<\/title>/)?.[1] || '');
      const page = this.factory(url, title);
      const links = content.match(/<a\s+(?:[^>]*?\s+)?href=(["'])([\s\S]*?)\1(?:[^>]*?\s+)?>(?:[\s\S]*?<\/a>)?/gi)
        ?.map(link => link.replace(/\n/g, ''))
        ?.map(link => link.match(/href=(["'])([\s\S]*?)\1/i)?.[2] || '') || [];

      for (let link of links) {
        link = decodeEntities(link);
        let absoluteUrl = link.startsWith('http') ? link : new URL(link, url).toString();

        if (page.childUrls.has(absoluteUrl))
          continue;
        
        if (this.childPageFilter && !this.childPageFilter(absoluteUrl))
          continue;
    
        page.childUrls.add(absoluteUrl);
      }

      results.push(page);

      return results;
    };
  }
}