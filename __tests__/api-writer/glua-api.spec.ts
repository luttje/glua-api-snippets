import { html } from '../utils/offline-sites/gmod-wiki/hook-accept-input';
import { Realm, WikiPage, WikiPageScraper, uselessUrls } from '../../src/scrapers/wiki-page-scraper';
import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import fetchMock from "jest-fetch-mock";
import fs from 'fs';

const apiDefinition = `---@class GM\n` +
  `local GM = {}\n\n` +
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
    scraper.setChildPageFilter((url) => !url.includes('~'));
    const writer = new GluaApiWriter();
    let api = '';

    scraper.on('scraped', (url, pages) => {
      api += writer.writePages(pages);
    });

    await scraper.scrape();

    expect(api).toEqual(apiDefinition);
  });

  it('should throw if a page does not have a function', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/';
    const uselessHtml = '<html><body>Hello World</body></html>';
    fetchMock.mockResponseOnce(uselessHtml, { url: baseUrl });
    
    const scraper = new WikiPageScraper(baseUrl);
    scraper.setChildPageFilter((url) => !url.includes('~'));
    const writer = new GluaApiWriter();

    let count = 0;

    scraper.on('scraped', (url, pages) => {
      count++;
      expect(() => writer.writePages(pages)).toThrow();
    });

    await scraper.scrape();

    expect(count).toEqual(1);
  });
  
  it('should write functions without a class just fine', async () => {
    const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/Global/IsValid', 'Global/IsValid');
    mockWikiPage.realm = Realm.Shared;
    mockWikiPage.function = {
      name: 'IsValid',
      description: 'Checks if the given object is valid.',
      returns: [
        {
          type: 'boolean',
          description: 'If the object is valid.'
        }
      ],
      arguments: [
        {
          name: 'obj',
          type: 'any',
          description: 'The object to check.'
        },
      ],
    };

    const writer = new GluaApiWriter();
    const api = writer.writePage(mockWikiPage);

    expect(api).toEqual(`---[SHARED] Checks if the given object is valid.\n` +
      `---@param obj any The object to check.\n` +
      `---@return boolean If the object is valid.\n` +
      `function IsValid(obj) end\n\n`);
  });

  it('should write functions with varargs correctly', async () => {
    const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/Global.assert', 'Global.assert');
    mockWikiPage.realm = Realm.Shared;
    mockWikiPage.function = {
      name: 'assert',
      description: 'If the result of the first argument is false or nil, an error is thrown with the second argument as the message.',
      returns: [
        {
          type: 'any',
          description: 'If successful, returns the first argument.'
        },
        {
          type: 'any',
          description: 'If successful, returns the error message. This will be nil if the second argument wasn\'t specified.\n\nSince the second argument is only type-checked if the assertion fails, this doesn\'t have to be a string.'
        },
        {
          type: 'vararg',
          description: 'Returns any arguments past the error message.'
        },
      ],
      arguments: [
        {
          name: 'expression',
          type: 'any',
          description: 'The expression to assert.'
        },
        {
          name: 'errorMessage',
          type: 'string',
          description: 'The error message to throw when assertion fails. This is only type-checked if the assertion fails.'
        },
        {
          name: 'returns',
          type: 'vararg',
          description: 'Any arguments past the error message will be returned by a successful assert.'
        },
      ],
    };

    const writer = new GluaApiWriter();
    const api = writer.writePage(mockWikiPage);

    expect(api).toEqual(`---[SHARED] If the result of the first argument is false or nil, an error is thrown with the second argument as the message.\n` +
      `---@param expression any The expression to assert.\n` +
      `---@param errorMessage string The error message to throw when assertion fails. This is only type-checked if the assertion fails.\n` +
      `---@param returns ... Any arguments past the error message will be returned by a successful assert.\n` +
      `---@return any, any, ... any - If successful, returns the first argument.\n` +
      `---@return any, any, ... any - If successful, returns the error message. This will be nil if the second argument wasn't specified.  Since the second argument is only type-checked if the assertion fails, this doesn't have to be a string.\n` +
      `---@return any, any, ... ... - Returns any arguments past the error message.\n` +
      `function assert(expression, errorMessage, ...) end\n\n`);
  });
});
