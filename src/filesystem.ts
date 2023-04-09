import fs from 'fs';
import path from 'path';

export function walk(dir: string): string[] {
  const filelist: string[] = [];

  const traverse = (currentDir: string) => {
    const files = fs.readdirSync(currentDir);

    for (const file of files) {
      const filepath = path.join(currentDir, file);
      const stat = fs.statSync(filepath);

      if (stat.isDirectory()) {
        traverse(filepath);
      } else {
        filelist.push(filepath);
      }
    }
  };

  traverse(dir);

  return filelist;
};

/**
 * Converts a Windows path to a Unix path (e.g. C:\Users\me\Documents\file.txt -> /c/Users/me/Documents/file.txt).
 *
 * @param windowsPath The Windows path to convert.
 * @returns The Unix path.
 */
export function convertWindowsToUnixPath(windowsPath: string) {
  let unixPath = windowsPath;

  unixPath = unixPath.replace(/^[A-Z]:/, (match) => match.toLowerCase());
  unixPath = unixPath.replace(/\\/g, '/');

  let colonIndex = unixPath.indexOf(':');
  
  if (colonIndex > -1)
    unixPath = unixPath.replace(/:/, '');

  if (unixPath.startsWith('.')) 
    unixPath = unixPath.substring(2);
  else if (!unixPath.startsWith('/') && colonIndex > -1)
    unixPath = '/' + unixPath;

  return unixPath;
}
