# Contributing guide <!-- omit in toc -->

Thank you for investing your time in contributing to our project! With your contribution you help Garry's Mod Lua developers get accurate and the latest autocomplete suggestions for the GLua API.

In this guide you will get an overview of the contribution workflow from opening an issue, creating a PR, reviewing, and merging the PR.

## New contributor guide

To get an overview of the project, read the [README](README.md). Here are some general resources to help you get started with open source contributions:

* [Finding ways to contribute to open source on GitHub](https://docs.github.com/en/get-started/exploring-projects-on-github/finding-ways-to-contribute-to-open-source-on-github)
* [Set up Git](https://docs.github.com/en/get-started/quickstart/set-up-git)
* [GitHub flow](https://docs.github.com/en/get-started/quickstart/github-flow)
* [Collaborating with pull requests](https://docs.github.com/en/github/collaborating-with-pull-requests)


## Getting started

This project automatically builds Garry's Mod Lua API [annotations for use with `LuaLS/lua-language-server`](https://github.com/LuaLS/lua-language-server/wiki/Annotations). It does this by scraping [the Garry's Mod Wiki](https://wiki.facepunch.com/gmod/). 

The above means that if you want to improve or correct the definitions, you'll have to either:

* [Contribute to the official Garry's Mod Wiki](https://wiki.facepunch.com/gmod/#contributing) (if it contains an error) and wait until the scraper runs again (at the start of every month).
* Or, if there's an error in the scraper, you can [contribute to this project](#contributing-to-this-project) and fix it yourself.

The addon for Lua Language Server is seperate from this project. If you want it to be updated, you'll have to [contribute to that project according to these instructions](#updating-the-addon-for-lua-language-server).

## Contributing to this project

### Reporting an issue

If you find an error in the scraper, please [open an issue](https://github.com/luttje/glua-api-snippets/issues/new) and describe the problem. If you can, please include a link to the page on the Garry's Mod Wiki that is incorrectly scraped.

### Creating a pull request

You can help the project even more by fixing the error yourself. To do this, you'll have to [fork this project](https://docs.github.com/en/get-started/quickstart/fork-a-repo), make corrections and [create a pull request](https://github.com/luttje/glua-api-snippets/compare) with your changes. Before you do that, please consider the following:

* Create an issue before you start working on a pull request. This way you can get feedback on your idea before you spend time on it.
* Make your changes on a seperate branch and name it according to this convention:
    * `bugfix/<short-bug-description>` if you're fixing a bug *(e.g. `bugfix/incorrect-argument-type`)*.
    * `feature/<short-feature-description>` if you're adding a new feature *(e.g. `feature/add-example-links`)*.
    * `docs/<short-docs-description>` if you're updating the documentation *(e.g. `docs/update-contributing-guide`)*.
* Cluster changes in small commits. *This makes it easier to review your changes.*
* Do not create a single PR with multiple unrelated changes. Create seperate PRs for each change. *This makes it easier to review your changes.*
* Make sure your changes are correct and don't break anything.
* Add tests for your changes if possible.
* Clearly describe your changes (and why you made them) in the pull request description.

#### Step-by-step guide to contribute to this project

1. [Fork this project](https://github.com/luttje/glua-api-snippets/fork) to your own GitHub account.

2. [Clone the forked project](https://docs.github.com/en/get-started/quickstart/fork-a-repo#cloning-your-forked-repository) to your local machine.

3. Create a new branch for your changes, for example:

    ```bash
    git checkout -b bugfix/incorrect-argument-type
    ```

4. Make your changes and commit them:

    ```bash
    git add .
    git commit -m "Fix incorrect argument type"
    ```

5. Push your changes to your forked project:

    ```bash
    git push origin bugfix/incorrect-argument-type
    ```

6. [Create a pull request](https://github.com/luttje/glua-api-snippets/compare) with your changes.

7. Wait for your pull request to be reviewed and merged. 

✨ **Thanks in advance for your contribution!**

### Getting acknowledged for your contribution

We use [All Contributors](https://allcontributors.org/) to acknowledge contributions. If you want to be added to the list of contributors, please comment to your pull request with:

```bash
@all-contributors please add @<your-github-username> for <contributions>
```

[&raquo; Learn more about the `All Contributors` bot here](https://allcontributors.org/docs/en/bot/usage)

## Updating the addon for Lua Language Server

At the first of every month the scraper runs and updates the addon for Lua Language Server to [the `lua-language-server-addon` branch in this repo](https://github.com/luttje/glua-api-snippets/tree/lua-language-server-addon). However this does not automatically update the Lua Language Server Addon, since the branch is only a sub repository in the [LuaLS/LLS-Addons repository](https://github.com/LuaLS/LLS-Addons)

#### Step-by-step guide to update our addon at [`LuaLS/LLS-Addons`](https://github.com/LuaLS/LLS-Addons/)

1. Go to the Lua Language Server Addons repository and take note of [their contribution guidelines](https://github.com/LuaLS/LLS-Addons/blob/main/CONTRIBUTING.md)

2. [Fork the Lua Language Server Addon Repository](https://github.com/LuaLS/LLS-Addons/fork) to your own GitHub account.

3. [Clone the forked project](https://docs.github.com/en/get-started/quickstart/fork-a-repo#cloning-your-forked-repository) to your local machine.

4. Create a new branch for your changes, for example:

    ```bash
    git checkout -b update-garrysmod-addon
    ```

5. Update the `garrysmod` sub repository to the latest commit in the `lua-language-server-addon` branch in this repo:

    ```bash
    git submodule update --init --remote addons/garrysmod/module
    ```

6. Commit your changes:

    ```bash
    git add .
    git commit -m "Updated garrysmod addon"
    ```

7. Push your changes to your forked project:

    ```bash
    git push origin update-garrysmod-addon
    ```

8. [Create a pull request at the `LuaLS/LLS-Addons` repository](https://github.com/LuaLS/LLS-Addons/compare) with your changes. Make sure to allow edits from maintainers.

9. Wait for your pull request to be reviewed and merged.

✨ **Thanks in advance for your help in keeping our addon up to date!**
