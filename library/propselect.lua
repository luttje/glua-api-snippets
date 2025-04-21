---@meta

--- Used in Sandbox tools to allow the player to select models out of a list. Despite being only used in Sandbox, it is **not** exclusive to that gamemode.
---
--- See also [MatSelect](https://wiki.facepunch.com/gmod/MatSelect) for the material selecting alternative.
---@class PropSelect : ContextBase
local PropSelect = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a new model to the selection list.
---
---[View wiki](https://wiki.facepunch.com/gmod/PropSelect:AddModel)
---@param model string Model path, **including** `models/` and `.mdl`.
---@param convars table A list of convar names (as keys) and their values to set when the user selects this model.
function PropSelect:AddModel(model, convars) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a new model to the selection list.
---
---[View wiki](https://wiki.facepunch.com/gmod/PropSelect:AddModelEx)
---@param value string The "value" for this model, which is used to set the ContextBase:SetConVar.
---@param model string Model path, **including** `models/` and `.mdl`.
---@param skin number The skin number for this model. It will **not** be set to the convar, use the value argument to track skin-model combos.
function PropSelect:AddModelEx(value, model, skin) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Find and select a [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon) panel based on the input model path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PropSelect:FindAndSelectButton)
---@param mdl string The model to find and select within this PropSelect.
function PropSelect:FindAndSelectButton(mdl) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Find a [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon) panel based on the input model path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PropSelect:FindModelByValue)
---@param mdl string The model to find within this PropSelect.
---@return SpawnIcon # The found spawnicon, or `nil`.
function PropSelect:FindModelByValue(mdl) end
