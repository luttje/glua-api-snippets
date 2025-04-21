---@meta

--- A combination of [DModelSelect](https://wiki.facepunch.com/gmod/DModelSelect) and [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---@class DModelSelectMulti : DPropertySheet
local DModelSelectMulti = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a new tab of models.
---
---[View wiki](https://wiki.facepunch.com/gmod/DModelSelectMulti:AddModelList)
---@param name string Name of the tab to add.
---@param models table Models list for this tab. See DModelSelect:SetModelList.
---@param convar string ConVar to set when a model from this list is selected.
---@param dontSort boolean Do not sort the list. (by the `Model` member)
---@param dontCallListConVars boolean If set, only the `convar` from the 2nd argument will be set, not individual convars from the models list.
function DModelSelectMulti:AddModelList(name, models, convar, dontSort, dontCallListConVars) end
