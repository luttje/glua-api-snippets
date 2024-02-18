---@meta

---
--- 		A base for all context menu panels ( The ones used for tool options in sandbox )
---
---@class ContextBase : Panel
local ContextBase = {}

---[CLIENT] Called by spawnmenu functions (when creating a context menu) to fill this control with data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContextBase:ControlValues)
---@param contextData table A two-membered table:
--- * string convar - The console variable to use. Calls ContextBase:SetConVar.
--- * string label - The text to display inside the control's label.
function ContextBase:ControlValues(contextData) end

---[CLIENT] Returns the ConVar for the panel to change/handle, set by ContextBase:SetConVar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContextBase:ConVar)
---@return string # The ConVar for the panel to change.
function ContextBase:ConVar() end

---[CLIENT] Sets the ConVar for the panel to change/handle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContextBase:SetConVar)
---@param cvar string The ConVar for the panel to change.
function ContextBase:SetConVar(cvar) end

---[CLIENT] You should override this function and use it to check whether your convar value changed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContextBase:TestForChanges)
function ContextBase:TestForChanges() end
