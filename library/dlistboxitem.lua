---@meta

---
---@deprecated Used Internally by DListBox.
---@class DListBoxItem : DLabel
local DListBoxItem = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the parent "mother" of this **DListBoxItem** set by [DListBoxItem:SetMother](https://wiki.facepunch.com/gmod/DListBoxItem:SetMother).
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBoxItem:GetMother)
---@return Panel # The "mother" DListBox.
function DListBoxItem:GetMother() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Selects this item.
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBoxItem:Select)
---@param onlyMe boolean Whether to deselect other items.
function DListBoxItem:Select(onlyMe) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the "mother" (parent) panel for this item. Done internally by [DListBox:AddItem](https://wiki.facepunch.com/gmod/DListBox:AddItem)
---
---[View wiki](https://wiki.facepunch.com/gmod/DListBoxItem:SetMother)
---@param parent Panel The "mother" panel to set.
function DListBoxItem:SetMother(parent) end
