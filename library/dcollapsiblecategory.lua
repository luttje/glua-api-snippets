---@meta

---@class DCollapsibleCategory : Panel
local DCollapsibleCategory = {}

---[CLIENT] Adds a new text button to the collapsible category, like the tool menu in Spawnmenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Add)
---@param name string The name of the button
---@return Panel #The DButton
function DCollapsibleCategory:Add(name) end

---[CLIENT] Internal function that handles the open/close animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:AnimSlide)
---@param anim table
---@param delta number
---@param data table
function DCollapsibleCategory:AnimSlide(anim, delta, data) end

---[CLIENT] Forces the category to open or collapse
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:DoExpansion)
---@param expand boolean True to open, false to collapse
function DCollapsibleCategory:DoExpansion(expand) end

---[CLIENT] Returns the expand/collapse animation time set by DCollapsibleCategory:SetAnimTime.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetAnimTime)
---@return number #The animation time in seconds
function DCollapsibleCategory:GetAnimTime() end

---[CLIENT] Returns whether the DCollapsibleCategory is expanded or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetExpanded)
---@return boolean #If expanded it will return true.
function DCollapsibleCategory:GetExpanded() end

---[CLIENT] Returns the header height of the DCollapsibleCategory.
---
--- See also DCollapsibleCategory:SetHeaderHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetHeaderHeight)
---@return number #The current height of the header.
function DCollapsibleCategory:GetHeaderHeight() end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetList)
---@return Panel #
function DCollapsibleCategory:GetList() end

---[CLIENT] Doesn't actually do anything.
---
--- Returns the number set by DCollapsibleCategory:SetPadding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPadding)
---@return number #
function DCollapsibleCategory:GetPadding() end

---[CLIENT] Returns whether or not the background should be painted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPaintBackground)
---@return boolean #If the background is painted or not
function DCollapsibleCategory:GetPaintBackground() end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetStartHeight)
---@return number #
function DCollapsibleCategory:GetStartHeight() end

---[CLIENT] Called by DCollapsibleCategory:Toggle. This function does nothing by itself, as you're supposed to overwrite it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:OnToggle)
---@param expanded boolean If it was expanded or not
function DCollapsibleCategory:OnToggle(expanded) end

---[CLIENT] Sets the time in seconds it takes to expand the DCollapsibleCategory
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetAnimTime)
---@param time number The time in seconds it takes to expand
function DCollapsibleCategory:SetAnimTime(time) end

---[CLIENT] Sets the contents of the DCollapsibleCategory.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetContents)
---@param pnl Panel The panel, containing the contents for the DCollapsibleCategory, mostly an DScrollPanel
function DCollapsibleCategory:SetContents(pnl) end

---[CLIENT] Sets whether the DCollapsibleCategory is expanded or not upon opening the container.
---
--- You should use DCollapsibleCategory:Toggle or DCollapsibleCategory:DoExpansion instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetExpanded)
---@param expanded? boolean Whether it shall be expanded or not by default
function DCollapsibleCategory:SetExpanded(expanded) end

---[CLIENT] Sets the header height of the DCollapsibleCategory.
---
--- See also DCollapsibleCategory:GetHeaderHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetHeaderHeight)
---@param height number The new height to set. Default height is 20.
function DCollapsibleCategory:SetHeaderHeight(height) end

---[CLIENT] Sets the name of the DCollapsibleCategory.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetLabel)
---@param label string The label/name of the DCollapsibleCategory.
function DCollapsibleCategory:SetLabel(label) end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetList)
---@param pnl Panel
function DCollapsibleCategory:SetList(pnl) end

---[CLIENT] Doesn't actually do anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPadding)
---@param padding number
function DCollapsibleCategory:SetPadding(padding) end

---[CLIENT] Sets whether or not the background should be painted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPaintBackground)
---@param paint boolean
function DCollapsibleCategory:SetPaintBackground(paint) end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetStartHeight)
---@param height number
function DCollapsibleCategory:SetStartHeight(height) end

---[CLIENT] Toggles the expanded state of the DCollapsibleCategory.
---
--- See DCollapsibleCategory:GetExpanded for a function to retrieve the expanded state.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Toggle)
function DCollapsibleCategory:Toggle() end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:UnselectAll)
function DCollapsibleCategory:UnselectAll() end

---[CLIENT] Used internally to update the "AltLine" property on all "child" panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DCollapsibleCategory:UpdateAltLines)
function DCollapsibleCategory:UpdateAltLines() end
