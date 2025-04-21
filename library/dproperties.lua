---@meta

--- A grid for editing the properties of something using names and values. Properties can be categorized and strongly typed.
---
--- ##  Associated controls
--- * [DProperty_VectorColor](https://wiki.facepunch.com/gmod/DProperty_VectorColor)
--- * [DProperty_Boolean](https://wiki.facepunch.com/gmod/DProperty_Boolean)
--- * [DProperty_Generic](https://wiki.facepunch.com/gmod/DProperty_Generic)
--- * [DProperty_Combo](https://wiki.facepunch.com/gmod/DProperty_Combo)
--- * [DProperty_Float](https://wiki.facepunch.com/gmod/DProperty_Float)
--- * [DProperty_Int](https://wiki.facepunch.com/gmod/DProperty_Int)
---@class DProperties : Panel
local DProperties = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a row in the properties panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperties:CreateRow)
---@param category string The category to list this row under
---@param name string The label of this row
---@return Panel # An internal Row panel. It has 2 methods of interest:
--- * `Setup`( string type, table vars )
---   * Call to set up the panel as one of the `DProperty_` panels. `vars` parameter is directly fed into the created `DProperty_` panels' `Setup` function.
--- * `SetValue`( [any](https://wiki.facepunch.com/gmod/any) value )
---   * Call to set the value on the created `DProperty_` panel.
function DProperties:CreateRow(category, name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel) all the properties panels are attached to.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperties:GetCanvas)
---@return Panel # A DScrollPanel canvas
function DProperties:GetCanvas() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns (or creates) a category of properties.
---
--- See [DProperties:CreateRow](https://wiki.facepunch.com/gmod/DProperties:CreateRow) for adding actual properties.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProperties:GetCategory)
---@param name string Name of the category
---@param create? boolean Create a new category if it doesn't exist.
---@return Panel # An internal panel.
function DProperties:GetCategory(name, create) end
