---@meta

umsg = {}

---[SERVER] Writes an angle to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Angle)
---@param angle Angle The angle to be sent.
function umsg.Angle(angle) end

---[SERVER] Writes a bool to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Bool)
---@param bool boolean The bool to be sent.
function umsg.Bool(bool) end

---[SERVER] Writes a signed char to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Char)
---@param char number The char to be sent.
function umsg.Char(char) end

---[SERVER] Dispatches the usermessage to the client(s).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.End)
function umsg.End() end

---[SERVER] Writes an entity object to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Entity)
---@param entity Entity The entity to be sent.
function umsg.Entity(entity) end

---[SERVER] Writes a float to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Float)
---@param float number The float to be sent.
function umsg.Float(float) end

---[SERVER] Writes a signed int (32 bit) to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Long)
---@param int number The int to be sent.
function umsg.Long(int) end

---[SERVER] Inferior version of util.AddNetworkString
---
--- The string specified will be networked to the client and receive a identifying number, which will be sent instead of the string to optimize networking.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.PoolString)
---@param string string The string to be pooled.
function umsg.PoolString(string) end

---[SERVER] Writes a signed short (16 bit) to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Short)
---@param short number The short to be sent.
function umsg.Short(short) end

---[SERVER] You should be using net instead
---
--- Starts a new usermessage.
---
--- Usermessages have a limit of only 256 bytes!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Start)
---@param name string The name of the message to be sent.
---@param filter Player If passed a player object, it will only be sent to the player, if passed a CRecipientFilter of players, it will be sent to all specified players, if passed nil (or another invalid value), the message will be sent to all players.
function umsg.Start(name, filter) end

---[SERVER] Writes a null terminated string to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.String)
---@param string string The string to be sent.
function umsg.String(string) end

---[SERVER] Writes a Vector to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.Vector)
---@param vector Vector The vector to be sent.
function umsg.Vector(vector) end

---[SERVER] Writes a vector normal to the usermessage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/umsg.VectorNormal)
---@param normal Vector The vector normal to be sent.
function umsg.VectorNormal(normal) end
