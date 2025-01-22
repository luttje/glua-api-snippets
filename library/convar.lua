---@meta

--- An object returned by [Global.CreateConVar](https://wiki.facepunch.com/gmod/Global.CreateConVar), [Global.CreateClientConVar](https://wiki.facepunch.com/gmod/Global.CreateClientConVar) (which uses [Global.CreateConVar](https://wiki.facepunch.com/gmod/Global.CreateConVar) internally), and [Global.GetConVar](https://wiki.facepunch.com/gmod/Global.GetConVar).
---
--- It represents a console variable. See [this](https://wiki.facepunch.com/gmod/ConVars) page for more information.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar)
---@class ConVar
local ConVar = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Tries to convert the current string value of a [ConVar](https://wiki.facepunch.com/gmod/ConVar) to a boolean.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetBool)
---@return boolean # The boolean value of the console variable. If the variable is numeric and not 0, the result will be `true`. Otherwise the result will be `false`.
function ConVar:GetBool() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the default value of the [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetDefault)
---@return string # The default value of the console variable.
function ConVar:GetDefault() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the [Enums/FCVAR](https://wiki.facepunch.com/gmod/Enums/FCVAR) flags of the ConVar
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetFlags)
---@return number # The bitflag. See Enums/FCVAR
function ConVar:GetFlags() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to convert the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value to a float
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetFloat)
---@return number # The float value of the console variable.
---
--- If the value cannot be converted to a float, it will return 0.
function ConVar:GetFloat() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the help text assigned to that convar.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetHelpText)
---@return string # The help text
function ConVar:GetHelpText() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to convert the [ConVar](https://wiki.facepunch.com/gmod/ConVar) value to a integer.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetInt)
---@return number # The integer value of the console variable.
---
--- If it fails to convert to an integer, it will return 0.
---
--- All float/decimal values will be rounded down. ( With math.floor )
function ConVar:GetInt() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the maximum value of the [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetMax)
---@return number # The maximum value of the ConVar
function ConVar:GetMax() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the minimum value of the [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetMin)
---@return number # The minimum value of the ConVar
function ConVar:GetMin() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the name of the [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetName)
---@return string # The name of the console variable.
function ConVar:GetName() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the current [ConVar](https://wiki.facepunch.com/gmod/ConVar) value as a string.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:GetString)
---@return string # The current console variable value as a string.
function ConVar:GetString() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the specified flag is set on the [ConVar](https://wiki.facepunch.com/gmod/ConVar)
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:IsFlagSet)
---@param flag number The Enums/FCVAR flag to test
---@return boolean # Whether the flag is set or not
function ConVar:IsFlagSet(flag) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Reverts [ConVar](https://wiki.facepunch.com/gmod/ConVar) to its default value
---
--- **NOTE**: This can only be ran on ConVars created from within Lua.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:Revert)
function ConVar:Revert() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets a ConVar's value to 1 or 0 based on the input boolean. This can only be ran on ConVars created from within Lua.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:SetBool)
---@param value boolean Value to set the ConVar to.
function ConVar:SetBool(value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets a ConVar's value to the input number.
--- 	**NOTE**: This can only be ran on ConVars created from within Lua.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:SetFloat)
---@param value number Value to set the ConVar to.
function ConVar:SetFloat(value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets a ConVar's value to the input number after converting it to an integer.
---
--- **NOTE**: This can only be ran on ConVars created from within Lua.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:SetInt)
---@param value number Value to set the ConVar to.
function ConVar:SetInt(value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets a ConVar's value to the input string. This can only be ran on ConVars created from within Lua.
---
---[View wiki](https://wiki.facepunch.com/gmod/ConVar:SetString)
---@param value string Value to set the ConVar to.
function ConVar:SetString(value) end
