---@meta

--- A panel that fades its contents in and out once, like a notification.Creates a notification panel with a text label inside.Creates a notification panel of Dr. Kleiner reminding the player to wear their HEV suit.
---@class DNotify : Panel
local DNotify = {}

---[CLIENT] Adds a panel to the notification
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:AddItem)
---@param pnl Panel The panel to add
---@param lifeLength? number If set, overrides DNotify:SetLife for when the given panel should be removed.
function DNotify:AddItem(pnl, lifeLength) end

---[CLIENT] Returns the current alignment of this notification panel. Set by DNotify:SetAlignment.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:GetAlignment)
---@return number # The numpad alignment
function DNotify:GetAlignment() end

---[CLIENT] Returns all the items added with DNotify:AddItem.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:GetItems)
---@return table # A table of Panels.
function DNotify:GetItems() end

---[CLIENT] Returns the display time in seconds of the DNotify. This is set with
--- DNotify:SetLife.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:GetLife)
---@return number # The display time in seconds.
function DNotify:GetLife() end

---[CLIENT] Returns the spacing between items set by DNotify:SetSpacing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:GetSpacing)
---@return number #
function DNotify:GetSpacing() end

---[CLIENT] Sets the alignment of the child panels in the notification
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:SetAlignment)
---@param alignment number It's the Numpad alignment, 6 is right, 9 is top left, etc.
function DNotify:SetAlignment(alignment) end

---[CLIENT] Sets the display time in seconds for the DNotify.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:SetLife)
---@param time number The time in seconds.
function DNotify:SetLife(time) end

---[CLIENT] Sets the spacing between child elements of the notification panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:SetSpacing)
---@param spacing number
function DNotify:SetSpacing(spacing) end

---[CLIENT] Used internally to position and fade in/out its DNotify:GetItems.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DNotify:Shuffle)
function DNotify:Shuffle() end
