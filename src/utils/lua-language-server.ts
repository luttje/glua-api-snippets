export type ConfigSettings = {
  [key: string]: any,
};

export type Config = {
  "$schema": string,
  "name": string,
  "words"?: string[],
  "files"?: string[],
  "settings"?: ConfigSettings,
};

export const librarySettings: ConfigSettings = {
  "Lua.runtime.version": "LuaJIT",
  "Lua.runtime.special": {
    "include": "dofile",
    "IncludeCS": "dofile",
  },
  "Lua.runtime.nonstandardSymbol": [
    "!",
    "!=",
    "&&",
    "||",
    "//",
    "/**/",
    "continue",
  ],
  // An array, so the addon manager adds it to (and removes it from) any existing plugins
  "Lua.runtime.plugin": [
    "${addons}/garrysmod/module/plugin.lua",
  ],
  "Lua.diagnostics.disable": [
    "duplicate-set-field", // Prevents complaining when a function exists twice in both the CLIENT and SERVER realm
  ],
  // TODO: runtime.path
};

export function makeConfigJson(name: string, words: string[], files: string[], settings: ConfigSettings) {
  let config: Config = {
    "$schema": "https://raw.githubusercontent.com/LuaLS/LLS-Addons/main/schemas/addon_config.schema.json",
    "name": name,
  };

  if (words.length > 0) {
    config["words"] = words;
  }

  if (files.length > 0) {
    config["files"] = files;
  }

  if (Object.keys(settings).length > 0) {
    config["settings"] = settings;
  }

  return config;
}
