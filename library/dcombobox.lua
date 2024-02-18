---@meta

---
--- 		A field with multiple selectable values.
--- 	Creates a Combo Box.Create a Combo Box with all players.
---@class DComboBox : DButton
local DComboBox = {}

---[CLIENT AND MENU] Adds a choice to the combo box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:AddChoice)
---@param value string The text show to the user.
---@param data? any The data accompanying this string. If left empty, the value argument is used instead.
---
--- Can be accessed with the second argument of DComboBox:GetSelected, DComboBox:GetOptionData and as an argument of DComboBox:OnSelect.
---@param select? boolean Should this be the default selected text show to the user or not.
---@param icon? string Adds an icon for this choice.
---@return number # The index of the new option.
function DComboBox:AddChoice(value, data, select, icon) end

---[CLIENT AND MENU] Adds a spacer below the currently last item in the drop down. Recommended to use with DComboBox:SetSortItems set to `false`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:AddSpacer)
function DComboBox:AddSpacer() end

---[CLIENT AND MENU] Ran every frame to update the value of this panel to the value of the associated convar. See Panel:SetConvar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:CheckConVarChanges)
function DComboBox:CheckConVarChanges() end

---[CLIENT AND MENU] Selects a combo box option by its index and changes the text displayed at the top of the combo box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:ChooseOption)
---@param value string The text to display at the top of the combo box.
---@param index number The option index.
function DComboBox:ChooseOption(value, index) end

---[CLIENT AND MENU] Selects an option within a combo box based on its table index.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:ChooseOptionID)
---@param index number Selects the option with given index.
function DComboBox:ChooseOptionID(index) end

---[CLIENT AND MENU] Clears the combo box's text value, choices, and data values.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:Clear)
function DComboBox:Clear() end

---[CLIENT AND MENU] Closes the combo box menu. Called when the combo box is clicked while open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:CloseMenu)
function DComboBox:CloseMenu() end

---[CLIENT AND MENU] Returns an option's data based on the given index.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:GetOptionData)
---@param index number The option index.
---@return any # The option's data value.
function DComboBox:GetOptionData(index) end

---[CLIENT AND MENU] Returns an option's text based on the given index.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:GetOptionText)
---@param index number The option index.
---@return string # The option's text value.
function DComboBox:GetOptionText(index) end

---[CLIENT AND MENU] Returns an option's text based on the given data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:GetOptionTextByData)
---@param data string The data to look up the name of.
---
--- If given a number and no matching data was found, the function will test given data against each Global.tonumber'd data entry.
---@return string # The option's text value.  If no matching data was found, the data itself will be returned. If multiple identical data entries exist, the first instance will be returned.
function DComboBox:GetOptionTextByData(data) end

---[CLIENT AND MENU] Returns the currently selected option's text and data
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:GetSelected)
---@return string # The option's text value.
---@return any # The option's stored data.
function DComboBox:GetSelected() end

---[CLIENT AND MENU] Returns the index (ID) of the currently selected option.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:GetSelectedID)
---@return number # The ID of the currently selected option.
function DComboBox:GetSelectedID() end

---[CLIENT AND MENU] Returns an whether the items in the dropdown will be alphabetically sorted or not.
---
--- See DComboBox:SetSortItems.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:GetSortItems)
---@return boolean # True if enabled, false otherwise.
function DComboBox:GetSortItems() end

---[CLIENT AND MENU] Returns whether or not the combo box's menu is opened.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:IsMenuOpen)
---@return boolean # True if the menu is open, false otherwise.
function DComboBox:IsMenuOpen() end

---[CLIENT AND MENU] Opens the combo box drop down menu. Called when the combo box is clicked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:OpenMenu)
function DComboBox:OpenMenu() end

---[CLIENT AND MENU] Removes a choice added with DComboBox:AddChoice
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:RemoveChoice)
---@param index number The index of the option to remove.
---@return string # The text of the removed option.
---@return any # The data of the removed option that was provided.
function DComboBox:RemoveChoice(index) end

---[CLIENT AND MENU] Sets whether or not the items should be sorted alphabetically in the dropdown menu of the DComboBox. If set to false, items will appear in the order they were added by DComboBox:AddChoice calls.
---
--- This is enabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:SetSortItems)
---@param sort boolean true to enable, false to disable
function DComboBox:SetSortItems(sort) end

---[CLIENT AND MENU] Sets the text shown in the combo box when the menu is not collapsed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DComboBox:SetValue)
---@param value string The text in the DComboBox.
function DComboBox:SetValue(value) end
