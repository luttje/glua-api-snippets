---@meta

--- The file library provides functions for finding, reading and writing to files.
--- The following path values are most commonly used:
--- * `LUA` searches the lua files (in /lua/, in your gamemodes, in all the addons).
--- * `GAME` searches all the mounted content (main folder, addons, mounted games etc).
--- * `MOD` searches only the garrysmod folder.
--- * `DATA` searches in the data folder.
---
--- See [File Search Paths](https://wiki.facepunch.com/gmod/File_Search_Paths) for the descriptive list of path values.
--- For the full list of path values, type `path` in the console.
file = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Appends a file relative to the `data` folder.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Append)
---@param name string The file's name.
---@param content string The content which should be appended to the file.
---@return boolean # If the operation was successful
function file.Append(name, content) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the content of a file asynchronously.
---
--- All limitations of [file.Read](https://wiki.facepunch.com/gmod/file.Read) also apply.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.AsyncRead)
---@param fileName string The name of the file.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@param callback fun(fileName: string, gamePath: string, status: number, data: string) A callback function that will be called when the file read operation finishes.
---
--- Function argument(s):
--- * string `fileName` - The `fileName` argument above.
--- * string `gamePath` - The `gamePath` argument above.
--- * number `status` - The status of the operation. The list can be found in Enums/FSASYNC.
--- * string `data` - The entirety of the data of the file.
---@param sync? boolean If `true` the file will be read synchronously.
---@return FSASYNC # Enums/FSASYNC on success, Enums/FSASYNC on failure.
function file.AsyncRead(fileName, gamePath, callback, sync) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a directory that is relative to the `data` folder.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.CreateDir)
---@param name string The directory's name.
function file.CreateDir(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Deletes a file or `empty` folder that is relative to the **data** folder. You can't remove any files outside of **data** folder.
--- **NOTE**: You are able to delete **any** file in the Menu state.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Delete)
---@param name string The file name.
---@param path? string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
--- This is only available in the menu state.
---@return boolean #
function file.Delete(name, path) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a boolean of whether the file or directory exists or not.
--- If you want to check for a directory, [file.IsDir](https://wiki.facepunch.com/gmod/file.IsDir) will be faster since it won't check for files.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Exists)
---@param name string The file or directory's name. ( You must include the file extension for files, for example "data.txt" )
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return boolean # Returns `true` if the file exists and `false` if it does not.
function file.Exists(name, gamePath) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a list of files and directories inside a single folder.
--- **WARNING**: It seems that paths with capital letters (e.g. lua/MyFolder/*) don't work as expected on Linux.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Find)
---@param name string The wildcard to search for. `models/*.mdl` will list **.mdl** files in the `models/` folder.
---@param path string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@param sorting? string The sorting to be used, **optional**.
---
--- * `nameasc` sort the files ascending by name.
--- * `namedesc` sort the files descending by name.
--- * `dateasc` sort the files ascending by date.
--- * `datedesc` sort the files descending by date.
---@return table # A table of found files, or `nil` if the path is invalid
---@return table # A table of found directories, or `nil` if the path is invalid
function file.Find(name, path, sorting) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the given file is a directory or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.IsDir)
---@param fileName string The file or directory's name.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return boolean # `true` if the given path is a directory or `false` if it's a file.
function file.IsDir(fileName, gamePath) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to open a file with the given mode.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Open)
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

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the content of a file.
---
--- **WARNING**: Beware of casing -- some filesystems are case-sensitive. SRCDS on Linux seems to force file/directory creation to lowercase, but will not modify read operations.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Read)
---@param fileName string The name of the file.
---@param gamePath? string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return string # The data from the file as a string, or `nil` if the file isn't found.
function file.Read(fileName, gamePath) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to rename a file with the given name to another given name.
---
--- This function is constrained to the `data/` folder.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Rename)
---@param orignalFileName string The original file or folder name. See file.Write for details on filename restrictions when writing to files.
---
--- **This argument will be forced lowercase.**
---@param targetFileName string The target file or folder name. See file.Write for details on filename restrictions when writing to files.
---
--- **This argument will be forced lowercase.**
---@return boolean # `true` on success, `false` otherwise.
function file.Rename(orignalFileName, targetFileName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the file's size in bytes.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Size)
---@param fileName string The file's name.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return number # The file size in bytes, or `-1` if the file is not found.
function file.Size(fileName, gamePath) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns when the file or folder was last modified in Unix time.
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Time)
---@param path string The **file** or **folder** path.
---@param gamePath string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return number # Seconds passed since Unix epoch, or `0` if the file is not found.
function file.Time(path, gamePath) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes the given string to a file. Erases all previous data in the file. To add data without deleting previous data, use [file.Append](https://wiki.facepunch.com/gmod/file.Append).
---
---[View wiki](https://wiki.facepunch.com/gmod/file.Write)
---@param fileName string The name of the file being written into. The path is relative to the `data/` folder.
---
--- This argument will be forced lowercase.
---
--- The filename **must** end with one of the following:
--- * .txt
--- * .dat
--- * .json
--- * .xml
--- * .csv
--- * .dem
--- * .vcd
--- * .gma
--- * .mdl
--- * .phy
--- * .vvd
--- * .vtx
--- * .ani
--- * .vtf
--- * .vmt
--- * .png
--- * .jpg
--- * .jpeg
--- * .mp3
--- * .wav
--- * .ogg
---
--- Restricted symbols are: `":`, and multiple consecutive spaces
---@param content string The content that will be written into the file.
---@return boolean # If the operation was successful
function file.Write(fileName, content) end

---@class File
local File = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Dumps the file changes to disk and closes the file handle which makes the handle useless.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Close)
function File:Close() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the [File](https://wiki.facepunch.com/gmod/File) object has reached the end of file or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:EndOfFile)
---@return boolean # Whether the file has reached end or not.
function File:EndOfFile() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Dumps the file changes to disk and saves the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Flush)
function File:Flush() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads the specified amount of chars and returns them as a binary string.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Read)
---@param length? number Reads the specified amount of chars. If not set, will read the entire file.
---@return string #
function File:Read(length) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads one byte of the file and returns whether that byte was not 0.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadBool)
---@return boolean # val
function File:ReadBool() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads one unsigned 8-bit integer from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadByte)
---@return number # The unsigned 8-bit integer from the file.
function File:ReadByte() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads an 8-byte little-endian IEEE-754 floating point double from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadDouble)
---@return number # The double-precision floating point value read from the file.
function File:ReadDouble() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads an IEEE 754 little-endian 4-byte float from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadFloat)
---@return number # The read value
function File:ReadFloat() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the contents of the file from the current position up until the end of the current line.
---
--- **NOTE**: This function will look specifically for `Line Feed` characters `\n` and will **completely ignore `Carriage Return` characters** `\r`.
---
--- It will also stop at a `\0` or `NULL` character, but will add a new line instead.
---
--- This function will not return more than 8192 characters. The return value will include the `\n` character.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadLine)
---@return string # The string of data from the read line.
function File:ReadLine() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads a signed little-endian 32-bit integer from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadLong)
---@return number # A signed 32-bit integer
function File:ReadLong() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads a signed little-endian 16-bit integer from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadShort)
---@return number # int16
function File:ReadShort() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads an unsigned 64-bit integer from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadUInt64)
---@return string # An unsigned 64-bit integer.
--- Since Lua cannot store full 64-bit integers, this function returns a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
function File:ReadUInt64() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads an unsigned little-endian 32-bit integer from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadULong)
---@return number # An unsigned 32-bit integer
function File:ReadULong() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reads an unsigned little-endian 16-bit integer from the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:ReadUShort)
---@return number # The 16-bit integer
function File:ReadUShort() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the file pointer to the specified position.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Seek)
---@param pos number Pointer position, in bytes.
function File:Seek(pos) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the size of the file in bytes.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Size)
---@return number #
function File:Size() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Moves the file pointer by the specified amount of chars.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Skip)
---@param amount number The amount of chars to skip, can be negative to skip backwards.
---@return number # amount
function File:Skip(amount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the current position of the file pointer.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Tell)
---@return number # pos
function File:Tell() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes the given string into the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:Write)
---@param data string Binary data to write to the file.
function File:Write(data) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes a boolean value to the file as one **byte**.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteBool)
---@param bool boolean The bool to be written to the file.
function File:WriteBool(bool) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Write an 8-bit unsigned integer to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteByte)
---@param uint8 number The 8-bit unsigned integer to be written to the file.
function File:WriteByte(uint8) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes an 8-byte little-endian IEEE-754 floating point double to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteDouble)
---@param double number The double to be written to the file.
function File:WriteDouble(double) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes an IEEE 754 little-endian 4-byte float to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteFloat)
---@param float number The float to be written to the file.
function File:WriteFloat(float) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes a signed little-endian 32-bit integer to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteLong)
---@param int32 number The 32-bit signed integer to be written to the file.
function File:WriteLong(int32) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes a signed little-endian 16-bit integer to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteShort)
---@param int16 number The 16-bit signed integer to be written to the file.
function File:WriteShort(int16) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes an unsigned 64-bit integer to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteUInt64)
---@param uint64 string The unsigned 64-bit integer to be written to the file.
---
--- Since Lua cannot store full 64-bit integers, this function takes a string. It is mainly aimed at usage with [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64).
function File:WriteUInt64(uint64) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes an unsigned little-endian 32-bit integer to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteULong)
---@param uint32 number The unsigned 32-bit integer to be written to the file.
function File:WriteULong(uint32) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes an unsigned little-endian 16-bit integer to the file.
---
---[View wiki](https://wiki.facepunch.com/gmod/File:WriteUShort)
---@param uint16 number The unsigned 16-bit integer to the file.
function File:WriteUShort(uint16) end
