---@meta

---@class DRGBPicker : DPanel
local DRGBPicker = {}

---[CLIENT] Returns the color at given position on the internal texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DRGBPicker:GetPosColor)
---@param x number The X coordinate on the texture to get the color from
---@param y number The Y coordinate on the texture to get the color from
---@return table, number, number #table - Color
---@return table, number, number #number - The X-coordinate clamped to the texture's width.
---@return table, number, number #number - The Y-coordinate clamped to the texture's height.
function DRGBPicker:GetPosColor(x, y) end

---[CLIENT] Returns the color currently set on the color picker.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DRGBPicker:GetRGB)
---@return table #The color set on the color picker, see Color.
function DRGBPicker:GetRGB() end

---[CLIENT] Sets the color stored in the color picker.
---
--- This function is meant to be called internally and will not update the position of the color picker line or call DRGBPicker:OnChange
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DRGBPicker:SetRGB)
---@param color table The color to set, see Color.
function DRGBPicker:SetRGB(color) end
