import { WikiPage } from '../scrapers/wiki-page-markup-scraper.js';
import { GluaApiWriter } from './glua-api-writer.js';
import path from 'path';
import fs from 'fs';

export function loadCustomOverrides(writer: GluaApiWriter, customDirectory: string) {
  for (const file of fs.readdirSync(customDirectory)) {
    const filePath = path.join(customDirectory, file);

    if (fs.statSync(filePath).isDirectory()) {
      console.warn(`Skipping directory ${file} in custom (not supported)`);
      continue;
    }

    // Besides the prefix helping us discern between overrides and files to copy, it also prevents conflicts with the wiki pages (since none of them start with _)
    if (file.startsWith('_')) {
      fs.copyFileSync(filePath, path.join(writer.outputDirectory, file));
      continue;
    }

    const fileContent = fs.readFileSync(filePath, { encoding: 'utf-8' });
    writer.addOverride(file.replace(/\.lua$/, ''), fileContent);
  }
}

export function writeScrapedPages(writer: GluaApiWriter, address: string, pages: WikiPage[], index: number) {
  let fileName = address;
  let moduleName = fileName;

  if (fileName.includes('.') || fileName.includes(':') || fileName.includes('/')) {
    [moduleName, fileName] = fileName.split(/[:.\/]/, 2);
  }

  fileName = fileName.replace(/[^a-z0-9]/gi, '_').toLowerCase();

  // Make sure modules like Entity and ENTITY are placed in the same file.
  moduleName = moduleName.toLowerCase();

  // Special cases for library and hook pages
  if (moduleName.endsWith("(library)")) moduleName = moduleName.substring(0, moduleName.length - 9);
  if (moduleName.endsWith("_hooks")) moduleName = moduleName.substring(0, moduleName.length - 6);

  const moduleDirectory = path.join(writer.outputDirectory, moduleName);

  writer.writePages(pages, path.join(writer.outputDirectory, `${moduleName}.lua`), index);

  if (!fs.existsSync(moduleDirectory))
    fs.mkdirSync(moduleDirectory, { recursive: true });

  fs.writeFileSync(path.join(moduleDirectory, `${fileName}.json`), JSON.stringify(pages, null, 2));
}
