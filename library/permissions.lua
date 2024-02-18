---@meta

--- Used to ask player for various potentially dangerous permissions.
permissions = {}

---[CLIENT] Requests the player to connect to a specified server. The player will be prompted with a confirmation window.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/permissions.AskToConnect)
---@param address string The address to ask to connect to. If a port is not given, the default `:27015` port will be added.
function permissions.AskToConnect(address) end

---[MENU] Connects player to the server. This is what permissions.AskToConnect uses internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/permissions.Connect)
---@param ip string IP address to connect.
function permissions.Connect(ip) end

---[CLIENT] Activates player's microphone as if they pressed the speak button themself. The player will be prompted with a confirmation window which grants permission temporarily/permanently(depending on checkbox state) for the connected server (revokable).
--- This is used for TTT's traitor voice channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/permissions.EnableVoiceChat)
---@param enable boolean Enable or disable voice activity. `true` will run `+voicerecord` command, anything else `-voicerecord`.
function permissions.EnableVoiceChat(enable) end

---[MENU] Returns all permissions per server. Permanent permissions are stored in `settings/permissions.bin`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/permissions.GetAll)
---@return table # A table of permanent and temporary permissions granted for servers.  		Example structure: ```lua permanent = { 	["123.123.123.123"] = "connect" -- this server has a permission to connect player to any server even after restarting the game }, temporary = { 	["111.111.111.111"] = "voicerecord" -- this server can enable voice activity on player during this game session } ```
function permissions.GetAll() end

---[MENU] Grants permission to the current connected server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/permissions.Grant)
---@param permission string Permission to grant for the server the player is currently connected.
---@param temporary boolean `true` if the permission should be granted temporary.
function permissions.Grant(permission, temporary) end

---[CLIENT AND MENU] Returns whether the player has granted the current server a specific permission.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/permissions.IsGranted)
---@param permission string The permission to poll. Currently only 2 permission are valid:
--- * `"connect"`
--- * `"voicerecord"`
---@return boolean # Whether the permission is granted or not.
function permissions.IsGranted(permission) end

---[MENU] Revokes permission from the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/permissions.Revoke)
---@param permission string Permission to revoke from the server.
---@param ip string IP of the server.
function permissions.Revoke(permission, ip) end
