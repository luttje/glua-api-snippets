---@meta

---
--- A panel similar to DScrollPanel, but that allows the player to pan around, for example a zoomed in image within a small window.
---
---@class DPanPanel : DPanel
local DPanPanel = {}

---[CLIENT AND MENU] Parents the passed panel to the DPanPanel:GetCanvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanPanel:AddItem)
---@param pnl Panel The panel to add.
function DPanPanel:AddItem(pnl) end

---[CLIENT AND MENU] The internal canvas panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanPanel:GetCanvas)
---@return Panel # The canvas panel.
function DPanPanel:GetCanvas() end

---[CLIENT AND MENU] Used internally, called from DPanPanel:ScrollToChild.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanPanel:OnScroll)
---@param x number
---@param y number
function DPanPanel:OnScroll(x, y) end

---[CLIENT AND MENU] Scroll to a specific child panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanPanel:ScrollToChild)
---@param pnl Panel The panel to scroll to.
function DPanPanel:ScrollToChild(pnl) end

---[CLIENT AND MENU] Used internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPanPanel:SetCanvas)
---@param pnl Panel The canvas panel.
function DPanPanel:SetCanvas(pnl) end
