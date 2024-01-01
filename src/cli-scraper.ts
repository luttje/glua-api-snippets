import { Command } from 'commander';
import { convertWindowsToUnixPath, dateToFilename, saveFile, unzipFiles, walk } from './utils/filesystem.js';
import { GluaApiWriter } from './api-writer/glua-api-writer.js';
import { RequestInitWithRetry } from 'fetch-retry';
import { scrapeAndCollect } from './scrapers/collector.js';
import { WikiHistoryPageScraper } from './scrapers/wiki-history-scraper.js';
import { WikiPageListScraper } from './scrapers/wiki-page-list-scraper.js';
import { WikiPageMarkupScraper } from './scrapers/wiki-page-markup-scraper.js';
import { writeMetadata } from './utils/metadata.js';
import fs from 'fs';
import packageJson from '../package.json' assert { type: "json" };
import path from 'path';

async function startScrape() {
  const program = new Command();

  program
    .version(packageJson.version)
    .description('Scrapes the Garry\'s Mod wiki for API information')
    .option('-o, --output <path>', 'The path to the directory where the output json and lua files should be saved', './output')
    .option('-c, --customOverrides [path]', 'The path to a directory containing custom overrides for the API')
    .option('-w, --wipe', 'Clean the output directory before scraping', false)
    .option('-t, --update-changed-by-tag <last-tag|false>', 'Use the provided last git tag to only update pages that have changed since the last scrape', false)
    .parse(process.argv);

  const options = program.opts();
  const baseDirectory = options.output.replace(/\/$/, '');
  const customDirectory = options.customOverrides?.replace(/\/$/, '') ?? null;
  const baseUrl = 'https://wiki.facepunch.com/gmod';
  const writer = new GluaApiWriter();

  if (options.wipe && fs.existsSync(baseDirectory))
    fs.rmSync(baseDirectory, { recursive: true });

  if (!fs.existsSync(baseDirectory))
    fs.mkdirSync(baseDirectory, { recursive: true });

  if (customDirectory !== null && !fs.existsSync(customDirectory)) {
    console.error(`Custom overrides directory ${customDirectory} does not exist`);
    process.exit(1);
  }

  function writeLuaFile(moduleName: string, pageMarkups: any[]) {
    const api = writer.writePages(pageMarkups);

    const moduleFile = path.join(baseDirectory, moduleName);

    if (!fs.existsSync(`${moduleFile}.lua`))
      fs.writeFileSync(`${moduleFile}.lua`, '---@meta\n\n');

    fs.appendFileSync(`${moduleFile}.lua`, api);
  }

  // If the update-changed-by-tag option is set, download that the json for that tag from the github releases as our starting point
  if (options.updateChangedByTag && options.updateChangedByTag !== 'false') {
    const url = `https://api.github.com/repos/luttje/glua-api-snippets/releases/tags/${options.updateChangedByTag}`;
    const response = await fetch(url);
    const json = await response.json();
    const asset = json.assets.find((asset: any) => asset.name === `${options.updateChangedByTag}.json.zip`);

    if (!asset) {
      console.error(`No asset found for tag ${options.updateChangedByTag}`);
      process.exit(1);
    }

    const zipUrl = asset.browser_download_url;
    const zipResponse = await fetch(zipUrl);

    if (!zipResponse.ok || zipResponse.body === null) {
      console.error(`Failed to download zip file from ${zipUrl}`);
      process.exit(1);
    }

    const zipFile = path.join(baseDirectory, `${options.updateChangedByTag}.json.zip`);
    await saveFile(zipFile, zipResponse.body);
    await unzipFiles(zipFile, baseDirectory);
    fs.rmSync(zipFile);
    const files = walk(baseDirectory);

    // Unzip the starting files so we can use them as a starting point
    for (const file of files) {
      const fileStat = fs.statSync(file);

      if (fileStat.isDirectory()) {
        console.warn(`Skipping directory ${file} in custom (not supported)`);
        continue;
      }

      if (!file.endsWith('.json') || file.endsWith('__metadata.json'))
        continue;

      const fileContent = fs.readFileSync(file, { encoding: 'utf-8' });
      let fileName = convertWindowsToUnixPath(file)
        .replace(convertWindowsToUnixPath(baseDirectory + '/')
          .replace(/^\.\//, ''),
          ''
        )
        .replace(/\.json$/, '');
      let moduleName = fileName;

      [moduleName, fileName] = fileName.split(/[:.\/]/, 2);

      const pageMarkups = JSON.parse(fileContent);
      writeLuaFile(moduleName, pageMarkups);
    }
  }

  writeMetadata(baseUrl, baseDirectory);

  // Copy all files from the custom directory to the output directory.
  // This allows us to override the output of the scraper with custom (hard-coded) files.
  if (customDirectory !== null) {
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

  let pageAddresses: string[] = [];

  // If the update-changed-by-tag option is not set (or its false), scrape all pages on the wiki
  if (!options.updateChangedByTag || options.updateChangedByTag === 'false') {
    const pageListScraper = new WikiPageListScraper(`${baseUrl}/~pagelist?format=json`);
    const retryOptions: RequestInitWithRetry = {
      retries: 5,
      retryDelay: function (attempt, error, response): number {
        return Math.pow(2, attempt) * 500; // 500, 1000, 2000, 4000, 8000
      }
    };
    pageListScraper.setRetryOptions(retryOptions);

    const pageIndexes = await scrapeAndCollect(pageListScraper);

    pageAddresses = pageIndexes.map((pageIndex) => {
      return pageIndex.address;
    });
  } else {
    // Go through all history pages and add them to the list of pages to be scraped.
    // Stop when we reach a page that has already been scraped.
    const historyResult = (await scrapeAndCollect(new WikiHistoryPageScraper(`${baseUrl}/~recentchanges`)))[0];
    pageAddresses = [];

    for (const history of historyResult.history) {
      const tagName = dateToFilename(history.dateTime);

      if (options.updateChangedByTag === tagName)
        break;

      const address = history.url.replace(/^\/gmod\//, '');
      pageAddresses.push(address);
    }
  }

  for (const pageAddress of pageAddresses) {
    const pageMarkupScraper = new WikiPageMarkupScraper(`${baseUrl}/${pageAddress}?format=text`);

    pageMarkupScraper.on('scraped', (url, pageMarkups) => {
      if (pageMarkups.length === 0)
        return;

      let fileName = pageAddress;
      let moduleName = fileName;

      if (fileName.includes('.') || fileName.includes(':') || fileName.includes('/')) {
        [moduleName, fileName] = fileName.split(/[:.\/]/, 2);
      }

      // Make sure modules like Entity and ENTITY are placed in the same file.
      moduleName = moduleName.toLowerCase();
      fileName = fileName.replace(/[^a-z0-9]/gi, '_').toLowerCase();

      writeLuaFile(moduleName, pageMarkups);

      const moduleFile = path.join(baseDirectory, moduleName);

      if (!fs.existsSync(moduleFile))
        fs.mkdirSync(moduleFile, { recursive: true });

      // Store JSON data so it can be used later to regenerate the lua files
      const json = JSON.stringify(pageMarkups, null, 2);
      fs.writeFileSync(path.join(moduleFile, `${fileName}.json`), json);
    });

    await pageMarkupScraper.scrape();
  }

  console.log(`Done with scraping! You can find the output in ${baseDirectory}`);
}

startScrape().catch((err) => {
  console.error(err);
  process.exit(1);
});
