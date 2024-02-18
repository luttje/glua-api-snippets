---@meta

--- Similar to DPropertySheet, but with tabs on the left.Example of how you'd use this panel
---@class DColumnSheet : Panel
local DColumnSheet = {}

---[CLIENT AND MENU] Adds a new column/tab.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColumnSheet:AddSheet)
---@param name string Name of the column/tab
---@param pnl Panel Panel to be used as contents of the tab. This normally would be a DPanel
---@param icon? string Icon for the tab. This will ideally be a Silkicons, but any material name can be used.
---@return table # A table containing the following keys: * Panel Button - The created tab button that will switch to the given panel * Panel Panel - The given panel to switch to when the button is pressed
function DColumnSheet:AddSheet(name, pnl, icon) end

---[CLIENT AND MENU] Returns the active button of this DColumnSheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColumnSheet:GetActiveButton)
---@return Panel # The active button
function DColumnSheet:GetActiveButton() end

---[CLIENT AND MENU] Makes a button an active button for this DColumnSheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColumnSheet:SetActiveButton)
---@param active Panel The button to make active button
function DColumnSheet:SetActiveButton(active) end

---[CLIENT AND MENU] Makes the tabs/buttons show only the image and no text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColumnSheet:UseButtonOnlyStyle)
function DColumnSheet:UseButtonOnlyStyle() end
