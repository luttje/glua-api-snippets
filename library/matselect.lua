---@meta

--- The panel used by Material & Lamp Sandbox tools for texture selection.
---@class MatSelect : ContextBase
local MatSelect = {}

---[CLIENT] Clears all added materials and clears selection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:Clear)
function MatSelect:Clear() end

---[CLIENT] Find a DImageButton panel based on the input material path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:FindMaterialByValue)
---@param mat string The material to find within this MatSelect.
---@return DImageButton # The found material, or nil.
function MatSelect:FindMaterialByValue(mat) end

---[CLIENT] Selects a given material panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MatSelect:SelectMaterial)
---@param mat DImageButton The material to select, found by MatSelect:FindMaterialByValue
function MatSelect:SelectMaterial(mat) end
