import { ClassFunction, Enum, Function, HookFunction, LibraryFunction, TypePage, Panel, PanelFunction, Realm, Struct, WikiPage, isPanel, FunctionArgument, FunctionCallback } from '../scrapers/wiki-page-markup-scraper.js';
import { escapeSingleQuotes, indentText, wrapInComment, removeNewlines, safeFileName, toLowerCamelCase } from '../utils/string.js';
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
import customPluginHookAdd from '../../custom/plugins/hook-add.js';
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

  constructor(
    public readonly outputDirectory: string = './output',
  ) { }

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

  private isFakeEnum(_enum: Enum) {
    // TODO: Kindly ask Rubat to add a <isFake> marker of sorts to the wiki
    return _enum.description.includes('**WARNING**: These enumerations do not exist in game and are listed here only for reference');
  }

  public writePage(page: WikiPage) {
    const fileSafeAddress = safeFileName(page.address, '.');
    if (this.pageOverrides.has(fileSafeAddress)) {
      let api = '';

      if (isClassFunction(page))
        api += this.writeClassStart(page.parent, undefined, undefined, undefined, page.deprecated);
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

  private writeClassStart(className: string, realm?: Realm, url?: string, parent?: string, deprecated?: string, description?: string) {
    let api: string = '';

    if (!this.writtenClasses.has(className)) {
      const classOverride = `class.${className}`;
      if (this.pageOverrides.has(classOverride)) {
        api += this.pageOverrides.get(classOverride)!.replace(/\n$/g, '') + '\n\n';
      } else {
        if (realm) {
          api += `---${this.formatRealm(realm)} ${description ? `${wrapInComment(description)}\n` : ''}\n`;
        } else {
          api += description ? `${wrapInComment(description, false)}\n` : '';
        }

        if (url) {
          api += `---\n---[View wiki](${url})\n`;
        }

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

      api += page.description ? `${wrapInComment(page.description, false)}\n` : '';

      if (page.deprecated)
        api += `---@deprecated ${removeNewlines(page.deprecated)}\n`;

      api += `${page.name} = {}\n\n`;

      this.writtenLibraryGlobals.add(page.name);

      return api;
    }

    return '';
  }

  private writeClassGlobal(page: TypePage) {
    return this.writeClassStart(page.name, page.realm, page.url, page.parent, page.deprecated, page.description);
  }

  private writeClassFunction(func: ClassFunction) {
    let api: string = this.writeClassStart(func.parent, undefined, undefined, undefined, func.deprecated);

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
    let api: string = this.writeClassStart(panel.name, undefined, undefined, panel.parent, panel.deprecated, panel.description);

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

    // If the first key is empty (like SCREENFADE has), check the second key
    const isContainedInTable =
      _enum.items[0]?.key === ''
        ? _enum.items[1]?.key.includes('.')
        : _enum.items[0]?.key.includes('.');

    if (_enum.deprecated)
      api += `---@deprecated ${removeNewlines(_enum.deprecated)}\n`;

    if (isContainedInTable) {
      api += `---${this.formatRealm(_enum.realm)} ${_enum.description ? `${wrapInComment(_enum.description)}` : ''}\n`;
      api += `---@enum ${_enum.name}\n`;
      api += `${_enum.name} = {\n`;
    }

    const writeItem = (key: string, item: typeof _enum.items[0]) => {
      if (key === '') {
        // Happens for SCREENFADE which has a blank key to describe what 0 does.
        return;
      }

      if (isNaN(Number(item.value.trim()))) {
        // Happens for TODO value in NAV_MESH_BLOCKED_LUA in https://wiki.facepunch.com/gmod/Enums/NAV_MESH
        console.warn(`Enum ${_enum.name} has a TODO value for key ${key}. Skipping.`);
        return;
      }

      if (isContainedInTable) {
        key = key.split('.')[1];

        if (item.description?.trim()) {
          api += `${indentText(wrapInComment(item.description, false), 2)}\n`;
        }

        api += `  ${key} = ${item.value},\n`;
      } else {
        api += item.description ? `${wrapInComment(item.description, false)}\n` : '';
        if (item.deprecated)
          api += `---@deprecated ${removeNewlines(item.deprecated)}\n`;
        api += `${key} = ${item.value}\n`;
      }
    };

    if (!this.isFakeEnum(_enum)) {
      for (const item of _enum.items)
        writeItem(item.key, item);
    }

    if (isContainedInTable) {
      api += '}';
    } else {
      // TODO: Clean up this workaround when LuaLS supports global enumerations.
      // Until LuaLS supports global enumerations (https://github.com/LuaLS/lua-language-server/issues/2721) we
      // will use @alias as a workaround.

      // Some enums like SNDLVL are fake in the wiki and only listed for reference, so we render those such that the enums
      // are explained in the annotation
      if (this.isFakeEnum(_enum)) {
        // First output the description
        api += `---${this.formatRealm(_enum.realm)} ${_enum.description ? `${wrapInComment(_enum.description)}` : ''}\n`;
        let enumValues = '';

        for (const item of _enum.items) {
          if (item.key !== '' && !isNaN(Number(item.value.trim()))) {
            api += `--- * \`${item.key}\` = \`${item.value}\`\n`;
            enumValues += `${item.value} | `;
          }
        }

        enumValues = enumValues.slice(0, -3); // Remove trailing " | "

        // Add wikilink
        api += `---\n--- [View wiki](${_enum.url})\n`;
        api += `--- @alias ${_enum.name} ${enumValues}\n`;
      } else {
        // LuaLS doesn't nicely display annotations for aliasses, hence this is commented
        //api += `\n---${this.formatRealm(_enum.realm)} ${_enum.description ? `${wrapInComment(_enum.description)}` : ''}\n`;
        api += `\n---@alias ${_enum.name}\n`;

        for (const item of _enum.items) {
          if (item.key !== '' && !isNaN(Number(item.value.trim()))) {
            api += `---| \`${item.key}\`\n`;
          }
        }
      }
    }

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
    let api: string = this.writeClassStart(struct.name, struct.realm, struct.url, undefined, struct.deprecated, struct.description);

    for (const field of struct.fields) {
      if (field.deprecated)
        api += `---@deprecated ${removeNewlines(field.deprecated)}\n`;

      api += `---${wrapInComment(field.description)}\n`;

      const type = GluaApiWriter.transformType(field.type, field.callback);
      const optional = field.default ? '?' : '';
      api += `---@type ${type}${optional}\n`;
      api += `${struct.name}.${GluaApiWriter.safeName(field.name)} = ${field.default ? this.writeType(type, field.default) : 'nil'}\n\n`;
    }

    return api;
  }

  public writePages(pages: WikiPage[], filePath: string, index: number = 0) {
    if (!this.files.has(filePath)) this.files.set(filePath, []);

    pages.forEach(page => {
      this.files.get(filePath)!.push({ index: index, page: page });
    });
  }

  public getPages(filePath: string) {
    return this.files.get(filePath) ?? [];
  }

  public makeApiFromPages(pages: IndexedWikiPage[]) {
    let api = '';

    pages.sort((a, b) => a.index - b.index);

    // First we write the "header" types
    for (const page of pages.filter(x => isClass(x.page) || isLibrary(x.page) || isPanel(x.page))) {
      try {
        api += this.writePage(page.page);
      } catch (e) {
        console.error(`Failed to write 'header' page ${page.page.address}: ${e}`);
      }
    }

    for (const page of pages.filter(x => !isClass(x.page) && !isLibrary(x.page) && !isPanel(x.page))) {
      try {
        api += this.writePage(page.page);
      } catch (e) {
        console.error(`Failed to write page ${page.page.address}: ${e}`);
      }
    }

    return api;
  }

  public writeToDisk() {
    this.files.forEach((pages: IndexedWikiPage[], filePath: string) => {
      let api = this.makeApiFromPages(pages);

      if (api.length > 0) {
        fs.appendFileSync(filePath, '---@meta\n\n' + api);
      }
    });
  }

  public static transformType(type: string, callback?: FunctionCallback) {
    if (type === 'vararg')
      return 'any';

    // Convert `function` type to `fun(cmd: string, args: string):(returnValueName: string[]?)`
    if (type === 'function' && callback) {
      let callbackString = `fun(`;

      const callbackArgsLength = callback.arguments?.length || 0;

      for (let i = 0; i < callbackArgsLength; i++) {
        const arg = callback.arguments![i];

        if (!arg.name) {
          arg.name = `arg${i}`;
        }

        if (arg.type === 'vararg')
          arg.name = '...';

        callbackString += `${GluaApiWriter.safeName(arg.name)}: ${GluaApiWriter.transformType(arg.type)}${arg.default !== undefined ? `?` : ''}, `;
      }

      // Remove trailing comma and space
      if (callbackString.endsWith(', '))
        callbackString = callbackString.substring(0, callbackString.length - 2);

      callbackString += ')';

      if (callback.returns?.length) {
        callbackString += ':(';
      }

      const callbackReturnsLength = callback.returns?.length || 0;

      for (let i = 0; i < callbackReturnsLength; i++) {
        const ret = callback.returns![i];

        if (!ret.name) {
          ret.name = `ret${i}`;
        }

        if (ret.type === 'vararg')
          ret.name = '...';

        callbackString += `${ret.name}: ${this.transformType(ret.type)}${ret.default !== undefined ? `?` : ''}, `;
      }

      // Remove trailing comma and space
      if (callbackString.endsWith(', '))
        callbackString = callbackString.substring(0, callbackString.length - 2);

      if (callback.returns?.length) {
        callbackString += ')';
      }

      return callbackString;
    } else if (type.startsWith('table<') && !type.includes(',')) {
      // Convert `table<Player>` to `Player[]` for LuaLS (but leave table<x, y> untouched)
      let innerType = type.match(/<([^>]+)>/)?.[1];

      if (!innerType) throw new Error(`Invalid table type: ${type}`);

      return `${innerType}[]`;
    } else if (type.startsWith('table{') || type.startsWith('Panel{')) {
      // Convert `table{ToScreenData}` structures to `ToScreenData` class for LuaLS
      // Also converts `Panel{DVScrollBar}` to `DVScrollBar` class for LuaLS
      let innerType = type.match(/{([^}]+)}/)?.[1];

      if (!innerType) throw new Error(`Invalid table type: ${type}`);

      return innerType;
    } else if (type.startsWith('number{')) {
      // Convert `number{MATERIAL_FOG}` to `MATERIAL_FOG` enum for LuaLS
      let innerType = type.match(/{([^}]+)}/)?.[1];

      if (!innerType) throw new Error(`Invalid number type: ${type}`);

      return innerType;
    }

    return type;
  }

  private formatRealm(realm: Realm) {
    // Formats to show the image, with the realm as the alt text
    switch (realm) {
      case 'menu':
        return '![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9)';
      case 'client':
        return '![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808)';
      case 'server':
        return '![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1)';
      case 'shared':
        return '![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc)';
      case 'client and menu':
        return '![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981)';
      case 'shared and menu':
        return '![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4)';
      default:
        throw new Error(`Unknown realm: ${realm}`);
    }
  }

  private writeFunctionLuaDocComment(func: Function, args: FunctionArgument[] | undefined, realm: Realm) {
    let luaDocComment = `---${this.formatRealm(realm)} ${wrapInComment(func.description!)}\n`;
    luaDocComment += `---\n---[View wiki](${func.url})\n`;

    if (args) {
      args.forEach((arg, index) => {
        if (!arg.name)
          arg.name = arg.type;

        if (arg.type === 'vararg')
          arg.name = '...';

        // TODO: This splitting will fail in complicated cases like `table<string|number>|string`.
        // TODO: I'm assuming for now that there is no such case in the GMod API.
        // Split any existing types, append the (deprecated) alt and join them back together
        // while transforming each type to a LuaLS compatible type.
        let types = arg.type.split('|');

        if (arg.altType) {
          types.push(arg.altType);
        }

        let typesString = types.map(type => GluaApiWriter.transformType(type, arg.callback))
          .join('|');

        luaDocComment += `---@param ${GluaApiWriter.safeName(arg.name)}${arg.default !== undefined ? `?` : ''} ${typesString} ${wrapInComment(arg.description!)}\n`;
      });
    }

    if (func.returns) {
      func.returns.forEach(ret => {
        const description = wrapInComment(ret.description!);

        luaDocComment += `---@return `;

        if (ret.type === 'vararg')
          luaDocComment += 'any ...';
        else
          luaDocComment += `${GluaApiWriter.transformType(ret.type, ret.callback)}`;

        luaDocComment += ` # ${description}\n`;
      });
    }

    if (func.deprecated)
      luaDocComment += `---@deprecated ${removeNewlines(func.deprecated)}\n`;

    // TODO: Write a nice API to allow customizing API output from custom/
    // See https://github.com/luttje/glua-api-snippets/issues/65
    if (func.address === 'hook.Add') {
      luaDocComment += customPluginHookAdd(this, func);
    }

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
