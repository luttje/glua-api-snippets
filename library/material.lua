---@meta

--- Material is a VGUI element that renders a VMT material.
---@class Material : Button
local Material = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the alpha value of the Material panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Material:SetAlpha)
---@param alpha number The alpha value, from 0 to 255.
function Material:SetAlpha(alpha) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the material used by the panel.
---
--- **NOTE**: If the material is not showing up as the correct size, try setting the Material panel's `AutoSize` variable to **false**
---
---[View wiki](https://wiki.facepunch.com/gmod/Material:SetMaterial)
---@param matname string The file path of the material to set (relative to "garrysmod/materials/").
function Material:SetMaterial(matname) end
