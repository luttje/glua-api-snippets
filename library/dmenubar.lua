---@meta

--- A simple menu bar.
---@class DMenuBar : DPanel
local DMenuBar = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a new [DMenu](https://wiki.facepunch.com/gmod/DMenu) object tied to a [DButton](https://wiki.facepunch.com/gmod/DButton) with the given label on the menu bar.
---
--- This will create a new menu regardless of whether or not one with the same label exists. To add **or** get a menu, use [DMenuBar:AddOrGetMenu](https://wiki.facepunch.com/gmod/DMenuBar:AddOrGetMenu).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:AddMenu)
---@param label string The name (label) of the derma menu to create.
---@return Panel # The new DMenu which will be opened when the button is clicked.
function DMenuBar:AddMenu(label) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Retrieves a [DMenu](https://wiki.facepunch.com/gmod/DMenu) object from the menu bar. If one with the given label doesn't exist, a new one is created.
---
--- To add a DMenu without checking, use [DMenuBar:AddMenu](https://wiki.facepunch.com/gmod/DMenuBar:AddMenu).
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:AddOrGetMenu)
---@param label string The name (label) of the derma menu to get or create.
---@return Panel # The DMenu with the given label.
function DMenuBar:AddOrGetMenu(label) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the background should be painted. Is the same as [DMenuBar:GetPaintBackground](https://wiki.facepunch.com/gmod/DMenuBar:GetPaintBackground)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:GetDrawBackground)
---@return boolean # Should the background be painted
---@deprecated Use DMenuBar:GetPaintBackground instead.
function DMenuBar:GetDrawBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the panel is a menu. Used for closing menus when another panel is selected.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:GetIsMenu)
---@return boolean # Is a menu
function DMenuBar:GetIsMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) If a menu is visible/opened, then the menu is returned.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:GetOpenMenu)
---@return Panel # Returns the visible/open menu or nil.
function DMenuBar:GetOpenMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the background should be painted. Is the same as [DMenuBar:GetDrawBackground](https://wiki.facepunch.com/gmod/DMenuBar:GetDrawBackground)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:GetPaintBackground)
---@return boolean # Should the background be painted
function DMenuBar:GetPaintBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the background should be painted. Is the same as [DMenuBar:SetPaintBackground](https://wiki.facepunch.com/gmod/DMenuBar:SetPaintBackground)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:SetDrawBackground)
---@param shouldPaint boolean Should the background be painted
---@deprecated Use DMenuBar:SetPaintBackground
function DMenuBar:SetDrawBackground(shouldPaint) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the panel is part of a DMenu.
---
--- If this is set to `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the panel is clicked, and thus any open menus will remain open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:SetIsMenu)
---@param isMenu boolean Is this a menu
function DMenuBar:SetIsMenu(isMenu) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the background should be painted. Is the same as [DMenuBar:SetDrawBackground](https://wiki.facepunch.com/gmod/DMenuBar:SetDrawBackground)
---
---[View wiki](https://wiki.facepunch.com/gmod/DMenuBar:SetPaintBackground)
---@param shouldPaint boolean Should the background be painted
function DMenuBar:SetPaintBackground(shouldPaint) end
