import { WikiPageMarkupScraper, WikiPage } from './wiki-page-markup-scraper.js';
import { ScrapeCallback, Scraper } from './scraper.js';
import { JsonScraper } from './json-scraper.js';

export type WikiPageIndexObject = {
  address: string;
  updateCount: number;
  viewCount: number;
}

const markupPageUrlFormat = 'https://wiki.facepunch.com/gmod/%s?format=text';

export class WikiPageListScraper extends Scraper<WikiPage> {
  public getScrapeCallback(): ScrapeCallback<WikiPage> {
    const jsonScraperCallback = new JsonScraper<WikiPageIndexObject>(this.baseUrl).getScrapeCallback();

    return (response: Response, content: string): Promise<WikiPage[]> => new Promise(async (resolve, reject) => {
      const wikiPageIndexes = await jsonScraperCallback(response, content);

      if (!wikiPageIndexes)
        return [];
      
      const pageIndex = wikiPageIndexes[0];
      
      const markupPageUrl = markupPageUrlFormat.replace('%s', pageIndex.address);
      const wikiPageMarkupScraper = new WikiPageMarkupScraper(markupPageUrl);

      wikiPageMarkupScraper.on('scraped', (url, wikiPages) => {
        resolve(wikiPages);
      });

      wikiPageMarkupScraper.scrape();
    });
  }
}
