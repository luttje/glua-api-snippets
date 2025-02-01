---@meta

--- The search library
search = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a search result provider. For examples, see [gamemodes/sandbox/gamemode/cl_search_models.lua](https://github.com/Facepunch/garrysmod/blob/7c23addd2c35d3d046c80e3d0cb6052055eca3e2/garrysmod/gamemodes/sandbox/gamemode/cl_search_models.lua)
---
---[View wiki](https://wiki.facepunch.com/gmod/search.AddProvider)
---@param provider fun(searchQuery: string):(data: table) Provider function.
---
--- Function argument(s):
--- * string `searchQuery` - The search query user has inputed.
---
--- Function return value(s):
--- * table `data` -
--- You must return a list of tables structured like this:
---   * string text - Text to "Copy to clipboard"
---   * function func - Function to use/spawn the item
---   * Panel icon - A panel to add to spawnmenu
---   * table words - A table of words?
---@param id? string If provided, ensures that only one provider exists with the given ID at a time.
function search.AddProvider(provider, id) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Retrieves search results.
---
---[View wiki](https://wiki.facepunch.com/gmod/search.GetResults)
---@param query string Search query
---@param types? string If set, only searches given provider type(s), instead of everything. For example `"tool"` will only search tools in Sandbox. Can be a table for multiple types.
---@param maxResults? number How many results to stop at
---@return table # A table of results
function search.GetResults(query, types, maxResults) end
