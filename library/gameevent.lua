---@meta

gameevent = {}

---[SHARED] Adds a [game event](gameevent) listener, creating a new hook using the hook library, which can be listened to via hook.Add with the given `eventName` as event.
--- 
--- 		List of valid events (with examples) can be found [here](gameevent).
--- 		
--- 			All gameevents are called in the **Menu State**, but if you want to use them you need to use some DLL(like [this](https://github.com/RaphaelIT7/gmod-gameevent) one) or you need to create your own.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/gameevent.Listen)
---@param eventName string The event to listen to.
function gameevent.Listen(eventName) end

---@class achievement_earned
---@field achievement number The achievement ID.
---@field player number The Player:UserID of the player.
local achievement_earned = {}

---@class achievement_event
---@field achievement_name string the name of the achievement.
---@field cur_val number amount of steps toward achievement
---@field max_val number total amount of steps in achievement
local achievement_event = {}

---@class break_breakable
---@field entindex string The Entity:EntIndex of the broken prop.
---@field userid number The Player:UserID of the connected player.
---@field material number Material index of the broken entity.
local break_breakable = {}

---@class break_prop
---@field entindex string The Entity:EntIndex of the broken prop.
---@field userid number The Player:UserID of the connected player. Seems to be 0 every time.
local break_prop = {}

---@class client_beginconnect
---@field address string The Server address. Will be **localhost:27015** in hosted games.
---@field ip number The IP of the Server. Will be **16777343** in hosted games. Use the **address** instead of this.
---@field port number The port of the Server. Will be **27015** in hosted games.
---@field source string The Source why the client is trying to connect to the Server. 			If you use ```connect [IP:Port]``` to connect to a Server, this will be an empty string. 		
local client_beginconnect = {}

---@class client_connected
---@field address string The Server address. Will be **loopback** in hosted games.
---@field ip number The IP of the Server. Will be **0** in hosted games. Use the **address** instead of this.
---@field port number The port of the Server. Will be **0** in hosted games.
local client_connected = {}

---@class client_disconnect
---@field message string The disconnecting reason. Can be an empty String
local client_disconnect = {}

---@class entity_killed
---@field entindex_inflictor number The Entity:EntIndex of the inflictor..
---@field entindex_attacker number The Entity:EntIndex of the attacker.
---@field damagebits number Damage type(s), a combination of Enums/DMG.
---@field entindex_killed number The Entity:EntIndex of the victim.
local entity_killed = {}

---@class flare_ignite_npc
---@field entindex string The Entity:EntIndex of the ignited NPC.
local flare_ignite_npc = {}

---@class host_quit
local host_quit = {}

---@class OnRequestFullUpdate
---@field networkid string The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@field name string The Player:Nick the player has.
---@field userid number The Player:UserID the player has.
---@field index number The Entity:EntIndex of the player, minus one.
local OnRequestFullUpdate = {}

---@class player_activate
---@field userid number The Player:UserID of the Player.
local player_activate = {}

---@class player_changename
---@field userid number The Player:UserID of the Player.
---@field oldname string The old Name.
---@field newname string The new Name.
local player_changename = {}

---@class player_connect
---@field bot number 0 if the player isn't a bot, 1 if they are.
---@field networkid string  			The Player:SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player. 		
---@field name string The Player:Nick the player has.
---@field userid number The Player:UserID the player has.
---@field index number The Entity:EntIndex of the player, minus one.
---@field address string  			The Player:IPAddress of the connecting player.  			Will be `none` for bots and `loopback` for listen server and single-player hosts. 		
local player_connect = {}

---@class player_connect_client
---@field bot number 0 if the player isn't a bot, 1 if they are.
---@field networkid string The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@field name string The Player:Nick the player has.
---@field userid number The Player:UserID the player has.
---@field index number The Entity:EntIndex of the player, minus one.
local player_connect_client = {}

---@class player_disconnect
---@field bot number 0 if the player isn't a bot, 1 if they are.
---@field networkid string The SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player.
---@field name string The Player:Nick the player has.
---@field userid number The Player:UserID the player has.
---@field reason string The disconnect reason.
local player_disconnect = {}

---@class player_hurt
---@field health number The new health after being damaged.
---@field priority number **[Server-only]** Event priority number used by HLTV.
---@field userid number The Player:UserID of the victim.
---@field attacker number The Player:UserID of the attacker.
local player_hurt = {}

---@class player_info
---@field friendsid number The Player:AccountID of the Player.
---@field index number The Entity:EntIndex of the Player minus one.
---@field bot number 1 or 0 if it is a bot or not.
---@field userid number The Player:UserID of the Player.
---@field name string The Player:Name of the Player.
---@field networkid string The Player:SteamID of the Player.
local player_info = {}

---@class player_say
---@field priority number **[Server-only]** Event priority number used by HLTV.
---@field userid number The Player:UserID of the Player. For Console the UserID is 0.
---@field text string The text that was said.
local player_say = {}

---@class player_spawn
---@field userid number The Player:UserID the player has.
local player_spawn = {}

---@class ragdoll_dissolved
---@field entindex string The Entity:EntIndex of the disolved Ragdoll.
local ragdoll_dissolved = {}

---@class server_addban
---@field networkid string  			The Player:SteamID the player has. Will be `BOT` for bots and `STEAM_0:0:0` in single-player. 		
---@field name string The Player:Nick the player has.
---@field userid number The Player:UserID the player has.
---@field ip string The Player:IPAddress of the player.
---@field duration string The Duration of the Ban (in minutes).
---@field by string The name of the Person who Banned the Player or Console.
---@field kicked boolean whether the player was also kicked.
local server_addban = {}

---@class server_cvar
---@field cvarname string The convar name. e.g "sv_cheats".
---@field cvarvalue string The new value. Always a string. e.g "1".
local server_cvar = {}

---@class server_removeban
---@field networkid string The Player:SteamID of the banned Player.
---@field ip string The Player:IPAddress of the banned Player.
---@field by string The Person who unbanned the Player. Can be Console.
local server_removeban = {}

---@class server_spawn
---@field hostname string The hostname of the Server.
---@field address string The Server address. Will be **loopback** in hosted games.
---@field ip number The IP of the Server. Will be **0** in hosted games. Use the **address** instead of this.
---@field port number The port of the Server. Will be **0** in hosted games.
---@field game string The Game the Server is hosting. Will be **garrysmod**
---@field mapname string The mapname the Server is currently on.
---@field maxplayers number The amount of slots the server has.
---@field os string The OS of the Server. **W**(WIN32) or **L**(LINUX)
---@field dedicated boolean true if it's a dedicated server.
---@field password boolean true if the Server is password protected.
local server_spawn = {}

