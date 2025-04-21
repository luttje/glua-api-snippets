---@meta

--- A standard Derma button.
---
--- By default, a [DButton](https://wiki.facepunch.com/gmod/DButton) is 22px tall.
---@class DButton : DLabel
local DButton = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns value set by [DButton:SetDrawBorder](https://wiki.facepunch.com/gmod/DButton:SetDrawBorder). See that page for more info.
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:GetDrawBorder)
---@return boolean # value set by DButton:SetDrawBorder.
function DButton:GetDrawBorder() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns true if the DButton is currently depressed (a user is clicking on it).
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:IsDown)
---@return boolean # Whether or not the button is depressed.
function DButton:IsDown() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets a console command to be called when the button is clicked.
---
--- This overrides the button's `DoClick` method.
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:SetConsoleCommand)
---@param command string The console command to be called.
---@param args? string The arguments for the command.
function DButton:SetConsoleCommand(command, args) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does absolutely nothing at all. Default value is automatically set to true.
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:SetDrawBorder)
---@param draw boolean Does nothing.
function DButton:SetDrawBorder(draw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets an image to be displayed as the button's background. Alias of [DButton:SetImage](https://wiki.facepunch.com/gmod/DButton:SetImage)
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:SetIcon)
---@param img? string The image file to use, relative to `/materials`. If this is nil, the image background is removed.
function DButton:SetIcon(img) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets an image to be displayed as the button's background.
---
--- See [DButton:SetMaterial](https://wiki.facepunch.com/gmod/DButton:SetMaterial) for equivalent function that uses [IMaterial](https://wiki.facepunch.com/gmod/IMaterial) instead.
---
--- Also see: [DImageButton](https://wiki.facepunch.com/gmod/DImageButton)
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:SetImage)
---@param img? string The image file to use, relative to `/materials`. If this is nil, the image background is removed.
function DButton:SetImage(img) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets an image to be displayed as the button's background.
---
--- See [DButton:SetImage](https://wiki.facepunch.com/gmod/DButton:SetImage) for equivalent function that uses file paths instead. Also see [DImageButton](https://wiki.facepunch.com/gmod/DImageButton).
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:SetMaterial)
---@param img? IMaterial The material to use. If this is nil, the image background is removed.
function DButton:SetMaterial(img) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) A hook called from within [DLabel](https://wiki.facepunch.com/gmod/DLabel)'s [PANEL:ApplySchemeSettings](https://wiki.facepunch.com/gmod/PANEL:ApplySchemeSettings) to determine the color of the text on display.
---
---[View wiki](https://wiki.facepunch.com/gmod/DButton:UpdateColours)
---@param skin table A table supposed to contain the color values listed above.
function DButton:UpdateColours(skin) end
