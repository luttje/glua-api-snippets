---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- The ContentHeader is used internally by the Spawnmenu and only use this if you know
--- what you're doing because you can break a few things with it.
---@class ContentHeader : DLabelEditable
local ContentHeader = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a [Global.DermaMenu](https://wiki.facepunch.com/gmod/Global.DermaMenu) and adds a delete option before opening the menu
---
---[View wiki](https://wiki.facepunch.com/gmod/ContentHeader:OpenMenu)
---@param style string
---@param hookname? string A Populate Hook like PopulateEntities
function ContentHeader:OpenMenu(style, hookname) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808)
---
---[View wiki](https://wiki.facepunch.com/gmod/ContentHeader:ToTable)
---@param bigtable table
function ContentHeader:ToTable(bigtable) end
