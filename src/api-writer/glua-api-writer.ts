import { Function, Realm, WikiPage } from '../scrapers/wiki-page-scraper.js';
import { toLowerCamelCase } from '../string-utils.js';

export const RESERVERD_KEYWORDS = new Set([
  'and',
  'break',
  'continue',
  'do',
  'else',
  'elseif',
  'end',
  'false',
  'for',
  'function',
  'goto',
  'if',
  'in',
  'local',
  'nil',
  'not',
  'or',
  'repeat',
  'return',
  'then',
  'true',
  'until',
  'while'
]);

export class GluaApiWriter {
  private readonly writtenClasses: Set<string> = new Set();
  private readonly writtenStaticGlobals: Set<string> = new Set();

  constructor() { }

  public static safeName(name: string) {
    if (name.includes('/'))
      name = name.replace(/\//g, ' or ');
    
    if (name.includes('='))
      name = name.split('=')[0];
      
    if (name.includes(' '))
      name = toLowerCamelCase(name);
    
    // Remove any remaining characters not valid in a Lua variable/function name.
    name = name.replace(/[^A-Za-z\d_.]/g, '');

    if (RESERVERD_KEYWORDS.has(name))
      return `_${name}`;
    
    return name;
  }

  public writePage(page: WikiPage) {
    const { title, realm, function: func } = page;

    let api: string = '';

    if (!func || !realm)
      throw new Error(`Page ${title} does not have a function or realm`);
    
    const staticGlobalParts = func.name.split('.');
    
    if (func.className && !this.writtenClasses.has(func.className)) {
      api += `---@class ${func.className}\n`;
      api += `local ${func.className} = {}\n\n`;

      this.writtenClasses.add(func.className);
    } else if (staticGlobalParts.length > 1 && !this.writtenStaticGlobals.has(staticGlobalParts[0])) {
      api += `${staticGlobalParts[0]} = {}\n\n`;

      this.writtenStaticGlobals.add(staticGlobalParts[0]);
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
      func.arguments.forEach((arg, index) => {
        if (!arg.name)
          arg.name = arg.type;
        
        if (arg.type === 'vararg')
          arg.name = '...';
        
        luaDocComment += `---@param ${GluaApiWriter.safeName(arg.name)} ${this.transformType(arg.type)} ${this.removeNewlines(arg.description!)}\n`;
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
    let declaration = `function ${func.className ? `${func.className}:` : ''}${GluaApiWriter.safeName(func.name)}(`;

    if (func.arguments) {
      declaration += func.arguments.map(arg => {
        if (arg.type === 'vararg')
          return '...';
        
        return GluaApiWriter.safeName(arg.name!);
      }).join(', ');
    }

    declaration += ') end\n\n';

    return declaration;
  }
}