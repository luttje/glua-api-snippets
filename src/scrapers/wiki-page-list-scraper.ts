import { JsonScraper } from './json-scraper.js';

export type WikiPageObject = {
  address: string;
  updateCount: number;
  viewCount: number;
}

export class WikiPageListScraper extends JsonScraper<WikiPageObject> {}
