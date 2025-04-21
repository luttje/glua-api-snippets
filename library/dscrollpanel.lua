---@meta

--- DScrollPanel is a VGUI Element similar to DPanel however it has a vertical scrollbar docked to the right which can be used to put more content in a smaller area. DScrollPanels are essentially [DPanel](https://wiki.facepunch.com/gmod/DPanel)s with the Scroll Bar.
---
--- This can be used to replace the [DPanelList](https://wiki.facepunch.com/gmod/DPanelList) with [DPanelList:EnableVerticalScrollbar](https://wiki.facepunch.com/gmod/DPanelList:EnableVerticalScrollbar) and get similar functionality as well as using a non-deprecated element.
---
--- If you would like to paint or edit the elements of the scrollbar use [DScrollPanel:GetVBar](https://wiki.facepunch.com/gmod/DScrollPanel:GetVBar). If you want to see if the scrollbar is visible then use the VBar.Enabled variable on the scrollbar's VBar.
---
--- **NOTE**: [Panel:DockPadding](https://wiki.facepunch.com/gmod/Panel:DockPadding) will not have an effect on children of this panel. Use the function on [DScrollPanel:GetCanvas](https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas) instead.
---@class DScrollPanel : DPanel
local DScrollPanel = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Parents the passed panel to the DScrollPanel's canvas.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:AddItem)
---@param pnl Panel The panel to add.
function DScrollPanel:AddItem(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the canvas ( The panel all child panels are parented to ) of the DScrollPanel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:GetCanvas)
---@return Panel # The canvas
function DScrollPanel:GetCanvas() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel)s padding, set by [DScrollPanel:SetPadding](https://wiki.facepunch.com/gmod/DScrollPanel:SetPadding).
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:GetPadding)
---@return number # DScrollPanels padding
function DScrollPanel:GetPadding() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the vertical scroll bar of the panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:GetVBar)
---@return DVScrollBar # The DVScrollBar.
function DScrollPanel:GetVBar() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Return the width of the DScrollPanel's canvas.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:InnerWidth)
---@return number # The width of the DScrollPanel's canvas
function DScrollPanel:InnerWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to rebuild the panel's children positioning. You should use [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:PerformLayoutInternal)
function DScrollPanel:PerformLayoutInternal() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to rebuild the panel's children positioning. You should use [Panel:InvalidateLayout](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:Rebuild)
function DScrollPanel:Rebuild() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Scrolls to the given child
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:ScrollToChild)
---@param panel Panel The panel to scroll to, must be a child of the DScrollPanel.
function DScrollPanel:ScrollToChild(panel) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the canvas of the DScrollPanel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:SetCanvas)
---@param canvas Panel The new canvas
function DScrollPanel:SetCanvas(canvas) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the DScrollPanel's padding. This function appears to be unused.
---
---[View wiki](https://wiki.facepunch.com/gmod/DScrollPanel:SetPadding)
---@param padding number The padding of the DScrollPanel.
function DScrollPanel:SetPadding(padding) end
