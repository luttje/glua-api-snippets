---@meta

---
--- 		The **DColorCombo** allows the user to choose color, without alpha,
--- 		using DColorMixer or DColorPalette in a tabbed view.
--- 	Creates a DColorCombo and sets its initial value.
---@class DColorCombo : DPropertySheet
local DColorCombo = {}

---[CLIENT] Called internally to create panels necessary for this panel to work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCombo:BuildControls)
function DColorCombo:BuildControls() end

---[CLIENT] Returns the color of the DColorCombo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCombo:GetColor)
---@return table # A Color
function DColorCombo:GetColor() end

---[CLIENT] Returns true if the panel is currently being edited
---
--- More of a internal method, it technically should only ever work (i.e. return true) inside DColorCombo:OnValueChanged.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCombo:IsEditing)
---@return boolean #
function DColorCombo:IsEditing() end

---[CLIENT] Sets the color of this panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorCombo:SetColor)
---@param clr table A Color.
function DColorCombo:SetColor(clr) end
