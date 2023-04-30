import { writeMetadata, readMetadata, metadataFilename } from '../../src/utils/metadata.js';
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

  it('should be able to write metadata', async () => {
    await writeMetadata('https://wiki.facepunch.com/gmod', outputDirectory);

    expect(fs.existsSync(path.join(outputDirectory, metadataFilename))).toBeTruthy();
  });
  
  it('should be able to write metadata to a non-existing directory', async () => {
    const nonExistingDirectory = path.join(outputDirectory, 'non-existing');
    await writeMetadata('https://wiki.facepunch.com/gmod', nonExistingDirectory);

    expect(fs.existsSync(path.join(nonExistingDirectory, metadataFilename))).toBeTruthy();
  });

  it('should be able to read metadata', async () => {
    await writeMetadata('https://wiki.facepunch.com/gmod', outputDirectory);
    const metadata = await readMetadata(outputDirectory);

    expect(metadata).not.toBeUndefined();
    expect(metadata!.lastUpdate).toBeTruthy();
  });

  describe('invalid metadata', () => {
    let nonExistingDirectory = '';

    beforeEach(() => {
      nonExistingDirectory = path.join(outputDirectory, 'glua-wiki-metadata', 'non-existing');
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
