---@meta

--- A panel similar to [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel), but that allows the player to pan around, for example a zoomed in image within a small window.
---@class DPanPanel : DPanel
local DPanPanel = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Parents the passed panel to the [DPanPanel:GetCanvas](https://wiki.facepunch.com/gmod/DPanPanel:GetCanvas).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanPanel:AddItem)
---@param pnl Panel The panel to add.
function DPanPanel:AddItem(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) The internal canvas panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanPanel:GetCanvas)
---@return Panel # The canvas panel.
function DPanPanel:GetCanvas() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally, called from [DPanPanel:ScrollToChild](https://wiki.facepunch.com/gmod/DPanPanel:ScrollToChild).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanPanel:OnScroll)
---@param x number
---@param y number
function DPanPanel:OnScroll(x, y) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Scroll to a specific child panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanPanel:ScrollToChild)
---@param pnl Panel The panel to scroll to.
function DPanPanel:ScrollToChild(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanPanel:SetCanvas)
---@param pnl Panel The canvas panel.
function DPanPanel:SetCanvas(pnl) end
