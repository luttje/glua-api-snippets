---@meta

---
--- 		A tree and list-based file browser.
---
--- 		It allows filtering by folder (directory) name and file extension, and can display models as SpawnIcons.
--- 	Creates a DFileBrowser and displays the data/persist folder. Any file clicked is printed to the console.
--- Creates a DFileBrowser that can spawn models from `props_` folders.
---
--- Uses the same DFrame as above
--- 	Same as above, but enables model viewing. The following line is added to the above code.Same as above, but enables model viewing. The following line is added to the above code.
--- Creates a DFileBrowser for browsing and selecting sounds.
---
---@class DFileBrowser : DPanel
local DFileBrowser = {}

---[CLIENT] Clears the file tree and list, and resets all values.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:Clear)
function DFileBrowser:Clear() end

---[CLIENT] Returns the root directory/folder of the file tree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetBaseFolder)
---@return string # The path to the root folder.
function DFileBrowser:GetBaseFolder() end

---[CLIENT] Returns the current directory/folder being displayed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetCurrentFolder)
---@return string # The directory the file list is currently displaying.
function DFileBrowser:GetCurrentFolder() end

---[CLIENT] Returns the current file type filter on the file list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetFileTypes)
---@return string # The current filter applied to the file list.
function DFileBrowser:GetFileTypes() end

---[CLIENT] Returns the DTree Node that the file tree stems from.
---
--- This is a child of the root node of the DTree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetFolderNode)
---@return Panel # The DTree_Node used for the tree.
function DFileBrowser:GetFolderNode() end

---[CLIENT] Returns whether or not the model viewer mode is enabled. In this mode, files are displayed as SpawnIcons instead of a list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetModels)
---@return boolean # Whether or not files will be displayed using SpawnIcons.
function DFileBrowser:GetModels() end

---[CLIENT] Returns the name being used for the file tree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetName)
---@return string # The name used for the root of the file tree.
function DFileBrowser:GetName() end

---[CLIENT] Returns whether or not the file tree is open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetOpen)
---@return boolean # Whether or not the file tree is open.
function DFileBrowser:GetOpen() end

---[CLIENT] Returns the access path of the file tree. This is `GAME` unless changed with DFileBrowser:SetPath.
---
--- See file.Read for how paths work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetPath)
---@return string # The current access path i.e. "GAME", "LUA", "DATA" etc.
function DFileBrowser:GetPath() end

---[CLIENT] Returns the current search filter on the file tree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:GetSearch)
---@return string # The filter in use on the file tree.
function DFileBrowser:GetSearch() end

---[CLIENT] Sets the root directory/folder of the file tree.
---
--- This needs to be set for the file tree to be displayed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetBaseFolder)
---@param baseDir string The path to the folder to use as the root.
function DFileBrowser:SetBaseFolder(baseDir) end

---[CLIENT] Sets the directory/folder from which to display the file list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetCurrentFolder)
---@param currentDir string The directory to display files from.
function DFileBrowser:SetCurrentFolder(currentDir) end

---[CLIENT] Sets the file type filter for the file list.
---
--- This accepts the same file extension wildcards as file.Find.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetFileTypes)
---@param fileTypes? string A list of file types to display, separated by spaces e.g.
--- ```
--- "*.lua *.txt *.mdl"
--- ```
---
function DFileBrowser:SetFileTypes(fileTypes) end

---[CLIENT] Enables or disables the model viewer mode. In this mode, files are displayed as SpawnIcons instead of a list.
---
--- This should only be used for `.mdl` files; the spawn icons will display error models for others. See DFileBrowser:SetFileTypes
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetModels)
---@param showModels? boolean Whether or not to display files using SpawnIcons.
function DFileBrowser:SetModels(showModels) end

---[CLIENT] Sets the name to use for the file tree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetName)
---@param treeName? string The name for the root of the file tree. Passing no value causes this to be the base folder name. See DFileBrowser:SetBaseFolder.
function DFileBrowser:SetName(treeName) end

---[CLIENT] Opens or closes the file tree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetOpen)
---@param open? boolean `true` to open the tree, `false` to close it.
---@param useAnim? boolean If `true`, the DTree's open/close animation is used.
function DFileBrowser:SetOpen(open, useAnim) end

---[CLIENT] Sets the access path for the file tree. This is set to `GAME` by default.
---
--- See file.Read for how paths work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetPath)
---@param path string The access path i.e. "GAME", "LUA", "DATA" etc.
function DFileBrowser:SetPath(path) end

---[CLIENT] Sets the search filter for the file tree.
---
--- This accepts the same wildcards as file.Find.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetSearch)
---@param filter? string The filter to use on the file tree.
function DFileBrowser:SetSearch(filter) end

---[CLIENT] Called to set up the DTree and file viewer when a base path has been set.
---
--- Calls DFileBrowser:SetupTree and DFileBrowser:SetupFiles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:Setup)
---@return boolean # Whether or not the variables needed to set up have been defined.
function DFileBrowser:Setup() end

---[CLIENT] Called to set up the DListView or DIconBrowser by DFileBrowser:Setup.
---
--- The icon browser is used when in models mode. See DFileBrowser:SetModels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetupFiles)
---@return boolean # Whether or not the files pane was set up successfully.
function DFileBrowser:SetupFiles() end

---[CLIENT] Called to set up the DTree by DFileBrowser:Setup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SetupTree)
---@return boolean # Whether or not the tree was set up successfully.
function DFileBrowser:SetupTree() end

---[CLIENT] Builds the file or icon list for the current directory.
---
--- You should use DFileBrowser:SetCurrentFolder to change the directory.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:ShowFolder)
---@param currentDir string The directory to populate the list from.
function DFileBrowser:ShowFolder(currentDir) end

---[CLIENT] Sorts the file list.
---
--- This is only functional when not using the model viewer. See DFileBrowser:SetModels
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFileBrowser:SortFiles)
---@param descending? boolean The sort order. `true` for descending (z-a), `false` for ascending (a-z).
function DFileBrowser:SortFiles(descending) end
