---@meta

--- The object used in the [saverestore](https://wiki.facepunch.com/gmod/saverestore), mainly in [saverestore.AddSaveHook](https://wiki.facepunch.com/gmod/saverestore.AddSaveHook).
---
--- It allows you to write blocks directly into the save game files used by Half-Life 2 save system when such save is being saved.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave)
---@class ISave
local ISave = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Ends current data block started with [ISave:StartBlock](https://wiki.facepunch.com/gmod/ISave:StartBlock) and returns to the parent block.
---
--- To avoid all sorts of errors, you **must** end all blocks you start.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:EndBlock)
function ISave:EndBlock() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Starts a new block of data that you can write to inside current block. Blocks **must** be ended with [ISave:EndBlock](https://wiki.facepunch.com/gmod/ISave:EndBlock).
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:StartBlock)
---@param name string Name of the new block. Used for determining which block is which, returned by IRestore:StartBlock during game load.
function ISave:StartBlock(name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes an [Angle](https://wiki.facepunch.com/gmod/Angle) to the save object.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:WriteAngle)
---@param ang Angle The angle to write.
function ISave:WriteAngle(ang) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes a [boolean](https://wiki.facepunch.com/gmod/boolean) to the save object.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:WriteBool)
---@param bool boolean The boolean to write.
function ISave:WriteBool(bool) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes an [Entity](https://wiki.facepunch.com/gmod/Entity) to the save object.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:WriteEntity)
---@param ent Entity The entity to write.
function ISave:WriteEntity(ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes a floating point [number](https://wiki.facepunch.com/gmod/number) to the save object.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:WriteFloat)
---@param float number The floating point number to write.
function ISave:WriteFloat(float) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes an integer [number](https://wiki.facepunch.com/gmod/number) to the save object.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:WriteInt)
---@param int number The integer number to write.
function ISave:WriteInt(int) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes a **null terminated** [string](https://wiki.facepunch.com/gmod/string) to the save object.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:WriteString)
---@param str string The string to write.
function ISave:WriteString(str) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes a [Vector](https://wiki.facepunch.com/gmod/Vector) to the save object.
---
---[View wiki](https://wiki.facepunch.com/gmod/ISave:WriteVector)
---@param vec Vector The vector to write.
function ISave:WriteVector(vec) end
