---@meta

---
--- 		A combination of DModelSelect and DPropertySheet.
---
---@class DModelSelectMulti : DPropertySheet
local DModelSelectMulti = {}

---[CLIENT AND MENU] Adds a new tab of models.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelSelectMulti:AddModelList)
---@param name string Name of the tab to add.
---@param models table Models list for this tab. See DModelSelect:SetModelList.
---@param convar string ConVar to set when a model from this list is selected.
---@param dontSort boolean Do not sort the list. (by the `Model` member)
---@param dontCallListConVars boolean If set, only the `convar` from the 2nd argument will be set, not individual convars from the models list.
function DModelSelectMulti:AddModelList(name, models, convar, dontSort, dontCallListConVars) end
