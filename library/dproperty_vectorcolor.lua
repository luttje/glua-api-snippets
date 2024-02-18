---@meta

---
---
--- 		Color picker control for a DProperties panel. Opens a DColorCombo if the color preview is clicked.
---
--- 		See Editable Entities for how this is used ingame.
--- 	Creates a demo VectorColor property.
---@class DProperty_VectorColor : DProperty_Generic
local DProperty_VectorColor = {}

---[CLIENT] Called by a property row to setup a color selection control.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_VectorColor:Setup)
---@param settings table A table of settings. None of the values are used for this property. See Editable Entities.
function DProperty_VectorColor:Setup(settings) end

---[CLIENT] Sets the color value of the property.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_VectorColor:SetValue)
---@param color Vector Sets the color to use in a DProperty_VectorColor.
function DProperty_VectorColor:SetValue(color) end
