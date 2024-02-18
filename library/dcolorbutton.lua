---@meta

---
--- 		Colorful buttons. Used internally by DColorPalette.
--- 	Creates a DColorButton buton.
---@class DColorButton : DLabel
local DColorButton = {}

---[CLIENT AND MENU] Returns the color of the button
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:GetColor)
---@return table # The Color of the button
function DColorButton:GetColor() end

---[CLIENT AND MENU] Returns value set by DColorButton:SetDrawBorder. See that page for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:GetDrawBorder)
---@return boolean # Value set by DColorButton:SetDrawBorder.
function DColorButton:GetDrawBorder() end

---[CLIENT AND MENU] Returns the unique ID set by DColorButton:SetID.
---
--- Used internally by DColorPalette
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:GetID)
---@return number # The unique ID of the button
function DColorButton:GetID() end

---[CLIENT AND MENU] Alias of Panel:IsSelected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:GetSelected)
---@return boolean #
function DColorButton:GetSelected() end

---[CLIENT AND MENU] Returns whether the DColorButton is currently being pressed (the user is holding it down).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:IsDown)
---@return boolean #
function DColorButton:IsDown() end

---[CLIENT AND MENU] Sets the color of the DColorButton.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:SetColor)
---@param color table A Color to set the color as
---@param noTooltip? boolean If true, the tooltip will not be reset to display the selected color.
function DColorButton:SetColor(color, noTooltip) end

---[CLIENT AND MENU] Does absolutely nothing at all. Default value is automatically set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:SetDrawBorder)
---@param draw boolean Does nothing.
function DColorButton:SetDrawBorder(draw) end

---[CLIENT AND MENU] Used internally by DColorPalette to detect which button is which.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorButton:SetID)
---@param id number A unique ID to give this button
function DColorButton:SetID(id) end
