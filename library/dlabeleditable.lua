---@meta

---
--- 		An editable DLabel, double click on it to edit.
---
--- 		This is used in the spawnmenu spawnlist headers.
--- 	Creates a DLabelEditable.
---@class DLabelEditable : DLabel
local DLabelEditable = {}

---[CLIENT] Returns whether the editable label will stretch to the text entered or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelEditable:GetAutoStretch)
---@return boolean # Whether the editable label will stretch to the text entered or not.
function DLabelEditable:GetAutoStretch() end

---[CLIENT AND MENU] Returns whether this DLabelEditable is being edited or not. (i.e. has focus)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelEditable:IsEditing)
---@return boolean # Whether this DLabelEditable is being edited or not
function DLabelEditable:IsEditing() end

---[CLIENT] A hook called when the player presses Enter (i.e. the finished editing the label) and the text has changed.
---
--- Allows you to override/modify the text that will be set to display.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelEditable:OnLabelTextChanged)
---@param txt string The original user input text
---@return string # If provided, will override the text that will be applied to the label itself.
function DLabelEditable:OnLabelTextChanged(txt) end

---[CLIENT] Sets whether the editable label should stretch to the text entered or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelEditable:SetAutoStretch)
---@param stretch boolean Whether the editable label should stretch to the text entered or not.
function DLabelEditable:SetAutoStretch(stretch) end
