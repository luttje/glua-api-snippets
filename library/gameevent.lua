---@meta

gameevent = {}

---[SHARED] Adds a [game event](gameevent) listener, creating a new hook using the hook library, which can be listened to via hook.Add with the given `eventName` as event.
---
--- 			All gameevents are called in the **Menu State**, but if you want to use them you need to use some DLL(like [this](https://github.com/RaphaelIT7/gmod-gameevent) one) or you need to create your own.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gameevent.Listen)
---@param eventName string The event to listen to. List of valid events (with examples) can be found [here](gameevent).
function gameevent.Listen(eventName) end

---@class achievement_earned
local achievement_earned = {}

---The achievement ID.
---@type number
achievement_earned.achievement = nil

---The Player:UserID of the player.
---@type number
achievement_earned.player = nil

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

---@class break_breakable
local break_breakable = {}

---The Entity:EntIndex of the broken prop.
---@type string
break_breakable.entindex = nil

---The Player:UserID of the connected player.
---@type number
break_breakable.userid = nil

---Material index of the broken entity.
---@type number
break_breakable.material = nil

---@class break_prop
local break_prop = {}

---The Entity:EntIndex of the broken prop.
---@type string
break_prop.entindex = nil

---The Player:UserID of the connected player. Seems to be 0 every time.
---@type number
break_prop.userid = nil

---@class client_beginconnect
local client_beginconnect = {}

---The Server address. Will be **localhost:27015** in hosted games.
---@type string
client_beginconnect.address = nil

---The IP of the Server. Will be **16777343** in hosted games. Use the **address** instead of this.
---@type number
client_beginconnect.ip = nil

---The port of the Server. Will be **27015** in hosted games.
---@type number
client_beginconnect.port = nil

---The Source why the client is trying to connect to the Server. If you use ```connect [IP:Port]``` to connect to a Server, this will be an empty string.
---@type string
client_beginconnect.source = nil

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

---@class client_disconnect
local client_disconnect = {}

---The disconnecting reason. Can be an empty String
---@type string
client_disconnect.message = nil

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

---@class flare_ignite_npc
local flare_ignite_npc = {}

---The Entity:EntIndex of the ignited NPC.
---@type string
flare_ignite_npc.entindex = nil

---@class host_quit
local host_quit = {}

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

---@class player_activate
local player_activate = {}

---The Player:UserID of the Player.
---@type number
player_activate.userid = nil

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

---@class player_hurt
local player_hurt = {}

---The new health after being damaged.
---@type number
player_hurt.health = nil

---**[Server-only]** Event priority number used by HLTV.
---@type number
player_hurt.priority = nil

---The Player:UserID of the victim.
---@type number
player_hurt.userid = nil

---The Player:UserID of the attacker.
---@type number
player_hurt.attacker = nil

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

---@class player_say
local player_say = {}

---**[Server-only]** Event priority number used by HLTV.
---@type number
player_say.priority = nil

---The Player:UserID of the Player. For Console the UserID is 0.
---@type number
player_say.userid = nil

---The text that was said.
---@type string
player_say.text = nil

---@class player_spawn
local player_spawn = {}

---The Player:UserID the player has.
---@type number
player_spawn.userid = nil

---@class ragdoll_dissolved
local ragdoll_dissolved = {}

---The Entity:EntIndex of the disolved Ragdoll.
---@type string
ragdoll_dissolved.entindex = nil

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

---@class server_cvar
local server_cvar = {}

---The convar name. e.g "sv_cheats".
---@type string
server_cvar.cvarname = nil

---The new value. Always a string. e.g "1".
---@type string
server_cvar.cvarvalue = nil

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

---The OS of the Server. **W**(WIN32) or **L**(LINUX)
---@type string
server_spawn.os = nil

---true if it's a dedicated server.
---@type boolean
server_spawn.dedicated = nil

---true if the Server is password protected.
---@type boolean
server_spawn.password = nil
