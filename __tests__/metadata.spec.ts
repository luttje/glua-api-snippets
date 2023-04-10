import { writeMetadata, readMetadata } from '../src/metadata.js';
import path from 'path';
import fs from 'fs';
import os from 'os';

describe('Metadata', () => {
  let outputDirectory = '';

  beforeAll(() => {
    outputDirectory = path.join(os.tmpdir(), 'glua-wiki-metadata');
    fs.mkdirSync(outputDirectory, { recursive: true });
  });

  afterAll(() => {
    fs.rmSync(outputDirectory, { recursive: true });
  });

  it('should be able to write and read metadata', async () => {
    await writeMetadata('https://wiki.facepunch.com/gmod', outputDirectory);
    const metadata = await readMetadata(outputDirectory);

    expect(metadata).not.toBeUndefined();
    expect(metadata!.lastUpdate).toBeTruthy();
  });

  describe('invalid metadata', () => {
    let nonExistingDirectory = '';

    beforeEach(() => {
      nonExistingDirectory = path.join(os.tmpdir(), 'glua-wiki-metadata', 'non-existing');
      fs.mkdirSync(nonExistingDirectory, { recursive: true });
    });

    afterEach(() => {
      fs.rmSync(nonExistingDirectory, { recursive: true });
    });

    it('should return undefined when reading non-existing metadata', async () => {
      const metadata = await readMetadata(nonExistingDirectory);

      expect(metadata).toBeUndefined();
    });
  });
});
