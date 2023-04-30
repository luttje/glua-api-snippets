import { makeConfigJson } from '../../src/utils/lua-language-server';

describe('makeConfigJson', () => {
  it('should create a valid config json', () => {
    const config = makeConfigJson('test', ['test'], ['test'], { "test": "test" });

    expect(config).toEqual({
      "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json",
      "name": "test",
      "words": ["test"],
      "files": ["test"],
      "settings": {
        "test": "test",
      },
    });
  });

  it('should create a valid config json with no words', () => {
    const config = makeConfigJson('test', [], ['test'], { "test": "test" });

    expect(config).toEqual({
      "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json",
      "name": "test",
      "files": ["test"],
      "settings": {
        "test": "test",
      },
    });
  });

  it('should create a valid config json with no files', () => {
    const config = makeConfigJson('test', ['test'], [], { "test": "test" });

    expect(config).toEqual({
      "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json",
      "name": "test",
      "words": ["test"],
      "settings": {
        "test": "test",
      },
    });
  });

  it('should create a valid config json with no settings', () => {
    const config = makeConfigJson('test', ['test'], ['test'], {});

    expect(config).toEqual({
      "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json",
      "name": "test",
      "words": ["test"],
      "files": ["test"],
    });
  });

  it('should create a valid config json with no words, files, or settings', () => {
    const config = makeConfigJson('test', [], [], {});

    expect(config).toEqual({
      "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json",
      "name": "test",
    });
  });
});