---@meta

--- A host for multiple [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) panels.
--- As the name suggests, each one of them can be collapsed or expanded on demand by the user.
---@class DCategoryList : DScrollPanel
local DCategoryList = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) to the list.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCategoryList:Add)
---@param categoryName string The name of the category to add.
---@return Panel # The created DCollapsibleCategory
function DCategoryList:Add(categoryName) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds an element to the list.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCategoryList:AddItem)
---@param element Panel VGUI element to add to the list.
function DCategoryList:AddItem(element) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Calls [Panel:UnselectAll](https://wiki.facepunch.com/gmod/Panel:UnselectAll) on all child elements, if they have it.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCategoryList:UnselectAll)
function DCategoryList:UnselectAll() end
