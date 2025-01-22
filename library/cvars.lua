---@meta

--- The cvars library allows you to control what happens when a cvar (console variable) is changed.
cvars = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Adds a callback to be called when the named convar changes.
---
--- This does not callback convars in the menu state.
--- This does not callback convars on the client with FCVAR_GAMEDLL and convars on the server without FCVAR_GAMEDLL.
--- This does not callback convars on the client with FCVAR_REPLICATED.
---
---[View wiki](https://wiki.facepunch.com/gmod/cvars.AddChangeCallback)
---@param name string The name of the convar to add the change callback to.
---@param callback fun(convar: string, oldValue: string, newValue: string) The function to be called when the convar changes.
---
--- Function argument(s):
--- * string `convar` - The name of the convar.
--- * string `oldValue` - The old value of the convar.
--- * string `newValue` - The new value of the convar.
---@param identifier? string If set, you will be able to remove the callback using cvars.RemoveChangeCallback.
---
---  The identifier is not required to be globally unique, as it's paired with the actual name of the convar.
function cvars.AddChangeCallback(name, callback, identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Retrieves console variable as a boolean.
---
---[View wiki](https://wiki.facepunch.com/gmod/cvars.Bool)
---@param cvar string Name of console variable
---@param default? boolean The value to return if the console variable does not exist
---@return boolean # Retrieved value
function cvars.Bool(cvar, default) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a table of the given [ConVar](https://wiki.facepunch.com/gmod/ConVar)s callbacks.
---
---[View wiki](https://wiki.facepunch.com/gmod/cvars.GetConVarCallbacks)
---@param name string The name of the ConVar.
---@param createIfNotFound? boolean Whether or not to create the internal callback table for given ConVar if there isn't one yet.
---
--- This argument is internal and should not be used.
---@return table # A table of the convar's callbacks, or nil if the convar doesn't exist.
function cvars.GetConVarCallbacks(name, createIfNotFound) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Retrieves console variable as a number.
---
---[View wiki](https://wiki.facepunch.com/gmod/cvars.Number)
---@param cvar string Name of console variable
---@param default? any The value to return if the console variable does not exist
---@return number # Retrieved value or the second argument if the console variable does not exist. Will return 0 if the console variable exists and has a string value.
function cvars.Number(cvar, default) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) **INTERNAL**: You are probably looking for [cvars.AddChangeCallback](https://wiki.facepunch.com/gmod/cvars.AddChangeCallback).
---
--- Called by the engine when a convar value changes.
---
---[View wiki](https://wiki.facepunch.com/gmod/cvars.OnConVarChanged)
---@param name string Convar name
---@param oldVal string The old value of the convar
---@param newVal string The new value of the convar
function cvars.OnConVarChanged(name, oldVal, newVal) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes a callback for a convar using the the callback's identifier. The identifier should be the third argument specified for [cvars.AddChangeCallback](https://wiki.facepunch.com/gmod/cvars.AddChangeCallback).
---
---[View wiki](https://wiki.facepunch.com/gmod/cvars.RemoveChangeCallback)
---@param name string The name of the convar to remove the callback from.
---@param indentifier string The callback's identifier.
function cvars.RemoveChangeCallback(name, indentifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Retrieves console variable as a string.
---
---[View wiki](https://wiki.facepunch.com/gmod/cvars.String)
---@param cvar string Name of console variable
---@param default? any The value to return if the console variable does not exist
---@return string # Retrieved value
function cvars.String(cvar, default) end
