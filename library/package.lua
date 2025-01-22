---@meta

--- The package library is a standard Lua library, it's mainly for use with the module system built into Lua.
package = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets a metatable for module with its __index field referring to the global environment, so that this module inherits values from the global environment. To be used as an option to [Global.module](https://wiki.facepunch.com/gmod/Global.module).
---
---[View wiki](https://wiki.facepunch.com/gmod/package.seeall)
---@param module table The module table to be given a metatable
function package.seeall(module) end
