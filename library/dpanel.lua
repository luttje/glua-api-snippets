---@meta

---@class DPanel : Panel
local DPanel = {}

---[CLIENT AND MENU] Returns the panel's background color.
---
--- By default this returns **nil** even though the default background color is white
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetBackgroundColor)
---@return table #Color of the panel's background.
function DPanel:GetBackgroundColor() end

---[CLIENT AND MENU] Returns whether or not the panel is disabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetDisabled)
---@return boolean #True if the panel is disabled (mouse input disabled and background alpha set to 75), false if its enabled (mouse input enabled and background alpha set to 255).
function DPanel:GetDisabled() end

---[CLIENT AND MENU] You should use DPanel:GetPaintBackground instead.Returns whether or not the panel background is being drawn. Alias of DPanel:GetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetDrawBackground)
---@return boolean #True if the panel background is drawn, false otherwise.
function DPanel:GetDrawBackground() end

---[CLIENT AND MENU] Returns whether or not the panel background is being drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetPaintBackground)
---@return boolean #True if the panel background is drawn, false otherwise.
function DPanel:GetPaintBackground() end

---[CLIENT AND MENU] Sets the background color of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetBackgroundColor)
---@param color table The background color.
function DPanel:SetBackgroundColor(color) end

---[CLIENT AND MENU] Sets whether or not to disable the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetDisabled)
---@param disabled boolean True to disable the panel (mouse input disabled and background alpha set to 75), false to enable it (mouse input enabled and background alpha set to 255).
function DPanel:SetDisabled(disabled) end

---[CLIENT AND MENU] You should use DPanel:SetPaintBackground instead.Sets whether or not to draw the panel background. Alias of DPanel:SetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetDrawBackground)
---@param draw boolean True to show the panel's background, false to hide it.
function DPanel:SetDrawBackground(draw) end

---[CLIENT AND MENU] Sets whether or not to paint/draw the panel background.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetPaintBackground)
---@param paint boolean True to show the panel's background, false to hide it.
function DPanel:SetPaintBackground(paint) end
