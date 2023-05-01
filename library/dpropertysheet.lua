---@meta

---@class DPropertySheet
local DPropertySheet = {}

---[CLIENT] Adds a new tab.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:AddSheet)
---@param name string Name of the tab
---@param pnl Panel Panel to be used as contents of the tab. This normally should be a DPanel
---@param icon string Icon for the tab. This will ideally be a Silkicons, but any material name can be used.
---@param noStretchX boolean Should DPropertySheet try to fill itself with given panel horizontally.
---@param noStretchY boolean Should DPropertySheet try to fill itself with given panel vertically.
---@param tooltip string Tooltip for the tab when user hovers over it with his cursor
---@return table A table containing the following keys: * Panel Tab - The created DTab. * string Name - Name of the created tab * Panel Panel - The contents panel of the tab
function DPropertySheet:AddSheet(name, pnl, icon, noStretchX, noStretchY, tooltip) end

---[CLIENT] Removes tab and/or panel from the parent DPropertySheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:CloseTab)
---@param tab Panel The DTab of the sheet from DPropertySheet.
---
--- See DPropertySheet:GetItems.
---@param removePanel boolean Set to true to remove the associated panel object as well.
---@return Panel The panel of the tab.
function DPropertySheet:CloseTab(tab, removePanel) end

---[CLIENT] Internal function that handles the cross fade animation when the player switches tabs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:CrossFade)
---@param anim table
---@param delta number
---@param data table
function DPropertySheet:CrossFade(anim, delta, data) end

---[CLIENT] Returns the active DTab of this DPropertySheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:GetActiveTab)
---@return Panel The DTab
function DPropertySheet:GetActiveTab() end

---[CLIENT] Returns the amount of time (in seconds) it takes to fade between tabs.
---
--- Set by DPropertySheet:SetFadeTime
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:GetFadeTime)
---@return number The amount of time (in seconds) it takes to fade between tabs.
function DPropertySheet:GetFadeTime() end

---[CLIENT] Returns a list of all tabs of this DPropertySheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:GetItems)
---@return table A table of tables. Each table contains 3 key-value pairs:  * string Name - The name of the tab. * Panel Tab - The DTab associated with the tab. * Panel Panel - The Panel associated with the tab.
function DPropertySheet:GetItems() end

---[CLIENT] Gets the padding from the parent panel to child panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:GetPadding)
---@return number Padding
function DPropertySheet:GetPadding() end

---[CLIENT] Returns whatever value was set by DPropertySheet:SetShowIcons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:GetShowIcons)
---@return boolean
function DPropertySheet:GetShowIcons() end

---[CLIENT] Called when a player switches the tabs.
---
--- 		Source code states that this is meant to be overridden.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:OnActiveTabChanged)
---@param old Panel The previously active DTab
---@param new Panel The newly active DTab
function DPropertySheet:OnActiveTabChanged(old, new) end

---[CLIENT] Sets the active tab of the DPropertySheet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:SetActiveTab)
---@param tab Panel The DTab to set active.
---
--- See DPropertySheet:GetItems
function DPropertySheet:SetActiveTab(tab) end

---[CLIENT] Sets the amount of time (in seconds) it takes to fade between tabs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:SetFadeTime)
---@param time number The amount of time it takes (in seconds) to fade between tabs.
function DPropertySheet:SetFadeTime(time) end

---[CLIENT] Sets the padding from parent panel to children panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:SetPadding)
---@param padding number Amount of padding
function DPropertySheet:SetPadding(padding) end

---[CLIENT] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:SetShowIcons)
---@param show boolean
function DPropertySheet:SetShowIcons(show) end

---[CLIENT] Creates a close button on the right side of the DPropertySheet that will run the given callback function when pressed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:SetupCloseButton)
---@param func function Callback function to be called when the close button is pressed.
function DPropertySheet:SetupCloseButton(func) end

---[CLIENT] Sets the width of the DPropertySheet to fit the contents of all of the tabs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:SizeToContentWidth)
function DPropertySheet:SizeToContentWidth() end

---[CLIENT] Switches the active tab to a tab with given name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DPropertySheet:SwitchToName)
---@param name string Case sensitive name of the tab.
function DPropertySheet:SwitchToName(name) end
