import { convertWindowsToUnixPath, walk, zipFiles } from '../src/filesystem';
import path from 'path';
import fs from 'fs';
import os from 'os';

describe('convertWindowsToUnixPath', () => {
  it('should convert a Windows path to a Unix path', () => {
    const windowsPath = 'C:\\Users\\me\\Documents\\file.txt';
    const unixPath = convertWindowsToUnixPath(windowsPath);

    expect(unixPath).toBe('/c/Users/me/Documents/file.txt');
  });

  it('should convert a Windows path to a Unix path with a space in the path', () => {
    const windowsPath = 'C:\\Users\\me\\Documents\\My Folder\\file.txt';
    const unixPath = convertWindowsToUnixPath(windowsPath);

    expect(unixPath).toBe('/c/Users/me/Documents/My Folder/file.txt');
  });

  it('should convert a Windows path to a Unix path with a space in the file name', () => {
    const windowsPath = 'C:\\Users\\me\\Documents\\file name.txt';
    const unixPath = convertWindowsToUnixPath(windowsPath);

    expect(unixPath).toBe('/c/Users/me/Documents/file name.txt');
  });
});

describe('walk', () => {
  it('should return an array of file paths', () => {
    const files = walk('./src/api-writer').map(file => convertWindowsToUnixPath(file));

    expect(files).toContain(convertWindowsToUnixPath('./src/api-writer/glua-api-writer.ts'));
  });

  describe('with temporary test files', () => {
    let testDirectory = '';

    beforeEach(() => {
      testDirectory = path.join(os.tmpdir(), 'glua-wiki-filter');
      fs.mkdirSync(testDirectory, { recursive: true });

      fs.writeFileSync(path.join(testDirectory, 'test.txt'), 'test');

      fs.mkdirSync(path.join(testDirectory, 'subdir'));

      fs.writeFileSync(path.join(testDirectory, 'subdir', 'test2.txt'), 'test2');
    });

    afterEach(() => {
      fs.rmSync(testDirectory, { recursive: true });
    });

    it('should be able to filter directories', () => {
      const files = walk(testDirectory, (fileOrDirectory, isDirectory) => !isDirectory);

      expect(files).toContain(path.join(testDirectory, 'test.txt'));
      expect(files).not.toContain(path.join(testDirectory, 'subdir'));
    });
  });
});

describe('zipFiles', () => {
  let outputDirectory = '';
  let testDirectory = '';

  beforeEach(() => {
    outputDirectory = path.join(os.tmpdir(), 'glua-wiki-filter-output');
    fs.mkdirSync(outputDirectory, { recursive: true });
    testDirectory = path.join(os.tmpdir(), 'glua-wiki-filter');
    fs.mkdirSync(testDirectory, { recursive: true });

    fs.writeFileSync(path.join(testDirectory, 'test.json'), 'test');

    fs.mkdirSync(path.join(testDirectory, 'subdir'));

    fs.writeFileSync(path.join(testDirectory, 'subdir', 'test2.txt'), 'test2');
  });

  afterEach(() => {
    fs.rmSync(testDirectory, { recursive: true });
    fs.rmSync(outputDirectory, { recursive: true, force: true });
  });

  it('should be able to zip all files', async () => {
    const files = walk(testDirectory);
    const archivePath = path.join(outputDirectory, 'archive.zip');
    const archive = await zipFiles(archivePath, files);
    const size = archive.pointer();

    expect(fs.existsSync(archivePath)).toBe(true);
    expect(size).toBeCloseTo(453, -1); // allow a margin of error of 5 bytes (TODO: do we need this?)
  });

  it('should be able to zip all files not in a subdirectory', async () => {
    const files = walk(testDirectory, (_, isDirectory) => !isDirectory);
    const archivePath = path.join(outputDirectory, 'archive.zip');
    const archive = await zipFiles(archivePath, files);
    const size = archive.pointer();

    expect(fs.existsSync(archivePath)).toBe(true);
    expect(size).toBeCloseTo(230, -1); // allow a margin of error of 5 bytes (TODO: do we need this?)
  });

  it('should be able to zip all files with an extension and one specific file', async () => {
    const files = walk(testDirectory, (file, isDirectory) => isDirectory || file.endsWith(`.txt`) || file.endsWith('test.json'));
    const archivePath = path.join(outputDirectory, 'archive.zip');
    const archive = await zipFiles(archivePath, files);
    const size = archive.pointer();

    expect(fs.existsSync(archivePath)).toBe(true);
    expect(size).toBeCloseTo(453, -1); // allow a margin of error of 5 bytes (TODO: do we need this?)
  });
});