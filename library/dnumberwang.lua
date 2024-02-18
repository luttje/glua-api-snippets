---@meta

--- DNumberWang is a VGUI element that allows you to input a numeric value using up and down arrows or direct entry.Create the Number Wang with the minimum number being 0 and the max being 100
---@class DNumberWang : DTextEntry
local DNumberWang = {}

---[CLIENT AND MENU] Returns the amount of decimal places allowed in the number selector, set by DNumberWang:SetDecimals
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetDecimals)
---@return number # The amount of decimal places allowed in the number selector.
function DNumberWang:GetDecimals() end

---[CLIENT AND MENU] Returns whatever is set by DNumberWang:SetFloatValue or 0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetFloatValue)
---@return number #
function DNumberWang:GetFloatValue() end

---[CLIENT AND MENU] Returns a fraction representing the current number selector value to number selector min/max range ratio. If argument `val` is supplied, that number will be computed instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetFraction)
---@param val number The fraction numerator.
function DNumberWang:GetFraction(val) end

---[CLIENT AND MENU] Returns interval at which the up and down buttons change the current value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetInterval)
---@return number # The current interval.
function DNumberWang:GetInterval() end

---[CLIENT AND MENU] Returns the maximum numeric value allowed by the number selector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetMax)
---@return number # The maximum value.
function DNumberWang:GetMax() end

---[CLIENT AND MENU] Returns the minimum numeric value allowed by the number selector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetMin)
---@return number # The minimum number.
function DNumberWang:GetMin() end

---[CLIENT AND MENU] This function returns the panel it is used on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetTextArea)
---@return Panel # self
function DNumberWang:GetTextArea() end

---[CLIENT AND MENU] Returns the numeric value inside the number selector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:GetValue)
---@return number # The numeric value.
function DNumberWang:GetValue() end

---[CLIENT AND MENU] Hides the number selector arrows.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:HideWang)
function DNumberWang:HideWang() end

---[CLIENT AND MENU] Sets the amount of decimal places allowed in the number selector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetDecimals)
---@param num number The amount of decimal places.
function DNumberWang:SetDecimals(num) end

---[CLIENT AND MENU] Appears to do nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetFloatValue)
---@param val number
function DNumberWang:SetFloatValue(val) end

---[CLIENT AND MENU] Sets the value of the number selector based on the given fraction number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetFraction)
---@param val number The fraction of the number selector's range.
function DNumberWang:SetFraction(val) end

---[CLIENT AND MENU] Sets interval at which the up and down buttons change the current value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetInterval)
---@param min number The new interval.
function DNumberWang:SetInterval(min) end

---[CLIENT AND MENU] Sets the maximum numeric value allowed by the number selector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetMax)
---@param max number The maximum value.
function DNumberWang:SetMax(max) end

---[CLIENT AND MENU] Sets the minimum numeric value allowed by the number selector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetMin)
---@param min number The minimum value.
function DNumberWang:SetMin(min) end

---[CLIENT AND MENU] Sets the minimum and maximum value allowed by the number selector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetMinMax)
---@param min number The minimum value.
---@param max number The maximum value.
function DNumberWang:SetMinMax(min, max) end

---[CLIENT AND MENU] Sets the value of the DNumberWang and triggers DNumberWang:OnValueChanged
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberWang:SetValue)
---@param val number The value to set.
function DNumberWang:SetValue(val) end
