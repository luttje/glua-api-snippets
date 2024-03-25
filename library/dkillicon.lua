---@meta

--- Uses the [killicon](https://wiki.facepunch.com/gmod/killicon) to persistently draw a killicon.
---@class DKillIcon : Panel
local DKillIcon = {}

---[CLIENT] Gets the killicon being shown.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DKillIcon:GetName)
---@return string # The name of the killicon currently being displayed.
function DKillIcon:GetName() end

---[CLIENT] Sets the killicon to be displayed. You should call [Panel:SizeToContents](https://wiki.facepunch.com/gmod/Panel:SizeToContents) following this.
---
--- Killicons can be added with [killicon.Add](https://wiki.facepunch.com/gmod/killicon.Add) and [killicon.AddFont](https://wiki.facepunch.com/gmod/killicon.AddFont).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DKillIcon:SetName)
---@param iconName string The name of the killicon to be displayed.
function DKillIcon:SetName(iconName) end
