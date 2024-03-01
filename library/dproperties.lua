---@meta

---
--- A grid for editing the properties of something using names and values. Properties can be categorized and strongly typed.
---
---
--- ##  Associated controls
--- * DProperty_VectorColor
--- * DProperty_Boolean
--- * DProperty_Generic
--- * DProperty_Combo
--- * DProperty_Float
--- * DProperty_Int
--- 	Creates a DProperties control with a few properties set up
---@class DProperties : Panel
local DProperties = {}

---[CLIENT] Creates a row in the properties panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperties:CreateRow)
---@param category string The category to list this row under
---@param name string The label of this row
---@return Panel # An internal Row panel. It has 2 methods of interest: * `Setup`( string type, table vars )   * Call to set up the panel as one of the `DProperty_` panels. `vars` parameter is directly fed into the created `DProperty_` panels' `Setup` function. * `SetValue`( any value )   * Call to set the value on the created `DProperty_` panel.
function DProperties:CreateRow(category, name) end

---[CLIENT] Returns the DScrollPanel all the properties panels are attached to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperties:GetCanvas)
---@return Panel # A DScrollPanel canvas
function DProperties:GetCanvas() end

---[CLIENT] Returns (or creates) a category of properties.
---
--- See DProperties:CreateRow for adding actual properties.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperties:GetCategory)
---@param name string Name of the category
---@param create? boolean Create a new category if it doesn't exist.
---@return Panel # An internal panel.
function DProperties:GetCategory(name, create) end
