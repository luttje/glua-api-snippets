import { WikiPage } from '../../src/scrapers/wiki-page-markup-scraper';
import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';

describe('writeType', () => {
  describe('callback functions', () => {
    it('should write parameter names', async () => {
      const result = GluaApiWriter.transformType('function', {
        arguments: [
          { type: 'number', name: 'count' },
          { type: 'string', name: 'total' },
        ],
        returns: [
          { type: 'number', name: 'sum' },
          { type: 'string', name: 'limit' },
        ],
      });

      expect(result).toEqual('fun(count: number, total: string):(sum: number, limit: string)');
    });

    it('should write ret1, ret2, etc when parameter names are missing', async () => {
      const result = GluaApiWriter.transformType('function', {
        arguments: [
          { type: 'number', name: 'count' },
          { type: 'string', name: '' },
        ],
        returns: [
          { type: 'number', name: '' },
          { type: 'string', name: '' },
        ],
      });

      expect(result).toEqual('fun(count: number, arg1: string):(ret0: number, ret1: string)');
    });
  });
});
