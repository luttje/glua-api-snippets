---@meta

--- Draw a shape on a derma panel. Only one kind of shape, a rectangle, is available for use.Creates the DShape rectangle within a small popup frame
---@class DShape : DPanel
local DShape = {}

---[CLIENT] Returns the current type of shape this panel is set to display.
---
--- See DShape:SetBorderColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DShape:GetBorderColor)
---@return table # The border Color
function DShape:GetBorderColor() end

---[CLIENT] Returns the color set to display the shape with.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DShape:GetColor)
---@return table # The shape Color
function DShape:GetColor() end

---[CLIENT] Returns the current type of shape this panel is set to display.
---
--- See DShape:SetType.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DShape:GetType)
---@return string # Current shape type.
function DShape:GetType() end

---[CLIENT] Sets the border color of the shape.
---
--- Currently does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DShape:SetBorderColor)
---@param clr table The desired border color.
---
--- See Color
function DShape:SetBorderColor(clr) end

---[CLIENT] Sets the color to display the shape with.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DShape:SetColor)
---@param clr table The Color
function DShape:SetColor(clr) end

---[CLIENT] Sets the shape to be drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DShape:SetType)
---@param type string The render type of the DShape. Only rectangles (`Rect`) work currently. If you don't define a type immediately, the PANEL:Paint method will generate errors until you do.
function DShape:SetType(type) end
