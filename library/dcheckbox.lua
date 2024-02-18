---@meta

---
--- 		The DCheckBox is a checkbox. It allows you to get a boolean value from the user (true/false - yes/no)
--- 	Creates a DCheckBox and sets its initial value.
---@class DCheckBox : DButton
local DCheckBox = {}

---[CLIENT AND MENU] Gets the checked state of the checkbox.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:GetChecked)
---@return boolean # Whether the box is checked or not.
function DCheckBox:GetChecked() end

---[CLIENT AND MENU] Returns whether the state of the checkbox is being edited. This means whether the user is currently clicking (mouse-down) on the checkbox, and applies to both the left and right mouse buttons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:IsEditing)
---@return boolean # Whether the checkbox is being clicked.
function DCheckBox:IsEditing() end

---[CLIENT AND MENU] Sets the checked state of the checkbox. Does not call the checkbox's DCheckBox:OnChange and Panel:ConVarChanged methods, unlike DCheckBox:SetValue.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:SetChecked)
---@param checked boolean Whether the box should be checked or not.
function DCheckBox:SetChecked(checked) end

---[CLIENT AND MENU] Sets the checked state of the checkbox, and calls the checkbox's DCheckBox:OnChange and Panel:ConVarChanged methods.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:SetValue)
---@param checked boolean Whether the box should be checked or not.
function DCheckBox:SetValue(checked) end

---[CLIENT AND MENU] Toggles the checked state of the checkbox, and calls the checkbox's DCheckBox:OnChange and Panel:ConVarChanged methods. This is called by DCheckBox:DoClick.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:Toggle)
function DCheckBox:Toggle() end
