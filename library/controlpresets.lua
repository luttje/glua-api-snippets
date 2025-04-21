---@meta

--- A preset manager, found at the top of almost every default tool's C-menu.
---
--- This control only exists in Sandbox derived gamemodes.
---@class ControlPresets : Panel
local ControlPresets = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a convar to be managed by this control.
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:AddConVar)
---@param convar string The convar to add.
function ControlPresets:AddConVar(convar) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds option to the [DComboBox](https://wiki.facepunch.com/gmod/DComboBox) subelement with [DComboBox:AddChoice](https://wiki.facepunch.com/gmod/DComboBox:AddChoice) then adds it to the `options` subtable
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:AddOption)
---@param strName string Name
---@param data any data
function ControlPresets:AddOption(strName, data) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Runs [Panel:Clear](https://wiki.facepunch.com/gmod/Panel:Clear) on the Internal [DComboBox](https://wiki.facepunch.com/gmod/DComboBox)
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:Clear)
function ControlPresets:Clear() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Get a list of all Console Variables being managed by this panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:GetConVars)
---@return table # numbered table of convars
function ControlPresets:GetConVars() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Checks if Data is valid then uses [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) to iterate over the data parameter and run each entry using [Global.RunConsoleCommand](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand)
--- Index and Value parameters appear to not be used. Further testing should be done to confirm
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:OnSelect)
---@param index number Name
---@param value any
---@param data table
function ControlPresets:OnSelect(index, value, data) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates and opens [PresetEditor](https://wiki.facepunch.com/gmod/PresetEditor)
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:OpenPresetEditor)
function ControlPresets:OpenPresetEditor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808)
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:QuickSaveInternal)
---@param text string
function ControlPresets:QuickSaveInternal(text) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808)
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:QuickSavePreset)
function ControlPresets:QuickSavePreset() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808)
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:ReloadPresets)
function ControlPresets:ReloadPresets() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Set the name label text.
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:SetLabel)
---@param name string The text to put in the label
function ControlPresets:SetLabel(name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Uses [table.Merge](https://wiki.facepunch.com/gmod/table.Merge) to combine the provided table into the `Options` subtable
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:SetOptions)
---@param Options table Options
function ControlPresets:SetOptions(Options) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808)
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:SetPreset)
---@param strName string Name of preset to set
function ControlPresets:SetPreset(strName) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Alias of [ControlPresets:ReloadPresets](https://wiki.facepunch.com/gmod/ControlPresets:ReloadPresets)
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPresets:Update)
function ControlPresets:Update() end
