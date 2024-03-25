---@meta

---
--- 		**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 		Color picker control for a DProperties panel. Opens a [DColorCombo](https://wiki.facepunch.com/gmod/DColorCombo) if the color preview is clicked.
---
--- 		See [Editable Entities](https://wiki.facepunch.com/gmod/Editable Entities) for how this is used ingame.
---
---@class DProperty_VectorColor : DProperty_Generic
local DProperty_VectorColor = {}

---[CLIENT] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by a property row to setup a color selection control.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_VectorColor:Setup)
---@param settings table A table of settings. None of the values are used for this property. See Editable Entities.
function DProperty_VectorColor:Setup(settings) end

---[CLIENT] Sets the color value of the property.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_VectorColor:SetValue)
---@param color Vector Sets the color to use in a DProperty_VectorColor.
function DProperty_VectorColor:SetValue(color) end
