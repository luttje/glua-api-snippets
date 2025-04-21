---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- A single column, used by [DListView](https://wiki.facepunch.com/gmod/DListView).
---@class DListView_Column : Panel
local DListView_Column = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the index used for this column.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:GetColumnID)
---@return number # The column index of the DListView_Column.
function DListView_Column:GetColumnID() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the column is sorted in descending order or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:GetDescending)
---@return boolean # Whether the column is sorted in descending order or not.
function DListView_Column:GetDescending() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the fixed width of this column.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:GetFixedWidth)
---@return number # The fixed width.
function DListView_Column:GetFixedWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the maximum width set with [DListView_Column:SetMaxWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth).
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:GetMaxWidth)
---@return number # The maximum width
function DListView_Column:GetMaxWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the minimum width set with [DListView_Column:SetMinWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth).
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:GetMinWidth)
---@return number # The minimum width
function DListView_Column:GetMinWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the text alignment for the column
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:GetTextAlign)
---@return number # The direction of the content, based on the number pad. See DListView_Column:SetTextAlign.
function DListView_Column:GetTextAlign() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Resizes the column, additionally adjusting the size of the column to the right, if any.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:ResizeColumn)
---@param size number The amount to add to the current column's width.
---
--- Positive values will make it wider, and negative values will make it thinner.
function DListView_Column:ResizeColumn(size) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Sets the index used for this column.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetColumnID)
---@param index number The column index of the DListView_Column.
function DListView_Column:SetColumnID(index) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the column is sorted in descending order or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetDescending)
---@param desc boolean Whether the column is sorted in descending order or not.
function DListView_Column:SetDescending(desc) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the fixed width of the column.
--- **NOTE**: Internally this will set [SetMinWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth) and [SetMaxWidth](https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth) to the value provided
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetFixedWidth)
---@param width number The number value which will determine a fixed width.
function DListView_Column:SetFixedWidth(width) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the maximum width of a column.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetMaxWidth)
---@param width number The number value which will determine a maximum width.
function DListView_Column:SetMaxWidth(width) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the minimum width of a column.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetMinWidth)
---@param width number The number value which will determine a minimum width.
function DListView_Column:SetMinWidth(width) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the text in the column's header.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetName)
---@param name string The new name that the column's header will use.
function DListView_Column:SetName(name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the text alignment for the column
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetTextAlign)
---@param alignment number The direction of the content, based on the number pad.
--[[

|   |   |   |
| --- | --- | --- |
| 7: **top-left** | 8: **top-center**	| 9: **top-right** |
| 4: **middle-left** | 5: **center** | 6: **middle-right** |
| 1: **bottom-left** | 2: **bottom-center** | 3: **bottom-right** |
--]]
function DListView_Column:SetTextAlign(alignment) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the width of the panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListView_Column:SetWidth)
---@param width number The number value which will determine panel width.
function DListView_Column:SetWidth(width) end
