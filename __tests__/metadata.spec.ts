import path from 'path';
import { writeMetadata, readMetadata } from '../src/metadata.js';
import fs from 'fs';

describe('Metadata', () => {
  let outputDirectory = '';

  beforeAll(() => {
    outputDirectory = fs.mkdtempSync('glua-wiki-metadata');
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
      nonExistingDirectory = fs.mkdtempSync('glua-wiki-metadata');
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
