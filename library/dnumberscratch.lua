---@meta

---
--- 		Choose a number from a number line, with zooming for precision.
--- 		Zoom in by moving your mouse forward and moving back does the opposite. Looks like a blue circle until you click and hold on it
---
--- 	Create the Number Scratch with the minimum number
--- 	being 0 and the max being 20
---
---@class DNumberScratch : DImageButton
local DNumberScratch = {}

---[CLIENT AND MENU] Used by DNumberScratch:DrawScreen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:DrawNotches)
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

---[CLIENT AND MENU] Used by DNumberScratch:PaintScratchWindow.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:DrawScreen)
---@param x number
---@param y number
---@param w number
---@param h number
function DNumberScratch:DrawScreen(x, y, w, h) end

---[CLIENT AND MENU] Returns whether this panel is active or not, i.e. if the player is currently changing its value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetActive)
---@return boolean #
function DNumberScratch:GetActive() end

---[CLIENT AND MENU] Returns the desired amount of numbers after the decimal point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetDecimals)
---@return number # 0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumberScratch:GetDecimals() end

---[CLIENT AND MENU] Returns the real value of the DNumberScratch as a number.
---
--- See also DNumberScratch:GetTextValue and DNumberScratch:GetFraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetFloatValue)
---@return number # The real value of the DNumberScratch
function DNumberScratch:GetFloatValue() end

---[CLIENT AND MENU] Returns the value of the DNumberScratch as a fraction, a value between 0 and 1 where 0 is the minimum and 1 is the maximum value of the DNumberScratch.
---
--- See also:
--- * DNumberScratch:GetTextValue
--- * DNumberScratch:GetFloatValue
--- * DNumberScratch:SetFraction
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetFraction)
---@return number # A value between 0 and 1
function DNumberScratch:GetFraction() end

---[CLIENT AND MENU] Returns the maximum value that can be selected on the number scratch
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetMax)
---@return number # The maximum value that can be selected on the number scratch
function DNumberScratch:GetMax() end

---[CLIENT AND MENU] Returns the minimum value that can be selected on the number scratch
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetMin)
---@return number # The minimum value that can be selected on the number scratch
function DNumberScratch:GetMin() end

---[CLIENT AND MENU] Returns the range of the DNumberScratch. Basically max value - min value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetRange)
---@return number # The range of the DNumberScratch
function DNumberScratch:GetRange() end

---[CLIENT AND MENU] Returns whether the scratch window should be visible or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetShouldDrawScreen)
---@return boolean #
function DNumberScratch:GetShouldDrawScreen() end

---[CLIENT AND MENU] Returns the real value of the DNumberScratch as a string.
---
--- See also DNumberScratch:GetFloatValue and DNumberScratch:GetFraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetTextValue)
---@return string # The real value of the DNumberScratch
function DNumberScratch:GetTextValue() end

---[CLIENT AND MENU] Returns the zoom level of the scratch window
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:GetZoom)
---@return number #
function DNumberScratch:GetZoom() end

---[CLIENT AND MENU] Returns the ideal zoom level for the panel based on the DNumberScratch:GetRange.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:IdealZoom)
---@return number # The ideal zoom level for the panel based on the panels range.
function DNumberScratch:IdealZoom() end

---[CLIENT AND MENU] Returns whether the player is currently editing the value of the DNumberScratch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:IsEditing)
---@return boolean #
function DNumberScratch:IsEditing() end

---[CLIENT AND MENU] Used to lock the cursor in place.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:LockCursor)
function DNumberScratch:LockCursor() end

---[CLIENT AND MENU] Used to paint the 'scratch' window.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:PaintScratchWindow)
function DNumberScratch:PaintScratchWindow() end

---[CLIENT AND MENU] Sets whether or not the panel is 'active'.
---
--- Forcing this panel to be active may not work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetActive)
---@param active boolean true to activate, false to deactivate.
function DNumberScratch:SetActive(active) end

---[CLIENT AND MENU] Sets the desired amount of numbers after the decimal point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetDecimals)
---@param decimals number 0 for whole numbers only, 1 for one number after the decimal point, etc.
function DNumberScratch:SetDecimals(decimals) end

---[CLIENT AND MENU] Does not trigger DNumberScratch:OnValueChanged
---
--- Use DNumberScratch:SetValue instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetFloatValue)
---@param val number The value to set
function DNumberScratch:SetFloatValue(val) end

---[CLIENT AND MENU] Sets the value of the DNumberScratch as a fraction, a value between 0 and 1 where 0 is the minimum and 1 is the maximum value of the DNumberScratch
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetFraction)
---@param frac number A value between 0 and 1
function DNumberScratch:SetFraction(frac) end

---[CLIENT AND MENU] Sets the max value that can be selected on the number scratch
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetMax)
---@param max number The maximum number
function DNumberScratch:SetMax(max) end

---[CLIENT AND MENU] Sets the minimum value that can be selected on the number scratch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetMin)
---@param min number The minimum number
function DNumberScratch:SetMin(min) end

---[CLIENT AND MENU] Sets if the scratch window should be drawn or not. Cannot be used to force it to draw, only to hide it, which will not stop the panel from working with invisible window.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetShouldDrawScreen)
---@param shouldDraw boolean
function DNumberScratch:SetShouldDrawScreen(shouldDraw) end

---[CLIENT AND MENU] Sets the value of the DNumberScratch and triggers DNumberScratch:OnValueChanged
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetValue)
---@param val number The value to set.
function DNumberScratch:SetValue(val) end

---[CLIENT AND MENU] Sets the zoom level of the scratch panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:SetZoom)
---@param zoom number
function DNumberScratch:SetZoom(zoom) end

---[CLIENT AND MENU] Forces the assigned ConVar to be updated to the value of this DNumberScratch
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNumberScratch:UpdateConVar)
function DNumberScratch:UpdateConVar() end
