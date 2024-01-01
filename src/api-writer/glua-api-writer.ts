import { ClassFunction, Enum, Function, HookFunction, LibraryFunction, Panel, PanelFunction, Realm, Struct, WikiPage, isPanel } from '../scrapers/wiki-page-markup-scraper.js';
import { escapeSingleQuotes, putCommentBeforeEachLine, removeNewlines, safeFileName, toLowerCamelCase } from '../utils/string.js';
import {
  isClassFunction,
  isHookFunction,
  isLibraryFunction,
  isPanelFunction,
  isStruct,
  isEnum,
} from '../scrapers/wiki-page-markup-scraper.js';

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
  private readonly pageOverrides: Map<string, string> = new Map();

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
        api += this.writeClass(page.parent, undefined, undefined, page.deprecated);
      else if (isLibraryFunction(page))
        api += this.writeLibraryGlobal(page);

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
  }

  private writeClass(className: string, parent?: string, classFields: string = '', deprecated?: string) {
    let api: string = '';

    if (!this.writtenClasses.has(className)) {
      const classOverride = `class.${className}`;
      if (this.pageOverrides.has(classOverride)) {
        api += this.pageOverrides.get(classOverride)!.replace(/\n$/g, '') + '\n\n';
        api = api.replace('---{{CLASS_FIELDS}}', classFields);
      } else {
        if (deprecated)
          api += `---@deprecated ${removeNewlines(deprecated)}\n`

        api += `---@class ${className}`;

        if (parent)
          api += ` : ${parent}`;

        api += '\n';
        api += `local ${className} = {}\n\n`;
        api += classFields;
      }

      this.writtenClasses.add(className);
    }

    return api;
  }

  private writeLibraryGlobal(func: LibraryFunction) {
    if (!func.dontDefineParent && !this.writtenLibraryGlobals.has(func.parent)) {
      let global = '';

      if (func.deprecated)
        global += `---@deprecated ${removeNewlines(func.deprecated)}\n`;

      global += `${func.parent} = {}\n\n`;

      this.writtenLibraryGlobals.add(func.parent);

      return global;
    }

    return '';
  }

  private writeClassFunction(func: ClassFunction) {
    let api: string = this.writeClass(func.parent, undefined, undefined, func.deprecated);

    api += this.writeFunctionLuaDocComment(func, func.realm);
    api += this.writeFunctionDeclaration(func, func.realm, ':');

    return api;
  }

  private writeLibraryFunction(func: LibraryFunction) {
    let api: string = this.writeLibraryGlobal(func);

    api += this.writeFunctionLuaDocComment(func, func.realm);
    api += this.writeFunctionDeclaration(func, func.realm);

    return api;
  }

  private writeHookFunction(func: HookFunction) {
    return this.writeClassFunction(func);
  }

  private writePanel(panel: Panel) {
    return this.writeClass(panel.name, panel.parent, undefined, panel.deprecated);
  }

  private writePanelFunction(func: PanelFunction) {
    let api: string = '';

    api += this.writeFunctionLuaDocComment(func, func.realm);
    api += this.writeFunctionDeclaration(func, func.realm, ':');

    return api;
  }

  private writeEnum(_enum: Enum) {
    let api: string = '';
    const isContainedInTable = _enum.items[0]?.key.includes('.') ?? false;

    if (_enum.deprecated)
      api += `---@deprecated ${removeNewlines(_enum.deprecated)}\n`;

    api += `---@enum ${_enum.name}\n`;

    if (isContainedInTable)
      api += `local ${_enum.name} = {\n`;

    const writeItem = (key: string, item: typeof _enum.items[0]) => {
      if (isContainedInTable) {
        key = key.split('.')[1];
        api += `  ${key} = ${item.value}, ` + (item.description ? `--[[ ${item.description} ]]` : '') + '\n';
      } else {
        api += item.description ? `${putCommentBeforeEachLine(item.description, false)}\n` : ''
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
    let fields: string = '';

    for (const field of struct.fields) {
      if (field.deprecated)
        fields += `---@deprecated ${removeNewlines(field.deprecated)}\n`;

      fields += `---${removeNewlines(field.description).replace(/\s+/g, ' ')}\n`;

      const type = this.transformType(field.type)
      fields += `---@type ${type}\n`
      fields += `${struct.name}.${GluaApiWriter.safeName(field.name)} = ${field.default ? this.writeType(type, field.default) : 'nil'}\n\n`;
    }

    return this.writeClass(struct.name, undefined, fields, struct.deprecated);
  }

  public writePages(pages: WikiPage[]) {
    let api: string = '';

    for (const page of pages) {
      api += this.writePage(page);
    }

    return api;
  }

  private transformType(type: string) {
    if (type === 'vararg')
      return '...';

    return type;
  }

  private writeFunctionLuaDocComment(func: Function, realm: Realm) {
    let luaDocComment = `---[${realm.toUpperCase()}] ${putCommentBeforeEachLine(func.description!.trim())}\n`;
    luaDocComment += `---\n---[(View on wiki)](${func.url})\n`;

    if (func.arguments) {
      func.arguments.forEach((arg, index) => {
        if (!arg.name)
          arg.name = arg.type;

        if (arg.type === 'vararg')
          arg.name = '...';

        luaDocComment += `---@param ${GluaApiWriter.safeName(arg.name)}${arg.default !== undefined ? `?` : ''} ${this.transformType(arg.type)} ${putCommentBeforeEachLine(arg.description!)}\n`;
      });
    }

    if (func.returns) {
      const returns = `---@return ${func.returns.map(ret => this.transformType(ret.type)).join(', ')}`;

      func.returns.forEach(ret => {
        const description = removeNewlines(ret.description ?? '');

        if (func.returns!.length === 1) {
          luaDocComment += `${returns} #${description}\n`;
          return;
        }

        luaDocComment += `${returns} #${this.transformType(ret.type)} - ${description}\n`;
      });
    }

    if (func.deprecated)
      luaDocComment += `---@deprecated ${removeNewlines(func.deprecated)}\n`;

    return luaDocComment;
  }

  private writeFunctionDeclaration(func: Function, realm: Realm, indexer: string = '.') {
    let declaration = `function ${func.parent ? `${func.parent}${indexer}` : ''}${GluaApiWriter.safeName(func.name)}(`;

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
