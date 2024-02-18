---@meta

---
--- 		The collapsible category allows you to create numerous sections of controls, and have the ability to contract/expand them.
---
--- 		Consider using DCategoryList if you plan on using more than 1 of these.
--- 	Creates a DCollapsibleCategory panel.
---@class DCollapsibleCategory : Panel
local DCollapsibleCategory = {}

---[CLIENT AND MENU] Adds a new text button to the collapsible category, like the tool menu in Spawnmenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Add)
---@param name string The name of the button
---@return Panel # The DButton
function DCollapsibleCategory:Add(name) end

---[CLIENT AND MENU] Internal function that handles the open/close animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:AnimSlide)
---@param anim table
---@param delta number
---@param data table
function DCollapsibleCategory:AnimSlide(anim, delta, data) end

---[CLIENT AND MENU] Forces the category to open or collapse
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:DoExpansion)
---@param expand boolean True to open, false to collapse
function DCollapsibleCategory:DoExpansion(expand) end

---[CLIENT AND MENU] Returns the expand/collapse animation time set by DCollapsibleCategory:SetAnimTime.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetAnimTime)
---@return number # The animation time in seconds
function DCollapsibleCategory:GetAnimTime() end

---[CLIENT AND MENU] Returns whether or not the panel background is being drawn. Alias of DCollapsibleCategory:GetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetDrawBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DCollapsibleCategory:GetPaintBackground instead.
function DCollapsibleCategory:GetDrawBackground() end

---[CLIENT AND MENU] Returns whether the DCollapsibleCategory is expanded or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetExpanded)
---@return boolean # If expanded it will return true.
function DCollapsibleCategory:GetExpanded() end

---[CLIENT AND MENU] Returns the header height of the DCollapsibleCategory.
---
--- See also DCollapsibleCategory:SetHeaderHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetHeaderHeight)
---@return number # The current height of the header.
function DCollapsibleCategory:GetHeaderHeight() end

---[CLIENT AND MENU] If set, the DCategoryList that created this panel.
---
--- See also DCollapsibleCategory:SetList.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetList)
---@return Panel # The DCategoryList that created us.
function DCollapsibleCategory:GetList() end

---[CLIENT AND MENU] Doesn't actually do anything.
---
--- Returns the number set by DCollapsibleCategory:SetPadding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPadding)
---@return number #
function DCollapsibleCategory:GetPadding() end

---[CLIENT AND MENU] Returns whether or not the background should be painted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPaintBackground)
---@return boolean # If the background is painted or not
function DCollapsibleCategory:GetPaintBackground() end

---[CLIENT AND MENU] Returns whatever was set by DCollapsibleCategory:SetStartHeight
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetStartHeight)
---@return number #
function DCollapsibleCategory:GetStartHeight() end

---[CLIENT AND MENU] Sets the time in seconds it takes to expand the DCollapsibleCategory
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetAnimTime)
---@param time number The time in seconds it takes to expand
function DCollapsibleCategory:SetAnimTime(time) end

---[CLIENT AND MENU] Sets the contents of the DCollapsibleCategory.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetContents)
---@param pnl Panel The panel, containing the contents for the DCollapsibleCategory, mostly an DScrollPanel
function DCollapsibleCategory:SetContents(pnl) end

---[CLIENT AND MENU] Sets whether or not to draw the panel background. Alias of DCollapsibleCategory:SetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetDrawBackground)
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DCollapsibleCategory:SetPaintBackground instead.
function DCollapsibleCategory:SetDrawBackground(draw) end

---[CLIENT AND MENU] Sets whether the DCollapsibleCategory is expanded or not upon opening the container.
---
--- You should use DCollapsibleCategory:Toggle or DCollapsibleCategory:DoExpansion instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetExpanded)
---@param expanded? boolean Whether it shall be expanded or not by default
function DCollapsibleCategory:SetExpanded(expanded) end

---[CLIENT AND MENU] Sets the header height of the DCollapsibleCategory.
---
--- See also DCollapsibleCategory:GetHeaderHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetHeaderHeight)
---@param height number The new height to set. Default height is 20.
function DCollapsibleCategory:SetHeaderHeight(height) end

---[CLIENT AND MENU] Sets the name of the DCollapsibleCategory.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetLabel)
---@param label string The label/name of the DCollapsibleCategory.
function DCollapsibleCategory:SetLabel(label) end

---[CLIENT AND MENU] Used internally by DCategoryList when it creates a DCollapsibleCategory during DCategoryList:Add.
---
--- If set, Panel:UnselectAll will be called on the list, instead of calling it on the category panel itself when a category is clicked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetList)
---@param pnl Panel The Panel:UnselectAll that is the "parent" of this panel.
function DCollapsibleCategory:SetList(pnl) end

---[CLIENT AND MENU] Doesn't actually do anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPadding)
---@param padding number
function DCollapsibleCategory:SetPadding(padding) end

---[CLIENT AND MENU] Sets whether or not the background should be painted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPaintBackground)
---@param paint boolean
function DCollapsibleCategory:SetPaintBackground(paint) end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetStartHeight)
---@param height number
function DCollapsibleCategory:SetStartHeight(height) end

---[CLIENT AND MENU] Toggles the expanded state of the DCollapsibleCategory.
---
--- See DCollapsibleCategory:GetExpanded for a function to retrieve the expanded state.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Toggle)
function DCollapsibleCategory:Toggle() end

---[CLIENT AND MENU] Used internally to update the "AltLine" property on all "child" panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:UpdateAltLines)
function DCollapsibleCategory:UpdateAltLines() end
