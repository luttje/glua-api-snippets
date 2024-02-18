---@meta

---
--- 		The **DCheckBoxLabel** is a DCheckBox with a DLabel next to it.
--- 		It allows you to get a boolean value from the user (true/false - yes/no)
--- 	Creates a DCheckBoxLabel, ties it to a convar, and sets its initial value.
---@class DCheckBoxLabel : DPanel
local DCheckBoxLabel = {}

---[CLIENT AND MENU] Gets the checked state of the checkbox. This calls the checkbox's DCheckBox:GetChecked function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:GetChecked)
---@return boolean # Whether the box is checked or not.
function DCheckBoxLabel:GetChecked() end

---[CLIENT AND MENU] Gets the indentation of the element on the X axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:GetIndent)
---@return number # How much the content is moved to the right in pixels
function DCheckBoxLabel:GetIndent() end

---[CLIENT AND MENU] Sets the color of the DCheckBoxLabel's text to the bright text color defined in the skin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetBright)
---@param bright boolean true makes the text bright.
---@deprecated You really should be using DCheckBoxLabel:SetTextColor instead
function DCheckBoxLabel:SetBright(bright) end

---[CLIENT AND MENU] Sets the checked state of the checkbox. Does not call DCheckBoxLabel:OnChange or Panel:ConVarChanged, unlike DCheckBoxLabel:SetValue.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetChecked)
---@param checked boolean Whether the box should be checked or not.
function DCheckBoxLabel:SetChecked(checked) end

---[CLIENT AND MENU] Sets the console variable to be set when the checked state of the DCheckBoxLabel changes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetConVar)
---@param convar string The name of the convar to set
function DCheckBoxLabel:SetConVar(convar) end

---[CLIENT AND MENU] Sets the text of the DCheckBoxLabel to be dark colored.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetDark)
---@param darkify boolean True to be dark, false to be default
---@deprecated You really should be using DCheckBoxLabel:SetTextColor instread
function DCheckBoxLabel:SetDark(darkify) end

---[CLIENT AND MENU] Sets the font of the text part of the DCheckBoxLabel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetFont)
---@param font string Font name
function DCheckBoxLabel:SetFont(font) end

---[CLIENT AND MENU] Sets the indentation of the element on the X axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetIndent)
---@param ident number How much in pixels to move the content to the right
function DCheckBoxLabel:SetIndent(ident) end

---[CLIENT AND MENU] Sets the text color for the DCheckBoxLabel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetTextColor)
---@param color table The text color. Uses the Color.
function DCheckBoxLabel:SetTextColor(color) end

---[CLIENT AND MENU] Sets the checked state of the checkbox, and calls DCheckBoxLabel:OnChange and the checkbox's Panel:ConVarChanged methods.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:SetValue)
---@param checked boolean Whether the box should be checked or not (1 or 0 can also be used).
function DCheckBoxLabel:SetValue(checked) end

---[CLIENT AND MENU] Toggles the checked state of the DCheckBoxLabel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCheckBoxLabel:Toggle)
function DCheckBoxLabel:Toggle() end
