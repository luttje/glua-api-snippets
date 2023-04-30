import packageJson from '../package.json' assert { type: "json" };
import { GluaApiWriter } from './api-writer/glua-api-writer.js';
import { makeConfigJson } from './lua-language-server.js';
import { readMetadata } from './metadata.js';
import { walk } from './utils/filesystem.js';
import { Command } from 'commander';
import path from 'path';
import fs from 'fs';

const libraryName = 'garrysmod';

// Patterns to recognize in GLua files, so that the language server can recommend this library to be activated:
const libraryWordMatchers = [
  'include%s*%(?',
  'AddCSLuaFile%s*%(?',
  'hook%.Add%s*%(',
];

// Same as above, but for files:
const libraryFileMatchers: string[] = [];

const libraryFileHeader = '---@meta';
const libraryDirectory = 'library';

async function main() {
  const program = new Command();

  program
    .version(packageJson.version)
    .description('Publishes the previously scraped Garry\'s Mod wiki API information as a LuaLS Library')
    .option('-i, --input <path>', 'The path to the directory where the output json and lua files have been saved', './output')
    .option('-o, --output <path>', 'The path to the directory where the release should be saved', './dist/libraries/garrysmod')
    .parse(process.argv);

  const options = program.opts();

  if (!options.input) {
    console.error('No input path provided');
    process.exit(1);
  }

  if (!options.output) {
    console.error('No output path provided');
    process.exit(1);
  }

  const metadata = await readMetadata(options.input);

  if (!metadata) {
    console.error('No metadata found');
    process.exit(1);
  }

  if (!fs.existsSync(path.join(options.output, libraryDirectory))) {
    fs.mkdirSync(path.join(options.output, libraryDirectory), { recursive: true });
  }

  console.log(`Building Lua Language Server Library for ${metadata.lastUpdate}...`);

  const config = makeConfigJson(
    libraryName,
    libraryWordMatchers,
    libraryFileMatchers,
    {
      "Lua.runtime.version": "Lua 5.1",
      "Lua.runtime.special": {
        "include": "require",
      },
      "runtime.nonstandardSymbol": [
        "!",
        "!=",
        "&&",
        "||",
        "//",
        "/**/",
        "continue",
      ],
      // TODO: runtime.path
    });
  
  fs.writeFileSync(path.join(options.output, 'config.json'), JSON.stringify(config, null, 2));
  
  const writer = new GluaApiWriter();
  const outputFile = fs.openSync(path.join(options.output, libraryDirectory, 'api.lua'), 'w');
  const files = walk(options.input, (file, isDirectory) => isDirectory || (file.endsWith(`.json`) && !file.endsWith(`__metadata.json`)));
  
  fs.writeSync(outputFile, libraryFileHeader + '\n\n');

  files.forEach((file) => {
    const json = JSON.parse(fs.readFileSync(file, 'utf8'));
    const pages = json;
    const api = writer.writePages(pages)

    fs.writeSync(outputFile, api);
  });

  fs.closeSync(outputFile);

  console.log(`Done building Library! It can be found @ ${options.output}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
