---@meta

--- The undo library allows you to add custom entities to the undo list, allowing users to "undo" their creation with their undo (default: Z) key.
undo = {}

---[SERVER] Adds an entity to the current undo block
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.AddEntity)
---@param ent Entity The entity to add
function undo.AddEntity(ent) end

---[SERVER] Adds a function to call when the current undo block is undone. Note that if an undo has a function, the player will always be notified when this undo is performed, even if the entity it is meant to undo no longer exists.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.AddFunction)
---@param func fun(undoData: Undo) The function to call. First argument will be the Structures/Undo, all subsequent arguments will be what was passed after this function in the argument below.
---
--- Returning `false` will mark execution of this function as "failed", meaning that the undo might be skipped if no other entities are removed by it. This is useful when for example an entity you want to access is removed therefore there's nothing to do.
---
---@param ... any Arguments to pass to the function (after the undo info table)
function undo.AddFunction(func, ...) end

---[SERVER] Begins a new undo entry
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.Create)
---@param name string Name of the undo message to show to players
function undo.Create(name) end

---[SERVER] Processes an undo block (in table form). This is used internally by the undo manager when a player presses Z.
---
--- You should use `gm_undo` or `gm_undonum *num*` console commands instead of calling this function directly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.Do_Undo)
---@param tab table The undo block to process as an Structures/Undo
---@return number # Number of removed entities
function undo.Do_Undo(tab) end

---[SERVER] Completes an undo entry, and registers it with the player's client
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.Finish)
---@param NiceText? string Text that appears in the player's undo history. If unset, is set to undo's name.
function undo.Finish(NiceText) end

---[SHARED] Serverside, returns a table containing all undo blocks of all players. Clientside, returns a table of the local player's undo blocks.
--- 	Serverside, this table's keys use Player:UniqueID to store a player's undo blocks.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.GetTable)
---@return table # The undo table.
function undo.GetTable() end

---[CLIENT] Makes the UI dirty - it will re-create the controls the next time it is viewed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.MakeUIDirty)
function undo.MakeUIDirty() end

---[SERVER] Replaces any instance of the "from" reference with the "to" reference, in any existing undo block. Returns true if something was replaced
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.ReplaceEntity)
---@param from Entity The old entity
---@param to Entity The new entity to replace the old one
---@return boolean # somethingReplaced
function undo.ReplaceEntity(from, to) end

---[SERVER] Sets a custom undo text for the current undo block
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.SetCustomUndoText)
---@param customText string The text to display when the undo block is undone
function undo.SetCustomUndoText(customText) end

---[SERVER] Sets the player which the current undo block belongs to
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.SetPlayer)
---@param ply Player The player responsible for undoing the block
function undo.SetPlayer(ply) end

---[CLIENT] Adds a hook (CPanelPaint) to the control panel paint function so we can determine when it is being drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.SetupUI)
function undo.SetupUI() end
