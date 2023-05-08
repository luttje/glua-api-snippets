---@meta

---@class DSlider : Panel
local DSlider = {}

---[CLIENT] Identical to DSlider:IsEditing
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetDragging)
---@return boolean #
function DSlider:GetDragging() end

---[CLIENT] Returns the draggable panel's lock on the X axis.
---
--- See DSlider:SetLockX for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetLockX)
---@return number #
function DSlider:GetLockX() end

---[CLIENT] Returns the draggable panel's lock on the Y axis.
---
--- See DSlider:SetLockY for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetLockY)
---@return number #
function DSlider:GetLockY() end

---[CLIENT] Does not affect anything by default.
--- Returns the current notch color, set by DSlider:SetNotchColor
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetNotchColor)
---@return Color #The current color
function DSlider:GetNotchColor() end

---[CLIENT] Appears to be non functioning, however is still used by panels such as DNumSlider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetNotches)
---@return number #
function DSlider:GetNotches() end

---[CLIENT] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetNumSlider)
---@return any #
function DSlider:GetNumSlider() end

---[CLIENT] Returns the target position of the draggable "knob" panel of the slider on the X axis.
---
--- Set by DSlider:SetSlideX.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetSlideX)
---@return number #The value range seems to be from 0 to 1
function DSlider:GetSlideX() end

---[CLIENT] Returns the target position of the draggable "knob" panel of the slider on the Y axis.
---
--- Set by DSlider:SetSlideY.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetSlideY)
---@return number #The value range seems to be from 0 to 1
function DSlider:GetSlideY() end

---[CLIENT] Returns the value set by DSlider:SetTrapInside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:GetTrapInside)
---@return boolean #
function DSlider:GetTrapInside() end

---[CLIENT] Returns true if this element is being edited by the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:IsEditing)
---@return boolean #
function DSlider:IsEditing() end

---[CLIENT] Sets the background for the slider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetBackground)
---@param path string Path to the image.
function DSlider:SetBackground(path) end

---[CLIENT] Sets whether or not the slider is being dragged.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetDragging)
---@param dragging boolean
function DSlider:SetDragging(dragging) end

---[CLIENT] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetImage)
function DSlider:SetImage() end

---[CLIENT] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetImageColor)
function DSlider:SetImageColor() end

---[CLIENT] Sets the lock on the X axis.
---
--- For example the value 0.5 will lock the draggable panel to half the width of the slider's panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetLockX)
---@param lockX? number Set to nil to reset lock.
---
--- The value range is from 0 to 1.
function DSlider:SetLockX(lockX) end

---[CLIENT] Sets the lock on the Y axis.
---
--- For example the value 0.5 will lock the draggable panel to half the height of the slider's panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetLockY)
---@param lockY? number Set to nil to reset lock.
---
--- The value range is from 0 to 1.
function DSlider:SetLockY(lockY) end

---[CLIENT] Does not affect anything by default.
--- Sets the current notch color, overriding the color set by the derma skin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetNotchColor)
---@param clr Color The new color to set
function DSlider:SetNotchColor(clr) end

---[CLIENT] Appears to be non functioning, however is still used by panels such as DNumSlider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetNotches)
---@param notches number
function DSlider:SetNotches(notches) end

---[CLIENT] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetNumSlider)
---@param slider any
function DSlider:SetNumSlider(slider) end

---[CLIENT] Used to position the draggable panel of the slider on the X axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetSlideX)
---@param x number The value range seems to be from 0 to 1
function DSlider:SetSlideX(x) end

---[CLIENT] Used to position the draggable panel of the slider on the Y axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetSlideY)
---@param y number The value range seems to be from 0 to 1
function DSlider:SetSlideY(y) end

---[CLIENT] Makes the slider itself, the "knob", trapped within the bounds of the slider panel. Example:
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSlider:SetTrapInside)
---@param trap boolean
function DSlider:SetTrapInside(trap) end
