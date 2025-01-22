---@meta

--- Adds curved corners.
---@class DPanelOverlay : DPanel
local DPanelOverlay = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the border color of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay) set by [DPanelOverlay:SetColor](https://wiki.facepunch.com/gmod/DPanelOverlay:SetColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelOverlay:GetColor)
---@return table # The set color. Uses the Color.
function DPanelOverlay:GetColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the type of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay) set by [DPanelOverlay:SetType](https://wiki.facepunch.com/gmod/DPanelOverlay:SetType).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelOverlay:GetType)
---@return number # The set type.
function DPanelOverlay:GetType() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used internally by the panel for type 3.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelOverlay:PaintDifferentColours)
---@param cola table
---@param colb table
---@param colc table
---@param cold table
---@param size number
function DPanelOverlay:PaintDifferentColours(cola, colb, colc, cold, size) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Used internally by the panel for types 1 and 2.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelOverlay:PaintInnerCorners)
---@param size number
function DPanelOverlay:PaintInnerCorners(size) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the border color of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelOverlay:SetColor)
---@param color table The color to set. Uses the Color.
function DPanelOverlay:SetColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the type of the [DPanelOverlay](https://wiki.facepunch.com/gmod/DPanelOverlay).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelOverlay:SetType)
---@param type number The type to set.
---
--- Possible value are:
--- * 1 - 8px corners of given color
--- * 2 - 4px corners of given type
--- * 3 - 2 top? corners of hardcoded color, 2 other corners of given color
function DPanelOverlay:SetType(type) end
