---@meta

--- Colorful buttons. Used internally by [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette).
---@class DColorButton : DLabel
local DColorButton = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the color of the button
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:GetColor)
---@return table # The Color of the button
function DColorButton:GetColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns value set by [DColorButton:SetDrawBorder](https://wiki.facepunch.com/gmod/DColorButton:SetDrawBorder). See that page for more info.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:GetDrawBorder)
---@return boolean # Value set by DColorButton:SetDrawBorder.
function DColorButton:GetDrawBorder() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the unique ID set by [DColorButton:SetID](https://wiki.facepunch.com/gmod/DColorButton:SetID).
---
--- Used internally by [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette)
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:GetID)
---@return number # The unique ID of the button
function DColorButton:GetID() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that is an alias of [Panel:IsSelected](https://wiki.facepunch.com/gmod/Panel:IsSelected).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:GetSelected)
---@return boolean #
function DColorButton:GetSelected() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DColorButton](https://wiki.facepunch.com/gmod/DColorButton) is currently being pressed (the user is holding it down).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:IsDown)
---@return boolean #
function DColorButton:IsDown() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color of the [DColorButton](https://wiki.facepunch.com/gmod/DColorButton).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:SetColor)
---@param color table A Color to set the color as
---@param noTooltip? boolean If true, the tooltip will not be reset to display the selected color.
function DColorButton:SetColor(color, noTooltip) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that does absolutely nothing at all. Default value is automatically set to true.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:SetDrawBorder)
---@param draw boolean Does nothing.
function DColorButton:SetDrawBorder(draw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that is used internally by [DColorPalette](https://wiki.facepunch.com/gmod/DColorPalette) to detect which button is which.
---
--- 	Pairs with [DColorButton:GetID](https://wiki.facepunch.com/gmod/DColorButton:GetID)
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorButton:SetID)
---@param id number A unique ID to give this button
function DColorButton:SetID(id) end
