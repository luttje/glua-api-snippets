import { ClassFunction, Enum, HookFunction, LibraryFunction, Struct, WikiPageMarkupScraper } from '../../src/scrapers/wiki-page-markup-scraper';
import { markup, json } from '../test-data/offline-sites/gmod-wiki/hook-player-initial-spawn';
import fetchMock from "jest-fetch-mock";

describe('GMod Wiki Page Markup Parse', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a library func markup', async () => {
    const markup = `<function name="GetScheduleID" parent="ai" type="libraryfunc">
      <description>Translates a schedule name to its corresponding ID.</description>
      <realm>Server</realm>
      <args>
        <arg name="sched" type="string">Then schedule name. In most cases, this will be the same as the <page>Enums/SCHED</page> name.</arg>
      </args>
      <rets>
        <ret name="" type="number">The schedule ID, see <page>Enums/SCHED</page>. Returns -1 if the schedule name isn't valid.</ret>
      </rets>
    </function>`;

    fetchMock.mockResponseOnce(markup);

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/ai.GetScheduleID?format=text',
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();
    
    expect(scrapeCallback(responseMock, markup)).toEqual([<LibraryFunction>{
      type: 'libraryfunc',
      parent: 'ai',
      name: 'GetScheduleID',
      description: 'Translates a schedule name to its corresponding ID.',
      realm: 'Server',
      arguments: [
        {
          name: 'sched',
          type: 'string',
          description: 'Then schedule name. In most cases, this will be the same as the Enums/SCHED name.',
        },
      ],
      returns: [
        {
          name: '',
          type: 'number',
          description: 'The schedule ID, see Enums/SCHED. Returns -1 if the schedule name isn\'t valid.',
        },
      ],
    }]);
  });

  it('should be able to parse a class function markup', async () => {
    const markup = `<function name="AllowsAutoSwitchTo" parent="Weapon" type="classfunc">
      <description>Returns whether the weapon allows to being switched to when a better ( <page>Weapon:GetWeight</page> ) weapon is being picked up.</description>
      <realm>Shared</realm>
      <rets>
        <ret name="" type="boolean">Whether the weapon allows to being switched to.</ret>
      </rets>
    </function>`;
    
    fetchMock.mockResponseOnce(markup);

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/Weapon:AllowsAutoSwitchTo?format=text',
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, markup)).toEqual([<ClassFunction>{
      type: 'classfunc',
      parent: 'Weapon',
      name: 'AllowsAutoSwitchTo',
      description: 'Returns whether the weapon allows to being switched to when a better ( Weapon:GetWeight ) weapon is being picked up.',
      realm: 'Shared',
      arguments: [],
      returns: [
        {
          name: '',
          type: 'boolean',
          description: 'Whether the weapon allows to being switched to.',
        },
      ],
    }]);
  });

  it('should be able to parse a hook function markup', async () => {
    fetchMock.mockResponseOnce(markup);

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/GM:PlayerInitialSpawn?format=text',
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, markup)).toEqual([<HookFunction>json]);
  });

  it('should be able to parse a enum markup', async () => {
    const markup = `<enum>
      <realm>Shared</realm>
      <description>\nEnumerations used by <page>ENTITY:Use</page>.\n\nNot to be confused with <page>Enums/_USE</page> used by <page>Entity:SetUseType</page>.\n</description>
      <items>
        <item key="USE_OFF" value="0"></item>
        <item key="USE_ON" value="1"></item>
        <item key="USE_SET" value="2"></item>
        <item key="USE_TOGGLE" value="3"></item>
      </items>
    </enum>`;
  
    fetchMock.mockResponseOnce(markup);

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/Enums/USE?format=text',
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, markup)).toEqual([<Enum>{
      name: 'USE',
      description: `\nEnumerations used by ENTITY:Use.\n\nNot to be confused with Enums/_USE used by Entity:SetUseType.\n`,
      realm: 'Shared',
      items: [
        {
          key: 'USE_OFF',
          value: '0',
          description: '',
        },
        {
          key: 'USE_ON',
          value: '1',
          description: '',
        },
        {
          key: 'USE_SET',
          value: '2',
          description: '',
        },
        {
          key: 'USE_TOGGLE',
          value: '3',
          description: '',
        },
      ],
    }]);
  });
  
  it('should be able to parse a structure markup', async () => {
    const markup = `<cat>struct</cat>
    <structure>
      <realm>Shared</realm>
      <description>Table used by various functions, such as <page>Entity:GetAttachment</page>.</description>
      <fields>
    <item name="Ang" type="Angle">Angle object</item>
    <item name="Pos" type="Vector">Vector object</item>
      </fields>
    
    </structure>`;
    
    fetchMock.mockResponseOnce(markup);

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/Structures/AngPos?format=text',
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, markup)).toEqual([<Struct>{
      name: 'AngPos',
      description: 'Table used by various functions, such as Entity:GetAttachment.',
      realm: 'Shared',
      fields: [
        {
          name: 'Ang',
          type: 'Angle',
          description: 'Angle object',
        },
        {
          name: 'Pos',
          type: 'Vector',
          description: 'Vector object',
        },
      ],
    }]);
  });
});