---@meta

---
--- 		**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 		A base for other controls for [DProperties](https://wiki.facepunch.com/gmod/DProperties). Acts as a generic text input on its own.
---
---@class DProperty_Generic : Panel
local DProperty_Generic = {}

---[CLIENT] Returns the internal row panel of a [DProperties](https://wiki.facepunch.com/gmod/DProperties) that this panel belongs to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_Generic:GetRow)
---@return Panel # The row panel.
function DProperty_Generic:GetRow() end

---[CLIENT] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Called internally by [DProperties](https://wiki.facepunch.com/gmod/DProperties).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_Generic:SetRow)
---@param row Panel The new row panel.
function DProperty_Generic:SetRow(row) end

---[CLIENT] Sets up a generic control for use by [DProperties](https://wiki.facepunch.com/gmod/DProperties).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_Generic:Setup)
---@param data table See Editable Entities.
function DProperty_Generic:Setup(data) end

---[CLIENT] Called by this control, or a derived control, to alert the row of the change.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProperty_Generic:ValueChanged)
---@param newVal any The new value.
---@param force boolean Force an update.
function DProperty_Generic:ValueChanged(newVal, force) end
