---@meta

---
--- 		The **DNumSlider** allows you to create a slider, allowing the user to slide it to set a value, or changing the value in the box.
---
---@class DNumSlider : Panel
local DNumSlider = {}

---[CLIENT AND MENU] Returns the amount of numbers after the decimal point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetDecimals)
---@return number # 0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumSlider:GetDecimals() end

---[CLIENT AND MENU] Returns the default value of the slider, if one was set by [DNumSlider:SetDefaultValue](https://wiki.facepunch.com/gmod/DNumSlider:SetDefaultValue)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetDefaultValue)
---@return number # The default value of the slider
function DNumSlider:GetDefaultValue() end

---[CLIENT AND MENU] Returns the maximum value of the slider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetMax)
---@return number # The maximum value of the slider
function DNumSlider:GetMax() end

---[CLIENT AND MENU] Returns the minimum value of the slider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetMin)
---@return number # The minimum value of the slider
function DNumSlider:GetMin() end

---[CLIENT AND MENU] Returns the range of the slider, basically maximum value - minimum value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetRange)
---@return number # The range of the slider
function DNumSlider:GetRange() end

---[CLIENT AND MENU] Returns the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) component of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetTextArea)
---@return Panel # The DTextEntry.
function DNumSlider:GetTextArea() end

---[CLIENT AND MENU] Returns the value of the [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetValue)
---@return number # The value of the slider.
function DNumSlider:GetValue() end

---[CLIENT AND MENU] Returns true if either the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry), the [DSlider](https://wiki.facepunch.com/gmod/DSlider) or the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch) are being edited.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:IsEditing)
---@return boolean # Whether or not the DNumSlider is being edited by the player.
function DNumSlider:IsEditing() end

---[CLIENT AND MENU] Resets the slider to the default value, if one was set by [DNumSlider:SetDefaultValue](https://wiki.facepunch.com/gmod/DNumSlider:SetDefaultValue).
---
--- This function is called by the [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider) when user middle mouse clicks on the draggable knob of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:ResetToDefaultValue)
function DNumSlider:ResetToDefaultValue() end

---[CLIENT AND MENU] Sets the console variable to be updated when the value of the slider is changed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetConVar)
---@param cvar string The name of the ConVar to be updated.
function DNumSlider:SetConVar(cvar) end

---[CLIENT AND MENU] Calls [DLabel:SetDark](https://wiki.facepunch.com/gmod/DLabel:SetDark) on the [DLabel](https://wiki.facepunch.com/gmod/DLabel) part of the [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetDark)
---@param dark boolean
function DNumSlider:SetDark(dark) end

---[CLIENT AND MENU] Sets the desired amount of numbers after the decimal point.
--- 		**NOTE**: This doesn't affect values passed to [DNumSlider:OnValueChanged](https://wiki.facepunch.com/gmod/DNumSlider:OnValueChanged).
---
--- 		**NOTE**: To get right values passed to [DNumSlider:OnValueChanged](https://wiki.facepunch.com/gmod/DNumSlider:OnValueChanged) use [math.Round](https://wiki.facepunch.com/gmod/math.Round).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetDecimals)
---@param decimals number 0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumSlider:SetDecimals(decimals) end

---[CLIENT AND MENU] Sets the default value of the slider, to be used by [DNumSlider:ResetToDefaultValue](https://wiki.facepunch.com/gmod/DNumSlider:ResetToDefaultValue) or by middle mouse clicking the draggable knob of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetDefaultValue)
---@param default number The new default value of the slider to set
function DNumSlider:SetDefaultValue(default) end

---[CLIENT AND MENU] Sets the maximum value for the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetMax)
---@param max number The value to set as maximum for the slider.
function DNumSlider:SetMax(max) end

---[CLIENT AND MENU] Sets the minimum value for the slider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetMin)
---@param min number The value to set as minimum for the slider.
function DNumSlider:SetMin(min) end

---[CLIENT AND MENU] Sets the minimum and the maximum value of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetMinMax)
---@param min number The minimum value of the slider.
---@param max number The maximum value of the slider.
function DNumSlider:SetMinMax(min, max) end

---[CLIENT AND MENU] Sets the value of the [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetValue)
---@param val number The value to set.
function DNumSlider:SetValue(val) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:TranslateSliderValues)
---@param x number
---@param y number
---@return number #
---@return number # The second passed argument.
function DNumSlider:TranslateSliderValues(x, y) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Updates visual notches on the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:UpdateNotches)
function DNumSlider:UpdateNotches() end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called when the value has been changed. This will also be called when the user manually changes the value through the text panel.
---
--- This is an internal function. Override [DNumSlider:OnValueChanged](https://wiki.facepunch.com/gmod/DNumSlider:OnValueChanged) instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:ValueChanged)
---@param value number The value the slider has been changed to.
function DNumSlider:ValueChanged(value) end
