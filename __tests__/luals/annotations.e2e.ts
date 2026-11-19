import { librarySettings } from '../../src/utils/lua-language-server';
import { checkWorkspace, Diagnostic } from './lua-language-server';
import { buildLibrary } from './build-library';
import path from 'path';
import fs from 'fs';
import os from 'os';

const casesDirectory = path.resolve('__tests__/luals/cases');
const wikiDirectory = path.resolve('__tests__/luals/wiki');
const customDirectory = path.resolve('custom');

const caseFiles = fs.readdirSync(casesDirectory).filter(file => file.endsWith('.lua'));

/**
 * Lines ending in `-- expect: code[, code]` must produce exactly those diagnostics, all other lines none.
 */
function getExpectedDiagnostics(file: string) {
  return fs.readFileSync(path.join(casesDirectory, file), 'utf-8')
    .split(/\r?\n/)
    .flatMap((line, index) => {
      const codes = line.match(/--\s*expect:\s*(.+)$/)?.[1].split(',') ?? [];
      return codes.map(code => `${index + 1}: ${code.trim()}`);
    })
    .sort();
}

function formatDiagnostics(diagnostics: Diagnostic[]) {
  return diagnostics
    .map(diagnostic => `${diagnostic.range.start.line + 1}: ${diagnostic.code}`)
    .sort();
}

describe('LuaLS annotations', () => {
  let tempDirectory: string;
  let diagnostics: Map<string, Diagnostic[]>;

  beforeAll(async () => {
    tempDirectory = fs.mkdtempSync(path.join(os.tmpdir(), 'glua-luals-'));
    const libraryDirectory = path.join(tempDirectory, 'library');

    await buildLibrary(wikiDirectory, customDirectory, libraryDirectory);

    diagnostics = checkWorkspace(casesDirectory, {
      ...librarySettings,
      'Lua.workspace.library': [libraryDirectory],
    }, tempDirectory);
  });

  afterAll(() => {
    fs.rmSync(tempDirectory, { recursive: true, force: true });
  });

  it.each(caseFiles)('%s', (file) => {
    expect(formatDiagnostics(diagnostics.get(file) ?? [])).toEqual(getExpectedDiagnostics(file));
  });
});
