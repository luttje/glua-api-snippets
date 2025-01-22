---@meta

--- DNumberWang is a VGUI element that allows you to input a numeric value using up and down arrows or direct entry.
---@class DNumberWang : DTextEntry
local DNumberWang = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the amount of decimal places allowed in the number selector, set by [DNumberWang:SetDecimals](https://wiki.facepunch.com/gmod/DNumberWang:SetDecimals)
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetDecimals)
---@return number # The amount of decimal places allowed in the number selector.
function DNumberWang:GetDecimals() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whatever is set by [DNumberWang:SetFloatValue](https://wiki.facepunch.com/gmod/DNumberWang:SetFloatValue) or 0.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetFloatValue)
---@return number #
function DNumberWang:GetFloatValue() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns a fraction representing the current number selector value to number selector min/max range ratio. If argument `val` is supplied, that number will be computed instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetFraction)
---@param val number The fraction numerator.
function DNumberWang:GetFraction(val) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns interval at which the up and down buttons change the current value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetInterval)
---@return number # The current interval.
function DNumberWang:GetInterval() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the maximum numeric value allowed by the number selector.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetMax)
---@return number # The maximum value.
function DNumberWang:GetMax() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the minimum numeric value allowed by the number selector.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetMin)
---@return number # The minimum number.
function DNumberWang:GetMin() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) This function returns the panel it is used on.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetTextArea)
---@return Panel # self
function DNumberWang:GetTextArea() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the numeric value inside the number selector.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:GetValue)
---@return number # The numeric value.
function DNumberWang:GetValue() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Hides the number selector arrows.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:HideWang)
function DNumberWang:HideWang() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the amount of decimal places allowed in the number selector.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetDecimals)
---@param num number The amount of decimal places.
function DNumberWang:SetDecimals(num) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Appears to do nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetFloatValue)
---@param val number
function DNumberWang:SetFloatValue(val) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the value of the number selector based on the given fraction number.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetFraction)
---@param val number The fraction of the number selector's range.
function DNumberWang:SetFraction(val) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets interval at which the up and down buttons change the current value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetInterval)
---@param min number The new interval.
function DNumberWang:SetInterval(min) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the maximum numeric value allowed by the number selector.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetMax)
---@param max number The maximum value.
function DNumberWang:SetMax(max) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the minimum numeric value allowed by the number selector.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetMin)
---@param min number The minimum value.
function DNumberWang:SetMin(min) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the minimum and maximum value allowed by the number selector.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetMinMax)
---@param min number The minimum value.
---@param max number The maximum value.
function DNumberWang:SetMinMax(min, max) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the value of the [DNumberWang](https://wiki.facepunch.com/gmod/DNumberWang) and triggers [DNumberWang:OnValueChanged](https://wiki.facepunch.com/gmod/DNumberWang:OnValueChanged)
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberWang:SetValue)
---@param val number The value to set.
function DNumberWang:SetValue(val) end
