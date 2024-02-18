---@meta

--- Adds curved corners.Creates a DPanel with a DPanelOverlay and adds a DLabel to it
---@class DPanelOverlay : DPanel
local DPanelOverlay = {}

---[CLIENT AND MENU] Returns the border color of the DPanelOverlay set by DPanelOverlay:SetColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanelOverlay:GetColor)
---@return table # The set color. Uses the Color.
function DPanelOverlay:GetColor() end

---[CLIENT AND MENU] Returns the type of the DPanelOverlay set by DPanelOverlay:SetType.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanelOverlay:GetType)
---@return number # The set type.
function DPanelOverlay:GetType() end

---[CLIENT AND MENU] Used internally by the panel for type 3.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanelOverlay:PaintDifferentColours)
---@param cola table
---@param colb table
---@param colc table
---@param cold table
---@param size number
function DPanelOverlay:PaintDifferentColours(cola, colb, colc, cold, size) end

---[CLIENT AND MENU] Used internally by the panel for types 1 and 2.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanelOverlay:PaintInnerCorners)
---@param size number
function DPanelOverlay:PaintInnerCorners(size) end

---[CLIENT AND MENU] Sets the border color of the DPanelOverlay.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanelOverlay:SetColor)
---@param color table The color to set. Uses the Color.
function DPanelOverlay:SetColor(color) end

---[CLIENT AND MENU] Sets the type of the DPanelOverlay.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanelOverlay:SetType)
---@param type number The type to set.
---
--- Possible value are:
--- * 1 - 8px corners of given color
--- * 2 - 4px corners of given type
--- * 3 - 2 top? corners of hardcoded color, 2 other corners of given color
function DPanelOverlay:SetType(type) end
