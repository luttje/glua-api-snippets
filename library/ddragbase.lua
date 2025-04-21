---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- A VGUI base panel providing drag/drop functionality. Used by [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout), [DListLayout](https://wiki.facepunch.com/gmod/DListLayout) and [DTileLayout](https://wiki.facepunch.com/gmod/DTileLayout).
---@class DDragBase : DPanel
local DDragBase = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Copy)
---@param drops table
---@param bDoDrop boolean
---@param command string
---@param y number
---@param x number
function DDragBase:DropAction_Copy(drops, bDoDrop, command, y, x) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in [DDragBase:DropAction_Copy](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Copy)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Normal)
---@param drops table
---@param bDoDrop boolean
---@param command string
---@param y number
---@param x number
function DDragBase:DropAction_Normal(drops, bDoDrop, command, y, x) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in [DDragBase:DropAction_Normal](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Normal)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Simple)
---@param drops table
---@param bDoDrop boolean
---@param command string
---@param y number
---@param x number
function DDragBase:DropAction_Simple(drops, bDoDrop, command, y, x) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the drag'n'drop group this panel belongs to. See [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable). An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:GetDnD)
---@return string # Name of the DnD family.
function DDragBase:GetDnD() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether this panel is read only or not for drag'n'drop purposes. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:GetReadOnly)
---@return boolean # Whether this panel is read only or not.
function DDragBase:GetReadOnly() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Whether this panel uses live drag'n'drop previews. An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:GetUseLiveDrag)
---@return boolean #
function DDragBase:GetUseLiveDrag() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Makes the panel a receiver for any droppable panel with the same DnD name. Internally calls [Panel:Receiver](https://wiki.facepunch.com/gmod/Panel:Receiver).
---
--- See [Drag and Drop for VGUI](https://wiki.facepunch.com/gmod/Drag_and_Drop_for_VGUI).
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable)
---@param name string The unique name for the receiver slot. Only droppable panels with the same DnD name as this can be dropped on the panel.
---@param allowCopy boolean Whether or not to allow droppable panels to be copied when the Ctrl key is held down.
function DDragBase:MakeDroppable(name, allowCopy) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable).
---
--- See also [DDragBase:GetDnD](https://wiki.facepunch.com/gmod/DDragBase:GetDnD)
---
--- An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:SetDnD)
---@param name string Name of the DnD family.
function DDragBase:SetDnD(name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Determines where you can drop stuff.
--- "4" for left
--- "5" for center
--- "6" for right
--- "8" for top
--- "2" for bottom
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:SetDropPos)
---@param pos? string Where you're allowed to drop things.
function DDragBase:SetDropPos(pos) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether this panel is read only or not for drag'n'drop purposes. If set to `true`, you can only copy from this panel, and cannot modify its contents. This is an [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:SetReadOnly)
---@param name boolean Whether this panel should be read only or not.
function DDragBase:SetReadOnly(name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Whether to use live drag'n'drop previews. This is an [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:SetUseLiveDrag)
---@param newState boolean
function DDragBase:SetUseLiveDrag(newState) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function used in [DDragBase:DropAction_Normal](https://wiki.facepunch.com/gmod/DDragBase:DropAction_Normal)
---
---[View wiki](https://wiki.facepunch.com/gmod/DDragBase:UpdateDropTarget)
---@param drop number
---@param pnl Panel
function DDragBase:UpdateDropTarget(drop, pnl) end
