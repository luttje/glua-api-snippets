---@meta

---@class DGrid
local DGrid = {}

---[CLIENT] Adds a new item to the grid.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:AddItem)
---@param item Panel The item to add. It will be forced visible and parented to the DGrid.
function DGrid:AddItem(item) end

---[CLIENT] Returns the number of columns of this DGrid. Set by DGrid:SetCols.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:GetCols)
---@return number The number of columns of this DGrid
function DGrid:GetCols() end

---[CLIENT] Returns the width of each column of the DGrid, which is set by DGrid:SetColWide.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:GetColWide)
---@return number The width of each column
function DGrid:GetColWide() end

---[CLIENT] Returns a list of panels in the grid.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:GetItems)
---@return table A list of Panels.
function DGrid:GetItems() end

---[CLIENT] Returns the height of each row of the DGrid, which is set by DGrid:SetRowHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:GetRowHeight)
---@return number The height of each row
function DGrid:GetRowHeight() end

---[CLIENT] Removes given panel from the DGrid:GetItems.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:RemoveItem)
---@param item Panel Item to remove from the grid
---@param bDontDelete boolean If set to true, the actual panel will not be removed via Panel:Remove.
function DGrid:RemoveItem(item, bDontDelete) end

---[CLIENT] Sets the number of columns this panel should have.
--- 
--- The DGrid will resize its width to match this value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:SetCols)
---@param cols number The desired number of columns
function DGrid:SetCols(cols) end

---[CLIENT] Sets the width of each column.
--- 
--- The cell panels (grid items) will not be resized or centered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:SetColWide)
---@param colWidth number The width of each column.
function DGrid:SetColWide(colWidth) end

---[CLIENT] Sets the height of each row. 
--- 
--- The cell panels (grid items) will not be resized or centered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:SetRowHeight)
---@param rowHeight number The height of each row
function DGrid:SetRowHeight(rowHeight) end

---[CLIENT] Sorts the items in the grid. Does not visually update the grid, use Panel:InvalidateLayout for that.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DGrid:SortByMember)
---@param key string A key in the panel from DGrid:GetItems. The key's value must be numeric.
---@param desc boolean True for descending order, false for ascending.
function DGrid:SortByMember(key, desc) end

