---@meta

--- DIconLayout is what replaced [DPanelList](https://wiki.facepunch.com/gmod/DPanelList) in Garry's Mod 13.
--- DPanelList still exists in GMod but is deprecated and does not support the new GWEN skin.
---
--- [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout) is used to make a list of panels.
--- Unlike DPanelList, DIconLayout does not automatically add a scroll bar - the example below shows you how you can do this.
---@class DIconLayout : DDragBase
local DIconLayout = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a replica of the DIconLayout it is called on.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:Copy)
---@return Panel # The replica.
function DIconLayout:Copy() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Copies the contents (Child elements) of another [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout) to itself.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:CopyContents)
---@param from Panel DIconLayout to copy from.
function DIconLayout:CopyContents(from) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the size of the border.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:GetBorder)
---@return number #
function DIconLayout:GetBorder() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the direction that it will be layed out, using the DOCK enumerations.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:GetLayoutDir)
---@return number # Layout direction.
function DIconLayout:GetLayoutDir() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the distance between two 'icons' on the X axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:GetSpaceX)
---@return number # Distance between two 'icons' on the X axis.
function DIconLayout:GetSpaceX() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns distance between two "Icons" on the Y axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:GetSpaceY)
---@return number # distance between two "Icons" on the Y axis.
function DIconLayout:GetSpaceY() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the icon layout will stretch its height to fit all the children.
---
--- See also [DIconLayout:GetStretchWidth](https://wiki.facepunch.com/gmod/DIconLayout:GetStretchWidth)
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:GetStretchHeight)
---@return boolean #
function DIconLayout:GetStretchHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the icon layout will stretch its width to fit all the children.
---
--- See also [DIconLayout:GetStretchHeight](https://wiki.facepunch.com/gmod/DIconLayout:GetStretchHeight)
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:GetStretchWidth)
---@return boolean #
function DIconLayout:GetStretchWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Resets layout vars before calling [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout). This is called when children are added or removed, and must be called when the spacing, border or layout direction is changed.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:Layout)
function DIconLayout:Layout() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to layout the child elements if the [DIconLayout:SetLayoutDir](https://wiki.facepunch.com/gmod/DIconLayout:SetLayoutDir) is set to LEFT (See [Enums/DOCK](https://wiki.facepunch.com/gmod/Enums/DOCK)).
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:LayoutIcons_LEFT)
function DIconLayout:LayoutIcons_LEFT() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to layout the child elements if the [DIconLayout:SetLayoutDir](https://wiki.facepunch.com/gmod/DIconLayout:SetLayoutDir) is set to TOP (See [Enums/DOCK](https://wiki.facepunch.com/gmod/Enums/DOCK)).
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:LayoutIcons_TOP)
function DIconLayout:LayoutIcons_TOP() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the internal border (padding) within the DIconLayout. This will not change its size, only the positioning of children. You must call [DIconLayout:Layout](https://wiki.facepunch.com/gmod/DIconLayout:Layout) in order for the changes to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:SetBorder)
---@param width number The border (padding) inside the DIconLayout.
function DIconLayout:SetBorder(width) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the direction that it will be layed out, using the [Enums/DOCK](https://wiki.facepunch.com/gmod/Enums/DOCK).
---
--- Currently only TOP and LEFT are supported.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:SetLayoutDir)
---@param direction number Enums/DOCK
function DIconLayout:SetLayoutDir(direction) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the horizontal (x) spacing between children within the DIconLayout. You must call [DIconLayout:Layout](https://wiki.facepunch.com/gmod/DIconLayout:Layout) in order for the changes to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:SetSpaceX)
---@param xSpacing number The width of the gap between child objects.
function DIconLayout:SetSpaceX(xSpacing) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the vertical (y) spacing between children within the DIconLayout. You must call [DIconLayout:Layout](https://wiki.facepunch.com/gmod/DIconLayout:Layout) in order for the changes to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:SetSpaceY)
---@param ySpacing number The vertical gap between rows in the DIconLayout.
function DIconLayout:SetSpaceY(ySpacing) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) If set to true, the icon layout will stretch its height to fit all the children.
---
--- See also [DIconLayout:SetStretchWidth](https://wiki.facepunch.com/gmod/DIconLayout:SetStretchWidth)
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:SetStretchHeight)
---@param do_stretch boolean
function DIconLayout:SetStretchHeight(do_stretch) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) If set to true, the icon layout will stretch its width to fit all the children.
---
--- See also [DIconLayout:SetStretchHeight](https://wiki.facepunch.com/gmod/DIconLayout:SetStretchHeight)
---
---[View wiki](https://wiki.facepunch.com/gmod/DIconLayout:SetStretchWidth)
---@param stretchW boolean
function DIconLayout:SetStretchWidth(stretchW) end
