// import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
// import { LibraryFunction } from '../../src/scrapers/wiki-page-markup-scraper';

describe('plugins', () => {
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
