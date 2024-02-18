---@meta

---
--- Underlined link label without a DoClick function. When a valid URL is set and the label is clicked, it will open a browser window and navigate to the address.
---
--- This panel uses gui.OpenURL internally and its restrictions apply.
--- 	Creates a DLabelURL that opens the wiki when clicked.
---@class DLabelURL : URLLabel
local DLabelURL = {}

---[CLIENT AND MENU] Does absolutely nothing at all.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:GetAutoStretchVertical)
---@return boolean # Does nothing.
function DLabelURL:GetAutoStretchVertical() end

---[CLIENT AND MENU] Gets the current text color of the DLabelURL. Returns either DLabelURL:GetTextColor or if that is unset -  DLabelURL:GetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:GetColor)
---@return table # The current text Global.Color.
function DLabelURL:GetColor() end

---[CLIENT AND MENU] Gets the current text color of the DLabelURL set by DLabelURL:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:GetTextColor)
---@return table # The current text Global.Color.
function DLabelURL:GetTextColor() end

---[CLIENT AND MENU] Returns the color set by DLabelURL:SetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:GetTextStyleColor)
---@return table # The Color
function DLabelURL:GetTextStyleColor() end

---[CLIENT AND MENU] Does absolutely nothing at all.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:SetAutoStretchVertical)
---@param draw boolean Does nothing.
function DLabelURL:SetAutoStretchVertical(draw) end

---[CLIENT AND MENU] Alias of DLabelURL:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:SetColor)
---@param col table The Global.Color to use.
function DLabelURL:SetColor(col) end

---[CLIENT AND MENU] Sets the text color of the DLabelURL. Overrides DLabelURL:SetTextStyleColor.
---
---
--- This should only be used immediately after it is created, and otherwise Panel:SetFGColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:SetTextColor)
---@param col table The Global.Color to use.
function DLabelURL:SetTextColor(col) end

---[CLIENT AND MENU] Sets the base text color of the DLabelURL. This is overridden by DLabelURL:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:SetTextStyleColor)
---@param color table The Global.Color to set
function DLabelURL:SetTextStyleColor(color) end

---[CLIENT AND MENU] Used internally to set correct text color via Panel:SetFGColor and DLabelURL:GetColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:UpdateFGColor)
function DLabelURL:UpdateFGColor() end
