import { ScrapeCallback, Scrapeable, Scraper } from './scraper.js';
import { JSDOM } from 'jsdom';

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
   * @param dom The DOM of the page
   * 
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<T> {
    return (response: Response, dom: JSDOM): T[] => {
      const results: T[] = [];

      const url = response.url;
      const title = dom.window.document.title;

      const page = this.factory(url, title);
      
      const links = dom.window.document.querySelectorAll('a');

      for (const link of links) {
        const href = link.getAttribute('href');

        if (!href)
          continue;
        
        let absoluteUrl = href;

        if (!href.startsWith('http'))
        absoluteUrl = new URL(href, url).toString();
        
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