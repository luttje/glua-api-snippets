---@meta

--- The package library is a standard Lua library, it's mainly for use with the module system built into Lua.
package = {}

---[SHARED AND MENU] Sets a metatable for module with its __index field referring to the global environment, so that this module inherits values from the global environment. To be used as an option to Global.module.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/package.seeall)
---@param module table The module table to be given a metatable
function package.seeall(module) end
