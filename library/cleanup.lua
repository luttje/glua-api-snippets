---@meta

--- The cleanup library allows you to control what happens to custom entities when the clean-up buttons are pressed in the Utilities tab of the Spawn menu (default Q).
cleanup = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds an entity to a player's cleanup list.
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.Add)
---@param pl Player Who's cleanup list to add the entity to.
---@param type string The type of cleanup.
---@param ent Entity The entity to add to the player's cleanup list.
function cleanup.Add(pl, type, ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by the `gmod_admin_cleanup` console command. Allows admins to clean up the server.
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.CC_AdminCleanup)
---@param pl Player The player that called the console command.
---@param command string The console command that called this function.
---@param args table First and only arg is the cleanup type.
function cleanup.CC_AdminCleanup(pl, command, args) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by the `gmod_cleanup` console command. Allows players to cleanup their own props.
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.CC_Cleanup)
---@param pl Player The player that called the console command.
---@param command string The console command that called this function.
---@param args table First and only argument is the cleanup type.
function cleanup.CC_Cleanup(pl, command, args) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gets the cleanup list.
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.GetList)
function cleanup.GetList() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the table of cleanup types.
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.GetTable)
---@return table # A list of cleanup types.
function cleanup.GetTable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Registers a new cleanup type.
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.Register)
---@param type string Name of type.
function cleanup.Register(type) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Replaces one entity in the cleanup module with another.
---
--- You very likely want to call [undo.ReplaceEntity](https://wiki.facepunch.com/gmod/undo.ReplaceEntity) with the same entities as well.
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.ReplaceEntity)
---@param from Entity Old entity
---@param to Entity New entity. Can be a `NULL` entity to remove the old entity from the cleanup system.
---@return boolean # Whether any action was taken.
function cleanup.ReplaceEntity(from, to) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Repopulates the clients cleanup menu
---
---[View wiki](https://wiki.facepunch.com/gmod/cleanup.UpdateUI)
function cleanup.UpdateUI() end
