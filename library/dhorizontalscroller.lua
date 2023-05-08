---@meta

---@class DHorizontalScroller : Panel
local DHorizontalScroller = {}

---[CLIENT] Adds a panel to the DHorizontalScroller.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:AddPanel)
---@param pnl Panel The panel to add. It will be automatically parented.
function DHorizontalScroller:AddPanel(pnl) end

---[CLIENT] Returns the internal canvas panel where the content of DHorizontalScroller are placed on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetCanvas)
---@return Panel #The DDragBase panel.
function DHorizontalScroller:GetCanvas() end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetOverlap)
---@return number #
function DHorizontalScroller:GetOverlap() end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetShowDropTargets)
---@return boolean #
function DHorizontalScroller:GetShowDropTargets() end

---[CLIENT] Same as DDragBase:MakeDroppable.
--- TODO: Transclude or whatever to here?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:MakeDroppable)
---@param name string
function DHorizontalScroller:MakeDroppable(name) end

---[CLIENT] Called when the panel is scrolled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:OnDragModified)
function DHorizontalScroller:OnDragModified() end

---[CLIENT] Scrolls the DHorizontalScroller to given child panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:ScrollToChild)
---@param target Panel The target child panel. Must be a child of DHorizontalScroller:GetCanvas
function DHorizontalScroller:ScrollToChild(target) end

---[CLIENT] Controls the spacing between elements of the horizontal scroller.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetOverlap)
---@param overlap number Overlap in pixels. Positive numbers will make elements `overlap` each other, negative will add spacing.
function DHorizontalScroller:SetOverlap(overlap) end

---[CLIENT] Sets the scroll amount, automatically clamping the value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetScroll)
---@param scroll number The new scroll amount
function DHorizontalScroller:SetScroll(scroll) end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetShowDropTargets)
---@param newState boolean
function DHorizontalScroller:SetShowDropTargets(newState) end

---[CLIENT] Same as DDragBase:SetUseLiveDrag
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetUseLiveDrag)
---@param newState boolean
function DHorizontalScroller:SetUseLiveDrag(newState) end
