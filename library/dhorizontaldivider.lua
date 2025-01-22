---@meta

--- Creates an invisible vertical divider between two GUI elements.
---@class DHorizontalDivider : DPanel
local DHorizontalDivider = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the width of the horizontal divider bar, set by [DHorizontalDivider:SetDividerWidth](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDividerWidth).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetDividerWidth)
---@return number # The width of the horizontal divider bar
function DHorizontalDivider:GetDividerWidth() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether or not the player is currently dragging the middle divider bar.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetDragging)
---@return boolean # Whether or not the player is currently dragging the middle divider bar.
function DHorizontalDivider:GetDragging() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the local X coordinate of where the player started dragging the thing
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetHoldPos)
---@return number #
function DHorizontalDivider:GetHoldPos() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the left side content of the [DHorizontalDivider](https://wiki.facepunch.com/gmod/DHorizontalDivider)
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeft)
---@return Panel # The content on the left side
function DHorizontalDivider:GetLeft() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the minimum width of the left side, set by [DHorizontalDivider:SetLeftMin](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftMin).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeftMin)
---@return number # The minimum width of the left side
function DHorizontalDivider:GetLeftMin() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current width of the left side, set by [DHorizontalDivider:SetLeftWidth](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftWidth) or by the user.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetLeftWidth)
---@return number # The current width of the left side
function DHorizontalDivider:GetLeftWidth() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the middle content, set by [DHorizontalDivider:SetMiddle](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetMiddle).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetMiddle)
---@return Panel # The middle content
function DHorizontalDivider:GetMiddle() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the right side content
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetRight)
---@return Panel # The right side content
function DHorizontalDivider:GetRight() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the minimum width of the right side, set by [DHorizontalDivider:SetRightMin](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRightMin).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:GetRightMin)
---@return number # The minimum width of the right side
function DHorizontalDivider:GetRightMin() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the width of the horizontal divider bar.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDividerWidth)
---@param width number The width of the horizontal divider bar.
function DHorizontalDivider:SetDividerWidth(width) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets whether the player is dragging the divider or not
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetDragging)
---@param dragonot boolean
function DHorizontalDivider:SetDragging(dragonot) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the local X coordinate of where the player started dragging the thing
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetHoldPos)
---@param x number
function DHorizontalDivider:SetHoldPos(x) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the left side content of the [DHorizontalDivider](https://wiki.facepunch.com/gmod/DHorizontalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeft)
---@param pnl Panel The panel to set as the left side
function DHorizontalDivider:SetLeft(pnl) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the minimum width of the left side
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftMin)
---@param minWidth number The minimum width of the left side
function DHorizontalDivider:SetLeftMin(minWidth) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the current/starting width of the left side.
---
--- The width of the right side is automatically calculated by subtracting this from the total width of the [DHorizontalDivider](https://wiki.facepunch.com/gmod/DHorizontalDivider).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetLeftWidth)
---@param width number The current/starting width of the left side
function DHorizontalDivider:SetLeftWidth(width) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the middle content, over the draggable divider bar panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetMiddle)
---@param middle Panel The middle content
function DHorizontalDivider:SetMiddle(middle) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the right side content
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRight)
---@param pnl Panel The right side content
function DHorizontalDivider:SetRight(pnl) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the minimum width of the right side
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:SetRightMin)
---@param minWidth number The minimum width of the right side
function DHorizontalDivider:SetRightMin(minWidth) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- TODO Document me
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalDivider:StartGrab)
function DHorizontalDivider:StartGrab() end
