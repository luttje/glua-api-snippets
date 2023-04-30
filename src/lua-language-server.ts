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
