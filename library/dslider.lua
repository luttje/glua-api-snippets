---@meta

--- Creates a slider that can be moved along the X and/or Y axis
---@class DSlider : Panel
local DSlider = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to set the X axis convar.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:ConVarXNumberThink)
function DSlider:ConVarXNumberThink() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to set the Y axis convar.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:ConVarYNumberThink)
function DSlider:ConVarYNumberThink() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Identical to [DSlider:IsEditing](https://wiki.facepunch.com/gmod/DSlider:IsEditing)
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetDragging)
---@return boolean #
function DSlider:GetDragging() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the draggable panel's lock on the X axis.
---
--- See [DSlider:SetLockX](https://wiki.facepunch.com/gmod/DSlider:SetLockX) for more info.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetLockX)
---@return number #
function DSlider:GetLockX() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the draggable panel's lock on the Y axis.
---
--- See [DSlider:SetLockY](https://wiki.facepunch.com/gmod/DSlider:SetLockY) for more info.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetLockY)
---@return number #
function DSlider:GetLockY() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the current notch color, set by [DSlider:SetNotchColor](https://wiki.facepunch.com/gmod/DSlider:SetNotchColor)
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetNotchColor)
---@return Color # The current color
---@deprecated Does not affect anything by default.
function DSlider:GetNotchColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Appears to be non functioning, however is still used by panels such as [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetNotches)
---@return number #
function DSlider:GetNotches() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetNumSlider)
---@return any #
function DSlider:GetNumSlider() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the target position of the draggable "knob" panel of the slider on the X axis.
---
--- Set by [DSlider:SetSlideX](https://wiki.facepunch.com/gmod/DSlider:SetSlideX).
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetSlideX)
---@return number # The value range seems to be from 0 to 1
function DSlider:GetSlideX() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the target position of the draggable "knob" panel of the slider on the Y axis.
---
--- Set by [DSlider:SetSlideY](https://wiki.facepunch.com/gmod/DSlider:SetSlideY).
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetSlideY)
---@return number # The value range seems to be from 0 to 1
function DSlider:GetSlideY() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the value set by [DSlider:SetTrapInside](https://wiki.facepunch.com/gmod/DSlider:SetTrapInside).
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:GetTrapInside)
---@return boolean #
function DSlider:GetTrapInside() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns true if this element is being edited by the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:IsEditing)
---@return boolean #
function DSlider:IsEditing() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to fire [DSlider:OnValueChanged](https://wiki.facepunch.com/gmod/DSlider:OnValueChanged)
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:OnValuesChangedInternal)
function DSlider:OnValuesChangedInternal() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the background for the slider.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetBackground)
---@param path string Path to the image.
function DSlider:SetBackground(path) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) to be set when the slider changes on the X axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetConVarX)
---@param convar string Name of the convar to set.
function DSlider:SetConVarX(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) to be set when the slider changes on the Y axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetConVarY)
---@param convar string Name of the convar to set.
function DSlider:SetConVarY(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether or not the slider is being dragged.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetDragging)
---@param dragging boolean
function DSlider:SetDragging(dragging) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetImage)
function DSlider:SetImage() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetImageColor)
function DSlider:SetImageColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the lock on the X axis.
---
--- For example the value 0.5 will lock the draggable panel to half the width of the slider's panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetLockX)
---@param lockX? number Set to nil to reset lock.
---
--- The value range is from 0 to 1.
function DSlider:SetLockX(lockX) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the lock on the Y axis.
---
--- For example the value 0.5 will lock the draggable panel to half the height of the slider's panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetLockY)
---@param lockY? number Set to nil to reset lock.
---
--- The value range is from 0 to 1.
function DSlider:SetLockY(lockY) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the current notch color, overriding the color set by the derma skin.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetNotchColor)
---@param clr Color The new color to set
---@deprecated Does not affect anything by default.
function DSlider:SetNotchColor(clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Appears to be non functioning, however is still used by panels such as [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetNotches)
---@param notches number
function DSlider:SetNotches(notches) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetNumSlider)
---@param slider any
function DSlider:SetNumSlider(slider) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used to position the draggable panel of the slider on the X axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetSlideX)
---@param x number The value range seems to be from 0 to 1
function DSlider:SetSlideX(x) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used to position the draggable panel of the slider on the Y axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetSlideY)
---@param y number The value range seems to be from 0 to 1
function DSlider:SetSlideY(y) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Makes the slider itself, the "knob", trapped within the bounds of the slider panel. Example:
---
---[View wiki](https://wiki.facepunch.com/gmod/DSlider:SetTrapInside)
---@param trap boolean
function DSlider:SetTrapInside(trap) end
