---@meta

--- The default SpawnmenuContentPanel
--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---@class SpawnmenuContentPanel : DPanel
local SpawnmenuContentPanel = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Changes the Spawnmenu category to search in
---
---[View wiki](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:CallPopulateHook)
---@param hookname string The Hook name
function SpawnmenuContentPanel:CallPopulateHook(hookname) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Allows the modification of the ContentSidebar
---
---[View wiki](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:EnableModify)
function SpawnmenuContentPanel:EnableModify() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Changes the Spawnmenu category to search in
---
---[View wiki](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:EnableSearch)
---@param category string The category
---@param hookname string The Hook name
function SpawnmenuContentPanel:EnableSearch(category, hookname) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Switches the current panel with the given panel
---
---[View wiki](https://wiki.facepunch.com/gmod/SpawnmenuContentPanel:SwitchPanel)
---@param panel Panel Panel to switch to
function SpawnmenuContentPanel:SwitchPanel(panel) end
