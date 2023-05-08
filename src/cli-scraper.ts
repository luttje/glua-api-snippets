import { WikiPageMarkupScraper } from './scrapers/wiki-page-markup-scraper.js';
import { WikiPageListScraper } from './scrapers/wiki-page-list-scraper.js';
import packageJson from '../package.json' assert { type: "json" };
import { GluaApiWriter } from './api-writer/glua-api-writer.js';
import { scrapeAndCollect } from './scrapers/collector.js';
import { writeMetadata } from './utils/metadata.js';
import { RequestInitWithRetry } from 'fetch-retry';
import { Command } from 'commander';
import path from 'path';
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
  const writer = new GluaApiWriter();

  const retryOptions: RequestInitWithRetry = {
    retries: 5,
    retryDelay: function(attempt, error, response) {
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

    const files = fs.readdirSync(customDirectory);

    for (const file of files) {
      const filePath = path.join(customDirectory, file);
      const fileStat = fs.statSync(filePath);

      if (fileStat.isDirectory()) {
        console.warn(`Skipping directory ${file} in custom (not supported)`);
        continue;
      }

      // Besides the prefix helping us discern between overrides and files to copy, it also prevents conflicts with the wiki pages (since none of them start with _)
      if (file.startsWith('_')) {
        fs.copyFileSync(filePath, path.join(baseDirectory, file));
        continue;
      }

      const fileContent = fs.readFileSync(filePath, { encoding: 'utf-8' });
      const pageName = file.replace(/\.lua$/, '');
      writer.addOverride(pageName, fileContent);
    }
  }
  
  const pageIndexes = await scrapeAndCollect(pageListScraper);

  for (const pageIndex of pageIndexes) {
    const pageMarkupScraper = new WikiPageMarkupScraper(`${baseUrl}/${pageIndex.address}?format=text`);
    
    pageMarkupScraper.on('scraped', (url, pageMarkups) => {
      if (pageMarkups.length === 0)
        return;
      
      const api = writer.writePages(pageMarkups);

      let fileName = pageIndex.address;
      let moduleName = fileName;

      if (fileName.includes('.') || fileName.includes(':') || fileName.includes('/')) {
        [moduleName, fileName] = fileName.split(/[:.\/]/, 2);
      }

      // Make sure modules like Entity and ENTITY are placed in the same file.
      moduleName = moduleName.toLowerCase();

      const moduleFile = path.join(baseDirectory, moduleName);

      if (!fs.existsSync(`${moduleFile}.lua`))
        fs.writeFileSync(`${moduleFile}.lua`, '---@meta\n\n');
      
      if (!fs.existsSync(moduleFile))
        fs.mkdirSync(moduleFile, { recursive: true });

      fileName = fileName.replace(/[^a-z0-9]/gi, '_').toLowerCase();

      // Lua API
      fs.appendFileSync(path.join(baseDirectory, `${moduleName}.lua`), api);

      // JSON data
      const json = JSON.stringify(pageMarkups, null, 2);
      fs.writeFileSync(path.join(baseDirectory, moduleName, `${fileName}.json`), json);
    });

    await pageMarkupScraper.scrape();
  }

  console.log(`Done with scraping! You can find the output in ${baseDirectory}`);
}

startScrape().catch((err) => {
  console.error(err);
  process.exit(1);
});
