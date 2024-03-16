---@meta

--- This is a list of all methods only available for players. It is also possible to call Entity functions on the Player.
---@class Player : Entity
local Player = {}

--- The player library is used to get the Lua objects that represent players in-game.
player = {}

---
--- Represents a player class.
---
--- The player class hooks have one special field:
--- * Player **Player** - The player for which a hook is called.
---
--- These hooks are used in player_manager this can't be hook.Add
---
---
---@class PLAYER
PLAYER = {}

---[SERVER] Similar to the serverside command "bot", this function creates a new Player bot with the given name. This bot will not obey to the usual "bot_*" commands, and it's the same bot base used in TF2 and CS:S.
---
--- The best way to control the behaviour of a Player bot right now is to use the GM:StartCommand hook and modify its input serverside.
---
--- Despite this Player being fake, it has to be removed from the server by using Player:Kick and **NOT** Entity:Remove.
--- Also keep in mind that these bots still use player slots, so you won't be able to spawn them in singleplayer!
---
--- Any Bot created using this method will be considered UnAuthed by Garry's Mod
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.CreateNextBot)
---@param botName string The name of the bot, using an already existing name will append brackets at the end of it with a number pertaining it.
---
--- Example: "Bot name test", "Bot name test(1)".
---@return Player # The newly created Player bot. Returns NULL if there's no Player slots available to host it.
function player.CreateNextBot(botName) end

---[SHARED] Gets all the current players in the server (not including connecting clients).
---
--- This function returns bots as well as human players. See player.GetBots and  player.GetHumans.
---
--- This function returns a sequential table, meaning it should be looped with Global.ipairs instead of Global.pairs for efficiency reasons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetAll)
---@return table # All Players currently in the server.
function player.GetAll() end

---[SHARED] Returns a table of all bots on the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetBots)
---@return table # A table only containing bots ( AI / non human players )
function player.GetBots() end

---[SHARED] Tried to get the player with the specified Player:AccountID.
--- 	Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetByAccountID)
---@param accountID number The Player:AccountID to find the player by.
---@return Player # Player if one is found, false otherwise.
function player.GetByAccountID(accountID) end

---[SHARED] Gets the player with the specified connection ID.
---
--- Connection ID can be retrieved via gameevent.Listen events.
---
--- For a function that returns a player based on their Entity:EntIndex, see Global.Entity.
---
---
--- For a function that returns a player based on their Player:UserID, see Global.Player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetByID)
---@param connectionID number The connection ID to find the player by.
---@return Player # Player if one is found, nil otherwise
function player.GetByID(connectionID) end

---[SHARED] Gets the player with the specified SteamID.
--- 	Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetBySteamID)
---@param steamID string The Player:SteamID to find the player by.
---@return Player # Player if one is found, false otherwise.
function player.GetBySteamID(steamID) end

---[SHARED] Gets the player with the specified SteamID64.
--- 	Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetBySteamID64)
---@param steamID64 string The Player:SteamID64 to find the player by.
---@return Player # Player if one is found, false otherwise.
function player.GetBySteamID64(steamID64) end

---[SHARED] Gets the player with the specified uniqueID (not recommended way to identify players).
---
--- It is highly recommended to use player.GetByAccountID, player.GetBySteamID or player.GetBySteamID64 instead as this function can have collisions ( be same for different people ) while SteamID is guaranteed to unique to each player.
--- 	Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetByUniqueID)
---@param uniqueID string The Player:UniqueID to find the player by.
---@return Player # Player if one is found, false otherwise.
---@deprecated Use player.GetBySteamID64, player.GetBySteamID or player.GetByAccountID to get a player by a unique identifier instead.
function player.GetByUniqueID(uniqueID) end

---[SHARED] Gives you the player count.
---
--- Similar to **#**player.GetAll() but with better performance since the player table doesn't have to be generated. If player.GetAll is already being called for iteration, then using the **#** operator on the table will be faster than calling this function since it is JITted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetCount)
---@return number # Number of players
function player.GetCount() end

---[SHARED] Returns a table containing all human players (non-bot/AI).
---
--- Unlike player.GetAll, this does not include bots.
--- This function returns a sequential table, meaning it should be looped with Global.ipairs instead of Global.pairs for efficiency reasons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.GetHumans)
---@return table # A table containing all human (non-bot/AI) players.
function player.GetHumans() end

---[SHARED] Returns a [Stateless Iterator](https://www.lua.org/pil/7.3.html) for all players on the server.
--- 		Intended for use in [Generic For Loops](https://www.lua.org/pil/4.3.5.html).
--- 		See ents.Iterator for a similar function for all entities.
---
--- 		Internally, this function uses cached values that exist entirely within lua, as opposed to player.GetAll, which is a C++ function.
--- 		Because switching from lua to C++ (and vice versa) incurs a performance cost, this function will be somewhat more efficient than player.GetAll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/player.Iterator)
---@return function # The Iterator Function from Global.ipairs
---@return table # Table of all existing Player.  This is a cached copy of player.GetAll
---@return number #  			The starting index for the table of players.   			This is always `0` and is returned for the benefit of [Generic For Loops](https://www.lua.org/pil/4.3.5.html)
function player.Iterator() end

---[SHARED] Returns the player's AccountID part of their full SteamID.
---
--- Since this does not include other vital parts of the SteamID such as "Account Type" and "Account Instance", it should be avoided, as AccountIDs are finite, and can theoretically be the same for multiple valid accounts.
---
--- See Player:SteamID for the text representation of the full SteamID.
--- See Player:SteamID64 for a 64bit representation of the full SteamID.
---
--- In a `-multirun` environment, this will return `-1` for all "copies" of a player because they are not authenticated with Steam.
---
--- For bots this will return values starting with `0` for the first bot, `1` for the second bot and so on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AccountID)
---@return number # The AccountID of Player's SteamID.
function Player:AccountID() end

---[SHARED] This function is only available in Sandbox and its derivatives.Adds an entity to the player's clean up list. This uses cleanup.Add internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AddCleanup)
---@param type string The Cleanup type for this Entity.
---@param ent Entity The Entity to add.
function Player:AddCleanup(type, ent) end

---[SHARED] This function is only available in Sandbox and its derivatives.Adds an entity to the player's list of entities of the same type. See Player:GetCount to get the current count of entities of an entity type added with this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AddCount)
---@param str string The type of this Entity.
---@param ent Entity The Entity you want to add to the list.
function Player:AddCount(str, ent) end

---[SERVER] Adds the provided amount to the player's death count.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AddDeaths)
---@param count number The amount to add to the death count.
function Player:AddDeaths(count) end

---[SERVER] Adds the provided amount to the player's frag/kill count.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AddFrags)
---@param count number The amount to add.
function Player:AddFrags(count) end

---[SERVER] Adds an entity to the player's list of frozen objects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AddFrozenPhysicsObject)
---@param ent Entity The Entity to add.
---@param physobj PhysObj The physics object of the Entity.
function Player:AddFrozenPhysicsObject(ent, physobj) end

---[CLIENT] Sets up the voting system for the player.
--- This is a really barebone system. By calling this a vote gets started, when the player presses 0-9 the callback function gets called along with the key the player pressed. Use the draw callback to draw the vote panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AddPlayerOption)
---@param name string Name of the vote
---@param timeout number Time until the vote expires
---@param vote_callback function The function to be run when the player presses 0-9 while a vote is active.
---@param draw_callback function Used to draw the vote panel.
function Player:AddPlayerOption(name, timeout, vote_callback, draw_callback) end

---[SHARED] Plays a sequence directly from a sequence number, similar to Player:AnimRestartGesture. This function has the advantage to play sequences that haven't been bound to an existing Enums/ACT
--- This is not automatically networked. This function has to be called on the client to be seen by said client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AddVCDSequenceToGestureSlot)
---@param slot number Gesture slot using Enums/GESTURE_SLOT
---@param sequenceId number The sequence ID to play, can be retrieved with Entity:LookupSequence.
---@param cycle number The cycle to start the animation at, ranges from 0 to 1.
---@param autokill? boolean If the animation should not loop. true = stops the animation, false = the animation keeps playing.
function Player:AddVCDSequenceToGestureSlot(slot, sequenceId, cycle, autokill) end

---[SHARED] Checks if the player is alive.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Alive)
---@return boolean # Whether the player is alive
function Player:Alive() end

---[SHARED] Sets if the player can toggle their flashlight. Function exists on both the server and client but has no effect when ran on the client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AllowFlashlight)
---@param canFlashlight boolean True allows flashlight toggling
function Player:AllowFlashlight(canFlashlight) end

---[SERVER] Lets the player spray their decal without delay
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AllowImmediateDecalPainting)
---@param allow boolean Allow or disallow
function Player:AllowImmediateDecalPainting(allow) end

---[SHARED] Resets player gesture in selected slot.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AnimResetGestureSlot)
---@param slot number Slot to reset. See the Enums/GESTURE_SLOT.
function Player:AnimResetGestureSlot(slot) end

---[SHARED] Restart a gesture on a player, within a gesture slot.
---
--- This is not automatically networked. This function has to be called on the client to be seen by said client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AnimRestartGesture)
---@param slot number Gesture slot using Enums/GESTURE_SLOT
---@param activity number The activity ( see Enums/ACT ) or sequence that should be played
---@param autokill? boolean Whether the animation should be automatically stopped. true = stops the animation, false = the animation keeps playing/looping
function Player:AnimRestartGesture(slot, activity, autokill) end

---[SHARED] Restarts the main animation on the player, has the same effect as calling Entity:SetCycle( 0 ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AnimRestartMainSequence)
function Player:AnimRestartMainSequence() end

---[SHARED] Sets the sequence of the animation playing in the given gesture slot.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AnimSetGestureSequence)
---@param slot number The gesture slot. See Enums/GESTURE_SLOT
---@param sequenceID number Sequence ID to set.
function Player:AnimSetGestureSequence(slot, sequenceID) end

---[SHARED] Sets the weight of the animation playing in the given gesture slot.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:AnimSetGestureWeight)
---@param slot number The gesture slot. See Enums/GESTURE_SLOT
---@param weight number The weight this slot should be set to. Value must be ranging from 0 to 1.
function Player:AnimSetGestureWeight(slot, weight) end

---[SHARED] Returns the player's armor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Armor)
---@return number # The player's armor.
function Player:Armor() end

---[SERVER] Bans the player from the server for a certain amount of minutes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Ban)
---@param minutes number Duration of the ban in minutes (0 is permanent)
---@param kick? boolean Whether to kick the player after banning them or not
function Player:Ban(minutes, kick) end

---[SHARED] Returns true if the player's flashlight hasn't been disabled by Player:AllowFlashlight.
---
--- This is not synchronized between clients and server automatically!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:CanUseFlashlight)
---@return boolean # Whether the player can use flashlight.
function Player:CanUseFlashlight() end

---[SHARED] Prints a string to the chatbox of the client.
---
--- Just like the usermessage, this function is affected by the 255 byte limit!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ChatPrint)
---@param message string String to be printed
function Player:ChatPrint(message) end

---[SHARED] Checks if the limit of an entity type added by Player:AddCount is hit or not. If it's hit, it will call the GM:PlayerCheckLimit hook, and call Player:LimitHit if the hook doesn't return `false`.
---
--- This will always return `true` in singleplayer, as singleplayer does not have limits.
---
--- This function is only available in Sandbox and its derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:CheckLimit)
---@param str string The entity type to check the limit for. Default types:
--- * "props"
--- * "ragdolls"
--- * "vehicles"
--- * "effects"
--- * "balloons"
--- * "cameras"
--- * "npcs"
--- * "sents"
--- * "dynamite"
--- * "lamps"
--- * "lights"
--- * "wheels"
--- * "thrusters"
--- * "hoverballs"
--- * "buttons"
--- * "emitters"
---@return boolean # Returns `true` if the limit of this type is not hit, `false` otherwise.
function Player:CheckLimit(str) end

---[SHARED] Called when the player's class was changed from this class.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:ClassChanged)
function PLAYER:ClassChanged() end

---[SHARED] Runs the concommand on the player. This does not work on bots. If used clientside, always runs the command on the local player.
---
--- If you wish to directly modify the movement input of bots, use GM:StartCommand instead.
---
--- Some commands/convars are blocked from being ran/changed using this function, usually to prevent harm/annoyance to clients. For a list of blocked commands, see Blocked ConCommands.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ConCommand)
---@param command string command to run
function Player:ConCommand(command) end

---[SERVER] Creates the player's death ragdoll entity and deletes the old one.
---
--- This is normally used when a player dies, to create their death ragdoll.
---
--- The ragdoll will be created with the player's properties such as Entity:GetPos, Entity:GetAngles, Player:GetPlayerColor, Entity:GetVelocity and Entity:GetModel.
---
--- You can retrieve the entity this creates with Player:GetRagdollEntity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:CreateRagdoll)
function Player:CreateRagdoll() end

---[SERVER] Disables the default player's crosshair. Can be reenabled with Player:CrosshairEnable. This will affect WEAPON:DoDrawCrosshair.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:CrosshairDisable)
function Player:CrosshairDisable() end

---[SERVER] Enables the player's crosshair, if it was previously disabled via Player:CrosshairDisable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:CrosshairEnable)
function Player:CrosshairEnable() end

---[SHARED] Returns whether the player is crouching or not (Enums/FL flag).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Crouching)
---@return boolean # Whether the player is crouching.
function Player:Crouching() end

---[SERVER] Called when the player dies
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:Death)
function PLAYER:Death() end

---[SHARED] Returns the player's death count
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Deaths)
---@return number # The number of deaths the player has had.
function Player:Deaths() end

---[SERVER] Prints the players' name and position to the console.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DebugInfo)
function Player:DebugInfo() end

---[SERVER] Detonates all tripmines belonging to the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DetonateTripmines)
function Player:DetonateTripmines() end

---[SERVER] Disables world clicking for given player. See Panel:SetWorldClicker and Player:IsWorldClickingDisabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DisableWorldClicking)
---@param disable boolean Whether the world clicking should be disabled.
function Player:DisableWorldClicking(disable) end

---[SHARED] Sends a third person animation event to the player.
---
--- Calls GM:DoAnimationEvent with Enums/PLAYERANIMEVENT as the event, data as the given data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DoAnimationEvent)
---@param data number The data to send.
function Player:DoAnimationEvent(data) end

---[SHARED] Starts the player's attack animation. The attack animation is determined by the weapon's HoldType.
---
--- Similar to other animation event functions, calls GM:DoAnimationEvent with Enums/PLAYERANIMEVENT as the event and no extra data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DoAttackEvent)
function Player:DoAttackEvent() end

---[SHARED] Sends a specified third person animation event to the player.
---
--- Calls GM:DoAnimationEvent with specified arguments.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DoCustomAnimEvent)
---@param event number The event to send. See Enums/PLAYERANIMEVENT.
---@param data number The data to send alongside the event.
function Player:DoCustomAnimEvent(event, data) end

---[SHARED] Sends a third person reload animation event to the player.
---
--- Similar to other animation event functions, calls GM:DoAnimationEvent with Enums/PLAYERANIMEVENT as the event and no extra data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DoReloadEvent)
function Player:DoReloadEvent() end

---[SHARED] Sends a third person secondary fire animation event to the player.
---
--- Similar to other animation event functions, calls GM:DoAnimationEvent with Enums/PLAYERANIMEVENT as the event and no extra data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DoSecondaryAttack)
function Player:DoSecondaryAttack() end

---[SHARED] Show/Hide the player's weapon's viewmodel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DrawViewModel)
---@param draw boolean Should draw
---@param vm? number Which view model to show/hide, 0-2.
function Player:DrawViewModel(draw, vm) end

---[SERVER] Show/Hide the player's weapon's worldmodel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DrawWorldModel)
---@param draw boolean Should draw
function Player:DrawWorldModel(draw) end

---[SERVER] Drops the players' weapon of a specific class.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DropNamedWeapon)
---@param class string The class to drop.
---@param target? Vector If set, launches the weapon at given position. There is a limit to how far it is willing to throw the weapon. Overrides velocity argument.
---@param velocity? Vector If set and previous argument is unset, launches the weapon with given velocity. If the velocity is higher than 400, it will be clamped to 400.
function Player:DropNamedWeapon(class, target, velocity) end

---[SERVER] Drops any object the player is currently holding with either gravitygun or +Use (E key)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DropObject)
function Player:DropObject() end

---[SERVER] Forces the player to drop the specified weapon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:DropWeapon)
---@param weapon? Weapon Weapon to be dropped. If unset, will default to the currently equipped weapon.
---@param target? Vector If set, launches the weapon at given position. There is a limit to how far it is willing to throw the weapon. Overrides velocity argument.
---@param velocity? Vector If set and previous argument is unset, launches the weapon with given velocity. If the velocity is higher than 400, it will be clamped to 400.
function Player:DropWeapon(weapon, target, velocity) end

---[SERVER] Force puts the player into a specified vehicle.
--- This **does not** bypass GM:CanPlayerEnterVehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:EnterVehicle)
---@param vehicle Vehicle Vehicle the player will enter
function Player:EnterVehicle(vehicle) end

---[SERVER] Equips the player with the HEV suit.
---
--- Allows the player to zoom, walk slowly, sprint, pickup armor batteries, use the health and armor stations and also shows the HUD.
--- The player also emits a flatline sound on death, which can be overridden with GM:PlayerDeathSound.
---
--- The player is automatically equipped with the suit on spawn, if you wish to stop that, use Player:RemoveSuit.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:EquipSuit)
function Player:EquipSuit() end

---[SERVER] Forces the player to exit the vehicle if they're in one.
---
--- This function will bypass GM:CanExitVehicle. See also GM:PlayerLeaveVehicle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ExitVehicle)
function Player:ExitVehicle() end

---[CLIENT] Called from GM:FinishMove.
---
--- This hook will not work if the current gamemode overrides GM:FinishMove and does not call this hook.
---
--- This hook is run after the drive.FinishMove has been called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:FinishMove)
---@param mv CMoveData
---@return boolean # Return true to prevent default action
function PLAYER:FinishMove(mv) end

---[SERVER] Enables/Disables the player's flashlight.Player:CanUseFlashlight must be true in order for the player's flashlight to be changed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Flashlight)
---@param isOn boolean Turns the flashlight on/off
function Player:Flashlight(isOn) end

---[SHARED] Returns true if the player's flashlight is on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:FlashlightIsOn)
---@return boolean # Whether the player's flashlight is on.
function Player:FlashlightIsOn() end

---[SHARED] Returns the amount of frags a player has.
---
--- The value will change depending on the player's kill or suicide: +1 for a kill, -1 for a suicide.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Frags)
---@return number # frags
function Player:Frags() end

---[SERVER] Freeze the player. Frozen players cannot move, look around, or attack. Key bindings are still called. Similar to Player:Lock but the player can still take damage.
---
--- Adds or removes the Enums/FL flag from the player.
---
--- Frozen bots will still be able to look around.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Freeze)
---@param frozen? boolean Whether the player should be frozen.
function Player:Freeze(frozen) end

---[SHARED] Returns the player's active weapon.
---
--- If used on a Global.LocalPlayer() and the player is spectating another player with `OBS_MODE_IN_EYE`, the weapon returned will be of the spectated player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetActiveWeapon)
---@return Weapon # The weapon the player currently has equipped or NULL if the player doesn't have an active weapon eg. when they're dead.
function Player:GetActiveWeapon() end

---[SERVER] Returns the player's current activity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetActivity)
---@return number # The player's current activity. See Enums/ACT.
function Player:GetActivity() end

---[SHARED] Returns the direction that the player is aiming.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetAimVector)
---@return Vector # The direction vector of players aim
function Player:GetAimVector() end

---[SHARED] Returns true if the players' model is allowed to rotate around the pitch and roll axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetAllowFullRotation)
---@return boolean # Allowed
function Player:GetAllowFullRotation() end

---[SHARED] Returns whether the player is allowed to use their weapons in a vehicle or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetAllowWeaponsInVehicle)
---@return boolean # Whether the player is allowed to use their weapons in a vehicle or not.
function Player:GetAllowWeaponsInVehicle() end

---[SHARED] Returns a table of all ammo the player has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetAmmo)
---@return table # A table with the following format * number Key - AmmoID to be used with functions like game.GetAmmoName. * number Value - Amount of ammo the player has of this kind.
function Player:GetAmmo() end

---[SHARED] Gets the amount of ammo the player has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetAmmoCount)
---@param ammotype any The ammunition type. Can be either number ammo ID or string ammo name.
---@return number # The amount of ammo player has in reserve.
function Player:GetAmmoCount(ammotype) end

---[SHARED] Gets if the player will be pushed out of nocollided players.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetAvoidPlayers)
---@return boolean # pushed
function Player:GetAvoidPlayers() end

---[SHARED] Returns true if the player is able to walk using the (default) alt key.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetCanWalk)
---@return boolean # AbleToWalk
function Player:GetCanWalk() end

---[SHARED] Determines whenever the player is allowed to use the zoom functionality.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetCanZoom)
---@return boolean # canZoom
function Player:GetCanZoom() end

---[SHARED] Returns the player's class id.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetClassID)
---@return number # The player's class id.
function Player:GetClassID() end

---[SHARED] This function is only available in Sandbox and its derivatives.Gets the total amount of entities of an entity type added by Player:AddCount.
---
--- Default types:
--- ```
--- balloons
--- buttons
--- cameras
--- dynamite
--- emitters
--- hoverballs
--- lamps
--- lights
--- props
--- ragdolls
--- thrusters
--- wheels
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetCount)
---@param type string Type to get entity count of.
---@param minus? number If specified, it will reduce the counter by this value. Works only serverside.
---@return number # The returned count.
function Player:GetCount(type, minus) end

---[SHARED] Returns the crouched walk speed multiplier.
---
--- See also Player:GetWalkSpeed and Player:SetCrouchedWalkSpeed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetCrouchedWalkSpeed)
---@return number # The crouched walk speed multiplier.
function Player:GetCrouchedWalkSpeed() end

---[SHARED] Returns the last command which was sent by the specified player. This can only be called on the player which Global.GetPredictionPlayer() returns.
---
--- When called clientside in singleplayer during WEAPON:Think, it will return nothing as the hook is not technically predicted in that instance. See the note on the page.
---
--- This will fail in GM:StartCommand.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetCurrentCommand)
---@return CUserCmd # Last user commands
function Player:GetCurrentCommand() end

---[SHARED] Gets the **actual** view offset which equals the difference between the players actual position and their view when standing.
---
--- Do not confuse with Player:GetViewOffset and Player:GetViewOffsetDucked
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetCurrentViewOffset)
---@return Vector # The actual view offset.
function Player:GetCurrentViewOffset() end

---[SHARED] Gets the entity the player is currently driving via the drive library.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetDrivingEntity)
---@return Entity # The currently driven entity, or NULL entity
function Player:GetDrivingEntity() end

---[SHARED] Returns driving mode of the player. See Entity Driving.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetDrivingMode)
---@return number # The drive mode ID or 0 if player doesn't use the drive system.
function Player:GetDrivingMode() end

---[SHARED] Returns a player's duck speed (in seconds)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetDuckSpeed)
---@return number # duckspeed
function Player:GetDuckSpeed() end

---[SHARED] Returns the entity the player is currently using, like func_tank mounted turrets or +use prop pickups.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetEntityInUse)
---@return Entity # Entity in use, or NULL entity otherwise. For +use prop pickups, this will be NULL clientside.
function Player:GetEntityInUse() end

---[SHARED] Returns a table with information of what the player is looking at.
---
--- The results of this function are **cached** clientside every frame.
---
--- Uses util.GetPlayerTrace internally and is therefore bound by its limits.
---
--- See also Player:GetEyeTraceNoCursor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetEyeTrace)
---@return table # Trace information, see Structures/TraceResult.
function Player:GetEyeTrace() end

---[SHARED] Returns the trace according to the players view direction, ignoring their mouse (holding C and moving the mouse in Sandbox).
---
--- The results of this function are **cached** clientside every frame.
---
--- Uses util.GetPlayerTrace internally and is therefore bound by its limits.
---
--- See also Player:GetEyeTrace.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetEyeTraceNoCursor)
---@return table # Trace result. See Structures/TraceResult.
function Player:GetEyeTraceNoCursor() end

---[SHARED] Returns the FOV of the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetFOV)
---@return number # Field of view as a float
function Player:GetFOV() end

---[CLIENT] Returns the steam "relationship" towards the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetFriendStatus)
---@return string # Should return one of four different things depending on their status on your friends list: "friend", "blocked", "none" or "requested".
function Player:GetFriendStatus() end

---[SHARED] Gets the hands entity of a player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetHands)
---@return Entity # The hands entity if players has one
function Player:GetHands() end

---[CLIENT] Called on player spawn to determine which hand model to use
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:GetHandsModel)
---@return table # A table containing info about view model hands model to be set. See examples.
function PLAYER:GetHandsModel() end

---[SHARED] Returns the widget the player is hovering with their mouse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetHoveredWidget)
---@return Entity # The hovered widget.
function Player:GetHoveredWidget() end

---[SHARED] Gets the bottom base and the top base size of the player's hull.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetHull)
---@return Vector # Player's hull bottom base size.
---@return Vector # Player's hull top base size.
function Player:GetHull() end

---[SHARED] Gets the bottom base and the top base size of the player's crouch hull.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetHullDuck)
---@return Vector # Player's crouch hull bottom base size.
---@return Vector # Player's crouch hull top base size.
function Player:GetHullDuck() end

---[SHARED] Retrieves the value of a client-side ConVar. The ConVar must have a Enums/FCVAR flag for this to work.
---
--- The returned value is truncated to 31 bytes.
--- On client this function will return value of the local player, regardless of which player the function was called on!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetInfo)
---@param cVarName string The name of the client-side ConVar.
---@return string # The value of the ConVar.
function Player:GetInfo(cVarName) end

---[SHARED] Retrieves the numeric value of a client-side convar, returns nil if value is not convertible to a number. The ConVar must have a Enums/FCVAR flag for this to work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetInfoNum)
---@param cVarName string The name of the ConVar to query the value of
---@param default number Default value if we failed to retrieve the number.
---@return number # The value of the ConVar or the default value
function Player:GetInfoNum(cVarName, default) end

---[SHARED] Returns the jump power of the player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetJumpPower)
---@return number # Jump power
function Player:GetJumpPower() end

---[SHARED] Returns the player's ladder climbing speed.
---
--- See Player:GetWalkSpeed for normal walking speed, Player:GetRunSpeed for sprinting speed and Player:GetSlowWalkSpeed for slow walking speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetLadderClimbSpeed)
---@return number # The ladder climbing speed.
function Player:GetLadderClimbSpeed() end

---[SHARED] Returns the timescale multiplier of the player movement.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetLaggedMovementValue)
---@return number # The timescale multiplier, defaults to `1`.
function Player:GetLaggedMovementValue() end

---[SHARED] Returns the maximum amount of armor the player should have. Default value is 100.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetMaxArmor)
---@return number # The new max armor value
function Player:GetMaxArmor() end

---[SHARED] Returns the player's maximum movement speed.
---
--- See also Player:SetMaxSpeed, Player:GetWalkSpeed and Player:GetRunSpeed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetMaxSpeed)
---@return number # The maximum movement speed the player can go at.
function Player:GetMaxSpeed() end

---[SHARED] Returns the player's name, this is an alias of Player:Nick.
---
--- This function overrides Entity:GetName (in the Lua metatable, not in c++), keep it in mind when dealing with ents.FindByName or any engine function which requires the mapping name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetName)
---@return string # The player's name.
function Player:GetName() end

---[SHARED] Returns whenever the player is set not to collide with their teammates.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetNoCollideWithTeammates)
---@return boolean # noCollideWithTeammates
function Player:GetNoCollideWithTeammates() end

---[SHARED] Returns the the observer mode of the player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetObserverMode)
---@return number # Observe mode of that player, see Enums/OBS_MODE.
function Player:GetObserverMode() end

---[SHARED] Returns the entity the player is currently observing.
---
--- Set using Player:SpectateEntity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetObserverTarget)
---@return Entity # The entity the player is currently spectating, or Global_Variables if the player has no target.
function Player:GetObserverTarget() end

---[SHARED] Returns a **P**ersistent **Data** key-value pair from the SQL database. (`sv.db` when called on server, `cl.db` when called on client)
---
--- Internally uses the sql library. See util.GetPData for cases when the player is not currently on the server.
---
--- This function internally uses Player:SteamID64, it previously utilized Player:UniqueID which can cause collisions (two or more players sharing the same PData entry). Player:SetPData now replaces all instances of Player:UniqueID with Player:SteamID64 when running Player:SetPData
---
--- PData is not networked from servers to clients!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetPData)
---@param key string Name of the PData key
---@param default? any Default value if PData key doesn't exist.
---@return string # The data in the SQL database or the default value given.
function Player:GetPData(key, default) end

---[SHARED] Returns a player model's color. The part of the model that is colored is determined by the model itself, and is different for each model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetPlayerColor)
---@return Vector # The format is `Vector(r,g,b)`, and each color component should be between 0 and 1.
function Player:GetPlayerColor() end

---[SHARED] Returns a table containing player information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetPlayerInfo)
---@return table # A table containing player information.
function Player:GetPlayerInfo() end

---[SERVER] Returns the preferred carry angles of an object, if any are set.
---
--- Calls GM:GetPreferredCarryAngles with the target entity and returns the carry angles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetPreferredCarryAngles)
---@param carryEnt Entity Entity to retrieve the carry angles of.
---@return Angle # Carry angles or nil if the entity has no preferred carry angles.
function Player:GetPreferredCarryAngles(carryEnt) end

---[SHARED] Returns the widget entity the player is using.
---
--- Having a pressed widget stops the player from firing their weapon to allow input to be passed onto the widget.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetPressedWidget)
---@return Entity # The pressed widget.
function Player:GetPressedWidget() end

---[SHARED] Returns the weapon the player previously had equipped.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetPreviousWeapon)
---@return Entity # The previous weapon of the player.  This is not guaranteed to be a weapon entity so it should be checked with Entity:IsWeapon for safety.
function Player:GetPreviousWeapon() end

---[SHARED] Returns players screen punch effect angle. See Player:ViewPunch and Player:SetViewPunchAngles
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetPunchAngle)
---@return Angle # The punch angle
---@deprecated You should use Player:GetViewPunchAngles instead.
function Player:GetPunchAngle() end

---[SHARED] Returns players death ragdoll. The ragdoll is created by Player:CreateRagdoll.
--- Calling Entity:GetPos server-side with this function then will return the position when Player:CreateRagdoll was used.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetRagdollEntity)
---@return Entity # The ragdoll.  Unlike normal clientside ragdolls (`C_ClientRagdoll`), this will be a `C_HL2MPRagdoll` on the client, and `hl2mp_ragdoll` on the server.
function Player:GetRagdollEntity() end

---[SHARED] Returns the render angles for the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetRenderAngles)
---@return Angle # The render angles of the player. Only **yaw** part of the angle seems to be present.
function Player:GetRenderAngles() end

---[SHARED] Returns the player's sprint speed.
---
--- See also Player:SetRunSpeed, Player:GetWalkSpeed and Player:GetMaxSpeed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetRunSpeed)
---@return number # The sprint speed
function Player:GetRunSpeed() end

---[SHARED] Returns the position of a Player's view
---
--- This is the same as calling Entity:EyePos on the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetShootPos)
---@return Vector # The position of the player's view.
function Player:GetShootPos() end

---[SHARED] Returns the player's slow walking speed, which is activated via +WALK keybind.
---
--- See Player:GetWalkSpeed for normal walking speed, Player:GetRunSpeed for sprinting speed and Player:GetLadderClimbSpeed for ladder climb speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetSlowWalkSpeed)
---@return number # The new slow walking speed.
function Player:GetSlowWalkSpeed() end

---[SHARED] Returns the maximum height player can step onto.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetStepSize)
---@return number # The maximum height player can get up onto without jumping, in hammer units.
function Player:GetStepSize() end

---[SHARED] Returns the player's HEV suit power.
---
--- This will only work for the local player when used clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetSuitPower)
---@return number # The current suit power.
function Player:GetSuitPower() end

---[SERVER] Returns the number of seconds that the player has been timing out for. You can check if a player is timing out with Player:IsTimingOut.
---
--- This function is relatively useless because it is tied to the value of the `sv_timeout` ConVar, which is irrelevant to the description above. [This is not considered as a bug](https://discord.com/channels/565105920414318602/567617926991970306/748970396224585738).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetTimeoutSeconds)
---@return number # Timeout seconds.
function Player:GetTimeoutSeconds() end

---[SHARED] Returns Structures/TOOL table of players current tool, or of the one specified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetTool)
---@param mode? string Classname of the tool to retrieve. ( Filename of the tool in gmod_tool/stools/ )
---@return table # TOOL table, or nil if the table wasn't found or the player doesn't have a tool gun.
function Player:GetTool(mode) end

---[SHARED] Returns a player's unduck speed (in seconds)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetUnDuckSpeed)
---@return number # unduck speed
function Player:GetUnDuckSpeed() end

---[SHARED] Returns the entity the player would use if they would press their `+use` keybind.
--- 	Because entity physics objects usually do not exist on the client, the client's use entity will resolve to whatever the crosshair is placed on within a little less than 72 units of the player's eye position. This differs from the entity returned by the server, which has fully physical use checking. See util.TraceHull.
---
--- Issue tracker: [5027](https://github.com/Facepunch/garrysmod-issues/issues/5027)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetUseEntity)
---@return Entity # The entity that would be used or NULL.
function Player:GetUseEntity() end

---[SHARED] Returns the player's user group. By default, player user groups are loaded from `garrysmod/settings/users.txt`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetUserGroup)
---@return string # The user group of the player. This will return "user" if player has no user group.
function Player:GetUserGroup() end

---[SHARED] Gets the vehicle the player is driving, returns NULL ENTITY if the player is not driving.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetVehicle)
---@return Vehicle # vehicle
function Player:GetVehicle() end

---[SHARED] Returns the entity the player is using to see from (such as the player itself, the camera, or another entity).
--- 	This function will return a [NULL Entity] until Player:SetViewEntity has been used
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetViewEntity)
---@return Entity # The entity the player is using to see from
function Player:GetViewEntity() end

---[SHARED] Returns the player's view model entity by the index.
--- Each player has 3 view models by default, but only the first one is used.
---
--- To use the other viewmodels in your SWEP, see Entity:SetWeaponModel.
---
--- In the Client States, other players' viewmodels are not available unless they are being spectated.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetViewModel)
---@param index? number optional index of the view model to return, can range from 0 to 2
---@return Entity # The view model entity
function Player:GetViewModel(index) end

---[SHARED] Returns the view offset of the player which equals the difference between the players actual position and their view.
---
--- See also Player:GetViewOffsetDucked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetViewOffset)
---@return Vector # New view offset, must be local vector to players Entity:GetPos
function Player:GetViewOffset() end

---[SHARED] Returns the view offset of the player which equals the difference between the players actual position and their view when ducked.
---
--- See also Player:GetViewOffset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetViewOffsetDucked)
---@return Vector # New crouching view offset, must be local vector to players Entity:GetPos
function Player:GetViewOffsetDucked() end

---[SHARED] Returns players screen punch effect angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetViewPunchAngles)
---@return Angle # The punch angle
function Player:GetViewPunchAngles() end

---[SHARED] Returns client's view punch velocity. See Player:ViewPunch and Player:SetViewPunchVelocity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetViewPunchVelocity)
---@return Angle # The current view punch angle velocity.
function Player:GetViewPunchVelocity() end

---[CLIENT] Returns the current voice volume scale for given player on client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetVoiceVolumeScale)
---@return number # The voice volume scale, where 0 is 0% and 1 is 100%.
function Player:GetVoiceVolumeScale() end

---[SHARED] Returns the player's normal walking speed. Not sprinting, not slow walking. (+walk)
---
--- See also Player:SetWalkSpeed, Player:GetMaxSpeed and Player:GetRunSpeed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed)
---@return number # The normal walking speed.
function Player:GetWalkSpeed() end

---[SHARED] Returns the weapon for the specified class
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetWeapon)
---@param className string Class name of weapon
---@return Weapon # The weapon for the specified class.
function Player:GetWeapon(className) end

---[SHARED] Returns a player's weapon color. The part of the model that is colored is determined by the model itself, and is different for each model. The format is Vector(r,g,b), and each color should be between 0 and 1.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetWeaponColor)
---@return Vector # color
function Player:GetWeaponColor() end

---[SHARED] Returns a table of the player's weapons.
---
--- 			This function returns a sequential table, meaning it should be looped with Global.ipairs instead of Global.pairs for efficiency reasons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GetWeapons)
---@return table # All the weapons the player currently has.
function Player:GetWeapons() end

---[SERVER] Gives the player a weapon.
---
--- While this function is meant for weapons/pickupables only, it is **not** restricted to weapons. Any entity can be spawned using this function, including NPCs and SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Give)
---@param weaponClassName string Class name of weapon to give the player
---@param bNoAmmo? boolean Set to true to not give any ammo on weapon spawn. (Reserve ammo set by DefaultClip)
---@return Weapon # The weapon given to the player, if one was given. It will return NULL if the player already has the weapon, or the weapon entity (entity with given classname) doesn't exist.
function Player:Give(weaponClassName, bNoAmmo) end

---[SERVER] Gives ammo to a player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GiveAmmo)
---@param amount number Amount of ammo
---@param type any Type of ammo.
--- This is a string for named ammo types, and a number for ammo ID.
---
--- You can find a list of default ammo types Default_Ammo_Types.
---@param hidePopup? boolean Hide display popup when giving the ammo
---@return number # Ammo given.
function Player:GiveAmmo(amount, type, hidePopup) end

---[SERVER] Disables god mode on the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GodDisable)
function Player:GodDisable() end

---[SERVER] Enables god mode on the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:GodEnable)
function Player:GodEnable() end

---[SHARED] Returns whether the player has god mode or not, contolled by Player:GodEnable and Player:GodDisable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:HasGodMode)
---@return boolean # Whether the player has god mode or not.
function Player:HasGodMode() end

---[SHARED] Returns if the player has the specified weapon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:HasWeapon)
---@param className string Class name of the weapon
---@return boolean # True if the player has the weapon
function Player:HasWeapon(className) end

---[SHARED] Called when the class object is created
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:Init)
function PLAYER:Init() end

---[SHARED] Returns if the player is in a vehicle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:InVehicle)
---@return boolean # Whether the player is in a vehicle.
function Player:InVehicle() end

---[SERVER] Returns the player's IP address and connection port in ip:port form
--- Returns `Error!` for bots.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IPAddress)
---@return string # The player's IP address and connection port
function Player:IPAddress() end

---[SHARED] Returns whether the player is an admin or not. It will also return `true` if the player is Player:IsSuperAdmin by default.
---
--- Internally this is determined by Player:IsUserGroup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsAdmin)
---@return boolean # True if the player is an admin or a super admin.
function Player:IsAdmin() end

---[SHARED] Returns if the player is an bot or not
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsBot)
---@return boolean # True if the player is a bot.
function Player:IsBot() end

---[SERVER] Returns true from the point when the player is sending client info but not fully in the game until they disconnect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsConnected)
---@return boolean # isConnected
function Player:IsConnected() end

---[SHARED] Used to find out if a player is currently 'driving' an entity (by which we mean 'right click > drive' ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsDrivingEntity)
---@return boolean # A value representing whether or not the player is 'driving' an entity.
function Player:IsDrivingEntity() end

---[SHARED] Returns whether the players movement is currently frozen, controlled by Player:Freeze.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsFrozen)
---@return boolean # Whether the players movement is currently frozen or not.
function Player:IsFrozen() end

---[SERVER] Returns whether the player identity was confirmed by the steam network.
---
--- See also GM:PlayerAuthed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsFullyAuthenticated)
---@return boolean # Whether the player has been fully authenticated or not.  This will always be true for singleplayer and the listen server host. This will always be false for bots.
function Player:IsFullyAuthenticated() end

---[SHARED] Returns if a player is the host of the current session.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsListenServerHost)
---@return boolean # `true` if the player is the listen server host, `false` otherwise.  This will always be `true` in single player, and `false` on a dedicated server.
function Player:IsListenServerHost() end

---[CLIENT] Returns whether or not the player is muted locally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsMuted)
---@return boolean # whether or not the player is muted locally.
function Player:IsMuted() end

---[SHARED] Returns true if the player is playing a taunt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsPlayingTaunt)
---@return boolean # Whether the player is playing a taunt.
function Player:IsPlayingTaunt() end

---[SHARED] Returns whenever the player is heard by the local player clientside, or if the player is speaking serverside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsSpeaking)
---@return boolean # Is the player speaking or not.
function Player:IsSpeaking() end

---[SHARED] Returns whether the player is currently sprinting or not, specifically if they are holding their sprint key and are allowed to sprint.
---
--- This will not check if the player is currently sprinting into a wall. (i.e. holding their sprint key but not moving)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsSprinting)
---@return boolean # Is the player sprinting or not
function Player:IsSprinting() end

---[SHARED] Returns whenever the player is equipped with the suit item.
---
--- This will only work for the local player when used clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsSuitEquipped)
---@return boolean # Is the suit equipped or not.
function Player:IsSuitEquipped() end

---[SHARED] Returns whether the player is a super admin.
---
--- Internally this is determined by Player:IsUserGroup. See also Player:IsAdmin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsSuperAdmin)
---@return boolean # True if the player is a super admin.
function Player:IsSuperAdmin() end

---[SERVER] Returns `true` if the player is timing out (i.e. is losing connection), `false` otherwise.
---
--- A player is considered timing out when more than 4 seconds has elapsed since a network packet was received from given player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsTimingOut)
---@return boolean # Whether the player is timing out.
function Player:IsTimingOut() end

---[SHARED] Returns whether the player is typing in their chat.
---
--- This may not work properly if the server uses a custom chatbox.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsTyping)
---@return boolean # Whether the player is typing in their chat or not.
function Player:IsTyping() end

---[SHARED] Returns true/false if the player is in specified group or not. See Player:GetUserGroup for a way to get player's usergroup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsUserGroup)
---@param groupname string Group to check the player for.
---@return boolean # isInUserGroup
function Player:IsUserGroup(groupname) end

---[CLIENT] Returns if the player can be heard by the local player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsVoiceAudible)
---@return boolean # isAudible
function Player:IsVoiceAudible() end

---[SHARED] Returns if the player currently walking. (`+walk` keybind)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsWalking)
---@return boolean # True if the player is currently walking.
function Player:IsWalking() end

---[SHARED] Returns whether the player is using the world clicking feature, see Panel:SetWorldClicker
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsWorldClicking)
---@return boolean # Is the player world clicking or not.
function Player:IsWorldClicking() end

---[SHARED] Returns whether the world clicking is disabled for given player or not. See Player:DisableWorldClicking.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:IsWorldClickingDisabled)
---@return boolean # Whether the world clicking is disabled or not.
function Player:IsWorldClickingDisabled() end

---[SHARED] Returns whether a key is down. This is not networked to other players, meaning only the local client can see the keys they are pressing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:KeyDown)
---@param key number The key, see Enums/IN
---@return boolean # whether the key is down or not.
function Player:KeyDown(key) end

---[SHARED] Gets whether a key was down one tick ago.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:KeyDownLast)
---@param key number The key, see Enums/IN
---@return boolean # Is key down ?
function Player:KeyDownLast(key) end

---[SHARED] Gets whether a key was just pressed this tick.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:KeyPressed)
---@param key number Corresponds to an Enums/IN
---@return boolean # Was pressed or not
function Player:KeyPressed(key) end

---[SHARED] Gets whether a key was just released this tick.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:KeyReleased)
---@param key number The key, see Enums/IN
---@return boolean # Was released or not
function Player:KeyReleased(key) end

---[SERVER] Kicks the player from the server.
--- This can not be run before the player has fully joined in. Use game.KickID for that.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Kick)
---@param reason? string Reason to show for disconnection.
---
--- This will be shortened to ~512 chars, though this includes the command itself and the player index so will realistically be more around ~498. It is recommended to avoid going near the limit to avoid truncation.
function Player:Kick(reason) end

---[SERVER] Kills a player and calls GM:PlayerDeath.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Kill)
function Player:Kill() end

---[SERVER] Kills a player without notifying the rest of the server.
---
--- This will call GM:PlayerSilentDeath instead of GM:PlayerDeath.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:KillSilent)
function Player:KillSilent() end

---[SHARED] This allows the server to mitigate the lag of the player by moving back all the entities that can be lag compensated to the time the player attacked with his weapon.
---
--- This technique is most commonly used on things that hit other entities instantaneously, such as traces.
---
--- Entity:FireBullets calls this function internally.
---
--- Lag compensation only works for players and entities that have been enabled with Entity:SetLagCompensated
---
--- Despite being defined shared, it can only be used server-side in a ~search:%3Cpredicted%3EYes.
---
--- This function NEEDS to be disabled after you're done with it or it will break the movement of the entities affected!
---
--- Lag compensation does not support pose parameters.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:LagCompensation)
---@param lagCompensation boolean The state of the lag compensation, true to enable and false to disable.
function Player:LagCompensation(lagCompensation) end

---[SERVER] Returns the hitgroup where the player was last hit.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:LastHitGroup)
---@return number # Hitgroup, see Enums/HITGROUP
function Player:LastHitGroup() end

---[SHARED] Shows "limit hit" notification in sandbox.
--- This function is only available in Sandbox and its derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:LimitHit)
---@param type string Type of hit limit.
function Player:LimitHit(type) end

---[SERVER] Called on spawn to give the player their default loadout
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:Loadout)
function PLAYER:Loadout() end

---[SHARED] Returns the direction a player is looking as a entity/local-oriented angle.
---
--- Unlike Entity:EyeAngles, this function does not include angles of the Player's Entity:GetParent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:LocalEyeAngles)
---@return Angle # local eye angles
function Player:LocalEyeAngles() end

---[SERVER] Stops a player from using any inputs, such as moving, turning, or attacking. Key binds are still called. Similar to Player:Freeze but the player takes no damage.
---
--- Adds the Enums/FL and Enums/FL flags to the player.
---
--- Frozen bots will still be able to look around.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Lock)
function Player:Lock() end

---[SHARED] Returns the position of a Kinect bone.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:MotionSensorPos)
---@param bone number Bone to get the position of. Must be from 0 to 19.
---@return Vector # Position of the bone.
function Player:MotionSensorPos(bone) end

---[CLIENT] Called from GM:Move.
---
--- This hook will not work if the current gamemode overrides GM:Move and does not call this hook.
---
--- This hook is run after the drive.Move has been called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:Move)
---@param mv CMoveData Movement information
---@return boolean # Return true to prevent default action
function PLAYER:Move(mv) end

---[SHARED] Returns the players name. Identical to Player:Nick and Player:GetName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Name)
---@return string # Player's Steam name.
function Player:Name() end

---[SHARED] Returns the player's nickname.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Nick)
---@return string # Player's Steam name
function Player:Nick() end

---[SERVER] Returns the 64-bit SteamID aka CommunityID of the Steam Account that owns the Garry's Mod license this player is using. This is useful for detecting players using Steam Family Sharing.
---
--- If player is not using Steam Family Sharing, this will return the player's actual SteamID64().
---
--- This data will only be available after the player has fully authenticated with Steam. See Player:IsFullyAuthenticated.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:OwnerSteamID64)
---@return string # The 64bit SteamID
function Player:OwnerSteamID64() end

---[SHARED] Returns the packet loss of the client. It is not networked so it only returns 0 when run clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:PacketLoss)
---@return number # Packets lost
function Player:PacketLoss() end

---[SHARED] Unfreezes the props player is looking at. This is essentially the same as pressing reload with the physics gun, including double press for unfreeze all.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:PhysgunUnfreeze)
---@return number # Number of props unfrozen.
function Player:PhysgunUnfreeze() end

---[SERVER] This makes the player hold ( same as pressing E on a small prop ) the provided entity.
---
--- Don't get this confused with picking up items like ammo or health kits
---
--- This picks up the passed entity regardless of its mass or distance from the player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:PickupObject)
---@param entity Entity Entity to pick up.
function Player:PickupObject(entity) end

---[SERVER] Forces the player to pickup an existing weapon entity. The player will not pick up the weapon if they already own a weapon of given type, or if the player could not normally have this weapon in their inventory.
---
--- This function **will** bypass GM:PlayerCanPickupWeapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:PickupWeapon)
---@param wep Weapon The weapon to try to pick up.
---@param ammoOnly? boolean If set to true, the player will only attempt to pick up the ammo from the weapon. The weapon will not be picked up even if the player doesn't have a weapon of this type, and the weapon will be removed if the player picks up any ammo from it.
---@return boolean # Whether the player succeeded in picking up the weapon or not.
function Player:PickupWeapon(wep, ammoOnly) end

---[SHARED] Returns the player's ping to server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Ping)
---@return number # The player's ping.
function Player:Ping() end

---[SERVER] Plays the correct step sound according to what the player is staying on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:PlayStepSound)
---@param volume number Volume for the sound, in range from 0 to 1
function Player:PlayStepSound(volume) end

---[CLIENT] Called after the viewmodel has been drawn
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:PostDrawViewModel)
---@param viewmodel Entity The viewmodel
---@param weapon Entity The weapon
function PLAYER:PostDrawViewModel(viewmodel, weapon) end

---[CLIENT] Called before the viewmodel is drawn
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:PreDrawViewModel)
---@param viewmodel Entity The viewmodel
---@param weapon Entity The weapon
function PLAYER:PreDrawViewModel(viewmodel, weapon) end

---[SHARED] Displays a message either in their chat, console, or center of the screen. See also Global.PrintMessage.
---
--- When called serverside, this uses the archaic user message system (the umsg) and hence is limited to ≈250 characters.
---
--- `HUD_PRINTCENTER` will not work when this is called clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:PrintMessage)
---@param type number Which type of message should be sent to the player (Enums/HUD).
---@param message string Message to be sent to the player.
function Player:PrintMessage(type, message) end

---[SERVER] Removes all ammo from a certain player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:RemoveAllAmmo)
function Player:RemoveAllAmmo() end

---[SERVER] Removes all weapons and ammo from the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:RemoveAllItems)
function Player:RemoveAllItems() end

---[SHARED] Removes the amount of the specified ammo from the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:RemoveAmmo)
---@param ammoCount number The amount of ammunition to remove.
---@param ammoName string The name of the ammunition to remove from. This can also be a number ammoID.
function Player:RemoveAmmo(ammoCount, ammoName) end

---[SHARED] Removes a **P**ersistent **Data** key-value pair from the SQL database. (`sv.db` when called on server, `cl.db` when called on client)
---
--- Internally uses the sql library. See util.RemovePData for cases when the player is not currently on the server.
---
--- This function internally uses Player:SteamID64, it previously utilized Player:UniqueID which can cause collisions (two or more players sharing the same PData entry). Player:SetPData now replaces all instances of Player:UniqueID with Player:SteamID64 when running Player:SetPData
--- PData is not networked from servers to clients!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:RemovePData)
---@param key string Key to remove
---@return boolean # true is succeeded, false otherwise
function Player:RemovePData(key) end

---[SERVER] Strips the player's suit item.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:RemoveSuit)
function Player:RemoveSuit() end

---[SHARED] Resets both normal and duck hulls to their default values.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ResetHull)
function Player:ResetHull() end

---[SERVER] Forces the player to say whatever the first argument is. Works on bots too.
---
--- This function ignores the default chat message cooldown
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Say)
---@param text string The text to force the player to say.
---@param teamOnly? boolean Whether to send this message to our own team only.
function Player:Say(text, teamOnly) end

---[SHARED] Fades the screen
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ScreenFade)
---@param flags number Fade flags defined with Enums/SCREENFADE.
---@param clr? number The color of the screenfade
---@param fadeTime number Fade(in/out) effect transition time ( From no fade to full fade and vice versa ).
---
--- This is limited to 7 bits integer part and 9 bits fractional part.
---@param fadeHold number Fade effect hold time.
---
--- This is limited to 7 bits integer part and 9 bits fractional part.
function Player:ScreenFade(flags, clr, fadeTime, fadeHold) end

---[SERVER] Sets the active weapon of the player by its class name.
---
--- This will switch the weapon out of prediction, causing delay on the client and WEAPON:Deploy and WEAPON:Holster to be called out of prediction. Try using CUserCmd:SelectWeapon or input.SelectWeapon, instead.
---
--- This will trigger the weapon switch event and associated animations. To switch weapons silently, use Player:SetActiveWeapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SelectWeapon)
---@param className string The class name of the weapon to switch to.
---
--- If the player doesn't have the specified weapon, nothing will happen. You can use Player:Give to give the weapon first.
function Player:SelectWeapon(className) end

---[SERVER] Sends a hint to a player.
---
--- This function is only available in Sandbox and its derivatives. Since this adds `#Hint_` to the beginning of each message, you should only use it with default hint messages, or those cached with language.Add. For hints with custom text, look at notification.AddLegacy.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SendHint)
---@param name string Name/class/index of the hint. You can find a list of hint names for this function List_of_Hint_Classes.
---@param delay number Delay in seconds before showing the hint
function Player:SendHint(name, delay) end

---[SERVER] Executes a simple Lua string on the player.
--- If you need to use this function more than once consider using net library. Send net message and make the entire code you want to execute in net.Receive on client.
---
--- The string is limited to 254 bytes. Consider using the Net_Library_Usage for more advanced server-client interaction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SendLua)
---@param script string The script to execute.
function Player:SendLua(script) end

---[SERVER] Sets the player's active weapon. You should use CUserCmd:SelectWeapon or Player:SelectWeapon, instead in most cases.
---
--- This function will not trigger the weapon switch events or associated equip animations. It will bypass
---  GM:PlayerSwitchWeapon and the currently active weapon's WEAPON:Holster return value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetActiveWeapon)
---@param weapon Weapon The weapon to equip.
function Player:SetActiveWeapon(weapon) end

---[SERVER] Sets the player's activity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetActivity)
---@param act number The new activity to set. See Enums/ACT.
function Player:SetActivity(act) end

---[SHARED] Set if the players' model is allowed to rotate around the pitch and roll axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetAllowFullRotation)
---@param Allowed boolean Allowed to rotate
function Player:SetAllowFullRotation(Allowed) end

---[SERVER] Allows player to use their weapons in a vehicle. You need to call this before entering a vehicle.
---
--- Shooting in a vehicle fires two bullets.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetAllowWeaponsInVehicle)
---@param allow boolean Show we allow player to use their weapons in a vehicle or not.
function Player:SetAllowWeaponsInVehicle(allow) end

---[SHARED] Sets the amount of the specified ammo for the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetAmmo)
---@param ammoCount number The amount of ammunition to set.
---@param ammoType any The ammunition type. Can be either number ammo ID or string ammo name.
function Player:SetAmmo(ammoCount, ammoType) end

---[SERVER] Sets the player armor to the argument.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetArmor)
---@param Amount number The amount that the player armor is going to be set to.
function Player:SetArmor(Amount) end

---[SHARED] Pushes the player away from another player whenever it's inside the other players bounding box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetAvoidPlayers)
---@param avoidPlayers boolean Avoid or not avoid.
function Player:SetAvoidPlayers(avoidPlayers) end

---[SHARED] Set if the player should be allowed to walk using the (default) alt key.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetCanWalk)
---@param abletowalk boolean True allows the player to walk.
function Player:SetCanWalk(abletowalk) end

---[SHARED] Sets whether the player can use the HL2 suit zoom ("+zoom" bind) or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetCanZoom)
---@param canZoom boolean Whether to make the player able or unable to zoom.
function Player:SetCanZoom(canZoom) end

---[SHARED] Sets the player's class id.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetClassID)
---@param classID number The class id the player is being set with.
function Player:SetClassID(classID) end

---[SHARED] Sets the crouched walk speed multiplier.
---
--- Doesn't work for values above 1.
---
--- See also Player:SetWalkSpeed and Player:GetCrouchedWalkSpeed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetCrouchedWalkSpeed)
---@param speed number The walk speed multiplier that crouch speed should be.
function Player:SetCrouchedWalkSpeed(speed) end

---[SHARED] Sets the **actual** view offset which equals the difference between the players actual position and their view when standing.
---
--- Do not confuse with Player:SetViewOffset and Player:SetViewOffsetDucked
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetCurrentViewOffset)
---@param viewOffset Vector The new view offset.
function Player:SetCurrentViewOffset(viewOffset) end

---[SERVER] Sets a player's death count
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetDeaths)
---@param deathcount number Number of deaths (positive or negative)
function Player:SetDeaths(deathcount) end

---[SHARED] Sets the driving entity and driving mode.
---
--- Use drive.PlayerStartDriving instead, see Entity Driving.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetDrivingEntity)
---@param drivingEntity? Entity The entity the player should drive.
---@param drivingMode number The driving mode index.
function Player:SetDrivingEntity(drivingEntity, drivingMode) end

---[SHARED] Applies the specified sound filter to the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetDSP)
---@param soundFilter number The index of the sound filter to apply.
--- Pick from the [list of DSP's](https://developer.valvesoftware.com/wiki/Dsp_presets).
---@param fastReset boolean If set to true the sound filter will be removed faster.
---
--- **This only works clientside**. If used serverside, a message will be displayed (`SetPlayerDSP: fastReset only valid from client`) in the server console.
function Player:SetDSP(soundFilter, fastReset) end

---[SHARED] Sets how quickly a player ducks.
---
--- This will not work for values >= 1.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetDuckSpeed)
---@param duckSpeed number How quickly the player will duck.
function Player:SetDuckSpeed(duckSpeed) end

---[SHARED] Sets the local angle of the player's view (may rotate body too if angular difference is large)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetEyeAngles)
---@param angle Angle Angle to set the view to
function Player:SetEyeAngles(angle) end

---[SHARED] Set a player's FOV (Field Of View) over a certain amount of time.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetFOV)
---@param fov number the angle of perception (FOV). Set to 0 to return to default user FOV. ( Which is ranging from 75 to 90, depending on user settings )
---@param time? number the time it takes to transition to the FOV expressed in a floating point.
---@param requester? Entity The requester or "owner" of the zoom event. Only this entity will be able to change the player's FOV until it is set back to 0.
function Player:SetFOV(fov, time, requester) end

---[SERVER] Sets a player's frags (kills)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetFrags)
---@param fragcount number Number of frags (positive or negative)
function Player:SetFrags(fragcount) end

---[SHARED] Sets the hands entity of a player.
---
--- The hands entity is an entity introduced in Garry's Mod 13 and it's used to show the player's hands attached to the viewmodel.
--- This is similar to the approach used in L4D and CS:GO, for more information on how to implement this system in your gamemode visit Using Viewmodel Hands.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetHands)
---@param hands Entity The hands entity to set
function Player:SetHands(hands) end

---[SHARED] Sets the widget that is currently hovered by the player's mouse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetHoveredWidget)
---@param widget? Entity The widget entity that the player is hovering.
function Player:SetHoveredWidget(widget) end

---[SHARED] Sets the mins and maxs of the AABB of the players collision.
---
--- See Player:SetHullDuck for the hull while crouching/ducking.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetHull)
---@param hullMins Vector The min coordinates of the hull.
---@param hullMaxs Vector The max coordinates of the hull.
function Player:SetHull(hullMins, hullMaxs) end

---[SHARED] Sets the mins and maxs of the AABB of the players collision when ducked.
---
--- See Player:SetHull for setting the hull while standing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetHullDuck)
---@param hullMins Vector The min coordinates of the hull.
---@param hullMaxs Vector The max coordinates of the hull.
function Player:SetHullDuck(hullMins, hullMaxs) end

---[SHARED] Sets the jump power, eg. the velocity that will be applied to the player when they jump.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetJumpPower)
---@param jumpPower number The new jump velocity.
function Player:SetJumpPower(jumpPower) end

---[SHARED] Sets the player's ladder climbing speed.
---
--- See Player:SetWalkSpeed for normal walking speed, Player:SetRunSpeed for sprinting speed and Player:SetSlowWalkSpeed for slow walking speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetLadderClimbSpeed)
---@param speed number The ladder climbing speed.
function Player:SetLadderClimbSpeed(speed) end

---[SERVER] Slows down the player movement simulation by the timescale, this is used internally in the HL2 weapon stripping sequence.
---
--- It achieves such behavior by multiplying the Global.FrameTime by the specified timescale at the start of the movement simulation and then restoring it afterwards.
---
--- This is reset to 1 on spawn.
---
--- There is no weapon counterpart to this, you'll have to hardcode the multiplier in the weapon or call Weapon:SetNextPrimaryFire / Weapon:SetNextSecondaryFire manually.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetLaggedMovementValue)
---@param timescale number The timescale multiplier.
function Player:SetLaggedMovementValue(timescale) end

---[SERVER] Sets the hitgroup where the player was last hit.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetLastHitGroup)
---@param hitgroup number The hitgroup to set as the "last hit", see Enums/HITGROUP.
function Player:SetLastHitGroup(hitgroup) end

---[SERVER] Sets the maximum amount of armor the player should have. This affects default built-in armor pickups, but not Player:SetArmor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetMaxArmor)
---@param maxarmor number The new max armor value.
function Player:SetMaxArmor(maxarmor) end

---[SHARED] Sets the maximum speed which the player can move at.
---
--- This is called automatically by the engine. If you wish to limit player speed without setting their run/sprint speeds, see CMoveData:SetMaxClientSpeed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetMaxSpeed)
---@param walkSpeed number The maximum speed.
function Player:SetMaxSpeed(walkSpeed) end

---[SERVER] Called when we need to set player model from the class.
---
--- This will only be called if you have not overridden GM:PlayerSetModel or call this function from it or anywhere else using player_manager.RunClass
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:SetModel)
function PLAYER:SetModel() end

---[CLIENT] Sets if the player should be muted locally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetMuted)
---@param mute boolean Mute or unmute.
function Player:SetMuted(mute) end

---[SHARED] Sets whenever the player should not collide with their teammates, based on their Player:Team.
---
--- This will only work for teams with ID 1 to 4 due to internal Engine limitations.
--- This causes traces with Enums/COLLISION_GROUP to pass through players.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetNoCollideWithTeammates)
---@param shouldNotCollide boolean `true` to disable, `false` to enable collision.
function Player:SetNoCollideWithTeammates(shouldNotCollide) end

---[SERVER] Sets the players visibility towards NPCs.
---
--- Internally this toggles the Enums/FL flag, which you can manually test for using Entity:IsFlagSet
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetNoTarget)
---@param visibility boolean The visibility.
function Player:SetNoTarget(visibility) end

---[SHARED] Sets the players observer mode. You must start the spectating first with Player:Spectate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetObserverMode)
---@param mode number Spectator mode using Enums/OBS_MODE.
function Player:SetObserverMode(mode) end

---[SHARED] Writes a **P**ersistent **Data** key-value pair to the SQL database. (`sv.db` when called on server, `cl.db` when called on client)
---
--- Internally uses the sql library. See util.SetPData for cases when the player is not currently on the server.
---
--- This function internally uses Player:SteamID64, it previously utilized Player:UniqueID which can cause collisions (two or more players sharing the same PData entry). Player:SetPData now replaces all instances of Player:UniqueID with Player:SteamID64 when running Player:SetPData
---
--- PData is not networked from servers to clients!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetPData)
---@param key string Name of the PData key
---@param value any Value to write to the key (**must** be an SQL valid data type, such as a string or integer)
---@return boolean # Whether the operation was successful or not
function Player:SetPData(key, value) end

---[SHARED] Sets the player model's color. The part of the model that is colored is determined by the model itself, and is different for each model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetPlayerColor)
---@param Color Vector This is the color to be set. The format is Vector(r, g, b), and each color should be between 0 and 1.
function Player:SetPlayerColor(Color) end

---[SHARED] Sets the widget that is currently in use by the player's mouse.
---
--- Having a pressed widget stops the player from firing their weapon to allow input to be passed onto the widget.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetPressedWidget)
---@param pressedWidget? Entity The widget the player is currently using.
function Player:SetPressedWidget(pressedWidget) end

---[SHARED] Sets the render angles of a player. Value set by this function is reset to player's angles (Entity:GetAngles) right after GM:UpdateAnimation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetRenderAngles)
---@param ang Angle The new render angles to set
function Player:SetRenderAngles(ang) end

---[SHARED] Sets the player's sprint speed.
---
--- See also Player:GetRunSpeed, Player:SetWalkSpeed and Player:SetMaxSpeed.
--- player_default class run speed is: `600`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetRunSpeed)
---@param runSpeed number The new sprint speed when `sv_friction` is below `10`. Higher `sv_friction` values will result in slower speed.
---
--- Has to be `7` or above or the player **won't** be able to move.
function Player:SetRunSpeed(runSpeed) end

---[SHARED] Sets the player's slow walking speed, which is activated via +WALK keybind.
---
--- See Player:SetWalkSpeed for normal walking speed, Player:SetRunSpeed for sprinting speed and Player:SetLadderClimbSpeed for ladder climb speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetSlowWalkSpeed)
---@param speed number The new slow walking speed.
function Player:SetSlowWalkSpeed(speed) end

---[SHARED] Sets the maximum height a player can step onto without jumping.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetStepSize)
---@param stepHeight number The new maximum height the player can step onto without jumping
function Player:SetStepSize(stepHeight) end

---[SHARED] Sets the player's HEV suit power.
---
--- This will only work for the local player when used clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetSuitPower)
---@param power number The new suit power.
function Player:SetSuitPower(power) end

---[SHARED] Sets whenever to suppress the pickup notification for the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetSuppressPickupNotices)
---@param doSuppress boolean Whenever to suppress the notice or not.
function Player:SetSuppressPickupNotices(doSuppress) end

---[SERVER] Sets the player to the chosen team.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetTeam)
---@param Team number The team that the player is being set to.
function Player:SetTeam(Team) end

---[SHARED] Sets how quickly a player un-ducks
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetUnDuckSpeed)
---@param UnDuckSpeed number How quickly the player will un-duck
function Player:SetUnDuckSpeed(UnDuckSpeed) end

---[SHARED] Setup the network table accessors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:SetupDataTables)
function PLAYER:SetupDataTables() end

---[SERVER] Sets up the players view model hands. Calls GM:PlayerSetHandsModel to set the model of the hands.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetupHands)
---@param ent Entity If the player is spectating an entity, this should be the entity the player is spectating, so we can use its hands model instead.
function Player:SetupHands(ent) end

---[SERVER] Sets the usergroup of the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetUserGroup)
---@param groupName string The user group of the player.
function Player:SetUserGroup(groupName) end

---[SERVER] Attaches the players view to the position and angles of the specified entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetViewEntity)
---@param viewEntity Entity The entity to attach the player view to.
function Player:SetViewEntity(viewEntity) end

---[SHARED] Sets the **desired** view offset which equals the difference between the players actual position and their view when standing.
---
--- If you want to set **actual** view offset, use Player:SetCurrentViewOffset
---
--- See also Player:SetViewOffsetDucked for **desired** view offset when crouching.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetViewOffset)
---@param viewOffset Vector The new desired view offset when standing.
function Player:SetViewOffset(viewOffset) end

---[SHARED] Sets the **desired** view offset which equals the difference between the players actual position and their view when crouching.
---
--- If you want to set **actual** view offset, use Player:SetCurrentViewOffset
---
--- See also Player:SetViewOffset for **desired** view offset when standing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetViewOffsetDucked)
---@param viewOffset Vector The new desired view offset when crouching.
function Player:SetViewOffsetDucked(viewOffset) end

---[SHARED] Sets client's view punch angle, but not the velocity. See Player:ViewPunch
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetViewPunchAngles)
---@param punchAngle Angle The angle to set.
function Player:SetViewPunchAngles(punchAngle) end

---[SHARED] Sets client's view punch velocity. See Player:ViewPunch and Player:SetViewPunchAngles
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetViewPunchVelocity)
---@param punchVel Angle The angle velocity to set.
function Player:SetViewPunchVelocity(punchVel) end

---[CLIENT] Sets the voice volume scale for given player on client. This value will persist from server to server, but will be reset when the game is shut down.
---
--- This doesn't work on bots, their scale will always be `1`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetVoiceVolumeScale)
---@param number number The voice volume scale, where `0` is 0% and `1` is 100%.
function Player:SetVoiceVolumeScale(number) end

---[SHARED] Sets the player's normal walking speed. Not sprinting, not slow walking +walk.
---
--- See also Player:SetSlowWalkSpeed, Player:GetWalkSpeed, Player:SetCrouchedWalkSpeed, Player:SetMaxSpeed and Player:SetRunSpeed.
---
--- Using a speed of `0` can lead to prediction errors.
---
--- `player_default` class walk speed is: `400`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetWalkSpeed)
---@param walkSpeed number The new walk speed when `sv_friction` is below `10`. Higher `sv_friction` values will result in slower speed.
---
--- Has to be `7` or above or the player **won't** be able to move.
function Player:SetWalkSpeed(walkSpeed) end

---[SHARED] Sets the player weapon's color. The part of the model that is colored is determined by the model itself, and is different for each model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SetWeaponColor)
---@param Color Vector This is the color to be set. The format is Vector(r,g,b), and each color should be between 0 and 1.
function Player:SetWeaponColor(Color) end

---[CLIENT] Returns whether the player's player model will be drawn at the time the function is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ShouldDrawLocalPlayer)
---@return boolean # `true` if the player's playermodel is visible
function Player:ShouldDrawLocalPlayer() end

---[SERVER] Sets whether the player's current weapon should drop on death.
---
--- This is reset on spawn to the Player_Classes's **DropWeaponOnDie** field by player_manager.OnPlayerSpawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ShouldDropWeapon)
---@param drop boolean Whether to drop the player's current weapon or not
function Player:ShouldDropWeapon(drop) end

---[CLIENT] Opens the player steam profile page in the steam overlay browser.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ShowProfile)
function Player:ShowProfile() end

---[SERVER] Signals the entity that it was dropped by the gravity gun.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SimulateGravGunDrop)
---@param ent Entity Entity that was dropped.
function Player:SimulateGravGunDrop(ent) end

---[SERVER] Signals the entity that it was picked up by the gravity gun. This call is only required if you want to simulate the situation of picking up objects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SimulateGravGunPickup)
---@param ent Entity The entity picked up
---@param lightning? boolean Whether or not to show lightning effects around the entity
function Player:SimulateGravGunPickup(ent, lightning) end

---[SERVER] Called when the player spawns
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:Spawn)
function PLAYER:Spawn() end

---[SERVER] Starts spectate mode for given player. This will also affect the players movetype in some cases.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Spectate)
---@param mode number Spectate mode, see Enums/OBS_MODE.
function Player:Spectate(mode) end

---[SERVER] Makes the player spectate the entity.
---
--- To get the applied spectated entity, use Player:GetObserverTarget.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SpectateEntity)
---@param entity Entity Entity to spectate.
function Player:SpectateEntity(entity) end

---[SERVER] Makes a player spray their decal.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SprayDecal)
---@param sprayOrigin Vector The location to spray from
---@param sprayEndPos Vector The location to spray to
function Player:SprayDecal(sprayOrigin, sprayEndPos) end

---[SERVER] Disables the sprint on the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SprintDisable)
function Player:SprintDisable() end

---[SERVER] Enables the sprint on the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SprintEnable)
function Player:SprintEnable() end

---[CLIENT] Called from GM:CreateMove.
---
--- This hook will not work if the current gamemode overrides GM:SetupMove and does not call this hook.
---
--- This hook is run after the drive.StartMove has been called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:StartMove)
---@param mv CMoveData
---@param cmd CUserCmd
---@return boolean # Return true to prevent default action
function PLAYER:StartMove(mv, cmd) end

---[SHARED] Doesn't appear to do anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StartSprinting)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StartSprinting() end

---[SHARED] When used in a GM:SetupMove hook, this function will force the player to walk, as well as preventing the player from sprinting.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StartWalking)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StartWalking() end

---[SHARED] Returns the player's SteamID.
---
--- See Player:AccountID for a shorter version of the SteamID and Player:SteamID64 for the full SteamID.
---
--- It is recommended to use Player:SteamID64 over the other SteamID formats whenever possible.
---
--- In a `-multirun` environment, this will return `STEAM_0:0:0` (serverside) or `NULL` (clientside) for all "copies" of a player because they are not authenticated with Steam.
---
--- For Bots this will return `BOT`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SteamID)
---@return string # "Text" representation of the player's SteamID.
function Player:SteamID() end

---[SHARED] Returns the player's full **64-bit SteamID**, also known as **CommunityID**. Information on how data is packed into this value can be found [here](https://developer.valvesoftware.com/wiki/SteamID).
---
--- See Player:AccountID for a function that returns only the Account ID part of the SteamID and Player:SteamID for the text version of the SteamID.
---
--- In a `-multirun` environment, this will return `"0"` for all "copies" of a player because they are not authenticated with Steam.
---
--- For bots, this will return `90071996842377216` (equivalent to `STEAM_0:0:0`) for the first bot to join.
---
--- For each additional bot, the number increases by 1. So the next bot will be `90071996842377217` (`STEAM_0:1:0`) then `90071996842377218` (`STEAM_0:0:1`) and so on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SteamID64)
---@return string # Player's 64-bit SteamID aka CommunityID.  The return value is a string, not a number, since Lua's numbers are unable to store the entire 64bit numbers without data loss.
function Player:SteamID64() end

---[SHARED] When used in a GM:SetupMove hook, this function will prevent the player from sprinting.
---
--- When +walk is engaged, the player will still be able to sprint to half speed (normal run speed) as opposed to full sprint speed without this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StopSprinting)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StopSprinting() end

---[SHARED] When used in a GM:SetupMove hook, this function behaves unexpectedly by preventing the player from sprinting similar to Player:StopSprinting.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StopWalking)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StopWalking() end

---[SERVER] Turns off the zoom mode of the player. (+zoom console command)
---
--- Basically equivalent of entering "-zoom" into player's console.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StopZooming)
function Player:StopZooming() end

---[SERVER] Removes all ammo from the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StripAmmo)
---@deprecated Alias of Player:RemoveAllAmmo
function Player:StripAmmo() end

---[SERVER] Removes the specified weapon class from a certain player
--- 	this function will call the Entity:OnRemove but if you try use Entity:GetOwner it will return nil
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StripWeapon)
---@param weapon string The weapon class to remove
function Player:StripWeapon(weapon) end

---[SERVER] Removes all weapons from a certain player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:StripWeapons)
function Player:StripWeapons() end

---[SERVER] Prevents a hint from showing up.
---
---
--- This function is only available in Sandbox and its derivatives
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SuppressHint)
---@param name string Hint name/class/index to prevent from showing up. You can find a list of hint names for this function List_of_Hint_Classes.
function Player:SuppressHint(name) end

---[SERVER] Attempts to switch the player weapon to the one specified in the "cl_defaultweapon" convar, if the player does not own the specified weapon nothing will happen.
---
--- If you want to switch to a specific weapon, use: Player:SetActiveWeapon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:SwitchToDefaultWeapon)
function Player:SwitchToDefaultWeapon() end

---[SHARED] Returns the player's team ID.
---
--- Returns 0 clientside when the game is not fully loaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:Team)
---@return number # The player's team's index number, as in the Enums/TEAM or a custom team defined in team.SetUp.
function Player:Team() end

---[SERVER] Returns the time in seconds since the player connected.
--- Bots will always return value 0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:TimeConnected)
---@return number #
function Player:TimeConnected() end

---[SERVER] Performs a trace hull and applies damage to the entities hit, returns the first entity hit.
---
--- Hitting the victim entity with this function in ENTITY:OnTakeDamage can cause infinite loops.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:TraceHullAttack)
---@param startPos Vector The start position of the hull trace.
---@param endPos Vector The end position of the hull trace.
---@param mins Vector The minimum coordinates of the hull.
---@param maxs Vector The maximum coordinates of the hull.
---@param damage number The damage to be applied.
---@param damageFlags number Bitflag specifying the damage type, see Enums/DMG.
---@param damageForce number The force to be applied to the hit object.
---@param damageAllNPCs boolean Whether to apply damage to all hit NPCs or not.
---@return Entity # The hit entity
function Player:TraceHullAttack(startPos, endPos, mins, maxs, damage, damageFlags, damageForce, damageAllNPCs) end

---[SHARED] Translates Enums/ACT according to the holdtype of players currently held weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:TranslateWeaponActivity)
---@param act number The initial Enums/ACT
---@return number # Translated Enums/ACT
function Player:TranslateWeaponActivity(act) end

---[SHARED] Unfreezes all objects the player has frozen with their Physics Gun. Same as double pressing R while holding Physics Gun.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:UnfreezePhysicsObjects)
function Player:UnfreezePhysicsObjects() end

---[SHARED] Returns a 32 bit integer that remains constant for a player across joins/leaves and across different servers. This can be used when a string is inappropriate - e.g. in a database primary key.
---
--- In Singleplayer, this function will always return 1.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:UniqueID)
---@return number # The player's Unique ID
---@deprecated **This function has collisions,** where more than one player can have the same UniqueID. It is **highly** recommended to use Player:SteamID64 or Player:SteamID instead, which are guaranteed to be unique to each player.
function Player:UniqueID() end

---[SHARED] Returns a table that will stay allocated for the specific player serveside between connects until the server shuts down. On client it has no such special behavior.
---
--- This table is not synchronized (networked) between client and server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:UniqueIDTable)
---@param key any Unique table key.
---@return table # The table that contains any info you have put in it.
---@deprecated This is based on Player:UniqueID which is deprecated and vulnerable to collisions.
function Player:UniqueIDTable(key) end

---[SERVER] Unlocks the player movement if locked previously.
---
--- Will disable godmode for the player if locked previously.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:UnLock)
function Player:UnLock() end

---[SERVER] Stops the player from spectating another entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:UnSpectate)
function Player:UnSpectate() end

---[SHARED] Returns the player's ID.
--- You can use Global.Player() to get the player by their ID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:UserID)
---@return number # The player's user ID
function Player:UserID() end

---[CLIENT] Called when the player changes their weapon to another one causing their viewmodel model to change
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PLAYER:ViewModelChanged)
---@param viewmodel Entity The viewmodel that is changing
---@param old string The old model
---@param new string The new model
function PLAYER:ViewModelChanged(viewmodel, old, new) end

---[SHARED] Simulates a push on the client's screen. This **adds** view punch velocity, and does not touch the current view punch angle, for which you can use Player:SetViewPunchAngles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ViewPunch)
---@param PunchAngle Angle The angle in which to push the player's screen.
function Player:ViewPunch(PunchAngle) end

---[SHARED] Resets the player's view punch (and the view punch velocity, read more at Player:ViewPunch) effect back to normal.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:ViewPunchReset)
---@param tolerance? number Reset all ViewPunch below this threshold.
function Player:ViewPunchReset(tolerance) end

---[CLIENT] Returns the players voice volume, how loud the player's voice communication currently is, as a normal number. Doesn't work on local player unless the voice_loopback convar is set to 1.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Player:VoiceVolume)
---@return number # The voice volume.
function Player:VoiceVolume() end
