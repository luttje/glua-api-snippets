import { loadCustomOverrides, writeScrapedPages } from '../../src/api-writer/scrape-output';
import { WikiPageMarkupScraper } from '../../src/scrapers/wiki-page-markup-scraper';
import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import path from 'path';
import fs from 'fs';

/**
 * Builds the library like the scraper would, but from offline wiki markup files.
 * Their names are the URI encoded page addresses, e.g: `GM%3APlayerSay.txt` for `GM:PlayerSay`.
 */
export async function buildLibrary(wikiDirectory: string, customDirectory: string, outputDirectory: string) {
  const writer = new GluaApiWriter(outputDirectory);
  const files = fs.readdirSync(wikiDirectory).filter(file => file.endsWith('.txt'));

  fs.mkdirSync(outputDirectory, { recursive: true });
  loadCustomOverrides(writer, customDirectory);

  for (const [index, file] of files.entries()) {
    const address = decodeURIComponent(file.replace(/\.txt$/, ''));
    const url = `https://wiki.facepunch.com/gmod/${address}?format=text`;
    const markup = fs.readFileSync(path.join(wikiDirectory, file), 'utf-8');
    const pages = await new WikiPageMarkupScraper(url).getScrapeCallback()(<Response>{ url }, markup);

    writeScrapedPages(writer, address, pages, index);
  }

  writer.writeToDisk();
}
