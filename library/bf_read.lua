---@meta

--- This is the object passed to usermessage.Hook when a message is received. It contains each value stored in the message in sequential order. You should read values from it in the order you wrote them.
---
---
---@deprecated You should be using net instead
---@class bf_read
local bf_read = {}

---[CLIENT] Reads an returns an angle object from the bitstream.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadAngle)
---@return Angle # The read angle
function bf_read:ReadAngle() end

---[CLIENT] Reads 1 bit an returns a bool representing the bit.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadBool)
---@return boolean # bit
function bf_read:ReadBool() end

---[CLIENT] Reads a signed char and returns a number from -127 to 127 representing the ascii value of that char.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadChar)
---@return number # asciiVal
function bf_read:ReadChar() end

---[CLIENT] Reads a short representing an entity index and returns the matching entity handle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadEntity)
---@return Entity # ent
function bf_read:ReadEntity() end

---[CLIENT] Reads a 4 byte float from the bitstream and returns it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadFloat)
---@return number # float
function bf_read:ReadFloat() end

---[CLIENT] Reads a 4 byte long from the bitstream and returns it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadLong)
---@return number # int
function bf_read:ReadLong() end

---[CLIENT] Reads a 2 byte short from the bitstream and returns it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadShort)
---@return number # short
function bf_read:ReadShort() end

---[CLIENT] Reads a null terminated string from the bitstream.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadString)
---@return string # str
function bf_read:ReadString() end

---[CLIENT] Reads a special encoded vector from the bitstream and returns it, this function is not suitable to send normals.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadVector)
---@return Vector # vec
function bf_read:ReadVector() end

---[CLIENT] Reads a special encoded vector normal from the bitstream and returns it, this function is not suitable to send vectors that represent a position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:ReadVectorNormal)
---@return Vector # normal
function bf_read:ReadVectorNormal() end

---[CLIENT] Rewinds the bitstream so it can be read again.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bf_read:Reset)
function bf_read:Reset() end
