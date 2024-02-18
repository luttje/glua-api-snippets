---@meta

--- Uses the killicon to persistently draw a killicon.Creates a DKillIcon and sets it to the crowbar killicon.
---@class DKillIcon : Panel
local DKillIcon = {}

---[CLIENT] Gets the killicon being shown.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DKillIcon:GetName)
---@return string # The name of the killicon currently being displayed.
function DKillIcon:GetName() end

---[CLIENT] Sets the killicon to be displayed. You should call Panel:SizeToContents following this.
---
--- Killicons can be added with killicon.Add and killicon.AddFont.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DKillIcon:SetName)
---@param iconName string The name of the killicon to be displayed.
function DKillIcon:SetName(iconName) end
