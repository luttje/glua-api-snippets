---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- [DComboBox](https://wiki.facepunch.com/gmod/DComboBox) control for a [DProperties](https://wiki.facepunch.com/gmod/DProperties) panel.
---@class DProperty_Combo : DProperty_Generic
local DProperty_Combo = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Add a choice to your combo control.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperty_Combo:AddChoice)
---@param Text string Shown text.
---@param data any Stored Data.
---@param select? boolean Select this element?
function DProperty_Combo:AddChoice(Text, data, select) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called after the user selects a new value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperty_Combo:DataChanged)
---@param data any The new data that was selected.
function DProperty_Combo:DataChanged(data) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Set the selected option.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperty_Combo:SetSelected)
---@param Id number Id of the choice to be selected.
function DProperty_Combo:SetSelected(Id) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets up a combo control.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperty_Combo:Setup)
---@param data? table Data to use to set up the combo box control. See Editable Entities.
---
--- Structure:
--- * string text - The default label for this combo box
--- * table values - The values to add to the combo box. Keys are the "nice" text, values are the data value to send.
--- * table icons - The icons for each value. They will be matched by key name.
--- * boolean select - The "nice" name/key of the value that should be initially selected.
function DProperty_Combo:Setup(data) end
