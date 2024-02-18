---@meta

--- An object returned by Global.CreateConVar, Global.CreateClientConVar (which uses Global.CreateConVar internally), and Global.GetConVar.
---
--- It represents a console variable. See ConVars page for more information.
---@class ConVar
local ConVar = {}

---[SHARED AND MENU] Tries to convert the current string value of a ConVar to a boolean.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetBool)
---@return boolean # The boolean value of the console variable. If the variable is numeric and not 0, the result will be `true`. Otherwise the result will be `false`.
function ConVar:GetBool() end

---[SHARED AND MENU] Returns the default value of the ConVar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetDefault)
---@return string # The default value of the console variable.
function ConVar:GetDefault() end

---[SHARED AND MENU] Returns the Enums/FCVAR flags of the ConVar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetFlags)
---@return number # The bitflag. See Enums/FCVAR
function ConVar:GetFlags() end

---[SHARED AND MENU] Attempts to convert the ConVar value to a float
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetFloat)
---@return number # The float value of the console variable.   If the value cannot be converted to a float, it will return 0.
function ConVar:GetFloat() end

---[SHARED AND MENU] Returns the help text assigned to that convar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetHelpText)
---@return string # The help text
function ConVar:GetHelpText() end

---[SHARED AND MENU] Attempts to convert the ConVar value to a integer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetInt)
---@return number # The integer value of the console variable.   If it fails to convert to an integer, it will return 0.   All float/decimal values will be rounded down. ( With math.floor )
function ConVar:GetInt() end

---[SHARED AND MENU] Returns the maximum value of the ConVar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetMax)
---@return number # The maximum value of the ConVar
function ConVar:GetMax() end

---[SHARED AND MENU] Returns the minimum value of the ConVar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetMin)
---@return number # The minimum value of the ConVar
function ConVar:GetMin() end

---[SHARED AND MENU] Returns the name of the ConVar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetName)
---@return string # The name of the console variable.
function ConVar:GetName() end

---[SHARED AND MENU] Returns the current ConVar value as a string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:GetString)
---@return string # The current console variable value as a string.
function ConVar:GetString() end

---[SHARED AND MENU] Returns whether the specified flag is set on the ConVar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:IsFlagSet)
---@param flag number The Enums/FCVAR flag to test
---@return boolean # Whether the flag is set or not
function ConVar:IsFlagSet(flag) end

---[SHARED AND MENU] Reverts ConVar to its default value
---
--- This can only be ran on ConVars created from within Lua.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:Revert)
function ConVar:Revert() end

---[SHARED AND MENU] Sets a ConVar's value to 1 or 0 based on the input boolean. This can only be ran on ConVars created from within Lua.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:SetBool)
---@param value boolean Value to set the ConVar to.
function ConVar:SetBool(value) end

---[SHARED AND MENU] Sets a ConVar's value to the input number.
--- 	This can only be ran on ConVars created from within Lua.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:SetFloat)
---@param value number Value to set the ConVar to.
function ConVar:SetFloat(value) end

---[SHARED AND MENU] Sets a ConVar's value to the input number after converting it to an integer.
---
--- This can only be ran on ConVars created from within Lua.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:SetInt)
---@param value number Value to set the ConVar to.
function ConVar:SetInt(value) end

---[SHARED AND MENU] Sets a ConVar's value to the input string. This can only be ran on ConVars created from within Lua.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ConVar:SetString)
---@param value string Value to set the ConVar to.
function ConVar:SetString(value) end
