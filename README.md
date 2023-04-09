# Garry's Mod Lua API Scraper 

[![GitHub Tests Action](https://github.com/luttje/glua-api-snippets/actions/workflows/tests.yml/badge.svg)](https://github.com/luttje/glua-api-snippets/actions/workflows/tests.yml)
[![Test Coverage Status](https://coveralls.io/repos/github/luttje/glua-api-snippets/badge.svg?branch=main)](https://coveralls.io/github/luttje/glua-api-snippets?branch=main)

This repository scrapes the Garry's Mod Lua API and generates snippets that will help EmmyLua provide autocompletion in VSCode and IntelliJ.

## 🔨 Usage

*In the following instructions we'll use `myproject` as an example name of the project we're working on.*

1. Install the EmmyLua extension for your editor of choice <small>*([EmmyLua VSCode Extension](https://marketplace.visualstudio.com/items?itemName=tangzx.emmylua) | [EmmyLua IntelliJ Plugin](https://plugins.jetbrains.com/plugin/9768-emmylua))*</small>

2. Download the latest Lua release named something like `YYYY-MM-DDTHH-MM-SS.000Z.lua.zip` from [🔗 the releases page](https://github.com/luttje/glua-api-snippets/releases).

3. Extract the downloaded release to a directory on your computer. We'll use `~/glua-api-snippets` as an example.

4. EmmyLua needs to be able to find the snippets in your project workspace. You can either:

    <details>
      <summary>Add the directory to your editor workspace.</summary>
      
      #### In VSCode
      Open the `myproject` project and add the directory to the workspace by clicking the `+` button in the bottom left corner of the editor.
      [*Learn more*](https://code.visualstudio.com/docs/editor/workspaces)
      
      #### In IntelliJ
      [*Learn more*](https://www.jetbrains.com/help/idea/add-items-to-project.html#import-items)
    </details>

    <details>
      <summary>Symlink the the directory into your project directory.</summary> 
      
      In these example we'll link the directory into the `myproject` project as `.glua`, but you can use any name you want.
      
      > **Note**
      > You should include `.glua` in your project `.gitignore` file. > That way you don't commit the API files to your project > version-control.

      #### On Windows
      `mklink /d "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\lua\myproject\.glua" "C:\Users\YOUR_USERNAME\glua-api-snippets"`

      #### On Linux
      `ln -s ~/glua-api-snippets ~/.steam/steam/SteamApps/common/GarrysMod/garrysmod/lua/myproject/.glua`

      #### On macOS
      `ln -s ~/glua-api-snippets ~/Library/Application\ Support/Steam/steamapps/common/GarrysMod/garrysmod/lua/myproject/.glua`

5. Restart your editor and enjoy autocompletion:

<div align="center">

  ![VSCode showing autocomplete options from the GLua API while typing code with EmmyLua](docs/demo-autocompletion.gif)

</div>

## 📅 **Automatically up-to-date**
Using GitHub Actions, this repository is automatically updated every month.

It will automatically scrape the latest Garry's Mod Lua API from the Garry's Mod Wiki and package them into a release.

## 🤖 Advanced Usage

### Running the Scraper Locally

You can clone this repository and run the scraper yourself. This is useful if you want to use the latest version of the API, or if you want to make changes to the scraper.

1. Clone this repository

2. Install the dependencies with `npm install`

3. Run the scraper with `npm run cli:scrape-wiki`

### Testing the project

This project uses [Jest](https://jestjs.io/) to automate testing. You can run the tests with `npm test`.

### API as JSON

The API is also available as JSON. You can find it with the Lua API package [on the releases page](https://github.com/luttje/glua-api-snippets/releases). It is named something like `YYYY-MM-DDTHH-MM-SS.000Z.json.zip`.