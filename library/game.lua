---@meta

--- The game library provides functions to access various features in the game's engine, most of it's functions are related to controlling the map.
game = {}

---[SHARED] Adds a new ammo type to the game.
---
--- You can find a list of default ammo types [here](https://wiki.facepunch.com/gmod/Default_Ammo_Types).
---
--- This function **must** be called on both the client and server in GM:Initialize or you will have unexpected problems.
--- There is a limit of 256 ammo types, including the default ones.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.AddAmmoType)
---@param ammoData table The attributes of the ammo. See the Structures/AmmoData.
function game.AddAmmoType(ammoData) end

---[SHARED] Registers a new decal.
---
--- There's a rather low limit of around 256 for decal materials that may be registered and they are not cleared on map load.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.AddDecal)
---@param decalName string The name of the decal.
---@param materialName string The material to be used for the decal. May also be a list of material names, in which case a random material from that list will be chosen every time the decal is placed.
function game.AddDecal(decalName, materialName) end

---[SHARED] Loads a particle file. Individual particle systems will still need to be precached with Global.PrecacheParticleSystem.
---
--- You will still need to call this function clientside regardless if you create the particle effects serverside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.AddParticles)
---@param particleFileName string The path of the file to add. Must be `(file).pcf`.
function game.AddParticles(particleFileName) end

---[SHARED] Consider using game.GetAmmoTypes and game.GetAmmoData instead.
--- Called by the engine to retrieve the ammo types.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.BuildAmmoTypes)
---@return table # All ammo types registered via game.AddAmmoType, sorted by its name value.
function game.BuildAmmoTypes() end

---[SHARED] If called serverside it will remove **ALL** entities which were not created by the map (not players or weapons held by players).
--- It won't remove Entities who have the enums/EFL Flag set.
---
--- On the client it will remove decals, sounds, gibs, dead NPCs, and entities created via ents.CreateClientProp.
---
--- This function calls GM:PreCleanupMap before cleaning up the map and GM:PostCleanupMap after cleaning up the map.
---
--- Beware of calling this function in hooks that may be called on map clean up (such as ENTITY:StartTouch) to avoid infinite loops.
---
--- Calling this destroys all BASS streams.
---
--- This can crash when removing `_firesmoke` entities. **You can use the example below to workaround this issue.**
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.CleanUpMap)
---@param dontSendToClients? boolean If set to `true`, don't run this functions on all clients.
---@param extraFilters? table Entity classes not to reset during cleanup.
---@param callback? function If set, delays the map cleanup until the end of a server tick, allowing bypassing the entity limit on maps with large amounts of them. The callback function will be called after the map cleanup has been performed.
function game.CleanUpMap(dontSendToClients, extraFilters, callback) end

---[SERVER] Runs a console command.
--- Make sure to add a newline ("\n") at the end of the command.
---
--- If you use data that were received from a client, you should avoid using this function because newline and semicolon (at least) allow the client to run arbitrary commands!
---
--- For safety, you are urged to prefer using Global.RunConsoleCommand in this case.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.ConsoleCommand)
---@param stringCommand string String containing the command and arguments to be ran.
function game.ConsoleCommand(stringCommand) end

---[SHARED] Returns the damage type of given ammo type.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoDamageType)
---@param id number Ammo ID to retrieve the damage type of. Starts from 1.
---@return number # See Enums/DMG
function game.GetAmmoDamageType(id) end

---[SHARED] Returns the Structures/AmmoData for given ID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoData)
---@param id number ID of the ammo type to look up the data for
---@return table # The Structures/AmmoData containing all ammo data
function game.GetAmmoData(id) end

---[SHARED] Returns the ammo bullet force that is applied when an entity is hit by a bullet of given ammo type.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoForce)
---@param id number Ammo ID to retrieve the force of. Starts from 1.
---@return number #
function game.GetAmmoForce(id) end

---[SHARED] Returns the ammo type ID for given ammo type name.
---
--- See game.GetAmmoName for reverse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoID)
---@param name string Name of the ammo type to look up ID of
---@return number # The ammo type ID of given ammo type name, or -1 if not found
function game.GetAmmoID(name) end

---[SHARED] Returns the real maximum amount of ammo of given ammo ID, regardless of the setting of `gmod_maxammo` convar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoMax)
---@param id number Ammo type ID
---@return number # The maximum amount of reserve ammo a player can hold of this ammo type.
function game.GetAmmoMax(id) end

---[SHARED] Returns the ammo name for given ammo type ID.
---
--- See game.GetAmmoID for reverse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoName)
---@param id number Ammo ID to retrieve the name of. Starts from 1.
---@return string # The name of given ammo type ID or nil if ammo type ID is invalid.
function game.GetAmmoName(id) end

---[SHARED] Returns the damage given ammo type should do to NPCs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoNPCDamage)
---@param id number Ammo ID to retrieve the damage info of. Starts from 1.
---@return number #
function game.GetAmmoNPCDamage(id) end

---[SHARED] Returns the damage given ammo type should do to players.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoPlayerDamage)
---@param id number Ammo ID to retrieve the damage info of. Starts from 1.
---@return number #
function game.GetAmmoPlayerDamage(id) end

---[SHARED] Returns a list of all ammo types currently registered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetAmmoTypes)
---@return table # A table containing all ammo types. The keys are ammo IDs, the values are the names associated with those IDs.
function game.GetAmmoTypes() end

---[SERVER] Returns the counter of a Global State.
---
--- See Global States for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetGlobalCounter)
---@param name string The name of the Global State to set.
---
--- If the Global State by that name does not exist, it will be created.
---
--- See Global States for a list of default global states.
---@return number # The value of the given Global State, 0 if the global state doesn't exist.
function game.GetGlobalCounter(name) end

---[SERVER] Returns whether a Global State is off, active or dead ( inactive )
---
--- See Global States for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetGlobalState)
---@param name string The name of the Global State to retrieve the state of.
---
--- If the Global State by that name does not exist, **GLOBAL_DEAD** will be returned.
---
--- See Global States for a list of default global states.
---@return number # The state of the Global State. See Enums/GLOBAL
function game.GetGlobalState(name) end

---[SHARED] Returns the public IP address and port of the current server. This will return the IP/port that you are connecting through when ran clientside.
--- Returns "loopback" in singleplayer.
---
--- Returns "0.0.0.0:`port`" on the server when called too early, including in GM:Initialize and GM:InitPostEntity. This bug seems to only happen the first time a server is launched, and will return the correct value after switching maps.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetIPAddress)
---@return string # The IP address and port in the format "x.x.x.x:x"
function game.GetIPAddress() end

---[SHARED AND MENU] Returns the name of the current map, without a file extension.
--- On the menu state, returns "menu".
--- In Multiplayer this does not return the current map in the CLIENT realm before GM:Initialize.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetMap)
---@return string # The name of the current map, without a file extension.
function game.GetMap() end

---[SERVER] Returns the next map that would be loaded according to the file that is set by the mapcyclefile convar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetMapNext)
---@return string # nextMap
function game.GetMapNext() end

---[SERVER] Returns the revision (Not to be confused with [VBSP Version](https://developer.valvesoftware.com/wiki/Source_BSP_File_Format#Versions)) of the current map.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetMapVersion)
---@return number # Revision of the currently loaded map.
function game.GetMapVersion() end

---[SHARED] Returns the difficulty level of the game.
---
--- **TIP:** You can use this function in your scripted NPCs or Nextbots to make them stronger, however, it is a good idea to lock powerful attacks behind the highest difficulty instead of just increasing the health.
---
--- Internally this is tied to the gamerules entity, so you'll have to wait until GM:InitPostEntity is called to return the skill level
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetSkillLevel)
---@return number # The difficulty level, Easy (1), Normal (2), Hard (3).
function game.GetSkillLevel() end

---[SHARED] Returns the time scale set with game.SetTimeScale.
--- 		If you want to get the value of `host_timescale` use
--- 		```lua
--- local timescale = GetConVar( "host_timescale" ):GetFloat()
--- 		```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetTimeScale)
---@return number # The time scale
function game.GetTimeScale() end

---[SHARED] Returns the worldspawn entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.GetWorld)
---@return Entity # The world
function game.GetWorld() end

---[SHARED] Returns true if the server is a dedicated server, false if it is a listen server or a singleplayer game.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.IsDedicated)
---@return boolean # Is the server dedicated or not.
function game.IsDedicated() end

---[SERVER] Kicks a player from the server. This can be ran before the player has spawned.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.KickID)
---@param id string UserID or SteamID of the player to kick.
---@param reason? string Reason to display to the player. This can span across multiple lines.
---
--- This will be shortened to ~512 chars, though this includes the command itself and the player index so will realistically be more around ~498. It is recommended to avoid going near the limit to avoid truncation.
function game.KickID(id, reason) end

---[SERVER] Loads the next map according to the `nextlevel` convar, or from the current `mapcyclefile` set by the respective convar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.LoadNextMap)
function game.LoadNextMap() end

---[SERVER] Returns the map load type of the current map.
---
--- After changing the map with the console command `changelevel`, "newgame" is returned. With `changelevel2` (single player only), "transition" is returned.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.MapLoadType)
---@return string # The load type. Possible values are: "newgame", "loadgame", "transition", "background".
function game.MapLoadType() end

---[SHARED] Returns the maximum amount of players (including bots) that the server can have.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.MaxPlayers)
---@return number # The maximum amount of players
function game.MaxPlayers() end

---[SHARED] Mounts a GMA addon from the disk.
--- Can be used with steamworks.DownloadUGC
---
--- Any error models currently loaded that the mounted addon provides will be reloaded.
---
---
--- Any error materials currently loaded that the mounted addon provides will NOT be reloaded. That means that this cannot be used to fix missing map materials, as the map materials are loaded before you are able to call this.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.MountGMA)
---@param path string Location of the GMA file to mount, retrieved from steamworks.DownloadUGC or relative to the `garrysmod/` directory (ignores mounting). This file does not have to end with the .gma extension, but will be interpreted as a GMA.
---@return boolean # success
---@return table # If successful, a table of files that have been mounted
function game.MountGMA(path) end

---[SHARED] Removes all the clientside ragdolls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.RemoveRagdolls)
function game.RemoveRagdolls() end

---[SERVER] Sets the counter of a Global State.
---
--- See Global States for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.SetGlobalCounter)
---@param name string The name of the Global State to set.
---
--- If the Global State by that name does not exist, it will be created.
---
--- See Global States for a list of default global states.
---@param count number The value to set for that Global State.
function game.SetGlobalCounter(name, count) end

---[SERVER] Sets whether a Global State is off, active or dead ( inactive )
---
--- See Global States for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.SetGlobalState)
---@param name string The name of the Global State to set.
---
--- If the Global State by that name does not exist, it will be created.
---
--- See Global States for a list of default global states.
---@param state number The state of the Global State. See Enums/GLOBAL
function game.SetGlobalState(name, state) end

---[SERVER] Sets the difficulty level of the game, can be retrieved with game.GetSkillLevel.
---
--- This will automatically change whenever the "skill" convar is modified serverside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.SetSkillLevel)
---@param level number The difficulty level, Easy( 1 ), Normal( 2 ), Hard( 3 ).
function game.SetSkillLevel(level) end

---[SERVER] Sets the time scale of the game.
---
--- This function is supposed to remove the need of using the host_timescale convar, which is cheat protected.
---
--- To slow down or speed up the movement of a specific player, use Player:SetLaggedMovementValue instead.
---
---
--- 	Like host_timescale, this method does not affect sounds, if you wish to change that, look into GM:EntityEmitSound.
--- 	The true timescale will be `host_timescale` multiplied by game.GetTimeScale
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.SetTimeScale)
---@param timeScale number The new timescale, minimum value is 0.001 and maximum is 5.
function game.SetTimeScale(timeScale) end

---[SHARED] Returns whether the current session is a single player game.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.SinglePlayer)
---@return boolean # isSinglePlayer
function game.SinglePlayer() end

---[SHARED] Returns position the player should start from, this is not the same thing as spawn points, it is used to properly transit the player between maps.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/game.StartSpot)
---@return Vector # startSpot
function game.StartSpot() end
