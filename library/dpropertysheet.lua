---@meta

--- A tab oriented control where you can create multiple tabs with items within. Used mainly for organization.
---@class DPropertySheet : Panel
local DPropertySheet = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a new tab.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:AddSheet)
---@param name string Name of the tab
---@param pnl Panel Panel to be used as contents of the tab. This normally should be a DPanel
---@param icon? string Icon for the tab. This will ideally be a Silkicons, but any material name can be used.
---@param noStretchX? boolean Should DPropertySheet try to fill itself with given panel horizontally.
---@param noStretchY? boolean Should DPropertySheet try to fill itself with given panel vertically.
---@param tooltip? string Tooltip for the tab when user hovers over it with his cursor
---@return table # A table containing the following keys:
--- * Panel Tab - The created DTab.
--- * string Name - Name of the created tab
--- * Panel Panel - The contents panel of the tab
function DPropertySheet:AddSheet(name, pnl, icon, noStretchX, noStretchY, tooltip) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Removes tab and/or panel from the parent DPropertySheet.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:CloseTab)
---@param tab Panel The DTab of the sheet from DPropertySheet.
---
--- See DPropertySheet:GetItems.
---@param removePanel boolean Set to true to remove the associated panel object as well.
---@return Panel # The panel of the tab.
function DPropertySheet:CloseTab(tab, removePanel) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function that handles the cross fade animation when the player switches tabs.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:CrossFade)
---@param anim table
---@param delta number
---@param data table
function DPropertySheet:CrossFade(anim, delta, data) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the active [DTab](https://wiki.facepunch.com/gmod/DTab) of this [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:GetActiveTab)
---@return Panel # The DTab
function DPropertySheet:GetActiveTab() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the amount of time (in seconds) it takes to fade between tabs.
---
--- Set by [DPropertySheet:SetFadeTime](https://wiki.facepunch.com/gmod/DPropertySheet:SetFadeTime)
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:GetFadeTime)
---@return number # The amount of time (in seconds) it takes to fade between tabs.
function DPropertySheet:GetFadeTime() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns a list of all tabs of this [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:GetItems)
---@return table # A table of tables.
--- Each table contains 3 key-value pairs:
---
--- * string Name - The name of the tab.
--- * Panel Tab - The DTab associated with the tab.
--- * Panel Panel - The Panel associated with the tab.
function DPropertySheet:GetItems() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the padding from the parent panel to child panels.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:GetPadding)
---@return number # Padding
function DPropertySheet:GetPadding() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whatever value was set by [DPropertySheet:SetShowIcons](https://wiki.facepunch.com/gmod/DPropertySheet:SetShowIcons).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:GetShowIcons)
---@return boolean #
function DPropertySheet:GetShowIcons() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the active tab of the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:SetActiveTab)
---@param tab Panel The DTab to set active.
---
--- See DPropertySheet:GetItems
function DPropertySheet:SetActiveTab(tab) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the amount of time (in seconds) it takes to fade between tabs.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:SetFadeTime)
---@param time? number The amount of time it takes (in seconds) to fade between tabs.
function DPropertySheet:SetFadeTime(time) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the padding from parent panel to children panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:SetPadding)
---@param padding? number Amount of padding
function DPropertySheet:SetPadding(padding) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:SetShowIcons)
---@param show boolean
function DPropertySheet:SetShowIcons(show) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a close button on the right side of the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet) that will run the given callback function when pressed.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:SetupCloseButton)
---@param func function Callback function to be called when the close button is pressed.
function DPropertySheet:SetupCloseButton(func) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the width of the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet) to fit the contents of all of the tabs.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:SizeToContentWidth)
function DPropertySheet:SizeToContentWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Switches the active tab to a tab with given name.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPropertySheet:SwitchToName)
---@param name string Case sensitive name of the tab.
function DPropertySheet:SwitchToName(name) end
