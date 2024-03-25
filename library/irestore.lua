---@meta

--- The object used in the [saverestore](https://wiki.facepunch.com/gmod/saverestore), mainly in [saverestore.AddRestoreHook](https://wiki.facepunch.com/gmod/saverestore.AddRestoreHook).
---
--- It allows you to read blocks directly from the save game files used by Half-Life 2 save system when such save is loaded.
---@class IRestore
local IRestore = {}

---[SHARED] Ends current data block started with [IRestore:StartBlock](https://wiki.facepunch.com/gmod/IRestore:StartBlock) and returns to the parent block.
---
--- To avoid all sorts of errors, you **must** end all blocks you start.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:EndBlock)
function IRestore:EndBlock() end

---[SHARED] Reads next bytes from the restore object as an [Angle](https://wiki.facepunch.com/gmod/Angle).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:ReadAngle)
---@return Angle # The angle that has been read
function IRestore:ReadAngle() end

---[SHARED] Reads next bytes from the restore object as a [boolean](https://wiki.facepunch.com/gmod/boolean).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:ReadBool)
---@return boolean # The boolean that has been read
function IRestore:ReadBool() end

---[SHARED] Reads next bytes from the restore object as an [Entity](https://wiki.facepunch.com/gmod/Entity).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:ReadEntity)
---@return Entity # The entity that has been read.
function IRestore:ReadEntity() end

---[SHARED] Reads next bytes from the restore object as a floating point [number](https://wiki.facepunch.com/gmod/number).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:ReadFloat)
---@return number # The read floating point number.
function IRestore:ReadFloat() end

---[SHARED] Reads next bytes from the restore object as an integer [number](https://wiki.facepunch.com/gmod/number).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:ReadInt)
---@return number # The read integer number.
function IRestore:ReadInt() end

---[SHARED] Reads next bytes from the restore object as a [string](https://wiki.facepunch.com/gmod/string).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:ReadString)
---@return string # The read string.
function IRestore:ReadString() end

---[SHARED] Reads next bytes from the restore object as a [Vector](https://wiki.facepunch.com/gmod/Vector).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:ReadVector)
---@return Vector # The read vector.
function IRestore:ReadVector() end

---[SHARED] Loads next block of data to be read inside current block. Blocks **must** be ended with [IRestore:EndBlock](https://wiki.facepunch.com/gmod/IRestore:EndBlock).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IRestore:StartBlock)
---@return string # The name of the next data block to be read.
function IRestore:StartBlock() end
