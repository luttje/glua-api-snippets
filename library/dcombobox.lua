---@meta

--- A field with multiple selectable values.
---@class DComboBox : DButton
local DComboBox = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a choice to the combo box.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:AddChoice)
---@param value string The text show to the user.
---@param data? any The data accompanying this string. If left empty, the value argument is used instead.
---
--- Can be accessed with the second argument of DComboBox:GetSelected, DComboBox:GetOptionData and as an argument of DComboBox:OnSelect.
---@param select? boolean Should this be the default selected text show to the user or not.
---@param icon? string Adds an icon for this choice.
---@return number # The index of the new option.
function DComboBox:AddChoice(value, data, select, icon) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a spacer below the currently last item in the drop down. Recommended to use with [DComboBox:SetSortItems](https://wiki.facepunch.com/gmod/DComboBox:SetSortItems) set to `false`.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:AddSpacer)
function DComboBox:AddSpacer() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Ran every frame to update the value of this panel to the value of the associated convar. See [Panel:SetConvar](https://wiki.facepunch.com/gmod/Panel:SetConvar).
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:CheckConVarChanges)
function DComboBox:CheckConVarChanges() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Selects a combo box option by its index and changes the text displayed at the top of the combo box.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:ChooseOption)
---@param value string The text to display at the top of the combo box.
---@param index number The option index.
function DComboBox:ChooseOption(value, index) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Selects an option within a combo box based on its table index.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:ChooseOptionID)
---@param index number Selects the option with given index.
function DComboBox:ChooseOptionID(index) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Clears the combo box's text value, choices, and data values.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:Clear)
function DComboBox:Clear() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Closes the combo box menu. Called when the combo box is clicked while open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:CloseMenu)
function DComboBox:CloseMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns an option's data based on the given index.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:GetOptionData)
---@param index number The option index.
---@return any # The option's data value.
function DComboBox:GetOptionData(index) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns an option's text based on the given index.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:GetOptionText)
---@param index number The option index.
---@return string # The option's text value.
function DComboBox:GetOptionText(index) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns an option's text based on the given data.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:GetOptionTextByData)
---@param data string The data to look up the name of.
---
--- If given a number and no matching data was found, the function will test given data against each Global.tonumber'd data entry.
---@return string # The option's text value.
---
--- If no matching data was found, the data itself will be returned. If multiple identical data entries exist, the first instance will be returned.
function DComboBox:GetOptionTextByData(data) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the currently selected option's text and data
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:GetSelected)
---@return string # The option's text value.
---@return any # The option's stored data.
function DComboBox:GetSelected() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the index (ID) of the currently selected option.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:GetSelectedID)
---@return number # The ID of the currently selected option.
function DComboBox:GetSelectedID() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns an whether the items in the dropdown will be alphabetically sorted or not.
---
--- See [DComboBox:SetSortItems](https://wiki.facepunch.com/gmod/DComboBox:SetSortItems).
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:GetSortItems)
---@return boolean # True if enabled, false otherwise.
function DComboBox:GetSortItems() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the combo box's menu is opened.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:IsMenuOpen)
---@return boolean # True if the menu is open, false otherwise.
function DComboBox:IsMenuOpen() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Opens the combo box drop down menu. Called when the combo box is clicked.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:OpenMenu)
function DComboBox:OpenMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Removes a choice added with [DComboBox:AddChoice](https://wiki.facepunch.com/gmod/DComboBox:AddChoice)
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:RemoveChoice)
---@param index number The index of the option to remove.
---@return string # The text of the removed option.
---@return any # The data of the removed option that was provided.
function DComboBox:RemoveChoice(index) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets whether or not the items should be sorted alphabetically in the dropdown menu of the [DComboBox](https://wiki.facepunch.com/gmod/DComboBox). If set to false, items will appear in the order they were added by [DComboBox:AddChoice](https://wiki.facepunch.com/gmod/DComboBox:AddChoice) calls.
---
--- This is enabled by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:SetSortItems)
---@param sort boolean true to enable, false to disable
function DComboBox:SetSortItems(sort) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the text shown in the combo box when the menu is not collapsed.
---
---[View wiki](https://wiki.facepunch.com/gmod/DComboBox:SetValue)
---@param value string The text in the DComboBox.
function DComboBox:SetValue(value) end
