---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Color picker control for a DProperties panel. Opens a [DColorCombo](https://wiki.facepunch.com/gmod/DColorCombo) if the color preview is clicked.
---
--- See [Editable Entities](https://wiki.facepunch.com/gmod/Editable_Entities) for how this is used ingame.
---@class DProperty_VectorColor : DProperty_Generic
local DProperty_VectorColor = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by a property row to setup a color selection control.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperty_VectorColor:Setup)
---@param settings table A table of settings. None of the values are used for this property. See Editable Entities.
function DProperty_VectorColor:Setup(settings) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the color value of the property.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperty_VectorColor:SetValue)
---@param color Vector Sets the color to use in a DProperty_VectorColor.
function DProperty_VectorColor:SetValue(color) end
