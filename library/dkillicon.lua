---@meta

--- Uses the [killicon](https://wiki.facepunch.com/gmod/killicon) to persistently draw a killicon.
---@class DKillIcon : Panel
local DKillIcon = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets the killicon being shown.
---
---[View wiki](https://wiki.facepunch.com/gmod/DKillIcon:GetName)
---@return string # The name of the killicon currently being displayed.
function DKillIcon:GetName() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the killicon to be displayed. You should call [Panel:SizeToContents](https://wiki.facepunch.com/gmod/Panel:SizeToContents) following this.
---
--- Killicons can be added with [killicon.Add](https://wiki.facepunch.com/gmod/killicon.Add) and [killicon.AddFont](https://wiki.facepunch.com/gmod/killicon.AddFont).
---
---[View wiki](https://wiki.facepunch.com/gmod/DKillIcon:SetName)
---@param iconName string The name of the killicon to be displayed.
function DKillIcon:SetName(iconName) end
