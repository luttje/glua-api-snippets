---@meta

--- A generic horizontal scrollbar. See the vertical alternative [here](https://wiki.facepunch.com/gmod/DVScrollBar).
---
--- The scrollbar notably contains `DHScrollBar.btnLeft`, `DHScrollBar.btnRight`, and `DHScrollBar.btnGrip` which are the left button, right button, and grip respectively. Editing the paint functions of these allows custom scrollbar styling, although it is a better idea to use [Derma Skins](https://wiki.facepunch.com/gmod/Derma_Skin_Creation).
---@class DHScrollBar : Panel
local DHScrollBar = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds specified amount of scroll in pixels.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:AddScroll)
---@param add number How much to scroll rightwards. Can be negative for leftwards scroll
---@return boolean # True if the scroll level was changed (i.e. if we did or did not scroll)
function DHScrollBar:AddScroll(add) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Smoothly scrolls to given level.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:AnimateTo)
---@param scroll number The scroll level to animate to. In pixels from the left ( from 0 )
---@param length number Length of the animation in seconds
---@param delay? number Delay of the animation in seconds
---@param ease? number See Panel:NewAnimation for explanation.
function DHScrollBar:AnimateTo(scroll, length, delay, ease) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the scale of the scroll bar based on the difference in size between the visible "window" into the canvas that is being scrolled. Should be used after [DHScrollBar:SetUp](https://wiki.facepunch.com/gmod/DHScrollBar:SetUp).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:BarScale)
---@return number # The scale of the scrollbar.
function DHScrollBar:BarScale() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the manual left/right scroll buttons are visible or not. Set by [DHScrollBar:SetHideButtons](https://wiki.facepunch.com/gmod/DHScrollBar:SetHideButtons).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:GetHideButtons)
---@return boolean # Whether or not the manual left/right scroll buttons are visible or not.
function DHScrollBar:GetHideButtons() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the negative of [DHScrollBar:GetScroll](https://wiki.facepunch.com/gmod/DHScrollBar:GetScroll).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:GetOffset)
---@return number # The scroll offset.
function DHScrollBar:GetOffset() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the amount of scroll level from the left in pixels.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:GetScroll)
---@return number # The amount of scroll level from the left edge.
function DHScrollBar:GetScroll() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called from within [DScrollBarGrip](https://wiki.facepunch.com/gmod/DScrollBarGrip)
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:Grip)
function DHScrollBar:Grip() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Allows hiding the left and right buttons for better visual stylisation.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:SetHideButtons)
---@param hide boolean True to hide
function DHScrollBar:SetHideButtons(hide) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the scroll level in pixels.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:SetScroll)
---@param scroll number The new scroll value.
function DHScrollBar:SetScroll(scroll) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets up the scrollbar for use.
---
--- The scrollbar will automatically disable itself if the total width of the canvas is lower than the width of the panel that holds the canvas during this function call.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHScrollBar:SetUp)
---@param barSize number The size of the panel that holds the canvas, basically size of "1 page".
---@param canvasSize number The total size of the canvas, this typically is the bigger number.
function DHScrollBar:SetUp(barSize, canvasSize) end
