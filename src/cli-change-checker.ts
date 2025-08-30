import { WikiHistoryPageScraper } from './scrapers/wiki-history-scraper.js';
import packageJson from '../package.json' with { type: "json" };
import { scrapeAndCollect } from './scrapers/collector.js';
import { dateToFilename } from './utils/filesystem.js';
import { Command } from 'commander';
import { fileURLToPath } from 'url';
import path from 'path';

type Options = {
  url: string,
  gitTags: string[],
};

export async function main(options: Options) {
  if (!options.url || options.url.length === 0) {
    console.error('No valid URL provided');
    process.exit(1);
  }

  if (!options.gitTags || options.gitTags.length === 0) {
    console.error('No git tags provided');
    process.exit(1);
  }

  const results = await scrapeAndCollect(new WikiHistoryPageScraper(options.url));
  const lastUpdate = results[0].history[0].dateTime;
  const tagName = dateToFilename(lastUpdate);

  if (!options.gitTags.includes(tagName)) {
    console.log(`Tag ${tagName} does not exist. There have been changes since the last scrape.`);
    process.exit(1);
  }

  console.log(`Tag ${tagName} exists. There have been no changes since the last scrape.`);
}

const nodePath = path.resolve(process.argv[1]);
const modulePath = path.resolve(fileURLToPath(import.meta.url))
const isRunningDirectlyViaCLI = nodePath === modulePath
if (isRunningDirectlyViaCLI) {
  const program = new Command();

  program
    .version(packageJson.version)
    .description('Checks the Garry\'s Mod wiki to see if there have been changes since the last scrape')
    .option('-u, --url <url>', 'The URL of the wiki history page to scrape', 'https://wiki.facepunch.com/gmod/~recentchanges')
    .argument('<git-tags>', 'The git tags to compare to')
    .parse(process.argv);

  const options = program.opts();

  main({ ...options, gitTags: program.args } as Options).catch((err) => {
    console.error(err);
    process.exit(1);
  });
}
