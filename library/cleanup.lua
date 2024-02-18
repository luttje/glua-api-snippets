---@meta

--- The cleanup library allows you to control what happens to custom entities when the clean-up buttons are pressed in the Utilities tab of the Spawn menu (default Q).
cleanup = {}

---[SERVER] Adds an entity to a player's cleanup list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.Add)
---@param pl Player Who's cleanup list to add the entity to.
---@param type string The type of cleanup.
---@param ent Entity The entity to add to the player's cleanup list.
function cleanup.Add(pl, type, ent) end

---[SERVER] Called by the `gmod_admin_cleanup` console command. Allows admins to clean up the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.CC_AdminCleanup)
---@param pl Player The player that called the console command.
---@param command string The console command that called this function.
---@param args table First and only arg is the cleanup type.
function cleanup.CC_AdminCleanup(pl, command, args) end

---[SERVER] Called by the `gmod_cleanup` console command. Allows players to cleanup their own props.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.CC_Cleanup)
---@param pl Player The player that called the console command.
---@param command string The console command that called this function.
---@param args table First and only argument is the cleanup type.
function cleanup.CC_Cleanup(pl, command, args) end

---[SERVER] Gets the cleanup list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.GetList)
function cleanup.GetList() end

---[SHARED] Gets the table of cleanup types.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.GetTable)
---@return table # A list of cleanup types.
function cleanup.GetTable() end

---[SHARED] Registers a new cleanup type.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.Register)
---@param type string Name of type.
function cleanup.Register(type) end

---[SERVER] Replaces one entity in the cleanup module with another
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.ReplaceEntity)
---@param from Entity Old entity
---@param to Entity New entity
---@return boolean # Whether any action was taken.
function cleanup.ReplaceEntity(from, to) end

---[CLIENT] Repopulates the clients cleanup menu
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cleanup.UpdateUI)
function cleanup.UpdateUI() end
