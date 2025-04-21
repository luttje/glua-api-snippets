---@meta

--- A simple list box with optional multi-select.
--- As this is deprecated, it is recommended that you use [DListView](https://wiki.facepunch.com/gmod/DListView), which contains the same functionality with multi-column options.
---@deprecated Derived from the deprecated DPanelList.
---@class DListBox : DPanelList
local DListBox = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the list box can select multiple items.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBox:GetMultiple)
---@return boolean # Whether the list box can select multiple items.
function DListBox:GetMultiple() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns selected items.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBox:GetSelectedItems)
---@return table # The selected items. A list of DListBoxItem.
function DListBox:GetSelectedItems() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns selected item values.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBox:GetSelectedValues)
---@return table # The selected item values. A list of Panel:GetValue of each selected DListBoxItem.
function DListBox:GetSelectedValues() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Select a [DListBoxItem](https://wiki.facepunch.com/gmod/DListBoxItem) based on its value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBox:SelectByName)
---@param val string Panel:GetValue of a DListBoxItem to select.
function DListBox:SelectByName(val) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to select a specific panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBox:SelectItem)
---@param item Panel DListBox to select.
---@param onlyme boolean Whether to deselect other selected items.
function DListBox:SelectItem(item, onlyme) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the list box can select multiple items.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBox:SetMultiple)
---@param multiple boolean Whether the list box can select multiple items.
function DListBox:SetMultiple(multiple) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets selected items.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBox:SetSelectedItems)
---@param items table The items to select. A list of DListBoxItem.
function DListBox:SetSelectedItems(items) end
