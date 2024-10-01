---@meta

--- Used in Sandbox tools to allow the player to select models out of a list. Despite being only used in Sandbox, it is **not** exclusive to that gamemode.
---
--- See also [MatSelect](https://wiki.facepunch.com/gmod/MatSelect) for the material selecting alternative.
---
---@class PropSelect : ContextBase
local PropSelect = {}

---[CLIENT] Adds a new model to the selection list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PropSelect:AddModel)
---@param model string Model path, **including** `models/` and `.mdl`.
---@param convars table A list of convar names (as keys) and their values to set when the user selects this model.
function PropSelect:AddModel(model, convars) end

---[CLIENT] Adds a new model to the selection list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PropSelect:AddModelEx)
---@param value string The "value" for this model, which is used to set the ContextBase:SetConVar.
---@param model string Model path, **including** `models/` and `.mdl`.
---@param skin number The skin number for this model. It will **not** be set to the convar, use the value argument to track skin-model combos.
function PropSelect:AddModelEx(value, model, skin) end
