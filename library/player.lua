---@meta

--- This is a list of all methods only available for players. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on the Player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player)
---@class Player : Entity
local Player = {}

--- The player library is used to get the Lua objects that represent players in-game.
player = {}

--- Represents a player class.
---
--- The player class hooks have one special field:
--- * [Player](https://wiki.facepunch.com/gmod/Player) **Player** - The player for which a hook is called.
---
--- **NOTE**: These hooks are used in [player_manager](https://wiki.facepunch.com/gmod/player_manager) this can't be [hooked](https://wiki.facepunch.com/gmod/hook.Add)
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER_Hooks)
---@class PLAYER
PLAYER = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Similar to the serverside command "bot", this function creates a new Player bot with the given name. This bot will not obey to the usual "bot_*" commands, and it's the same bot base used in TF2 and CS:S.
---
--- The best way to control the behaviour of a Player bot right now is to use the [GM:StartCommand](https://wiki.facepunch.com/gmod/GM:StartCommand) hook and modify its input serverside.
---
--- **NOTE**: Despite this Player being fake, it has to be removed from the server by using [Player:Kick](https://wiki.facepunch.com/gmod/Player:Kick) and **NOT** [Entity:Remove](https://wiki.facepunch.com/gmod/Entity:Remove).
--- Also keep in mind that these bots still use player slots, so you won't be able to spawn them in singleplayer!
---
--- **NOTE**: Any Bot created using this method will be considered UnAuthed by Garry's Mod
---
---[View wiki](https://wiki.facepunch.com/gmod/player.CreateNextBot)
---@param botName string The name of the bot, using an already existing name will append brackets at the end of it with a number pertaining it.
---
--- Example: "Bot name test", "Bot name test(1)".
---@return Player # The newly created Player bot. Returns NULL if there's no Player slots available to host it.
function player.CreateNextBot(botName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets all the current players in the server (not including connecting clients).
---
--- This function returns bots as well as human players. See [player.GetBots](https://wiki.facepunch.com/gmod/player.GetBots) and  [player.GetHumans](https://wiki.facepunch.com/gmod/player.GetHumans).
---
--- **NOTE**: This function returns a sequential table, meaning it should be looped with [Global.ipairs](https://wiki.facepunch.com/gmod/Global.ipairs) instead of [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) for efficiency reasons.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetAll)
---@return Player[] # All Players currently in the server.
function player.GetAll() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table of all bots on the server.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetBots)
---@return Player[] # A table only containing bots ( AI / non human players )
function player.GetBots() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Tried to get the player with the specified [Player:AccountID](https://wiki.facepunch.com/gmod/Player:AccountID).
--- 	**WARNING**: Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetByAccountID)
---@param accountID number The Player:AccountID to find the player by.
---@return Player|boolean # Player if one is found, `false` otherwise.
function player.GetByAccountID(accountID) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the player with the specified connection ID.
---
--- Connection ID can be retrieved via [gameevent.Listen](https://wiki.facepunch.com/gmod/gameevent.Listen) events.
---
--- For a function that returns a player based on their [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex), see [Global.Entity](https://wiki.facepunch.com/gmod/Global.Entity).
---
--- For a function that returns a player based on their [Player:UserID](https://wiki.facepunch.com/gmod/Player:UserID), see [Global.Player](https://wiki.facepunch.com/gmod/Global.Player).
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetByID)
---@param connectionID number The connection ID to find the player by.
---@return Player|NULL # Player if one is found, `NULL` otherwise.
function player.GetByID(connectionID) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the player with the specified SteamID.
--- 	**WARNING**: Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetBySteamID)
---@param steamID string The Player:SteamID to find the player by.
---@return Player|boolean # Player if one is found, `false` otherwise.
function player.GetBySteamID(steamID) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the player with the specified SteamID64.
--- 	**WARNING**: Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetBySteamID64)
---@param steamID64 string The Player:SteamID64 to find the player by.
---@return Player|boolean # Player if one is found, `false` otherwise.
function player.GetBySteamID64(steamID64) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the player with the specified uniqueID (not recommended way to identify players).
---
--- **WARNING**: It is highly recommended to use [player.GetByAccountID](https://wiki.facepunch.com/gmod/player.GetByAccountID), [player.GetBySteamID](https://wiki.facepunch.com/gmod/player.GetBySteamID) or [player.GetBySteamID64](https://wiki.facepunch.com/gmod/player.GetBySteamID64) instead as this function can have collisions ( be same for different people ) while SteamID is guaranteed to unique to each player.
---
--- 	**WARNING**: Internally this function iterates over all players in the server, meaning it can be quite expensive in a performance-critical context.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetByUniqueID)
---@param uniqueID string The Player:UniqueID to find the player by.
---@return Player|boolean # Player if one is found, `false` otherwise.
---@deprecated Use player.GetBySteamID64, player.GetBySteamID or player.GetByAccountID to get a player by a unique identifier instead.
function player.GetByUniqueID(uniqueID) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the active player count.
---
--- **NOTE**: Similar to **#**[player.GetAll](https://wiki.facepunch.com/gmod/player.GetAll)() but with better performance since the player table doesn't have to be generated. If [player.GetAll](https://wiki.facepunch.com/gmod/player.GetAll) is already being called for iteration, then using the **#** operator on the table will be faster than calling this function since it is JITted.
---
--- **NOTE**: Players who are currently connecting to the server will not be counted. See function: [player.GetCountConnecting](https://wiki.facepunch.com/gmod/player.GetCountConnecting)
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetCount)
---@return number # Number of players
function player.GetCount() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the amount of players connecting to the server, but not yet spawned in.
---
--- `player.GetCountConnecting() + player.GetCount()` would result in the total player count on this server.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetCountConnecting)
---@return number # Number of players still connecting.
function player.GetCountConnecting() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table containing all human players (non-bot/AI).
---
--- Unlike [player.GetAll](https://wiki.facepunch.com/gmod/player.GetAll), this does not include bots.
--- **NOTE**: This function returns a sequential table, meaning it should be looped with [Global.ipairs](https://wiki.facepunch.com/gmod/Global.ipairs) instead of [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) for efficiency reasons.
---
---[View wiki](https://wiki.facepunch.com/gmod/player.GetHumans)
---@return Player[] # A table containing all human (non-bot/AI) players.
function player.GetHumans() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a [Stateless Iterator](https://www.lua.org/pil/7.3.html) for all players on the server.
--- Intended for use in [Generic For Loops](https://www.lua.org/pil/4.3.5.html).
--- See [ents.Iterator](https://wiki.facepunch.com/gmod/ents.Iterator) for a similar function for all entities.
---
--- Internally, this function uses cached values that exist entirely within lua, as opposed to [player.GetAll](https://wiki.facepunch.com/gmod/player.GetAll), which is a C++ function.
--- Because switching from lua to C++ (and vice versa) incurs a performance cost, this function will be somewhat more efficient than [player.GetAll](https://wiki.facepunch.com/gmod/player.GetAll).
---
---[View wiki](https://wiki.facepunch.com/gmod/player.Iterator)
---@return function # The Iterator Function from Global.ipairs
---@return Player[] # Table of all existing Player.  This is a cached copy of player.GetAll
--- This table is intended to be read-only.
---
--- Modifying the return table will affect all subsequent calls to this function until the cache is refreshed, replacing all of your player.GetAll usages may come with unintended side effects because of this.
---
--- Example of bad code:
--- ```
--- -- NEVER DO THIS!!!
---
--- local scan_ents = select(2, player.Iterator())
---
--- table.Add(scan_ents, ents.FindByClass("ttt_decoy"))
--- ```
---@return number # The starting index for the table of players.
--- This is always `0` and is returned for the benefit of [Generic For Loops](https://www.lua.org/pil/4.3.5.html)
function player.Iterator() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's AccountID part of their full SteamID.
---
--- Since this does not include other vital parts of the SteamID such as "Account Type" and "Account Instance", it should be avoided, as AccountIDs are finite, and can theoretically be the same for multiple valid accounts.
---
--- See [Player:SteamID](https://wiki.facepunch.com/gmod/Player:SteamID) for the text representation of the full SteamID.
--- See [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64) for a 64bit representation of the full SteamID.
---
--- **NOTE**: In a `-multirun` environment, this will return `-1` for all "copies" of a player because they are not authenticated with Steam.
---
--- For bots this will return values starting with `0` for the first bot, `1` for the second bot and so on.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AccountID)
---@return number # The AccountID of Player's SteamID.
function Player:AccountID() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **NOTE**: This function is only available in Sandbox and its derivatives.
--- Adds an entity to the player's clean up list. This uses [cleanup.Add](https://wiki.facepunch.com/gmod/cleanup.Add) internally.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AddCleanup)
---@param type string The Cleanup type for this Entity.
---@param ent Entity The Entity to add.
function Player:AddCleanup(type, ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **NOTE**: This function is only available in Sandbox and its derivatives.
--- Adds an entity to the player's list of entities of the same type. See [Player:GetCount](https://wiki.facepunch.com/gmod/Player:GetCount) to get the current count of entities of an entity type added with this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AddCount)
---@param str string The type of this Entity.
---@param ent Entity The Entity you want to add to the list.
function Player:AddCount(str, ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds the provided amount to the player's death count.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AddDeaths)
---@param count number The amount to add to the death count.
function Player:AddDeaths(count) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds the provided amount to the player's frag/kill count.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AddFrags)
---@param count number The amount to add.
function Player:AddFrags(count) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds an entity to the player's list of frozen objects.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AddFrozenPhysicsObject)
---@param ent Entity The Entity to add.
---@param physobj PhysObj The physics object of the Entity.
function Player:AddFrozenPhysicsObject(ent, physobj) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets up the voting system for the player.
--- This is a really barebone system. By calling this a vote gets started, when the player presses 0-9 the callback function gets called along with the key the player pressed. Use the draw callback to draw the vote panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AddPlayerOption)
---@param name string Name of the vote
---@param timeout number Time until the vote expires
---@param vote_callback fun(voteNum: number):(ret0: boolean) The function to be run when the player presses 0-9 while a vote is active.
---
--- Function argument(s):
--- * number `voteNum` - Which option the player pressed, 1-9 and 0 being the very last option.
---
--- Function return value(s):
--- * boolean `` - Return true to remove this option from the vote.
---@param draw_callback function Used to draw the vote panel.
function Player:AddPlayerOption(name, timeout, vote_callback, draw_callback) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Plays a sequence directly from a sequence number, similar to [Player:AnimRestartGesture](https://wiki.facepunch.com/gmod/Player:AnimRestartGesture). This function has the advantage to play sequences that haven't been bound to an existing [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT)
--- **WARNING**: This is not automatically networked. This function has to be called on the client to be seen by said client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AddVCDSequenceToGestureSlot)
---@param slot number Gesture slot using Enums/GESTURE_SLOT
---@param sequenceId number The sequence ID to play, can be retrieved with Entity:LookupSequence.
---@param cycle number The cycle to start the animation at, ranges from 0 to 1.
---@param autokill? boolean If the animation should not loop. true = stops the animation, false = the animation keeps playing.
function Player:AddVCDSequenceToGestureSlot(slot, sequenceId, cycle, autokill) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the player is alive.
---
--- Player specific implementation of [Entity:Alive](https://wiki.facepunch.com/gmod/Entity:Alive), the value is synchronized to the client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Alive)
---@return boolean # Whether the player is alive
function Player:Alive() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets if the player can toggle their flashlight. Function exists on both the server and client but has no effect when ran on the client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AllowFlashlight)
---@param canFlashlight boolean True allows flashlight toggling
function Player:AllowFlashlight(canFlashlight) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Lets the player spray their decal without delay
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AllowImmediateDecalPainting)
---@param allow boolean Allow or disallow
function Player:AllowImmediateDecalPainting(allow) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Resets player gesture in selected slot.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AnimResetGestureSlot)
---@param slot number Slot to reset. See the Enums/GESTURE_SLOT.
function Player:AnimResetGestureSlot(slot) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Restart a gesture on a player, within a gesture slot.
---
--- **WARNING**: This is not automatically networked. This function has to be called on the client to be seen by said client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AnimRestartGesture)
---@param slot number Gesture slot using Enums/GESTURE_SLOT
---@param activity number The activity ( see Enums/ACT ) or sequence that should be played
---@param autokill? boolean Whether the animation should be automatically stopped. true = stops the animation, false = the animation keeps playing/looping
function Player:AnimRestartGesture(slot, activity, autokill) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Restarts the main animation on the player, has the same effect as calling [Entity:SetCycle](https://wiki.facepunch.com/gmod/Entity:SetCycle)( 0 ).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AnimRestartMainSequence)
function Player:AnimRestartMainSequence() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the sequence of the animation playing in the given gesture slot.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AnimSetGestureSequence)
---@param slot number The gesture slot. See Enums/GESTURE_SLOT
---@param sequenceID number Sequence ID to set.
function Player:AnimSetGestureSequence(slot, sequenceID) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the weight of the animation playing in the given gesture slot.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:AnimSetGestureWeight)
---@param slot number The gesture slot. See Enums/GESTURE_SLOT
---@param weight number The weight this slot should be set to. Value must be ranging from 0 to 1.
function Player:AnimSetGestureWeight(slot, weight) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's armor.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Armor)
---@return number # The player's armor.
function Player:Armor() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Bans the player from the server for a certain amount of minutes.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Ban)
---@param minutes number Duration of the ban in minutes (0 is permanent)
---@param kick? boolean Whether to kick the player after banning them or not
function Player:Ban(minutes, kick) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the player's flashlight hasn't been disabled by [Player:AllowFlashlight](https://wiki.facepunch.com/gmod/Player:AllowFlashlight).
---
--- **NOTE**: This is not synchronized between clients and server automatically!
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:CanUseFlashlight)
---@return boolean # Whether the player can use flashlight.
function Player:CanUseFlashlight() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Prints a string to the chatbox of the client.
---
--- **WARNING**: Just like the [usermessage](https://wiki.facepunch.com/gmod/usermessage), this function is affected by the 255 byte limit!
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ChatPrint)
---@param message string String to be printed
function Player:ChatPrint(message) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the limit of an entity type added by [Player:AddCount](https://wiki.facepunch.com/gmod/Player:AddCount) is hit or not. If it's hit, it will call the [GM:PlayerCheckLimit](https://wiki.facepunch.com/gmod/GM:PlayerCheckLimit) hook, and call [Player:LimitHit](https://wiki.facepunch.com/gmod/Player:LimitHit) if the hook doesn't return `false`.
---
--- This will always return `true` in singleplayer, as singleplayer does not have limits.
---
--- **NOTE**: This function is only available in Sandbox and its derivatives.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:CheckLimit)
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

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when the player's class was changed from this class.
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:ClassChanged)
function PLAYER:ClassChanged() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Runs the concommand on the player. This does not work on bots. If used clientside, always runs the command on the local player.
---
--- If you wish to directly modify the movement input of bots, use [GM:StartCommand](https://wiki.facepunch.com/gmod/GM:StartCommand) instead.
---
--- **NOTE**: Some commands/convars are blocked from being run/changed using this function, usually to prevent harm/annoyance to clients. For a list of blocked commands, see [Blocked ConCommands](https://wiki.facepunch.com/gmod/Blocked_ConCommands).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ConCommand)
---@param command string command to run
function Player:ConCommand(command) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Creates the player's death ragdoll entity and deletes the old one.
---
--- This is normally used when a player dies, to create their death ragdoll.
---
--- The ragdoll will be created with the player's properties such as [Position](https://wiki.facepunch.com/gmod/Entity:GetPos), [Angles](https://wiki.facepunch.com/gmod/Entity:GetAngles), [PlayerColor](https://wiki.facepunch.com/gmod/Player:GetPlayerColor), [Velocity](https://wiki.facepunch.com/gmod/Entity:GetVelocity) and [Model](https://wiki.facepunch.com/gmod/Entity:GetModel).
---
--- You can retrieve the entity this creates with [Player:GetRagdollEntity](https://wiki.facepunch.com/gmod/Player:GetRagdollEntity).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:CreateRagdoll)
function Player:CreateRagdoll() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Disables the default player's crosshair. Can be reenabled with [Player:CrosshairEnable](https://wiki.facepunch.com/gmod/Player:CrosshairEnable). This will affect [WEAPON:DoDrawCrosshair](https://wiki.facepunch.com/gmod/WEAPON:DoDrawCrosshair).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:CrosshairDisable)
function Player:CrosshairDisable() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Enables the player's crosshair, if it was previously disabled via [Player:CrosshairDisable](https://wiki.facepunch.com/gmod/Player:CrosshairDisable).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:CrosshairEnable)
function Player:CrosshairEnable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is crouching or not ([FL_DUCKING](https://wiki.facepunch.com/gmod/Enums/FL) flag).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Crouching)
---@return boolean # Whether the player is crouching.
function Player:Crouching() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the player dies
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:Death)
function PLAYER:Death() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's death count
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Deaths)
---@return number # The number of deaths the player has had.
function Player:Deaths() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Prints the players' name and position to the console.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DebugInfo)
function Player:DebugInfo() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Detonates all tripmines belonging to the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DetonateTripmines)
function Player:DetonateTripmines() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Disables world clicking for given player. See [Panel:SetWorldClicker](https://wiki.facepunch.com/gmod/Panel:SetWorldClicker) and [Player:IsWorldClickingDisabled](https://wiki.facepunch.com/gmod/Player:IsWorldClickingDisabled).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DisableWorldClicking)
---@param disable boolean Whether the world clicking should be disabled.
function Player:DisableWorldClicking(disable) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sends a third person animation event to the player.
---
--- Calls [GM:DoAnimationEvent](https://wiki.facepunch.com/gmod/GM:DoAnimationEvent) with [PLAYERANIMEVENT_CUSTOM_GESTURE](https://wiki.facepunch.com/gmod/Enums/PLAYERANIMEVENT) as the event, data as the given data.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DoAnimationEvent)
---@param data number The data to send.
function Player:DoAnimationEvent(data) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Starts the player's attack animation. The attack animation is determined by the weapon's HoldType.
---
--- Similar to other animation event functions, calls [GM:DoAnimationEvent](https://wiki.facepunch.com/gmod/GM:DoAnimationEvent) with [PLAYERANIMEVENT_ATTACK_PRIMARY](https://wiki.facepunch.com/gmod/Enums/PLAYERANIMEVENT) as the event and no extra data.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DoAttackEvent)
function Player:DoAttackEvent() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sends a specified third person animation event to the player.
---
--- Calls [GM:DoAnimationEvent](https://wiki.facepunch.com/gmod/GM:DoAnimationEvent) with specified arguments.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DoCustomAnimEvent)
---@param event number The event to send. See Enums/PLAYERANIMEVENT.
---@param data number The data to send alongside the event.
function Player:DoCustomAnimEvent(event, data) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sends a third person reload animation event to the player.
---
--- Similar to other animation event functions, calls [GM:DoAnimationEvent](https://wiki.facepunch.com/gmod/GM:DoAnimationEvent) with [PLAYERANIMEVENT_RELOAD](https://wiki.facepunch.com/gmod/Enums/PLAYERANIMEVENT) as the event and no extra data.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DoReloadEvent)
function Player:DoReloadEvent() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sends a third person secondary fire animation event to the player.
---
--- Similar to other animation event functions, calls [GM:DoAnimationEvent](https://wiki.facepunch.com/gmod/GM:DoAnimationEvent) with [PLAYERANIMEVENT_ATTACK_SECONDARY](https://wiki.facepunch.com/gmod/Enums/PLAYERANIMEVENT) as the event and no extra data.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DoSecondaryAttack)
function Player:DoSecondaryAttack() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Show/Hide the player's weapon's viewmodel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DrawViewModel)
---@param draw boolean Should draw
---@param vm? number Which view model to show/hide, 0-2.
function Player:DrawViewModel(draw, vm) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Show/Hide the player's weapon's worldmodel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DrawWorldModel)
---@param draw boolean Should draw
function Player:DrawWorldModel(draw) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Drops the players' weapon of a specific class.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DropNamedWeapon)
---@param class string The class to drop.
---@param target? Vector If set, launches the weapon at given position. There is a limit to how far it is willing to throw the weapon. Overrides velocity argument.
---@param velocity? Vector If set and previous argument is unset, launches the weapon with given velocity. If the velocity is higher than 400, it will be clamped to 400.
function Player:DropNamedWeapon(class, target, velocity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Drops any object the player is currently holding with either Gravity Gun, Physics Gun or `+use` (E key)
---
--- See also [Entity:ForcePlayerDrop](https://wiki.facepunch.com/gmod/Entity:ForcePlayerDrop).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DropObject)
function Player:DropObject() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the player to drop the specified weapon
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:DropWeapon)
---@param weapon? Weapon Weapon to be dropped. If unset, will default to the currently equipped weapon.
---@param target? Vector If set, launches the weapon at given position. There is a limit to how far it is willing to throw the weapon. Overrides velocity argument.
---@param velocity? Vector If set and previous argument is unset, launches the weapon with given velocity. If the velocity is higher than 400, it will be clamped to 400.
function Player:DropWeapon(weapon, target, velocity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Force puts the player into a specified vehicle.
--- This **does not** bypass [GM:CanPlayerEnterVehicle](https://wiki.facepunch.com/gmod/GM:CanPlayerEnterVehicle).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:EnterVehicle)
---@param vehicle Vehicle Vehicle the player will enter
function Player:EnterVehicle(vehicle) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Equips the player with the HEV suit.
---
--- Allows the player to zoom, walk slowly, sprint, pickup armor batteries, use the health and armor stations and also shows the HUD.
--- The player also emits a flatline sound on death, which can be overridden with [GM:PlayerDeathSound](https://wiki.facepunch.com/gmod/GM:PlayerDeathSound).
---
--- The player is automatically equipped with the suit on spawn, if you wish to stop that, use [Player:RemoveSuit](https://wiki.facepunch.com/gmod/Player:RemoveSuit).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:EquipSuit)
function Player:EquipSuit() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the player off the current ladder if they are on one.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ExitLadder)
function Player:ExitLadder() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the player to exit the vehicle if they're in one.
---
--- This function will bypass [GM:CanExitVehicle](https://wiki.facepunch.com/gmod/GM:CanExitVehicle). See also [GM:PlayerLeaveVehicle](https://wiki.facepunch.com/gmod/GM:PlayerLeaveVehicle)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ExitVehicle)
function Player:ExitVehicle() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called from [GM:FinishMove](https://wiki.facepunch.com/gmod/GM:FinishMove).
---
--- **WARNING**: This hook will not work if the current gamemode overrides [GM:FinishMove](https://wiki.facepunch.com/gmod/GM:FinishMove) and does not call this hook.
---
--- **NOTE**: This hook is run after the [drive.FinishMove](https://wiki.facepunch.com/gmod/drive.FinishMove) has been called.
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:FinishMove)
---@param mv CMoveData
---@return boolean # Return true to prevent default action
function PLAYER:FinishMove(mv) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Enables/Disables the player's flashlight.[Player:CanUseFlashlight](https://wiki.facepunch.com/gmod/Player:CanUseFlashlight) must be true in order for the player's flashlight to be changed.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Flashlight)
---@param isOn boolean Turns the flashlight on/off
function Player:Flashlight(isOn) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the player's flashlight is on.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:FlashlightIsOn)
---@return boolean # Whether the player's flashlight is on.
function Player:FlashlightIsOn() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the amount of frags a player has.
---
--- **NOTE**: The value will change depending on the player's kill or suicide: +1 for a kill, -1 for a suicide.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Frags)
---@return number # frags
function Player:Frags() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Freeze the player. Frozen players cannot move, look around, or attack. Key bindings are still called. Similar to [Player:Lock](https://wiki.facepunch.com/gmod/Player:Lock) but the player can still take damage.
---
--- Adds or removes the [FL_FROZEN](https://wiki.facepunch.com/gmod/Enums/FL) flag from the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Freeze)
---@param frozen? boolean Whether the player should be frozen.
function Player:Freeze(frozen) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's active weapon.
---
--- If used on a [Global.LocalPlayer](https://wiki.facepunch.com/gmod/Global.LocalPlayer)() and the player is spectating another player with `OBS_MODE_IN_EYE`, the weapon returned will be of the spectated player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetActiveWeapon)
---@return Weapon # The weapon the player currently has equipped or NULL if the player doesn't have an active weapon eg. when they're dead.
function Player:GetActiveWeapon() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the player's current activity.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetActivity)
---@return number # The player's current activity. See Enums/ACT.
function Player:GetActivity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the direction that the player is aiming.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetAimVector)
---@return Vector # The direction vector of players aim
function Player:GetAimVector() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the players' model is allowed to rotate around the pitch and roll axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetAllowFullRotation)
---@return boolean # Allowed
function Player:GetAllowFullRotation() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is allowed to use their weapons in a vehicle or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetAllowWeaponsInVehicle)
---@return boolean # Whether the player is allowed to use their weapons in a vehicle or not.
function Player:GetAllowWeaponsInVehicle() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table of all ammo the player has.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetAmmo)
---@return table # A table with the following format
--- * number Key - AmmoID to be used with functions like game.GetAmmoName.
--- * number Value - Amount of ammo the player has of this kind.
function Player:GetAmmo() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the amount of ammo the player has.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetAmmoCount)
---@param ammotype any The ammunition type. Can be either number ammo ID or string ammo name.
---@return number # The amount of ammo player has in reserve.
function Player:GetAmmoCount(ammotype) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets if the player will be pushed out of nocollided players.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetAvoidPlayers)
---@return boolean # pushed
function Player:GetAvoidPlayers() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the player is able to walk using the (default) alt key.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetCanWalk)
---@return boolean # AbleToWalk
function Player:GetCanWalk() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Determines whenever the player is allowed to use the zoom functionality.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetCanZoom)
---@return boolean # canZoom
function Player:GetCanZoom() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's class id.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetClassID)
---@return number # The player's class id.
function Player:GetClassID() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **NOTE**: This function is only available in Sandbox and its derivatives.
--- Gets the total amount of entities of an entity type added by [Player:AddCount](https://wiki.facepunch.com/gmod/Player:AddCount).
---
--- Default types:
--- ```
--- balloons
--- buttons
--- cameras
--- dynamite
--- effects
--- emitters
--- hoverballs
--- lamps
--- lights
--- npcs
--- props
--- ragdolls
--- sents
--- thrusters
--- vehicles
--- wheels
--- ```
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetCount)
---@param type string Type to get entity count of.
---@param minus? number If specified, it will reduce the counter by this value. Works only serverside.
---@return number # The returned count.
function Player:GetCount(type, minus) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the crouched walk speed multiplier.
---
--- See also [Player:GetWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed) and [Player:SetCrouchedWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetCrouchedWalkSpeed).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetCrouchedWalkSpeed)
---@return number # The crouched walk speed multiplier.
function Player:GetCrouchedWalkSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the last command which was sent by the specified player. This can only be called on the player which [Global.GetPredictionPlayer](https://wiki.facepunch.com/gmod/Global.GetPredictionPlayer)() returns.
---
--- **NOTE**: When called clientside in singleplayer during [WEAPON:Think](https://wiki.facepunch.com/gmod/WEAPON:Think), it will return nothing as the hook is not technically predicted in that instance. See the note on the page.
---
--- This will fail in [GM:StartCommand](https://wiki.facepunch.com/gmod/GM:StartCommand).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetCurrentCommand)
---@return CUserCmd # Last user commands
function Player:GetCurrentCommand() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the **actual** view offset which equals the difference between the players actual position and their view when standing.
---
--- Do not confuse with [Player:GetViewOffset](https://wiki.facepunch.com/gmod/Player:GetViewOffset) and [Player:GetViewOffsetDucked](https://wiki.facepunch.com/gmod/Player:GetViewOffsetDucked)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetCurrentViewOffset)
---@return Vector # The actual view offset.
function Player:GetCurrentViewOffset() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the entity the player is currently driving via the [drive](https://wiki.facepunch.com/gmod/drive) library.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetDrivingEntity)
---@return Entity # The currently driven entity, or NULL entity
function Player:GetDrivingEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns driving mode of the player. See [Entity Driving](https://wiki.facepunch.com/gmod/Entity_Driving).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetDrivingMode)
---@return number # The drive mode ID or 0 if player doesn't use the drive system.
function Player:GetDrivingMode() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a player's duck speed (in seconds)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetDuckSpeed)
---@return number # duckspeed
function Player:GetDuckSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the entity the player is currently using, like func_tank mounted turrets or +use prop pickups.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetEntityInUse)
---@return Entity # Entity in use, or NULL entity otherwise. For +use prop pickups, this will be NULL clientside.
function Player:GetEntityInUse() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table with information of what the player is looking at.
---
--- The results of this function are **cached** clientside every frame.
---
--- Uses [util.GetPlayerTrace](https://wiki.facepunch.com/gmod/util.GetPlayerTrace) internally and is therefore bound by its limits.
---
--- See also [Player:GetEyeTraceNoCursor](https://wiki.facepunch.com/gmod/Player:GetEyeTraceNoCursor).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetEyeTrace)
---@return TraceResult # Trace information, see Structures/TraceResult.
function Player:GetEyeTrace() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the trace according to the players view direction, ignoring their mouse (holding C and moving the mouse in Sandbox).
---
--- The results of this function are **cached** clientside every frame.
---
--- Uses [util.GetPlayerTrace](https://wiki.facepunch.com/gmod/util.GetPlayerTrace) internally and is therefore bound by its limits.
---
--- See also [Player:GetEyeTrace](https://wiki.facepunch.com/gmod/Player:GetEyeTrace).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetEyeTraceNoCursor)
---@return TraceResult # Trace result. See Structures/TraceResult.
function Player:GetEyeTraceNoCursor() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the FOV of the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetFOV)
---@return number # Field of view as a float
function Player:GetFOV() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the steam "relationship" towards the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetFriendStatus)
---@return string # Should return one of four different things depending on their status on your friends list: "friend", "blocked", "none" or "requested".
function Player:GetFriendStatus() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the hands entity of a player
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetHands)
---@return Entity # The hands entity if players has one
function Player:GetHands() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called on player spawn to determine which hand model to use
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:GetHandsModel)
---@return table # A table containing info about view model hands model to be set. See examples.
function PLAYER:GetHandsModel() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the widget the player is hovering with their mouse.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetHoveredWidget)
---@return Entity # The hovered widget.
function Player:GetHoveredWidget() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves the minimum and maximum [Vectors](https://wiki.facepunch.com/gmod/Vector) of the [Axis-Aligned Bounding Box (AABB)](https://en.wikipedia.org/wiki/Minimum_bounding_box) used for the [Player's](https://wiki.facepunch.com/gmod/Player) physics and movement [Hull Traces](https://wiki.facepunch.com/gmod/util.TraceHull).
---
--- See also: [Player:SetHull](https://wiki.facepunch.com/gmod/Player:SetHull), [Player:SetHullDuck](https://wiki.facepunch.com/gmod/Player:SetHullDuck), [Player:GetHullDuck](https://wiki.facepunch.com/gmod/Player:GetHullDuck)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetHull)
---@return Vector # The hull mins, the lowest corner of the Player's bounding box.
---@return Vector # The hull maxs, the highest corner of the Player's bounding box, opposite of the mins.
function Player:GetHull() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves the minimum and maximum [Vectors](https://wiki.facepunch.com/gmod/Vector) of the [Axis-Aligned Bounding Box (AABB)](https://en.wikipedia.org/wiki/Minimum_bounding_box) used for the [Player's](https://wiki.facepunch.com/gmod/Player) physics and movement [Hull Traces](https://wiki.facepunch.com/gmod/util.TraceHull) while they are crouching (or "Ducking").
---
--- See also: [Player:SetHullDuck](https://wiki.facepunch.com/gmod/Player:SetHullDuck), [Player:GetHull](https://wiki.facepunch.com/gmod/Player:GetHull), [Player:SetHull](https://wiki.facepunch.com/gmod/Player:SetHull)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetHullDuck)
---@return Vector # The hull mins, the lowest corner of the Player's bounding box while crouching.
---@return Vector # The hull maxs, the highest corner of the Player's crouching bounding box, opposite of the mins.
function Player:GetHullDuck() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves the value of a client-side [ConVar](https://wiki.facepunch.com/gmod/ConVar). The [ConVar](https://wiki.facepunch.com/gmod/ConVar) must have a [FCVAR_USERINFO](https://wiki.facepunch.com/gmod/Enums/FCVAR) flag for this to work.
---
--- On client this function will return value of the local player, regardless of which player the function was called on!
---
--- See [Player:GetInfoNum](https://wiki.facepunch.com/gmod/Player:GetInfoNum) for the same function that automatically converts the string to a number.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetInfo)
---@param cVarName string The name of the client-side ConVar.
---@return string # The value of the ConVar. Or an empty string if the convar doesn't exist.
---
--- The returned value is truncated to 31 bytes.
function Player:GetInfo(cVarName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves the numeric value of a client-side convar, returns nil if value is not convertible to a number. The [ConVar](https://wiki.facepunch.com/gmod/ConVar) must have a [FCVAR_USERINFO](https://wiki.facepunch.com/gmod/Enums/FCVAR) flag for this to work.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetInfoNum)
---@param cVarName string The name of the ConVar to query the value of
---@param default number Default value if we failed to retrieve the number.
---@return number # The value of the ConVar or the default value
function Player:GetInfoNum(cVarName, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the jump power of the player
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetJumpPower)
---@return number # Jump power
function Player:GetJumpPower() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's ladder climbing speed.
---
--- See [Player:GetWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed) for normal walking speed, [Player:GetRunSpeed](https://wiki.facepunch.com/gmod/Player:GetRunSpeed) for sprinting speed and [Player:GetSlowWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetSlowWalkSpeed) for slow walking speed.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetLadderClimbSpeed)
---@return number # The ladder climbing speed.
function Player:GetLadderClimbSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the timescale multiplier of the player movement.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetLaggedMovementValue)
---@return number # The timescale multiplier, defaults to `1`.
function Player:GetLaggedMovementValue() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the maximum amount of armor the player should have. Default value is 100.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetMaxArmor)
---@return number # The new max armor value
function Player:GetMaxArmor() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's maximum movement speed.
---
--- See also [Player:SetMaxSpeed](https://wiki.facepunch.com/gmod/Player:SetMaxSpeed), [Player:GetWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed) and [Player:GetRunSpeed](https://wiki.facepunch.com/gmod/Player:GetRunSpeed).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetMaxSpeed)
---@return number # The maximum movement speed the player can go at.
function Player:GetMaxSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's name, this is an alias of [Player:Nick](https://wiki.facepunch.com/gmod/Player:Nick).
---
--- **NOTE**: This function overrides [Entity:GetName](https://wiki.facepunch.com/gmod/Entity:GetName) (in the Lua metatable, not in c++), keep it in mind when dealing with [ents.FindByName](https://wiki.facepunch.com/gmod/ents.FindByName) or any engine function which requires the mapping name.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetName)
---@return string # The player's name.
function Player:GetName() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the player is set not to collide with their teammates.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetNoCollideWithTeammates)
---@return boolean # noCollideWithTeammates
function Player:GetNoCollideWithTeammates() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the the observer mode of the player
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetObserverMode)
---@return number # Observe mode of that player, see Enums/OBS_MODE.
function Player:GetObserverMode() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the entity the player is currently observing.
---
--- Set using [Player:SpectateEntity](https://wiki.facepunch.com/gmod/Player:SpectateEntity).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetObserverTarget)
---@return Entity # The entity the player is currently spectating, or Global_Variables if the player has no target.
function Player:GetObserverTarget() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a **P**ersistent **Data** key-value pair from the SQL database. (`sv.db` when called on server, `cl.db` when called on client)
---
--- Internally uses the [sql](https://wiki.facepunch.com/gmod/sql) library. See [util.GetPData](https://wiki.facepunch.com/gmod/util.GetPData) for cases when the player is not currently on the server.
---
--- **NOTE**: This function internally uses [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64), it previously utilized [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) which can cause collisions (two or more players sharing the same PData entry). [Player:SetPData](https://wiki.facepunch.com/gmod/Player:SetPData) now replaces all instances of [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64) when running [Player:SetPData](https://wiki.facepunch.com/gmod/Player:SetPData)
---
--- **NOTE**: PData is not networked from servers to clients!
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetPData)
---@param key string Name of the PData key
---@param default? any Default value if PData key doesn't exist.
---@return string # The data in the SQL database or the default value given.
function Player:GetPData(key, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a player model's color. The part of the model that is colored is determined by the model itself, and is different for each model.
--- **NOTE**: Overide this function clientside on a Entity(not a player) with playermodel and return color will apply color on it
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetPlayerColor)
---@return Vector # The format is `Vector(r,g,b)`, and each color component should be between 0 and 1.
function Player:GetPlayerColor() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table containing player information.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetPlayerInfo)
---@return table # A table containing player information.
function Player:GetPlayerInfo() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the preferred carry angles of an object, if any are set.
---
--- Calls [GM:GetPreferredCarryAngles](https://wiki.facepunch.com/gmod/GM:GetPreferredCarryAngles) with the target entity and returns the carry angles.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetPreferredCarryAngles)
---@param carryEnt Entity Entity to retrieve the carry angles of.
---@return Angle # Carry angles or nil if the entity has no preferred carry angles.
function Player:GetPreferredCarryAngles(carryEnt) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the widget entity the player is using.
---
--- Having a pressed widget stops the player from firing their weapon to allow input to be passed onto the widget.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetPressedWidget)
---@return Entity # The pressed widget.
function Player:GetPressedWidget() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the weapon the player previously had equipped.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetPreviousWeapon)
---@return Entity # The previous weapon of the player.
---
--- This is not guaranteed to be a weapon entity so it should be checked with [Entity:IsWeapon](https://wiki.facepunch.com/gmod/Entity:IsWeapon) for safety.
function Player:GetPreviousWeapon() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns players screen punch effect angle. See [Player:ViewPunch](https://wiki.facepunch.com/gmod/Player:ViewPunch) and [Player:SetViewPunchAngles](https://wiki.facepunch.com/gmod/Player:SetViewPunchAngles)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetPunchAngle)
---@return Angle # The punch angle
---@deprecated You should use Player:GetViewPunchAngles instead.
function Player:GetPunchAngle() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns players death ragdoll. The ragdoll is created by [Player:CreateRagdoll](https://wiki.facepunch.com/gmod/Player:CreateRagdoll).
--- **NOTE**: Calling [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos) server-side with this function then will return the position where [Player:CreateRagdoll](https://wiki.facepunch.com/gmod/Player:CreateRagdoll) was used, as it is a hl2mp_ragdoll which is a serverside point entity that creates a clientside ragdoll for everyone (opposed to prop_ragdoll that is serverside and networks).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetRagdollEntity)
---@return Entity # The ragdoll.
---
--- Unlike normal clientside ragdolls (`C_ClientRagdoll`), this will be a `C_HL2MPRagdoll` on the client, and `hl2mp_ragdoll` on the server.
function Player:GetRagdollEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the render angles for the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetRenderAngles)
---@return Angle # The render angles of the player. Only **yaw** part of the angle seems to be present.
function Player:GetRenderAngles() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's sprint speed.
---
--- See also [Player:SetRunSpeed](https://wiki.facepunch.com/gmod/Player:SetRunSpeed), [Player:GetWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed) and [Player:GetMaxSpeed](https://wiki.facepunch.com/gmod/Player:GetMaxSpeed).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetRunSpeed)
---@return number # The sprint speed
function Player:GetRunSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the position of a Player's view
---
--- **NOTE**: This is the same as calling [Entity:EyePos](https://wiki.facepunch.com/gmod/Entity:EyePos) on the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetShootPos)
---@return Vector # The position of the player's view.
function Player:GetShootPos() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's slow walking speed, which is activated via +WALK keybind.
---
--- See [Player:GetWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed) for normal walking speed, [Player:GetRunSpeed](https://wiki.facepunch.com/gmod/Player:GetRunSpeed) for sprinting speed and [Player:GetLadderClimbSpeed](https://wiki.facepunch.com/gmod/Player:GetLadderClimbSpeed) for ladder climb speed.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetSlowWalkSpeed)
---@return number # The new slow walking speed.
function Player:GetSlowWalkSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the maximum height player can step onto.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetStepSize)
---@return number # The maximum height player can get up onto without jumping, in hammer units.
function Player:GetStepSize() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's HEV suit power.
---
--- This will only work for the local player when used clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetSuitPower)
---@return number # The current suit power.
function Player:GetSuitPower() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the number of seconds that the player has been timing out for. You can check if a player is timing out with [Player:IsTimingOut](https://wiki.facepunch.com/gmod/Player:IsTimingOut).
---
--- **NOTE**: This function is relatively useless because it is tied to the value of the `sv_timeout` ConVar, which is irrelevant to the description above. [This is not considered as a bug](https://discord.com/channels/565105920414318602/567617926991970306/748970396224585738).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetTimeoutSeconds)
---@return number # Timeout seconds.
function Player:GetTimeoutSeconds() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns [TOOL](https://wiki.facepunch.com/gmod/Structures/TOOL) table of players current tool, or of the one specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetTool)
---@param mode? string Classname of the tool to retrieve. ( Filename of the tool in gmod_tool/stools/ )
---@return table # TOOL table, or nil if the table wasn't found or the player doesn't have a tool gun.
function Player:GetTool(mode) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a player's unduck speed (in seconds)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetUnDuckSpeed)
---@return number # unduck speed
function Player:GetUnDuckSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the entity the player would use if they would press their `+use` keybind.
--- 	**NOTE**: Because entity physics objects usually do not exist on the client, the client's use entity will resolve to whatever the crosshair is placed on within a little less than 72 units of the player's eye position. This differs from the entity returned by the server, which has fully physical use checking. See [util.TraceHull](https://wiki.facepunch.com/gmod/util.TraceHull).
---
--- Issue tracker: [5027](https://github.com/Facepunch/garrysmod-issues/issues/5027)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetUseEntity)
---@return Entity # The entity that would be used or NULL.
function Player:GetUseEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's user group. By default, player user groups are loaded from `garrysmod/settings/users.txt`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetUserGroup)
---@return string # The user group of the player. This will return `"user"` if player has no user group.
function Player:GetUserGroup() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the vehicle the player is driving.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetVehicle)
---@return Vehicle # The vehicle the player is currently driving, if any.
---
--- Returns NULL entity if the player is not driving.
function Player:GetVehicle() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the entity the player is using to see from (such as the player itself, the camera, or another entity).
--- 	**NOTE**: This function will return a [NULL Entity] until [Player:SetViewEntity](https://wiki.facepunch.com/gmod/Player:SetViewEntity) has been used
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetViewEntity)
---@return Entity # The entity the player is using to see from
function Player:GetViewEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's view model entity by the index.
--- Each player has 3 view models by default, but only the first one is used.
---
--- To use the other viewmodels in your SWEP, see [Entity:SetWeaponModel](https://wiki.facepunch.com/gmod/Entity:SetWeaponModel).
---
--- **NOTE**: In the Client [realm](https://wiki.facepunch.com/gmod/States), other players' viewmodels are not available unless they are being spectated.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetViewModel)
---@param index? number optional index of the view model to return, can range from 0 to 2
---@return Entity # The view model entity
function Player:GetViewModel(index) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the view offset of the player which equals the difference between the players actual position and their view.
---
--- See also [Player:GetViewOffsetDucked](https://wiki.facepunch.com/gmod/Player:GetViewOffsetDucked).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetViewOffset)
---@return Vector # New view offset, must be local vector to players Entity:GetPos
function Player:GetViewOffset() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the view offset of the player which equals the difference between the players actual position and their view when ducked.
---
--- See also [Player:GetViewOffset](https://wiki.facepunch.com/gmod/Player:GetViewOffset).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetViewOffsetDucked)
---@return Vector # New crouching view offset, must be local vector to players Entity:GetPos
function Player:GetViewOffsetDucked() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns players screen punch effect angle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetViewPunchAngles)
---@return Angle # The punch angle
function Player:GetViewPunchAngles() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns client's view punch velocity. See [Player:ViewPunch](https://wiki.facepunch.com/gmod/Player:ViewPunch) and [Player:SetViewPunchVelocity](https://wiki.facepunch.com/gmod/Player:SetViewPunchVelocity)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetViewPunchVelocity)
---@return Angle # The current view punch angle velocity.
function Player:GetViewPunchVelocity() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current voice volume scale for given player on client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetVoiceVolumeScale)
---@return number # The voice volume scale, where 0 is 0% and 1 is 100%.
function Player:GetVoiceVolumeScale() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's normal walking speed. Not sprinting, not slow walking. (+walk)
---
--- See also [Player:SetWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetWalkSpeed), [Player:GetMaxSpeed](https://wiki.facepunch.com/gmod/Player:GetMaxSpeed) and [Player:GetRunSpeed](https://wiki.facepunch.com/gmod/Player:GetRunSpeed).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed)
---@return number # The normal walking speed.
function Player:GetWalkSpeed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the weapon for the specified class
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetWeapon)
---@param className string Class name of weapon
---@return Weapon # The weapon for the specified class, or NULL ENTITY if the player does not have this weapon.
function Player:GetWeapon(className) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a player's weapon color. The part of the model that is colored is determined by the model itself, and is different for each model. The format is `Vector(r,g,b)`, and each color should be between 0 and 1.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetWeaponColor)
---@return Vector # color
function Player:GetWeaponColor() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table of the player's weapons.
--- **NOTE**: This function returns a sequential table. Prefer to loop it with [Global.ipairs](https://wiki.facepunch.com/gmod/Global.ipairs) instead of the [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GetWeapons)
---@return table # All the weapons the player currently has.
function Player:GetWeapons() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gives the player a weapon.
---
--- This function will call [GM:PlayerCanPickupWeapon](https://wiki.facepunch.com/gmod/GM:PlayerCanPickupWeapon). If that hook returns false, this function will do nothing.
---
--- **NOTE**: While this function is meant for weapons/pickupables only, it is **not** restricted to weapons. Any entity can be spawned using this function, including NPCs and SENTs.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Give)
---@param weaponClassName string Class name of weapon to give the player
---@param bNoAmmo? boolean Set to true to not give any ammo on weapon spawn. (Reserve ammo set by DefaultClip)
---@return Weapon # The weapon given to the player, if one was given. It will return NULL if the player already has the weapon, or the weapon entity (entity with given classname) doesn't exist.
function Player:Give(weaponClassName, bNoAmmo) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gives ammo to a player
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GiveAmmo)
---@param amount number Amount of ammo
---@param type string|number Type of ammo.
--- This is a string for named ammo types, and a number for ammo ID.
---
--- You can find a list of default ammo types Default_Ammo_Types.
---@param hidePopup? boolean Hide display popup when giving the ammo
---@return number # Ammo given.
function Player:GiveAmmo(amount, type, hidePopup) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Disables god mode on the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GodDisable)
function Player:GodDisable() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Enables god mode on the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:GodEnable)
function Player:GodEnable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player has god mode or not, contolled by [Player:GodEnable](https://wiki.facepunch.com/gmod/Player:GodEnable) and [Player:GodDisable](https://wiki.facepunch.com/gmod/Player:GodDisable).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:HasGodMode)
---@return boolean # Whether the player has god mode or not.
function Player:HasGodMode() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if the player has the specified weapon
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:HasWeapon)
---@param className string Class name of the weapon
---@return boolean # True if the player has the weapon
function Player:HasWeapon(className) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when the class object is created
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:Init)
function PLAYER:Init() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if the player is in a vehicle
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:InVehicle)
---@return boolean # Whether the player is in a vehicle.
function Player:InVehicle() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the player's IP address and connection port in ip:port form
--- **NOTE**: Returns `Error!` for bots.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IPAddress)
---@return string # The player's IP address and connection port
function Player:IPAddress() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is an admin or not. It will also return `true` if the player is [Player:IsSuperAdmin](https://wiki.facepunch.com/gmod/Player:IsSuperAdmin) by default.
---
--- Internally this is determined by [Player:IsUserGroup](https://wiki.facepunch.com/gmod/Player:IsUserGroup).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsAdmin)
---@return boolean # True if the player is an admin or a super admin.
function Player:IsAdmin() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if the player is an bot or not
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsBot)
---@return boolean # `true` if the player is a bot.
function Player:IsBot() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true from the point when the player is sending client info but not fully in the game until they disconnect.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsConnected)
---@return boolean # isConnected
function Player:IsConnected() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Used to find out if a player is currently 'driving' an entity (by which we mean 'right click > drive' ).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsDrivingEntity)
---@return boolean # A value representing whether or not the player is 'driving' an entity.
function Player:IsDrivingEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the players movement is currently frozen, controlled by [Player:Freeze](https://wiki.facepunch.com/gmod/Player:Freeze).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsFrozen)
---@return boolean # Whether the players movement is currently frozen or not.
function Player:IsFrozen() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the player identity was confirmed by the Steam network.
---
--- See also [GM:NetworkIDValidated](https://wiki.facepunch.com/gmod/GM:NetworkIDValidated).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsFullyAuthenticated)
---@return boolean # Whether the player has been fully authenticated or not.
---
--- This will always be true for singleplayer and the listen server host.
--- This will always be false for bots.
function Player:IsFullyAuthenticated() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if a player is the host of the current session.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsListenServerHost)
---@return boolean # `true` if the player is the listen server host, `false` otherwise.
---
--- This will always be `true` in single player, and `false` on a dedicated server.
function Player:IsListenServerHost() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether or not the player is voice muted locally.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsMuted)
---@return boolean # whether or not the player is muted locally.
function Player:IsMuted() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the player is playing a taunt.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsPlayingTaunt)
---@return boolean # Whether the player is playing a taunt.
function Player:IsPlayingTaunt() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the player is heard by the local player clientside, or if the player is speaking serverside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsSpeaking)
---@return boolean # Is the player speaking or not.
function Player:IsSpeaking() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is currently sprinting or not, specifically if they are holding their sprint key and are allowed to sprint.
---
--- This will not check if the player is currently sprinting into a wall. (i.e. holding their sprint key but not moving)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsSprinting)
---@return boolean # Is the player sprinting or not
function Player:IsSprinting() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the player is equipped with the suit item.
---
--- This will only work for the local player when used clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsSuitEquipped)
---@return boolean # Is the suit equipped or not.
function Player:IsSuitEquipped() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is a super admin.
---
--- Internally this is determined by [Player:IsUserGroup](https://wiki.facepunch.com/gmod/Player:IsUserGroup). See also [Player:IsAdmin](https://wiki.facepunch.com/gmod/Player:IsAdmin).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsSuperAdmin)
---@return boolean # True if the player is a super admin.
function Player:IsSuperAdmin() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns `true` if the player is timing out (i.e. is losing connection), `false` otherwise.
---
--- A player is considered timing out when more than 4 seconds has elapsed since a network packet was received from given player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsTimingOut)
---@return boolean # Whether the player is timing out.
function Player:IsTimingOut() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is typing in their chat.
---
--- This may not work properly if the server uses a custom chatbox.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsTyping)
---@return boolean # Whether the player is typing in their chat or not.
function Player:IsTyping() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is in specified group or not. See [Player:GetUserGroup](https://wiki.facepunch.com/gmod/Player:GetUserGroup) for a way to get player's user group.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsUserGroup)
---@param groupName string Group to check the player for.
---@return boolean # `true` if the player has the given user group.
function Player:IsUserGroup(groupName) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns if the player can be heard by the local player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsVoiceAudible)
---@return boolean # isAudible
function Player:IsVoiceAudible() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if the player currently walking. (`+walk` keybind)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsWalking)
---@return boolean # `true` if the player is currently walking.
function Player:IsWalking() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the player is using the world clicking feature, see [Panel:SetWorldClicker](https://wiki.facepunch.com/gmod/Panel:SetWorldClicker)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsWorldClicking)
---@return boolean # Is the player world clicking or not.
function Player:IsWorldClicking() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the world clicking is disabled for given player or not. See [Player:DisableWorldClicking](https://wiki.facepunch.com/gmod/Player:DisableWorldClicking).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:IsWorldClickingDisabled)
---@return boolean # Whether the world clicking is disabled or not.
function Player:IsWorldClickingDisabled() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether a key is down. This is not networked to other players, meaning only the local client can see the keys they are pressing.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:KeyDown)
---@param key number The key, see Enums/IN
---@return boolean # whether the key is down or not.
function Player:KeyDown(key) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets whether a key was down one tick ago.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:KeyDownLast)
---@param key number The key, see Enums/IN
---@return boolean # Is key down ?
function Player:KeyDownLast(key) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets whether a key was just pressed this tick.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:KeyPressed)
---@param key number Corresponds to an Enums/IN. You can use bit.bor here (see example 2)
---@return boolean # Was pressed or not
function Player:KeyPressed(key) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets whether a key was just released this tick.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:KeyReleased)
---@param key number The key, see Enums/IN
---@return boolean # Was released or not
function Player:KeyReleased(key) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Kicks the player from the server.
--- **NOTE**: This can not be run before the player has fully joined in. Use [game.KickID](https://wiki.facepunch.com/gmod/game.KickID) for that.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Kick)
---@param reason? string Reason to show for disconnection.
---
--- This will be shortened to ~512 chars, though this includes the command itself and the player index so will realistically be more around ~498. It is recommended to avoid going near the limit to avoid truncation.
function Player:Kick(reason) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Kills a player and calls [GM:PlayerDeath](https://wiki.facepunch.com/gmod/GM:PlayerDeath).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Kill)
function Player:Kill() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Kills a player without notifying the rest of the server.
---
--- This will call [GM:PlayerSilentDeath](https://wiki.facepunch.com/gmod/GM:PlayerSilentDeath) instead of [GM:PlayerDeath](https://wiki.facepunch.com/gmod/GM:PlayerDeath).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:KillSilent)
function Player:KillSilent() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) This allows the server to mitigate the lag of the player by moving back all the entities that can be lag compensated to the time the player attacked with his weapon.
---
--- This technique is most commonly used on things that hit other entities instantaneously, such as traces.
---
--- **NOTE**: [Entity:FireBullets](https://wiki.facepunch.com/gmod/Entity:FireBullets) calls this function internally.
---
--- Lag compensation only works for players and entities that have been enabled with [Entity:SetLagCompensated](https://wiki.facepunch.com/gmod/Entity:SetLagCompensated)
---
--- Despite being defined shared, it can only be used server-side in a [Predicted Hook](https://wiki.facepunch.com/gmod/~search?q=%3Cpredicted%3EYes).
---
--- **WARNING**: This function NEEDS to be disabled after you're done with it or it will break the movement of the entities affected!
---
--- Lag compensation does not support pose parameters.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:LagCompensation)
---@param lagCompensation boolean The state of the lag compensation, true to enable and false to disable.
function Player:LagCompensation(lagCompensation) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the hitgroup where the player was last hit.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:LastHitGroup)
---@return number # Hitgroup, see Enums/HITGROUP
function Player:LastHitGroup() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Shows "limit hit" notification in sandbox.
--- **NOTE**: This function is only available in Sandbox and its derivatives.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:LimitHit)
---@param type string Type of hit limit.
function Player:LimitHit(type) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called on spawn to give the player their default loadout
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:Loadout)
function PLAYER:Loadout() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the direction a player is looking as a entity/local-oriented angle.
---
--- Unlike [Entity:EyeAngles](https://wiki.facepunch.com/gmod/Entity:EyeAngles), this function does not include angles of the Player's [Entity:GetParent](https://wiki.facepunch.com/gmod/Entity:GetParent).
---
--- Does not work correctly clientside for non local players when in a vehicle. (validate: when parented in general?)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:LocalEyeAngles)
---@return Angle # The local eye angles.
function Player:LocalEyeAngles() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Stops a player from using any inputs, such as moving, turning, or attacking. Key binds are still called. Similar to [Player:Freeze](https://wiki.facepunch.com/gmod/Player:Freeze) but the player takes no damage.
---
--- Adds the [FL_FROZEN](https://wiki.facepunch.com/gmod/Enums/FL) and [FL_GODMODE](https://wiki.facepunch.com/gmod/Enums/FL) flags to the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Lock)
function Player:Lock() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the position of a Kinect bone.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:MotionSensorPos)
---@param bone number Bone to get the position of. Must be from 0 to 19.
---@return Vector # Position of the bone.
function Player:MotionSensorPos(bone) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called from [GM:Move](https://wiki.facepunch.com/gmod/GM:Move).
---
--- **WARNING**: This hook will not work if the current gamemode overrides [GM:Move](https://wiki.facepunch.com/gmod/GM:Move) and does not call this hook.
---
--- **NOTE**: This hook is run after the [drive.Move](https://wiki.facepunch.com/gmod/drive.Move) has been called.
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:Move)
---@param mv CMoveData Movement information
---@return boolean # Return true to prevent default action
function PLAYER:Move(mv) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's name. Identical to [Player:Nick](https://wiki.facepunch.com/gmod/Player:Nick) and [Player:GetName](https://wiki.facepunch.com/gmod/Player:GetName).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Name)
---@return string # Player's name.
function Player:Name() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's name. Identical to [Player:Name](https://wiki.facepunch.com/gmod/Player:Name) and [Player:GetName](https://wiki.facepunch.com/gmod/Player:GetName).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Nick)
---@return string # Player's name
function Player:Nick() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the 64-bit SteamID aka CommunityID of the Steam Account that owns the Garry's Mod license this player is using. This is useful for detecting players using Steam Family Sharing.
---
--- If player is not using Steam Family Sharing, this will return the player's actual SteamID64().
---
--- **NOTE**: This data will only be available after the player has fully authenticated with Steam. See [Player:IsFullyAuthenticated](https://wiki.facepunch.com/gmod/Player:IsFullyAuthenticated).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:OwnerSteamID64)
---@return string # The 64bit SteamID
function Player:OwnerSteamID64() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the percentage of packets lost by the client. It is not networked so it only returns 0 when run clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:PacketLoss)
---@return number # Percentage of packets lost (0-100)
function Player:PacketLoss() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Unfreezes the props player is looking at. This is essentially the same as pressing reload with the physics gun, including double press for unfreeze all.
---
--- For freezing props, use [PhysObj:EnableMotion](https://wiki.facepunch.com/gmod/PhysObj:EnableMotion).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:PhysgunUnfreeze)
---@return number # Number of props unfrozen.
function Player:PhysgunUnfreeze() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) This makes the player hold (same as pressing E on a small prop) given entity.
---
--- Not to be confused with picking up items like ammo or health kits.
---
--- This picks up the passed entity regardless of its mass or distance from the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:PickupObject)
---@param entity Entity Entity to pick up.
function Player:PickupObject(entity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the player to pickup an existing weapon entity. The player will not pick up the weapon if they already own a weapon of given type, or if the player could not normally have this weapon in their inventory.
---
--- This function **will** bypass [GM:PlayerCanPickupWeapon](https://wiki.facepunch.com/gmod/GM:PlayerCanPickupWeapon).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:PickupWeapon)
---@param wep Weapon The weapon to try to pick up.
---@param ammoOnly? boolean If set to true, the player will only attempt to pick up the ammo from the weapon. The weapon will not be picked up even if the player doesn't have a weapon of this type, and the weapon will be removed if the player picks up any ammo from it.
---@return boolean # Whether the player succeeded in picking up the weapon or not.
function Player:PickupWeapon(wep, ammoOnly) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's ping to server.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Ping)
---@return number # The player's ping.
function Player:Ping() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Plays the correct step sound according to what the player is staying on.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:PlayStepSound)
---@param volume number Volume for the sound, in range from 0 to 1
function Player:PlayStepSound(volume) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called after the viewmodel has been drawn
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:PostDrawViewModel)
---@param viewmodel Entity The viewmodel
---@param weapon Entity The weapon
function PLAYER:PostDrawViewModel(viewmodel, weapon) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called before the viewmodel is drawn
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:PreDrawViewModel)
---@param viewmodel Entity The viewmodel
---@param weapon Entity The weapon
function PLAYER:PreDrawViewModel(viewmodel, weapon) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays a message either in their chat, console, or center of the screen. See also [Global.PrintMessage](https://wiki.facepunch.com/gmod/Global.PrintMessage).
---
--- **NOTE**: When called serverside, this uses the archaic user message system (the [umsg](https://wiki.facepunch.com/gmod/umsg)) and hence is limited to ≈250 characters.
---
--- `HUD_PRINTCENTER` will not work when this is called clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:PrintMessage)
---@param type number Which type of message should be sent to the player (Enums/HUD).
---@param message string Message to be sent to the player.
function Player:PrintMessage(type, message) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes all ammo from a certain player
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:RemoveAllAmmo)
function Player:RemoveAllAmmo() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes all weapons and ammo from the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:RemoveAllItems)
function Player:RemoveAllItems() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Removes the amount of the specified ammo from the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:RemoveAmmo)
---@param ammoCount number The amount of ammunition to remove.
---@param ammoName string|number The name of the ammunition to remove from. This can also be a number ammoID.
function Player:RemoveAmmo(ammoCount, ammoName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Removes a **P**ersistent **Data** key-value pair from the SQL database. (`sv.db` when called on server, `cl.db` when called on client)
---
--- Internally uses the [sql](https://wiki.facepunch.com/gmod/sql) library. See [util.RemovePData](https://wiki.facepunch.com/gmod/util.RemovePData) for cases when the player is not currently on the server.
---
--- **NOTE**: This function internally uses [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64), it previously utilized [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) which can cause collisions (two or more players sharing the same PData entry). [Player:SetPData](https://wiki.facepunch.com/gmod/Player:SetPData) now replaces all instances of [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64) when running [Player:SetPData](https://wiki.facepunch.com/gmod/Player:SetPData)
---
--- **NOTE**: PData is not networked from servers to clients!
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:RemovePData)
---@param key string Key to remove
---@return boolean # true is succeeded, false otherwise
function Player:RemovePData(key) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Strips the player's suit item.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:RemoveSuit)
function Player:RemoveSuit() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Resets both normal and duck hulls to their default values.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ResetHull)
function Player:ResetHull() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the player to say whatever the first argument is. Works on bots too.
---
--- **NOTE**: This function ignores the default chat message cooldown
---
--- **WARNING**: The argument can only contain 126 characters. [Source SDK 2013](https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/game/server/client.cpp#L84-L86)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Say)
---@param text string The text to force the player to say.
---@param teamOnly? boolean Whether to send this message to our own team only.
function Player:Say(text, teamOnly) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Fades the screen
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ScreenFade)
---@param flags number Fade flags defined with Enums/SCREENFADE.
---@param color? Color The color of the screenfade
---@param fadeTime number Fade(in/out) effect transition time ( From no fade to full fade and vice versa ).
---
--- This is limited to 7 bits integer part and 9 bits fractional part.
---@param fadeHold number Fade effect hold time.
---
--- This is limited to 7 bits integer part and 9 bits fractional part.
function Player:ScreenFade(flags, color, fadeTime, fadeHold) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the active weapon of the player by its class name.
---
--- **WARNING**: This will switch the weapon out of prediction, causing delay on the client and [WEAPON:Deploy](https://wiki.facepunch.com/gmod/WEAPON:Deploy) and [WEAPON:Holster](https://wiki.facepunch.com/gmod/WEAPON:Holster) to be called out of prediction. Try using [CUserCmd:SelectWeapon](https://wiki.facepunch.com/gmod/CUserCmd:SelectWeapon) or [input.SelectWeapon](https://wiki.facepunch.com/gmod/input.SelectWeapon), instead.
---
--- **NOTE**: This will trigger the weapon switch event and associated animations. To switch weapons silently, use [Player:SetActiveWeapon](https://wiki.facepunch.com/gmod/Player:SetActiveWeapon).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SelectWeapon)
---@param className string The class name of the weapon to switch to.
---
--- If the player doesn't have the specified weapon, nothing will happen. You can use Player:Give to give the weapon first.
function Player:SelectWeapon(className) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sends a hint to a player.
---
--- **NOTE**: This function is only available in Sandbox and its derivatives. Since this adds `#Hint_` to the beginning of each message, you should only use it with default hint messages, or those cached with [language.Add](https://wiki.facepunch.com/gmod/language.Add). For hints with custom text, look at [notification.AddLegacy](https://wiki.facepunch.com/gmod/notification.AddLegacy).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SendHint)
---@param name string Name/class/index of the hint. You can find a list of hint names for this function List_of_Hint_Classes.
---@param delay number Delay in seconds before showing the hint
function Player:SendHint(name, delay) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Executes a simple Lua string on the player.
--- **NOTE**: If you need to use this function more than once consider using [net](https://wiki.facepunch.com/gmod/net) library. Send net message and make the entire code you want to execute in [net.Receive](https://wiki.facepunch.com/gmod/net.Receive) on client.
---
--- **NOTE**: The string is limited to 254 bytes. Consider using the [net library](https://wiki.facepunch.com/gmod/Net_Library_Usage) for more advanced server-client interaction.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SendLua)
---@param script string The script to execute.
function Player:SendLua(script) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the player's active weapon. You should use [CUserCmd:SelectWeapon](https://wiki.facepunch.com/gmod/CUserCmd:SelectWeapon) or [Player:SelectWeapon](https://wiki.facepunch.com/gmod/Player:SelectWeapon), instead in most cases.
---
--- This function will not trigger the weapon switch events or associated equip animations. It will bypass
---  [GM:PlayerSwitchWeapon](https://wiki.facepunch.com/gmod/GM:PlayerSwitchWeapon) and the currently active weapon's [WEAPON:Holster](https://wiki.facepunch.com/gmod/WEAPON:Holster) return value.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetActiveWeapon)
---@param weapon Weapon The weapon to equip.
function Player:SetActiveWeapon(weapon) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the player's activity.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetActivity)
---@param act number The new activity to set. See Enums/ACT.
function Player:SetActivity(act) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Set if the players' model is allowed to rotate around the pitch and roll axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetAllowFullRotation)
---@param Allowed boolean Allowed to rotate
function Player:SetAllowFullRotation(Allowed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Allows player to use their weapons in a vehicle. You need to call this before entering a vehicle.
---
--- Shooting in a vehicle fires two bullets.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetAllowWeaponsInVehicle)
---@param allow boolean Show we allow player to use their weapons in a vehicle or not.
function Player:SetAllowWeaponsInVehicle(allow) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the amount of the specified ammo for the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetAmmo)
---@param ammoCount number The amount of ammunition to set.
---@param ammoType any The ammunition type. Can be either number ammo ID or string ammo name. See Default Ammo Types for default values.
function Player:SetAmmo(ammoCount, ammoType) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the player armor value.
---
--- See [GM:HandlePlayerArmorReduction](https://wiki.facepunch.com/gmod/GM:HandlePlayerArmorReduction) for a hook that allows manipulating what armor does.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetArmor)
---@param amount number The amount to set the armor value of the player to.
function Player:SetArmor(amount) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Pushes the player away from other players whenever the player inside another players' bounding box.
---
--- This avoidance is performed clientside by altering movement sent to server.
---
--- This applies to players within a single team. ([Player:Team](https://wiki.facepunch.com/gmod/Player:Team))
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetAvoidPlayers)
---@param avoidPlayers boolean Whether to avoid teammates, or not.
function Player:SetAvoidPlayers(avoidPlayers) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Set if the player should be allowed to walk using the (default) alt key. (`+walk` keybind)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetCanWalk)
---@param canWalk boolean `true` allows the player to walk.
function Player:SetCanWalk(canWalk) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets whether the player can use the HL2 suit zoom (`+zoom` bind) or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetCanZoom)
---@param canZoom boolean Whether to make the player able or unable to zoom.
function Player:SetCanZoom(canZoom) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: Use [player_manager.SetPlayerClass](https://wiki.facepunch.com/gmod/player_manager.SetPlayerClass) instead.
---
--- Sets the player's class id.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetClassID)
---@param classID number The class id the player is being set with.
function Player:SetClassID(classID) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the crouched walk speed multiplier.
---
--- Has no effect for values above 1.
---
--- See also [Player:SetWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetWalkSpeed) and [Player:GetCrouchedWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetCrouchedWalkSpeed).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetCrouchedWalkSpeed)
---@param speed number The walk speed multiplier that crouch speed should be.
function Player:SetCrouchedWalkSpeed(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the **actual** view offset which equals the difference between the players actual position and their view when standing.
---
--- Do not confuse with [Player:SetViewOffset](https://wiki.facepunch.com/gmod/Player:SetViewOffset) and [Player:SetViewOffsetDucked](https://wiki.facepunch.com/gmod/Player:SetViewOffsetDucked)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetCurrentViewOffset)
---@param viewOffset Vector The new view offset.
function Player:SetCurrentViewOffset(viewOffset) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets a player's death count
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetDeaths)
---@param deathCount number Number of deaths (positive or negative)
function Player:SetDeaths(deathCount) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the driving entity and driving mode.
---
--- Use [drive.PlayerStartDriving](https://wiki.facepunch.com/gmod/drive.PlayerStartDriving) instead, see [Entity Driving](https://wiki.facepunch.com/gmod/Entity_Driving).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetDrivingEntity)
---@param drivingEntity? Entity The entity the player should drive.
---@param drivingMode number The driving mode index.
function Player:SetDrivingEntity(drivingEntity, drivingMode) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Activates a given DSP (Digital Signal Processor) effect on all sounds that the player hears. This is equivalent to setting `dsp_player` convar on the player.
---
--- To apply a DSP effect to individual sounds, see [CSoundPatch:SetDSP](https://wiki.facepunch.com/gmod/CSoundPatch:SetDSP)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetDSP)
---@param dspEffectId number The index of the DSP sound filter to apply.
---
--- For a list of the available IDs and their meaning, see DSP_Presets.
---@param fastReset boolean If set to true the sound filter will be removed faster.
---
--- 	**This only works clientside**
--- 	If used serverside, a message will be displayed (`SetPlayerDSP: fastReset only valid from client`) in the server console.
function Player:SetDSP(dspEffectId, fastReset) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets how quickly a player ducks.
---
--- This will not work for values >= 1.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetDuckSpeed)
---@param duckSpeed number How quickly the player will duck.
function Player:SetDuckSpeed(duckSpeed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the local angle of the player's view (may rotate body too if angular difference is large)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetEyeAngles)
---@param angle Angle Angle to set the view to
function Player:SetEyeAngles(angle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Set a player's FOV (Field Of View) over a certain amount of time.
---
--- This is meant to be called on the server or shared (for prediction), it will have no effect if called clientside only. You may want to use [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView) for that instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetFOV)
---@param fov number the angle of perception (FOV). Set to 0 to return to default user FOV. ( Which is ranging from 75 to 100, depending on user settings )
---@param time? number the time it takes to transition to the FOV expressed in a floating point.
---@param requester? Entity The requester or "owner" of the zoom event. Only this entity will be able to change the player's FOV until it is set back to 0.
function Player:SetFOV(fov, time, requester) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets a player's frags (kills)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetFrags)
---@param fragCount number Number of frags (positive or negative)
function Player:SetFrags(fragCount) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the hands entity of a player.
---
--- The hands entity is an entity introduced in Garry's Mod 13 and it's used to show the player's hands attached to the viewmodel.
--- This is similar to the approach used in L4D and CS:GO, for more information on how to implement this system in your gamemode visit [Using Viewmodel Hands](https://wiki.facepunch.com/gmod/Using_Viewmodel_Hands).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetHands)
---@param hands Entity The hands entity to set
function Player:SetHands(hands) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the widget that is currently hovered by the player's mouse.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetHoveredWidget)
---@param widget? Entity The widget entity that the player is hovering.
function Player:SetHoveredWidget(widget) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the size of the [Player's](https://wiki.facepunch.com/gmod/Player) [Axis-Aligned Bounding Box (AABB)](https://en.wikipedia.org/wiki/Minimum_bounding_box) used for physics and movement [Hull Traces](https://wiki.facepunch.com/gmod/util.TraceHull).
---
--- See also: [Player:GetHull](https://wiki.facepunch.com/gmod/Player:GetHull), [Player:SetHullDuck](https://wiki.facepunch.com/gmod/Player:SetHullDuck), [Player:GetHullDuck](https://wiki.facepunch.com/gmod/Player:GetHullDuck)
---
--- **NOTE**: This value is **not** replicated automatically to clients and must be manually called in both the Server and Client [Realms](https://wiki.facepunch.com/gmod/States).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetHull)
---@param mins Vector The hull mins, the lowest corner of the Player's bounding box.
---@param maxs Vector The hull maxs, the highest corner of the Player's bounding box, opposite of the mins.
function Player:SetHull(mins, maxs) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the size of the [Player's](https://wiki.facepunch.com/gmod/Player) [Axis-Aligned Bounding Box (AABB)](https://en.wikipedia.org/wiki/Minimum_bounding_box) used for physics and movement [Hull Traces](https://wiki.facepunch.com/gmod/util.TraceHull) while they are crouching (or "Ducking").
---
--- See also: [Player:GetHullDuck](https://wiki.facepunch.com/gmod/Player:GetHullDuck), [Player:GetHull](https://wiki.facepunch.com/gmod/Player:GetHull), [Player:SetHull](https://wiki.facepunch.com/gmod/Player:SetHull)
---
--- **NOTE**: This value is **not** replicated automatically to clients and must be manually called in both the Server and Client [Realms](https://wiki.facepunch.com/gmod/States).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetHullDuck)
---@param mins Vector The hull mins, the lowest corner of the Player's bounding box while crouching.
---@param maxs Vector The hull maxs, the highest corner of the Player's crouching bounding box, opposite of the mins.
function Player:SetHullDuck(mins, maxs) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the jump power, eg. the velocity that will be applied to the player when they jump.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetJumpPower)
---@param jumpPower number The new jump velocity.
function Player:SetJumpPower(jumpPower) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the player's ladder climbing speed.
---
--- See [Player:SetWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetWalkSpeed) for normal walking speed, [Player:SetRunSpeed](https://wiki.facepunch.com/gmod/Player:SetRunSpeed) for sprinting speed and [Player:SetSlowWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetSlowWalkSpeed) for slow walking speed.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetLadderClimbSpeed)
---@param speed number The ladder climbing speed.
function Player:SetLadderClimbSpeed(speed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Slows down the player movement simulation by the timescale, this is used internally in the HL2 weapon stripping sequence.
---
--- It achieves such behavior by multiplying the [Global.FrameTime](https://wiki.facepunch.com/gmod/Global.FrameTime) by the specified timescale at the start of the movement simulation and then restoring it afterwards.
---
--- **NOTE**: This is reset to 1 on spawn.
---
--- There is no weapon counterpart to this, you'll have to hardcode the multiplier in the weapon or call [Weapon:SetNextPrimaryFire](https://wiki.facepunch.com/gmod/Weapon:SetNextPrimaryFire) / [Weapon:SetNextSecondaryFire](https://wiki.facepunch.com/gmod/Weapon:SetNextSecondaryFire) manually.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetLaggedMovementValue)
---@param timescale number The timescale multiplier.
function Player:SetLaggedMovementValue(timescale) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the hitgroup where the player was last hit.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetLastHitGroup)
---@param hitgroup number The hitgroup to set as the "last hit", see Enums/HITGROUP.
function Player:SetLastHitGroup(hitgroup) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the maximum amount of armor the player should have. This affects default built-in armor pickups, but not [Player:SetArmor](https://wiki.facepunch.com/gmod/Player:SetArmor).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetMaxArmor)
---@param maxarmor number The new max armor value.
function Player:SetMaxArmor(maxarmor) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the maximum speed which the player can move at.
---
--- **NOTE**: This is called automatically by the engine. If you wish to limit player speed without setting their run/sprint speeds, see [CMoveData:SetMaxClientSpeed](https://wiki.facepunch.com/gmod/CMoveData:SetMaxClientSpeed).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetMaxSpeed)
---@param walkSpeed number The maximum speed.
function Player:SetMaxSpeed(walkSpeed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when we need to set player model from the class.
---
--- **NOTE**: This will only be called if you have not overridden [GM:PlayerSetModel](https://wiki.facepunch.com/gmod/GM:PlayerSetModel) or call this function from it or anywhere else using [player_manager.RunClass](https://wiki.facepunch.com/gmod/player_manager.RunClass)
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:SetModel)
function PLAYER:SetModel() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets if the player should be voicechat muted locally.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetMuted)
---@param mute boolean Mute or unmute.
function Player:SetMuted(mute) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets whenever the player should not collide with their teammates, based on their [Player:Team](https://wiki.facepunch.com/gmod/Player:Team).
---
--- **NOTE**: This will only work for teams with ID 1 to 4 due to internal Engine limitations.
---
--- **NOTE**: This causes traces with [COLLISION_GROUP_PLAYER](https://wiki.facepunch.com/gmod/Enums/COLLISION_GROUP) to pass through players.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetNoCollideWithTeammates)
---@param shouldNotCollide boolean `true` to disable, `false` to enable collision.
function Player:SetNoCollideWithTeammates(shouldNotCollide) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the players visibility towards NPCs.
---
--- Internally this toggles the [FL_NOTARGET](https://wiki.facepunch.com/gmod/Enums/FL) flag, which you can manually test for using [Entity:IsFlagSet](https://wiki.facepunch.com/gmod/Entity:IsFlagSet)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetNoTarget)
---@param visibility boolean The visibility.
function Player:SetNoTarget(visibility) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the players observer mode. You must start the spectating first with [Player:Spectate](https://wiki.facepunch.com/gmod/Player:Spectate).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetObserverMode)
---@param mode number Spectator mode using Enums/OBS_MODE.
function Player:SetObserverMode(mode) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Writes a **P**ersistent **Data** key-value pair to the SQL database. (`sv.db` when called on server, `cl.db` when called on client)
---
--- Internally uses the [sql](https://wiki.facepunch.com/gmod/sql) library. See [util.SetPData](https://wiki.facepunch.com/gmod/util.SetPData) for cases when the player is not currently on the server.
---
--- **NOTE**: This function internally uses [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64), it previously utilized [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) which could have caused collisions (two or more players sharing the same PData entry). [Player:SetPData](https://wiki.facepunch.com/gmod/Player:SetPData) now replaces all instances of [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64) when running [Player:SetPData](https://wiki.facepunch.com/gmod/Player:SetPData)
---
--- **NOTE**: PData is not networked from servers to clients!
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetPData)
---@param key string Name of the PData key
---@param value any Value to write to the key (**must** be an SQL valid data type, such as a string or integer)
---@return boolean # Whether the operation was successful or not
function Player:SetPData(key, value) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the player model's color. The part of the model that is colored is determined by the model itself, and is different for each model.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetPlayerColor)
---@param Color Vector This is the color to be set. The format is Vector(r, g, b), and each color should be between 0 and 1.
function Player:SetPlayerColor(Color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the widget that is currently in use by the player's mouse.
---
--- Having a pressed widget stops the player from firing their weapon to allow input to be passed onto the widget.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetPressedWidget)
---@param pressedWidget? Entity The widget the player is currently using.
function Player:SetPressedWidget(pressedWidget) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the render angles of a player. Value set by this function is reset to player's angles ([Entity:GetAngles](https://wiki.facepunch.com/gmod/Entity:GetAngles)) right after [GM:UpdateAnimation](https://wiki.facepunch.com/gmod/GM:UpdateAnimation).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetRenderAngles)
---@param ang Angle The new render angles to set
function Player:SetRenderAngles(ang) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the player's sprint speed.
---
--- See also [Player:GetRunSpeed](https://wiki.facepunch.com/gmod/Player:GetRunSpeed), [Player:SetWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetWalkSpeed) and [Player:SetMaxSpeed](https://wiki.facepunch.com/gmod/Player:SetMaxSpeed).
--- **NOTE**: player_default class run speed is: `240`
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetRunSpeed)
---@param runSpeed number The new sprint speed when `sv_friction` is below `10`. Higher `sv_friction` values will result in slower speed.
---
--- Has to be `7` or above or the player **won't** be able to move.
function Player:SetRunSpeed(runSpeed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the player's slow walking speed, which is activated via +WALK keybind.
---
--- See [Player:SetWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetWalkSpeed) for normal walking speed, [Player:SetRunSpeed](https://wiki.facepunch.com/gmod/Player:SetRunSpeed) for sprinting speed and [Player:SetLadderClimbSpeed](https://wiki.facepunch.com/gmod/Player:SetLadderClimbSpeed) for ladder climb speed.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetSlowWalkSpeed)
---@param speed number The new slow walking speed.
function Player:SetSlowWalkSpeed(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the maximum height a player can step onto without jumping.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetStepSize)
---@param stepHeight number The new maximum height the player can step onto without jumping
function Player:SetStepSize(stepHeight) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the player's HEV suit power.
---
--- This will only work for the local player when used clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetSuitPower)
---@param power number The new suit power.
function Player:SetSuitPower(power) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets whenever to suppress the pickup notification for the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetSuppressPickupNotices)
---@param doSuppress boolean Whenever to suppress the notice or not.
function Player:SetSuppressPickupNotices(doSuppress) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the player to the chosen team. The value is networked to clients at reduced bit count (16 bits) as as a signed value, so the real range is [-32768, 32767].
---
--- Can be retrieved via [Player:Team](https://wiki.facepunch.com/gmod/Player:Team)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetTeam)
---@param team number The team that the player is being set to.
function Player:SetTeam(team) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets how quickly a player un-ducks
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetUnDuckSpeed)
---@param UnDuckSpeed number How quickly the player will un-duck
function Player:SetUnDuckSpeed(UnDuckSpeed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Setup the network table accessors.
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:SetupDataTables)
function PLAYER:SetupDataTables() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets up the player's hands for the viewmodel. Calls [GM:PlayerSetHandsModel](https://wiki.facepunch.com/gmod/GM:PlayerSetHandsModel) to determine the model. If no entity is provided, uses the player's own hands model. If spectating another entity, pass that entity to use its hands model instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetupHands)
---@param ent? Entity If the player is spectating an entity, this should be the entity the player is spectating, so we can use its hands model instead.
function Player:SetupHands(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the usergroup of the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetUserGroup)
---@param groupName string The user group of the player.
function Player:SetUserGroup(groupName) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Attaches the players view to the position and angles of the specified entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetViewEntity)
---@param viewEntity Entity The entity to attach the player view to.
function Player:SetViewEntity(viewEntity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the **desired** view offset which equals the difference between the players actual position and their view when standing.
---
--- If you want to set **actual** view offset, use [Player:SetCurrentViewOffset](https://wiki.facepunch.com/gmod/Player:SetCurrentViewOffset)
---
--- See also [Player:SetViewOffsetDucked](https://wiki.facepunch.com/gmod/Player:SetViewOffsetDucked) for **desired** view offset when crouching.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetViewOffset)
---@param viewOffset Vector The new desired view offset when standing.
function Player:SetViewOffset(viewOffset) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the **desired** view offset which equals the difference between the players actual position and their view when crouching.
---
--- If you want to set **actual** view offset, use [Player:SetCurrentViewOffset](https://wiki.facepunch.com/gmod/Player:SetCurrentViewOffset)
---
--- See also [Player:SetViewOffset](https://wiki.facepunch.com/gmod/Player:SetViewOffset) for **desired** view offset when standing.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetViewOffsetDucked)
---@param viewOffset Vector The new desired view offset when crouching.
function Player:SetViewOffsetDucked(viewOffset) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets client's view punch angle, but not the velocity. See [Player:ViewPunch](https://wiki.facepunch.com/gmod/Player:ViewPunch)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetViewPunchAngles)
---@param punchAngle Angle The angle to set.
function Player:SetViewPunchAngles(punchAngle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets client's view punch velocity. See [Player:ViewPunch](https://wiki.facepunch.com/gmod/Player:ViewPunch) and [Player:SetViewPunchAngles](https://wiki.facepunch.com/gmod/Player:SetViewPunchAngles)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetViewPunchVelocity)
---@param punchVel Angle The angle velocity to set.
function Player:SetViewPunchVelocity(punchVel) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the voice volume scale for given player on client. This value will persist from server to server, but will be reset when the game is shut down.
---
--- **NOTE**: This doesn't work on bots, their scale will always be `1`. Does not work with multiruns.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetVoiceVolumeScale)
---@param number number The voice volume scale, where `0` is 0% and `1` is 100%.
function Player:SetVoiceVolumeScale(number) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the player's normal walking speed. Not sprinting, not slow walking +walk.
---
--- See also [Player:SetSlowWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetSlowWalkSpeed), [Player:GetWalkSpeed](https://wiki.facepunch.com/gmod/Player:GetWalkSpeed), [Player:SetCrouchedWalkSpeed](https://wiki.facepunch.com/gmod/Player:SetCrouchedWalkSpeed), [Player:SetMaxSpeed](https://wiki.facepunch.com/gmod/Player:SetMaxSpeed) and [Player:SetRunSpeed](https://wiki.facepunch.com/gmod/Player:SetRunSpeed).
---
--- Using a speed of `0` can lead to prediction errors, and can cause players to move at sv_maxvelocity
---
--- **NOTE**: `player_default` class walk speed is: `200`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetWalkSpeed)
---@param walkSpeed number The new walk speed when `sv_friction` is below `10`. Higher `sv_friction` values will result in slower speed.
---
--- Has to be `7` or above or the player **won't** be able to move.
function Player:SetWalkSpeed(walkSpeed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the player weapon's color. The part of the model that is colored is determined by the model itself, and is different for each model.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SetWeaponColor)
---@param Color Vector This is the color to be set. The format is Vector(r,g,b), and each color should be between 0 and 1.
function Player:SetWeaponColor(Color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether the player's player model will be drawn at the time the function is called.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ShouldDrawLocalPlayer)
---@return boolean # `true` if the player's playermodel is visible
function Player:ShouldDrawLocalPlayer() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether the player's current weapon should drop on death.
---
--- **NOTE**: This is reset on spawn to the [player class](https://wiki.facepunch.com/gmod/Player_Classes)'s **DropWeaponOnDie** field by [player_manager.OnPlayerSpawn](https://wiki.facepunch.com/gmod/player_manager.OnPlayerSpawn).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ShouldDropWeapon)
---@param drop boolean Whether to drop the player's current weapon or not
function Player:ShouldDropWeapon(drop) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Opens the player steam profile page in the steam overlay browser.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ShowProfile)
function Player:ShowProfile() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Signals the entity that it was dropped by the gravity gun.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SimulateGravGunDrop)
---@param ent Entity Entity that was dropped.
function Player:SimulateGravGunDrop(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Signals the entity that it was picked up by the gravity gun. This call is only required if you want to simulate the situation of picking up objects.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SimulateGravGunPickup)
---@param ent Entity The entity picked up
---@param lightning? boolean Whether or not to show lightning effects around the entity
function Player:SimulateGravGunPickup(ent, lightning) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the player spawns
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:Spawn)
function PLAYER:Spawn() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts spectate mode for given player. This will also affect the players movetype in some cases.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Spectate)
---@param mode number Spectate mode, see Enums/OBS_MODE.
function Player:Spectate(mode) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes the player spectate the entity.
---
--- To get the applied spectated entity, use [Player:GetObserverTarget](https://wiki.facepunch.com/gmod/Player:GetObserverTarget).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SpectateEntity)
---@param entity Entity Entity to spectate.
function Player:SpectateEntity(entity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes a player spray their decal.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SprayDecal)
---@param sprayOrigin Vector The location to spray from
---@param sprayEndPos Vector The location to spray to
function Player:SprayDecal(sprayOrigin, sprayEndPos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Disables the sprint on the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SprintDisable)
function Player:SprintDisable() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Enables the sprint on the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SprintEnable)
function Player:SprintEnable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called from [GM:CreateMove](https://wiki.facepunch.com/gmod/GM:CreateMove).
---
--- **WARNING**: This hook will not work if the current gamemode overrides [GM:SetupMove](https://wiki.facepunch.com/gmod/GM:SetupMove) and does not call this hook.
---
--- **NOTE**: This hook is run after the [drive.StartMove](https://wiki.facepunch.com/gmod/drive.StartMove) has been called.
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:StartMove)
---@param mv CMoveData The move data to override/use
---@param cmd CUserCmd The command data
---@return boolean # Return true to prevent default action
function PLAYER:StartMove(mv, cmd) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Doesn't appear to do anything.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StartSprinting)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StartSprinting() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) When used in a [GM:SetupMove](https://wiki.facepunch.com/gmod/GM:SetupMove) hook, this function will force the player to walk, as well as preventing the player from sprinting.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StartWalking)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StartWalking() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's SteamID.
---
--- See [Player:AccountID](https://wiki.facepunch.com/gmod/Player:AccountID) for a shorter version of the SteamID and [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64) for the full SteamID.
---
--- It is recommended to use [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64) over the other SteamID formats whenever possible.
---
--- **NOTE**: In a `-multirun` environment, this will return `STEAM_ID_LAN` for all "copies" of a player because they are not authenticated with Steam.
---
--- For Bots this will return `BOT`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SteamID)
---@return string # "Text" representation of the player's SteamID.
function Player:SteamID() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's full **64-bit SteamID**, also known as **CommunityID**. Information on how data is packed into this value can be found [here](https://developer.valvesoftware.com/wiki/SteamID).
---
--- See [Player:AccountID](https://wiki.facepunch.com/gmod/Player:AccountID) for a function that returns only the Account ID part of the SteamID and [Player:SteamID](https://wiki.facepunch.com/gmod/Player:SteamID) for the text version of the SteamID.
---
--- **NOTE**: In a `-multirun` environment, this will return `"0"` for all "copies" of a player because they are not authenticated with Steam.
---
--- For bots, this will return `90071996842377216` (equivalent to `STEAM_0:0:0`) for the first bot to join.
---
--- For each additional bot, the number increases by 1. So the next bot will be `90071996842377217` (`STEAM_0:1:0`) then `90071996842377218` (`STEAM_0:0:1`) and so on.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SteamID64)
---@return string # Player's 64-bit SteamID aka CommunityID.
---
--- The return value is a string, not a number, since Lua's numbers are unable to store the entire 64bit numbers without data loss.
function Player:SteamID64() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) When used in a [GM:SetupMove](https://wiki.facepunch.com/gmod/GM:SetupMove) hook, this function will prevent the player from sprinting.
---
--- When +walk is engaged, the player will still be able to sprint to half speed (normal run speed) as opposed to full sprint speed without this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StopSprinting)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StopSprinting() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) When used in a [GM:SetupMove](https://wiki.facepunch.com/gmod/GM:SetupMove) hook, this function behaves unexpectedly by preventing the player from sprinting similar to [Player:StopSprinting](https://wiki.facepunch.com/gmod/Player:StopSprinting).
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StopWalking)
---@deprecated This appears to be a direct binding to internal functionality that is overridden by the engine every frame so calling these functions may not have any or expected effect.
function Player:StopWalking() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Turns off the zoom mode of the player. (+zoom console command)
---
--- Basically equivalent of entering "-zoom" into player's console.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StopZooming)
function Player:StopZooming() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes all ammo from the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StripAmmo)
---@deprecated Alias of Player:RemoveAllAmmo
function Player:StripAmmo() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes the specified weapon class from a certain player
--- 	**NOTE**: this function will call the [Entity:OnRemove](https://wiki.facepunch.com/gmod/Entity:OnRemove) but if you try use [Entity:GetOwner](https://wiki.facepunch.com/gmod/Entity:GetOwner) it will return nil
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StripWeapon)
---@param weapon string The weapon class to remove
function Player:StripWeapon(weapon) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes all weapons from a certain player
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:StripWeapons)
function Player:StripWeapons() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Prevents a hint from showing up.
---
--- **NOTE**: This function is only available in Sandbox and its derivatives
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SuppressHint)
---@param name string Hint name/class/index to prevent from showing up. You can find a list of hint names for this function List_of_Hint_Classes.
function Player:SuppressHint(name) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Attempts to switch the player weapon to the one specified in the "cl_defaultweapon" convar, if the player does not own the specified weapon nothing will happen.
---
--- If you want to switch to a specific weapon, use: [Player:SetActiveWeapon](https://wiki.facepunch.com/gmod/Player:SetActiveWeapon)
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:SwitchToDefaultWeapon)
function Player:SwitchToDefaultWeapon() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's team ID, set by [Player:SetTeam](https://wiki.facepunch.com/gmod/Player:SetTeam)
---
--- Returns 0 clientside when the game is not fully loaded.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:Team)
---@return number # The player's team's index number, as in the Enums/TEAM or a custom team defined in team.SetUp.
function Player:Team() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the time in seconds since the player connected.
---
--- Bots will always return value 0.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:TimeConnected)
---@return number # How long this player was connected to the server for, in seconds.
function Player:TimeConnected() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Performs a trace hull and applies damage to the entities hit, returns the first entity hit.
---
--- **WARNING**: Hitting the victim entity with this function in [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage) can cause infinite loops.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:TraceHullAttack)
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

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Translates [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT) according to the holdtype of players currently held weapon.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:TranslateWeaponActivity)
---@param act number The initial Enums/ACT
---@return number # Translated Enums/ACT
function Player:TranslateWeaponActivity(act) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Unfreezes all objects the player has frozen with their Physics Gun. Same as double pressing R while holding Physics Gun.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:UnfreezePhysicsObjects)
function Player:UnfreezePhysicsObjects() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a 32 bit integer that remains constant for a player across joins/leaves and across different servers. This can be used when a string is inappropriate - e.g. in a database primary key.
---
--- **NOTE**: In Singleplayer, this function will always return 1.
---
--- In a `-multirun` environment, the value returned is different on the serverside and clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:UniqueID)
---@return number # The player's Unique ID
---@deprecated **This function has collisions,** where more than one player can have the same UniqueID. It is **highly** recommended to use Player:SteamID64, Player:SteamID or Player:AccountID instead, which are guaranteed to be unique to each player.
function Player:UniqueID() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table that will stay allocated for the specific player serverside between connects until the server shuts down. On client it has no such special behavior.
---
--- **NOTE**: This table is not synchronized (networked) between client and server.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:UniqueIDTable)
---@param key any Unique table key.
---@return table # The table that contains any info you have put in it.
function Player:UniqueIDTable(key) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Unlocks the player movement if locked previously.
---
--- Will disable godmode for the player if locked previously.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:UnLock)
function Player:UnLock() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Stops the player from spectating another entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:UnSpectate)
function Player:UnSpectate() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player's user ID. This number will always be unique, but will reset if the player reconnects. (Always increments for each connecting player)
---
--- You can use [Global.Player](https://wiki.facepunch.com/gmod/Global.Player) global function to get a player by their user ID.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:UserID)
---@return number # The player's user ID
function Player:UserID() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called when the player changes their weapon to another one causing their viewmodel model to change
---
---[View wiki](https://wiki.facepunch.com/gmod/PLAYER:ViewModelChanged)
---@param viewmodel Entity The viewmodel that is changing
---@param old string The old model
---@param new string The new model
function PLAYER:ViewModelChanged(viewmodel, old, new) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Simulates a push on the client's screen. This **adds** view punch velocity, and does not reset the current view punch angle, for which you can use [Player:SetViewPunchAngles](https://wiki.facepunch.com/gmod/Player:SetViewPunchAngles).
---
--- **NOTE**: Despite being defined shared, it only functions when called server-side.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ViewPunch)
---@param punchAngle Angle The angle in which to push the player's screen.
function Player:ViewPunch(punchAngle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Resets the player's view punch (and the view punch velocity, read more at [Player:ViewPunch](https://wiki.facepunch.com/gmod/Player:ViewPunch)) effect back to normal.
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:ViewPunchReset)
---@param tolerance? number Reset all ViewPunch below this threshold.
function Player:ViewPunchReset(tolerance) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the players voice volume, how loud the player's voice communication currently is, as a number in range of [0,1].
---
---[View wiki](https://wiki.facepunch.com/gmod/Player:VoiceVolume)
---@return number # The voice volume.
function Player:VoiceVolume() end
