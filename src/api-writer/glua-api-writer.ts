import { ClassFunction, Enum, Function, HookFunction, LibraryFunction, TypePage, Panel, PanelFunction, Realm, Struct, WikiPage, isPanel, FunctionArgument, FunctionCallback } from '../scrapers/wiki-page-markup-scraper.js';
import { escapeSingleQuotes, putCommentBeforeEachLine, removeNewlines, safeFileName, toLowerCamelCase } from '../utils/string.js';
import {
  isClassFunction,
  isHookFunction,
  isLibraryFunction,
  isLibrary,
  isClass,
  isPanelFunction,
  isStruct,
  isEnum,
} from '../scrapers/wiki-page-markup-scraper.js';
import fs from 'fs';

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

type IndexedWikiPage = {
  index: number;
  page: WikiPage;
};

export class GluaApiWriter {
  private readonly writtenClasses: Set<string> = new Set();
  private readonly writtenLibraryGlobals: Set<string> = new Set();
  private readonly pageOverrides: Map<string, string> = new Map();

  private readonly files: Map<string, IndexedWikiPage[]> = new Map();

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

  public addOverride(pageAddress: string, override: string) {
    this.pageOverrides.set(safeFileName(pageAddress, '.'), override);
  }

  public writePage(page: WikiPage) {
    const fileSafeAddress = safeFileName(page.address, '.');
    if (this.pageOverrides.has(fileSafeAddress)) {
      let api = '';

      if (isClassFunction(page))
        api += this.writeClassStart(page.parent, undefined, page.deprecated);
      else if (isLibraryFunction(page))
        api += this.writeLibraryGlobalFallback(page);

      api += this.pageOverrides.get(fileSafeAddress);

      return `${api}\n\n`;
    } else if (isClassFunction(page))
      return this.writeClassFunction(page);
    else if (isLibraryFunction(page))
      return this.writeLibraryFunction(page);
    else if (isHookFunction(page))
      return this.writeHookFunction(page);
    else if (isPanel(page))
      return this.writePanel(page);
    else if (isPanelFunction(page))
      return this.writePanelFunction(page);
    else if (isEnum(page))
      return this.writeEnum(page);
    else if (isStruct(page))
      return this.writeStruct(page);
    else if (isLibrary(page))
      return this.writeLibraryGlobal(page);
    else if (isClass(page))
      return this.writeClassGlobal(page);
  }

  private writeClassStart(className: string, parent?: string, deprecated?: string, description?: string) {
    let api: string = '';

    if (!this.writtenClasses.has(className)) {
      const classOverride = `class.${className}`;
      if (this.pageOverrides.has(classOverride)) {
        api += this.pageOverrides.get(classOverride)!.replace(/\n$/g, '') + '\n\n';
      } else {
        api += description ? `${putCommentBeforeEachLine(description, false)}\n` : '';

        if (deprecated)
          api += `---@deprecated ${removeNewlines(deprecated)}\n`;

        api += `---@class ${className}`;

        if (parent)
          api += ` : ${parent}`;

        api += '\n';

        // for PLAYER, WEAPON, etc. we want to define globals
        if (className !== className.toUpperCase()) api += 'local ';
        api += `${className} = {}\n\n`;
      }

      this.writtenClasses.add(className);
    }

    return api;
  }

  private writeLibraryGlobalFallback(func: LibraryFunction) {
    if (!func.dontDefineParent && !this.writtenLibraryGlobals.has(func.parent)) {
      let api = '';

      api += `--- Missing description.\n`;
      api += `${func.parent} = {}\n\n`;

      this.writtenLibraryGlobals.add(func.parent);

      return api;
    }

    return '';
  }

  private writeLibraryGlobal(page: TypePage) {
    if (!this.writtenLibraryGlobals.has(page.name)) {
      let api = '';

      api += page.description ? `${putCommentBeforeEachLine(page.description.trim(), false)}\n` : '';

      if (page.deprecated)
        api += `---@deprecated ${removeNewlines(page.deprecated)}\n`;

      api += `${page.name} = {}\n\n`;

      this.writtenLibraryGlobals.add(page.name);

      return api;
    }

    return '';
  }

  private writeClassGlobal(page: TypePage) {
    return this.writeClassStart(page.name, page.parent, page.deprecated, page.description);
  }

  private writeClassFunction(func: ClassFunction) {
    let api: string = this.writeClassStart(func.parent, undefined, func.deprecated);

    if (!func.arguments || func.arguments.length === 0) func.arguments = [{}];
    for (const argSet of func.arguments) {
      api += this.writeFunctionLuaDocComment(func, argSet.args, func.realm);
      api += this.writeFunctionDeclaration(func, argSet.args, ':');
    }

    return api;
  }

  private writeLibraryFunction(func: LibraryFunction) {
    let api: string = this.writeLibraryGlobalFallback(func);

    if (!func.arguments || func.arguments.length === 0) func.arguments = [{}];
    for (const argSet of func.arguments) {
      api += this.writeFunctionLuaDocComment(func, argSet.args, func.realm);
      api += this.writeFunctionDeclaration(func, argSet.args);
    }

    return api;
  }

  private writeHookFunction(func: HookFunction) {
    return this.writeClassFunction(func);
  }

  private writePanel(panel: Panel) {
    let api: string = this.writeClassStart(panel.name, panel.parent, panel.deprecated, panel.description);

    return api;
  }

  private writePanelFunction(func: PanelFunction) {
    let api: string = '';

    if (!func.arguments || func.arguments.length === 0) func.arguments = [{}];
    for (const argSet of func.arguments) {
      api += this.writeFunctionLuaDocComment(func, argSet.args, func.realm);
      api += this.writeFunctionDeclaration(func, argSet.args, ':');
    }

    return api;
  }

  private writeEnum(_enum: Enum) {
    let api: string = '';
    const isContainedInTable = _enum.items[0]?.key.includes('.') ?? false;

    if (_enum.deprecated)
      api += `---@deprecated ${removeNewlines(_enum.deprecated)}\n`;

    api += `---@enum ${_enum.name}\n`;

    if (isContainedInTable) {
      api += _enum.description ? `${putCommentBeforeEachLine(_enum.description.trim(), false)}\n` : '';
      api += `${_enum.name} = {\n`;
    }

    const writeItem = (key: string, item: typeof _enum.items[0]) => {
      if (isContainedInTable) {
        key = key.split('.')[1];
        api += `  ${key} = ${item.value}, ` + (item.description ? `--[[ ${item.description} ]]` : '') + '\n';
      } else {
        api += item.description ? `${putCommentBeforeEachLine(item.description.trim(), false)}\n` : '';
        if (item.deprecated)
          api += `---@deprecated ${removeNewlines(item.deprecated)}\n`;
        api += `${key} = ${item.value}\n`;
      }
    };

    for (const item of _enum.items)
      writeItem(item.key, item);

    if (isContainedInTable)
      api += '}';

    api += `\n\n`;

    return api;
  }

  private writeType(type: string, value: any) {
    if (type === 'string')
      return `'${escapeSingleQuotes(value)}'`;

    if (type === 'Vector')
      return `Vector${value}`;

    return value;
  }

  private writeStruct(struct: Struct) {
    let api: string = this.writeClassStart(struct.name, undefined, struct.deprecated, struct.description);

    for (const field of struct.fields) {
      if (field.deprecated)
        api += `---@deprecated ${removeNewlines(field.deprecated)}\n`;

      api += `---${putCommentBeforeEachLine(field.description.trim())}\n`;

      const type = this.transformType(field.type, field.callback);
      api += `---@type ${type}\n`;
      api += `${struct.name}.${GluaApiWriter.safeName(field.name)} = ${field.default ? this.writeType(type, field.default) : 'nil'}\n\n`;
    }

    return api;
  }

  public writePages(pages: WikiPage[], filePath: string, index: number = 0) {
    if (!this.files.has(filePath)) this.files.set(filePath, []);

    pages.forEach(page => {
      this.files.get(filePath)!.push({index: index, page: page});
    });
  }

  public getPages(filePath: string) {
    return this.files.get(filePath) ?? [];
  }

  public makeApiFromPages(pages: IndexedWikiPage[]) {
    let api = "";

    pages.sort((a, b) => a.index - b.index);

      // First we write the "header" types
      for (const page of pages.filter(x => isClass(x.page) || isLibrary(x.page) || isPanel(x.page))) {
        api += this.writePage(page.page);
      }
      for (const page of pages.filter(x => !isClass(x.page) && !isLibrary(x.page) && !isPanel(x.page))) {
        api += this.writePage(page.page);
      }

    return api;
  }

  public writeToDisk() {
    this.files.forEach((pages: IndexedWikiPage[], filePath: string) => {
      let api = this.makeApiFromPages(pages);

      if (api.length > 0) {
        fs.appendFileSync(filePath, "---@meta\n\n" + api);
      }
    });
  }

  private transformType(type: string, callback?: FunctionCallback) {
    if (type === 'vararg')
      return 'any';

    //fun(cmd: string, args: string): string[]?
    if (type === "function" && callback) {
      let cbStr = `fun(`;

      for (const arg of callback.arguments || []) {
        if (!arg.name) arg.name = arg.type;
        if (arg.type === 'vararg') arg.name = '...';
  
        cbStr += `${GluaApiWriter.safeName(arg.name)}: ${this.transformType(arg.type)}${arg.default !== undefined ? `?` : ''}, `;
      }
      if (cbStr.endsWith(", ")) cbStr = cbStr.substring(0, cbStr.length-2);
      cbStr += ")";

      for (const ret of callback.returns || []) {
        if (!ret.name) ret.name = ret.type;
        if (ret.type === 'vararg') ret.name = '...';

        cbStr += `: ${this.transformType(ret.type)}${ret.default !== undefined ? `?` : ''}, `;
      }
      if (cbStr.endsWith(", ")) cbStr = cbStr.substring(0, cbStr.length-2);

      return cbStr;
    }

    return type;
  }

  private writeFunctionLuaDocComment(func: Function, args: FunctionArgument[] | undefined, realm: Realm) {
    let luaDocComment = `---[${realm.toUpperCase()}] ${putCommentBeforeEachLine(func.description!.trim())}\n`;
    luaDocComment += `---\n---[(View on wiki)](${func.url})\n`;

    if (args) {
      args.forEach((arg, index) => {
        if (!arg.name)
          arg.name = arg.type;

        if (arg.type === 'vararg')
          arg.name = '...';

        let types = this.transformType(arg.type, arg.callback);
        if (arg.altType) types += "|" + this.transformType(arg.altType);

        luaDocComment += `---@param ${GluaApiWriter.safeName(arg.name)}${arg.default !== undefined ? `?` : ''} ${types} ${putCommentBeforeEachLine(arg.description!.trimEnd())}\n`;
      });
    }

    if (func.returns) {
      func.returns.forEach(ret => {
        const description = putCommentBeforeEachLine(ret.description!.trimEnd());

        luaDocComment += `---@return `;

        if (ret.type === 'vararg')
          luaDocComment += 'any ...';
        else
          luaDocComment += `${this.transformType(ret.type, ret.callback)}`;

        luaDocComment += ` # ${description}\n`;
      });
    }

    if (func.deprecated)
      luaDocComment += `---@deprecated ${removeNewlines(func.deprecated)}\n`;

    return luaDocComment;
  }

  private writeFunctionDeclaration(func: Function, args: FunctionArgument[] | undefined, indexer: string = '.') {
    let declaration = `function ${func.parent ? `${func.parent}${indexer}` : ''}${GluaApiWriter.safeName(func.name)}(`;

    if (args) {
      declaration += args.map(arg => {
        if (arg.type === 'vararg')
          return '...';

        return GluaApiWriter.safeName(arg.name!);
      }).join(', ');
    }

    declaration += ') end\n\n';

    return declaration;
  }
}
