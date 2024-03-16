---@meta

--- Used to interface with the built-in game events system.
---
---
--- 	All Serverside gameevents are networked and called clientside. It could happen that a gameevent is called twice because of this like gameevent/OnRequestFullUpdate.
---
---
--- The following is a list of all available game events.
---
---
gameevent = {}

---[SHARED] Adds a [game event](gameevent) listener, creating a new hook using the hook library, which can be listened to via hook.Add with the given `eventName` as event.
---
--- 			All gameevents are called in the **Menu State**, but if you want to use them you need to use some DLL(like [this](https://github.com/RaphaelIT7/gmod-gameevent) one) or you need to create your own.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gameevent.Listen)
---@param eventName string The event to listen to. List of valid events (with examples) can be found [here](gameevent).
function gameevent.Listen(eventName) end

---
--- 			Called when a player earns an achievement.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class achievement_earned
local achievement_earned = {}

---The achievement ID.
---@type number
achievement_earned.achievement = nil

---The Player:UserID of the player.
---@type number
achievement_earned.player = nil

---
--- 			Called when a player makes progress on an achievement.
---
--- 			Only called clientside for the player who made progress.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class achievement_event
local achievement_event = {}

---the name of the achievement.
---@type string
achievement_event.achievement_name = nil

---amount of steps toward achievement
---@type number
achievement_event.cur_val = nil

---total amount of steps in achievement
---@type number
achievement_event.max_val = nil

---
--- 		Called when a func_break is broken by a player.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class break_breakable
local break_breakable = {}

---The Entity:EntIndex of the broken prop.
---@type number
break_breakable.entindex = nil

---The Player:UserID of the connected player.
---@type number
break_breakable.userid = nil

---Material index of the broken entity.
---@type number
break_breakable.material = nil

---
--- 		Called when a prop_dynamic or prop_physics is broken by a player.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class break_prop
local break_prop = {}

---The Entity:EntIndex of the broken prop.
---@type number
break_prop.entindex = nil

---The Player:UserID of the connected player. Seems to be 0 every time.
---@type number
break_prop.userid = nil

---
--- 		Called when trying to connect to a Server.
---
---
--- 			This is only available in the Menu state because this is called before the Client State has even started.
--- 			When this is event is called, it will reset engine.TickCount back to **1**.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed. [This](https://github.com/RaphaelIT7/gmod-gameevent) Binary Module has been used.
---@class client_beginconnect
local client_beginconnect = {}

---The Server address. Will be `localhost:27015` in hosted games.
---@type string
client_beginconnect.address = nil

---The IP of the Server. Will be `16777343` in hosted games. Use the `address` instead of this.
---@type number
client_beginconnect.ip = nil

---The port of the Server. Will be `27015` in hosted games.
---@type number
client_beginconnect.port = nil

---The Source why the client is trying to connect to the Server. If you use `connect [IP:Port]` to connect to a Server, this will be an empty string.
---@type string
client_beginconnect.source = nil

---
--- 		Called when the connection to a Server has been established.
---
---
--- 			This is only available in the Menu state because this is called before the Client State has even started.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed. [This](https://github.com/RaphaelIT7/gmod-gameevent) Binary Module has been used.
---@class client_connected
local client_connected = {}

---The Server address. Will be **loopback** in hosted games.
---@type string
client_connected.address = nil

---The IP of the Server. Will be **0** in hosted games. Use the **address** instead of this.
---@type number
client_connected.ip = nil

---The port of the Server. Will be **0** in hosted games.
---@type number
client_connected.port = nil

---
--- 		Called when the client is disconnecting from the server.
---
---
--- 			Only called clientside for the disconnecting Player.
--- 			message - will be an empty String if the client intentionally disconnects from the server.
--- 			This is called multiple times in the **Menu state** when connecting to a server.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class client_disconnect
local client_disconnect = {}

---The disconnecting reason. Can be an empty String
---@type string
client_disconnect.message = nil

---
--- 		Called when an entity dies.
---
--- 		This is not called when a player dies using Player:KillSilent.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class entity_killed
local entity_killed = {}

---The Entity:EntIndex of the inflictor..
---@type number
entity_killed.entindex_inflictor = nil

---The Entity:EntIndex of the attacker.
---@type number
entity_killed.entindex_attacker = nil

---Damage type(s), a combination of Enums/DMG.
---@type number
entity_killed.damagebits = nil

---The Entity:EntIndex of the victim.
---@type number
entity_killed.entindex_killed = nil

---
--- 		Called when a flare sets an NPC on fire.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class flare_ignite_npc
local flare_ignite_npc = {}

---The Entity:EntIndex of the ignited NPC.
---@type number
flare_ignite_npc.entindex = nil

---
--- 		Called when the freeze cam starts spectating something.
--- 		Example cause:
--- ```
--- local ply = Entity( 1 )
--- ply:Spectate( OBS_MODE_FREEZECAM )
---
--- ply:SpectateEntity( ply )
--- ```
---
--- 		This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---
---@class freezecam_started
local freezecam_started = {}

---
--- 		Called when a map is loaded.
---
---
--- 			This is only available in the Menu state because this is called before the Client State has even started.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed. [This](https://github.com/RaphaelIT7/gmod-gameevent) Binary Module has been used.
---@class game_newmap
local game_newmap = {}

---The Map name
---@type string
game_newmap.mapname = nil

---
--- 		Called when the freeze cam is finished.
--- 		Example cause:
--- ```
--- local ply = Entity( 1 )
--- ply:Spectate( OBS_MODE_FREEZECAM )
---
--- timer.Simple( 1, function()
--- 	ply:UnSpectate()
--- end )
--- ```
---
--- 		This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---
---@class hide_freezepanel
local hide_freezepanel = {}

---
--- 			Called when a Client becomes the Cameraman
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_cameraman
local hltv_cameraman = {}

---The Entity:EntIndex of the new Cameraman.
---@type number
hltv_cameraman.index = nil

---
--- 			Called when the HLTV observer mode changes.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_changed_mode
local hltv_changed_mode = {}

---The new Enums/OBS_MODE.
---@type number
hltv_changed_mode.newmode = nil

---The Entity:EntIndex of our Target.
---@type number
hltv_changed_mode.obs_target = nil

---The old Enums/OBS_MODE.
---@type number
hltv_changed_mode.oldmode = nil

---
--- 			Called when the HLTV observer target changes.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_changed_target
local hltv_changed_target = {}

---The Enums/OBS_MODE.
---@type number
hltv_changed_target.mode = nil

---The Entity:EntIndex of the new Target.
---@type number
hltv_changed_target.obs_target = nil

---The Entity:EntIndex of the old Target.
---@type number
hltv_changed_target.old_target = nil

---
--- 			Called when the view changes
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_chase
local hltv_chase = {}

---The distance from the Target.
---@type number
hltv_chase.distance = nil

---The inertia.
---@type number
hltv_chase.inertia = nil

---`1` if we should use Enums/OBS_MODE. else, we use Enums/OBS_MODE
---@type number
hltv_chase.ineye = nil

---The phi.
---@type number
hltv_chase.phi = nil

---The Entity:EntIndex of the Primary target.
---@type number
hltv_chase.target1 = nil

---The Entity:EntIndex of the Secondary target.
---@type number
hltv_chase.target2 = nil

---The theta.
---@type number
hltv_chase.theta = nil

---
--- 			Called when the fixed view changes
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_fixed
local hltv_fixed = {}

---The X position.
---@type number
hltv_fixed.posx = nil

---The Y position.
---@type number
hltv_fixed.posy = nil

---The Z position.
---@type number
hltv_fixed.posz = nil

---The phi.
---@type number
hltv_fixed.phi = nil

---The Entity:EntIndex of the target.
---@type number
hltv_fixed.target = nil

---The theta.
---@type number
hltv_fixed.theta = nil

---The FOV.
---@type number
hltv_fixed.fov = nil

---
--- 			Called when a message is sent with `tv_msg`
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_message
local hltv_message = {}

---The Text.
---@type string
hltv_message.text = nil

---
--- 			Called when the HLTV ranks all cameras
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_rank_camera
local hltv_rank_camera = {}

---The id of the Camera.
---@type number
hltv_rank_camera.index = nil

---The rank.
---@type number
hltv_rank_camera.rank = nil

---The Entity:EntIndex of the Target.
---@type number
hltv_rank_camera.target = nil

---
--- 			Called when the HLTV ranks all players
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_rank_entity
local hltv_rank_entity = {}

---The Entity:EntIndex of the Entity.
---@type number
hltv_rank_entity.index = nil

---The rank.
---@type number
hltv_rank_entity.rank = nil

---The Entity:EntIndex of the Target.
---@type number
hltv_rank_entity.target = nil

---
--- 			Called when the SourceTV client is spawned
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class hltv_title
local hltv_title = {}

---The SourceTV Name.
---@type string
hltv_title.text = nil

---
--- 		Called **only** in the specific realm when the game is existing.
---
--- 		This is not called reliable serverside.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class host_quit
local host_quit = {}

---
--- 		Called when a player requests a full update from the server.
--- 		Called Clientside when the Update is received or when another player requested a full update.
---
---
--- 			When this event is called the first time for a client, net messages will be reliably received by the client.
--- 			This gameevent is called twice for the player, because it is first called serverside and networked, but then also called clientside.
---
--- 	Early Networking ExampleThis is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class OnRequestFullUpdate
local OnRequestFullUpdate = {}

---The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@type string
OnRequestFullUpdate.networkid = nil

---The Player:Nick the player has.
---@type string
OnRequestFullUpdate.name = nil

---The Player:UserID the player has.
---@type number
OnRequestFullUpdate.userid = nil

---The Entity:EntIndex of the player, minus one.
---@type number
OnRequestFullUpdate.index = nil

---
--- 			Called when a player has entered the game (connected and loaded).
--- 			From this point you can use Global.Player(userid) (serverside or in singleplayer)
---
--- 			This is called after GM:PlayerInitialSpawn so you could just use that hook serverside.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_activate
local player_activate = {}

---The Player:UserID of the Player.
---@type number
player_activate.userid = nil

---
--- 			Called when a player changes their Steam name.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_changename
local player_changename = {}

---The Player:UserID of the Player.
---@type number
player_changename.userid = nil

---The old Name.
---@type string
player_changename.oldname = nil

---The new Name.
---@type string
player_changename.newname = nil

---
--- 		Called when a player connects to the server.
---
--- 		This is only called serverside AND clientside for the listen server host. In other cases it's called serverside.
--- 	Announce to everyone that a player has connected.
---@class player_connect
local player_connect = {}

---0 if the player isn't a bot, 1 if they are.
---@type number
player_connect.bot = nil

--- The Player:SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@type string
player_connect.networkid = nil

---The Player:Nick the player has.
---@type string
player_connect.name = nil

---The Player:UserID the player has.
---@type number
player_connect.userid = nil

---The Entity:EntIndex of the player, minus one.
---@type number
player_connect.index = nil

--- The Player:IPAddress of the connecting player. Will be `none` for bots and `loopback` for listen server and single-player hosts.
---@type string
player_connect.address = nil

---
--- 		Called when a player connects to the server.
---
--- 		This is not called clientside for the local player or in single-player.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_connect_client
local player_connect_client = {}

---0 if the player isn't a bot, 1 if they are.
---@type number
player_connect_client.bot = nil

---The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@type string
player_connect_client.networkid = nil

---The Player:Nick the player has.
---@type string
player_connect_client.name = nil

---The Player:UserID the player has.
---@type number
player_connect_client.userid = nil

---The Entity:EntIndex of the player, minus one.
---@type number
player_connect_client.index = nil

---
--- 		Called when a player disconnects from the server.
---
---
--- 			This is also called when a player cancels connecting to the server.
--- 			This is not called clientside for the local player or in single-player.
--- 			When this gameevent is called on the client side, the player will be NULL!. so you cannot use `Player(data.userid)`!
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_disconnect
local player_disconnect = {}

---0 if the player isn't a bot, 1 if they are.
---@type number
player_disconnect.bot = nil

---The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@type string
player_disconnect.networkid = nil

---The Player:Nick the player has.
---@type string
player_disconnect.name = nil

---The Player:UserID the player has.
---@type number
player_disconnect.userid = nil

---The disconnect reason.
---@type string
player_disconnect.reason = nil

---
--- 			Called when the player takes damage.
---
--- 		This is called after GM:EntityTakeDamage so you could just use that hook serverside.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_hurt
local player_hurt = {}

---The new health after being damaged.
---@type number
player_hurt.health = nil

---Event priority number used by HLTV.
---@type number
player_hurt.priority = nil

---The Player:UserID of the victim.
---@type number
player_hurt.userid = nil

---The Player:UserID of the attacker.
---@type number
player_hurt.attacker = nil

---
--- 		Called when a player's info has changed over the network.
--- 		When a Client joins the Server, this gameevent is called for each player on the server for the client.
--- 		So if 32 Players are on the Server, this gameevent is called 32 times on the Client.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_info
local player_info = {}

---The Player:AccountID of the Player.
---@type number
player_info.friendsid = nil

---The Entity:EntIndex of the Player minus one.
---@type number
player_info.index = nil

---1 or 0 if it is a bot or not.
---@type number
player_info.bot = nil

---The Player:UserID of the Player.
---@type number
player_info.userid = nil

---The Player:Name of the Player.
---@type string
player_info.name = nil

---The Player:SteamID of the Player.
---@type string
player_info.networkid = nil

---
--- 			Called when the player say a message.
---
---
--- 			This is called after GM:PlayerSay so you could just use that hook serverside.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_say
local player_say = {}

---Event priority number used by HLTV.
---@type number
player_say.priority = nil

---The Player:UserID of the Player. For Console the UserID is 0.
---@type number
player_say.userid = nil

---The text that was said.
---@type string
player_say.text = nil

---`1` If it's only for the team, else `0`.
---@type number
player_say.teamonly = nil

---
--- 			Called when a player spawns.
---
---
--- 			This is not called clientside for the local player or in single-player.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class player_spawn
local player_spawn = {}

---The Player:UserID the player has.
---@type number
player_spawn.userid = nil

---
--- 		Called when a Ragdoll is going to be Dissolved.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class ragdoll_dissolved
local ragdoll_dissolved = {}

---The Entity:EntIndex of the disolved Ragdoll.
---@type number
ragdoll_dissolved.entindex = nil

---
--- 		Called when a Player is banned using Player:Ban, **banip** or the **banid** command.
---
---
--- 			If **banip** was used the networkid will be an empty string.
--- 			If **banid** was used the ip will be an empty string.
---
---
--- 		This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---
---@class server_addban
local server_addban = {}

--- The Player:SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@type string
server_addban.networkid = nil

---The Player:Nick the player has.
---@type string
server_addban.name = nil

---The Player:UserID the player has.
---@type number
server_addban.userid = nil

---The Player:IPAddress of the player.
---@type string
server_addban.ip = nil

---The Duration of the Ban (in minutes).
---@type string
server_addban.duration = nil

---The name of the Person who Banned the Player or Console.
---@type string
server_addban.by = nil

---whether the player was also kicked.
---@type boolean
server_addban.kicked = nil

---
--- 		Called when a convar with FCVAR_NOTIFY is changed on the server.
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class server_cvar
local server_cvar = {}

---The convar name. e.g "sv_cheats".
---@type string
server_cvar.cvarname = nil

---The new value. Always a string. e.g "1".
---@type string
server_cvar.cvarvalue = nil

---
--- 		Called when a Player is unbanned using the **removeid** or **removeip** command.
---
---
--- 			If the player was banned using **banip** was used the networkid will be an empty string.
--- 			If the player was banned using **banid** was used the ip will be an empty string.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class server_removeban
local server_removeban = {}

---The Player:SteamID of the banned Player.
---@type string
server_removeban.networkid = nil

---The Player:IPAddress of the banned Player.
---@type string
server_removeban.ip = nil

---The Person who unbanned the Player. Can be Console.
---@type string
server_removeban.by = nil

---
--- 		Called when [joining](https://github.com/OthmanAba/TeamFortress2/blob/master/tf2_src/engine/baseclientstate.cpp#L1224) a Server or when a Server [spawned](https://github.com/OthmanAba/TeamFortress2/blob/master/tf2_src/engine/sv_main.cpp#L2697)
---
---
--- 			This is only available in the Menu state because this is called before the Client or Server State has even started.
---
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed. [This](https://github.com/RaphaelIT7/gmod-gameevent) Binary Module has been used.
---@class server_spawn
local server_spawn = {}

---The hostname of the Server.
---@type string
server_spawn.hostname = nil

---The Server address. Will be **loopback** in hosted games.
---@type string
server_spawn.address = nil

---The IP of the Server. Will be **0** in hosted games. Use the **address** instead of this.
---@type number
server_spawn.ip = nil

---The port of the Server. Will be **0** in hosted games.
---@type number
server_spawn.port = nil

---The Game the Server is hosting. Will be **garrysmod**
---@type string
server_spawn.game = nil

---The mapname the Server is currently on.
---@type string
server_spawn.mapname = nil

---The amount of slots the server has.
---@type number
server_spawn.maxplayers = nil

---The OS of the Server. **W**(WIN32), **L**(LINUX) or **O**(OSX)
---@type string
server_spawn.os = nil

---true if it's a dedicated server.
---@type boolean
server_spawn.dedicated = nil

---true if the Server is password protected.
---@type boolean
server_spawn.password = nil

---
--- 		Called when the freeze cam is started.
--- 		Example cause:
--- ```
--- Player:Spectate(OBS_MODE_FREEZECAM)
--- ```
--- 	This is a basic template with the purpose of including all arguments / table variables to make it easily known which values can be accessed.
---@class show_freezepanel
local show_freezepanel = {}

---The Index of the Entity that is being spectated or `0`
---@type number
show_freezepanel.killer = nil
