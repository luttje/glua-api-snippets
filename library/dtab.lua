---@meta

---@class DTab
local DTab = {}

---[CLIENT] Returns the panel that the tab represents.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:GetPanel)
---@return Panel Panel added to the sheet using DPropertySheet:AddSheet.
function DTab:GetPanel() end

---[CLIENT] Returns whether the tab is the currently selected tab of the associated DPropertySheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:IsActive)
---@return Boolean Currently selected tab.
function DTab:IsActive() end
