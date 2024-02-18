---@meta

---
---
---
--- 		A simple list box with optional multi-select.
--- 		As this is deprecated, it is recommended that you use DListView, which contains the same functionality with multi-column options.
---
---@deprecated Derived from the deprecated DPanelList.
---@class DListBox : DPanelList
local DListBox = {}

---[CLIENT AND MENU] Returns whether the list box can select multiple items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBox:GetMultiple)
---@return boolean # Whether the list box can select multiple items.
function DListBox:GetMultiple() end

---[CLIENT AND MENU] Returns selected items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBox:GetSelectedItems)
---@return table # The selected items. A list of DListBoxItem.
function DListBox:GetSelectedItems() end

---[CLIENT AND MENU] Returns selected item values.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBox:GetSelectedValues)
---@return table # The selected item values. A list of Panel:GetValue of each selected DListBoxItem.
function DListBox:GetSelectedValues() end

---[CLIENT AND MENU] Select a DListBoxItem based on its value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBox:SelectByName)
---@param val string Panel:GetValue of a DListBoxItem to select.
function DListBox:SelectByName(val) end

---[CLIENT AND MENU] Used internally to select a specific panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBox:SelectItem)
---@param item Panel DListBox to select.
---@param onlyme boolean Whether to deselect other selected items.
function DListBox:SelectItem(item, onlyme) end

---[CLIENT AND MENU] Sets whether the list box can select multiple items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBox:SetMultiple)
---@param multiple boolean Whether the list box can select multiple items.
function DListBox:SetMultiple(multiple) end

---[CLIENT AND MENU] Sets selected items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBox:SetSelectedItems)
---@param items table The items to select. A list of DListBoxItem.
function DListBox:SetSelectedItems(items) end
