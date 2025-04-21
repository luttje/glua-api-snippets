---@meta

--- Choose a number from a number line, with zooming for precision.
--- Zoom in by moving your mouse forward and moving back does the opposite. Looks like a blue circle until you click and hold on it
---@class DNumberScratch : DImageButton
local DNumberScratch = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used by [DNumberScratch:DrawScreen](https://wiki.facepunch.com/gmod/DNumberScratch:DrawScreen).
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:DrawNotches)
---@param level number
---@param x number
---@param y number
---@param w number
---@param h number
---@param range number
---@param value number
---@param min number
---@param max number
function DNumberScratch:DrawNotches(level, x, y, w, h, range, value, min, max) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used by [DNumberScratch:PaintScratchWindow](https://wiki.facepunch.com/gmod/DNumberScratch:PaintScratchWindow).
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:DrawScreen)
---@param x number
---@param y number
---@param w number
---@param h number
function DNumberScratch:DrawScreen(x, y, w, h) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether this panel is active or not, i.e. if the player is currently changing its value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetActive)
---@return boolean #
function DNumberScratch:GetActive() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the desired amount of numbers after the decimal point.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetDecimals)
---@return number # 0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumberScratch:GetDecimals() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the real value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch) as a number.
---
--- See also [DNumberScratch:GetTextValue](https://wiki.facepunch.com/gmod/DNumberScratch:GetTextValue) and [DNumberScratch:GetFraction](https://wiki.facepunch.com/gmod/DNumberScratch:GetFraction).
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetFloatValue)
---@return number # The real value of the DNumberScratch
function DNumberScratch:GetFloatValue() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch) as a fraction, a value between 0 and 1 where 0 is the minimum and 1 is the maximum value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch).
---
--- See also:
--- * [DNumberScratch:GetTextValue](https://wiki.facepunch.com/gmod/DNumberScratch:GetTextValue)
--- * [DNumberScratch:GetFloatValue](https://wiki.facepunch.com/gmod/DNumberScratch:GetFloatValue)
--- * [DNumberScratch:SetFraction](https://wiki.facepunch.com/gmod/DNumberScratch:SetFraction)
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetFraction)
---@return number # A value between 0 and 1
function DNumberScratch:GetFraction() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the maximum value that can be selected on the number scratch
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetMax)
---@return number # The maximum value that can be selected on the number scratch
function DNumberScratch:GetMax() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the minimum value that can be selected on the number scratch
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetMin)
---@return number # The minimum value that can be selected on the number scratch
function DNumberScratch:GetMin() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the range of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch). Basically max value - min value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetRange)
---@return number # The range of the DNumberScratch
function DNumberScratch:GetRange() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the scratch window should be visible or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetShouldDrawScreen)
---@return boolean #
function DNumberScratch:GetShouldDrawScreen() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the real value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch) as a string.
---
--- See also [DNumberScratch:GetFloatValue](https://wiki.facepunch.com/gmod/DNumberScratch:GetFloatValue) and [DNumberScratch:GetFraction](https://wiki.facepunch.com/gmod/DNumberScratch:GetFraction).
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetTextValue)
---@return string # The real value of the DNumberScratch
function DNumberScratch:GetTextValue() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the zoom level of the scratch window
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:GetZoom)
---@return number #
function DNumberScratch:GetZoom() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the ideal zoom level for the panel based on the [DNumberScratch:GetRange](https://wiki.facepunch.com/gmod/DNumberScratch:GetRange).
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:IdealZoom)
---@return number # The ideal zoom level for the panel based on the panels range.
function DNumberScratch:IdealZoom() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the player is currently editing the value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch).
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:IsEditing)
---@return boolean #
function DNumberScratch:IsEditing() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used to lock the cursor in place.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:LockCursor)
function DNumberScratch:LockCursor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used to paint the 'scratch' window.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:PaintScratchWindow)
function DNumberScratch:PaintScratchWindow() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether or not the panel is 'active'.
---
--- Forcing this panel to be active may not work.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetActive)
---@param active boolean true to activate, false to deactivate.
function DNumberScratch:SetActive(active) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the desired amount of numbers after the decimal point.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetDecimals)
---@param decimals number 0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumberScratch:SetDecimals(decimals) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Does not trigger [DNumberScratch:OnValueChanged](https://wiki.facepunch.com/gmod/DNumberScratch:OnValueChanged)
---
--- Use [DNumberScratch:SetValue](https://wiki.facepunch.com/gmod/DNumberScratch:SetValue) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetFloatValue)
---@param val number The value to set
function DNumberScratch:SetFloatValue(val) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch) as a fraction, a value between 0 and 1 where 0 is the minimum and 1 is the maximum value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch)
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetFraction)
---@param frac number A value between 0 and 1
function DNumberScratch:SetFraction(frac) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the max value that can be selected on the number scratch
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetMax)
---@param max number The maximum number
function DNumberScratch:SetMax(max) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the minimum value that can be selected on the number scratch.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetMin)
---@param min number The minimum number
function DNumberScratch:SetMin(min) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets if the scratch window should be drawn or not. Cannot be used to force it to draw, only to hide it, which will not stop the panel from working with invisible window.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetShouldDrawScreen)
---@param shouldDraw boolean
function DNumberScratch:SetShouldDrawScreen(shouldDraw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the value of the [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch) and triggers [DNumberScratch:OnValueChanged](https://wiki.facepunch.com/gmod/DNumberScratch:OnValueChanged)
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetValue)
---@param val number The value to set.
function DNumberScratch:SetValue(val) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the zoom level of the scratch panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:SetZoom)
---@param zoom number
function DNumberScratch:SetZoom(zoom) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Forces the assigned ConVar to be updated to the value of this [DNumberScratch](https://wiki.facepunch.com/gmod/DNumberScratch)
---
---[View wiki](https://wiki.facepunch.com/gmod/DNumberScratch:UpdateConVar)
function DNumberScratch:UpdateConVar() end
