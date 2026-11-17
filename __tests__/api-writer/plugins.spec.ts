import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import { LibraryFunction } from '../../src/scrapers/wiki-page-markup-scraper';

describe('plugins', () => {
  it('should add an overload per built-in meta table to FindMetaTable', () => {
    const writer = new GluaApiWriter();
    const api = writer.writePage(<LibraryFunction>{
      name: 'FindMetaTable',
      address: 'Global.FindMetaTable',
      parent: '_G',
      dontDefineParent: true,
      description: 'Returns the meta table for the class with the matching name.',
      realm: 'shared and menu',
      type: 'libraryfunc',
      url: 'na',
      arguments: [
        {
          args: [{
            name: 'metaName',
            type: 'string',
            description: 'The object type to retrieve the meta table of.',
          }]
        }
      ],
      returns: [
        {
          type: 'table|nil',
          description: 'The corresponding meta table.',
        },
      ],
    });

    expect(api).toContain('---@return table|nil # The corresponding meta table.\n');
    expect(api).toContain('---@overload fun(metaName: "Entity"): Entity|table\n');
    expect(api).toContain('---@overload fun(metaName: "Color"): Color|table\nfunction _G.FindMetaTable(metaName) end');
  });

  it('should write plugin annotations', async () => {
    expect(true).toBe(true);
    // TODO: This test is commented since it requires the wiki to have been scraped so ./output/gm is filled, which isn't the case for the CI
    // const writer = new GluaApiWriter();
    // const api = writer.writePage(<LibraryFunction>{
    //   name: 'Add',
    //   address: 'hook.Add',
    //   parent: 'hook',
    //   dontDefineParent: true,
    //   description: '',
    //   realm: 'shared',
    //   type: 'libraryfunc',
    //   url: 'na',
    //   arguments: [
    //     {
    //       args: [{
    //         name: 'intensity',
    //         type: 'number',
    //         description: 'The intensity of the explosion.',
    //         default: '1000',
    //       }]
    //     }
    //   ],
    //   returns: [
    //     {
    //       type: 'number',
    //       description: 'The amount of damage done.',
    //     },
    //   ],
    // });

    // expect(api).toContain('---@overload fun(eventName: "Move", identifier: any, func: fun(ply: Player, mv: CMoveData):(boolean?))');
  });
});
