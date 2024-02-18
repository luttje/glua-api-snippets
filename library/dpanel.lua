---@meta

--- A simple rectangular box, commonly used for parenting other elements to. Pretty much all elements are based on this.Creates a DPanel and adds a DLabel to it
---@class DPanel : Panel
local DPanel = {}

---[CLIENT AND MENU] Returns the panel's background color.
---
--- By default this returns **nil** even though the default background color is white
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetBackgroundColor)
---@return table # Color of the panel's background.
function DPanel:GetBackgroundColor() end

---[CLIENT AND MENU] Returns whether or not the panel is disabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetDisabled)
---@return boolean # True if the panel is disabled (mouse input disabled and background alpha set to 75), false if its enabled (mouse input enabled and background alpha set to 255).
function DPanel:GetDisabled() end

---[CLIENT AND MENU] Returns whether or not the panel background is being drawn. Alias of DPanel:GetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetDrawBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DPanel:GetPaintBackground instead.
function DPanel:GetDrawBackground() end

---[CLIENT AND MENU] Used internally by DMenu.
---
--- Returns whether the frame is part of a derma menu or not.
---
--- If this is `true`, Global.CloseDermaMenus will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetIsMenu)
---@return boolean # Whether this panel is a Menu Component
function DPanel:GetIsMenu() end

---[CLIENT AND MENU] Returns whether or not the panel background is being drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetPaintBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
function DPanel:GetPaintBackground() end

---[CLIENT AND MENU] Does nothing. Returns value set by DPanel:SetTabbingDisabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:GetTabbingDisabled)
---@return boolean #
function DPanel:GetTabbingDisabled() end

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

---[CLIENT AND MENU] Sets whether or not to draw the panel background. Alias of DPanel:SetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetDrawBackground)
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DPanel:SetPaintBackground instead.
function DPanel:SetDrawBackground(draw) end

---[CLIENT AND MENU] Used internally by DMenu.
---
---
--- Sets whether the frame is part of a derma menu or not.
---
--- If this is set to `true`, Global.CloseDermaMenus will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetIsMenu)
---@param isMenu boolean Whether this pane is a Menu Component
function DPanel:SetIsMenu(isMenu) end

---[CLIENT AND MENU] Sets whether or not to paint/draw the panel background.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetPaintBackground)
---@param paint boolean True to show the panel's background, false to hide it.
function DPanel:SetPaintBackground(paint) end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:SetTabbingDisabled)
---@param draw boolean
function DPanel:SetTabbingDisabled(draw) end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanel:UpdateColours)
function DPanel:UpdateColours() end
