import archiver from 'archiver';
import path from 'path';
import fs from 'fs';

export function dateToFilename(date: Date) {
  return date.toISOString().replace(/:/g, '-')
    .slice(0, -5) // without .000Z
    .replace(/T/g, '_');
}

export function walk(dir: string, filter?: (fileOrDirectory: string, isDirectory?: boolean) => boolean): string[] {
  const filelist: string[] = [];

  const traverse = (currentDir: string) => {
    const files = fs.readdirSync(currentDir);

    for (const file of files) {
      const filepath = path.join(currentDir, file);
      const stat = fs.statSync(filepath);

      if (stat.isDirectory()) {
        if (!filter || filter(filepath, true))
          traverse(filepath);
      } else {
        if (!filter || filter(filepath, false))
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

export async function zipFiles(outputFile: string, filePaths: string[], trimPath?: string) {
  return new Promise<archiver.Archiver>(async (resolve, reject) => {
    const outputDirectory = path.dirname(outputFile);

    if (!fs.existsSync(outputDirectory))
      fs.mkdirSync(outputDirectory, { recursive: true });

    const outputStream = fs.createWriteStream(outputFile);
    const archive = archiver.create('zip', { zlib: { level: 9 } });
    
    outputStream.on('close', function () {
      resolve(archive);
    });

    archive.on('error', function (err) {
      reject(err);
    });

    archive.pipe(outputStream);

    for (const filePath of filePaths) {
      if (!fs.existsSync(filePath))
        reject(new Error(`File ${filePath} does not exist.`));

      archive.file(filePath, { name: trimPath ? path.relative(trimPath, filePath) : filePath });
    }
    
    await archive.finalize();
  });
}