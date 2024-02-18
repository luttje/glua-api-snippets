---@meta

--- Material is a VGUI element that renders a VMT material.Creates a Material panel with TV static under a DModelPanel with a spinning Garry's Mod logo model.Creates a custom material (using existing textures) of a Portal background with scrolling scan lines, and then displays that material in a Material panel in the center of the screen.
---@class Material : Button
local Material = {}

---[CLIENT] Sets the alpha value of the Material panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Material:SetAlpha)
---@param alpha number The alpha value, from 0 to 255.
function Material:SetAlpha(alpha) end

---[CLIENT] Sets the material used by the panel.
---
--- If the material is not showing up as the correct size, try setting the Material panel's `AutoSize` variable to **false**
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Material:SetMaterial)
---@param matname string The file path of the material to set (relative to "garrysmod/materials/").
function Material:SetMaterial(matname) end
