---@meta

--- The **DColorCombo** allows the user to choose color, without alpha,
--- using [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer) or [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette) in a tabbed view.
---@class DColorCombo : DPropertySheet
local DColorCombo = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally to create panels necessary for this panel to work.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorCombo:BuildControls)
function DColorCombo:BuildControls() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color of the [DColorCombo](https://wiki.facepunch.com/gmod/DColorCombo).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorCombo:GetColor)
---@return table # A Color
function DColorCombo:GetColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns true if the panel is currently being edited
---
--- More of a internal method, it technically should only ever work (i.e. return true) inside [DColorCombo:OnValueChanged](https://wiki.facepunch.com/gmod/DColorCombo:OnValueChanged).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorCombo:IsEditing)
---@return boolean #
function DColorCombo:IsEditing() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color of this panel. See also [DColorCombo:GetColor](https://wiki.facepunch.com/gmod/DColorCombo:GetColor)
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorCombo:SetColor)
---@param clr table A Color.
function DColorCombo:SetColor(clr) end
