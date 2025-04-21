---@meta

--- A vertical list of models.
---@deprecated This is derived from the deprecated DPanelList.
---@class DModelSelect : DPanelSelect
local DModelSelect = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the height of the panel **in the amount of 64px spawnicons**.
---
--- Overrides [Panel:SetHeight](https://wiki.facepunch.com/gmod/Panel:SetHeight).
---
---[View wiki](https://wiki.facepunch.com/gmod/DModelSelect:SetHeight)
---@param num? number Basically how many rows of 64x64 px spawnicons should fit in this DModelSelect
function DModelSelect:SetHeight(num) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called to set the list of models within the panel element.
---
---[View wiki](https://wiki.facepunch.com/gmod/DModelSelect:SetModelList)
---@param models table Each key is a model path, the value is a kay-value table where they key is a convar name and value is the value to set to that convar.
---@param convar string ConVar to set when a model from this list is selected.
---@param dontSort boolean Do not sort the list. (by the `Model` member)
---@param dontCallListConVars boolean If set, only the `convar` from the 2nd argument will be set, not individual convars from the models list.
function DModelSelect:SetModelList(models, convar, dontSort, dontCallListConVars) end
