import { Scraper, ScrapeCallback } from './scraper.js';

export interface Scrapeable {
  childUrls: Set<string>;
}

export class TraverseScraper<T extends Scrapeable> extends Scraper<T> {
  protected readonly traversedUrls: Set<string> = new Set();
  protected childPageFilter?: (url: string) => boolean;

  public setChildPageFilter(filter: (url: string) => boolean): void {
    this.childPageFilter = filter;
  }

  /**
   * Override scraping so we traverse all child URLs of the first scraped page
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

  public async traverse(url: string, callback?: ScrapeCallback<T>): Promise<void> {
    if (!callback)
      callback = this.getScrapeCallback();

    const urlsToTraverse: string[] = [url];

    while (urlsToTraverse.length > 0) {
      let currentUrl = urlsToTraverse.shift()!;
      let url = this.getTraverseUrl(currentUrl);

      if (!url)
        continue;

      const currentResults = await this.visitOne(url, callback);

      this.traversedUrls.add(url);

      for (const result of currentResults) {
        for (const childUrl of result.childUrls) {
          const traverseUrl = this.getTraverseUrl(childUrl);

          if (traverseUrl && !urlsToTraverse.includes(traverseUrl))
            urlsToTraverse.push(traverseUrl);
        }
      }
    }
  }
}
