---@meta

---
--- A checkbox panel similar to [DCheckBox](https://wiki.facepunch.com/gmod/DCheckBox) and [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) with customizable checked state image.
---
--- Uses the [Material](https://wiki.facepunch.com/gmod/Material) panel internally. Can't have a label.
---
--- **NOTE**: Will error if no material was set.
---
---
---@class ImageCheckBox : Button
local ImageCheckBox = {}

---[CLIENT] Returns the checked state of the [ImageCheckBox](https://wiki.facepunch.com/gmod/ImageCheckBox)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ImageCheckBox:GetChecked)
---@return boolean # true for checked, false otherwise
function ImageCheckBox:GetChecked() end

---[CLIENT] Sets the checked state of the checkbox.
---
--- Checked state can be obtained by [ImageCheckBox](https://wiki.facepunch.com/gmod/ImageCheckBox).State.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ImageCheckBox:Set)
---@param OnOff boolean true for checked, false otherwise
function ImageCheckBox:Set(OnOff) end

---[CLIENT] Sets the checked state of the checkbox.
---
--- Checked state can be obtained via [ImageCheckBox:GetChecked](https://wiki.facepunch.com/gmod/ImageCheckBox:GetChecked)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ImageCheckBox:SetChecked)
---@param bOn boolean true for checked, false otherwise
function ImageCheckBox:SetChecked(bOn) end

---[CLIENT] Sets the material that will be visible when the [ImageCheckBox](https://wiki.facepunch.com/gmod/ImageCheckBox) is checked.
---
--- Internally calls [Material:SetMaterial](https://wiki.facepunch.com/gmod/Material:SetMaterial).
---
--- **NOTE**: Will error if no material was set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ImageCheckBox:SetMaterial)
---@param mat string The file path of the material to set (relative to "garrysmod/materials/").
function ImageCheckBox:SetMaterial(mat) end
