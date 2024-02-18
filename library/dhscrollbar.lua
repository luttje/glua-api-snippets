---@meta

---
--- A generic horizontal scrollbar. See the vertical alternative [here](DVScrollBar).
---
--- The scrollbar notably contains `DHScrollBar.btnLeft`, `DHScrollBar.btnRight`, and `DHScrollBar.btnGrip` which are the left button, right button, and grip respectively. Editing the paint functions of these allows custom scrollbar styling, although it is a better idea to use [Derma Skins](Derma_Skin_Creation).
---
---@class DHScrollBar : Panel
local DHScrollBar = {}

---[CLIENT AND MENU] Adds specified amount of scroll in pixels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:AddScroll)
---@param add number How much to scroll rightwards. Can be negative for leftwards scroll
---@return boolean # True if the scroll level was changed (i.e. if we did or did not scroll)
function DHScrollBar:AddScroll(add) end

---[CLIENT AND MENU] Smoothly scrolls to given level.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:AnimateTo)
---@param scroll number The scroll level to animate to. In pixels from the left ( from 0 )
---@param length number Length of the animation in seconds
---@param delay? number Delay of the animation in seconds
---@param ease? number See Panel:NewAnimation for explanation.
function DHScrollBar:AnimateTo(scroll, length, delay, ease) end

---[CLIENT AND MENU] Returns the scale of the scroll bar based on the difference in size between the visible "window" into the canvas that is being scrolled. Should be used after DHScrollBar:SetUp.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:BarScale)
---@return number # The scale of the scrollbar.
function DHScrollBar:BarScale() end

---[CLIENT AND MENU] Returns whether or not the manual left/right scroll buttons are visible or not. Set by DHScrollBar:SetHideButtons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:GetHideButtons)
---@return boolean # Whether or not the manual left/right scroll buttons are visible or not.
function DHScrollBar:GetHideButtons() end

---[CLIENT AND MENU] Returns the negative of DHScrollBar:GetScroll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:GetOffset)
---@return number # The scroll offset.
function DHScrollBar:GetOffset() end

---[CLIENT AND MENU] Returns the amount of scroll level from the left in pixels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:GetScroll)
---@return number # The amount of scroll level from the left edge.
function DHScrollBar:GetScroll() end

---[CLIENT AND MENU] Called from within DScrollBarGrip
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:Grip)
function DHScrollBar:Grip() end

---[CLIENT AND MENU] Allows hiding the left and right buttons for better visual stylisation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:SetHideButtons)
---@param hide boolean True to hide
function DHScrollBar:SetHideButtons(hide) end

---[CLIENT AND MENU] Sets the scroll level in pixels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:SetScroll)
---@param scroll number The new scroll value.
function DHScrollBar:SetScroll(scroll) end

---[CLIENT AND MENU] Sets up the scrollbar for use.
---
--- The scrollbar will automatically disable itself if the total width of the canvas is lower than the width of the panel that holds the canvas during this function call.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHScrollBar:SetUp)
---@param barSize number The size of the panel that holds the canvas, basically size of "1 page".
---@param canvasSize number The total size of the canvas, this typically is the bigger number.
function DHScrollBar:SetUp(barSize, canvasSize) end
