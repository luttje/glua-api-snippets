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
