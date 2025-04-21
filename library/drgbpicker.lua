---@meta

--- DRGBPicker is an interactive panel which can be used to select a color hue.
---
--- See [DColorCube](https://wiki.facepunch.com/gmod/DColorCube) for a color picker which controls brightness and saturation.
---
--- See [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer) for a color picker that allows control over hue, saturation, and brightness at once.
---@class DRGBPicker : DPanel
local DRGBPicker = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the color at given position on the internal texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/DRGBPicker:GetPosColor)
---@param x number The X coordinate on the texture to get the color from
---@param y number The Y coordinate on the texture to get the color from
---@return table # Color
---@return number # The X-coordinate clamped to the texture's width.
---@return number # The Y-coordinate clamped to the texture's height.
function DRGBPicker:GetPosColor(x, y) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the color currently set on the color picker.
---
---[View wiki](https://wiki.facepunch.com/gmod/DRGBPicker:GetRGB)
---@return table # The color set on the color picker, see Color.
function DRGBPicker:GetRGB() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color stored in the color picker.
---
--- **NOTE**: This function is meant to be called internally and will not update the position of the color picker line or call [DRGBPicker:OnChange](https://wiki.facepunch.com/gmod/DRGBPicker:OnChange)
---
---[View wiki](https://wiki.facepunch.com/gmod/DRGBPicker:SetRGB)
---@param color table The color to set, see Color.
function DRGBPicker:SetRGB(color) end
