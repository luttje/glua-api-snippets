---@meta

--- The drag'n'drop library, used internally by certain base panels to allow for drag'n'drop functionality, like spawnmenu's customizations.
dragndrop = {}

---[CLIENT AND MENU] Calls the receiver function of hovered panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.CallReceiverFunction)
---@param bDoDrop boolean true if the mouse was released, false if we right clicked.
---@param command number The command value. This should be the ID of the clicked dropdown menu ( if right clicked, or nil )
---@param mx number The local to the panel mouse cursor X position when the click happened.
---@param my number The local to the panel  mouse cursor Y position when the click happened.
function dragndrop.CallReceiverFunction(bDoDrop, command, mx, my) end

---[CLIENT AND MENU] Clears all the internal drag'n'drop variables.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.Clear)
function dragndrop.Clear() end

---[CLIENT AND MENU] Handles the drop action of drag'n'drop library.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.Drop)
function dragndrop.Drop() end

---[CLIENT AND MENU] Returns a table of currently dragged panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.GetDroppable)
---@param name? string If set, the function will return only the panels with this Panel:Droppable name.
---@return table # A table of all panels that are being currently dragged, if any.
function dragndrop.GetDroppable(name) end

---[CLIENT AND MENU] Allows you to capture the panel that was dropped into the game (dropped onto the root panel). This function is meant to be overridden.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.HandleDroppedInGame)
function dragndrop.HandleDroppedInGame() end

---[CLIENT AND MENU] Handles the hover think. Called from dragndrop.Think.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.HoverThink)
function dragndrop.HoverThink() end

---[CLIENT AND MENU] Returns whether the user is dragging something with the drag'n'drop system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.IsDragging)
---@return boolean # True if the user is dragging something with the drag'n'drop system.
function dragndrop.IsDragging() end

---[CLIENT AND MENU] Starts the drag'n'drop.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.StartDragging)
function dragndrop.StartDragging() end

---[CLIENT AND MENU] Stops the drag'n'drop and calls dragndrop.Clear.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.StopDragging)
function dragndrop.StopDragging() end

---[CLIENT AND MENU] Handles all the drag'n'drop processes. Calls dragndrop.UpdateReceiver and dragndrop.HoverThink.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.Think)
function dragndrop.Think() end

---[CLIENT AND MENU] Updates the receiver to drop the panels onto. Called from dragndrop.Think.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/dragndrop.UpdateReceiver)
function dragndrop.UpdateReceiver() end
