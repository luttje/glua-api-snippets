---@meta

--- Menu state library to query the master server list.
serverlist = {}

---[MENU] Adds current server the player is on to their favorites.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.AddCurrentServerToFavorites)
function serverlist.AddCurrentServerToFavorites() end

---[MENU] Adds the given server address to their favorites.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.AddServerToFavorites)
---@param address string Server Address. **IP:Port like "127.0.0.1:27015"**
function serverlist.AddServerToFavorites(address) end

---[MENU] Returns true if the current server address is in their favorites.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.IsCurrentServerFavorite)
---@return boolean # true if the current server is in their favorites
function serverlist.IsCurrentServerFavorite() end

---[MENU] Returns true if the given server address is in their favorites.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.IsServerFavorite)
---@param address string Server Address. **IP:Port like "127.0.0.1:27015"**
---@return boolean # true if the server address is in their favorites
function serverlist.IsServerFavorite(address) end

---[MENU] Queries a server for its information/ping.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.PingServer)
---@param ip string The IP address of the server, including the port.
---@param callback function The function to be called if and when the request finishes. Function has the same arguments as the callback of serverlist.Query.
function serverlist.PingServer(ip, callback) end

---[MENU] Queries a server for its player list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.PlayerList)
---@param ip string The IP address of the server, including the port.
---@param callback function The function to be called if and when the request finishes. Function has one argument, a table containing tables with player info.
---
--- Each table with player info has next fields:
---
---
--- number time - The amount of time the player is playing on the server, in seconds
---
---
--- string name - The player name
---
---
--- number score - The players score
function serverlist.PlayerList(ip, callback) end

---[MENU] Queries the master server for server list.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.Query)
---@param data table The information about what kind of servers we want. See Structures/ServerQueryData.
function serverlist.Query(data) end

---[MENU] Removes the given server address from their favorites.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/serverlist.RemoveServerFromFavorites)
---@param address string Server Address. **IP:Port like "127.0.0.1:27015"**
function serverlist.RemoveServerFromFavorites(address) end
