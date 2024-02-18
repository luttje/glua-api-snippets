---@meta

---
--- 		A very basic horizontal scrollable panel, similar to DScrollPanel.
---
--- 		Used internally in DPropertySheet.
--- 	Creates a DHorizontalScroller with a bunch of DImages attached to it.Creates a DHorizontalScroller with a bunch of DImages attached to it and demonstrates how to color the left/right scroll buttons.
---@class DHorizontalScroller : Panel
local DHorizontalScroller = {}

---[CLIENT AND MENU] Adds a panel to the DHorizontalScroller.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:AddPanel)
---@param pnl Panel The panel to add. It will be automatically parented.
function DHorizontalScroller:AddPanel(pnl) end

---[CLIENT AND MENU] Returns the internal canvas panel where the content of DHorizontalScroller are placed on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetCanvas)
---@return Panel # The DDragBase panel.
function DHorizontalScroller:GetCanvas() end

---[CLIENT AND MENU] Returns the overlap set by DHorizontalScroller:GetOverlap.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetOverlap)
---@return number # The overlap.
function DHorizontalScroller:GetOverlap() end

---[CLIENT AND MENU] Returns whether this panel should show drop targets.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetShowDropTargets)
---@return boolean #
function DHorizontalScroller:GetShowDropTargets() end

---[CLIENT AND MENU] Same as DDragBase:MakeDroppable.
--- TODO: Transclude or whatever to here?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:MakeDroppable)
---@param name string
function DHorizontalScroller:MakeDroppable(name) end

---[CLIENT AND MENU] Scrolls the DHorizontalScroller to given child panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:ScrollToChild)
---@param target Panel The target child panel. Must be a child of DHorizontalScroller:GetCanvas
function DHorizontalScroller:ScrollToChild(target) end

---[CLIENT AND MENU] Controls the spacing between elements of the horizontal scroller.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetOverlap)
---@param overlap number Overlap in pixels. Positive numbers will make elements `overlap` each other, negative will add spacing.
function DHorizontalScroller:SetOverlap(overlap) end

---[CLIENT AND MENU] Sets the scroll amount, automatically clamping the value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetScroll)
---@param scroll number The new scroll amount
function DHorizontalScroller:SetScroll(scroll) end

---[CLIENT AND MENU] Sets whether this panel should show drop targets.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetShowDropTargets)
---@param newState boolean
function DHorizontalScroller:SetShowDropTargets(newState) end

---[CLIENT AND MENU] Same as DDragBase:SetUseLiveDrag
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetUseLiveDrag)
---@param newState boolean
function DHorizontalScroller:SetUseLiveDrag(newState) end
