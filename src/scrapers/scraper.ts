import fetchRetry from 'fetch-retry';
import { RequestInitWithRetry } from 'fetch-retry';
import EventEmitter from 'events';

const fetch = fetchRetry(global.fetch);

export type ScrapeCallback<T> = (response: Response, html: string) => T[];

export interface Scrapeable {
  childUrls: Set<string>;
}

export class Scraper<T extends Scrapeable> extends EventEmitter {
  protected readonly traversedUrls: Set<string> = new Set();
  protected childPageFilter?: (url: string) => boolean;
  protected retryOptions: RequestInitWithRetry = {};
    
  constructor(
    protected readonly baseUrl: string,
    protected readonly scrapeCallback?: ScrapeCallback<T>
  ) { 
    super();
  }

  public getScrapeCallback(): ScrapeCallback<T> {
    return this.scrapeCallback || ((_: Response, __: string): T[] => []);
  }

  public setChildPageFilter(filter: (url: string) => boolean): void {
    this.childPageFilter = filter;
  }

  public setRetryOptions(options: RequestInitWithRetry): void {
    this.retryOptions = options;
  }

  /**
   * Scrapes a page for its URL and title, and returns a list of child URLs
   */
  public async scrape(): Promise<void> {
    const callback = this.getScrapeCallback();

    await this.traverse(this.baseUrl, callback.bind(this));
  }

  protected getTraverseUrl(url: string): string | false {
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

  public async visitOne(url: string, callback?: ScrapeCallback<T>): Promise<T[]> {
    if (!callback)
      callback = this.getScrapeCallback();

    try {
      const response = await fetch(url, this.retryOptions);
      const html = await response.text();

      return callback(response, html);
    } catch (e) {
      console.warn(`Error fetching ${url}: ${e}`);
      return [];
    }
  }

  public async traverse(url: string, callback?: ScrapeCallback<T>): Promise<void> {
    if (!callback)
      callback = this.getScrapeCallback();
    
    const urlsToTraverse: string[] = [url];

    while (urlsToTraverse.length > 0) {
      let currentUrl = urlsToTraverse.shift()!;
      let url = this.getTraverseUrl(currentUrl);

      if (!url)
        continue;
      
      if (!!process.env.VERBOSE_LOGGING)
        console.debug(`Scraping ${url}...`);
      
      this.emit('beforescrape', url);
      
      const currentResults = await this.visitOne(url, callback);
      
      this.traversedUrls.add(url);

      for (const result of currentResults) {
        for (const childUrl of result.childUrls) {
          const traverseUrl = this.getTraverseUrl(childUrl);

          if (traverseUrl && !urlsToTraverse.includes(traverseUrl))
            urlsToTraverse.push(traverseUrl);
        }
      }

      this.emit('scraped', url, currentResults);
    }
  }
}
