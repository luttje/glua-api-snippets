import { html as accessorFuncHtml } from '../utils/offline-sites/gmod-wiki/accessor-func';
import { html as openFolderHtml } from '../utils/offline-sites/gmod-wiki/open-folder';
import { html as baseHtml } from '../utils/offline-sites/gmod-wiki/hook-accept-input';
import { html as editHtml } from '../utils/offline-sites/gmod-wiki/hook-accept-input-edit';
import { html as historyHtml } from '../utils/offline-sites/gmod-wiki/hook-accept-input-history';
import fetchMock from "jest-fetch-mock";
import { Realm, WikiPage, WikiPageScraper, uselessUrls, wikiPageSaveReplacer } from '../../src/scrapers/wiki-page-scraper';
import { html } from '../utils/offline-sites/gmod-wiki/home';

describe('GMod Wiki Parse', () => {

  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a hooks page', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/GM:AcceptInput';
    
    fetchMock.mockResponses(
      [ baseHtml, { url: baseUrl } ],
      [ editHtml, { url: `${baseUrl}~edit` } ],
      [ historyHtml, { url: `${baseUrl}~history` } ],
    )

    const scraper = new WikiPageScraper(baseUrl);
    const results: WikiPage[] = [];

    scraper.on('scraped', (url: string, pages: WikiPage[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

    expect(results.length).toEqual(3);
    expect(results[0].url).toEqual(baseUrl);
    expect(results[0].title).toEqual("GM:AcceptInput - Garry's Mod Wiki");
    expect(results[0].realm).toEqual(Realm.Server);
    expect(results[0].function!.name).toEqual('AcceptInput');
    expect(results[0].function!.className).toEqual('GM');
    expect(results[0].function!.description).toBeTruthy();
    expect(results[0].function!.arguments!.length).toEqual(5);
    expect(results[0].function!.returns!.length).toEqual(1);
  });

  it('should be able to parse a global function page', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/Global.AccessorFunc';

    fetchMock.mockResponses(
      [accessorFuncHtml, { url: baseUrl }],
      [editHtml, { url: `${baseUrl}~edit` }],
      [historyHtml, { url: `${baseUrl}~history` }],
    );

    const scraper = new WikiPageScraper(baseUrl);
    const results: WikiPage[] = [];

    scraper.on('scraped', (url: string, pages: WikiPage[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

    expect(results.length).toEqual(3);
    expect(results[0].url).toEqual(baseUrl);
    expect(results[0].title).toEqual("AccessorFunc - Garry's Mod Wiki");
    expect(results[0].realm).toEqual(Realm.Shared);
    expect(results[0].function!.name).toEqual('AccessorFunc');
    expect(results[0].function!.className).toBeUndefined();
    expect(results[0].function!.description).toBeTruthy();
    expect(results[0].function!.arguments!.length).toEqual(4);
    expect(results[0].function!.returns!.length).toEqual(0);
  });

  it('should be able to parse a global menu function', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/Global.OpenFolder';
    
    fetchMock.mockResponses(
      [openFolderHtml, { url: baseUrl }],
      [editHtml, { url: `${baseUrl}~edit` }],
      [historyHtml, { url: `${baseUrl}~history` }],
    );
    
    const scraper = new WikiPageScraper(baseUrl);
    const results: WikiPage[] = [];

    scraper.on('scraped', (url: string, pages: WikiPage[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

    expect(results.length).toEqual(3);
    expect(results[0].url).toEqual(baseUrl);
    expect(results[0].title).toEqual("OpenFolder - Garry's Mod Wiki");
    expect(results[0].realm).toEqual(Realm.Menu);
    expect(results[0].function!.name).toEqual('OpenFolder');
    expect(results[0].function!.className).toBeUndefined();
    expect(results[0].function!.description).toBeTruthy();
    expect(results[0].function!.arguments!.length).toEqual(1);
    expect(results[0].function!.returns!.length).toEqual(0);
  });

  it('should be able write the results to a json file', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/GM:AcceptInput';
    
    fetchMock.mockResponses(
      [baseHtml, { url: baseUrl }],
      [editHtml, { url: `${baseUrl}~edit` }],
      [historyHtml, { url: `${baseUrl}~history` }],
    );

    const scraper = new WikiPageScraper(baseUrl);
    const results: WikiPage[] = [];

    scraper.on('scraped', (url: string, pages: WikiPage[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

    expect(results.length).toEqual(3);

    const json = JSON.stringify(results, wikiPageSaveReplacer, 2);
    expect(json).toBeTruthy();
  });

  it('should work without error on pages that do not have content', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/';
    const html = `<html><head><title>Test - Garry's Mod Wiki</title></head><body></body></html>`;

    fetchMock.mockResponseOnce(html, { url: baseUrl });

    const scraper = new WikiPageScraper(baseUrl);
    const results: WikiPage[] = [];

    scraper.on('scraped', (url: string, pages: WikiPage[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

    expect(results.length).toEqual(1);
    expect(results[0].function).toBeUndefined();
  });

  it('should work without error on pages that do not have a realm', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/';
    const html = `<html><head><title>Test - Garry's Mod Wiki</title></head><body><div id="pagecontent"></div></body></html>`;

    fetchMock.mockResponseOnce(html, { url: baseUrl });

    const scraper = new WikiPageScraper(baseUrl);
    const results: WikiPage[] = [];

    scraper.on('scraped', (url: string, pages: WikiPage[]) => {
      results.push(pages[0]);
    });
    
    await scraper.scrape();

    expect(results.length).toEqual(1);
    expect(results[0].function).toBeUndefined();
  });

  it('should filter out specified pages', async () => {
    const baseUrl = 'https://wiki.facepunch.com/gmod/';
    fetchMock.mockResponseOnce(html, { url: baseUrl });

    const scraper = new WikiPageScraper(baseUrl);
    scraper.setChildPageFilter(url => !uselessUrls.has(url));
    const results = await scraper.visitOne(baseUrl, scraper.getScrapeCallback());

    uselessUrls.forEach(url => {
      for (const result of results) {
        expect(result.childUrls).not.toContain(url);
      }
    });
  });
});