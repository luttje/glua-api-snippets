import { markup as classFunctionMarkup, json as classFunctionJson } from '../test-data/offline-sites/gmod-wiki/class-function-weapon-allowsautoswitchto';
import { markup as libraryFunctionMarkup, json as libraryFunctionJson } from '../test-data/offline-sites/gmod-wiki/library-function-ai-getscheduleid';
import { ClassFunction, Enum, HookFunction, LibraryFunction, Struct, WikiPageMarkupScraper } from '../../src/scrapers/wiki-page-markup-scraper';
import { markup as hookMarkup, json as hookJson } from '../test-data/offline-sites/gmod-wiki/hook-player-initial-spawn';
import { markup as structMarkup, json as structJson } from '../test-data/offline-sites/gmod-wiki/struct-ang-pos';
import { markup as enumMarkup, json as enumJson } from '../test-data/offline-sites/gmod-wiki/enums-use';
import fetchMock from "jest-fetch-mock";

describe('GMod Wiki Page Markup Parse', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a library func markup', async () => {
    fetchMock.mockResponseOnce(libraryFunctionMarkup);

    const responseMock = <Response>{
      url: libraryFunctionJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, libraryFunctionMarkup)).toEqual([<LibraryFunction>libraryFunctionJson]);
  });

  it('should be able to parse a class function markup', async () => {
    fetchMock.mockResponseOnce(classFunctionMarkup);

    const responseMock = <Response>{
      url: classFunctionJson.url
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, classFunctionMarkup)).toEqual([<ClassFunction>classFunctionJson]);
  });

  it('should be able to parse a hook function markup', async () => {
    fetchMock.mockResponseOnce(hookMarkup);

    const responseMock = <Response>{
      url: hookJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, hookMarkup)).toEqual([<HookFunction>hookJson]);
  });

  it('should be able to parse a enum markup', async () => {
    fetchMock.mockResponseOnce(enumMarkup);

    const responseMock = <Response>{
      url: enumJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, enumMarkup)).toEqual([<Enum>enumJson]);
  });

  it('should be able to parse a structure markup', async () => {
    fetchMock.mockResponseOnce(structMarkup);

    const responseMock = <Response>{
      url: structJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, structMarkup)).toEqual([<Struct>structJson]);
  });
});
