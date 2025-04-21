---@meta

--- A simple menu with sub menu, icon and convar support.
---@class DMenu : DScrollPanel
local DMenu = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a [DMenuOptionCVar](https://wiki.facepunch.com/gmod/DMenuOptionCVar) and adds it as an option into the menu. Checking and unchecking the option will alter the given console variable's value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:AddCVar)
---@param strText string The text of the button
---@param convar string The console variable to change
---@param on string The value of the console variable to set when the option is checked
---@param off string The value of the console variable to set when the option is unchecked
---@param funcFunction? fun(pnl: Panel) If set, the function will be called every time the option is pressed/clicked/selected.
---
--- Function argument(s):
--- * Panel `pnl` - The DMenuOptionCVar that was clicked.
---@return Panel # The created DMenuOptionCVar
function DMenu:AddCVar(strText, convar, on, off, funcFunction) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Add an option to the DMenu
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:AddOption)
---@param name string Name of the option.
---@param func? function Function to execute when this option is clicked.
---@return DMenuOption #Returns the created DMenuOption panel.
function DMenu:AddOption(name, func) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a panel to the DMenu as if it were an option.
---
--- This invokes DScrollPanel:AddItem and will not create a new panel if a class name is passed, unlike Panel:Add.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:AddPanel)
---@generic T : Panel
---@param pnl `T` The panel that you want to add.
function DMenu:AddPanel(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a horizontal line spacer.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:AddSpacer)
function DMenu:AddSpacer() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Add a sub menu to the DMenu
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:AddSubMenu)
---@param Name string Name of the sub menu.
---@param func? function Function to execute when this sub menu is clicked.
---@return DMenu, DMenuOption #DMenu - The created sub DMenu
---@return DMenu, DMenuOption #DMenuOption - The created DMenuOption
function DMenu:AddSubMenu(Name, func) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the number of child elements of [DMenu](https://wiki.facepunch.com/gmod/DMenu)'s [DScrollPanel:GetCanvas](https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:ChildCount)
---@return number # The number of child elements
function DMenu:ChildCount() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Clears all highlights made by [DMenu:HighlightItem](https://wiki.facepunch.com/gmod/DMenu:HighlightItem).
---
--- Doesn't appear to be used or do anything.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:ClearHighlights)
function DMenu:ClearHighlights() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally by [DMenu:OpenSubMenu](https://wiki.facepunch.com/gmod/DMenu:OpenSubMenu).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:CloseSubMenu)
---@param menu Panel The menu to close
function DMenu:CloseSubMenu(menu) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets a child by its index.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:GetChild)
---@param childIndex number The index of the child to get.
---
--- Unlike [Panel:GetChild](https://wiki.facepunch.com/gmod/Panel:GetChild), this index starts at 1.
function DMenu:GetChild(childIndex) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set by [DMenu:SetDeleteSelf](https://wiki.facepunch.com/gmod/DMenu:SetDeleteSelf)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:GetDeleteSelf)
---@return boolean #
function DMenu:GetDeleteSelf() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the value set by [DMenu:SetDrawBorder](https://wiki.facepunch.com/gmod/DMenu:SetDrawBorder).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:GetDrawBorder)
---@return boolean #
function DMenu:GetDrawBorder() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DMenu](https://wiki.facepunch.com/gmod/DMenu) should draw the icon column with a different color or not.
---
--- See [DMenu:SetDrawColumn](https://wiki.facepunch.com/gmod/DMenu:SetDrawColumn)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:GetDrawColumn)
---@return boolean # Whether to draw the column or not
function DMenu:GetDrawColumn() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the maximum height of the [DMenu](https://wiki.facepunch.com/gmod/DMenu).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:GetMaxHeight)
---@return number # The maximum height in pixels
function DMenu:GetMaxHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the minimum width of the [DMenu](https://wiki.facepunch.com/gmod/DMenu) in pixels
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:GetMinimumWidth)
---@return number # the minimum width of the DMenu
function DMenu:GetMinimumWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the currently opened submenu.
---
--- Used internally to store the open submenu by [DMenu:Hide](https://wiki.facepunch.com/gmod/DMenu:Hide), [DMenu:OpenSubMenu](https://wiki.facepunch.com/gmod/DMenu:OpenSubMenu).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:GetOpenSubMenu)
---@return Panel # The currently opened submenu, if any.
function DMenu:GetOpenSubMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used to safely hide (not remove) the menu. This will also hide any opened submenues recursively.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:Hide)
function DMenu:Hide() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Highlights selected item in the [DMenu](https://wiki.facepunch.com/gmod/DMenu) by setting the item's key "Highlight" to true.
---
--- Doesn't appear to be working or used.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:HighlightItem)
---@param item Panel The item to highlight.
function DMenu:HighlightItem(item) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Opens the [DMenu](https://wiki.facepunch.com/gmod/DMenu) at given position.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:Open)
---@param x? number Position (X coordinate) to open the menu at.
---@param y? number Position (Y coordinate) to open the menu at.
---@param skipanimation? any This argument does nothing.
---@param ownerpanel? Panel If `x` and `y` are not set manually, setting this argument will offset the `y` position of the opened menu by the height of given panel.
function DMenu:Open(x, y, skipanimation, ownerpanel) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Closes any active sub menus, and opens a new one.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:OpenSubMenu)
---@param item Panel The DMenuOption to open the submenu at
---@param menu? Panel The submenu to open. If set to nil, the function just closes existing submenus.
function DMenu:OpenSubMenu(item, menu) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called when a option has been selected
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:OptionSelected)
---@param option Panel The DMenuOption that was selected
---@param optionText string The options text
function DMenu:OptionSelected(option, optionText) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption). Calls [DMenu:OptionSelected](https://wiki.facepunch.com/gmod/DMenu:OptionSelected).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:OptionSelectedInternal)
---@param option Panel The DMenuOption that called this function
function DMenu:OptionSelectedInternal(option) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set to true by default. IF set to true, the menu will be deleted when it is closed, not simply hidden.
---
--- This is used by [DMenuBar](https://wiki.facepunch.com/gmod/DMenuBar)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:SetDeleteSelf)
---@param newState boolean true to delete menu on close, false to simply hide.
function DMenu:SetDeleteSelf(newState) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:SetDrawBorder)
---@param bool boolean
function DMenu:SetDrawBorder(bool) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the [DMenu](https://wiki.facepunch.com/gmod/DMenu) should draw the icon column with a different color.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:SetDrawColumn)
---@param draw boolean Whether to draw the column or not
function DMenu:SetDrawColumn(draw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the maximum height the [DMenu](https://wiki.facepunch.com/gmod/DMenu) can have. If the height of all menu items exceed this value, a scroll bar will be automatically added.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:SetMaxHeight)
---@param maxHeight number The maximum height of the DMenu to set, in pixels
function DMenu:SetMaxHeight(maxHeight) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the minimum width of the [DMenu](https://wiki.facepunch.com/gmod/DMenu). The menu will be stretched to match the given value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:SetMinimumWidth)
---@param minWidth number The minimum width of the DMenu in pixels
function DMenu:SetMinimumWidth(minWidth) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to store the open submenu by [DMenu:Hide](https://wiki.facepunch.com/gmod/DMenu:Hide), [DMenu:OpenSubMenu](https://wiki.facepunch.com/gmod/DMenu:OpenSubMenu), [DMenu:CloseSubMenu](https://wiki.facepunch.com/gmod/DMenu:CloseSubMenu)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenu:SetOpenSubMenu)
---@param item Panel The menu to store
function DMenu:SetOpenSubMenu(item) end
