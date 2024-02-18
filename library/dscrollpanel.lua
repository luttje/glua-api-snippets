---@meta

---
--- DScrollPanel is a VGUI Element similar to DPanel however it has a vertical scrollbar docked to the right which can be used to put more content in a smaller area. DScrollPanels are essentially DPanels with the Scroll Bar.
---
--- This can be used to replace the DPanelList with DPanelList:EnableVerticalScrollbar and get similar functionality as well as using a non-deprecated element.
---
--- If you would like to paint or edit the elements of the scrollbar use DScrollPanel:GetVBar. If you want to see if the scrollbar is visible then use the VBar.Enabled variable on the scrollbar's VBar.
---
--- Panel:DockPadding will not have an effect on children of this panel. Use the function on DScrollPanel:GetCanvas instead.
--- 	Creates a DScrollPanel and adds 100 DButtons to it.
---@class DScrollPanel : DPanel
local DScrollPanel = {}

---[CLIENT AND MENU] Parents the passed panel to the DScrollPanel's canvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:AddItem)
---@param pnl Panel The panel to add.
function DScrollPanel:AddItem(pnl) end

---[CLIENT AND MENU] Clears the `DScrollPanel`'s canvas, removing all added items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:Clear)
function DScrollPanel:Clear() end

---[CLIENT AND MENU] Returns the canvas ( The panel all child panels are parented to ) of the DScrollPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas)
---@return Panel # The canvas
function DScrollPanel:GetCanvas() end

---[CLIENT AND MENU] Gets the DScrollPanels padding, set by DScrollPanel:SetPadding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetPadding)
---@return number # DScrollPanels padding
function DScrollPanel:GetPadding() end

---[CLIENT AND MENU] Returns the vertical scroll bar of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:GetVBar)
---@return Panel # The DVScrollBar.
function DScrollPanel:GetVBar() end

---[CLIENT AND MENU] Return the width of the DScrollPanel's canvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:InnerWidth)
---@return number # The width of the DScrollPanel's canvas
function DScrollPanel:InnerWidth() end

---[CLIENT AND MENU] Used internally to rebuild the panel's children positioning. You should use Panel:InvalidateLayout instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:PerformLayoutInternal)
function DScrollPanel:PerformLayoutInternal() end

---[CLIENT AND MENU] Used internally to rebuild the panel's children positioning. You should use Panel:InvalidateLayout instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:Rebuild)
function DScrollPanel:Rebuild() end

---[CLIENT AND MENU] Scrolls to the given child
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:ScrollToChild)
---@param panel Panel The panel to scroll to, must be a child of the DScrollPanel.
function DScrollPanel:ScrollToChild(panel) end

---[] Sets the canvas of the DScrollPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:SetCanvas)
---@param canvas Panel The new canvas
function DScrollPanel:SetCanvas(canvas) end

---[CLIENT AND MENU] Sets the DScrollPanel's padding. This function appears to be unused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DScrollPanel:SetPadding)
---@param padding number The padding of the DScrollPanel.
function DScrollPanel:SetPadding(padding) end
