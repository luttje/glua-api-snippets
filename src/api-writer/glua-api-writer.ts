import { ClassFunction, Enum, Function, HookFunction, LibraryFunction, PanelFunction, Realm, Struct, WikiPage } from '../scrapers/wiki-page-markup-scraper.js';
import {
  isClassFunction,
  isHookFunction,
  isLibraryFunction,
  isPanelFunction,
  isStruct,
  isEnum,
} from '../scrapers/wiki-page-markup-scraper.js';
import { toLowerCamelCase } from '../utils/string.js';

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
  private readonly writtenLibraryGlobals: Set<string> = new Set();

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
    if (isClassFunction(page))
      return this.writeClassFunction(page);
    else if (isLibraryFunction(page))
      return this.writeLibraryFunction(page);
    else if (isHookFunction(page))
      return this.writeHookFunction(page);
    else if (isPanelFunction(page))
      return this.writePanelFunction(page);
    else if (isEnum(page))
      return this.writeEnum(page);
    else if (isStruct(page))
      return this.writeStruct(page);
    
    throw new Error(`Unknown page type: ${page}`);
  }

  private writeClassFunction(func: ClassFunction) {
    let api: string = '';

    if (!func.parent)
      throw new Error(`Class function ${func.name} does not have a class name`);
    
    if (!this.writtenClasses.has(func.parent)) {
      api += `---@class ${func.parent}\n`;
      api += `local ${func.parent} = {}\n\n`;

      this.writtenClasses.add(func.parent);
    }

    api += this.writeFunctionLuaDocComment(func, func.realm);
    api += this.writeFunctionDeclaration(func, func.realm);

    return api;
  }
  
  private writeLibraryFunction(func: LibraryFunction) {
    let api: string = '';

    if (!func.parent)
      throw new Error(`Library function ${func.name} does not have a library name`);
    
    if (!this.writtenLibraryGlobals.has(func.parent)) {
      api += `${func.parent} = {}\n\n`;

      this.writtenLibraryGlobals.add(func.parent);
    }

    api += this.writeFunctionLuaDocComment(func, func.realm);
    api += this.writeFunctionDeclaration(func, func.realm);

    return api;
  }

  private writeHookFunction(func: HookFunction) {
    return this.writeClassFunction(func);
  }

  private writePanelFunction(func: PanelFunction) {
    return this.writeClassFunction(func);
  }

  private writeEnum(_enum: Enum) {
    let api: string = '';

    api += `---@enum ${_enum.name}\n`;
    api += `local ${_enum.name} = {\n`;

    for (const item of _enum.items) {
      api += `  ${item.key} = ${item.value}, --[[${item.description}]]\n`;
    }

    api += '}\n\n';

    return api;
  }

  private writeStruct(struct: Struct) {
    let api: string = '';

    api += `---@class ${struct.name}\n`;

    for (const field of struct.fields) {
      api += `---@field ${GluaApiWriter.safeName(field.name)} ${this.transformType(field.type)} ${this.removeNewlines(field.description!)}\n`;
    }
    
    api += `local ${struct.name} = {}\n\n`;

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
    let luaDocComment = `---[${realm.toUpperCase()}] ${this.putCommentBeforeEachLine(func.description!.trim())}\n`;

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
        const description = this.removeNewlines(ret.description ?? '');

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
    let declaration = `function ${func.parent ? `${func.parent}:` : ''}${GluaApiWriter.safeName(func.name)}(`;

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