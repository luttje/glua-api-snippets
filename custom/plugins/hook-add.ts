import { GluaApiWriter } from "../../src/api-writer/glua-api-writer";
import { Function, HookFunction } from "../../src/scrapers/wiki-page-markup-scraper";
import path from 'path';
import fs from 'fs';

export default function plugin(writer: GluaApiWriter, func: Function) {
  // let hookAnnotations = '---@overload fun(eventName: "Move", identifier: any, func: fun(ply: Player, mv: CMoveData): boolean?)\n';
  let hookAnnotations = '';

  // Iterate writer.outputDirectory to find all hooks in gm/ that have type "hook"
  const hookFiles = path.join(writer.outputDirectory, 'gm');
  const hookFilesList = fs.readdirSync(hookFiles, { withFileTypes: true })
    .filter(dirent => dirent.isFile() && dirent.name.endsWith('.json'))
    .map(dirent => dirent.name);

  // Iterate all files and parse them as JSON, only those with type "hook" are considered
  for (const file of hookFilesList) {
    const filePath = path.join(writer.outputDirectory, 'gm', file);
    const fileContent = fs.readFileSync(filePath, 'utf8');
    const fileJson = JSON.parse(fileContent)[0] as HookFunction;

    // Check if the function is a hook
    if (fileJson.type !== 'hook') {
      continue;
    }

    // Add the hook annotation to the hookAnnotations string
    let args = '';

    if (fileJson.arguments) {
      for (const arg of fileJson.arguments) {
        if (arg.args) {
          for (const argItem of arg.args) {
            const argType = GluaApiWriter.transformType(argItem.type);
            args += `${argItem.name}: ${argType}, `;
          }
        }
      }

      // Remove the last comma and space
      args = args.slice(0, -2);
    }

    let returns = '';
    if (fileJson.returns) {
      for (const ret of fileJson.returns) {
        const retType = GluaApiWriter.transformType(ret.type);
        returns += `${retType}, `;
      }

      // Remove the last comma and space
      returns = returns.slice(0, -2);

      if (returns !== '') {
        // We force the return type to be optional, since hooks should only return a value if they want to
        returns = `:(${returns}?)`;
      }
    }

    // Create the overload
    hookAnnotations += `---@overload fun(eventName: "${fileJson.name}", identifier: any, func: fun(${args})${returns})\n`;
  }

  return hookAnnotations;
}
