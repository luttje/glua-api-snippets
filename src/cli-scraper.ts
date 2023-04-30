import { WikiPage, WikiPageScraper, uselessUrls, wikiPageSaveReplacer } from './scrapers/wiki-page-scraper.js';
import packageJson from '../package.json' assert { type: "json" };
import { GluaApiWriter } from './api-writer/glua-api-writer.js';
import { metadataFilename, writeMetadata } from './utils/metadata.js';
import { walk } from './utils/filesystem.js';
import { Command } from 'commander';
import path from 'path';
import fs from 'fs';

async function startScrape() {
  const program = new Command();

  program
    .version(packageJson.version)
    .description('Scrapes the Garry\'s Mod wiki for API information')
    .option('-o, --output <path>', 'The path to the directory where the output json and lua files should be saved', './output')
    .option('-u, --url <url>', 'The pagelist URL of the Garry\'s Mod wiki that holds all pages to scrape', 'https://wiki.facepunch.com/gmod/~pagelist?format=json')
    .option('-f, --force', 'Force the scraper to overwrite existing files', false)
    .parse(process.argv);

  const options = program.opts();

  if (!options.url) {
    console.error('No URL provided');
    process.exit(1);
  }

  const baseDirectory = options.output.replace(/\/$/, '');
  const baseUrl = options.url.replace(/\/$/, '');
  const scraper = new WikiPageScraper(baseUrl);
  const writer = new GluaApiWriter();
  
  scraper.setRetryOptions({
    retries: 5,
    retryDelay: function(attempt, error, response) {
      return Math.pow(2, attempt) * 500; // 500, 1000, 2000, 4000, 8000
    }
  });

  writeMetadata(baseUrl, baseDirectory);

  let existingFiles = new Set<string>(uselessUrls);

  existingFiles.forEach(url => console.debug(`Skipping ${url} (configured to be useless)`));

  if (fs.existsSync(baseDirectory)) {
    if (!options.force) {
      const files = walk(baseDirectory);

      for (const file of files) {
        if (!file.endsWith('.json'))
          continue;
        
        if (file.endsWith(metadataFilename))
          continue;
        
        const json = JSON.parse(fs.readFileSync(file, 'utf8'));

        for (const page of json) {
          existingFiles.add(page.url);
          console.debug(`Skipping ${page.url} (already exists)`);
        }
      }
    }
  }

  scraper.setChildPageFilter(url => {
    // Ignore ~diff, ~user, ~history, ~edit, etc.
    return !url.includes('~') && !existingFiles.has(url);
  });

  if (!fs.existsSync(baseDirectory))
    fs.mkdirSync(baseDirectory, { recursive: true });
  
  scraper.on('scraped', (url, pages) => {
    pages = pages.filter((page: WikiPage) => page.function !== undefined);

    if (pages.length === 0)
      return;

    const api = writer.writePages(pages);
    let fileName = url.substring(baseUrl.length + 1);
    let subDirectory = '';

    if (fileName.includes('.') || fileName.includes(':') || fileName.includes('/')) {
      [subDirectory, fileName] = fileName.split(/[:.\/]/, 2);
      const directory = path.join(baseDirectory, subDirectory);

      if (!fs.existsSync(directory))
        fs.mkdirSync(directory);
    }

    fileName = fileName.replace(/[^a-z0-9]/gi, '_').toLowerCase();

    // Lua API
    fs.writeFileSync(path.join(baseDirectory, subDirectory, `${fileName}.lua`), api);

    // JSON data
    const json = JSON.stringify(pages, wikiPageSaveReplacer, 2);
    fs.writeFileSync(path.join(baseDirectory, subDirectory, `${fileName}.json`), json);
  });

  await scraper.scrape();

  console.log(`Done with scraping! You can find the output in ${baseDirectory}`);
}

startScrape().catch((err) => {
  console.error(err);
  process.exit(1);
});
