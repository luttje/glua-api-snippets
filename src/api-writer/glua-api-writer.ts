import { Function, Realm, WikiPage } from '../scrapers/wiki-page-scraper.js';

export class GluaApiWriter {
  private readonly writtenClasses: Set<string> = new Set();

  constructor() { }

  public writePage(page: WikiPage) {
    const { title, realm, function: func } = page;

    let api: string = '';

    if (!func || !realm)
      throw new Error(`Page ${title} does not have a function or realm`);
    
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

  // Newlines dont work in EmmyLua, so we just replace them with a space.
  private removeNewlines(text: string) {
    return text.replace(/\n/g, ' ');
  }

  private transformType(type: string) {
    if (type === 'vararg')
      return '...';
    
    return type;
  }

  private writeFunctionLuaDocComment(func: Function, realm: Realm) {
    let luaDocComment = `---[${realm.toUpperCase()}] ${this.putCommentBeforeEachLine(func.description!)}\n`;

    if (func.arguments) {
      func.arguments.forEach(arg => {
        luaDocComment += `---@param ${arg.name} ${this.transformType(arg.type)} ${this.removeNewlines(arg.description!)}\n`;
      });
    }

    if (func.returns) {
      const returns = `---@return ${func.returns.map(ret => this.transformType(ret.type)).join(', ')}`;

      func.returns.forEach(ret => {
        const description = this.removeNewlines(ret.description);

        if (func.returns!.length === 1) {
          luaDocComment += `${returns} ${description}\n`;
          return;
        }
        
        luaDocComment += `${returns} ${this.transformType(ret.type)} - ${description}\n`;
      });
    }

    return luaDocComment;
  }

  private writeFunctionDeclaration(func: Function, realm: Realm) {
    let declaration = `function ${func.className ? `${func.className}:` : ''}${func.name}(`;

    if (func.arguments) {
      declaration += func.arguments.map(arg => {
        if (arg.type === 'vararg')
          return '...';
        
        return arg.name;
      }).join(', ');
    }

    declaration += ') end\n\n';

    return declaration;
  }
}