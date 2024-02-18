---@meta

---
--- 		The default SpawnmenuContentPanel
---
--- 	How the SpawnmenuContentPanel is created
---@class SpawnmenuContentPanel : DPanel
local SpawnmenuContentPanel = {}

---[CLIENT] Changes the Spawnmenu category to search in
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:CallPopulateHook)
---@param hookname string The Hook name
function SpawnmenuContentPanel:CallPopulateHook(hookname) end

---[CLIENT] Allows the modification of the ContentSidebar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:EnableModify)
function SpawnmenuContentPanel:EnableModify() end

---[CLIENT] Changes the Spawnmenu category to search in
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:EnableSearch)
---@param category string The category
---@param hookname string The Hook name
function SpawnmenuContentPanel:EnableSearch(category, hookname) end

---[CLIENT] Switches the current panel with the given panel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:SwitchPanel)
---@param panel Panel Panel to switch to
function SpawnmenuContentPanel:SwitchPanel(panel) end
