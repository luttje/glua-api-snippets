---@meta

---@class DExpandButton : DButton
local DExpandButton = {}

---[CLIENT] Returns whether this DExpandButton is expanded or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DExpandButton:GetExpanded)
---@return boolean #True if expanded, false otherwise
function DExpandButton:GetExpanded() end

---[CLIENT] Sets whether this DExpandButton should be expanded or not. Only changes appearance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DExpandButton:SetExpanded)
---@param expanded boolean True to expand ( visually will show a "-" )
function DExpandButton:SetExpanded(expanded) end
