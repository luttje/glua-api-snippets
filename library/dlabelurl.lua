---@meta

---@class DLabelURL : Panel
local DLabelURL = {}

---[CLIENT] Gets the current text color of the DLabelURL. Alias as DLabelURL:GetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:GetColor)
---@return table #The current text Global.Color.
function DLabelURL:GetColor() end

---[CLIENT] Gets the current text color of the DLabelURL set by DLabelURL:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:GetTextColor)
---@return table #The current text Global.Color.
function DLabelURL:GetTextColor() end

---[CLIENT] Returns the color set by DLabelURL:SetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:GetTextStyleColor)
---@return table #The Color
function DLabelURL:GetTextStyleColor() end

---[CLIENT] Alias of DLabelURL:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:SetColor)
---@param col table The Global.Color to use.
function DLabelURL:SetColor(col) end

---[CLIENT] Sets the text color of the DLabelURL. Overrides DLabelURL:SetTextStyleColor.
---
---
--- This should only be used immediately after it is created, and otherwise Panel:SetFGColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:SetTextColor)
---@param col table The Global.Color to use.
function DLabelURL:SetTextColor(col) end

---[CLIENT] Sets the base text color of the DLabelURL. This is overridden by DLabelURL:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabelURL:SetTextStyleColor)
---@param color table The Global.Color to set
function DLabelURL:SetTextStyleColor(color) end
