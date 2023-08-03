# Garry's Mod Lua API Definitions 

[![GitHub Release](https://img.shields.io/github/v/release/luttje/glua-api-snippets)](https://github.com/luttje/glua-api-snippets/releases)
[![GitHub License](https://img.shields.io/github/license/luttje/glua-api-snippets)](https://github.com/luttje/glua-api-snippets/blob/main/LICENSE)
[![GitHub Tests Action](https://github.com/luttje/glua-api-snippets/actions/workflows/tests.yml/badge.svg)](https://github.com/luttje/glua-api-snippets/actions/workflows/tests.yml)
[![Test Coverage Status](https://coveralls.io/repos/github/luttje/glua-api-snippets/badge.svg?branch=main)](https://coveralls.io/github/luttje/glua-api-snippets?branch=main)

This repository scrapes the Garry's Mod Lua API and generates snippets that will help provide autocompletion for Lua in editors like VSCode, NeoVim and more.

## 🔨 Usage

1. Install **Lua Language Server:** for your editor of choice: 
    * [Visual Studio Code Extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
    * [NeoVim Configuration](https://github.com/LuaLS/lua-language-server#neovim)
  
2. Open the **Lua Language Server Addon Manager** with the key combination `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS) and search for *Addon*, then select **Lua: Open Addon Manager ...**:
![VSCode editor command suggestion showing: Lua: Open Addon Manager ...](docs/lls-addon-manager-command.jpg)

3. Search for the **Garry's Mod** addon and **Enable** it:
![Lua Language Server Addon Manager showing the Garry's Mod addon](docs/lls-addon-manager-gmod.jpg)

4. You will now get autocompletion for the Garry's Mod Lua API in your Garry's Mod projects.

<div align="center">

  ![VSCode showing autocomplete options from the GLua API while typing code with EmmyLua](docs/demo-autocompletion.gif)

</div>

*Alternatively download the latest release and include or symlink it into your workspace. Get the release from [🔗 the releases page](https://github.com/luttje/glua-api-snippets/releases) it's named something like `YYYY-MM-DD_HH-MM-SS.lua.zip` .*

## 📅 **Automatically up-to-date**

Using GitHub Actions, this repository is automatically updated every first day of the month at around 00:00 UTC.

A workflow will automatically scrape the latest Garry's Mod Lua API from [the Garry's Mod Wiki](https://wiki.facepunch.com/gmod/) and package them into [🔗 a release](https://github.com/luttje/glua-api-snippets/releases).

> **Note**
> 
> The Lua Language Server addon may not be 100% up-to-date with the definitions in this repository. You can help us out by updating it for everyone. There are instructions on how to do this in [the `CONTRIBUTING.md` file](https://github.com/luttje/glua-api-snippets/blob/main/CONTRIBUTING.md#updating-the-addon-for-lua-language-server).

## 🤖 Advanced Usage

### Running the Scraper Locally

You can clone this repository and run the scraper yourself. This is useful if you want to use the latest version of the API, or if you want to make changes to the scraper.

1. Clone this repository

2. Install the dependencies with `npm install`

3. Run the scraper with `npm run scrape-wiki`

### Testing the project

This project uses [Jest](https://jestjs.io/) to automate testing. You can run the tests with `npm test`.

### API as JSON

The API is also available as JSON. You can find it with the Lua API package [on the releases page](https://github.com/luttje/glua-api-snippets/releases). It is named something like `YYYY-MM-DD_HH-MM-SS.json.zip`.

## ❤️ Contributors

Besides me ([@luttje](https://github.com/luttje)) more people contribute. Super special thanks to them for helping make this project a lot better. I wouldn't be able to do this all by myself.

|[![](https://github.com/aske02.png?size=50)<br>Aske](https://github.com/aske02)|   |   |   |   |
|---|---|---|---|---|
|   |   |   |   |   |

_If you contributed and are missing from this list, feel free to create an issue._
