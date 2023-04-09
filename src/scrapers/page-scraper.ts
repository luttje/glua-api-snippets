import { decodeEntities } from './decode-entities.js';
import { ScrapeCallback, Scrapeable, Scraper } from './scraper.js';

export class Page implements Scrapeable {
  public url: string;
  public title: string;
  public childUrls: string[] = [];

  constructor(url: string, title: string) {
    this.url = url;
    this.title = title;
  }
}

export class PageScraper<T extends Page = Page> extends Scraper<T> {
  private readonly factory: (url: string, title: string) => T;

  constructor(baseUrl: string, factory?: (url: string, title: string) => T) {
    super(baseUrl);

    this.factory = factory ?? ((url: string, title: string) => new Page(url, title) as T);
  }

  /**
   * Scrapes a page for its URL and title, and returns a list of child URLs
   * 
   * @param response The response from the page
   * @param html The HTML content of the request
   * 
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<T> {
    return (response: Response, html: string): T[] => {
      const results: T[] = [];

      const url = response.url;
      const title = decodeEntities(html.match(/<title>(.*?)<\/title>/)?.[1] || '');
      const page = this.factory(url, title);
      const links = html.match(/<a\s+(?:[^>]*?\s+)?href=(["'])([\s\S]*?)\1(?:[^>]*?\s+)?>(?:[\s\S]*?<\/a>)?/gi)
        ?.map(link => link.replace(/\n/g, ''))
        ?.map(link => link.match(/href=(["'])([\s\S]*?)\1/i)?.[2] || '') || [];

      for (let link of links) {
        link = decodeEntities(link);
        let absoluteUrl = link.startsWith('http') ? link : new URL(link, url).toString();

        if (page.childUrls.includes(absoluteUrl))
          continue;
        
        if (this.childPageFilter && !this.childPageFilter(absoluteUrl))
          continue;
    
        page.childUrls.push(absoluteUrl);
      }

      results.push(page);

      return results;
    };
  }
}