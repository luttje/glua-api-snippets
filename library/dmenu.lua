---@meta

--- A simple menu with sub menu, icon and convar support.Creates a DMenu with a submenu.
---@class DMenu : DScrollPanel
local DMenu = {}

---[CLIENT AND MENU] Creates a DMenuOptionCVar and adds it as an option into the menu. Checking and unchecking the option will alter the given console variable's value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:AddCVar)
---@param strText string The text of the button
---@param convar string The console variable to change
---@param on string The value of the console variable to set when the option is checked
---@param off string The value of the console variable to set when the option is unchecked
---@param funcFunction? function If set, the function will be called every time the option is pressed/clicked/selected.
---
--- It will have only one argument:
--- Panel pnl - The created DMenuOptionCVar
---@return Panel # The created DMenuOptionCVar
function DMenu:AddCVar(strText, convar, on, off, funcFunction) end

---[CLIENT] Add an option to the DMenu
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:AddOption)
---@param name string Name of the option.
---@param func? function Function to execute when this option is clicked.
---@return DMenuOption #Returns the created DMenuOption panel.
function DMenu:AddOption(name, func) end

---[CLIENT] Adds a panel to the DMenu as if it were an option.
---
--- This invokes DScrollPanel:AddItem and will not create a new panel if a class name is passed, unlike Panel:Add.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:AddPanel)
---@generic T : Panel
---@param pnl `T` The panel that you want to add.
function DMenu:AddPanel(pnl) end

---[CLIENT AND MENU] Adds a horizontal line spacer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:AddSpacer)
function DMenu:AddSpacer() end

---[CLIENT] Add a sub menu to the DMenu
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:AddSubMenu)
---@param Name string Name of the sub menu.
---@param func? function Function to execute when this sub menu is clicked.
---@return DMenu, DMenuOption #DMenu - The created sub DMenu
---@return DMenu, DMenuOption #DMenuOption - The created DMenuOption
function DMenu:AddSubMenu(Name, func) end

---[CLIENT AND MENU] Returns the number of child elements of DMenu's DScrollPanel:GetCanvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:ChildCount)
---@return number # The number of child elements
function DMenu:ChildCount() end

---[CLIENT AND MENU] Clears all highlights made by DMenu:HighlightItem.
---
--- Doesn't appear to be used or do anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:ClearHighlights)
function DMenu:ClearHighlights() end

---[CLIENT AND MENU] Used internally by DMenu:OpenSubMenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:CloseSubMenu)
---@param menu Panel The menu to close
function DMenu:CloseSubMenu(menu) end

---[CLIENT AND MENU] Gets a child by its index.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:GetChild)
---@param childIndex number The index of the child to get.
---
--- Unlike Panel:GetChild, this index starts at 1.
function DMenu:GetChild(childIndex) end

---[CLIENT AND MENU] Set by DMenu:SetDeleteSelf
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:GetDeleteSelf)
---@return boolean #
function DMenu:GetDeleteSelf() end

---[CLIENT AND MENU] Returns the value set by DMenu:SetDrawBorder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:GetDrawBorder)
---@return boolean #
function DMenu:GetDrawBorder() end

---[CLIENT AND MENU] Returns whether the DMenu should draw the icon column with a different color or not.
---
--- See DMenu:SetDrawColumn
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:GetDrawColumn)
---@return boolean # Whether to draw the column or not
function DMenu:GetDrawColumn() end

---[CLIENT AND MENU] Returns the maximum height of the DMenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:GetMaxHeight)
---@return number # The maximum height in pixels
function DMenu:GetMaxHeight() end

---[CLIENT AND MENU] Returns the minimum width of the DMenu in pixels
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:GetMinimumWidth)
---@return number # the minimum width of the DMenu
function DMenu:GetMinimumWidth() end

---[CLIENT AND MENU] Returns the currently opened submenu.
---
--- Used internally to store the open submenu by DMenu:Hide, DMenu:OpenSubMenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:GetOpenSubMenu)
---@return Panel # The currently opened submenu, if any.
function DMenu:GetOpenSubMenu() end

---[CLIENT AND MENU] Used to safely hide (not remove) the menu. This will also hide any opened submenues recursively.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:Hide)
function DMenu:Hide() end

---[CLIENT AND MENU] Highlights selected item in the DMenu by setting the item's key "Highlight" to true.
---
--- Doesn't appear to be working or used.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:HighlightItem)
---@param item Panel The item to highlight.
function DMenu:HighlightItem(item) end

---[CLIENT AND MENU] Opens the DMenu at the current mouse position
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:Open)
---@param x? number Position (X coordinate) to open the menu at.
---@param y? number Position (Y coordinate) to open the menu at.
---@param skipanimation? any This argument does nothing.
---@param ownerpanel? Panel If `x` and `y` are not set manually, setting this argument will offset the `y` position of the opened menu by the height of given panel.
function DMenu:Open(x, y, skipanimation, ownerpanel) end

---[CLIENT AND MENU] Closes any active sub menus, and opens a new one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:OpenSubMenu)
---@param item Panel The DMenuOption to open the submenu at
---@param menu? Panel The submenu to open. If set to nil, the function just closes existing submenus.
function DMenu:OpenSubMenu(item, menu) end

---[CLIENT AND MENU] Called when a option has been selected
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:OptionSelected)
---@param option Panel The DMenuOption that was selected
---@param optionText string The options text
function DMenu:OptionSelected(option, optionText) end

---[CLIENT AND MENU] Called by DMenuOption. Calls DMenu:OptionSelected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:OptionSelectedInternal)
---@param option Panel The DMenuOption that called this function
function DMenu:OptionSelectedInternal(option) end

---[CLIENT AND MENU] Set to true by default. IF set to true, the menu will be deleted when it is closed, not simply hidden.
---
--- This is used by DMenuBar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:SetDeleteSelf)
---@param newState boolean true to delete menu on close, false to simply hide.
function DMenu:SetDeleteSelf(newState) end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:SetDrawBorder)
---@param bool boolean
function DMenu:SetDrawBorder(bool) end

---[CLIENT AND MENU] Sets whether the DMenu should draw the icon column with a different color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:SetDrawColumn)
---@param draw boolean Whether to draw the column or not
function DMenu:SetDrawColumn(draw) end

---[CLIENT AND MENU] Sets the maximum height the DMenu can have. If the height of all menu items exceed this value, a scroll bar will be automatically added.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:SetMaxHeight)
---@param maxHeight number The maximum height of the DMenu to set, in pixels
function DMenu:SetMaxHeight(maxHeight) end

---[CLIENT AND MENU] Sets the minimum width of the DMenu. The menu will be stretched to match the given value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:SetMinimumWidth)
---@param minWidth number The minimum width of the DMenu in pixels
function DMenu:SetMinimumWidth(minWidth) end

---[CLIENT AND MENU] Used internally to store the open submenu by DMenu:Hide, DMenu:OpenSubMenu, DMenu:CloseSubMenu
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:SetOpenSubMenu)
---@param item Panel The menu to store
function DMenu:SetOpenSubMenu(item) end
