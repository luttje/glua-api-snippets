---@meta

--- The net library is one of a number of ways to send data between the client and server.
---
--- The major advantages of the net library are the large size limit (64kb/message) and the ability to send data backwards - from the client to the server.
---
--- Refer to Net Library Usage for a short introduction.
net = {}

---[SHARED] Cancels a net message started by net.Start, so you can immediately start a new one without any errors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.Abort)
function net.Abort() end

---[SERVER] Sends the currently built net message (see net.Start) to all connected players.
--- More information can be found in Net Library Usage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.Broadcast)
function net.Broadcast() end

---[SHARED] Returns the amount of data left to read in the current message. Does nothing when sending data.
---
--- 		This will include 6 extra bits (or 1 byte rounded-up) used by the engine internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.BytesLeft)
---@return number # The amount of data left to read in the current net message in **bytes**. Returns `nil` if no net message has been started.
---@return number # The amount of data left to read in the current net message in **bits**. Returns `nil` if no net message has been started.
function net.BytesLeft() end

---[SHARED] Returns the size of the current message.
---
--- This will include 3 extra bytes (24 bits) used by the engine internally to send the data over the network.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.BytesWritten)
---@return number # The amount of **bytes** written to the current net message. Returns `nil` if no net message has been started.
---@return number # The amount of **bits** written to the current net message. Returns `nil` if no net message has been started.
function net.BytesWritten() end

---[SHARED] You may be looking for net.Receive.
---
--- Function called by the engine to tell the Lua state a message arrived.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.Incoming)
---@param length number The message length, in **bits**.
---@param client Player The player that sent the message. This will be `nil` in the client state.
function net.Incoming(length, client) end

---[SHARED] Reads an angle from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadAngle)
---@return Angle # The read angle, or `Angle( 0, 0, 0 )` if no angle could be read
function net.ReadAngle() end

---[SHARED] Reads a bit from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadBit)
---@return number # `0` or `1`, or `0` if the bit could not be read.
function net.ReadBit() end

---[SHARED] Reads a boolean from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadBool)
---@return boolean # `true` or `false`, or `false` if the bool could not be read.
function net.ReadBool() end

---[SHARED] Reads a Color from the current net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadColor)
---@param hasAlpha? boolean If the color has alpha written or not. **Must match what was given to net.WriteColor.**
---@return table # The Color read from the current net message, or `Color( 0, 0, 0, 0 )` if the color could not be read.
function net.ReadColor(hasAlpha) end

---[SHARED] Reads pure binary data from the message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadData)
---@param length number The length of the data to be read, in **bytes**.
---@return string # The binary data read, or a string containing one character with a byte of `0` if no data could be read.
function net.ReadData(length) end

---[SHARED] Reads a double-precision number from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadDouble)
---@return number # The double-precision number, or `0` if no number could be read.
function net.ReadDouble() end

---[SHARED] Reads an entity from the received net message. You should always check if the specified entity exists as it may have been removed and therefore `NULL` if it is outside of the players [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") or was already removed.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadEntity)
---@return Entity # The entity, or `Entity(0)` if no entity could be read.
function net.ReadEntity() end

---[SHARED] Reads a floating point number from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadFloat)
---@return number # The floating point number, or `0` if no number could be read.
function net.ReadFloat() end

---[SHARED] Reads a word, basically unsigned short. This is used internally to read the "header" of the message which is an unsigned short which can be converted to the corresponding message name via util.NetworkIDToString.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadHeader)
---@return number # The header number
function net.ReadHeader() end

---[SHARED] Reads an integer from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadInt)
---@param bitCount number The amount of bits to be read.
---
--- This must be set to what you set to net.WriteInt. Read more information at net.WriteInt.
---
---@return number # The read integer number, or `0` if no integer could be read.
function net.ReadInt(bitCount) end

---[SHARED] Reads a VMatrix from the received net message.
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadMatrix)
---@return VMatrix # The matrix, or an empty matrix if no matrix could be read.
function net.ReadMatrix() end

---[SHARED] Reads a normal vector from the net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadNormal)
---@return Vector # The normalized vector ( length = `1` ), or `Vector( 0, 0, 1 )` if no normal could be read.
function net.ReadNormal() end

---[SHARED] Reads a player entity that was written with net.WritePlayer from the received net message.
---
--- You should always check if the specified entity exists as it may have been removed and therefore `NULL` if it is outside of the local players [PVS](https://developer.valvesoftware.com/wiki/PVS) or was already removed.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadPlayer)
---@return Player # The player, or `Entity(0)` if no entity could be read.
function net.ReadPlayer() end

---[SHARED] Reads a [null-terminated string](https://en.wikipedia.org/wiki/Null-terminated_string) from the net stream. The size of the string is 8 bits plus 8 bits for every ASCII character in the string.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadString)
---@return string # The read string, or a string with `0` length if no string could be read.
function net.ReadString() end

---[SHARED] Reads a table from the received net message.
---
--- See net.WriteTable for extra info.
---
--- Sometimes when sending a table through the net library, the order of the keys may be switched. So be cautious when comparing (See example 1).
---
--- You may get `net.ReadType: Couldn't read type X` during the execution of the function, the problem is that you are sending objects that **cannot** be serialized/sent over the network.
---
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadTable)
---@param sequential? boolean Set to `true` if the input table is sequential. This saves on bandwidth.
---@return table # Table received via the net message, or a blank table if no table could be read.
function net.ReadTable(sequential) end

---[SHARED] Used internally by net.ReadTable.
---
--- Reads a value from the net message with the specified type, written by net.WriteType.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadType)
---@param typeID? number The type of value to be read, using Enums/TYPE.
---@return any # The value, or the respective blank value based on the type you're reading if the value could not be read.
function net.ReadType(typeID) end

---[SHARED] Reads an unsigned integer with the specified number of bits from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadUInt)
---@param numberOfBits number The size of the integer to be read, in bits.
---
--- This must be set to what you set to net.WriteUInt. Read more information at net.WriteUInt.
---
---@return number # The unsigned integer read, or `0` if the integer could not be read.
function net.ReadUInt(numberOfBits) end

---[SHARED] Reads a unsigned integer with 64 bits from the received net message.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadUInt64)
---@return string # The uint64 number.  Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with Player:SteamID64.
function net.ReadUInt64() end

---[SHARED] Reads a vector from the received net message. Vectors sent by this function are **compressed**, which may result in precision loss. See net.WriteVector for more information.
---
--- You **must** read information in same order as you write it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.ReadVector)
---@return Vector # The read vector, or `Vector( 0, 0, 0 )` if no vector could be read.
function net.ReadVector() end

---[SHARED] Adds a net message handler. Only one receiver can be used to receive the net message.
--- The message-name is converted to lower-case so the message-names "`BigBlue`" and "`bigblue`" would be equal.
--- You **must** put this function **outside** of any other function or hook for it to work properly unless you know what you are doing!
---
--- You **must** read information in the same order as you write it.
---
--- Each net message has a length limit of **64KB**!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.Receive)
---@param messageName string The message name to hook to.
---@param callback fun(len: integer, ply: Player) The function to be called if the specified message was received. Arguments are:
---
--- * number len - Length of the message, in bits.
--- * Player ply - The player that sent the message, works **only** server-side.
function net.Receive(messageName, callback) end

---[SERVER] Sends the current net message (see net.Start) to the specified player, or to all players listed in the table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.Send)
---@param ply Player The player(s) to send the message to. Can be a table of players or a CRecipientFilter.
function net.Send(ply) end

---[SERVER] Sends the current message (see net.Start) to all except the specified, or to all except all players in the table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.SendOmit)
---@param ply Player The player(s) to **NOT** send the message to. Can be a table of players.
function net.SendOmit(ply) end

---[SERVER] Sends current net message (see net.Start) to all players that are in the same [Potentially Audible Set (PAS)](https://developer.valvesoftware.com/wiki/PAS) as the position, or simply said, it adds all players that can potentially hear sounds from this position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.SendPAS)
---@param position Vector PAS position.
function net.SendPAS(position) end

---[SERVER] Sends current net message (see net.Start) to all players in the [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") of the position, or, more simply said, sends the message to players that can potentially see this position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.SendPVS)
---@param position Vector Position that must be in players' visibility set.
function net.SendPVS(position) end

---[CLIENT] Sends the current net message (see net.Start) to the server.
---
--- Each net message has a length limit of 65,533 bytes (approximately 64 KiB) and your net message will error and fail to send if it is larger than this.
---
--- The message name must be pooled with util.AddNetworkString beforehand!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.SendToServer)
function net.SendToServer() end

---[SHARED] Begins a new net message. If another net message is already started and hasn't been sent yet, it will be discarded.
---
--- After calling this function, you will want to call `net.Write` functions to write your data, if any, and then finish with a call to one of the following functions:
--- * net.Send
--- * net.SendOmit
--- * net.SendPAS
--- * net.SendPVS
--- * net.Broadcast
--- * net.SendToServer
---
---
--- Each net message has a length limit of 65,533 bytes (approximately 64 KiB) and your net message will error and fail to send if it is larger than this.
---
--- The net library has an internal buffer that sent messages are added to that is capable of holding roughly 256 kb at a time. Trying to send more will lead to the client being kicked because of a buffer overflow. Networking_Usage#netlimits
---
--- The message name must be pooled with util.AddNetworkString beforehand!
---
--- Net messages will not reliably reach the client until the client's GM:InitPostEntity hook is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.Start)
---@param messageName string The name of the message to send
---@param unreliable? boolean If set to `true`, the message is not guaranteed to reach its destination
---@return boolean # `true` if the message has been started.
function net.Start(messageName, unreliable) end

---[SHARED] Writes an angle to the current net message.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteAngle)
---@param angle Angle The angle to be sent.
function net.WriteAngle(angle) end

---[SHARED] Appends a boolean (as `1` or `0`) to the current net message.
---
--- Please note that the bit is written here from a boolean (`true/false`) but net.ReadBit returns a number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteBit)
---@param boolean boolean Bit status (false = `0`, true = `1`).
function net.WriteBit(boolean) end

---[SHARED] Appends a boolean to the current net message. Alias of net.WriteBit.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteBool)
---@param boolean boolean Boolean value to write.
function net.WriteBool(boolean) end

---[SHARED] Appends a Color to the current net message.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteColor)
---@param Color table The Color you want to append to the net message.
---@param writeAlpha? boolean If we should write the alpha of the color or not.
function net.WriteColor(Color, writeAlpha) end

---[SHARED] Writes a chunk of binary data to the message.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteData)
---@param binaryData string The binary data to be sent.
---@param length? number The length of the binary data to be sent, in bytes.
function net.WriteData(binaryData, length) end

---[SHARED] Appends a double-precision number to the current net message.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteDouble)
---@param double number The double to be sent
function net.WriteDouble(double) end

---[SHARED] Appends an entity to the current net message using its Entity:EntIndex.
---
--- See net.ReadEntity for the function to read the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteEntity)
---@param entity Entity The entity to be sent.
function net.WriteEntity(entity) end

---[SHARED] Appends a float (number with decimals) to the current net message.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteFloat)
---@param float number The float to be sent.
function net.WriteFloat(float) end

---[SHARED] Appends a signed integer - a whole number, positive/negative - to the current net message. Can be read back with net.ReadInt on the receiving end.
---
--- Use net.WriteUInt to send an unsigned number (that you know will **never** be negative). Use net.WriteFloat for a non-whole number (e.g. `2.25`).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteInt)
---@param integer number The integer to be sent.
---@param bitCount number The amount of bits the number consists of. This must be **32** or less.
---
--- If you are unsure what to set, just set it to `32`.
---
--- Consult the table below to determine the bit count you need:
---
--- | Bit Count |  Minimum value |  Maximum value |
--- |-----------|:--------------:|:--------------:|
--- | 3 | -4 | 3 |
--- | 4 | -8 | 7 |
--- | 5 | -16 | 15 |
--- | 6 | -32 | 31 |
--- | 7 | -64 | 63 |
--- | 8 | -128 | 127 |
--- | 9 | -256 | 255 |
--- | 10 | -512 | 511 |
--- | 11 | -1024 | 1023 |
--- | 12 | -2048 | 2047 |
--- | 13 | -4096 | 4095 |
--- | 14 | -8192 | 8191 |
--- | 15 | -16384 | 16383 |
--- | 16 | -32768 | 32767 |
--- | 17 | -65536 | 65535 |
--- | 18 | -131072 | 131071 |
--- | 19 | -262144 | 262143 |
--- | 20 | -524288 | 524287 |
--- | 21 | -1048576 | 1048575 |
--- | 22 | -2097152 | 2097151 |
--- | 23 | -4194304 | 4194303 |
--- | 24 | -8388608 | 8388607 |
--- | 25 | -16777216 | 16777215 |
--- | 26 | -33554432 | 33554431 |
--- | 27 | -67108864 | 67108863 |
--- | 28 | -134217728 | 134217727 |
--- | 29 | -268435456 | 268435455 |
--- | 30 | -536870912 | 536870911 |
--- | 31 | -1073741824 | 1073741823 |
--- | 32 | -2147483648 | 2147483647 |
---
function net.WriteInt(integer, bitCount) end

---[SHARED] Writes a VMatrix to the current net message.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteMatrix)
---@param matrix VMatrix The matrix to be sent.
function net.WriteMatrix(matrix) end

---[SHARED] Writes a normalized/direction vector ( Vector with length of 1 ) to the net message.
---
--- This function uses less bandwidth compared to net.WriteVector and will not send vectors with length of > 1 properly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteNormal)
---@param normal Vector The normalized/direction vector to be send.
function net.WriteNormal(normal) end

---[SHARED] Appends a player entity to the current net message using its Entity:EntIndex. This saves a small amount of network bandwidth over net.WriteEntity.
---
--- See net.ReadPlayer for the function to read the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WritePlayer)
---@param ply Player The player to be sent.
function net.WritePlayer(ply) end

---[SHARED] Appends a string to the current net message. The size of the string is 8 bits plus 8 bits for every ASCII character in the string. The maximum allowed length of a single written string is **65532 characters**.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteString)
---@param string string The string to be sent.
function net.WriteString(string) end

---[SHARED] Appends a table to the current net message. Adds **16 extra bits** per key/value pair, so you're better off writing each individual key/value as the exact type if possible.
---
--- All net messages have a **64kb** buffer. This function will not check or error when that buffer is overflown. You might want to consider using util.TableToJSON and util.Compress and send the resulting string in **60kb** chunks, doing the opposite on the receiving end.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteTable)
---@param table table The table to be sent.
---
--- If the table contains a `nil` key the table may not be read correctly.
---
--- Not all objects can be sent over the network. Things like functions, IMaterials, etc will cause errors when reading the table from a net message.
---@param sequential? boolean Set to `true` if the input table is sequential. This saves on bandwidth, adding **8 extra bits** per key/value pair instead of 16 bits.
---
--- To read the table you need to give net.ReadTable the same value!
---
function net.WriteTable(table, sequential) end

---[SHARED] Used internally by net.WriteTable.
---
--- Appends any type of value to the current net message.
---
--- An additional 8-bit unsigned integer indicating the type will automatically be written to the packet before the value, in order to facilitate reading with net.ReadType. If you know the data type you are writing, use a function meant for that specific data type to reduce amount of data sent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteType)
---@param Data any The data to be sent.
function net.WriteType(Data) end

---[SHARED] Appends an unsigned integer with the specified number of bits to the current net message.
---
--- Use net.WriteInt if you want to send negative and positive numbers. Use net.WriteFloat for a non-whole number (e.g. `2.25`).
---
--- Unsigned numbers **do not** support negative numbers.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteUInt)
---@param unsignedInteger number The unsigned integer to be sent.
---@param bitCount number The size of the integer to be sent, in bits. Acceptable values range from any number `1` to `32` inclusive.
---
--- For reference: `1` = bit, `4` = nibble, `8` = byte, `16` = short, `32` = long.
---
--- Consult the table below to determine the bit count you need. The minimum value for all bit counts is `0`.
---
--- | Bit Count |  Maximum value |
--- |-----------|:--------------:|
--- | 1 | 1  |
--- | 2 | 3  |
--- | 3 | 7  |
--- | 4 | 15 |
--- | 5 | 31 |
--- | 6 | 63 |
--- | 7 | 127 |
--- | 8 | 255 |
--- | 9 | 511 |
--- | 10 | 1023 |
--- | 11 | 2047 |
--- | 12 | 4095 |
--- | 13 | 8191 |
--- | 14 | 16383 |
--- | 15 | 32767 |
--- | 16 | 65535 |
--- | 17 | 131071 |
--- | 18 | 262143 |
--- | 19 | 524287  |
--- | 20 | 1048575  |
--- | 21 | 2097151  |
--- | 22 | 4194303  |
--- | 23 | 8388607  |
--- | 24 | 16777215  |
--- | 25 | 33554431  |
--- | 26 | 67108863  |
--- | 27 | 134217727  |
--- | 28 | 268435455  |
--- | 29 | 536870911  |
--- | 30 | 1073741823 |
--- | 31 | 2147483647 |
--- | 32 | 4294967295 |
---
function net.WriteUInt(unsignedInteger, bitCount) end

---[SHARED] Appends an unsigned integer with 64 bits to the current net message.
---
--- 		The limit for an uint64 is 18'446'744'073'709'551'615.
--- 		Everything above the limit will be set to the limit.
---
--- 		Unsigned numbers **do not** support negative numbers.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteUInt64)
---@param uint64 string The 64 bit value to be sent. Can be a number.
---
--- 				Since Lua cannot store full 64-bit integers, this function takes a string. It is mainly aimed at usage with Player:SteamID64.
---
--- 				If your input is a number and not a string, it won't be networked correctly as soon as it has more than 13 digits.
--- 				This is because Lua represents numbers over 13 digits as `1e+14`(`100 000 000 000 000`)
--- 				You can do something like this to convert it to a string: `string.format("%.0f", number)`.
--- 				If you try to use Global.tostring it will fail because it will create a result something like `1e+14` which doesn't work.
---
---
function net.WriteUInt64(uint64) end

---[SHARED] Appends a vector to the current net message.
--- Vectors sent by this function are compressed, which may result in precision loss. XYZ components greater than `16384` or less than `-16384` are irrecoverably altered (most significant bits are trimmed) and precision after the decimal point is low.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/net.WriteVector)
---@param vector Vector The vector to be sent.
function net.WriteVector(vector) end
