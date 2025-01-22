---@meta

--- The saverestore library contains functions relating to the singleplayer save system built into the game.
saverestore = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adds a restore/load hook for the Half-Life 2 save system.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.AddRestoreHook)
---@param identifier string The unique identifier for this hook.
---@param callback fun(save: IRestore) The function to be called when an engine save is being loaded.
---
--- Function argument(s):
--- * IRestore `save` - The restore object to be used to read data from save file that is being loaded.
---
--- You can also use those functions to read data:
--- * saverestore.ReadVar
--- * saverestore.ReadTable
--- * saverestore.LoadEntity
function saverestore.AddRestoreHook(identifier, callback) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adds a save hook for the Half-Life 2 save system. You can this to carry data through level transitions in Half-Life 2.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.AddSaveHook)
---@param identifier string The unique identifier for this hook.
---@param callback fun(save: ISave) The function to be called when an engine save is being saved.
---
--- Function argument(s):
--- * ISave `save` - The save object to be used to write data to the save file that is being saved.
---
--- You can also use those functions to save data:
--- * saverestore.WriteVar
--- * saverestore.WriteTable
--- * saverestore.SaveEntity
function saverestore.AddSaveHook(identifier, callback) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Loads [Entity:GetTable](https://wiki.facepunch.com/gmod/Entity:GetTable) from the save game file that is being loaded and merges it with the given entitys [Entity:GetTable](https://wiki.facepunch.com/gmod/Entity:GetTable).
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.LoadEntity)
---@param ent Entity The entity which will receive the loaded values from the save.
---@param save IRestore The restore object to read the Entity:GetTable from.
function saverestore.LoadEntity(ent, save) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by engine when a save is being loaded.
---
--- This handles loading gamemode and calls all of the hooks added with [saverestore.AddRestoreHook](https://wiki.facepunch.com/gmod/saverestore.AddRestoreHook).
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.LoadGlobal)
---@param save IRestore The restore object to read data from the save file with.
function saverestore.LoadGlobal(save) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by the engine just before [saverestore.LoadGlobal](https://wiki.facepunch.com/gmod/saverestore.LoadGlobal) is.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.PreRestore)
function saverestore.PreRestore() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by the engine just before [saverestore.SaveGlobal](https://wiki.facepunch.com/gmod/saverestore.SaveGlobal) is.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.PreSave)
function saverestore.PreSave() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Reads a table from the save game file that is being loaded.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.ReadTable)
---@param save IRestore The restore object to read the table from.
---@return table # The table that has been read, if any
function saverestore.ReadTable(save) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Loads a variable from the save game file that is being loaded.
---
--- Variables will be read in the save order you have saved them.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.ReadVar)
---@param save IRestore The restore object to read variables from.
---@return any # The variable that was read, if any.
function saverestore.ReadVar(save) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Saves entitys [Entity:GetTable](https://wiki.facepunch.com/gmod/Entity:GetTable) to the save game file that is being saved.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.SaveEntity)
---@param ent Entity The entity to save Entity:GetTable of.
---@param save ISave The save object to save Entity:GetTable to.
function saverestore.SaveEntity(ent, save) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by engine when a save is being saved.
---
--- This handles saving gamemode and calls all of the hooks added with [saverestore.AddSaveHook](https://wiki.facepunch.com/gmod/saverestore.AddSaveHook).
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.SaveGlobal)
---@param save ISave The save object to write data into the save file.
function saverestore.SaveGlobal(save) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns how many writable keys are in the given table.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.WritableKeysInTable)
---@param table table The table to test.
---@return number # The number of keys that can be written with saverestore.WriteTable.
function saverestore.WritableKeysInTable(table) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Write a table to a save game file that is being saved.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.WriteTable)
---@param table table The table to write
---@param save ISave The save object to write the table to.
function saverestore.WriteTable(table, save) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes a variable to the save game file that is being saved.
---
---[View wiki](https://wiki.facepunch.com/gmod/saverestore.WriteVar)
---@param value any The value to save.
---
--- It can be one of the following types: number, boolean, string, Entity, Angle, Vector or table.
---@param save ISave The save object to write the variable to.
function saverestore.WriteVar(value, save) end
