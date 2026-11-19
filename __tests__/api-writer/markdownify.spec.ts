import { markdownifyDescription } from '../../src/scrapers/wiki-page-markup-scraper';
import * as cheerio from 'cheerio';

describe('markdownifyDescription', () => {
  it('should handle spaces in links', async () => {
    const textWithUrl = '<test>This is a <page>link with spaces</page>.</test>';
    const $ = cheerio.load(textWithUrl, { xmlMode: true });
    const result = markdownifyDescription($, $('test'));

    expect(result).toBe(
      'This is a [link with spaces](https://wiki.facepunch.com/gmod/link_with_spaces).'
    );
  });
});
