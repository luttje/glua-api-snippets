---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This element is created within and only used in the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet) file. These can be elements are stored items are stored in the `Items` subtable of the [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet)
---@class DTab : DButton
local DTab = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the panel that the tab represents.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTab:GetPanel)
---@return Panel # Panel added to the sheet using DPropertySheet:AddSheet.
function DTab:GetPanel() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) The [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet) this tab belongs to.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTab:GetPropertySheet)
---@return Panel # The DPropertySheet this tab belongs to.
function DTab:GetPropertySheet() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the target height of this tab. Used internally by [DTab](https://wiki.facepunch.com/gmod/DTab)'s [PANEL:ApplySchemeSettings](https://wiki.facepunch.com/gmod/PANEL:ApplySchemeSettings).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTab:GetTabHeight)
---@return number # Either 20, or 28 if DTab:IsActive.
function DTab:GetTabHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the tab is the currently selected tab of the associated [DPropertySheet](https://wiki.facepunch.com/gmod/DPropertySheet).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTab:IsActive)
---@return boolean # Currently selected tab.
function DTab:IsActive() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DTab:Setup](https://wiki.facepunch.com/gmod/DTab:Setup).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTab:SetPanel)
---@param pnl Panel The contents of this tab.
function DTab:SetPanel(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DTab:Setup](https://wiki.facepunch.com/gmod/DTab:Setup).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTab:SetPropertySheet)
---@param pnl Panel The DPropertySheet to set for this tab.
function DTab:SetPropertySheet(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [DPropertySheet:AddSheet](https://wiki.facepunch.com/gmod/DPropertySheet:AddSheet).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTab:Setup)
---@param label string Label of the tab
---@param sheet Panel The DPropertySheet this tab belongs to.
---@param pnl Panel Panel to be used as contents of the tab. This normally should be a DPanel.
---@param icon? string Icon for the tab. This will typically be a Silkicons, but any material name can be used.
function DTab:Setup(label, sheet, pnl, icon) end
