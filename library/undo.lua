---@meta

--- The undo library allows you to add custom entities to the undo list, allowing users to "undo" their creation with their undo (default: Z) key.
undo = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds an entity to the current undo block
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.AddEntity)
---@param ent Entity The entity to add
function undo.AddEntity(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds a function to call when the current undo block is undone. Note that if an undo has a function, the player will always be notified when this undo is performed, even if the entity it is meant to undo no longer exists.
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.AddFunction)
---@param func fun(undo: table, ...: any):(result: boolean?) The function to call.
---
--- Function argument(s):
--- * table `undo` - See Structures/Undo.
--- * vararg `...` - What was passed after the function callback argument.
---
--- Function return value(s):
--- * boolean `result` - Returning `false` will mark execution of this function as "failed", meaning that the undo might be skipped if no other entities are removed by it. This is useful when for example an entity you want to access is removed therefore there's nothing to do.
---@param ... any Arguments to pass to the function (after the undo info table)
function undo.AddFunction(func, ...) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Begins a new undo entry
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.Create)
---@param name string Name of the undo message to show to players
function undo.Create(name) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Processes an undo block (in table form). This is used internally by the undo manager when a player presses Z.
---
--- You should use `gmod_undo` or `gmod_undonum *num*` console commands instead of calling this function directly.
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.Do_Undo)
---@param tab Undo The undo block to process as an Structures/Undo
---@return number # Number of removed entities
function undo.Do_Undo(tab) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Completes an undo entry, and registers it with the player's client
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.Finish)
---@param NiceText? string Text that appears in the player's undo history. If unset, is set to undo's name.
function undo.Finish(NiceText) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Serverside, returns a table containing all undo blocks of all players. Clientside, returns a table of the local player's undo blocks.
--- 	**NOTE**: Serverside, this table's keys use [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) to store a player's undo blocks.
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.GetTable)
---@return table{Undo}[] # The undo table.
function undo.GetTable() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Makes the UI dirty - it will re-create the controls the next time it is viewed.
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.MakeUIDirty)
function undo.MakeUIDirty() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Replaces any instance of the "from" reference with the "to" reference, in any existing undo block.
---
--- You very likely want to call [cleanup.ReplaceEntity](https://wiki.facepunch.com/gmod/cleanup.ReplaceEntity) with the same entities as well.
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.ReplaceEntity)
---@param from Entity The old entity
---@param to Entity The new entity to replace the old one. Can also be a `NULL` to remove the entity from the undo system.
---@return boolean # Whether the entity was replaced
function undo.ReplaceEntity(from, to) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets a custom undo text for the current undo block
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.SetCustomUndoText)
---@param customText string The text to display when the undo block is undone
function undo.SetCustomUndoText(customText) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the player which the current undo block belongs to
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.SetPlayer)
---@param ply Player The player responsible for undoing the block
function undo.SetPlayer(ply) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Adds a hook (CPanelPaint) to the control panel paint function so we can determine when it is being drawn.
---
---[View wiki](https://wiki.facepunch.com/gmod/undo.SetupUI)
function undo.SetupUI() end
