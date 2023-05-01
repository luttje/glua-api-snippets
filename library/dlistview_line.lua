---@meta

---@class DListView_Line
local DListView_Line = {}

---[CLIENT] Called by DListView:DataLayout
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:DataLayout)
---@param pnl DListView The list view.
function DListView_Line:DataLayout(pnl) end

---[CLIENT] Returns whether this line is odd or even in the list. This is internally used (and set) to change the looks of every other line.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:GetAltLine)
---@return boolean Whether this line is 'alternative'.
function DListView_Line:GetAltLine() end

---[CLIENT] Gets the string held in the specified column of a DListView_Line panel.
---
--- This is the same thing as doing Panel:GetValue( column_number ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:GetColumnText)
---@param column number The number of the column to retrieve the text from, starts with 1.
---@return string The contents of the specified column.
function DListView_Line:GetColumnText(column) end

---[CLIENT] Returns the ID of this line, set automatically in DListView:AddLine.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:GetID)
---@return number The ID of this line.
function DListView_Line:GetID() end

---[CLIENT] Returns the parent DListView of this line.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:GetListView)
---@return DListView The parent DListView of this line.
function DListView_Line:GetListView() end

---[CLIENT] Returns the data stored on given cell of this line.
---
--- 	Used in the DListView:SortByColumn function in case you want to sort with something else than the text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:GetSortValue)
---@param column number The number of the column to write the text from, starts with 1.
---@return any The data that is set for given column of this line, if any.
function DListView_Line:GetSortValue(column) end

---[CLIENT] Returns whether this line is selected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:IsLineSelected)
---@return boolean Whether this line is selected.
function DListView_Line:IsLineSelected() end

---[CLIENT] Sets whether this line is odd or even in the list. This is internally used (and set automatically) to change the looks of every other line.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:SetAltLine)
---@param alt boolean Whether this line is 'alternative'.
function DListView_Line:SetAltLine(alt) end

---[CLIENT] Sets the string held in the specified column of a DListView_Line panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:SetColumnText)
---@param column number The number of the column to write the text from, starts with 1.
---@param value string Column text you want to set
---@return DLabel The DLabel in which the text was set.
function DListView_Line:SetColumnText(column, value) end

---[CLIENT] Sets whether this line is selected or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:SetSelected)
---@param selected boolean Whether this line is selected.
function DListView_Line:SetSelected(selected) end

---[CLIENT] Allows you to store data per column.
---
--- 	Used in the DListView:SortByColumn function in case you want to sort with something else than the text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView_Line:SetSortValue)
---@param column number The number of the column to write the text from, starts with 1.
---@param data any Data for given column on the line you wish to set.
function DListView_Line:SetSortValue(column, data) end
