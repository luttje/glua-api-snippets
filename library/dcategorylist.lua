---@meta

---
--- 		A host for multiple DCollapsibleCategory panels.
--- 		As the name suggests, each one of them can be collapsed or expanded on demand by the user.
--- 	Creates a DCategoryList with a category and a DFrame, as seen above.
---@class DCategoryList : DScrollPanel
local DCategoryList = {}

---[CLIENT AND MENU] Adds a DCollapsibleCategory to the list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCategoryList:Add)
---@param categoryName string The name of the category to add.
---@return Panel # The created DCollapsibleCategory
function DCategoryList:Add(categoryName) end

---[CLIENT AND MENU] Adds an element to the list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCategoryList:AddItem)
---@param element Panel VGUI element to add to the list.
function DCategoryList:AddItem(element) end

---[CLIENT AND MENU] Calls Panel:UnselectAll on all child elements, if they have it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCategoryList:UnselectAll)
function DCategoryList:UnselectAll() end
