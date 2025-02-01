---@meta

--- Functions to persist data on a user's computer.
---
--- 		The data will be read / written to / from a database
--- 		corresponding to the realm the library was used in.
---
--- 		| Realm | Database File |
--- 		|:-----:|:-----|
--- 		| [Server] | `garrysmod/sv.db`
--- 		| [Client] | `garrysmod/cl.db`
--- 		|  [Menu]  | `garrysmod/mn.db`
---
--- 		[Server]: /gmod/States#server
--- 		[Client]: /gmod/States#client
--- 		[Menu]: /gmod/States#menu
cookie = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes any cookie with the given name.
---
--- 		Does nothing if the cookie doesn't exist.
---
---[View wiki](https://wiki.facepunch.com/gmod/cookie.Delete)
---@param key string The name of the cookie that you want to delete.
function cookie.Delete(key) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the value of a cookie on the client as a number.
---
---[View wiki](https://wiki.facepunch.com/gmod/cookie.GetNumber)
---@param name string The name of the cookie that you want to get.
---@param default? any Value to return if the cookie does not exist.
---@return number # The cookie value
function cookie.GetNumber(name, default) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the value of a cookie on the client as a string.
---
---[View wiki](https://wiki.facepunch.com/gmod/cookie.GetString)
---@param name string The name of the cookie that you want to get.
---@param default? any Value to return if the cookie does not exist.
---@return string # The cookie value
function cookie.GetString(name, default) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates / updates a cookie in the [Database](https://wiki.facepunch.com/gmod/cookie).
---
---[View wiki](https://wiki.facepunch.com/gmod/cookie.Set)
---@param key string The name of the cookie.
---@param value string The data stored in the cookie.
function cookie.Set(key, value) end
