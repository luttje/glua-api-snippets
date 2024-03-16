---@meta

---
---
---
--- 		The ContentHeader is used internally by the Spawnmenu and only use this if you know
--- 		what you're doing because you can break a few things with it.
---
---@class ContentHeader : DLabelEditable
local ContentHeader = {}

---[CLIENT] Creates a Global.DermaMenu and adds a delete option before opening the menu
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContentHeader:OpenMenu)
---@param style string
---@param hookname? string A Populate Hook like PopulateEntities
function ContentHeader:OpenMenu(style, hookname) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContentHeader:ToTable)
---@param bigtable table
function ContentHeader:ToTable(bigtable) end
