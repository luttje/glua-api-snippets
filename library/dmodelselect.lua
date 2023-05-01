---@meta

---@class DModelSelect
local DModelSelect = {}

---[CLIENT] Sets the height of the panel **in the amount of 64px spawnicons**.
---
--- Overrides Panel:SetHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelSelect:SetHeight)
---@param num number Basically how many rows of 64x64 px spawnicons should fit in this DModelSelect
function DModelSelect:SetHeight(num) end

---[CLIENT] Called to set the list of models within the panel element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelSelect:SetModelList)
---@param models table Each key is a model path, the value is a kay-value table where they key is a convar name and value is the value to set to that convar.
---@param convar string
---@param dontSort boolean
---@param DontCallListConVars boolean
function DModelSelect:SetModelList(models, convar, dontSort, DontCallListConVars) end
