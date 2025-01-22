---@meta

--- A bar to select the opacity (alpha level) of a color.
---@class DAlphaBar : DPanel
local DAlphaBar = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the base color of the alpha bar. This is the color for which the alpha channel is being modified. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DAlphaBar:GetBarColor)
---@return table # The current base color.
function DAlphaBar:GetBarColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the alpha value of the alpha bar. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DAlphaBar:GetValue)
---@return number # The current alpha value.
function DAlphaBar:GetValue() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the base color of the alpha bar. This is the color for which the alpha channel is being modified. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DAlphaBar:SetBarColor)
---@param clr table The new Color to set. See Global.Color.
function DAlphaBar:SetBarColor(clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the alpha value or the alpha bar. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DAlphaBar:SetValue)
---@param alpha number The new alpha value to set
function DAlphaBar:SetValue(alpha) end
