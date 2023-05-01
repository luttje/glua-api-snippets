---@meta

---@class DCategoryList
local DCategoryList = {}

---[CLIENT] Adds a DCollapsibleCategory to the list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCategoryList:Add)
---@param categoryName string The name of the category to add.
---@return Panel The created DCollapsibleCategory
function DCategoryList:Add(categoryName) end

---[CLIENT] Adds an element to the list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCategoryList:AddItem)
---@param element Panel VGUI element to add to the list.
function DCategoryList:AddItem(element) end

---[CLIENT] Calls Panel:UnselectAll on all child elements, if they have it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCategoryList:UnselectAll)
function DCategoryList:UnselectAll() end

