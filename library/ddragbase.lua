---@meta

---@class DDragBase : DPanel
local DDragBase = {}

---[CLIENT AND MENU] Internal function used in DDragBase:MakeDroppable
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Copy)
---@param drops table
---@param bDoDrop boolean
---@param command string
---@param y number
---@param x number
function DDragBase:DropAction_Copy(drops, bDoDrop, command, y, x) end

---[CLIENT AND MENU] Internal function used in DDragBase:DropAction_Copy
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Normal)
---@param drops table
---@param bDoDrop boolean
---@param command string
---@param y number
---@param x number
function DDragBase:DropAction_Normal(drops, bDoDrop, command, y, x) end

---[CLIENT AND MENU] Internal function used in DDragBase:DropAction_Normal
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Simple)
---@param drops table
---@param bDoDrop boolean
---@param command string
---@param y number
---@param x number
function DDragBase:DropAction_Simple(drops, bDoDrop, command, y, x) end

---[CLIENT AND MENU] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:GetDnD)
---@return string #Name of the DnD family.
function DDragBase:GetDnD() end

---[CLIENT AND MENU] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:GetUseLiveDrag)
---@return boolean #
function DDragBase:GetUseLiveDrag() end

---[CLIENT AND MENU] Makes the panel a receiver for any droppable panel with the same DnD name. Internally calls Panel:Receiver.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable)
---@param name string The unique name for the receiver slot. Only droppable panels with the same DnD name as this can be dropped on the panel.
---@param allowCopy boolean Whether or not to allow droppable panels to be copied when the Ctrl key is held down.
function DDragBase:MakeDroppable(name, allowCopy) end

---[CLIENT AND MENU] Called when anything is dropped on or rearranged within the DDragBase.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:OnModified)
function DDragBase:OnModified() end

---[CLIENT AND MENU] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:SetDnD)
---@param name string Name of the DnD family.
function DDragBase:SetDnD(name) end

---[CLIENT AND MENU] Determines where you can drop stuff.
--- "4" for left
--- "5" for center
--- "6" for right
--- "8" for top
--- "2" for bottom
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:SetDropPos)
---@param pos? string Where you're allowed to drop things.
function DDragBase:SetDropPos(pos) end

---[CLIENT AND MENU] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:SetUseLiveDrag)
---@param newState boolean
function DDragBase:SetUseLiveDrag(newState) end

---[CLIENT AND MENU] Internal function used in DDragBase:DropAction_Normal
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDragBase:UpdateDropTarget)
---@param drop number
---@param pnl Panel
function DDragBase:UpdateDropTarget(drop, pnl) end
