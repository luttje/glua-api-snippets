import { Function, Realm, WikiPage } from '../scrapers/wiki-page-scraper.js';

export class GluaApiWriter {
  private readonly writtenClasses: Set<string> = new Set();

  constructor() { }

  public writePage(page: WikiPage) {
    const { title, realm, function: func } = page;

    let api: string = '';

    if (!func)
      throw new Error(`Page ${title} does not have a function`);
    
    if (!realm)
      throw new Error(`Page ${title} does not have a realm`);

    if (func.className && !this.writtenClasses.has(func.className)) {
      api += `---@class ${func.className}\n`;
      api += `local ${func.className} = {}\n\n`;
    }

    api += this.writeFunctionLuaDocComment(func, realm);
    api += this.writeFunctionDeclaration(func, realm);

    return api;
  }

  public writePages(pages: WikiPage[]) {
    let api: string = '';

    for (const page of pages) {
      api += this.writePage(page);
    }

    return api;
  }

  private putCommentBeforeEachLine(text: string, skipLineOne: boolean = true) {
    return text.split('\n').map((line, index) => {
      if (index === 0 && skipLineOne)
        return line;

      return `--- ${line}`;
    }).join('\n');
  }

  private writeFunctionLuaDocComment(func: Function, realm: Realm) {
    let luaDocComment = `---[${realm.toUpperCase()}] ${this.putCommentBeforeEachLine(func.description!)}\n`;

    if (func.arguments) {
      func.arguments.forEach(arg => {
        luaDocComment += `---@param ${arg.name} ${arg.type} ${this.putCommentBeforeEachLine(arg.description!)}\n`;
      });
    }

    if (func.returns) {
      func.returns.forEach(ret => {
        luaDocComment += `---@return ${ret.type} ${this.putCommentBeforeEachLine(ret.description!)}\n`;
      });
    }

    return luaDocComment;
  }

  private writeFunctionDeclaration(func: Function, realm: Realm) {
    let declaration = `function ${func.className ? `${func.className}:` : ''}${func.name}(`;

    if (func.arguments) {
      declaration += func.arguments.map(arg => arg.name).join(', ');
    }

    declaration += ') end\n\n';

    return declaration;
  }
}