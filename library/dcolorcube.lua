---@meta

---
--- 		The DColorCube allows a user to select saturation and value but not hue. Uses HSV colors
--- 	Creates a DColorCube in a DFrame.Creates a color cube that's hue is controlled by a DRGBPicker, which outputs the color to the background panel, label, and your copy/paste buffer.
---@class DColorCube : DSlider
local DColorCube = {}

---[CLIENT AND MENU] Returns the base Color set by DColorCube:SetBaseRGB.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:GetBaseRGB)
---@return table # A Color
function DColorCube:GetBaseRGB() end

---[CLIENT AND MENU] Returns the value set by DColorCube:SetHue.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:GetHue)
---@return number #
function DColorCube:GetHue() end

---[CLIENT AND MENU] Returns the color cube's current set color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:GetRGB)
---@return table # The set color, uses Color.
function DColorCube:GetRGB() end

---[CLIENT AND MENU] Sets the base color and the color used to draw the color cube panel itself.
---
--- Calling this when using a color that isn't 100% saturated and valued (Global.HSVToColor with saturation and value set to 1) causes the color cube to look inaccurate compared to the color that's returned by methods like DColorCube:GetRGB and DColorCube:OnUserChanged. You should use DColorCube:SetColor instead
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetBaseRGB)
---@param color table The base color to set, uses Color.
function DColorCube:SetBaseRGB(color) end

---[CLIENT AND MENU] Sets the base color of the color cube and updates the slider position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetColor)
---@param color table The color to set, uses Color.
function DColorCube:SetColor(color) end

---[CLIENT AND MENU] Appears to do nothing and unused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetHue)
---@param hue number
function DColorCube:SetHue(hue) end

---[CLIENT AND MENU] Used internally to set the real "output" color of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:SetRGB)
---@param clr table A Color
function DColorCube:SetRGB(clr) end

---[CLIENT AND MENU] Updates the color cube RGB based on the given x and y position and returns its arguments. Similar to DColorCube:UpdateColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:TranslateValues)
---@param x? number The x position to sample color from/the percentage of saturation to remove from the color (ranges from 0.0 to 1.0).
---@param y? number The y position to sample color from/the percentage of brightness or value to remove from the color (ranges from 0.0 to 1.0).
---@return number # The given x position.
---@return number # The given y position.
function DColorCube:TranslateValues(x, y) end

---[CLIENT AND MENU] Updates the color cube RGB based on the given x and y position. Similar to DColorCube:TranslateValues.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCube:UpdateColor)
---@param x? number The x position to set color to/the percentage of saturation to remove from the color (ranges from 0.0 to 1.0).
---@param y? number The y position to set color to/the percentage of brightness or value to remove from the color (ranges from 0.0 to 1.0).
function DColorCube:UpdateColor(x, y) end
