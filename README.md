# Garry's Mod Lua API Definitions

[![GitHub Release](https://img.shields.io/github/v/release/luttje/glua-api-snippets)](https://github.com/luttje/glua-api-snippets/releases)
[![GitHub License](https://img.shields.io/github/license/luttje/glua-api-snippets)](https://github.com/luttje/glua-api-snippets/blob/main/LICENSE)
[![GitHub Tests Action](https://github.com/luttje/glua-api-snippets/actions/workflows/tests.yml/badge.svg)](https://github.com/luttje/glua-api-snippets/actions/workflows/tests.yml)
[![Test Coverage Status](https://coveralls.io/repos/github/luttje/glua-api-snippets/badge.svg?branch=main)](https://coveralls.io/github/luttje/glua-api-snippets?branch=main)
[![All Contributors](https://img.shields.io/github/all-contributors/luttje/glua-api-snippets?color=ee8449&style=flat-square)](#contributors)

This repository scrapes the Garry's Mod Lua API and generates annotated code snippets that will help provide autocompletion for Lua in editors like VSCode, Neovim and more.

<div align="center">

![VSCode showing autocomplete options from the GLua API while typing code with EmmyLua](docs/demo-autocompletion.gif)

</div>

## 🔨 Usage

To get autocompletion for the Garry's Mod Lua API in your Garry's Mod projects, you need to install the Lua Language Server and our GLua API Definitions.

**First** install **Lua Language Server (LuaLS):** for your editor of choice:

  * [Visual Studio Code Extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
  
  * [Neovim Configuration](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls)
  
**Then** download/install our GLua API Definitions for the Lua Language Server. This process varies depending on your editor:

### Visual Studio Code

Installing our GLua API Definitions for the Lua Language Server in Visual Studio Code is easy thanks to the Lua Language Server Addon Manager built into the VSCode extension.

1. In Visual Studio Code open the Command Palette with the key combination `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS)

2. Search for *Addon*, then select **`Lua: Open Addon Manager ...`**:

<div align="center">

![VSCode editor command suggestion showing: Lua: Open Addon Manager ...](docs/lls-addon-manager-command.jpg)

</div>

3. Search for the **Garry's Mod** addon and **`Enable`** it:

<div align="center">

![Lua Language Server Addon Manager showing the Garry's Mod addon](docs/lls-addon-manager-gmod.jpg)

</div>

### Neovim

1. Setup a folder for storing Lua Language Server addons (e.g. `~/.cache/luals/`) and create `addonManager/addons/garrysmod/module` folders inside it

> [!NOTE]
>
> If you switch between Neovim and VSCode regularly, you probably want to use VSCode's directory, which is `~/AppData/Roaming/Code/User/globalStorage/sumneko.lua` on Windows and `~/.config/Code/User/globalStorage/sumneko.lua` on Linux

2. Clone (or download and unzip) [our `lua-language-server-addon` branch](https://github.com/luttje/glua-api-snippets/tree/lua-language-server-addon) into the `garrysmod/module` folder

3. In your Neovim config where you call `lspconfig.lua_ls.setup`, add the following to the table

```lua
before_init = function(init_params, config)
    init_params.initializationOptions = init_params.initializationOptions or {}
    init_params.initializationOptions.storagePath = "~/.cache/luals"
end
```

### Example `.luarc.json` for projects

```json
{
    "$schema": "https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json",
    "runtime.version": "LuaJIT",
    "runtime.special": {
        "IncludeCS": "dofile",
        "include": "dofile"
    },
    "runtime.nonstandardSymbol": ["!", "!=", "&&", "||", "//", "/**/", "continue"],
    "workspace.library": ["${addons}/garrysmod/module/library"],
    "workspace.checkThirdParty": false
}
```

> [!WARNING]
>
> The VSCode extension [currently does not automatically install addons](https://github.com/LuaLS/vscode-lua/issues/159). If a user that does not have this addon installed already opens a project that has this `.luarc.json` present, they will have to open the Addon Manager and click Disable and Enable on this addon for it to install the addon properly.

## 📅 Automatically up-to-date

Using GitHub Actions, this repository is automatically updated on the first day of every month at approximately 00:00 UTC.

A workflow will automatically scrape the latest Garry's Mod Lua API from [the Garry's Mod Wiki](https://wiki.facepunch.com/gmod/) and package them into [🔗 a release](https://github.com/luttje/glua-api-snippets/releases).

> [!NOTE]
>
> The Lua Language Server addon might not be immediately updated to align with the definitions in this repository. This delay occurs because we must submit a pull request (PR) to the [Lua Language Server Addons repository (`LuaLS/LLS-Addons`)](https://github.com/LuaLS/LLS-Addons) to update the addon. Subsequently, a maintainer of the `LuaLS/LLS-Addons` repository needs to find time to review and merge the PR.
>
> Our schedule for updating our addon with `LuaLS/LLS-Addons` is set for the first day of February, April, June, August, October, and December.
> This schedule is subject to change based on the availability of maintainers and the urgency of the update.
>
> If you urgently require the most current definitions from the addon, you can expedite the process by submitting a PR to update it yourself. Instructions for doing so can be found in [the `CONTRIBUTING.md` file](https://github.com/luttje/glua-api-snippets/blob/main/CONTRIBUTING.md#updating-the-addon-for-lua-language-server).

## 🤖 Advanced Usage

### Running the Scraper Locally

You can clone this repository and run the scraper yourself. This is useful if you want to use the latest version of the API, or if you want to make changes to the scraper.

1. Clone this repository

2. Install the dependencies with `npm install`

3. Run the scraper with `npm run scrape-wiki`

### Testing the project

This project uses [Jest](https://jestjs.io/) to automate testing. You can run the tests with `npm test`.

### API as JSON

The API is also available as JSON. You can find it with the Lua API package on [🔗 the releases page](https://github.com/luttje/glua-api-snippets/releases). It is named something like `YYYY-MM-DD_HH-MM-SS.json.zip`.

### Manual Installation

If you cannot or do not want to use Lua Language Server:

1. Download and unzip the latest release from [🔗 the releases page](https://github.com/luttje/glua-api-snippets/releases), it's named something like `YYYY-MM-DD_HH-MM-SS.lua.zip`

2. Include or symlink the unzipped directory into your workspace

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/luttje"><img src="https://avatars.githubusercontent.com/u/2738114?v=4?s=100" width="100px;" alt="luttje"/><br /><sub><b>luttje</b></sub></a><br /><a href="#code-luttje" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/aske02"><img src="https://avatars.githubusercontent.com/u/45128441?v=4?s=100" width="100px;" alt="Aske"/><br /><sub><b>Aske</b></sub></a><br /><a href="#code-aske02" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://vurv78.github.io/"><img src="https://avatars.githubusercontent.com/u/56230599?v=4?s=100" width="100px;" alt="Vurv"/><br /><sub><b>Vurv</b></sub></a><br /><a href="#code-Vurv78" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/yogwoggf"><img src="https://avatars.githubusercontent.com/u/100450992?v=4?s=100" width="100px;" alt="jason"/><br /><sub><b>jason</b></sub></a><br /><a href="#ideas-yogwoggf" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://blog.amd-nick.me"><img src="https://avatars.githubusercontent.com/u/9200174?v=4?s=100" width="100px;" alt="_AMD_"/><br /><sub><b>_AMD_</b></sub></a><br /><a href="#bug-AMD-NICK" title="Bug reports">🐛</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/b0mbie"><img src="https://avatars.githubusercontent.com/u/69766525?v=4?s=100" width="100px;" alt="[aka]bomb"/><br /><sub><b>[aka]bomb</b></sub></a><br /><a href="#bug-b0mbie" title="Bug reports">🐛</a> <a href="#code-b0mbie" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="http://steamcommunity.com/id/Robotboy655"><img src="https://avatars.githubusercontent.com/u/3299036?v=4?s=100" width="100px;" alt="Rubat"/><br /><sub><b>Rubat</b></sub></a><br /><a href="#code-robotboy655" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/Techbot121"><img src="https://avatars.githubusercontent.com/u/3000604?v=4?s=100" width="100px;" alt="Techbot121"/><br /><sub><b>Techbot121</b></sub></a><br /><a href="#bug-Techbot121" title="Bug reports">🐛</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/TIMONz1535"><img src="https://avatars.githubusercontent.com/u/7351599?v=4?s=100" width="100px;" alt="TIMON_Z1535"/><br /><sub><b>TIMON_Z1535</b></sub></a><br /><a href="#ideas-TIMONz1535" title="Ideas, Planning, & Feedback">🤔</a> <a href="#bug-TIMONz1535" title="Bug reports">🐛</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://c7.pm"><img src="https://avatars.githubusercontent.com/u/1606710?v=4?s=100" width="100px;" alt="Cynthia Foxwell"/><br /><sub><b>Cynthia Foxwell</b></sub></a><br /><a href="#doc-Cynosphere" title="Documentation">📖</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
