---@meta

---@class Color
---@field r number The red component of the color.
---@field g number The green component of the color.
---@field b number The blue component of the color.
---@field a number The alpha component of the color.
local Color = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model), adds given value to the "blackness" and converts it back into an RGB color.
---
--- A slightly more efficient combination of [COLOR:GetBlackness](https://wiki.facepunch.com/gmod/COLOR:GetBlackness) & [COLOR:SetBlackness](https://wiki.facepunch.com/gmod/COLOR:SetBlackness)
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:AddBlackness)
---@param blackness number The "blackness" value to add in range [0, 1]
function Color:AddBlackness(blackness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV), adds given value to the [brightness also known as "value"](https://en.wikipedia.org/wiki/Brightness) and converts it back into an RGB color.
---
--- A slightly more efficient combination of [COLOR:GetBrightness](https://wiki.facepunch.com/gmod/COLOR:GetBrightness) & [COLOR:SetBrightness](https://wiki.facepunch.com/gmod/COLOR:SetBrightness)
---
--- This is useful to quickly change the saturation of the color without changing hue or luminance, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:AddBrightness)
---@param saturation number The brightness value to add in range [0, 1]
function Color:AddBrightness(saturation) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV), adds given value to the [hue](https://en.wikipedia.org/wiki/Hue) and converts it back into an RGB color.
---
--- A slightly more efficient combination of [COLOR:GetHue](https://wiki.facepunch.com/gmod/COLOR:GetHue) & [COLOR:SetHue](https://wiki.facepunch.com/gmod/COLOR:SetHue)
---
--- This is useful to quickly change the hue of the color without changing saturation or luminance, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:AddHue)
---@param hue number The hue value to add in degrees [0, 360).
function Color:AddHue(hue) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSL color space](https://en.wikipedia.org/wiki/HSL_and_HSV), adds given value to the ["lightness"](https://en.wikipedia.org/wiki/Lightness) and converts it back into an RGB color.
---
--- A slightly more efficient combination of [COLOR:GetLightness](https://wiki.facepunch.com/gmod/COLOR:GetLightness) & [COLOR:SetLightness](https://wiki.facepunch.com/gmod/COLOR:SetLightness)
---
--- This is useful to quickly change the lightness of the color without changing hue or saturation, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:AddLightness)
---@param lightness number The lightness value to add in range [0, 1]
function Color:AddLightness(lightness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV), adds given value to the [saturation](https://en.wikipedia.org/wiki/Colorfulness) and converts it back into an RGB color.
---
--- A slightly more efficient combination of [COLOR:GetSaturation](https://wiki.facepunch.com/gmod/COLOR:GetSaturation) & [COLOR:SetSaturation](https://wiki.facepunch.com/gmod/COLOR:SetSaturation)
---
--- This is useful to quickly change the saturation of the color without changing hue or luminance, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:AddSaturation)
---@param saturation number The saturation value to add in range [0, 1]
function Color:AddSaturation(saturation) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model), adds given value to the "whiteness" and converts it back into an RGB color.
---
--- A slightly more efficient combination of [COLOR:GetWhiteness](https://wiki.facepunch.com/gmod/COLOR:GetWhiteness) & [COLOR:SetWhiteness](https://wiki.facepunch.com/gmod/COLOR:SetWhiteness)
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:AddWhiteness)
---@param whiteness number The "whiteness" value to add in range [0, 1]
function Color:AddWhiteness(whiteness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a copy of this color, usually so it can be safely modified later without affecting the original color.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:Copy)
---@return Color # The copy of the given color, safe to modify.
function Color:Copy() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model) and returns the "blackness" of the color.
---
--- See [COLOR:ToHWB](https://wiki.facepunch.com/gmod/COLOR:ToHWB) if you want to get all 3 components.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:GetBlackness)
---@return number # Blackness of the color in range [0, 1]
function Color:GetBlackness() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV) and returns the [brightness also known as "value"](https://en.wikipedia.org/wiki/Brightness).
---
--- See [COLOR:ToHSV](https://wiki.facepunch.com/gmod/COLOR:ToHSV) if you want to get all 3 components.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:GetBrightness)
---@return number # Brightness in range [0, 1]
function Color:GetBrightness() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV) and returns the [hue](https://en.wikipedia.org/wiki/Hue).
---
--- See [COLOR:ToHSV](https://wiki.facepunch.com/gmod/COLOR:ToHSV) if you want to get all 3 components.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:GetHue)
---@return number # The hue in degrees [0, 360).
function Color:GetHue() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSL color space](https://en.wikipedia.org/wiki/HSL_and_HSV) and returns the ["lightness"](https://en.wikipedia.org/wiki/Lightness) of the color.
---
--- See [COLOR:ToHSL](https://wiki.facepunch.com/gmod/COLOR:ToHSL) if you want to get all 3 components.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:GetLightness)
---@return number # Lightness in range [0, 1]
function Color:GetLightness() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV) and returns the [saturation](https://en.wikipedia.org/wiki/Colorfulness).
---
--- See [COLOR:ToHSV](https://wiki.facepunch.com/gmod/COLOR:ToHSV) if you want to get all 3 components.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:GetSaturation)
---@return number # Saturation in range [0, 1]
function Color:GetSaturation() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model) and returns the "whiteness" of the color.
---
--- See [COLOR:ToHWB](https://wiki.facepunch.com/gmod/COLOR:ToHWB) if you want to get all 3 components.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:GetWhiteness)
---@return number # Whiteness of the color in range [0, 1]
function Color:GetWhiteness() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs linear interpolation between this and given colors.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:Lerp)
---@param target Color The target color to interpolate towards.
---@param fraction number The interpolation fraction. `0` means fully original color, `0.5` means in the middle between the 2 colors, `1` means fully target color, etc.
---@return Color # The result of linear interpolation.
function Color:Lerp(target, fraction) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model), sets the "blackness" and converts it back into an RGB color.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:SetBlackness)
---@param blackness number The new "blackness" value in range [0, 1]
function Color:SetBlackness(blackness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV), sets the [brightness also known as "value"](https://en.wikipedia.org/wiki/Brightness) and converts it back into an RGB color.
---
--- This is useful to quickly change the brightness of the color without changing hue or saturation, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:SetBrightness)
---@param saturation number The new brightness value in range [0, 1]
function Color:SetBrightness(saturation) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV), sets the [hue](https://en.wikipedia.org/wiki/Hue) and converts it back into an RGB color.
---
--- This is useful to quickly change the hue of the color without changing saturation or luminance, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:SetHue)
---@param hue number The new hue value in degrees [0, 360).
function Color:SetHue(hue) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSL color space](https://en.wikipedia.org/wiki/HSL_and_HSV), sets the ["lightness"](https://en.wikipedia.org/wiki/Lightness) and converts it back into an RGB color.
---
--- This is useful to quickly change the lightness of the color without changing hue or saturation, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:SetLightness)
---@param lightness number The new lightness value in range [0, 1]
function Color:SetLightness(lightness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV), sets the [saturation](https://en.wikipedia.org/wiki/Colorfulness) and converts it back into an RGB color.
---
--- This is useful to quickly change the saturation of the color without changing hue or luminance, allowing for things like easy theming.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:SetSaturation)
---@param saturation number The new saturation value in range [0, 1]
function Color:SetSaturation(saturation) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the red, green, blue, and alpha of the color.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:SetUnpacked)
---@param r number The red component
---@param g number The green component
---@param b number The blue component
---@param a number The alpha component
function Color:SetUnpacked(r, g, b, a) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model), sets the "whiteness" and converts it back into an RGB color.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:SetWhiteness)
---@param whiteness number The new "whiteness" value in range [0, 1]
function Color:SetWhiteness(whiteness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) to its hexadecimal representation.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:ToHex)
---@param boolean? boolean Whether to forcibly omit the alpha channel from the output.
---@return string # The hexadecimal representation of the color. (`#RRGGBBAA`)
---
--- If the alpha channel is `255`, it will be omitted from the output (`#RRGGBB`)
function Color:ToHex(boolean) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HSL color space](https://en.wikipedia.org/wiki/HSL_and_HSV) .
---
--- This calls [Global.ColorToHSL](https://wiki.facepunch.com/gmod/Global.ColorToHSL) internally.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:ToHSL)
---@return number # The hue in degrees [0, 360).
---@return number # The saturation in the range [0, 1].
---@return number # The lightness in the range [0, 1].
function Color:ToHSL() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Encodes a RGB [Color](https://wiki.facepunch.com/gmod/Color) into the [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV).
---
--- This function uses [Global.ColorToHSV](https://wiki.facepunch.com/gmod/Global.ColorToHSV) internally.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:ToHSV)
---@return number # Hue in degrees in range [0, 360)
---@return number # Saturation in range [0, 1]
---@return number # Brightness in range [0, 1]
function Color:ToHSV() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model). See [Global.HWBToColor](https://wiki.facepunch.com/gmod/Global.HWBToColor) for more info.
---
---[View wiki](https://wiki.facepunch.com/gmod/COLOR:ToHWB)
---@return number # The hue in degrees [0, 360).
---@return number # The whiteness in the range [0, 1].
---@return number # The blacknessin the range [0, 1].
function Color:ToHWB() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the color as a table (an array or a list) with four elements.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:ToTable)
---@return table # The table with elements 1 = r, 2 = g, 3 = b, 4 = a,( `{ r, g, b, a }` )
function Color:ToTable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Translates the [Color](https://wiki.facepunch.com/gmod/Color) into a [Vector](https://wiki.facepunch.com/gmod/Vector), losing the alpha channel.
--- This will also range the values from 0 - 255 to 0 - 1
---
--- r / 255 -> x
--- g / 255 -> y
--- b / 255 -> z
---
--- This is the opposite of [Vector:ToColor](https://wiki.facepunch.com/gmod/Vector:ToColor)
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:ToVector)
---@return Vector # The created Vector
function Color:ToVector() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the red, green, blue, and alpha of the color.
---
---[View wiki](https://wiki.facepunch.com/gmod/Color:Unpack)
---@return number # Red
---@return number # Green
---@return number # Blue
---@return number # Alpha
function Color:Unpack() end
