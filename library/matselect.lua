---@meta

--- The panel used by Material & Lamp Sandbox tools for texture selection. Despite being only used in Sandbox, it is **not** exclusive to that gamemode.
---
--- See also [PropSelect](https://wiki.facepunch.com/gmod/PropSelect) for the prop selecting alternative.
---
---
---@class MatSelect : ContextBase
local MatSelect = {}

---[CLIENT] Adds a new material to the selection list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:AddMaterial)
---@param label string Tooltip for the material, for when the player hovers over the material.
---@param path string Path to the material. Relative to `materials/` folder (do not include it), and do not include the `.vmt` extension.
function MatSelect:AddMaterial(label, path) end

---[CLIENT] Adds a new material to the selection list, with some extra options.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:AddMaterialEx)
---@param label string Tooltip for the material, for when the player hovers over the material.
---@param path string Path to the material. Relative to `materials/` folder (do not include it), and do not include the `.vmt` extension.
---@param value any Overrides the "value" of the material. This will be what MatSelect:OnSelect receives in the first argument. It also affects MatSelect:FindMaterialByValue.
---@param convars table A list of convar names (as keys) and their values to set when the user selects this material. ContextBase:SetConVar will be ignored.
function MatSelect:AddMaterialEx(label, path, value, convars) end

---[CLIENT] Find a [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) panel based on the input material path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:FindMaterialByValue)
---@param mat string The material to find within this MatSelect.
---@return DImageButton # The found material, or nil.
function MatSelect:FindMaterialByValue(mat) end

---[CLIENT] Returns whether the panel would set its own height to fit all materials within its height.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:GetAutoHeight)
---@return boolean # `true` = auto size itself.
function MatSelect:GetAutoHeight() end

---[CLIENT] Selects a given material panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:SelectMaterial)
---@param mat DImageButton The material to select, found by MatSelect:FindMaterialByValue
function MatSelect:SelectMaterial(mat) end

---[CLIENT] Sets whether the panel should set its own height to fit all materials within its height.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:SetAutoHeight)
---@param autoSize boolean If `true`, auto size itself.
function MatSelect:SetAutoHeight(autoSize) end

---[CLIENT] Sets the height of a single material in pixels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:SetItemHeight)
---@param height number The height of the material, in pixels. Default is `128`.
function MatSelect:SetItemHeight(height) end

---[CLIENT] Sets the width of a single material in pixels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:SetItemWidth)
---@param width number The width of the material, in pixels. Default is `128`.
function MatSelect:SetItemWidth(width) end

---[CLIENT] Sets the target height of the panel, in number of rows.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:SetNumRows)
---@param rows number Amount of rows to target the height to. Default is `2`.
function MatSelect:SetNumRows(rows) end
