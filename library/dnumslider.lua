---@meta

---@class DNumSlider : Panel
local DNumSlider = {}

---[CLIENT] Returns the amount of numbers after the decimal point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetDecimals)
---@return number #0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumSlider:GetDecimals() end

---[CLIENT] Returns the default value of the slider, if one was set by DNumSlider:SetDefaultValue
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetDefaultValue)
---@return number #The default value of the slider
function DNumSlider:GetDefaultValue() end

---[CLIENT] Returns the maximum value of the slider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetMax)
---@return number #The maximum value of the slider
function DNumSlider:GetMax() end

---[CLIENT] Returns the minimum value of the slider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetMin)
---@return number #The minimum value of the slider
function DNumSlider:GetMin() end

---[CLIENT] Returns the range of the slider, basically maximum value - minimum value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetRange)
---@return number #The range of the slider
function DNumSlider:GetRange() end

---[CLIENT] Returns the DTextEntry component of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetTextArea)
---@return Panel #The DTextEntry.
function DNumSlider:GetTextArea() end

---[CLIENT] Returns the value of the DNumSlider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:GetValue)
---@return number #The value of the slider.
function DNumSlider:GetValue() end

---[CLIENT] Returns true if either the DTextEntry, the DSlider or the DNumberScratch are being edited.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:IsEditing)
---@return boolean #Whether or not the DNumSlider is being edited by the player.
function DNumSlider:IsEditing() end

---[CLIENT] Resets the slider to the default value, if one was set by DNumSlider:SetDefaultValue.
---
--- This function is called by the DNumSlider when user middle mouse clicks on the draggable knob of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:ResetToDefaultValue)
function DNumSlider:ResetToDefaultValue() end

---[CLIENT] Sets the console variable to be updated when the value of the slider is changed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetConVar)
---@param cvar string The name of the ConVar to be updated.
function DNumSlider:SetConVar(cvar) end

---[CLIENT] Calls DLabel:SetDark on the DLabel part of the DNumSlider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetDark)
---@param dark boolean
function DNumSlider:SetDark(dark) end

---[CLIENT] Sets the desired amount of numbers after the decimal point.
---
--- 			This doesn't affect values passed to DNumSlider:OnValueChanged.
---
---
---
--- 			To get right values passed to DNumSlider:OnValueChanged use math.Round.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetDecimals)
---@param decimals number 0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumSlider:SetDecimals(decimals) end

---[CLIENT] Sets the default value of the slider, to be used by DNumSlider:ResetToDefaultValue or by middle mouse clicking the draggable knob of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetDefaultValue)
---@param default number The new default value of the slider to set
function DNumSlider:SetDefaultValue(default) end

---[CLIENT] Sets the maximum value for the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetMax)
---@param max number The value to set as maximum for the slider.
function DNumSlider:SetMax(max) end

---[CLIENT] Sets the minimum value for the slider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetMin)
---@param min number The value to set as minimum for the slider.
function DNumSlider:SetMin(min) end

---[CLIENT] Sets the minimum and the maximum value of the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetMinMax)
---@param min number The minimum value of the slider.
---@param max number The maximum value of the slider.
function DNumSlider:SetMinMax(min, max) end

---[CLIENT] Sets the value of the DNumSlider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:SetValue)
---@param val number The value to set.
function DNumSlider:SetValue(val) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:TranslateSliderValues)
---@param x number
---@param y number
---@return number, number #number -
---@return number, number #number - The second passed argument.
function DNumSlider:TranslateSliderValues(x, y) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:UpdateNotches)
function DNumSlider:UpdateNotches() end

---[CLIENT] Called when the value has been changed. This will also be called when the user manually changes the value through the text panel.
---
--- This is an internal function. Override DNumSlider:OnValueChanged instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumSlider:ValueChanged)
---@param value number The value the slider has been changed to.
function DNumSlider:ValueChanged(value) end
