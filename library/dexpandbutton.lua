---@meta

---
--- 		**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 		The little "+" button used by [DProperties](https://wiki.facepunch.com/gmod/DProperties) and [DTree_Node](https://wiki.facepunch.com/gmod/DTree_Node).
---
---@class DExpandButton : DButton
local DExpandButton = {}

---[CLIENT AND MENU] Returns whether this DExpandButton is expanded or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DExpandButton:GetExpanded)
---@return boolean # True if expanded, false otherwise
function DExpandButton:GetExpanded() end

---[CLIENT AND MENU] Sets whether this DExpandButton should be expanded or not. Only changes appearance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DExpandButton:SetExpanded)
---@param expanded boolean True to expand ( visually will show a "-" )
function DExpandButton:SetExpanded(expanded) end
