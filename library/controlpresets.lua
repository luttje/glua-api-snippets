---@meta

---
--- 		A preset manager, found at the top of almost every default tool's C-menu.
---
--- 		This control only exists in Sandbox derived gamemodes.
---
---@class ControlPresets : Panel
local ControlPresets = {}

---[CLIENT] Adds a convar to be managed by this control.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:AddConVar)
---@param convar string The convar to add.
function ControlPresets:AddConVar(convar) end

---[CLIENT] Get a list of all Console Variables being managed by this panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:GetConVars)
---@return table # numbered table of convars
function ControlPresets:GetConVars() end

---[CLIENT] Set the name label text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:SetLabel)
---@param name string The text to put in the label
function ControlPresets:SetLabel(name) end
