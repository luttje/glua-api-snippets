---@meta

---[CLIENT] Gets the killicon being shown.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DKillIcon:GetName)
---@return string # The name of the killicon currently being displayed.
function DKillIcon:GetName() end

---@class DKillIcon : Panel
local DKillIcon = {}

---[CLIENT] Sets the killicon to be displayed. You should call Panel:SizeToContents following this.
---
--- Killicons can be added with killicon.Add and killicon.AddFont.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DKillIcon:SetName)
---@param iconName string The name of the killicon to be displayed.
function DKillIcon:SetName(iconName) end
