---@meta

---[CLIENT AND MENU] Parents the passed panel to the DScrollPanel's canvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:AddItem)
---@param pnl Panel The panel to add.
function DScrollPanel:AddItem(pnl) end

---[CLIENT AND MENU] Clears the `DScrollPanel`'s canvas, removing all added items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:Clear)
function DScrollPanel:Clear() end

---@class DScrollPanel : DPanel
local DScrollPanel = {}

---[CLIENT AND MENU] Sets the DScrollPanel's padding. This function appears to be unused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:SetPadding)
---@param padding number The padding of the DScrollPanel.
function DScrollPanel:SetPadding(padding) end

---[CLIENT AND MENU] Return the width of the DScrollPanel's canvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:InnerWidth)
---@return number # The width of the DScrollPanel's canvas
function DScrollPanel:InnerWidth() end

---[CLIENT AND MENU] Returns the canvas ( The panel all child panels are parented to ) of the DScrollPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas)
---@return Panel # The canvas
function DScrollPanel:GetCanvas() end

---[CLIENT AND MENU] Scrolls to the given child
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:ScrollToChild)
---@param panel Panel The panel to scroll to, must be a child of the DScrollPanel.
function DScrollPanel:ScrollToChild(panel) end

---[CLIENT AND MENU] Used internally to rebuild the panel's children positioning. You should use Panel:InvalidateLayout instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:Rebuild)
function DScrollPanel:Rebuild() end

---[CLIENT AND MENU] Returns the vertical scroll bar of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetVBar)
---@return Panel # The DVScrollBar.
function DScrollPanel:GetVBar() end

---[CLIENT AND MENU] Gets the DScrollPanels padding, set by DScrollPanel:SetPadding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetPadding)
---@return number # DScrollPanels padding
function DScrollPanel:GetPadding() end

---[CLIENT AND MENU] Used internally to rebuild the panel's children positioning. You should use Panel:InvalidateLayout instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:PerformLayoutInternal)
function DScrollPanel:PerformLayoutInternal() end

---[] Sets the canvas of the DScrollPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:SetCanvas)
---@param canvas Panel The new canvas
function DScrollPanel:SetCanvas(canvas) end
