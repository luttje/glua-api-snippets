---[SERVER] Adds a function to call when the current undo block is undone. Note that if an undo has a function, the player will always be notified when this undo is performed, even if the entity it is meant to undo no longer exists.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/undo.AddFunction)
---@param func fun(undoData: Undo) The function to call. First argument will be the Structures/Undo, all subsequent arguments will be what was passed after this function in the argument below.
---
--- Returning `false` will mark execution of this function as "failed", meaning that the undo might be skipped if no other entities are removed by it. This is useful when for example an entity you want to access is removed therefore there's nothing to do.
---
---@param ... any Arguments to pass to the function (after the undo info table)
function undo.AddFunction(func, ...) end
