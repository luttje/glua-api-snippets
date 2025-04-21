---@meta

--- A base for all context menu panels ( The ones used for tool options in sandbox )
---@class ContextBase : Panel
local ContextBase = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called by spawnmenu functions (when creating a context menu) to fill this control with data.
---
---[View wiki](https://wiki.facepunch.com/gmod/ContextBase:ControlValues)
---@param contextData table A two-membered table:
--- * string convar - The console variable to use. Calls ContextBase:SetConVar.
--- * string label - The text to display inside the control's label.
function ContextBase:ControlValues(contextData) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) for the panel to change/handle, set by [ContextBase:SetConVar](https://wiki.facepunch.com/gmod/ContextBase:SetConVar)
---
---[View wiki](https://wiki.facepunch.com/gmod/ContextBase:ConVar)
---@return string # The ConVar for the panel to change.
function ContextBase:ConVar() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) for the panel to change/handle.
---
---[View wiki](https://wiki.facepunch.com/gmod/ContextBase:SetConVar)
---@param cvar string The ConVar for the panel to change.
function ContextBase:SetConVar(cvar) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) You should override this function and use it to check whether your convar value changed.
---
---[View wiki](https://wiki.facepunch.com/gmod/ContextBase:TestForChanges)
function ContextBase:TestForChanges() end
