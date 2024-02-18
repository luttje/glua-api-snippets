---@meta

--- Used to store permanent variables/settings on clients that will persist between servers. They are stored in the `cl.db`, `sv.db`, or `mn.db` SQLite databases depending on the realm, located in the root Garry's Mod folder.
cookie = {}

---[SHARED AND MENU] Deletes a cookie on the client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cookie.Delete)
---@param name string The name of the cookie that you want to delete.
function cookie.Delete(name) end

---[SHARED AND MENU] Gets the value of a cookie on the client as a number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cookie.GetNumber)
---@param name string The name of the cookie that you want to get.
---@param default? any Value to return if the cookie does not exist.
---@return number # The cookie value
function cookie.GetNumber(name, default) end

---[SHARED AND MENU] Gets the value of a cookie on the client as a string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cookie.GetString)
---@param name string The name of the cookie that you want to get.
---@param default? any Value to return if the cookie does not exist.
---@return string # The cookie value
function cookie.GetString(name, default) end

---[SHARED AND MENU] Sets the value of a cookie, which is saved automatically by the sql.
---
--- These are stored in the *.db files - cl.db for clients, mn.db for menu state and sv.db for servers.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/cookie.Set)
---@param key string The name of the cookie that you want to set.
---@param value string Value to store in the cookie.
function cookie.Set(key, value) end
