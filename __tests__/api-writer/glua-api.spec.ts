import { html } from '../utils/offline-sites/gmod-wiki/hook-accept-input';
import { WikiPageScraper } from '../../src/scrapers/wiki-page-scraper';
import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import fetchMock from "jest-fetch-mock";
import fs from 'fs';

const apiDefinition = `---@class GM\n` +
  `---\n` +
  `---[SERVER] Called when a map I/O event occurs.\n` +
  `--- See also Entity:Fire and Entity:Input for functions to fire Inputs on entities.\n` +
  `---@param ent Entity Entity that receives the input\n` +
  `---@param input string The input name. Is not guaranteed to be a valid input on the entity.\n` +
  `---@param activator Entity Activator of the input\n` +
  `---@param caller Entity Caller of the input\n` +
  `---@param value any Data provided with the input. Will be either a string, a number, a boolean or a nil.\n` +
  `---@return boolean Return true to prevent this input from being processed. Do not return otherwise.\n` +
  `function GM:AcceptInput(ent, input, activator, caller, value) end\n\n`;

describe('GLua API Writer', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to write EmmyLua API files from wiki json data', async () => {
    const json = fs.readFileSync('./__tests__/utils/scraped-wiki-data.json', 'utf8');
    const results = JSON.parse(json);

    const writer = new GluaApiWriter();
    const api = await writer.writePages(results);

    expect(api).toEqual(apiDefinition);
  });

  it('should be able to write EmmyLua API files directly from wiki pages', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/GM:AcceptInput';
    fetchMock.mockResponseOnce(html, { url: baseUrl });
    
    const scraper = new WikiPageScraper(baseUrl);
    const writer = new GluaApiWriter();
    let api = '';

    scraper.on('scraped', (url, pages) => {
      api += writer.writePages(pages);
    });

    await scraper.scrape();

    expect(api).toEqual(apiDefinition);
  });
});
