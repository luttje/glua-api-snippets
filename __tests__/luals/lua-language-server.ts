import { execFileSync, spawnSync } from 'child_process';
import StreamZip from 'node-stream-zip';
import { fileURLToPath } from 'url';
import path from 'path';
import fs from 'fs';

export const LUALS_VERSION = '3.19.2';

const installDirectory = path.resolve('node_modules/.cache/lua-language-server', LUALS_VERSION);
const executablePath = path.join(installDirectory, 'bin', process.platform === 'win32' ? 'lua-language-server.exe' : 'lua-language-server');

export type Diagnostic = {
  code: string,
  message: string,
  range: { start: { line: number, character: number } },
};

function getAssetName() {
  const platform = { win32: 'win32', linux: 'linux', darwin: 'darwin' }[process.platform as string];
  const arch = { x64: 'x64', arm64: 'arm64' }[process.arch as string];

  if (!platform || !arch)
    throw new Error(`Unsupported platform for LuaLS: ${process.platform}-${process.arch}`);

  return `lua-language-server-${LUALS_VERSION}-${platform}-${arch}.${platform === 'win32' ? 'zip' : 'tar.gz'}`;
}

export async function installLuaLs() {
  if (fs.existsSync(executablePath))
    return;

  const assetName = getAssetName();
  const response = await fetch(`https://github.com/LuaLS/lua-language-server/releases/download/${LUALS_VERSION}/${assetName}`);

  if (!response.ok)
    throw new Error(`Failed to download ${assetName}: ${response.status} ${response.statusText}`);

  const archivePath = path.join(installDirectory, assetName);
  fs.mkdirSync(installDirectory, { recursive: true });
  fs.writeFileSync(archivePath, Buffer.from(await response.arrayBuffer()));

  if (assetName.endsWith('.zip')) {
    const zip = new StreamZip.async({ file: archivePath });
    await zip.extract(null, installDirectory);
    await zip.close();
  } else {
    execFileSync('tar', ['-xzf', archivePath, '-C', installDirectory]);
  }

  fs.rmSync(archivePath);
}

/**
 * Runs `lua-language-server --check` and returns the diagnostics per file, relative to the workspace.
 */
export function checkWorkspace(workspace: string, settings: object, tempDirectory: string) {
  if (!fs.existsSync(executablePath))
    throw new Error('LuaLS is not installed, run `npm run test:luals` to install it');

  const configPath = path.join(tempDirectory, '.luarc.json');
  const outputPath = path.join(tempDirectory, 'check.json');

  fs.writeFileSync(configPath, JSON.stringify(settings, null, 2));
  fs.rmSync(outputPath, { force: true });

  // Exits with 1 when diagnostics were found
  const result = spawnSync(executablePath, [
    `--check=${workspace}`,
    `--configpath=${configPath}`,
    '--checklevel=Information',
    '--check_format=json',
    `--check_out_path=${outputPath}`,
    `--logpath=${path.join(tempDirectory, 'log')}`,
    `--metapath=${path.join(tempDirectory, 'meta')}`,
  ], { encoding: 'utf-8' });

  if (result.error || (result.status !== 0 && result.status !== 1))
    throw new Error(`LuaLS check failed: ${result.error ?? result.stdout + result.stderr}`);

  const results: Record<string, Diagnostic[]> = fs.existsSync(outputPath)
    ? JSON.parse(fs.readFileSync(outputPath, 'utf-8'))
    : {};

  return new Map(
    Object.entries(results).map(([uri, diagnostics]) => [path.relative(workspace, fileURLToPath(uri)), diagnostics])
  );
}
