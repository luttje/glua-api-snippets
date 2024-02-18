---@meta

--- The file library provides functions for finding, reading and writing to files.
--- The following path values are most commonly used:
--- * `LUA` searches the lua files (in /lua/, in your gamemodes, in all the addons).
--- * `GAME` searches all the mounted content (main folder, addons, mounted games etc).
--- * `MOD` searches only the garrysmod folder.
--- * `DATA` searches in the data folder.
---
--- See File Search Paths for the descriptive list of path values.
--- For the full list of path values, type `path` in the console.
file = {}

---[SHARED AND MENU] Appends a file relative to the `data` folder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Append)
---@param name string The file's name.
---@param content string The content which should be appended to the file.
function file.Append(name, content) end

---[SHARED AND MENU] Returns the content of a file asynchronously.
---
--- All limitations of file.Read also apply.
--- This function is currently broken in the Menu State and won't be fixed. [Bug Report](https://github.com/Facepunch/garrysmod-issues/issues/5433)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.AsyncRead)
---@param fileName string The name of the file.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@param callback function
--- A callback function that will be called when the file read operation finishes. Arguments are:
--- * string fileName - The `fileName` argument above.
--- * string gamePath - The `gamePath` argument above.
--- * number status - The status of the operation. The list can be found in Enums/FSASYNC.
--- * string data - The entirety of the data of the file.
---
---@param sync? boolean If `true` the file will be read synchronously.
---@return number # Enums/FSASYNC on success, Enums/FSASYNC on failure.
function file.AsyncRead(fileName, gamePath, callback, sync) end

---[SHARED AND MENU] Creates a directory that is relative to the `data` folder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.CreateDir)
---@param name string The directory's name.
function file.CreateDir(name) end

---[SHARED AND MENU] Deletes a file or `empty` folder that is relative to the **data** folder. You can't remove any files outside of **data** folder.
--- You are able to delete **any** file in the Menu state.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Delete)
---@param name string The file name.
---@param path string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
--- This is only available in the menu state.
function file.Delete(name, path) end

---[SHARED AND MENU] Returns a boolean of whether the file or directory exists or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Exists)
---@param name string The file or directory's name.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return boolean # Returns `true` if the file exists and `false` if it does not.
function file.Exists(name, gamePath) end

---[SHARED AND MENU] Returns a list of files and directories inside a single folder.
--- 		It seems that paths with capital letters (e.g. lua/MyFolder/*) don't work as expected on Linux.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Find)
---@param name string The wildcard to search for. `models/*.mdl` will list **.mdl** files in the `models/` folder.
---@param path string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@param sorting? string The sorting to be used, **optional**.
---
--- * `nameasc` sort the files ascending by name.
--- * `namedesc` sort the files descending by name.
--- * `dateasc` sort the files ascending by date.
--- * `datedesc` sort the files descending by date.
---
---@return table # A table of found files, or `nil` if the path is invalid
---@return table # A table of found directories, or `nil` if the path is invalid
function file.Find(name, path, sorting) end

---[SHARED AND MENU] Returns whether the given file is a directory or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.IsDir)
---@param fileName string The file or directory's name.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return boolean # `true` if the given path is a directory or `false` if it's a file.
function file.IsDir(fileName, gamePath) end

---[SHARED AND MENU] Attempts to open a file with the given mode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Open)
---@param fileName string The files name. See file.Write for details on filename restrictions when writing to files.
---@param fileMode string The mode to open the file in. Possible values are:
--- * **r** - read mode
--- * **w** - write mode
--- * **a** - append mode
--- * **rb** - binary read mode
--- * **wb** - binary write mode
--- * **ab** - binary append mode
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return file_class # The opened file object, or `nil` if it failed to open due to it not existing or being used by another process.
function file.Open(fileName, fileMode, gamePath) end

---[SHARED AND MENU] Returns the content of a file.
---
--- Beware of casing -- some filesystems are case-sensitive. SRCDS on Linux seems to force file/directory creation to lowercase, but will not modify read operations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Read)
---@param fileName string The name of the file.
---@param gamePath? string The path to look for the files and directories in. If this argument is set to `true` then the path will be `GAME`, otherwise if the argument is `false` or `nil` then the path will be `DATA`. See File_Search_Paths for a list of valid paths.
---@return string # The data from the file as a string, or `nil` if the file isn't found.
function file.Read(fileName, gamePath) end

---[SHARED AND MENU] Attempts to rename a file with the given name to another given name.
---
--- This function is constrained to the `data/` folder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Rename)
---@param orignalFileName string The original file or folder name. See file.Write for details on filename restrictions when writing to files.
---
--- **This argument will be forced lowercase.**
---@param targetFileName string The target file or folder name. See file.Write for details on filename restrictions when writing to files.
---
--- **This argument will be forced lowercase.**
---@return boolean # `true` on success, `false` otherwise.
function file.Rename(orignalFileName, targetFileName) end

---[SHARED AND MENU] Returns the file's size in bytes. If the file is not found, returns `-1`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Size)
---@param fileName string The file's name.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
function file.Size(fileName, gamePath) end

---[SHARED AND MENU] Returns when the file or folder was last modified in Unix time.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Time)
---@param path string The **file** or **folder** path.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return number # Seconds passed since Unix epoch.
function file.Time(path, gamePath) end

---[SHARED AND MENU] Writes the given string to a file. Erases all previous data in the file. To add data without deleting previous data, use file.Append.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/file.Write)
---@param fileName string The name of the file being written into. The path is relative to the **data/** folder.
---
--- This argument will be forced lowercase.
---
--- The filename **must** end with one of the following:
--- * .txt
--- * .dat
--- * .json
--- * .xml
--- * .csv
--- * .jpg
--- * .jpeg
--- * .png
--- * .vtf
--- * .vmt
--- * .mp3
--- * .wav
--- * .ogg
--- * .vcd
--- * .dem
--- * .gma
---
--- Restricted symbols are: `" :`
---
---@param content string The content that will be written into the file.
function file.Write(fileName, content) end

---@class File
local File = {}

---[SHARED AND MENU] Dumps the file changes to disk and closes the file handle which makes the handle useless.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Close)
function File:Close() end

---[SHARED AND MENU] Returns whether the File object has reached the end of file or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:EndOfFile)
---@return boolean # Whether the file has reached end or not.
function File:EndOfFile() end

---[SHARED AND MENU] Dumps the file changes to disk and saves the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Flush)
function File:Flush() end

---[SHARED AND MENU] Reads the specified amount of chars and returns them as a binary string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Read)
---@param length? number Reads the specified amount of chars. If not set, will read the entire file.
---@return string #
function File:Read(length) end

---[SHARED AND MENU] Reads one byte of the file and returns whether that byte was not 0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadBool)
---@return boolean # val
function File:ReadBool() end

---[SHARED AND MENU] Reads one unsigned 8-bit integer from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadByte)
---@return number # The unsigned 8-bit integer from the file.
function File:ReadByte() end

---[SHARED AND MENU] Reads an 8-byte little-endian IEEE-754 floating point double from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadDouble)
---@return number # The double-precision floating point value read from the file.
function File:ReadDouble() end

---[SHARED AND MENU] Reads an IEEE 754 little-endian 4-byte float from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadFloat)
---@return number # The read value
function File:ReadFloat() end

---[SHARED AND MENU] Returns the contents of the file from the current position up until the end of the current line.
---
--- This function will look specifically for `Line Feed` characters `\n` and will **completely ignore `Carriage Return` characters** `\r`.
--- This function will not return more than 8192 characters. The return value will include the `\n` character.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadLine)
---@return string # The string of data from the read line.
function File:ReadLine() end

---[SHARED AND MENU] Reads a signed little-endian 32-bit integer from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadLong)
---@return number # A signed 32-bit integer
function File:ReadLong() end

---[SHARED AND MENU] Reads a signed little-endian 16-bit integer from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadShort)
---@return number # int16
function File:ReadShort() end

---[SHARED AND MENU] Reads an unsigned 64-bit integer from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadUInt64)
---@return string # An unsigned 64-bit integer. Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with Player:SteamID64.
function File:ReadUInt64() end

---[SHARED AND MENU] Reads an unsigned little-endian 32-bit integer from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadULong)
---@return number # An unsigned 32-bit integer
function File:ReadULong() end

---[SHARED AND MENU] Reads an unsigned little-endian 16-bit integer from the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:ReadUShort)
---@return number # The 16-bit integer
function File:ReadUShort() end

---[SHARED AND MENU] Sets the file pointer to the specified position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Seek)
---@param pos number Pointer position, in bytes.
function File:Seek(pos) end

---[SHARED AND MENU] Returns the size of the file in bytes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Size)
---@return number #
function File:Size() end

---[SHARED AND MENU] Moves the file pointer by the specified amount of chars.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Skip)
---@param amount number The amount of chars to skip, can be negative to skip backwards.
---@return number # amount
function File:Skip(amount) end

---[SHARED AND MENU] Returns the current position of the file pointer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Tell)
---@return number # pos
function File:Tell() end

---[SHARED AND MENU] Writes the given string into the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:Write)
---@param data string Binary data to write to the file.
function File:Write(data) end

---[SHARED AND MENU] Writes a boolean value to the file as one **byte**.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteBool)
---@param bool boolean The bool to be written to the file.
function File:WriteBool(bool) end

---[SHARED AND MENU] Write an 8-bit unsigned integer to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteByte)
---@param uint8 number The 8-bit unsigned integer to be written to the file.
function File:WriteByte(uint8) end

---[SHARED AND MENU] Writes an 8-byte little-endian IEEE-754 floating point double to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteDouble)
---@param double number The double to be written to the file.
function File:WriteDouble(double) end

---[SHARED AND MENU] Writes an IEEE 754 little-endian 4-byte float to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteFloat)
---@param float number The float to be written to the file.
function File:WriteFloat(float) end

---[SHARED AND MENU] Writes a signed little-endian 32-bit integer to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteLong)
---@param int32 number The 32-bit signed integer to be written to the file.
function File:WriteLong(int32) end

---[SHARED AND MENU] Writes a signed little-endian 16-bit integer to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteShort)
---@param int16 number The 16-bit signed integer to be written to the file.
function File:WriteShort(int16) end

---[SHARED AND MENU] Writes an unsigned 64-bit integer to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteUInt64)
---@param uint64 string The unsigned 64-bit integer to be written to the file.
---
--- Since Lua cannot store full 64-bit integers, this function takes a string. It is mainly aimed at usage with Player:SteamID64.
---
function File:WriteUInt64(uint64) end

---[SHARED AND MENU] Writes an unsigned little-endian 32-bit integer to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteULong)
---@param uint32 number The unsigned 32-bit integer to be written to the file.
function File:WriteULong(uint32) end

---[SHARED AND MENU] Writes an unsigned little-endian 16-bit integer to the file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/File:WriteUShort)
---@param uint16 number The unsigned 16-bit integer to the file.
function File:WriteUShort(uint16) end
