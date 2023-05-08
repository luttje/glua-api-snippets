import { apiDefinition as hookApiDefinition, json as hookJson } from '../test-data/offline-sites/gmod-wiki/hook-player-initial-spawn';
// import { apiDefinition as classFunctionApiDefinition, json as classFunctionJson } from '../test-data/offline-sites/gmod-wiki/class-function-weapon-allowsautoswitchto';
// import { apiDefinition as libraryFunctionApiDefinition, json as libraryFunctionJson } from '../test-data/offline-sites/gmod-wiki/library-function-ai-getscheduleid';
import { apiDefinition as structApiDefinition, markup as structMarkup, json as structJson } from '../test-data/offline-sites/gmod-wiki/struct-custom-entity-fields';
// import { apiDefinition as enumApiDefinition, json as enumJson } from '../test-data/offline-sites/gmod-wiki/enums-use';
import { LibraryFunction, WikiPage, WikiPageMarkupScraper } from '../../src/scrapers/wiki-page-markup-scraper';
import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import fetchMock from "jest-fetch-mock";

describe('GLua API Writer', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to write Lua API definitions directly from wiki json data', async () => {
    const writer = new GluaApiWriter();
    const api = writer.writePages([<WikiPage>hookJson]);

    expect(api).toEqual(hookApiDefinition);
  });
  
  it('should be able to write Lua API definitions directly from wiki json data for a struct', async () => {
    const writer = new GluaApiWriter();

    fetchMock.mockResponseOnce(structMarkup);

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/Custom_Entity_Fields?format=text',
    };

    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();
    const structs = await scrapeCallback(responseMock, structMarkup);
    expect(structs).toHaveLength(1);
    const api = writer.writePages(structs);
    expect(api).toEqual(structApiDefinition);
  });

  it('should write optional parameters with a question mark', () => {
    const writer = new GluaApiWriter();
    // Non-existant page, only to test the optional parameter
    const api = writer.writePage(<LibraryFunction>{
      name: 'Explode',
      address: 'Global.Explode',
      parent: '_G',
      dontDefineParent: true,
      description: 'Explodes with an optional intensity.',
      realm: 'Shared',
      type: 'libraryfunc',
      url: 'na',
      arguments: [
        {
          name: 'intensity',
          type: 'number',
          description: 'The intensity of the explosion.',
          default: '1000',
        },
      ],
      returns: [
        {
          type: 'number',
          description: 'The amount of damage done.',
        },
      ],
    });

    expect(api).toEqual(`---[SHARED] Explodes with an optional intensity.\n---\n---[(View on wiki)](na)\n---@param intensity? number The intensity of the explosion.\n---@return number #The amount of damage done.\nfunction _G.Explode(intensity) end\n\n`);
  });

  it('should allow overriding specific page addresses', () => {
    const writer = new GluaApiWriter();
    const override = Math.random().toString(36).substring(7);
    writer.addOverride(hookJson.address, override);

    const api = writer.writePages([<WikiPage>hookJson]);

    expect(api).toEqual(`${override}\n\n`);
  });
  
  it('should allow overriding specific class declarations', () => {
    const writer = new GluaApiWriter();
    const overrideStart = `---@class Custom_Entity_Fields : Parent`;
    const override = `${overrideStart}\n---{{CLASS_FIELDS}}\nlocal Custom_Entity_Fields = {}`;
    writer.addOverride('class.Custom_Entity_Fields', override);

    const api = writer.writePages([<WikiPage>structJson]);

    expect(api).toMatch(new RegExp(`^${overrideStart}`));
  });


  // it('should be able to write Annotated API files directly from wiki pages', async () => {
  //   const baseUrl = 'https://wiki.facepunch.com/gmod/GM:AcceptInput';
  //   fetchMock.mockResponseOnce(html, { url: baseUrl });
    
  //   const scraper = new WikiPageScraper(baseUrl);
  //   scraper.setChildPageFilter((url) => !url.includes('~'));
  //   const writer = new GluaApiWriter();
  //   let api = '';

  //   scraper.on('scraped', (url, pages) => {
  //     api += writer.writePages(pages);
  //   });

  //   await scraper.scrape();

  //   expect(api).toEqual(apiDefinition);
  // });

  // it('should throw if a page does not have a function', async () => {
  //   const baseUrl = 'https://wiki.facepunch.com/gmod/';
  //   const uselessHtml = '<html><body>Hello World</body></html>';
  //   fetchMock.mockResponseOnce(uselessHtml, { url: baseUrl });
    
  //   const scraper = new WikiPageScraper(baseUrl);
  //   scraper.setChildPageFilter((url) => !url.includes('~'));
  //   const writer = new GluaApiWriter();

  //   let count = 0;

  //   scraper.on('scraped', (url, pages) => {
  //     count++;
  //     expect(() => writer.writePages(pages)).toThrow();
  //   });

  //   await scraper.scrape();

  //   expect(count).toEqual(1);
  // });
  
  // it('should write functions without a class just fine', async () => {
  //   const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/Global/IsValid', 'Global/IsValid');
  //   mockWikiPage.realm = Realm.Shared;
  //   mockWikiPage.function = {
  //     name: 'IsValid',
  //     description: 'Checks if the given object is valid.',
  //     returns: [
  //       {
  //         type: 'boolean',
  //         description: 'If the object is valid.'
  //       }
  //     ],
  //     arguments: [
  //       {
  //         name: 'obj',
  //         type: 'any',
  //         description: 'The object to check.'
  //       },
  //     ],
  //   };

  //   const writer = new GluaApiWriter();
  //   const api = writer.writePage(mockWikiPage);

  //   expect(api).toEqual(`---[SHARED] Checks if the given object is valid.\n` +
  //     `---@param obj any The object to check.\n` +
  //     `---@return boolean If the object is valid.\n` +
  //     `function IsValid(obj) end\n\n`);
  // });
  
  // it('should write functions in a static global variable correctly', async () => {
  //   const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/ai.GetScheduleID', 'ai.GetScheduleID');
  //   mockWikiPage.realm = Realm.Server;
  //   mockWikiPage.function = {
  //     name: 'ai.GetScheduleID',
  //     description: 'Translates a schedule name to its corresponding ID.',
  //     returns: [
  //       {
  //         type: 'number',
  //         description: 'The schedule ID, see Enums/SCHED. Returns -1 if the schedule name isn\'t valid.'
  //       }
  //     ],
  //     arguments: [
  //       {
  //         name: 'sched',
  //         type: 'string',
  //         description: 'Then schedule name. In most cases, this will be the same as the Enums/SCHED name.'
  //       },
  //     ],
  //   };

  //   const writer = new GluaApiWriter();
  //   const api = writer.writePage(mockWikiPage);

  //   expect(api).toEqual(`ai = {}\n\n` +
  //     `---[SERVER] Translates a schedule name to its corresponding ID.\n` +
  //     `---@param sched string Then schedule name. In most cases, this will be the same as the Enums/SCHED name.\n` +
  //     `---@return number The schedule ID, see Enums/SCHED. Returns -1 if the schedule name isn't valid.\n` +
  //     `function ai.GetScheduleID(sched) end\n\n`);
  // });
  
  // it('should write functions with arguments with a slash in their name correctly', async () => {
  //   const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/surface.GetTextureID', 'surface.GetTextureID');
  //   mockWikiPage.realm = Realm.Client;
  //   mockWikiPage.function = {
  //     name: "surface.GetTextureID",
  //     description: "Returns the texture id of the material with the given name/path, for use with surface.SetTexture.",
  //     arguments: [
  //       {
  //         "name": "name/path",
  //         "type": "string",
  //         "description": "Name or path of the texture."
  //       }
  //     ],
  //     returns: [
  //       {
  //         "type": "number",
  //         "description": "The texture ID"
  //       }
  //     ]
  //   }

  //   const writer = new GluaApiWriter();
  //   const api = writer.writePage(mockWikiPage);

  //   expect(api).toEqual(`surface = {}\n\n` +
  //     `---[CLIENT] Returns the texture id of the material with the given name/path, for use with surface.SetTexture.\n` +
  //     `---@param nameOrPath string Name or path of the texture.\n` +
  //     `---@return number The texture ID\n` +
  //     `function surface.GetTextureID(nameOrPath) end\n\n`);
  // });
  
  // it('should write functions with arguments with a default value in their name correctly', async () => {
  //   const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/ControlPanel:MatSelect', 'ControlPanel:MatSelect');
  //   mockWikiPage.realm = Realm.Client;
  //   mockWikiPage.function = {
  //     "name": "MatSelect",
  //     "className": "ControlPanel",
  //     "description": "Creates a MatSelect panel and adds it as an item.",
  //     "arguments": [
  //       {
  //         "name": "convar",
  //         "type": "string",
  //         "description": "Calls MatSelect:SetConVar with this value."
  //       },
  //       {
  //         "name": "options = nil",
  //         "type": "table",
  //         "description": "If specified, calls MatSelect:AddMaterial(key, value) for each table entry. If the table key is a number, the function will instead be called with the value as both arguments."
  //       },
  //       {
  //         "name": "autostretch = nil",
  //         "type": "boolean",
  //         "description": "If specified, calls MatSelect:SetAutoHeight with this value."
  //       },
  //       {
  //         "name": "width = nil",
  //         "type": "number",
  //         "description": "If specified, calls MatSelect:SetItemWidth with this value."
  //       },
  //       {
  //         "name": "height = nil",
  //         "type": "number",
  //         "description": "If specified, calls MatSelect:SetItemHeight with this value."
  //       }
  //     ],
  //     "returns": [
  //       {
  //         "type": "MatSelect",
  //         "description": "The created MatSelect panel."
  //       }
  //     ]
  //   }

  //   const writer = new GluaApiWriter();
  //   const api = writer.writePage(mockWikiPage);

  //   expect(api).toEqual(`---@class ControlPanel\n` +
  //     `local ControlPanel = {}\n\n` +
  //     `---[CLIENT] Creates a MatSelect panel and adds it as an item.\n` +
  //     `---@param convar string Calls MatSelect:SetConVar with this value.\n` +
  //     `---@param options table If specified, calls MatSelect:AddMaterial(key, value) for each table entry. If the table key is a number, the function will instead be called with the value as both arguments.\n` +
  //     `---@param autostretch boolean If specified, calls MatSelect:SetAutoHeight with this value.\n` +
  //     `---@param width number If specified, calls MatSelect:SetItemWidth with this value.\n` +
  //     `---@param height number If specified, calls MatSelect:SetItemHeight with this value.\n` +
  //     `---@return MatSelect The created MatSelect panel.\n` +
  //     `function ControlPanel:MatSelect(convar, options, autostretch, width, height) end\n\n`);
  // });

  it.each([
    ['and', '_and'],
    ['break', '_break'],
    ['continue', '_continue'],
    ['do', '_do'],
    ['else', '_else'],
    ['elseif', '_elseif'],
    ['end', '_end'],
    ['false', '_false'],
    ['for', '_for'],
    ['function', '_function'],
    ['goto', '_goto'],
    ['if', '_if'],
    ['in', '_in'],
    ['local', '_local'],
    ['nil', '_nil'],
    ['not', '_not'],
    ['or', '_or'],
    ['repeat', '_repeat'],
    ['return', '_return'],
    ['then', '_then'],
    ['true', '_true'],
    ['until', '_until'],
    ['while', '_while'],
  ])('should make %s safe as a variable/argument name', async (input, output) => {
    expect(GluaApiWriter.safeName(input)).toEqual(output);
  });
  
  it.each([
    ['some/another', 'someOrAnother'],
    ['some/another/thing', 'someOrAnotherOrThing'],
    ['with a space?', 'withASpace'],
    ['not allowed=true', 'notAllowed'],
    ['at least 3', 'atLeast3'],
    ['mixed of_123', 'mixedOf123'], // TODO: this is inconsistent
    ['underscores_are_ok', 'underscores_are_ok'],  // TODO: with this
  ])('should make %s safe as a variable/argument name', async (input, output) => {
    expect(GluaApiWriter.safeName(input)).toEqual(output);
  });

  // it('should fallback to type for an unnamed argument', async () => {
  //   const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/CMoveData:SetConstraintSpeedScale', 'CMoveData:SetConstraintSpeedScale');
  //   mockWikiPage.realm = Realm.Shared;
  //   mockWikiPage.function = {
  //     "name": "SetConstraintSpeedScale",
  //     "className": "CMoveData",
  //     "description": "Sets the player movement constraint speed scale. This will be applied to the player within the constraint radius when approaching its edge.",
  //     "arguments": [
  //       {
  //         "type": "number",
  //         "description": "The constraint speed scale"
  //       }
  //     ],
  //     "returns": []
  //   };

  //   const writer = new GluaApiWriter();
  //   const api = writer.writePage(mockWikiPage);

  //   expect(api).toEqual(`---@class CMoveData\n` +
  //     `local CMoveData = {}\n\n` +
  //     `---[SHARED] Sets the player movement constraint speed scale. This will be applied to the player within the constraint radius when approaching its edge.\n` +
  //     `---@param number number The constraint speed scale\n` +
  //     `function CMoveData:SetConstraintSpeedScale(number) end\n\n`);

  // });

  // it('should write functions with varargs correctly', async () => {
  //   const mockWikiPage = new WikiPage('https://wiki.facepunch.com/gmod/Global.assert', 'Global.assert');
  //   mockWikiPage.realm = Realm.Shared;
  //   mockWikiPage.function = {
  //     name: 'assert',
  //     description: 'If the result of the first argument is false or nil, an error is thrown with the second argument as the message.',
  //     returns: [
  //       {
  //         type: 'any',
  //         description: 'If successful, returns the first argument.'
  //       },
  //       {
  //         type: 'any',
  //         description: 'If successful, returns the error message. This will be nil if the second argument wasn\'t specified.\n\nSince the second argument is only type-checked if the assertion fails, this doesn\'t have to be a string.'
  //       },
  //       {
  //         type: 'vararg',
  //         description: 'Returns any arguments past the error message.'
  //       },
  //     ],
  //     arguments: [
  //       {
  //         name: 'expression',
  //         type: 'any',
  //         description: 'The expression to assert.'
  //       },
  //       {
  //         name: 'errorMessage',
  //         type: 'string',
  //         description: 'The error message to throw when assertion fails. This is only type-checked if the assertion fails.'
  //       },
  //       {
  //         name: 'returns',
  //         type: 'vararg',
  //         description: 'Any arguments past the error message will be returned by a successful assert.'
  //       },
  //     ],
  //   };

  //   const writer = new GluaApiWriter();
  //   const api = writer.writePage(mockWikiPage);

  //   expect(api).toEqual(`---[SHARED] If the result of the first argument is false or nil, an error is thrown with the second argument as the message.\n` +
  //     `---@param expression any The expression to assert.\n` +
  //     `---@param errorMessage string The error message to throw when assertion fails. This is only type-checked if the assertion fails.\n` +
  //     `---@param ... ... Any arguments past the error message will be returned by a successful assert.\n` +
  //     `---@return any, any, ... any - If successful, returns the first argument.\n` +
  //     `---@return any, any, ... any - If successful, returns the error message. This will be nil if the second argument wasn't specified.  Since the second argument is only type-checked if the assertion fails, this doesn't have to be a string.\n` +
  //     `---@return any, any, ... ... - Returns any arguments past the error message.\n` +
  //     `function assert(expression, errorMessage, ...) end\n\n`);
  // });
});
