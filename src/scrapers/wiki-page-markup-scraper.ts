import { ScrapeCallback, Scraper } from './scraper.js';
import { deserializeXml } from '../utils/xml.js';

export type WikiFunctionType = 'panelfunc' | 'classfunc' | 'libraryfunc' | 'hook';
export type Realm = 'Menu' | 'Client' | 'Server' | 'Shared' | 'Client and menu';

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

export type FunctionArgument = WikiIdentifier & {
  default?: string;
};

export type FunctionReturn = WikiIdentifier & {};

export type Function = CommonWikiProperties & {
  parent: string;
  arguments?: FunctionArgument[];
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
      const page = deserializeXml<WikiPage | null>(content, ($) => {
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
          deprecated = $('deprecated').map(function() {
            const $el = $(this);
            return $el.text().trim();
          }).get().join(' - ');

          $('deprecated').remove();
        }

        if (isEnum) {
          const items = $('items item').map(function () {
            const $el = $(this);
            const deprecated = $el.find('deprecated').map(function() {
              const $el = $(this);
              return $el.text().trim();
            }).get().join(' - ');

            return <EnumValue>{
              key: $el.attr('key')!,
              value: $el.attr('value')!,
              description: $el.text(),
              deprecated: deprecated || undefined,
            };
          }).get();

          return <Enum>{
            type: 'enum',
            name: address,
            address: address,
            description: $('description').text(),
            realm: $('realm').text() as Realm,
            items
          };
        } else if (isStruct) {
          const fields = $('fields item').map(function () {
            const $el = $(this);
            const deprecated = $el.find('deprecated').map(function() {
              const $el = $(this);
              return $el.text().trim();
            }).get().join(' - ');

            return <StructField>{
              name: $el.attr('name')!,
              type: $el.attr('type')!,
              default: $el.attr('default'),
              description: $el.text(),
              deprecated: deprecated || undefined,
            };
          }).get();

          return <Struct>{
            type: 'struct',
            name: address,
            address: address,
            description: $('description').text(),
            realm: $('realm').text() as Realm,
            fields,
            deprecated
          };
        } else if (isPanel) {
          return <Panel>{
            type: 'panel',
            name: address,
            address: address,
            description: $('description').text(),
            realm: $('realm').text() as Realm,
            parent: $('parent').text(),
            deprecated
          };
        } else if (isFunction) {
          const isClassFunction = mainElement.attr('type') === 'classfunc';
          const isLibraryFunction = mainElement.attr('type') === 'libraryfunc';
          const isHookFunction = mainElement.attr('type') === 'hook';
          const isPanelFunction = mainElement.attr('type') === 'panelfunc';

          const arguments_ = $('args arg').map(function() {
            const $el = $(this);
            const argument = <FunctionArgument> {
              name: $el.attr('name')!,
              type: $el.attr('type')!,
              description: $el.text()
            };

            if ($el.attr('default') != undefined)
              argument.default = $el.attr('default')!;

            return argument;
          }).get();

          const returns = $('rets ret').map(function() {
            const $el = $(this);
            return <FunctionReturn> {
              name: $el.attr('name')!,
              type: $el.attr('type')!,
              description: $el.text()
            };
          }).get();

          const base = <Function> {
            type: mainElement.attr('type')!,
            parent: mainElement.attr('parent')!,
            name: mainElement.attr('name')!,
            address: address,
            description: $('description:first').text(),
            realm: $('realm:first').text() as Realm,
            arguments: arguments_,
            returns,
            deprecated
          };

          if (isClassFunction) {
            return <ClassFunction> {
              ...base,
              type: 'classfunc'
            };
          } else if (isLibraryFunction) {
            if (base.parent === 'Global') {
              base.parent = '_G';
              (<LibraryFunction>base).dontDefineParent = true;
            }

            return <LibraryFunction> {
              ...base,
              type: 'libraryfunc'
            };
          } else if (isHookFunction) {
            return <HookFunction> {
              ...base,
              type: 'hook',
              isHook: 'yes'
            };
          } else if (isPanelFunction) {
            return <PanelFunction> {
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
            description: $('type summary').text(),
            deprecated: deprecated
          };
        }

        return null;
      });

      if (!page)
        return [];

      page.url = response.url.replace(/\?format=text$/, '');

      return [page];
    };
  }
}
