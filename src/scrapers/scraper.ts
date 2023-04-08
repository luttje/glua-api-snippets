import EventEmitter from 'events';
import { JSDOM } from 'jsdom';

export type ScrapeCallback<T> = (response: Response, dom: JSDOM) => T[];

export interface Scrapeable {
  childUrls: string[];
}

export class Scraper<T extends Scrapeable> extends EventEmitter {
  protected readonly traversedUrls: Set<string> = new Set();
  protected childPageFilter?: (url: string) => boolean;

  constructor(
    protected readonly baseUrl: string,
    protected readonly scrapeCallback?: ScrapeCallback<T>
  ) { 
    super();
  }

  public getScrapeCallback(): ScrapeCallback<T> {
    return this.scrapeCallback || ((_: Response, __: JSDOM): T[] => []);
  }

  public setChildPageFilter(filter: (url: string) => boolean): void {
    this.childPageFilter = filter;
  }

  /**
   * Scrapes a page for its URL and title, and returns a list of child URLs
   */
  public async scrape(): Promise<T[]> {
    const callback = this.getScrapeCallback();

    return await this.traverse(this.baseUrl, callback.bind(this));
  }

  /**
   * Scrapes a page for its URL and title, without returning anythings. This is
   * cheaper than scrape() because it doesn't have to return anything.
   * 
   * You can still listen to the 'scraped' event to get the results.
   */
  public async scrapeCheap(): Promise<void> {
    const callback = this.getScrapeCallback();

    await this.traverse(this.baseUrl, callback.bind(this));
  }

  private getTraverseUrl(url: string): string | false {
    if (!url.startsWith(this.baseUrl))
      return false;
    
    if (url.endsWith('/'))
      url = url.substring(0, url.length - 1);
    
    if (url.includes('#'))
      url = url.substring(0, url.indexOf('#'));

    if (this.traversedUrls.has(url))
      return false;
    
    if (this.childPageFilter && !this.childPageFilter(url))
      return false;
    
    return url;
  }

  public async visitOne(url: string, callback: ScrapeCallback<T>): Promise<T[]> {
    const response = await fetch(url);
    const dom = new JSDOM(await response.text());

    return callback(response, dom);
  }

  public async traverse(url: string, callback: ScrapeCallback<T>): Promise<T[]> {
    const results: T[] = [];
    const urlsToTraverse: string[] = [url];

    while (urlsToTraverse.length > 0) {
      let currentUrl = urlsToTraverse.shift()!;
      let url = this.getTraverseUrl(currentUrl);

      if (!url)
        continue;
      
      console.debug(`Scraping ${url}...`);
      
      this.emit('beforescrape', url);
      
      const currentResults = await this.visitOne(url, callback);
      results.push(...currentResults);
      
      this.traversedUrls.add(url);

      for (const result of currentResults) {
        urlsToTraverse.push(...result.childUrls.filter(u => this.getTraverseUrl(u)));
      }

      this.emit('scraped', url, currentResults);
    }

    return results;
  }
}
