---@meta

--- An editable [DLabel](https://wiki.facepunch.com/gmod/DLabel), double click on it to edit.
---
--- This is used in the spawnmenu spawnlist headers.
---@class DLabelEditable : DLabel
local DLabelEditable = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether the editable label will stretch to the text entered or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabelEditable:GetAutoStretch)
---@return boolean # Whether the editable label will stretch to the text entered or not.
function DLabelEditable:GetAutoStretch() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether this [DLabelEditable](https://wiki.facepunch.com/gmod/DLabelEditable) is being edited or not. (i.e. has focus)
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabelEditable:IsEditing)
---@return boolean # Whether this DLabelEditable is being edited or not
function DLabelEditable:IsEditing() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) A hook called when the player presses Enter (i.e. the finished editing the label) and the text has changed.
---
--- Allows you to override/modify the text that will be set to display.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabelEditable:OnLabelTextChanged)
---@param txt string The original user input text
---@return string # If provided, will override the text that will be applied to the label itself.
function DLabelEditable:OnLabelTextChanged(txt) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets whether the editable label should stretch to the text entered or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabelEditable:SetAutoStretch)
---@param stretch boolean Whether the editable label should stretch to the text entered or not.
function DLabelEditable:SetAutoStretch(stretch) end
