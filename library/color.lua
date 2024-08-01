---@meta

---@class Color
---@field r number The red component of the color.
---@field g number The green component of the color.
---@field b number The blue component of the color.
---@field a number The alpha component of the color.
local Color = {}

---[SHARED AND MENU] Performs linear interpolation between this and given colors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Color:Lerp)
---@param target Color The target color to interpolate towards.
---@param fraction number The interpolation fraction. `0` means fully original color, `0.5` means in the middle between the 2 colors, `1` means fully target color, etc.
---@return Color #
--- 			The result of linear interpolation.
function Color:Lerp(target, fraction) end

---[SHARED] Sets the red, green, blue, and alpha of the color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Color:SetUnpacked)
---@param r number The red component
---@param g number The green component
---@param b number The blue component
---@param a number The alpha component
function Color:SetUnpacked(r, g, b, a) end

---[SHARED AND MENU] Converts a [Color](https://wiki.facepunch.com/gmod/Color) into HSL color space. This calls [Global.ColorToHSL](https://wiki.facepunch.com/gmod/Global.ColorToHSL) internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Color:ToHSL)
---@return number # The hue in degrees [0, 360).
---@return number # The saturation in the range [0, 1].
---@return number # The lightness in the range [0, 1].
function Color:ToHSL() end

---[SHARED AND MENU] Encodes a RGB [Color](https://wiki.facepunch.com/gmod/Color) into the HSV color space.
--- 		This function uses [Global.ColorToHSV](https://wiki.facepunch.com/gmod/Global.ColorToHSV) internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Color:ToHSV)
---@return number #
--- 			Degrees in range [ 0 , 360 )
---@return number #
--- 			Range [ 0 , 1 ]
---@return number #
--- 			Range [ 0 , 1 ]
function Color:ToHSV() end

---[SHARED] Returns the color as a table with four elements.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Color:ToTable)
---@return table # The table with elements 1 = r, 2 = g, 3 = b, 4 = a.
function Color:ToTable() end

---[SHARED] Translates the [Color](https://wiki.facepunch.com/gmod/Color) into a [Vector](https://wiki.facepunch.com/gmod/Vector), losing the alpha channel.
--- This will also range the values from 0 - 255 to 0 - 1
---
--- r / 255 -> x
--- g / 255 -> y
--- b / 255 -> z
---
--- This is the opposite of [Vector:ToColor](https://wiki.facepunch.com/gmod/Vector:ToColor)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Color:ToVector)
---@return Vector # The created Vector
function Color:ToVector() end

---[SHARED] Returns the red, green, blue, and alpha of the color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Color:Unpack)
---@return number # Red
---@return number # Green
---@return number # Blue
---@return number # Alpha
function Color:Unpack() end
