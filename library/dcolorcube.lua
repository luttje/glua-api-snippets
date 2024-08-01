---@meta

---
--- 		The DColorCube allows a user to select saturation and value but not hue. Uses HSV colors
---
---@class DColorCube : DSlider
local DColorCube = {}

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the base Color set by [DColorCube:SetBaseRGB](https://wiki.facepunch.com/gmod/DColorCube:SetBaseRGB).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:GetBaseRGB)
---@return table # A Color
function DColorCube:GetBaseRGB() end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color cube's default color. By default, it is set to white. (255 255 255 RGB)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:GetDefaultColor)
---@return table # The default Color.
function DColorCube:GetDefaultColor() end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the value set by [DColorCube:SetHue](https://wiki.facepunch.com/gmod/DColorCube:SetHue).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:GetHue)
---@return number #
function DColorCube:GetHue() end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color cube's current set color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:GetRGB)
---@return table # The set color, uses Color.
function DColorCube:GetRGB() end

---[CLIENT AND MENU] Sets the color to whatever [DColorCube:GetDefaultColor](https://wiki.facepunch.com/gmod/DColorCube:GetDefaultColor) returns
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:ResetToDefaultValue)
function DColorCube:ResetToDefaultValue() end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the base color and the color used to draw the color cube panel itself.
---
--- **NOTE**: Calling this when using a color that isn't 100% saturated and valued ([Global.HSVToColor](https://wiki.facepunch.com/gmod/Global.HSVToColor) with saturation and value set to 1) causes the color cube to look inaccurate compared to the color that's returned by methods like [DColorCube:GetRGB](https://wiki.facepunch.com/gmod/DColorCube:GetRGB) and [DColorCube:OnUserChanged](https://wiki.facepunch.com/gmod/DColorCube:OnUserChanged). You should use [DColorCube:SetColor](https://wiki.facepunch.com/gmod/DColorCube:SetColor) instead
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetBaseRGB)
---@param color table The base color to set, uses Color.
function DColorCube:SetBaseRGB(color) end

---[CLIENT AND MENU] Sets the base color of the color cube and updates the slider position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetColor)
---@param color table The color to set, uses Color.
function DColorCube:SetColor(color) end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the color cube's default color. This value will be used to reset to on middle mouse click of the color cube's draggable slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetDefaultColor)
---@param table table The new default Color.
function DColorCube:SetDefaultColor(table) end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that appears to do nothing and unused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetHue)
---@param hue number
function DColorCube:SetHue(hue) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 	An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that used internally to set the real "output" color of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetRGB)
---@param clr table A Color
function DColorCube:SetRGB(clr) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the color cube RGB based on the given x and y position and returns its arguments. Similar to [DColorCube:UpdateColor](https://wiki.facepunch.com/gmod/DColorCube:UpdateColor).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:TranslateValues)
---@param x? number The x position to sample color from/the percentage of saturation to remove from the color (ranges from 0.0 to 1.0).
---@param y? number The y position to sample color from/the percentage of brightness or value to remove from the color (ranges from 0.0 to 1.0).
---@return number # The given x position.
---@return number # The given y position.
function DColorCube:TranslateValues(x, y) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the color cube RGB based on the given x and y position. Similar to [DColorCube:TranslateValues](https://wiki.facepunch.com/gmod/DColorCube:TranslateValues).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:UpdateColor)
---@param x? number The x position to set color to/the percentage of saturation to remove from the color (ranges from 0.0 to 1.0).
---@param y? number The y position to set color to/the percentage of brightness or value to remove from the color (ranges from 0.0 to 1.0).
function DColorCube:UpdateColor(x, y) end
