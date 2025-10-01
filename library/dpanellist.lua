---@meta

--- Displays elements in a horizontal or vertical list. A scrollbar is automatically shown if necessary.
--- You can get its vertical bar via `DPanelList.VBar`.
--- [DPanelList](https://wiki.facepunch.com/gmod/DPanelList) was succeeded in version 13 by more specialised layout elements.
---@deprecated Use a combination of DIconLayout, DListLayout and DScrollPanel instead.
---@class DPanelList : DPanel
local DPanelList = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a existing panel to the end of [DPanelList](https://wiki.facepunch.com/gmod/DPanelList).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:AddItem)
---@param pnl Panel Panel to be used as element of list
---@param state? string If set to "ownline", the item will take its own entire line.
function DPanelList:AddItem(pnl, state) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Removes all items.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:CleanList)
function DPanelList:CleanList() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Hides all child panels, and optionally deletes them.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:Clear)
---@param remove boolean Whether to actually delete the panels, not just hide them.
function DPanelList:Clear(remove) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Enables/creates the vertical scroll bar so that the panel list can be scrolled through.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:EnableVerticalScrollbar)
function DPanelList:EnableVerticalScrollbar() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns all panels has added by [DPanelList:AddItem](https://wiki.facepunch.com/gmod/DPanelList:AddItem)
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:GetItems)
---@return table # A table of panels used as items of DPanelList.
function DPanelList:GetItems() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns offset of list items from the panel borders set by [DPanelList:SetPadding](https://wiki.facepunch.com/gmod/DPanelList:SetPadding)
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:GetPadding)
---@return number # Offset from panel borders
function DPanelList:GetPadding() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns distance between list items set by [DPanelList:SetSpacing](https://wiki.facepunch.com/gmod/DPanelList:SetSpacing)
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:GetSpacing)
---@return number # Distance between panels
function DPanelList:GetSpacing() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Insert given panel at the top of the list.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:InsertAtTop)
---@param insert Panel The panel to insert
---@param strLineState string If set to "ownline", no other panels will be placed to the left or right of the panel we are inserting
function DPanelList:InsertAtTop(insert, strLineState) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to rebuild the child panel positions.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:Rebuild)
function DPanelList:Rebuild() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the [DPanelList](https://wiki.facepunch.com/gmod/DPanelList) to size its height to its contents. This is set to false by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:SetAutoSize)
---@param shouldSizeToContents boolean Whether to size to the height of the DPanelList contents.
function DPanelList:SetAutoSize(shouldSizeToContents) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the offset of the lists items from the panel borders
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:SetPadding)
---@param Offset number Offset from panel borders
function DPanelList:SetPadding(Offset) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets distance between list items
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanelList:SetSpacing)
---@param Distance number Distance between panels
function DPanelList:SetSpacing(Distance) end
