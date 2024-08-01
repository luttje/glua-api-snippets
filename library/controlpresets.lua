---@meta

---
--- 		A preset manager, found at the top of almost every default tool's C-menu.
---
--- 		This control only exists in Sandbox derived gamemodes.
---
---@class ControlPresets : Panel
local ControlPresets = {}

---[CLIENT] Adds a convar to be managed by this control.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:AddConVar)
---@param convar string The convar to add.
function ControlPresets:AddConVar(convar) end

---[CLIENT] Adds option to the [DComboBox](https://wiki.facepunch.com/gmod/DComboBox) subelement with [DComboBox:AddChoice](https://wiki.facepunch.com/gmod/DComboBox:AddChoice) then adds it to the `options` subtable
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:AddOption)
---@param strName string Name
---@param data any data
function ControlPresets:AddOption(strName, data) end

---[CLIENT] Runs [Panel:Clear](https://wiki.facepunch.com/gmod/Panel:Clear) on the Internal [DComboBox](https://wiki.facepunch.com/gmod/DComboBox)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:Clear)
function ControlPresets:Clear() end

---[CLIENT] Get a list of all Console Variables being managed by this panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:GetConVars)
---@return table # numbered table of convars
function ControlPresets:GetConVars() end

---[CLIENT] Checks if Data is valid then uses [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) to iterate over the data parameter and run each entry using [Global.RunConsoleCommand](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand)
--- Index and Value parameters appear to not be used. Further testing should be done to confirm
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:OnSelect)
---@param index number Name
---@param value any
---@param data table
function ControlPresets:OnSelect(index, value, data) end

---[CLIENT] Creates and opens [PresetEditor](https://wiki.facepunch.com/gmod/PresetEditor)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:OpenPresetEditor)
function ControlPresets:OpenPresetEditor() end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:QuickSaveInternal)
---@param text string
function ControlPresets:QuickSaveInternal(text) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:QuickSavePreset)
function ControlPresets:QuickSavePreset() end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:ReloadPresets)
function ControlPresets:ReloadPresets() end

---[CLIENT] Set the name label text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:SetLabel)
---@param name string The text to put in the label
function ControlPresets:SetLabel(name) end

---[CLIENT] Uses [table.Merge](https://wiki.facepunch.com/gmod/table.Merge) to combine the provided table into the `Options` subtable
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:SetOptions)
---@param Options table Options
function ControlPresets:SetOptions(Options) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:SetPreset)
---@param strName string Name of preset to set
function ControlPresets:SetPreset(strName) end

---[CLIENT] Alias of [ControlPresets:ReloadPresets](https://wiki.facepunch.com/gmod/ControlPresets:ReloadPresets)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPresets:Update)
function ControlPresets:Update() end
