---@meta

--- Vertical version of DHorizontalDivider.
---@class DVerticalDivider : DPanel
local DVerticalDivider = {}

---[CLIENT] Used internally to clamp the vertical divider to DVerticalDivider:GetTopMin and DVerticalDivider:GetBottomMin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:DoConstraints)
function DVerticalDivider:DoConstraints() end

---[CLIENT] Returns the bottom content panel of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetBottom)
---@return Panel # The bottom content panel.
function DVerticalDivider:GetBottom() end

---[CLIENT] Returns the minimum height of the bottom content panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetBottomMin)
---@return number # The minimum height of the bottom content panel.
function DVerticalDivider:GetBottomMin() end

---[CLIENT] Returns the height of the divider bar between the top and bottom content panels of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetDividerHeight)
---@return number # The height of the divider bar.
function DVerticalDivider:GetDividerHeight() end

---[CLIENT] Returns whether the divider is being dragged or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetDragging)
---@return boolean # If true, mouse movement will alter the size of the divider.
function DVerticalDivider:GetDragging() end

---[CLIENT] Returns the local Y position of where the user starts dragging the divider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetHoldPos)
---@return number # The local Y position where divider dragging has started.
function DVerticalDivider:GetHoldPos() end

---[CLIENT] Returns the middle content panel of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetMiddle)
---@return Panel # The middle content panel.
function DVerticalDivider:GetMiddle() end

---[CLIENT] Returns the top content panel of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTop)
---@return Panel # The top content panel.
function DVerticalDivider:GetTop() end

---[CLIENT] Returns the current height of the top content panel set by DVerticalDivider:SetTopHeight or by the user.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTopHeight)
---@return number # The current height of the DVerticalDivider.
function DVerticalDivider:GetTopHeight() end

---[CLIENT] Returns the maximum height of the top content panel. See DVerticalDivider:SetTopMax for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTopMax)
---@return number # The maximum height of the top content panel.
function DVerticalDivider:GetTopMax() end

---[CLIENT] Returns the minimum height of the top content panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTopMin)
---@return number # The minimum height of the top content panel.
function DVerticalDivider:GetTopMin() end

---[CLIENT] Sets the passed panel as the bottom content of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetBottom)
---@param pnl Panel The panel to set as the bottom content.
function DVerticalDivider:SetBottom(pnl) end

---[CLIENT] Sets the minimum height of the bottom content panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetBottomMin)
---@param height number The minimum height of the bottom content panel. Default is 50.
function DVerticalDivider:SetBottomMin(height) end

---[CLIENT] Sets the height of the divider bar between the top and bottom content panels of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetDividerHeight)
---@param height number The height of the divider bar.
function DVerticalDivider:SetDividerHeight(height) end

---[CLIENT] Sets whether the divider is being dragged or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetDragging)
---@param isDragging boolean Setting this to true causes cursor movement to alter the position of the divider.
function DVerticalDivider:SetDragging(isDragging) end

---[CLIENT] Sets the local Y position of where the user starts dragging the divider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetHoldPos)
---@param y number The local Y position where divider dragging has started.
function DVerticalDivider:SetHoldPos(y) end

---[CLIENT] Places the passed panel in between the top and bottom content panels of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetMiddle)
---@param pnl Panel The panel to set as the middle content.
function DVerticalDivider:SetMiddle(pnl) end

---[CLIENT] Sets the passed panel as the top content of the DVerticalDivider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTop)
---@param pnl Panel The panel to set as the top content.
function DVerticalDivider:SetTop(pnl) end

---[CLIENT] Sets the height of the top content panel.
---
--- The height of the bottom content panel is automatically calculated by taking the total height of the DVerticalDivider and subtracting it with the height of the top content panel and the divider bar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopHeight)
---@param height number The height of the top content panel.
function DVerticalDivider:SetTopHeight(height) end

---[CLIENT] Sets the maximum height of the top content panel. This is ignored if the panel would exceed the minimum bottom content panel height set from DVerticalDivider:SetBottomMin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopMax)
---@param height number The maximum height of the top content panel. Default is 4096.
function DVerticalDivider:SetTopMax(height) end

---[CLIENT] Sets the minimum height of the top content panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopMin)
---@param height number The minimum height of the top content panel. Default is 50.
function DVerticalDivider:SetTopMin(height) end

---[CLIENT] Causes the user to start dragging the divider.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVerticalDivider:StartGrab)
function DVerticalDivider:StartGrab() end
