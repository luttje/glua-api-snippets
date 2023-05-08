---@meta

---@class DScrollPanel : DPanel
local DScrollPanel = {}

---[CLIENT] Parents the passed panel to the DScrollPanel's canvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:AddItem)
---@param pnl Panel The panel to add.
function DScrollPanel:AddItem(pnl) end

---[CLIENT] Clears the `DScrollPanel`'s canvas, removing all added items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:Clear)
function DScrollPanel:Clear() end

---[CLIENT] Returns the canvas ( The panel all child panels are parented to ) of the DScrollPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas)
---@return Panel #The canvas
function DScrollPanel:GetCanvas() end

---[CLIENT] Gets the DScrollPanels padding
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetPadding)
---@return number #DScrollPanels padding
function DScrollPanel:GetPadding() end

---[CLIENT] Returns the vertical scroll bar of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetVBar)
---@return Panel #The DVScrollBar.
function DScrollPanel:GetVBar() end

---[CLIENT] Return the width of the DScrollPanel's canvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:InnerWidth)
---@return number #The width of the DScrollPanel's canvas
function DScrollPanel:InnerWidth() end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:Rebuild)
function DScrollPanel:Rebuild() end

---[CLIENT] Scrolls to the given child
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:ScrollToChild)
---@param panel Panel The panel to scroll to, must be a child of the DScrollPanel.
function DScrollPanel:ScrollToChild(panel) end

---[CLIENT] Sets the canvas of the DScrollPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:SetCanvas)
---@param canvas Panel The new canvas
function DScrollPanel:SetCanvas(canvas) end

---[CLIENT] Sets the DScrollPanel's padding. This function appears to be unused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:SetPadding)
---@param padding number The padding of the DScrollPanel.
function DScrollPanel:SetPadding(padding) end
