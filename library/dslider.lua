---@meta

--- Creates a slider that can be moved along the X and/or Y axisMake a slider at 50, 50 that can move 100 pixels on the X axis.
---@class DSlider : Panel
local DSlider = {}

---[CLIENT AND MENU] Used internally to set the X axis convar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:ConVarXNumberThink)
function DSlider:ConVarXNumberThink() end

---[CLIENT AND MENU] Used internally to set the Y axis convar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:ConVarYNumberThink)
function DSlider:ConVarYNumberThink() end

---[CLIENT AND MENU] Identical to DSlider:IsEditing
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetDragging)
---@return boolean #
function DSlider:GetDragging() end

---[CLIENT AND MENU] Returns the draggable panel's lock on the X axis.
---
--- See DSlider:SetLockX for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetLockX)
---@return number #
function DSlider:GetLockX() end

---[CLIENT AND MENU] Returns the draggable panel's lock on the Y axis.
---
--- See DSlider:SetLockY for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetLockY)
---@return number #
function DSlider:GetLockY() end

---[CLIENT AND MENU] Returns the current notch color, set by DSlider:SetNotchColor
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetNotchColor)
---@return Color # The current color
---@deprecated Does not affect anything by default.
function DSlider:GetNotchColor() end

---[CLIENT AND MENU] Appears to be non functioning, however is still used by panels such as DNumSlider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetNotches)
---@return number #
function DSlider:GetNotches() end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetNumSlider)
---@return any #
function DSlider:GetNumSlider() end

---[CLIENT AND MENU] Returns the target position of the draggable "knob" panel of the slider on the X axis.
---
--- Set by DSlider:SetSlideX.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetSlideX)
---@return number # The value range seems to be from 0 to 1
function DSlider:GetSlideX() end

---[CLIENT AND MENU] Returns the target position of the draggable "knob" panel of the slider on the Y axis.
---
--- Set by DSlider:SetSlideY.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetSlideY)
---@return number # The value range seems to be from 0 to 1
function DSlider:GetSlideY() end

---[CLIENT AND MENU] Returns the value set by DSlider:SetTrapInside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetTrapInside)
---@return boolean #
function DSlider:GetTrapInside() end

---[CLIENT AND MENU] Returns true if this element is being edited by the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:IsEditing)
---@return boolean #
function DSlider:IsEditing() end

---[CLIENT AND MENU] Used internally to fire DSlider:OnValueChanged
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:OnValuesChangedInternal)
function DSlider:OnValuesChangedInternal() end

---[CLIENT AND MENU] Sets the background for the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetBackground)
---@param path string Path to the image.
function DSlider:SetBackground(path) end

---[CLIENT AND MENU] Sets the ConVar to be set when the slider changes on the X axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetConVarX)
---@param convar string Name of the convar to set.
function DSlider:SetConVarX(convar) end

---[CLIENT AND MENU] Sets the ConVar to be set when the slider changes on the Y axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetConVarY)
---@param convar string Name of the convar to set.
function DSlider:SetConVarY(convar) end

---[CLIENT AND MENU] Sets whether or not the slider is being dragged.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetDragging)
---@param dragging boolean
function DSlider:SetDragging(dragging) end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetImage)
function DSlider:SetImage() end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetImageColor)
function DSlider:SetImageColor() end

---[CLIENT AND MENU] Sets the lock on the X axis.
---
--- For example the value 0.5 will lock the draggable panel to half the width of the slider's panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetLockX)
---@param lockX? number Set to nil to reset lock.
---
--- The value range is from 0 to 1.
function DSlider:SetLockX(lockX) end

---[CLIENT AND MENU] Sets the lock on the Y axis.
---
--- For example the value 0.5 will lock the draggable panel to half the height of the slider's panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetLockY)
---@param lockY? number Set to nil to reset lock.
---
--- The value range is from 0 to 1.
function DSlider:SetLockY(lockY) end

---[CLIENT AND MENU] Sets the current notch color, overriding the color set by the derma skin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetNotchColor)
---@param clr Color The new color to set
---@deprecated Does not affect anything by default.
function DSlider:SetNotchColor(clr) end

---[CLIENT AND MENU] Appears to be non functioning, however is still used by panels such as DNumSlider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetNotches)
---@param notches number
function DSlider:SetNotches(notches) end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetNumSlider)
---@param slider any
function DSlider:SetNumSlider(slider) end

---[CLIENT AND MENU] Used to position the draggable panel of the slider on the X axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetSlideX)
---@param x number The value range seems to be from 0 to 1
function DSlider:SetSlideX(x) end

---[CLIENT AND MENU] Used to position the draggable panel of the slider on the Y axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetSlideY)
---@param y number The value range seems to be from 0 to 1
function DSlider:SetSlideY(y) end

---[CLIENT AND MENU] Makes the slider itself, the "knob", trapped within the bounds of the slider panel. Example:
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetTrapInside)
---@param trap boolean
function DSlider:SetTrapInside(trap) end
