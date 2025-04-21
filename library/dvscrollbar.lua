---@meta

--- A generic vertical scrollbar, used in [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel). See the horizontal alternative [here](https://wiki.facepunch.com/gmod/DHScrollBar).
---
--- The scrollbar notably contains `DVScrollBar.btnUp`, `DVScrollBar.btnDown`, and `DVScrollBar.btnGrip` which are the up button, down button, and grip respectively. Editing the paint functions of these allows custom scrollbar styling (See [DScrollPanel:GetVBar](https://wiki.facepunch.com/gmod/DScrollPanel:GetVBar) for an example), although it is a better idea to use [Derma Skins](https://wiki.facepunch.com/gmod/Derma_Skin_Creation).
---@class DVScrollBar : Panel
local DVScrollBar = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds specified amount of scroll in pixels.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:AddScroll)
---@param add number How much to scroll downwards. Can be negative for upwards scroll
---@return boolean # True if the scroll level was changed (i.e. if we did or did not scroll)
function DVScrollBar:AddScroll(add) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Smoothly scrolls to given level.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:AnimateTo)
---@param scroll number The scroll level to animate to. In pixels from the top ( from 0 )
---@param length number Length of the animation in seconds
---@param delay? number Delay of the animation in seconds
---@param ease? number See Panel:NewAnimation for explanation.
function DVScrollBar:AnimateTo(scroll, length, delay, ease) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the scale of the scroll bar based on the difference in size between the visible "window" into the canvas that is being scrolled. Should be used after [DVScrollBar:SetUp](https://wiki.facepunch.com/gmod/DVScrollBar:SetUp).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:BarScale)
---@return number # The scale of the scrollbar.
function DVScrollBar:BarScale() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the manual up/down scroll buttons are visible or not. Set by [DVScrollBar:SetHideButtons](https://wiki.facepunch.com/gmod/DVScrollBar:SetHideButtons).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:GetHideButtons)
---@return boolean # Whether or not the manual up/down scroll buttons are visible or not.
function DVScrollBar:GetHideButtons() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the negative of [DVScrollBar:GetScroll](https://wiki.facepunch.com/gmod/DVScrollBar:GetScroll).
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:GetOffset)
---@return number # The scroll offset.
function DVScrollBar:GetOffset() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the amount of scroll level from the top in pixels
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:GetScroll)
---@return number # The amount of scroll level from the top
function DVScrollBar:GetScroll() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called from within [DScrollBarGrip](https://wiki.facepunch.com/gmod/DScrollBarGrip)
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:Grip)
function DVScrollBar:Grip() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Allows hiding the up and down buttons for better visual stylisation.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:SetHideButtons)
---@param hide boolean True to hide
function DVScrollBar:SetHideButtons(hide) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the scroll level in pixels.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:SetScroll)
---@param scroll number The new scroll value.
function DVScrollBar:SetScroll(scroll) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets up the scrollbar for use.
---
--- The scrollbar will automatically disable itself if the total height of the canvas is lower than the height of the panel that holds the canvas during this function call.
---
---[View wiki](https://wiki.facepunch.com/gmod/DVScrollBar:SetUp)
---@param barSize number The size of the panel that holds the canvas, basically size of "1 page".
---@param canvasSize number The total size of the canvas, this typically is the bigger number.
function DVScrollBar:SetUp(barSize, canvasSize) end
