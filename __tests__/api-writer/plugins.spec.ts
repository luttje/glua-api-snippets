import { jest } from '@jest/globals';
import fs from 'fs';

import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import plugin from '../../custom/plugins/hook-add';

describe('plugins', () => {
  describe('hook-add', () => {
    const outputDirectory = './fake-output';

    beforeEach(() => {
      jest.spyOn(fs, 'readdirSync').mockReturnValue([
        { name: 'Move.json', isFile: () => true } as fs.Dirent,
        { name: 'PlayerLoadout.json', isFile: () => true } as fs.Dirent,
      ]);

      jest.spyOn(fs, 'readFileSync').mockImplementation((filePath: any) => {
        if (String(filePath).includes('Move.json')) {
          return JSON.stringify([{
            name: 'Move',
            type: 'hook',
            arguments: [{
              args: [
                { name: 'ply', type: 'Player' },
                { name: 'mv', type: 'CMoveData' },
              ]
            }],
            returns: [{ type: 'boolean' }],
          }]);
        }

        return JSON.stringify([{
          name: 'PlayerLoadout',
          type: 'hook',
          arguments: [{ args: [{ name: 'ply', type: 'Player' }] }],
        }]);
      });
    });

    afterEach(() => {
      jest.restoreAllMocks();
    });

    it('keeps documented return type', () => {
      const result = plugin({ outputDirectory } as GluaApiWriter, {} as any);

      expect(result).toContain(
        '---@overload fun(eventName: "Move", identifier: any, func: fun(ply: Player, mv: CMoveData):(boolean?))'
      );
    });

    it('defaults missing return to any', () => {
      const result = plugin({ outputDirectory } as GluaApiWriter, {} as any);

      expect(result).toContain(
        '---@overload fun(eventName: "PlayerLoadout", identifier: any, func: fun(ply: Player): any)'
      );
    });
  });
});