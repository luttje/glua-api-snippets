import { WikiPage, WikiPageScraper, uselessUrls, wikiPageSaveReplacer } from './scrapers/wiki-page-scraper.js';
import packageJson from '../package.json' assert { type: "json" };
import { GluaApiWriter } from './api-writer/glua-api-writer.js';
import { walk } from './file-walker.js';
import { Command } from 'commander';

async function main() {
  const program = new Command();

  program
    .version(packageJson.version)
    .description('Scrapes the Garry\'s Mod wiki for API information')
    .option('-o, --output <path>', 'The path where the output json file should be saved', './output/wiki.json')
    .option('-u, --url <url>', 'The base URL of the Garry\'s Mod wiki to scrape', 'https://wiki.facepunch.com/gmod')
    .option('-f, --force', 'Force the scraper to overwrite existing files', false)
    .parse(process.argv);

  const options = program.opts();

  if (!options.url) {
    console.error('No URL provided');
    process.exit(1);
  }

  const baseDirectory = options.output.replace(/[^\/\\]+$/, '');
  const scraper = new WikiPageScraper(options.url);
  const writer = new GluaApiWriter();
  const fs = await import('fs');
  
  let existingFiles = new Set<string>(uselessUrls);

  existingFiles.forEach(url => console.debug(`Skipping ${url} (configured to be useless)`));

  if (fs.existsSync(baseDirectory)) {
    if (!options.force) {
      const files = walk(baseDirectory);

      for (const file of files) {
        if (!file.endsWith('.json'))
          continue;
        
        const json = JSON.parse(fs.readFileSync(file, 'utf8'));

        for (const page of json) {
          existingFiles.add(page.url);
          console.debug(`Skipping ${page.url} (already exists)`);
        }
      }
    }
  }

  scraper.setChildPageFilter(url => !existingFiles.has(url));

  if (!fs.existsSync(baseDirectory))
    fs.mkdirSync(baseDirectory, { recursive: true });
  
  scraper.on('scraped', (url, pages) => {
    pages = pages.filter((page: WikiPage) => page.function !== undefined);

    if (pages.length === 0)
      return;

    const api = writer.writePages(pages);
    let fileName = url.substring(options.url.length + 1);
    let subDirectory = '';

    // Split at the dot or colon and place in subdirectory
    if (fileName.includes('.') || fileName.includes(':')) {
      const parts = fileName.split(/[:.]/, 2);
      subDirectory = `${parts[0]}/`;
      fileName = fileName.substring(parts[0].length + 1);

      if (!fs.existsSync(`${baseDirectory}/${subDirectory}`))
        fs.mkdirSync(`${baseDirectory}/${subDirectory}`);
    }

    fileName = fileName.replace(/[^a-z0-9]/gi, '_').toLowerCase();

    // Lua API
    fs.writeFileSync(`${baseDirectory}/${subDirectory}${fileName}.lua`, api);  

    // JSON data
    const json = JSON.stringify(pages, wikiPageSaveReplacer, 2);
    fs.writeFileSync(`${baseDirectory}/${subDirectory}${fileName}.json`, json);
  });

  await scraper.scrape();
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
