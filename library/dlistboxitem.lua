---@meta

---
---
---
---@deprecated Used Internally by DListBox.
---@class DListBoxItem : DLabel
local DListBoxItem = {}

---[CLIENT] Returns the parent "mother" of this **DListBoxItem** set by [DListBoxItem:SetMother](https://wiki.facepunch.com/gmod/DListBoxItem:SetMother).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBoxItem:GetMother)
---@return Panel # The "mother" DListBox.
function DListBoxItem:GetMother() end

---[CLIENT] Selects this item.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBoxItem:Select)
---@param onlyMe boolean Whether to deselect other items.
function DListBoxItem:Select(onlyMe) end

---[CLIENT] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the "mother" (parent) panel for this item. Done internally by [DListBox:AddItem](https://wiki.facepunch.com/gmod/DListBox:AddItem)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DListBoxItem:SetMother)
---@param parent Panel The "mother" panel to set.
function DListBoxItem:SetMother(parent) end
