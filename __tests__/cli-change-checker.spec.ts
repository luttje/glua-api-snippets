import { html } from './test-data/offline-sites/gmod-wiki/recent-changes';
import { main } from '../src/cli-change-checker';
import fetchMock from "jest-fetch-mock";
import { jest } from '@jest/globals';

const gitTags = [
  '2023-04-30_14-44-14',
  '2023-04-30_14-37-57',
  '2023-04-30_02-13-46',
  '2023-04-10_21-17-13',
  '2023-04-10_08-43-08',
  '2023-04-08_18-02-22',
]

describe('cli-change-checker', () => {
  let mockExit: jest.SpiedFunction<(code?: number | undefined) => never>;
  let mockConsoleError: jest.SpiedFunction<typeof console.error>;

  beforeEach(() => {
    mockExit = jest.spyOn(process, 'exit')
      .mockImplementation((code) => { 
        throw new Error(`Process.exit(${code})`); // Throw so normal execution doesn't continue
      });
    mockConsoleError = jest.spyOn(console, 'error')
      .mockImplementation(jest.fn());
    
    const baseUrl = 'https://wiki.facepunch.com/gmod/~recentchanges';
    fetchMock.mockResponseOnce(html, { url: baseUrl });
  });

  afterEach(() => {
    mockExit.mockRestore();
    mockConsoleError.mockRestore();
  });

  it('should exit with code 1 if no URL is provided', async () => {
    await expect(main({ url: '', gitTags: [] })).rejects.toThrow();
    expect(mockConsoleError).toHaveBeenCalledWith(expect.any(String));
    expect(mockExit).toHaveBeenCalledWith(1);
  });

  it('should exit with code 1 if no git tags are provided', async () => {
    await expect(main({ url: 'https://wiki.facepunch.com/gmod/~recentchanges', gitTags: [] })).rejects.toThrow();
    expect(mockConsoleError).toHaveBeenCalledWith(expect.any(String));
    expect(mockExit).toHaveBeenCalledWith(1);
  });

  it('should exit with code 1 if the tag does not exist and there are changes', async () => {
    await expect(main({ url: 'https://wiki.facepunch.com/gmod/~recentchanges', gitTags: ['invalid-tag-name'] })).rejects.toThrow();
    expect(mockExit).toHaveBeenCalledWith(1);
  });

  it('should exit with code 0 if the tag exists, meaning there is no changes', async () => {
    await expect(main({ url: 'https://wiki.facepunch.com/gmod/~recentchanges', gitTags })).resolves.not.toThrow();
  });
});