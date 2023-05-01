import { TypedEventEmitter } from '../utils/typed-event-emitter.js';
import { RequestInitWithRetry } from 'fetch-retry';
import fetchRetry from 'fetch-retry';

const fetch = fetchRetry(global.fetch);

export type ScrapeCallback<T> = (response: Response, content: string) => T[] | Promise<T[]>;

export type ScrapeResult = object;

export type ScraperEvents<T> = {
  beforescrape: [url: string];
  scraped: [url: string, results: T[]];
}

export class Scraper<T extends ScrapeResult> extends TypedEventEmitter<ScraperEvents<T>> {
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

  public setRetryOptions(options: RequestInitWithRetry): void {
    this.retryOptions = options;
  }

  /**
   * Scrapes the base url and has the callback process the response
   */
  public async scrape(): Promise<void> {
    const callback = this.getScrapeCallback();

    await this.visitOne(this.baseUrl, callback);
  }

  public async visitOne(url: string, callback?: ScrapeCallback<T>): Promise<T[]> {
    if (!callback)
      callback = this.getScrapeCallback();

    if (!!process.env.VERBOSE_LOGGING)
      console.debug(`Scraping ${url}...`);
  
    this.emit('beforescrape', url);

    let response;
    let content;

    try {
      response = await fetch(url, this.retryOptions);
      content = await response.text();
    } catch (e) {
      console.warn(`Error fetching ${url}: ${e}`);
      return [];
    }

    const scrapedResults = await callback(response, content);

    this.emit('scraped', url, scrapedResults);

    return scrapedResults;
  }
}
