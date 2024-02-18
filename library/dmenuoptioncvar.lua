---@meta

---
---
---
--- 		An internal panel used by DMenu.
--- 		It acts as a menu option that can be checked.
--- 		It automatically sets and reads the given console variable.
---
--- 		It can be right clicked to toggle without closing the DMenu.
---
--- 		Use DMenu:AddCVar instead.
---
---@class DMenuOptionCVar : DMenuOption
local DMenuOptionCVar = {}

---[CLIENT] Returns the ConVars used by the DMenuOptionCVar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOptionCVar:GetConVar)
---@return string # The ConVars used
function DMenuOptionCVar:GetConVar() end

---[CLIENT] Returns the value of the ConVars when the DMenuOptionCVar is not checked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOptionCVar:GetValueOff)
---@return string # The value
function DMenuOptionCVar:GetValueOff() end

---[CLIENT] Return the value of the ConVars when the DMenuOptionCVar is checked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOptionCVar:GetValueOn)
---@return string # The value
function DMenuOptionCVar:GetValueOn() end

---[CLIENT] Sets the ConVars to be used by DMenuOptionCVar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOptionCVar:SetConVar)
---@param cvar string The ConVars name to set
function DMenuOptionCVar:SetConVar(cvar) end

---[CLIENT] Sets the value of the ConVars when the DMenuOptionCVar is not checked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOptionCVar:SetValueOff)
---@param value string The value
function DMenuOptionCVar:SetValueOff(value) end

---[CLIENT] Sets the value of the ConVars when the DMenuOptionCVar is checked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenuOptionCVar:SetValueOn)
---@param value string The value
function DMenuOptionCVar:SetValueOn(value) end
