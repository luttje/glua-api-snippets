---@meta

---@class DMenuOption : DButton
local DMenuOption = {}

---[CLIENT] Creates a sub DMenu and returns it. Has no duplicate call protection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:AddSubMenu)
---@return Panel #The created DMenu to add options to.
function DMenuOption:AddSubMenu() end

---[CLIENT] Returns the checked state of DMenuOption.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:GetChecked)
---@return boolean #Are we checked or not
function DMenuOption:GetChecked() end

---[CLIENT] Returns whether the DMenuOption is a checkbox option or a normal button option.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:GetIsCheckable)
---@return boolean #
function DMenuOption:GetIsCheckable() end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:GetMenu)
---@return Panel #A DMenu
function DMenuOption:GetMenu() end

---[CLIENT] Called whenever the DMenuOption's checked state changes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:OnChecked)
---@param checked boolean The new checked state
function DMenuOption:OnChecked(checked) end

---[CLIENT] Sets the checked state of the DMenuOption. Does not invoke DMenuOption:OnChecked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetChecked)
---@param checked boolean
function DMenuOption:SetChecked(checked) end

---[CLIENT] Sets whether the DMenuOption is a checkbox option or a normal button option.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetIsCheckable)
---@param checkable boolean
function DMenuOption:SetIsCheckable(checkable) end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetMenu)
---@param pnl Panel
function DMenuOption:SetMenu(pnl) end

---[CLIENT] Used internally by DMenuOption:AddSubMenu to create the submenu arrow and assign the created submenu to be opened this this option is hovered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:SetSubMenu)
---@param menu Panel
function DMenuOption:SetSubMenu(menu) end

---[CLIENT] Toggles the checked state of DMenuOption. Does not respect DMenuOption:GetIsCheckable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOption:ToggleCheck)
function DMenuOption:ToggleCheck() end
