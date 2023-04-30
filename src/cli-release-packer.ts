import packageJson from '../package.json' assert { type: "json" };
import { convertWindowsToUnixPath, walk, zipFiles } from './filesystem.js';
import { readMetadata } from './metadata.js';
import { Command } from 'commander';
import path from 'path';
import fs from 'fs';

async function main() {
  const program = new Command();

  program
    .version(packageJson.version)
    .description('Releases the previously scraped Garry\'s Mod wiki API information')
    .option('-i, --input <path>', 'The path to the directory where the output json and lua files have been saved', './output')
    .option('-o, --output <path>', 'The path to the directory where the release should be saved', './dist/release')
    .parse(process.argv);

  const options = program.opts();

  if (!options.input) {
    console.error('No input path provided');
    process.exit(1);
  }

  const metadata = await readMetadata(options.input);

  if (!metadata) {
    console.error('No metadata found');
    process.exit(1);
  }

  const baseFileName = metadata.lastUpdate.toISOString().replace(/:/g, '-')
    .slice(0, -5) // without .000Z
    .replace(/T/g, '_');

  console.log(`Building release for ${metadata.lastUpdate}...`);

  let releaseFiles : string[] = [];
  const targets = [
    'json',
    'lua',
  ];

  for (const target of targets) {
    const files = walk(options.input, (file, isDirectory) => isDirectory || file.endsWith(`.${target}`) || file.endsWith('__metadata.json'));
    const targetPath = path.join(options.output, `${baseFileName}.${target}.zip`);

    await zipFiles(targetPath, files, options.input);

    releaseFiles.push(convertWindowsToUnixPath(targetPath));
  }

  // Write the release file name to a file so the GitHub action can read it.
  fs.writeFileSync(path.join(options.output, 'release.json'), JSON.stringify({
    version: metadata.lastUpdate.toLocaleString(),
    tag: baseFileName,
    releaseFiles,
  }));

  console.log(`Done building release! It can be found @ ${releaseFiles.join(' and ')}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
