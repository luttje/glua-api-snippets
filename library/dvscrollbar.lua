---@meta

---
--- A generic vertical scrollbar, used in DScrollPanel. See the horizontal alternative [here](DHScrollBar).
---
--- The scrollbar notably contains `DVScrollBar.btnUp`, `DVScrollBar.btnDown`, and `DVScrollBar.btnGrip` which are the up button, down button, and grip respectively. Editing the paint functions of these allows custom scrollbar styling (See DScrollPanel:GetVBar for an example), although it is a better idea to use [Derma Skins](Derma_Skin_Creation).
---
---@class DVScrollBar : Panel
local DVScrollBar = {}

---[CLIENT AND MENU] Adds specified amount of scroll in pixels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:AddScroll)
---@param add number How much to scroll downwards. Can be negative for upwards scroll
---@return boolean # True if the scroll level was changed (i.e. if we did or did not scroll)
function DVScrollBar:AddScroll(add) end

---[CLIENT AND MENU] Smoothly scrolls to given level.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:AnimateTo)
---@param scroll number The scroll level to animate to. In pixels from the top ( from 0 )
---@param length number Length of the animation in seconds
---@param delay? number Delay of the animation in seconds
---@param ease? number See Panel:NewAnimation for explanation.
function DVScrollBar:AnimateTo(scroll, length, delay, ease) end

---[CLIENT AND MENU] Returns the scale of the scroll bar based on the difference in size between the visible "window" into the canvas that is being scrolled. Should be used after DVScrollBar:SetUp.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:BarScale)
---@return number # The scale of the scrollbar.
function DVScrollBar:BarScale() end

---[CLIENT AND MENU] Returns whether or not the manual up/down scroll buttons are visible or not. Set by DVScrollBar:SetHideButtons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:GetHideButtons)
---@return boolean # Whether or not the manual up/down scroll buttons are visible or not.
function DVScrollBar:GetHideButtons() end

---[CLIENT AND MENU] Returns the negative of DVScrollBar:GetScroll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:GetOffset)
---@return number # The scroll offset.
function DVScrollBar:GetOffset() end

---[CLIENT AND MENU] Returns the amount of scroll level from the top in pixels
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:GetScroll)
---@return number # The amount of scroll level from the top
function DVScrollBar:GetScroll() end

---[CLIENT AND MENU] Called from within DScrollBarGrip
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:Grip)
function DVScrollBar:Grip() end

---[CLIENT AND MENU] Allows hiding the up and down buttons for better visual stylisation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:SetHideButtons)
---@param hide boolean True to hide
function DVScrollBar:SetHideButtons(hide) end

---[CLIENT AND MENU] Sets the scroll level in pixels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:SetScroll)
---@param scroll number The new scroll value.
function DVScrollBar:SetScroll(scroll) end

---[CLIENT AND MENU] Sets up the scrollbar for use.
---
--- The scrollbar will automatically disable itself if the total height of the canvas is lower than the height of the panel that holds the canvas during this function call.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DVScrollBar:SetUp)
---@param barSize number The size of the panel that holds the canvas, basically size of "1 page".
---@param canvasSize number The total size of the canvas, this typically is the bigger number.
function DVScrollBar:SetUp(barSize, canvasSize) end
