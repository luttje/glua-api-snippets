---@meta

--- This is the object passed to [usermessage.Hook](https://wiki.facepunch.com/gmod/usermessage.Hook) when a message is received. It contains each value stored in the message in sequential order. You should read values from it in the order you wrote them.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read)
---@deprecated You should be using net instead
---@class bf_read
local bf_read = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads and returns an angle object from the bitstream.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadAngle)
---@return Angle # The read angle
function bf_read:ReadAngle() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads 1 bit and returns a bool representing the bit.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadBool)
---@return boolean # bit
function bf_read:ReadBool() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a signed char and returns a number from -127 to 127 representing the ascii value of that char.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadChar)
---@return number # asciiVal
function bf_read:ReadChar() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a short representing an entity index and returns the matching entity handle.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadEntity)
---@return Entity # ent
function bf_read:ReadEntity() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a 4 byte float from the bitstream and returns it.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadFloat)
---@return number # float
function bf_read:ReadFloat() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a 4 byte long from the bitstream and returns it.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadLong)
---@return number # int
function bf_read:ReadLong() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a 2 byte short from the bitstream and returns it.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadShort)
---@return number # short
function bf_read:ReadShort() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a null terminated string from the bitstream.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadString)
---@return string # str
function bf_read:ReadString() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a special encoded vector from the bitstream and returns it, this function is not suitable to send normals.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadVector)
---@return Vector # vec
function bf_read:ReadVector() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads a special encoded vector normal from the bitstream and returns it, this function is not suitable to send vectors that represent a position.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:ReadVectorNormal)
---@return Vector # normal
function bf_read:ReadVectorNormal() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Rewinds the bitstream so it can be read again.
---
---[View wiki](https://wiki.facepunch.com/gmod/bf_read:Reset)
function bf_read:Reset() end
