---@meta

---
---
---
--- 		A single column, used by DListView.
---
---@class DListView_Column : Panel
local DListView_Column = {}

---[CLIENT AND MENU] Gets the index used for this column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:GetColumnID)
---@return number # The column index of the DListView_Column.
function DListView_Column:GetColumnID() end

---[CLIENT AND MENU] Returns whether the column is sorted in descending order or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:GetDescending)
---@return boolean # Whether the column is sorted in descending order or not.
function DListView_Column:GetDescending() end

---[CLIENT AND MENU] Returns the fixed width of this column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:GetFixedWidth)
---@return number # The fixed width.
function DListView_Column:GetFixedWidth() end

---[CLIENT AND MENU] Returns the maximum width set with DListView_Column:SetMaxWidth.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:GetMaxWidth)
---@return number # The maximum width
function DListView_Column:GetMaxWidth() end

---[CLIENT AND MENU] Returns the minimum width set with DListView_Column:SetMinWidth.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:GetMinWidth)
---@return number # The minimum width
function DListView_Column:GetMinWidth() end

---[CLIENT AND MENU] Returns the text alignment for the column
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:GetTextAlign)
---@return number # The direction of the content, based on the number pad. See DListView_Column:SetTextAlign.
function DListView_Column:GetTextAlign() end

---[CLIENT AND MENU] Resizes the column, additionally adjusting the size of the column to the right, if any.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:ResizeColumn)
---@param size number
--- 			The amount to add to the current column's width.
---
--- 			Positive values will make it wider, and negative values will make it thinner.
---
function DListView_Column:ResizeColumn(size) end

---[CLIENT AND MENU] Sets the index used for this column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetColumnID)
---@param index number The column index of the DListView_Column.
function DListView_Column:SetColumnID(index) end

---[CLIENT AND MENU] Sets whether the column is sorted in descending order or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetDescending)
---@param desc boolean Whether the column is sorted in descending order or not.
function DListView_Column:SetDescending(desc) end

---[CLIENT AND MENU] Sets the fixed width of the column.
---
--- 			Internally this will set DListView_Column:SetMinWidth and DListView_Column:SetMaxWidth to the value provided
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetFixedWidth)
---@param width number The number value which will determine a fixed width.
function DListView_Column:SetFixedWidth(width) end

---[CLIENT AND MENU] Sets the maximum width of a column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth)
---@param width number The number value which will determine a maximum width.
function DListView_Column:SetMaxWidth(width) end

---[CLIENT AND MENU] Sets the minimum width of a column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth)
---@param width number The number value which will determine a minimum width.
function DListView_Column:SetMinWidth(width) end

---[CLIENT AND MENU] Sets the text in the column's header.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetName)
---@param name string The new name that the column's header will use.
function DListView_Column:SetName(name) end

---[CLIENT AND MENU] Sets the text alignment for the column
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetTextAlign)
---@param alignment number The direction of the content, based on the number pad.
---
--- |   |   |   |
--- | --- | --- | --- |
--- | 7: **top-left** | 8: **top-center**	| 9: **top-right** |
--- | 4: **middle-left** | 5: **center** | 6: **middle-right** |
--- | 1: **bottom-left** | 2: **bottom-center** | 3: **bottom-right** |
---
function DListView_Column:SetTextAlign(alignment) end

---[CLIENT AND MENU] Sets the width of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetWidth)
---@param width number The number value which will determine panel width.
function DListView_Column:SetWidth(width) end
