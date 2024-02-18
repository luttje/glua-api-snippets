---@meta

---
--- 		A "spawn icon" displays an image for the given model path.
--- 		It is mostly used in the Spawn Menu (Q).
--- 		It uses ModelImage internally.
--- 	Creates a DFrame with a SpawnIcon inside.
---@class SpawnIcon : DButton
local SpawnIcon = {}

---[CLIENT] Returns the currently set body groups of the spawn icon. This is set by SpawnIcon:SetBodyGroup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnIcon:GetBodyGroup)
---@return string # The bodygroups of the spawnicon
function SpawnIcon:GetBodyGroup() end

---[CLIENT] Returns the currently set model name. This is set by SpawnIcon:SetModelName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnIcon:GetModelName)
---@return string # The model name
function SpawnIcon:GetModelName() end

---[CLIENT] Returns the currently set skin of the spawnicon. This is set by SpawnIcon:SetSkinID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnIcon:GetSkinID)
---@return number # Current skin ID
function SpawnIcon:GetSkinID() end

---[CLIENT] Called when right clicked on the SpawnIcon. It will not be called if there is a selection (Panel:GetSelectionCanvas), in which case SANDBOX:SpawnlistOpenGenericMenu is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnIcon:OpenMenu)
function SpawnIcon:OpenMenu() end

---[CLIENT] This is done automatically by SpawnIcon. You do not need to call this. Doing so may cause unforeseen consequences.
---
--- Sets the bodygroups, so it can be retrieved with SpawnIcon:GetBodyGroup. Use Panel:SetModel instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnIcon:SetBodyGroup)
---@param bodygroup number The id of the bodygroup you're setting. Starts from 0.
---@param value number The value you're setting the bodygroup to. Starts from 0.
function SpawnIcon:SetBodyGroup(bodygroup, value) end

---[CLIENT] This is done automatically by SpawnIcon. You do not need to call this. Doing so may cause unforeseen consequences.
---
--- Sets the model name, so it can be retrieved with SpawnIcon:GetModelName. Use Panel:SetModel instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnIcon:SetModelName)
---@param mdl string The model name to set
function SpawnIcon:SetModelName(mdl) end

---[CLIENT] This is done automatically by SpawnIcon. You do not need to call this. Doing so may cause unforeseen consequences.
---
--- Sets the skin id of the spawn icon, so it can be retrieved with SpawnIcon:GetSkinID. Use Panel:SetModel instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SpawnIcon:SetSkinID)
---@param skin number Skin ID to set
function SpawnIcon:SetSkinID(skin) end
