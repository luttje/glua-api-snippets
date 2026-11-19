import { WikiHistoryPageScraper } from '../scrapers/wiki-history-scraper.js';
import { scrapeAndCollect } from '../scrapers/collector.js';
import { promisify } from 'util';
import path from 'path';
import fs from 'fs';

export const metadataFilename = '__metadata.json';
export const metadataEncoding = 'utf8';

export type Metadata = {
  lastUpdate: Date;
}

export async function writeMetadata(url: string, outputDirectory: string): Promise<Metadata> {
  const results = await scrapeAndCollect(new WikiHistoryPageScraper(url + '/~recentchanges'));
  const exists = promisify(fs.exists);
  const lastUpdate = results[0].history[0].dateTime;

  if (!(await exists(outputDirectory)))
    fs.mkdirSync(outputDirectory, { recursive: true });

  const write = await promisify(fs.writeFileSync);

  const metadataPath = path.join(outputDirectory, metadataFilename);
  const metadata: Metadata = { lastUpdate };

  write(metadataPath, JSON.stringify(metadata, null, 2), metadataEncoding);

  return metadata;
}

export async function readMetadata(outputDirectory: string): Promise<Metadata | undefined> {
  const metadataPath = path.join(outputDirectory, metadataFilename);
  const exists = promisify(fs.exists);

  if (!(await exists(metadataPath)))
    return undefined;

  const read = promisify(fs.readFile);
  const metadata = JSON.parse(await read(metadataPath, metadataEncoding));

  return {
    lastUpdate: new Date(metadata.lastUpdate)
  };
}
