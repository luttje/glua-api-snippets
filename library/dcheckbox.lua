---@meta

--- The DCheckBox is a checkbox. It allows you to get a boolean value from the user (true/false - yes/no)
---@class DCheckBox : DButton
local DCheckBox = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Calls [DCheckBox:Toggle](https://wiki.facepunch.com/gmod/DCheckBox:Toggle)
---
---[View wiki](https://wiki.facepunch.com/gmod/DCheckBox:DoClick)
function DCheckBox:DoClick() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that gets the checked state of the checkbox.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCheckBox:GetChecked)
---@return boolean # Whether the box is checked or not.
function DCheckBox:GetChecked() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the state of the checkbox is being edited. This means whether the user is currently clicking (mouse-down) on the checkbox, and applies to both the left and right mouse buttons.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCheckBox:IsEditing)
---@return boolean # Whether the checkbox is being clicked.
function DCheckBox:IsEditing() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the checked state of the checkbox. Does not call the checkbox's [DCheckBox:OnChange](https://wiki.facepunch.com/gmod/DCheckBox:OnChange) and [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged) methods, unlike [DCheckBox:SetValue](https://wiki.facepunch.com/gmod/DCheckBox:SetValue).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCheckBox:SetChecked)
---@param checked boolean Whether the box should be checked or not.
function DCheckBox:SetChecked(checked) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the checked state of the checkbox, and calls the checkbox's [DCheckBox:OnChange](https://wiki.facepunch.com/gmod/DCheckBox:OnChange) and [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged) methods.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCheckBox:SetValue)
---@param checked boolean Whether the box should be checked or not.
function DCheckBox:SetValue(checked) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Toggles the checked state of the checkbox, and calls the checkbox's [DCheckBox:OnChange](https://wiki.facepunch.com/gmod/DCheckBox:OnChange) and [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged) methods. [DCheckBox:DoClick](https://wiki.facepunch.com/gmod/DCheckBox:DoClick) is an alias of this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCheckBox:Toggle)
function DCheckBox:Toggle() end
