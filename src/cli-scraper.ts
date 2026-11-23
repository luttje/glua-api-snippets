import { WikiPageMarkupScraper, isLibrary, isClass } from './scrapers/wiki-page-markup-scraper.js';
import { WikiPageListScraper } from './scrapers/wiki-page-list-scraper.js';
import packageJson from '../package.json' with { type: "json" };
import { GluaApiWriter } from './api-writer/glua-api-writer.js';
import { loadCustomOverrides, writeScrapedPages } from './api-writer/scrape-output.js';
import { scrapeAndCollect } from './scrapers/collector.js';
import { writeMetadata } from './utils/metadata.js';
import type { RetryOptions } from './scrapers/scraper.js';
import { Command } from 'commander';
import fs from 'fs';

async function startScrape() {
  const program = new Command();

  program
    .version(packageJson.version)
    .description('Scrapes the Garry\'s Mod wiki for API information')
    .option('-o, --output <path>', 'The path to the directory where the output json and lua files should be saved', './output')
    .option('-u, --url <url>', 'The pagelist URL of the Garry\'s Mod wiki that holds all pages to scrape', 'https://wiki.facepunch.com/gmod/')
    .option('-c, --customOverrides [path]', 'The path to a directory containing custom overrides for the API')
    .option('-w, --wipe', 'Clean the output directory before scraping', false)
    .parse(process.argv);

  const options = program.opts();

  if (!options.url) {
    console.error('No URL provided');
    process.exit(1);
  }

  const baseDirectory = options.output.replace(/\/$/, '');
  const customDirectory = options.customOverrides?.replace(/\/$/, '') ?? null;
  const baseUrl = options.url.replace(/\/$/, '');
  const pageListScraper = new WikiPageListScraper(`${baseUrl}/~pagelist?format=json`);
  const writer = new GluaApiWriter(baseDirectory);

  const retryOptions: RetryOptions = {
    retries: 5,
    retryDelay: function (attempt, error, response) {
      return Math.pow(2, attempt) * 500; // 500, 1000, 2000, 4000, 8000
    }
  }

  pageListScraper.setRetryOptions(retryOptions);

  writeMetadata(baseUrl, baseDirectory);

  if (options.wipe && fs.existsSync(baseDirectory))
    fs.rmSync(baseDirectory, { recursive: true });

  if (!fs.existsSync(baseDirectory))
    fs.mkdirSync(baseDirectory, { recursive: true });

  if (customDirectory !== null) {
    if (!fs.existsSync(customDirectory)) {
      console.error(`Custom overrides directory ${customDirectory} does not exist`);
      process.exit(1);
    }

    loadCustomOverrides(writer, customDirectory);
  }

  console.log('Collecting all pages...');
  let collect_start = performance.now();

  const pageIndexes = await scrapeAndCollect(pageListScraper);

  console.log(`Took ${Math.floor((performance.now() - collect_start) / 100) / 10}s!\n`);

  console.log('Scraping all pages...');
  let scrape_start = performance.now();

  let cur = 0;
  let queue: Promise<any>[] = [];
  for (const pageIndex of pageIndexes) {
    const pageMarkupScraper = new WikiPageMarkupScraper(`${baseUrl}/${pageIndex.address}?format=text`);

    const indexForThis = cur++;
    pageMarkupScraper.on('scraped', (url, pageMarkups) => {
      if (pageMarkups.length === 0)
        return;

      writeScrapedPages(writer, pageIndex.address, pageMarkups, indexForThis);
    });

    queue.push(pageMarkupScraper.scrape());

    if (queue.length > 20) {
      const results = await Promise.allSettled(queue);
      for (const result of results) {
        if (result.status === "rejected") console.warn("Failed to scrape a page!", result.reason);
      }
      queue = [];
    }
  }

  // Await any after the loop exits
  const results = await Promise.allSettled(queue);
  for (const result of results) {
    if (result.status === "rejected") console.warn("Failed to scrape a page!", result.reason);
  }

  console.log(`Took ${Math.floor((performance.now() - scrape_start) / 100) / 10}s!`);

  writer.writeToDisk();

  console.log(`Done with scraping! You can find the output in ${baseDirectory}`);
}

startScrape().catch((err) => {
  console.error(err);
  process.exit(1);
});
