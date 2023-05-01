---@meta

---@class DCheckBox
local DCheckBox = {}

---[CLIENT] Gets the checked state of the checkbox.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:GetChecked)
---@return boolean Whether the box is checked or not.
function DCheckBox:GetChecked() end

---[CLIENT] Returns whether the state of the checkbox is being edited. This means whether the user is currently clicking (mouse-down) on the checkbox, and applies to both the left and right mouse buttons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:IsEditing)
---@return boolean Whether the checkbox is being clicked.
function DCheckBox:IsEditing() end

---[CLIENT] Called when the "checked" state is changed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:OnChange)
---@param bVal boolean Whether the CheckBox is checked or not.
function DCheckBox:OnChange(bVal) end

---[CLIENT] Sets the checked state of the checkbox. Does not call the checkbox's DCheckBox:OnChange and Panel:ConVarChanged methods, unlike DCheckBox:SetValue.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:SetChecked)
---@param checked boolean Whether the box should be checked or not.
function DCheckBox:SetChecked(checked) end

---[CLIENT] Sets the checked state of the checkbox, and calls the checkbox's DCheckBox:OnChange and Panel:ConVarChanged methods.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:SetValue)
---@param checked boolean Whether the box should be checked or not.
function DCheckBox:SetValue(checked) end

---[CLIENT] Toggles the checked state of the checkbox, and calls the checkbox's DCheckBox:OnChange and Panel:ConVarChanged methods. This is called by DCheckBox:DoClick.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBox:Toggle)
function DCheckBox:Toggle() end
