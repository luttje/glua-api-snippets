---@meta

--- The object used in the saverestore, mainly in saverestore.AddSaveHook.
---
--- It allows you to write blocks directly into the save game files used by Half-Life 2 save system when such save is being saved.
---@class ISave
local ISave = {}

---[SHARED] Ends current data block started with ISave:StartBlock and returns to the parent block.
---
--- To avoid all sorts of errors, you **must** end all blocks you start.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:EndBlock)
function ISave:EndBlock() end

---[SHARED] Starts a new block of data that you can write to inside current block. Blocks **must** be ended with ISave:EndBlock.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:StartBlock)
---@param name string Name of the new block. Used for determining which block is which, returned by IRestore:StartBlock during game load.
function ISave:StartBlock(name) end

---[SHARED] Writes an Angle to the save object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:WriteAngle)
---@param ang Angle The angle to write.
function ISave:WriteAngle(ang) end

---[SHARED] Writes a boolean to the save object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:WriteBool)
---@param bool boolean The boolean to write.
function ISave:WriteBool(bool) end

---[SHARED] Writes an Entity to the save object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:WriteEntity)
---@param ent Entity The entity to write.
function ISave:WriteEntity(ent) end

---[SHARED] Writes a floating point number to the save object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:WriteFloat)
---@param float number The floating point number to write.
function ISave:WriteFloat(float) end

---[SHARED] Writes an integer number to the save object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:WriteInt)
---@param int number The integer number to write.
function ISave:WriteInt(int) end

---[SHARED] Writes a **null terminated** string to the save object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:WriteString)
---@param str string The string to write.
function ISave:WriteString(str) end

---[SHARED] Writes a Vector to the save object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ISave:WriteVector)
---@param vec Vector The vector to write.
function ISave:WriteVector(vec) end
