import { ScrapeCallback, Scraper } from './scraper.js';
import { deserializeXml } from '../utils/xml.js';

export type WikiFunctionType = 'panelfunc' | 'classfunc' | 'libraryfunc' | 'hook';
export type Realm = 'Menu' | 'Client' | 'Server' | 'Shared' | 'Client and menu';

export type CommonWikiProperties = {
  type: WikiFunctionType | 'enum' | 'struct';
  name: string;
  description: string;
  realm: Realm;
  url: string;
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
export type LibraryFunction = Function & {};
export type HookFunction = Function & {
  type: 'hook';
  isHook: 'yes';
};

export type PanelFunction = Function & {
  type: 'panelfunc';
  isPanel: 'yes';
};

export type EnumValue = {
  key: string;
  value: string;
  description: string;
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
};

export type Struct = CommonWikiProperties & {
  type: 'struct';
  fields: StructField[];
};

export type WikiPage = ClassFunction | LibraryFunction | HookFunction | PanelFunction | Enum | Struct;

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

export function isEnum(page: WikiPage): page is Enum {
  return page.type === 'enum';
}

export function isStruct(page: WikiPage): page is Struct {
  return page.type === 'struct';
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
        const mainElement = $(isEnum ? 'enum' : isStruct ? 'struct' : 'function').first();
        const name = response.url.split('/').pop()!.split('?')[0];

        if (isEnum) {
          const items = $('items item').map(function() {
            const $el = $(this);
            return <EnumValue> {
              key: $el.attr('key')!,
              value: $el.attr('value')!,
              description: $el.text()
            };
          }).get();

          return <Enum>{
            type: 'enum',
            name,
            description: $('description').text(),
            realm: $('realm').text() as Realm,
            items
          };
        } else if (isStruct) {
          const fields = $('fields item').map(function() {
            const $el = $(this);
            return <StructField> {
              name: $el.attr('name')!,
              type: $el.attr('type')!,
              default: $el.attr('default'),
              description: $el.text()
            };
          }).get();

          return <Struct>{
            type: 'struct',
            name,
            description: $('description').text(),
            realm: $('realm').text() as Realm,
            fields
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

            if ($el.attr('default'))
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
            description: $('description:first').text(),
            realm: $('realm:first').text() as Realm,
            arguments: arguments_,
            returns
          };

          if (isClassFunction) {
            return <ClassFunction> {
              ...base,
              type: 'classfunc'
            };
          } else if (isLibraryFunction) {
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
              isPanel: 'yes'
            };
          }
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