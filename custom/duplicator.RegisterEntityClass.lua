---[SHARED] This allows you to specify a specific function to be run when your SENT is pasted with the duplicator, instead of relying on the generic automatic functions.
---
--- Automatically calls duplicator.Allow for the entity class.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.RegisterEntityClass)
---@param name string The ClassName of the entity you wish to register a factory for
---@param _function fun(ply: Player, ...) The factory function you want to have called. It should have the arguments (Player, ...) where ... is whatever arguments you request to be passed. It also should return the entity created, otherwise duplicator.Paste result will not include it!
---@param ... any Strings of the names of arguments you want passed to function the from the Structures/EntityCopyData. As a special case, "Data" will pass the whole structure.
function duplicator.RegisterEntityClass(name, _function, ...) end
