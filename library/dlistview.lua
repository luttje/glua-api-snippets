---@meta

--- A data view with rows and columns.
--- Creates a DListView and populates it with two columns and three items, only one of which can be selected at a time.
---
--- Selecting a row will print a console message containing the text of the row and its index.
---
---@class DListView : DPanel
local DListView = {}

---[CLIENT AND MENU] Adds a column to the listview.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:AddColumn)
---@param column string The name of the column to add.
---@param position? number At which position to insert the new column compared to the other columns. Set to 1 to add the new column before all other columns.
---
--- By default the column will be placed after all columns.
---@return Panel # The newly created DListView_Column.
function DListView:AddColumn(column, position) end

---[CLIENT AND MENU] Adds a line to the list view.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:AddLine)
---@param ... any Values for a new row in the DListView, If several arguments are supplied, each argument will correspond to a respective column in the DListView.
---@return Panel # The newly created DListView_Line.
function DListView:AddLine(...) end

---[CLIENT AND MENU] Clears the current selection in the DListView.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:ClearSelection)
function DListView:ClearSelection() end

---[CLIENT AND MENU] Gets the width of a column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:ColumnWidth)
---@param column number The column to get the width of.
---@return number # Width of the column.
function DListView:ColumnWidth(column) end

---[CLIENT AND MENU] Creates the lines and gets the height of the contents, in a DListView.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:DataLayout)
---@return number # The height of the contents
function DListView:DataLayout() end

---[CLIENT AND MENU] Removes the scrollbar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:DisableScrollbar)
function DListView:DisableScrollbar() end

---[CLIENT AND MENU] Internal helper function called from the PANEL:PerformLayout of DListView.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:FixColumnsLayout)
function DListView:FixColumnsLayout() end

---[CLIENT AND MENU] Gets the canvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetCanvas)
---@return Panel # The canvas.
function DListView:GetCanvas() end

---[CLIENT AND MENU] Returns the height of the data of the DListView.
---
--- See also DListView:SetDataHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetDataHeight)
---@return number # The height of the data of the DListView.
function DListView:GetDataHeight() end

---[CLIENT AND MENU] See DListView:SetDirty.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetDirty)
---@return boolean #
function DListView:GetDirty() end

---[CLIENT AND MENU] Returns the height of the header of the DListView.
---
--- See also DListView:SetHeaderHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetHeaderHeight)
---@return number # The height of the header of the DListView.
function DListView:GetHeaderHeight() end

---[CLIENT AND MENU] Returns whether the header line should be visible on not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetHideHeaders)
---@return boolean # Whether the header line should be visible on not.
function DListView:GetHideHeaders() end

---[CLIENT AND MENU] Returns the height of DListView:GetCanvas.
---
--- Intended to represent the height of all data lines.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetInnerTall)
---@return number # The height of DListView:GetCanvas.
function DListView:GetInnerTall() end

---[CLIENT AND MENU] Gets the DListView_Line at the given index.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetLine)
---@param id number The index of the line to get.
---@return Panel # The DListView_Line at the given index.
function DListView:GetLine(id) end

---[CLIENT AND MENU] Gets all of the lines added to the DListView.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetLines)
---@return table # The lines added to the DListView.
function DListView:GetLines() end

---[CLIENT AND MENU] Returns whether multiple lines can be selected or not.
---
--- See DListView:SetMultiSelect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetMultiSelect)
---@return boolean # Whether multiple lines can be selected or not.
function DListView:GetMultiSelect() end

---[CLIENT AND MENU] Gets all of the lines that are currently selected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetSelected)
---@return table # A table of DListView_Lines.
function DListView:GetSelected() end

---[CLIENT AND MENU] Gets the currently selected DListView_Line index.
---
--- If DListView:SetMultiSelect is set to true, only the first line of all selected lines will be returned. Use DListView:GetSelected instead to get all of the selected lines.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetSelectedLine)
---@return number # The index of the currently selected line.
---@return Panel # The currently selected DListView_Line.
function DListView:GetSelectedLine() end

---[CLIENT AND MENU] Returns whether sorting of columns by clicking their headers is allowed or not.
---
--- See also DListView:SetSortable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetSortable)
---@return boolean # Whether sorting of columns by clicking their headers is allowed or not
function DListView:GetSortable() end

---[CLIENT AND MENU] Converts LineID to SortedID
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:GetSortedID)
---@param lineId number The DListView_Line:GetID of a line to look up
---@return number #
function DListView:GetSortedID(lineId) end

---[CLIENT AND MENU] Use DListView:OnRowSelected instead!
---
--- Called whenever a line is clicked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:OnClickLine)
---@param line Panel The selected line.
---@param isSelected boolean Boolean indicating whether the line is selected.
function DListView:OnClickLine(line, isSelected) end

---[CLIENT AND MENU] Called from DListView_Column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:OnRequestResize)
---@param column Panel The column which initialized the resize
---@param size number
function DListView:OnRequestResize(column, size) end

---[CLIENT AND MENU] Removes a line from the list view.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:RemoveLine)
---@param line number Removes the given row, by row id (same number as DListView:GetLine).
function DListView:RemoveLine(line) end

---[] Selects the line at the first index of the DListView if one has been added.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SelectFirstItem)
function DListView:SelectFirstItem() end

---[CLIENT AND MENU] Selects a line in the listview.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SelectItem)
---@param Line Panel The line to select.
function DListView:SelectItem(Line) end

---[CLIENT AND MENU] Sets the height of all lines of the DListView except for the header line.
---
--- See also DListView:SetHeaderHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SetDataHeight)
---@param height number The new height to set. Default value is 17.
function DListView:SetDataHeight(height) end

---[CLIENT AND MENU] Used internally to signify if the DListView needs a rebuild.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SetDirty)
---@param isDirty boolean
function DListView:SetDirty(isDirty) end

---[CLIENT AND MENU] Sets the height of the header line of the DListView.
---
--- See also DListView:SetDataHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SetHeaderHeight)
---@param height number The new height to set. Default value is 16.
function DListView:SetHeaderHeight(height) end

---[] Sets whether the header line should be visible on not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SetHideHeaders)
---@param hide boolean Whether the header line should be visible on not.
function DListView:SetHideHeaders(hide) end

---[CLIENT AND MENU] Sets whether multiple lines can be selected by the user by using the Ctrl or Shift keys. When set to false, only one line can be selected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SetMultiSelect)
---@param allowMultiSelect boolean Whether multiple lines can be selected or not
function DListView:SetMultiSelect(allowMultiSelect) end

---[CLIENT AND MENU] Enables/disables the sorting of columns by clicking.
---
--- 			This will only affect columns that are created after this function is called. Existing columns will be unaffected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SetSortable)
---@param isSortable boolean Whether sorting columns with clicking is allowed or not.
function DListView:SetSortable(isSortable) end

---[CLIENT AND MENU] Sorts the items in the specified column.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SortByColumn)
---@param columnIndex number The index of the column that should be sorted.
---@param descending? boolean Whether the items should be sorted in descending order or not.
function DListView:SortByColumn(columnIndex, descending) end

---[CLIENT AND MENU] Sorts the list based on given columns.
---
--- All arguments are optional
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListView:SortByColumns)
---@param column1? number
---@param descrending1? boolean
---@param column2? number
---@param descrending2? boolean
---@param column3? number
---@param descrending3? boolean
---@param column4? number
---@param descrending4? boolean
function DListView:SortByColumns(
	column1,
	descrending1,
	column2,
	descrending2,
	column3,
	descrending3,
	column4,
	descrending4
)
end
