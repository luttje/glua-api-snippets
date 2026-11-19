import { ScrapeCallback, Scraper } from './scraper.js';
import { deserializeXml } from '../utils/xml.js';
import { AnyNode, Cheerio, CheerioAPI } from 'cheerio';
import { Element as DOMElement } from 'domhandler';

export type WikiFunctionType = 'panelfunc' | 'classfunc' | 'libraryfunc' | 'hook';
export type Realm = 'menu' | 'client' | 'server' | 'shared' | 'client and menu' | 'shared and menu';

export type CommonWikiProperties = {
  type: WikiFunctionType | 'enum' | 'struct' | 'panel' | 'class' | 'library';
  address: string;
  name: string;
  description: string;
  realm: Realm;
  url: string;
  deprecated?: string;
}

export type WikiIdentifier = {
  name: string;
  type: string;
  description?: string;
};

export type FunctionCallback = {
  arguments: FunctionArgument[];
  returns: FunctionReturn[];
};

export type FunctionArgument = WikiIdentifier & {
  default?: string;
  altType?: string;
  callback?: FunctionCallback;
};

export type FunctionArgumentList = {
  args?: FunctionArgument[];
};

export type FunctionReturn = WikiIdentifier & {
  default?: string;
  callback?: FunctionCallback;
};

export type Function = CommonWikiProperties & {
  parent: string;
  arguments?: FunctionArgumentList[];
  returns?: FunctionReturn[];
};

export type ClassFunction = Function & {};
export type LibraryFunction = Function & {
  type: 'libraryfunc';
  dontDefineParent?: boolean;
};
export type HookFunction = Function & {
  type: 'hook';
  isHook: 'yes';
};

export type PanelFunction = Function & {
  type: 'panelfunc';
  isPanelFunction: 'yes';
};

export type EnumValue = {
  key: string;
  value: string;
  description: string;
  deprecated?: string;
};

export type Enum = CommonWikiProperties & {
  type: 'enum';
  items: EnumValue[];
};

export type StructField = {
  name: string;
  type: string;
  default?: any;
  description: string;
  deprecated?: string;
  callback?: FunctionCallback;
};

export type Struct = CommonWikiProperties & {
  type: 'struct';
  fields: StructField[];
};

export type Panel = CommonWikiProperties & {
  type: 'panel';
  parent: string;
};


export type TypePage = CommonWikiProperties & {
  parent: string;
};

export type WikiPage = ClassFunction | LibraryFunction | HookFunction | PanelFunction | Panel | Enum | Struct | TypePage

/**
 * Guards
 */
export function isClassFunction(page: WikiPage): page is ClassFunction {
  return page.type === 'classfunc';
}

export function isLibraryFunction(page: WikiPage): page is LibraryFunction {
  return page.type === 'libraryfunc';
}

export function isHookFunction(page: WikiPage): page is HookFunction {
  return page.type === 'hook';
}

export function isPanelFunction(page: WikiPage): page is PanelFunction {
  return page.type === 'panelfunc';
}

export function isPanel(page: WikiPage): page is Panel {
  return page.type === 'panel';
}

export function isEnum(page: WikiPage): page is Enum {
  return page.type === 'enum';
}

export function isStruct(page: WikiPage): page is Struct {
  return page.type === 'struct';
}

export function isLibrary(page: WikiPage): page is TypePage {
  return page.type === 'library';
}

export function isClass(page: WikiPage): page is TypePage {
  return page.type === 'class';
}

// Handle things like <page> tags, <warning>, etc.
const classBlocks = ["internal", "note", "warning"];
export function markdownifyDescription($: CheerioAPI, e: Cheerio<AnyNode>): string {
  // <page> => markdown []()
  for (const page of $(e).find('page')) {
    const $p = $(page);
    const url = $p.text();
    const text = $p.attr("text") || url;
    $p.replaceWith(`[${text}](${url})`);
  }

  for (const className of classBlocks) {
    for (const block of $(e).find(className)) {
      const $b = $(block);
      let text = markdownifyDescription($, $b).trim();
      if (className === 'internal' && text === '') text = `This is used internally - although you're able to use it you probably shouldn't.`;
      $b.replaceWith(`**${className.toUpperCase()}**: ${text}\n`);
    }
  }

  let description = $(e).text();

  // Fixup []() that use local URLs. This is not exclusive to the result of <page> conversions
  description = description.replace(/\[([^\]]+)\]\(([^)"]+)(?: \"([^\"]+)\")?\)/g, function (match, text, url) {
    if (url.indexOf("://") == -1) {
      url = url.replace(/ /g, "_");
      return `[${text}](https://wiki.facepunch.com/gmod/${url})`;
    }

    return match;
  });

  return description;
};

// Extract <callback> in a description of an argument/return
function handleCallbackInDescription($: CheerioAPI, e: AnyNode): [string?, FunctionCallback?] {
  let description: string = "";
  let callback: FunctionCallback = undefined!;

  for (const node of $(e).contents()) {
    if ((node as DOMElement).name?.toLowerCase() === "callback") {
      callback = <FunctionCallback>{ arguments: [], returns: [] };

      for (const arg of $(node).find("arg")) {
        const $el = $(arg);
        callback.arguments.push(<FunctionArgument>{
          name: $el.attr('name')!,
          type: $el.attr('type')!,
          default: $el.attr('default'),
          description: $el.text()
        });
      }
      for (const ret of $(node).find("ret")) {
        const $el = $(ret);
        callback.returns.push(<FunctionReturn>{
          name: $el.attr('name')!,
          type: $el.attr('type')!,
          default: $el.attr('default'),
          description: $el.text()
        });
      }

      if (callback?.arguments.length > 0) {
        description += "\n\nFunction argument(s):\n";
        for (const arg of callback.arguments) {
          description += `* ${arg.type} \`${arg.name}\` - ${arg.description}\n`;
        }
      }
      if (callback?.returns.length > 0) {
        description += "\nFunction return value(s):\n";
        for (const ret of callback.returns) {
          description += `* ${ret.type} \`${ret.name}\` - ${ret.description}\n`;
        }
      }
    } else {
      description += markdownifyDescription($, $(node));
    }
  }

  return [description, callback];
}

/**
 * Scraper
 */
export class WikiPageMarkupScraper extends Scraper<WikiPage> {
  /**
   * @param response The response from the page
   * @param content The content of the request
   *
   * @returns A list containing only the scraped page
   */
  public getScrapeCallback(): ScrapeCallback<WikiPage> {
    return (response: Response, content: string): WikiPage[] => {
      const pageOrPages = deserializeXml<WikiPage | WikiPage[] | null>(content, ($) => {
        const isEnum = $('enum').length > 0;
        const isStruct = $('structure').length > 0;
        const isFunction = $('function').length > 0;
        const isTypePage = $('type').length > 0;
        const isPanel = $('panel').length > 0;
        const mainElement = $(isEnum ? 'enum' : isStruct ? 'struct' : isPanel ? 'panel' : 'function');
        const isDeprecated = $('deprecated').length > 0;
        const address = response.url.split('/').pop()!.split('?')[0];

        let deprecated: string | undefined = undefined;
        if (isDeprecated && !isEnum && !isStruct) {
          deprecated = $('deprecated').map(function () {
            const $el = $(this);
            return $el.text().trim();
          }).get().join(' - ');

          $('deprecated').remove();
        }

        if (isEnum) {
          // Some pages like https://wiki.facepunch.com/gmod/Enums/STENCIL specify multiple enums.
          // To handle this we merge the items of all the enums into one array so they can be
          // put into a single 'enum'. This is not ideal, as descriptions also need to be merged.
          // TODO: Are there other pages like this, like for structs?
          const items = $('items item').map(function () {
            const $el = $(this);
            const deprecated = $el.find('deprecated').map(function () {
              const $el = $(this);
              return $el.text().trim();
            }).get().join(' - ');

            return <EnumValue>{
              key: $el.attr('key')!,
              value: $el.attr('value')!,
              description: markdownifyDescription($, $el),
              ...deprecated && { deprecated }
            };
          }).get();

          const $el = $('enum');

          return <Enum>{
            type: 'enum',
            name: address,
            address: address,
            description: $el.length > 1
              ? $el.map(function () {
                return $(this).map(function () {
                  const enumerations = $(this)
                    .find('items item')
                    .map(function () {
                      return '`' + $(this).attr('key') + '`';
                    })
                    .get()
                    .join(', ');

                  return `### ${enumerations}\n${markdownifyDescription($, $el.find('description'))}`;
                })
                  .get()
                  .join(', ');
              })
                .get()
                .join('\n')
              : markdownifyDescription($, $el.find('description')),
            realm: $el.first().find('realm').text().toLowerCase() as Realm,
            items
          };
        } else if (isStruct) {
          const fields = $('fields item').map(function () {
            const $el = $(this);
            const deprecated = $el.find('deprecated').map(function () {
              const $el = $(this);
              return $el.text().trim();
            }).get().join(' - ');

            const structField = <StructField>{
              name: $el.attr('name')!,
              type: $el.attr('type')!,
              default: $el.attr('default'),
              deprecated: deprecated || undefined,
            };

            const callbackRes = handleCallbackInDescription($, this);
            structField.description = callbackRes[0] ?? "";
            structField.callback = callbackRes[1];

            return structField;
          }).get();

          return <Struct>{
            type: 'struct',
            name: address,
            address: address,
            description: markdownifyDescription($, $('structure description')),
            realm: $('realm').text().toLowerCase() as Realm,
            fields,
            deprecated
          };
        } else if (isPanel) {
          return <Panel>{
            type: 'panel',
            name: address,
            address: address,
            description: markdownifyDescription($, $('panel description')),
            realm: $('realm').text().toLowerCase() as Realm,
            parent: $('parent').text(),
            deprecated
          };
        } else if (isFunction) {
          const isClassFunction = mainElement.attr('type') === 'classfunc';
          const isLibraryFunction = mainElement.attr('type') === 'libraryfunc';
          const isHookFunction = mainElement.attr('type') === 'hook';
          const isPanelFunction = mainElement.attr('type') === 'panelfunc';

          const argumentList: FunctionArgumentList[] = [];
          for (const argSet of $('args')) {
            const setArguments = $(argSet).find('> arg');

            const arguments_ = setArguments.map(function () {
              const $el = $(this);
              const argument = <FunctionArgument>{
                name: $el.attr('name')!,
                type: $el.attr('type')!,
                altType: $el.attr('alttype')!,
              };

              const callbackRes = handleCallbackInDescription($, this);
              argument.description = callbackRes[0];
              argument.callback = callbackRes[1];

              if ($el.attr('default') != undefined)
                argument.default = $el.attr('default')!;

              return argument;
            }).get();

            argumentList.push({ args: arguments_ });
          }

          const returns = $('rets > ret').map(function () {
            const $el = $(this);
            const ret = <FunctionReturn>{
              name: $el.attr('name')!,
              type: $el.attr('type')!
            };

            const callbackRes = handleCallbackInDescription($, this);
            ret.description = callbackRes[0];
            ret.callback = callbackRes[1];

            return ret;
          }).get();

          const realm = $('realm').text().toLowerCase().trim() as Realm;
          const base = <Function>{
            type: mainElement.attr('type')!,
            parent: mainElement.attr('parent')!,
            name: mainElement.attr('name')!,
            address: address,
            description: markdownifyDescription($, $('description:first')),
            realm: realm,
            arguments: argumentList,
            returns,
            deprecated
          };

          if (isClassFunction) {
            return <ClassFunction>{
              ...base,
              type: 'classfunc'
            };
          } else if (isLibraryFunction) {
            if (base.parent === 'Global') {
              base.parent = '_G';
              (<LibraryFunction>base).dontDefineParent = true;
            }

            return <LibraryFunction>{
              ...base,
              type: 'libraryfunc'
            };
          } else if (isHookFunction) {
            return <HookFunction>{
              ...base,
              type: 'hook',
              isHook: 'yes'
            };
          } else if (isPanelFunction) {
            return <PanelFunction>{
              ...base,
              type: 'panelfunc',
              isPanelFunction: 'yes'
            };
          }
        } else if (isTypePage) {
          const $el = $('type');

          return <TypePage>{
            type: $el.attr('is'),
            name: $el.attr('name'),
            parent: $el.attr('parent'),
            address: address,
            description: markdownifyDescription($, $('type summary')),
            deprecated: deprecated
          };
        }

        return null;
      });

      if (!pageOrPages)
        return [];

      const pages = Array.isArray(pageOrPages) ? pageOrPages : [pageOrPages];

      for (const page of pages) {
        page.url = response.url.replace(/\?format=text$/, '');
      }

      return pages;
    };
  }
}
