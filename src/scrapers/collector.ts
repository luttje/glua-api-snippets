import { Scrapeable, Scraper } from "./scraper.js";

export async function scrapeAndCollect<T extends Scrapeable>(scraper: Scraper<T>) {
  const collected: T[] = [];

  scraper.on("scraped", (url: string, results: T[]) => {
    collected.push(...results);
  });

  await scraper.scrape();

  return collected;
}
