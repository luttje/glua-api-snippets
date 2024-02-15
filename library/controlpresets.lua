---@meta

---[CLIENT] Get a list of all Console Variables being managed by this panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:GetConVars)
---@return table # numbered table of convars
function ControlPresets:GetConVars() end

---[CLIENT] Adds a convar to be managed by this control.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:AddConVar)
---@param convar string The convar to add.
function ControlPresets:AddConVar(convar) end

---[CLIENT] Set the name label text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:SetLabel)
---@param name string The text to put in the label
function ControlPresets:SetLabel(name) end

---@class ControlPresets : Panel
local ControlPresets = {}
