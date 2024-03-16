---@meta

---
--- A standard Derma button.
---
--- By default, a DButton is 22px tall.
--- 	The DButton is exactly what you think it is - a button!
---@class DButton : DLabel
local DButton = {}

---[CLIENT AND MENU] Returns value set by DButton:SetDrawBorder. See that page for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:GetDrawBorder)
---@return boolean # value set by DButton:SetDrawBorder.
function DButton:GetDrawBorder() end

---[CLIENT AND MENU] Returns true if the DButton is currently depressed (a user is clicking on it).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:IsDown)
---@return boolean # Whether or not the button is depressed.
function DButton:IsDown() end

---[CLIENT AND MENU] Sets a console command to be called when the button is clicked.
---
--- This overrides the button's `DoClick` method.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:SetConsoleCommand)
---@param command string The console command to be called.
---@param args? string The arguments for the command.
function DButton:SetConsoleCommand(command, args) end

---[CLIENT AND MENU] Sets whether or not the DButton is disabled.
---
--- When disabled, the button is `greyed out` and cannot be clicked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:SetDisabled)
---@param disable boolean When true Enable the button, when false Disable the button.
---@deprecated Use Panel:SetEnabled instead.
function DButton:SetDisabled(disable) end

---[CLIENT AND MENU] Does absolutely nothing at all. Default value is automatically set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:SetDrawBorder)
---@param draw boolean Does nothing.
function DButton:SetDrawBorder(draw) end

---[CLIENT AND MENU] Sets an image to be displayed as the button's background. Alias of DButton:SetImage
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:SetIcon)
---@param img? string The image file to use, relative to `/materials`. If this is nil, the image background is removed.
function DButton:SetIcon(img) end

---[CLIENT AND MENU] Sets an image to be displayed as the button's background.
---
--- See DButton:SetMaterial for equivalent function that uses IMaterial instead.
---
--- Also see: DImageButton
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:SetImage)
---@param img? string The image file to use, relative to `/materials`. If this is nil, the image background is removed.
function DButton:SetImage(img) end

---[ CLIENT AND MENU ] Sets an image to be displayed as the button's background.
---
--- See DButton:SetImage for equivalent function that uses file paths instead. Also see DImageButton.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:SetMaterial)
---@param img? IMaterial The material to use. If this is nil, the image background is removed.
function DButton:SetMaterial(img) end

---[CLIENT AND MENU] A hook called from within DLabel's PANEL:ApplySchemeSettings to determine the color of the text on display.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DButton:UpdateColours)
---@param skin table A table supposed to contain the color values listed above.
function DButton:UpdateColours(skin) end
