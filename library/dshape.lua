---@meta

--- Draw a shape on a derma panel. Only one kind of shape, a rectangle, is available for use.
---@class DShape : DPanel
local DShape = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current type of shape this panel is set to display.
---
--- See [DShape:SetBorderColor](https://wiki.facepunch.com/gmod/DShape:SetBorderColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DShape:GetBorderColor)
---@return table # The border Color
function DShape:GetBorderColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the color set to display the shape with.
---
---[View wiki](https://wiki.facepunch.com/gmod/DShape:GetColor)
---@return table # The shape Color
function DShape:GetColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current type of shape this panel is set to display.
---
--- See [DShape:SetType](https://wiki.facepunch.com/gmod/DShape:SetType).
---
---[View wiki](https://wiki.facepunch.com/gmod/DShape:GetType)
---@return string # Current shape type.
function DShape:GetType() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the border color of the shape.
---
--- Currently does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DShape:SetBorderColor)
---@param clr table The desired border color.
---
--- See Color
function DShape:SetBorderColor(clr) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the color to display the shape with.
---
---[View wiki](https://wiki.facepunch.com/gmod/DShape:SetColor)
---@param clr table The Color
function DShape:SetColor(clr) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the shape to be drawn.
---
---[View wiki](https://wiki.facepunch.com/gmod/DShape:SetType)
---@param type string The render type of the DShape. Only rectangles (`Rect`) work currently. If you don't define a type immediately, the PANEL:Paint method will generate errors until you do.
function DShape:SetType(type) end
