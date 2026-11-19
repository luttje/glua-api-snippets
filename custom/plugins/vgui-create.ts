import { Panel } from "../../src/scrapers/wiki-page-markup-scraper";

export default function plugin(panels: Panel[]) {
  return panels
    .map(panel => panel.name)
    .sort()
    .map(name => `---@overload fun(classname: "${name}", parent?: Panel, name?: string): ${name}\n`)
    .join('');
}
