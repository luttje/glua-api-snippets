---@meta

---
--- 		A standard Derma text label. A lot of this panels functionality is a base for button elements, such as DButton
---
--- Does not support multiline text.
--- 	Creates a DLabel.
---@class DLabel : Label
local DLabel = {}

---[CLIENT AND MENU] Called just before DLabel:DoClick.
---
--- In DLabel does nothing and is safe to override. Used by DMenuOption and DCollapsibleCategory's tabs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:DoClickInternal)
function DLabel:DoClickInternal() end

---[CLIENT AND MENU] Called just before DLabel:DoDoubleClick. In DLabel does nothing and is safe to override.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:DoDoubleClickInternal)
function DLabel:DoDoubleClickInternal() end

---[CLIENT AND MENU] Returns whether the label stretches vertically or not.
---
--- Set by DLabel:SetAutoStretchVertical.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetAutoStretchVertical)
---@return boolean # Whether the label stretches vertically or not.
function DLabel:GetAutoStretchVertical() end

---[CLIENT AND MENU] Returns whether the DLabel should set its text color to the current skin's bright text color.
---
--- See DLabel:SetBright.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetBright)
---@return boolean #
function DLabel:GetBright() end

---[CLIENT AND MENU] Returns the actual color of the text.
---
--- See also DLabel:GetTextColor and DLabel:GetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetColor)
---@return table # The the actual color of the text.
function DLabel:GetColor() end

---[CLIENT AND MENU] Returns whether the DLabel should set its text color to the current skin's dark text color.
---
--- See DLabel:SetDark.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetDark)
---@return boolean #
function DLabel:GetDark() end

---[CLIENT AND MENU] Gets the disabled state of the DLabel. This is set with DLabel:SetDisabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetDisabled)
---@return boolean # The disabled state of the label.
---@deprecated Use Panel:IsEnabled instead.
function DLabel:GetDisabled() end

---[CLIENT AND MENU] Returns whether or not double clicking will call DLabel:DoDoubleClick.
---
--- See DLabel:SetDoubleClickingEnabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetDoubleClickingEnabled)
---@return boolean # true = enabled, false means disabled
function DLabel:GetDoubleClickingEnabled() end

---[CLIENT AND MENU] Returns whether or not the panel background is being drawn. Alias of DLabel:GetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetDrawBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DLabel:GetPaintBackground instead.
function DLabel:GetDrawBackground() end

---[CLIENT AND MENU] Returns the current font of the DLabel. This is set with DLabel:SetFont.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetFont)
---@return string # The name of the font in use.
function DLabel:GetFont() end

---[CLIENT AND MENU] Returns whether the DLabel should set its text color to the current skin's highlighted text color.
---
--- See DLabel:SetHighlight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetHighlight)
---@return boolean #
function DLabel:GetHighlight() end

---[CLIENT AND MENU] Used internally by DComboBox.
---
--- Returns whether the frame is part of a derma menu or not.
---
--- If this is `true`, Global.CloseDermaMenus will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetIsMenu)
---@return boolean # Whether this panel is a Menu Component
function DLabel:GetIsMenu() end

---[CLIENT AND MENU] Returns whether the toggle functionality is enabled for a label. Set with DLabel:SetIsToggle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetIsToggle)
---@return boolean # Whether or not toggle functionality is enabled.
function DLabel:GetIsToggle() end

---[CLIENT AND MENU] Returns whether or not the background should be painted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetPaintBackground)
---@return boolean # If the background is painted or not
function DLabel:GetPaintBackground() end

---[CLIENT AND MENU] Returns the "override" text color, set by DLabel:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetTextColor)
---@return table # The color of the text, or nil.
function DLabel:GetTextColor() end

---[CLIENT AND MENU] Returns the "internal" or fallback color of the text.
---
--- See also DLabel:GetTextColor and DLabel:SetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetTextStyleColor)
---@return table # The "internal" color of the text
function DLabel:GetTextStyleColor() end

---[CLIENT AND MENU] Returns the current toggle state of the label. This can be set with DLabel:SetToggle and toggled with DLabel:Toggle.
---
--- In order to use toggle functionality, you must first call DLabel:SetIsToggle with `true`, as it is disabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetToggle)
---@return boolean # The current toggle state.
function DLabel:GetToggle() end

---[CLIENT AND MENU] Automatically adjusts the height of the label dependent of the height of the text inside of it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetAutoStretchVertical)
---@param stretch boolean Whenever to stretch the label vertically or not.
function DLabel:SetAutoStretchVertical(stretch) end

---[CLIENT AND MENU] Sets the color of the text to the bright text color defined in the skin.
---
--- See also DLabel:SetDark and DLabel:SetHighlight.
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetBright)
---@param bright boolean Whenever to set the text to bright or not.
---@deprecated You really should use DLabel:SetTextColor.
function DLabel:SetBright(bright) end

---[CLIENT AND MENU] Changes color of label. Alias of DLabel:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetColor)
---@param color table The color to set. Uses the Color structure.
function DLabel:SetColor(color) end

---[CLIENT AND MENU] Sets the color of the text to the dark text color defined in the skin.
---
--- See also DLabel:SetBright and DLabel:SetHighlight.
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetDark)
---@param dark boolean Whenever to set the text to dark or not.
---@deprecated You really should use DLabel:SetTextColor.
function DLabel:SetDark(dark) end

---[CLIENT AND MENU] Sets the disabled state of the DLabel.
---
--- When disabled, the label does not respond to click, toggle or drag & drop actions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetDisabled)
---@param disable boolean `true` to disable the DLabel, `false` to enable it.
---@deprecated Use Panel:SetEnabled instead.
function DLabel:SetDisabled(disable) end

---[CLIENT AND MENU] Sets whether or not double clicking should call DLabel:DoDoubleClick.
---
--- This is enabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetDoubleClickingEnabled)
---@param enable boolean true to enable, false to disable
function DLabel:SetDoubleClickingEnabled(enable) end

---[CLIENT AND MENU] Sets whether or not to draw the panel background. Alias of DLabel:SetPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetDrawBackground)
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DLabel:SetPaintBackground instead.
function DLabel:SetDrawBackground(draw) end

---[CLIENT AND MENU] Sets the font of the label.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetFont)
---@param fontName string The name of the font.
---
--- See Default_Fonts for a list of existing fonts.
--- Alternatively, use surface.CreateFont to create your own custom font.
function DLabel:SetFont(fontName) end

---[CLIENT AND MENU] Sets the color of the text to the highlight text color defined in the skin.
---
--- For the default Derma skin this makes the label red.
---
--- See also DLabel:SetBright and DLabel:SetDark.
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetHighlight)
---@param highlight boolean true to set the label's color to skins's text highlight color, false otherwise.
---@deprecated You really should use DLabel:SetTextColor.
function DLabel:SetHighlight(highlight) end

---[CLIENT AND MENU] Used internally by DComboBox.
---
---
--- Sets whether the frame is part of a derma menu or not.
---
--- If this is set to `true`, Global.CloseDermaMenus will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetIsMenu)
---@param isMenu boolean Whether this pane is a Menu Component
function DLabel:SetIsMenu(isMenu) end

---[CLIENT AND MENU] Enables or disables toggle functionality for a label. Retrieved with DLabel:GetIsToggle.
---
--- You must call this before using DLabel:SetToggle, DLabel:GetToggle or DLabel:Toggle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetIsToggle)
---@param allowToggle boolean Whether or not to enable toggle functionality.
function DLabel:SetIsToggle(allowToggle) end

---[CLIENT AND MENU] Sets whether or not the background should be painted. This is mainly used by derivative classes, such as DButton.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetPaintBackground)
---@param paint boolean
function DLabel:SetPaintBackground(paint) end

---[CLIENT AND MENU] Sets the text color of the DLabel. This will take precedence over DLabel:SetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetTextColor)
---@param color table The text color. Uses the Color.
function DLabel:SetTextColor(color) end

---[CLIENT AND MENU] Use DLabel:SetTextColor instead!
---
---
--- Used by DLabel:SetDark, DLabel:SetBright and DLabel:SetHighlight to set the text color without affecting DLabel:SetTextColor calls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetTextStyleColor)
---@param color table The text color. Uses the Color.
function DLabel:SetTextStyleColor(color) end

---[CLIENT AND MENU] Sets the toggle state of the label. This can be retrieved with DLabel:GetToggle and toggled with DLabel:Toggle.
---
--- In order to use toggle functionality, you must first call DLabel:SetIsToggle with `true`, as it is disabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetToggle)
---@param toggleState boolean The toggle state to be set.
function DLabel:SetToggle(toggleState) end

---[CLIENT AND MENU] Toggles the label's state. This can be set and retrieved with DLabel:SetToggle and DLabel:GetToggle.
---
--- In order to use toggle functionality, you must first call DLabel:SetIsToggle with `true`, as it is disabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:Toggle)
function DLabel:Toggle() end

---[CLIENT AND MENU] A hook called from within PANEL:ApplySchemeSettings to determine the color of the text on display.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:UpdateColours)
---@param skin table A table supposed to contain the color values listed above.
function DLabel:UpdateColours(skin) end

---[CLIENT AND MENU] Called internally to update the color of the text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:UpdateFGColor)
function DLabel:UpdateFGColor() end
