---@meta

--- The gmsave library provides functions relating to the singleplayer save system in Garry's Mod.
gmsave = {}

---[SERVER] Loads a saved map.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gmsave.LoadMap)
---@param mapData string The JSON encoded string containing all the map data.
---@param ply? Player The player to load positions for.
---@param callback? function A function to be called after all the entities have been placed.
function gmsave.LoadMap(mapData, ply, callback) end

---[SERVER] Sets player position and angles from supplied table
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gmsave.PlayerLoad)
---@param ply Player The player to "load" values for
---@param data table A table containing Origin and Angle keys for position and angles to set.
function gmsave.PlayerLoad(ply, data) end

---[SERVER] Returns a table containing player position and angles. Used by gmsave.SaveMap.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gmsave.PlayerSave)
---@param ply Player The player to "save"
---@return table # A table containing player position ( Origin ) and angles ( Angle )
function gmsave.PlayerSave(ply) end

---[SERVER] Saves the map
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gmsave.SaveMap)
---@param ply Player The player, whose position should be saved for loading the save
---@return string # The encoded to JSON string containing save data
function gmsave.SaveMap(ply) end

---[SERVER] Returns if we should save this entity in a duplication or a map save or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gmsave.ShouldSaveEntity)
---@param ent Entity The entity
---@param t table A table containing classname key with entities classname.
---@return boolean # Should save entity or not
function gmsave.ShouldSaveEntity(ent, t) end
