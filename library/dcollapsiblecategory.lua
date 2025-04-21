---@meta

--- The collapsible category allows you to create numerous sections of controls, and have the ability to contract/expand them.
---
--- Consider using [DCategoryList](https://wiki.facepunch.com/gmod/DCategoryList) if you plan on using more than 1 of these.
---@class DCollapsibleCategory : Panel
local DCollapsibleCategory = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a new text button to the collapsible category, like the tool menu in Spawnmenu.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Add)
---@param name string The name of the button
---@return Panel # The DButton
function DCollapsibleCategory:Add(name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal function that handles the open/close animations.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:AnimSlide)
---@param anim table
---@param delta number
---@param data table
function DCollapsibleCategory:AnimSlide(anim, delta, data) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Forces the category to open or collapse
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:DoExpansion)
---@param expand boolean True to open, false to collapse
function DCollapsibleCategory:DoExpansion(expand) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the expand/collapse animation time set by [DCollapsibleCategory:SetAnimTime](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetAnimTime).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetAnimTime)
---@return number # The animation time in seconds
function DCollapsibleCategory:GetAnimTime() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the panel background is being drawn. Alias of [DCollapsibleCategory:GetPaintBackground](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPaintBackground).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetDrawBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DCollapsibleCategory:GetPaintBackground instead.
function DCollapsibleCategory:GetDrawBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the DCollapsibleCategory is expanded or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetExpanded)
---@return boolean # If expanded it will return true.
function DCollapsibleCategory:GetExpanded() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the header height of the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory).
---
--- See also [DCollapsibleCategory:SetHeaderHeight](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetHeaderHeight).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetHeaderHeight)
---@return number # The current height of the header.
function DCollapsibleCategory:GetHeaderHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) If set, the [DCategoryList](https://wiki.facepunch.com/gmod/DCategoryList) that created this panel.
---
--- See also [DCollapsibleCategory:SetList](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetList).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetList)
---@return Panel # The DCategoryList that created us.
function DCollapsibleCategory:GetList() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Doesn't actually do anything.
---
--- Returns the number set by [DCollapsibleCategory:SetPadding](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPadding).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPadding)
---@return number #
function DCollapsibleCategory:GetPadding() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns whether or not the background should be painted.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetPaintBackground)
---@return boolean # If the background is painted or not
function DCollapsibleCategory:GetPaintBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whatever was set by [DCollapsibleCategory:SetStartHeight](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetStartHeight)
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetStartHeight)
---@return number #
function DCollapsibleCategory:GetStartHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the time in seconds it takes to expand the DCollapsibleCategory
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetAnimTime)
---@param time number The time in seconds it takes to expand
function DCollapsibleCategory:SetAnimTime(time) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the contents of the DCollapsibleCategory.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetContents)
---@param pnl Panel The panel, containing the contents for the DCollapsibleCategory, mostly an DScrollPanel
function DCollapsibleCategory:SetContents(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not to draw the panel background. Alias of [DCollapsibleCategory:SetPaintBackground](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPaintBackground).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetDrawBackground)
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DCollapsibleCategory:SetPaintBackground instead.
function DCollapsibleCategory:SetDrawBackground(draw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) is expanded or not upon opening the container.
---
--- You should use [DCollapsibleCategory:Toggle](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Toggle) or [DCollapsibleCategory:DoExpansion](https://wiki.facepunch.com/gmod/DCollapsibleCategory:DoExpansion) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetExpanded)
---@param expanded? boolean Whether it shall be expanded or not by default
function DCollapsibleCategory:SetExpanded(expanded) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the header height of the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory).
---
--- See also [DCollapsibleCategory:GetHeaderHeight](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetHeaderHeight).
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetHeaderHeight)
---@param height number The new height to set. Default height is 20.
function DCollapsibleCategory:SetHeaderHeight(height) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the name of the DCollapsibleCategory.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetLabel)
---@param label string The label/name of the DCollapsibleCategory.
function DCollapsibleCategory:SetLabel(label) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used internally by [DCategoryList](https://wiki.facepunch.com/gmod/DCategoryList) when it creates a [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory) during [DCategoryList:Add](https://wiki.facepunch.com/gmod/DCategoryList:Add).
---
--- If set, [Panel:UnselectAll](https://wiki.facepunch.com/gmod/Panel:UnselectAll) will be called on the list, instead of calling it on the category panel itself when a category is clicked.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetList)
---@param pnl Panel The Panel:UnselectAll that is the "parent" of this panel.
function DCollapsibleCategory:SetList(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Doesn't actually do anything.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPadding)
---@param padding number
function DCollapsibleCategory:SetPadding(padding) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the background should be painted.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetPaintBackground)
---@param paint boolean
function DCollapsibleCategory:SetPaintBackground(paint) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:SetStartHeight)
---@param height number
function DCollapsibleCategory:SetStartHeight(height) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Toggles the expanded state of the [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory).
---
--- See [DCollapsibleCategory:GetExpanded](https://wiki.facepunch.com/gmod/DCollapsibleCategory:GetExpanded) for a function to retrieve the expanded state.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:Toggle)
function DCollapsibleCategory:Toggle() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to update the "AltLine" property on all "child" panels.
---
---[View wiki](https://wiki.facepunch.com/gmod/DCollapsibleCategory:UpdateAltLines)
function DCollapsibleCategory:UpdateAltLines() end
