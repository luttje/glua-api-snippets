---@meta

---@class DListView_Column
local DListView_Column = {}

---[CLIENT] Gets the index used for this column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:GetColumnID)
---@return number The column index of the DListView_Column.
function DListView_Column:GetColumnID() end

---[CLIENT] Resizes the column, additionally adjusting the size of the column to the right, if any.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:ResizeColumn)
---@param size number
--- 			The amount to add to the current column's width.
---
--- 			Positive values will make it wider, and negative values will make it thinner.
---
function DListView_Column:ResizeColumn(size) end

---[CLIENT] Sets the fixed width of the column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetFixedWidth)
---@param width number The number value which will determine a fixed width.
function DListView_Column:SetFixedWidth(width) end

---[CLIENT] Sets the maximum width of a column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth)
---@param width number The number value which will determine a maximum width.
function DListView_Column:SetMaxWidth(width) end

---[CLIENT] Sets the minimum width of a column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth)
---@param width number The number value which will determine a minimum width.
function DListView_Column:SetMinWidth(width) end

---[CLIENT] Sets the text in the column's header.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetName)
---@param name string The new name that the column's header will use.
function DListView_Column:SetName(name) end

---[CLIENT] Sets the text alignment for the column
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

---[CLIENT] Sets the width of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Column:SetWidth)
---@param width number The number value which will determine panel width.
function DListView_Column:SetWidth(width) end
