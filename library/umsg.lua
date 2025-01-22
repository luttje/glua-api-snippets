---@meta

--- The umsg (user message) library was previously the most common way of sending information from the server to the client.
---
--- **WARNING**: Usermessages have a limit of only 256 bytes!
---@deprecated You should be using the net library instead
umsg = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes an angle to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Angle)
---@param angle Angle The angle to be sent.
---@deprecated You should be using the net instead
function umsg.Angle(angle) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a bool to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Bool)
---@param bool boolean The bool to be sent.
---@deprecated You should be using the net instead
function umsg.Bool(bool) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a signed char to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Char)
---@param char number The char to be sent.
---@deprecated You should be using the net instead
function umsg.Char(char) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Dispatches the usermessage to the client(s).
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.End)
---@deprecated You should be using the net instead
function umsg.End() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes an entity object to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Entity)
---@param entity Entity The entity to be sent.
---@deprecated You should be using the net instead
function umsg.Entity(entity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a float to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Float)
---@param float number The float to be sent.
---@deprecated You should be using the net instead
function umsg.Float(float) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a signed int (32 bit) to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Long)
---@param int number The int to be sent.
---@deprecated You should be using the net instead
function umsg.Long(int) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) The string specified will be networked to the client and receive a identifying number, which will be sent instead of the string to optimize networking.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.PoolString)
---@param string string The string to be pooled.
---@deprecated Inferior version of util.AddNetworkString
function umsg.PoolString(string) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a signed short (16 bit) to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Short)
---@param short number The short to be sent.
---@deprecated You should be using the net instead
function umsg.Short(short) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts a new usermessage.
---
--- **WARNING**: Usermessages have a limit of only 256 bytes!
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Start)
---@param name string The name of the message to be sent.
---@param filter? Player If passed a player object, it will only be sent to the player, if passed a CRecipientFilter of players, it will be sent to all specified players, if passed `nil` (or another invalid value), the message will be sent to all players.
---@deprecated You should be using net instead
function umsg.Start(name, filter) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a null terminated string to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.String)
---@param string string The string to be sent.
---@deprecated You should be using the net instead
function umsg.String(string) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a Vector to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.Vector)
---@param vector Vector The vector to be sent.
---@deprecated You should be using the net instead
function umsg.Vector(vector) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Writes a vector normal to the usermessage.
---
---[View wiki](https://wiki.facepunch.com/gmod/umsg.VectorNormal)
---@param normal Vector The vector normal to be sent.
---@deprecated You should be using the net instead
function umsg.VectorNormal(normal) end
