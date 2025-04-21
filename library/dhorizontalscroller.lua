---@meta

--- A very basic horizontal scrollable panel, similar to [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel).
---
--- Used internally in [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---@class DHorizontalScroller : Panel
local DHorizontalScroller = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a panel to the [DHorizontalScroller](https://wiki.facepunch.com/gmod/DHorizontalScroller).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:AddPanel)
---@param pnl Panel The panel to add. It will be automatically parented.
function DHorizontalScroller:AddPanel(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the internal canvas panel where the content of [DHorizontalScroller](https://wiki.facepunch.com/gmod/DHorizontalScroller) are placed on.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetCanvas)
---@return Panel # The DDragBase panel.
function DHorizontalScroller:GetCanvas() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the overlap set by [DHorizontalScroller:SetOverlap](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetOverlap).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetOverlap)
---@return number # The overlap.
function DHorizontalScroller:GetOverlap() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether this panel should show drop targets.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:GetShowDropTargets)
---@return boolean #
function DHorizontalScroller:GetShowDropTargets() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Same as [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable).
--- TODO: Transclude or whatever to here?
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:MakeDroppable)
---@param name string
function DHorizontalScroller:MakeDroppable(name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Scrolls the [DHorizontalScroller](https://wiki.facepunch.com/gmod/DHorizontalScroller) to given child panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:ScrollToChild)
---@param target Panel The target child panel. Must be a child of DHorizontalScroller:GetCanvas
function DHorizontalScroller:ScrollToChild(target) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Controls the spacing between elements of the horizontal scroller.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetOverlap)
---@param overlap number Overlap in pixels. Positive numbers will make elements `overlap` each other, negative will add spacing.
function DHorizontalScroller:SetOverlap(overlap) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the scroll amount, automatically clamping the value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetScroll)
---@param scroll number The new scroll amount
function DHorizontalScroller:SetScroll(scroll) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether this panel should show drop targets.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetShowDropTargets)
---@param newState boolean
function DHorizontalScroller:SetShowDropTargets(newState) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Same as [DDragBase:SetUseLiveDrag](https://wiki.facepunch.com/gmod/DDragBase:SetUseLiveDrag)
---
---[View wiki](https://wiki.facepunch.com/gmod/DHorizontalScroller:SetUseLiveDrag)
---@param newState boolean
function DHorizontalScroller:SetUseLiveDrag(newState) end
