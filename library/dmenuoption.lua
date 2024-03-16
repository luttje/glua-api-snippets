---@meta

---
---
---
--- 		Internal subpanel that represents an option used by DMenu.
---
---@class DMenuOption : DButton
local DMenuOption = {}

---[CLIENT AND MENU] Creates a sub DMenu and returns it. Has no duplicate call protection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:AddSubMenu)
---@param Name string Name of the sub menu.
---@param func? function Function to execute when this sub menu is clicked.
---@return Panel # The created DMenu to add options to.
function DMenuOption:AddSubMenu(Name, func) end

---[CLIENT AND MENU] Returns the checked state of DMenuOption.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:GetChecked)
---@return boolean # Are we checked or not
function DMenuOption:GetChecked() end

---[CLIENT AND MENU] Returns whether the DMenuOption is a checkbox option or a normal button option.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:GetIsCheckable)
---@return boolean #
function DMenuOption:GetIsCheckable() end

---[CLIENT AND MENU] Returns which DMenu this option belongs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:GetMenu)
---@return Panel # A DMenu to which this panel belongs.
function DMenuOption:GetMenu() end

---[CLIENT AND MENU] Returns whether this DMenuOption should act like a radio button, set by DMenuOption:SetRadio.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:GetRadio)
---@return boolean # `true` to set as a radio button.
function DMenuOption:GetRadio() end

---[CLIENT AND MENU] Called whenever the DMenuOption's checked state changes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:OnChecked)
---@param checked boolean The new checked state
function DMenuOption:OnChecked(checked) end

---[CLIENT AND MENU] Sets the checked state of the DMenuOption.
---
--- Invokes DMenuOption:OnChecked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetChecked)
---@param checked boolean `true` to set as checked.
function DMenuOption:SetChecked(checked) end

---[CLIENT AND MENU] Sets whether the DMenuOption is a checkbox option or a normal button option.
---
--- Enables automatic DMenuOption:GetChecked toggling with left/right clicks.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetIsCheckable)
---@param checkable boolean Whether the menu option should allow the player to toggle itself.
function DMenuOption:SetIsCheckable(checkable) end

---[CLIENT AND MENU] Used to set the DMenu for this option.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetMenu)
---@param pnl Panel The DMenu for this option.
function DMenuOption:SetMenu(pnl) end

---[CLIENT AND MENU] Sets whether this DMenuOption should act like a radio button.
---
--- Checking a radio button automatically unchecks all adjacent radio buttons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetRadio)
---@param checked boolean `true` to set as a radio button.
function DMenuOption:SetRadio(checked) end

---[CLIENT AND MENU] Used internally by DMenuOption:AddSubMenu to create the submenu arrow and assign the created submenu to be opened when this option is hovered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetSubMenu)
---@param menu Panel The sub DMenu this option belongs to.
function DMenuOption:SetSubMenu(menu) end

---[CLIENT AND MENU] Toggles the checked state of DMenuOption. Does not respect DMenuOption:GetIsCheckable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:ToggleCheck)
function DMenuOption:ToggleCheck() end
