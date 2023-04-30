import { ScrapeCallback, Scraper } from './scraper.js';

export class JsonScraper<T extends object = object> extends Scraper<T> {
  /**
   * @param response The response from the page
   * @param content The content of the request
   * 
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<T> {
    return (response: Response, content: string): T[] => {
      return JSON.parse(content);
    };
  }
}