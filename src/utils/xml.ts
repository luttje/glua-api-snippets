import * as cheerio from 'cheerio';

export function deserializeXml<T extends object | null>(xml: string, deserializer: ($: cheerio.CheerioAPI) => T): T {
  const $ = cheerio.load(xml, { xml: true });

  return deserializer($);
}
