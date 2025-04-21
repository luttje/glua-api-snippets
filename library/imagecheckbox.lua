---@meta

--- A checkbox panel similar to [DCheckBox](https://wiki.facepunch.com/gmod/DCheckBox) and [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) with customizable checked state image.
---
--- Uses the [Material](https://wiki.facepunch.com/gmod/Material) panel internally. Can't have a label.
---
--- **NOTE**: Will error if no material was set.
---@class ImageCheckBox : Button
local ImageCheckBox = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the checked state of the [ImageCheckBox](https://wiki.facepunch.com/gmod/ImageCheckBox)
---
---[View wiki](https://wiki.facepunch.com/gmod/ImageCheckBox:GetChecked)
---@return boolean # true for checked, false otherwise
function ImageCheckBox:GetChecked() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the checked state of the checkbox.
---
--- Checked state can be obtained by [ImageCheckBox](https://wiki.facepunch.com/gmod/ImageCheckBox).State.
---
---[View wiki](https://wiki.facepunch.com/gmod/ImageCheckBox:Set)
---@param OnOff boolean true for checked, false otherwise
function ImageCheckBox:Set(OnOff) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the checked state of the checkbox.
---
--- Checked state can be obtained via [ImageCheckBox:GetChecked](https://wiki.facepunch.com/gmod/ImageCheckBox:GetChecked)
---
---[View wiki](https://wiki.facepunch.com/gmod/ImageCheckBox:SetChecked)
---@param bOn boolean true for checked, false otherwise
function ImageCheckBox:SetChecked(bOn) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the material that will be visible when the [ImageCheckBox](https://wiki.facepunch.com/gmod/ImageCheckBox) is checked.
---
--- Internally calls [Material:SetMaterial](https://wiki.facepunch.com/gmod/Material:SetMaterial).
---
--- **NOTE**: Will error if no material was set.
---
---[View wiki](https://wiki.facepunch.com/gmod/ImageCheckBox:SetMaterial)
---@param mat string The file path of the material to set (relative to "garrysmod/materials/").
function ImageCheckBox:SetMaterial(mat) end
