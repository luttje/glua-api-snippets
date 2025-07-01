---@meta

--- Similar to [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet), but with tabs on the left.
---@class DColumnSheet : Panel
local DColumnSheet = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a new column/tab.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColumnSheet:AddSheet)
---@param name string Name of the column/tab
---@param pnl Panel Panel to be used as contents of the tab. This normally would be a DPanel
---@param icon? string Icon for the tab. This will ideally be a Silkicons, but any material name can be used.
---@return table # A table containing the following keys:
--- * DButton / DImageButton Button - The created tab button that will switch to the given panel.
--- * Panel Panel - The given panel to switch to when the button is pressed.
function DColumnSheet:AddSheet(name, pnl, icon) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the active button of this [DColumnSheet](https://wiki.facepunch.com/gmod/DColumnSheet).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColumnSheet:GetActiveButton)
---@return Panel # The active button
function DColumnSheet:GetActiveButton() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that makes a button an active button for this [DColumnSheet](https://wiki.facepunch.com/gmod/DColumnSheet).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColumnSheet:SetActiveButton)
---@param active Panel The button to make active button
function DColumnSheet:SetActiveButton(active) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Makes the tabs/buttons show only the image and no text.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColumnSheet:UseButtonOnlyStyle)
function DColumnSheet:UseButtonOnlyStyle() end
