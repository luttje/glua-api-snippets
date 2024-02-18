---@meta

--- Creates an invisible vertical divider between two GUI elements.Insert a horizontal divider between two DPanels in a DFrame.
---@class DHorizontalDivider : DPanel
local DHorizontalDivider = {}

---[CLIENT] Returns the width of the horizontal divider bar, set by DHorizontalDivider:SetDividerWidth.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetDividerWidth)
---@return number # The width of the horizontal divider bar
function DHorizontalDivider:GetDividerWidth() end

---[CLIENT] Returns whether or not the player is currently dragging the middle divider bar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetDragging)
---@return boolean # Whether or not the player is currently dragging the middle divider bar.
function DHorizontalDivider:GetDragging() end

---[CLIENT] Returns the local X coordinate of where the player started dragging the thing
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetHoldPos)
---@return number #
function DHorizontalDivider:GetHoldPos() end

---[CLIENT] Returns the left side content of the DHorizontalDivider
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeft)
---@return Panel # The content on the left side
function DHorizontalDivider:GetLeft() end

---[CLIENT] Returns the minimum width of the left side, set by DHorizontalDivider:SetLeftMin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeftMin)
---@return number # The minimum width of the left side
function DHorizontalDivider:GetLeftMin() end

---[CLIENT] Returns the current width of the left side, set by DHorizontalDivider:SetLeftWidth or by the user.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeftWidth)
---@return number # The current width of the left side
function DHorizontalDivider:GetLeftWidth() end

---[CLIENT] Returns the middle content, set by DHorizontalDivider:SetMiddle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetMiddle)
---@return Panel # The middle content
function DHorizontalDivider:GetMiddle() end

---[CLIENT] Returns the right side content
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetRight)
---@return Panel # The right side content
function DHorizontalDivider:GetRight() end

---[CLIENT] Returns the minimum width of the right side, set by DHorizontalDivider:SetRightMin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetRightMin)
---@return number # The minimum width of the right side
function DHorizontalDivider:GetRightMin() end

---[CLIENT] Sets the width of the horizontal divider bar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDividerWidth)
---@param width number The width of the horizontal divider bar.
function DHorizontalDivider:SetDividerWidth(width) end

---[CLIENT] Sets whether the player is dragging the divider or not
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDragging)
---@param dragonot boolean
function DHorizontalDivider:SetDragging(dragonot) end

---[CLIENT] Sets the local X coordinate of where the player started dragging the thing
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetHoldPos)
---@param x number
function DHorizontalDivider:SetHoldPos(x) end

---[CLIENT] Sets the left side content of the DHorizontalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeft)
---@param pnl Panel The panel to set as the left side
function DHorizontalDivider:SetLeft(pnl) end

---[CLIENT] Sets the minimum width of the left side
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftMin)
---@param minWidth number The minimum width of the left side
function DHorizontalDivider:SetLeftMin(minWidth) end

---[CLIENT] Sets the current/starting width of the left side.
---
--- The width of the right side is automatically calculated by subtracting this from the total width of the DHorizontalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftWidth)
---@param width number The current/starting width of the left side
function DHorizontalDivider:SetLeftWidth(width) end

---[CLIENT] Sets the middle content, over the draggable divider bar panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetMiddle)
---@param middle Panel The middle content
function DHorizontalDivider:SetMiddle(middle) end

---[CLIENT] Sets the right side content
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRight)
---@param pnl Panel The right side content
function DHorizontalDivider:SetRight(pnl) end

---[CLIENT] Sets the minimum width of the right side
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRightMin)
---@param minWidth number The minimum width of the right side
function DHorizontalDivider:SetRightMin(minWidth) end

---[CLIENT] TODO Document me
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalDivider:StartGrab)
function DHorizontalDivider:StartGrab() end
