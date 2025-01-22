---@meta

--- Vertical version of [DHorizontalDivider](https://wiki.facepunch.com/gmod/DHorizontalDivider).
---@class DVerticalDivider : DPanel
local DVerticalDivider = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used internally to clamp the vertical divider to [DVerticalDivider:GetTopMin](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTopMin) and [DVerticalDivider:GetBottomMin](https://wiki.facepunch.com/gmod/DVerticalDivider:GetBottomMin).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:DoConstraints)
function DVerticalDivider:DoConstraints() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the bottom content panel of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetBottom)
---@return Panel # The bottom content panel.
function DVerticalDivider:GetBottom() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the minimum height of the bottom content panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetBottomMin)
---@return number # The minimum height of the bottom content panel.
function DVerticalDivider:GetBottomMin() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the height of the divider bar between the top and bottom content panels of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetDividerHeight)
---@return number # The height of the divider bar.
function DVerticalDivider:GetDividerHeight() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether the divider is being dragged or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetDragging)
---@return boolean # If true, mouse movement will alter the size of the divider.
function DVerticalDivider:GetDragging() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the local Y position of where the user starts dragging the divider.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetHoldPos)
---@return number # The local Y position where divider dragging has started.
function DVerticalDivider:GetHoldPos() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the middle content panel of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetMiddle)
---@return Panel # The middle content panel.
function DVerticalDivider:GetMiddle() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the top content panel of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTop)
---@return Panel # The top content panel.
function DVerticalDivider:GetTop() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current height of the top content panel set by [DVerticalDivider:SetTopHeight](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopHeight) or by the user.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTopHeight)
---@return number # The current height of the DVerticalDivider.
function DVerticalDivider:GetTopHeight() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the maximum height of the top content panel. See [DVerticalDivider:SetTopMax](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopMax) for more information.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTopMax)
---@return number # The maximum height of the top content panel.
function DVerticalDivider:GetTopMax() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the minimum height of the top content panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:GetTopMin)
---@return number # The minimum height of the top content panel.
function DVerticalDivider:GetTopMin() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the passed panel as the bottom content of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetBottom)
---@param pnl Panel The panel to set as the bottom content.
function DVerticalDivider:SetBottom(pnl) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the minimum height of the bottom content panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetBottomMin)
---@param height number The minimum height of the bottom content panel. Default is 50.
function DVerticalDivider:SetBottomMin(height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the height of the divider bar between the top and bottom content panels of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetDividerHeight)
---@param height number The height of the divider bar.
function DVerticalDivider:SetDividerHeight(height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether the divider is being dragged or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetDragging)
---@param isDragging boolean Setting this to true causes cursor movement to alter the position of the divider.
function DVerticalDivider:SetDragging(isDragging) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the local Y position of where the user starts dragging the divider.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetHoldPos)
---@param y number The local Y position where divider dragging has started.
function DVerticalDivider:SetHoldPos(y) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Places the passed panel in between the top and bottom content panels of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetMiddle)
---@param pnl Panel The panel to set as the middle content.
function DVerticalDivider:SetMiddle(pnl) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the passed panel as the top content of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTop)
---@param pnl Panel The panel to set as the top content.
function DVerticalDivider:SetTop(pnl) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the height of the top content panel.
---
--- The height of the bottom content panel is automatically calculated by taking the total height of the [DVerticalDivider](https://wiki.facepunch.com/gmod/DVerticalDivider) and subtracting it with the height of the top content panel and the divider bar.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopHeight)
---@param height number The height of the top content panel.
function DVerticalDivider:SetTopHeight(height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the maximum height of the top content panel. This is ignored if the panel would exceed the minimum bottom content panel height set from [DVerticalDivider:SetBottomMin](https://wiki.facepunch.com/gmod/DVerticalDivider:SetBottomMin).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopMax)
---@param height number The maximum height of the top content panel. Default is 4096.
function DVerticalDivider:SetTopMax(height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the minimum height of the top content panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:SetTopMin)
---@param height number The minimum height of the top content panel. Default is 50.
function DVerticalDivider:SetTopMin(height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Causes the user to start dragging the divider.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVerticalDivider:StartGrab)
function DVerticalDivider:StartGrab() end
