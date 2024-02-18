---@meta

--- A simple Derma MenuBarCreates a DMenuBar in a DFrame.A sub menu example
---@class DMenuBar : DPanel
local DMenuBar = {}

---[CLIENT AND MENU] Creates a new DMenu object tied to a DButton with the given label on the menu bar.
---
--- This will create a new menu regardless of whether or not one with the same label exists. To add **or** get a menu, use DMenuBar:AddOrGetMenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:AddMenu)
---@param label string The name (label) of the derma menu to create.
---@return Panel # The new DMenu which will be opened when the button is clicked.
function DMenuBar:AddMenu(label) end

---[CLIENT AND MENU] Retrieves a DMenu object from the menu bar. If one with the given label doesn't exist, a new one is created.
---
--- To add a DMenu without checking, use DMenuBar:AddMenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:AddOrGetMenu)
---@param label string The name (label) of the derma menu to get or create.
---@return Panel # The DMenu with the given label.
function DMenuBar:AddOrGetMenu(label) end

---[CLIENT AND MENU] Returns the DMenuBar's background color
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:GetBackgroundColor)
---@return table # The background's color. See Color
function DMenuBar:GetBackgroundColor() end

---[CLIENT AND MENU] Returns whether or not the DMenuBar is disabled
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:GetDisabled)
---@return boolean # Is disabled
function DMenuBar:GetDisabled() end

---[CLIENT AND MENU] Returns whether or not the background should be painted. Is the same as DMenuBar:GetPaintBackground
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:GetDrawBackground)
---@return boolean # Should the background be painted
---@deprecated Use DMenuBar:GetPaintBackground instead.
function DMenuBar:GetDrawBackground() end

---[CLIENT AND MENU] Returns whether or not the panel is a menu. Used for closing menus when another panel is selected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:GetIsMenu)
---@return boolean # Is a menu
function DMenuBar:GetIsMenu() end

---[CLIENT AND MENU] If a menu is visible/opened, then the menu is returned.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:GetOpenMenu)
---@return Panel # Returns the visible/open menu or nil.
function DMenuBar:GetOpenMenu() end

---[CLIENT AND MENU] Returns whether or not the background should be painted. Is the same as DMenuBar:GetDrawBackground
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:GetPaintBackground)
---@return boolean # Should the background be painted
function DMenuBar:GetPaintBackground() end

---[CLIENT AND MENU] Sets the background color
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:SetBackgroundColor)
---@param color table See Color
function DMenuBar:SetBackgroundColor(color) end

---[CLIENT AND MENU] Sets whether or not the panel is disabled
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:SetDisabled)
---@param disable boolean Should be disabled or not
function DMenuBar:SetDisabled(disable) end

---[CLIENT AND MENU] Sets whether or not the background should be painted. Is the same as DMenuBar:SetPaintBackground
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:SetDrawBackground)
---@param shouldPaint boolean Should the background be painted
---@deprecated Use DMenuBar:SetPaintBackground
function DMenuBar:SetDrawBackground(shouldPaint) end

---[CLIENT AND MENU] Sets whether or not the panel is part of a DMenu.
---
--- If this is set to `true`, Global.CloseDermaMenus will not be called when the panel is clicked, and thus any open menus will remain open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:SetIsMenu)
---@param isMenu boolean Is this a menu
function DMenuBar:SetIsMenu(isMenu) end

---[CLIENT AND MENU] Sets whether or not the background should be painted. Is the same as DMenuBar:SetDrawBackground
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuBar:SetPaintBackground)
---@param shouldPaint boolean Should the background be painted
function DMenuBar:SetPaintBackground(shouldPaint) end
