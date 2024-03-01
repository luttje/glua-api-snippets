---@meta

---
---
--- 		This element is created within and only used in the DPropertySheet file.
---
---@class DTab : DButton
local DTab = {}

---[CLIENT AND MENU] Returns the panel that the tab represents.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:GetPanel)
---@return Panel # Panel added to the sheet using DPropertySheet:AddSheet.
function DTab:GetPanel() end

---[CLIENT AND MENU] The DPropertySheet this tab belongs to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:GetPropertySheet)
---@return Panel # The DPropertySheet this tab belongs to.
function DTab:GetPropertySheet() end

---[CLIENT AND MENU] Returns the target height of this tab. Used internally by DTab's PANEL:ApplySchemeSettings.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:GetTabHeight)
---@return number # Either 20, or 28 if DTab:IsActive.
function DTab:GetTabHeight() end

---[CLIENT AND MENU] Returns whether the tab is the currently selected tab of the associated DPropertySheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:IsActive)
---@return Boolean # Currently selected tab.
function DTab:IsActive() end

---[CLIENT AND MENU] Used internally by DTab:Setup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:SetPanel)
---@param pnl Panel The contents of this tab.
function DTab:SetPanel(pnl) end

---[CLIENT AND MENU] Used internally by DTab:Setup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:SetPropertySheet)
---@param pnl Panel The DPropertySheet to set for this tab.
function DTab:SetPropertySheet(pnl) end

---[CLIENT AND MENU] Used internally by DPropertySheet:AddSheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTab:Setup)
---@param label string Label of the tab
---@param sheet Panel The DPropertySheet this tab belongs to.
---@param pnl Panel Panel to be used as contents of the tab. This normally should be a DPanel.
---@param icon? string Icon for the tab. This will typically be a Silkicons, but any material name can be used.
function DTab:Setup(label, sheet, pnl, icon) end
