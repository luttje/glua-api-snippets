import { convertWindowsToUnixPath, walk } from '../src/filesystem';

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
});
