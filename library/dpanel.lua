---@meta

--- A simple rectangular box, commonly used for parenting other elements to. Pretty much all elements are based on this.
---@class DPanel : Panel
local DPanel = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the panel's background color.
---
--- **NOTE**: By default this returns **nil** even though the default background color is white
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:GetBackgroundColor)
---@return table # Color of the panel's background.
function DPanel:GetBackgroundColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the panel is disabled.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:GetDisabled)
---@return boolean # True if the panel is disabled (mouse input disabled and background alpha set to 75), false if its enabled (mouse input enabled and background alpha set to 255).
function DPanel:GetDisabled() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the panel background is being drawn. Alias of [DPanel:GetPaintBackground](https://wiki.facepunch.com/gmod/DPanel:GetPaintBackground).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:GetDrawBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DPanel:GetPaintBackground instead.
function DPanel:GetDrawBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used internally by [DMenu](https://wiki.facepunch.com/gmod/DMenu).
---
--- Returns whether the frame is part of a derma menu or not.
---
--- If this is `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:GetIsMenu)
---@return boolean # Whether this panel is a Menu Component
function DPanel:GetIsMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the panel background is being drawn.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:GetPaintBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
function DPanel:GetPaintBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing. Returns value set by [DPanel:SetTabbingDisabled](https://wiki.facepunch.com/gmod/DPanel:SetTabbingDisabled).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:GetTabbingDisabled)
---@return boolean #
function DPanel:GetTabbingDisabled() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the background color of the panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:SetBackgroundColor)
---@param color table The background color.
function DPanel:SetBackgroundColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not to disable the panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:SetDisabled)
---@param disabled boolean True to disable the panel (mouse input disabled and background alpha set to 75), false to enable it (mouse input enabled and background alpha set to 255).
function DPanel:SetDisabled(disabled) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not to draw the panel background. Alias of [DPanel:SetPaintBackground](https://wiki.facepunch.com/gmod/DPanel:SetPaintBackground).
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:SetDrawBackground)
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DPanel:SetPaintBackground instead.
function DPanel:SetDrawBackground(draw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used internally by [DMenu](https://wiki.facepunch.com/gmod/DMenu).
---
--- Sets whether the frame is part of a derma menu or not.
---
--- If this is set to `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:SetIsMenu)
---@param isMenu boolean Whether this pane is a Menu Component
function DPanel:SetIsMenu(isMenu) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not to paint/draw the panel background.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:SetPaintBackground)
---@param paint boolean True to show the panel's background, false to hide it.
function DPanel:SetPaintBackground(paint) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:SetTabbingDisabled)
---@param draw boolean
function DPanel:SetTabbingDisabled(draw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DPanel:UpdateColours)
function DPanel:UpdateColours() end
