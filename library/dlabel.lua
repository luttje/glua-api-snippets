---@meta

---@class DLabel : Label
local DLabel = {}

---[CLIENT] Called just before DLabel:DoClick.
---
--- In DLabel does nothing and is safe to override. Used by DMenuOption and DCollapsibleCategory's tabs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:DoClickInternal)
function DLabel:DoClickInternal() end

---[CLIENT] Called just before DLabel:DoDoubleClick. In DLabel does nothing and is safe to override.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:DoDoubleClickInternal)
function DLabel:DoDoubleClickInternal() end

---[CLIENT] Returns whether the label stretches vertically or not.
---
--- Set by DLabel:SetAutoStretchVertical.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetAutoStretchVertical)
---@return boolean #Whether the label stretches vertically or not.
function DLabel:GetAutoStretchVertical() end

---[CLIENT] Returns whether the DLabel should set its text color to the current skin's bright text color.
---
--- See DLabel:SetBright.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetBright)
---@return boolean #
function DLabel:GetBright() end

---[CLIENT] Returns the actual color of the text.
---
--- See also DLabel:GetTextColor and DLabel:GetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetColor)
---@return table #The the actual color of the text.
function DLabel:GetColor() end

---[CLIENT] Returns whether the DLabel should set its text color to the current skin's dark text color.
---
--- See DLabel:SetDark.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetDark)
---@return boolean #
function DLabel:GetDark() end

---[CLIENT] Use Panel:IsEnabled instead.
---
--- Gets the disabled state of the DLabel. This is set with DLabel:SetDisabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetDisabled)
---@return boolean #The disabled state of the label.
function DLabel:GetDisabled() end

---[CLIENT] Returns whether or not double clicking will call DLabel:DoDoubleClick.
---
--- See DLabel:SetDoubleClickingEnabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetDoubleClickingEnabled)
---@return boolean #true = enabled, false means disabled
function DLabel:GetDoubleClickingEnabled() end

---[CLIENT] Returns the current font of the DLabel. This is set with DLabel:SetFont.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetFont)
---@return string #The name of the font in use.
function DLabel:GetFont() end

---[CLIENT] Returns whether the DLabel should set its text color to the current skin's highlighted text color.
---
--- See DLabel:SetHighlight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetHighlight)
---@return boolean #
function DLabel:GetHighlight() end

---[CLIENT] Returns whether the toggle functionality is enabled for a label. Set with DLabel:SetIsToggle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetIsToggle)
---@return boolean #Whether or not toggle functionality is enabled.
function DLabel:GetIsToggle() end

---[CLIENT] Returns the "override" text color, set by DLabel:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetTextColor)
---@return table #The color of the text, or nil.
function DLabel:GetTextColor() end

---[CLIENT] Returns the "internal" or fallback color of the text.
---
--- See also DLabel:GetTextColor and DLabel:SetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetTextStyleColor)
---@return table #The "internal" color of the text
function DLabel:GetTextStyleColor() end

---[CLIENT] Returns the current toggle state of the label. This can be set with DLabel:SetToggle and toggled with DLabel:Toggle.
---
--- In order to use toggle functionality, you must first call DLabel:SetIsToggle with `true`, as it is disabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:GetToggle)
---@return boolean #The current toggle state.
function DLabel:GetToggle() end

---[CLIENT] Automatically adjusts the height of the label dependent of the height of the text inside of it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetAutoStretchVertical)
---@param stretch boolean Whenever to stretch the label vertically or not.
function DLabel:SetAutoStretchVertical(stretch) end

---[CLIENT] You really should use DLabel:SetTextColor.
---
--- Sets the color of the text to the bright text color defined in the skin.
---
--- See also DLabel:SetDark and DLabel:SetHighlight.
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetBright)
---@param bright boolean Whenever to set the text to bright or not.
function DLabel:SetBright(bright) end

---[CLIENT] Changes color of label. Alias of DLabel:SetTextColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetColor)
---@param color table The color to set. Uses the Color structure.
function DLabel:SetColor(color) end

---[CLIENT] You really should use DLabel:SetTextColor.
---
--- Sets the color of the text to the dark text color defined in the skin.
---
--- See also DLabel:SetBright and DLabel:SetHighlight.
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetDark)
---@param dark boolean Whenever to set the text to dark or not.
function DLabel:SetDark(dark) end

---[CLIENT] Use Panel:SetEnabled instead.
---
--- Sets the disabled state of the DLabel.
---
--- When disabled, the label does not respond to click, toggle or drag & drop actions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetDisabled)
---@param disable boolean `true` to disable the DLabel, `false` to enable it.
function DLabel:SetDisabled(disable) end

---[CLIENT] Sets whether or not double clicking should call DLabel:DoDoubleClick.
---
--- This is enabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetDoubleClickingEnabled)
---@param enable boolean true to enable, false to disable
function DLabel:SetDoubleClickingEnabled(enable) end

---[CLIENT] Sets the font of the label.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetFont)
---@param fontName string The name of the font.
---
--- See Default_Fonts for a list of existing fonts.
--- Alternatively, use surface.CreateFont to create your own custom font.
function DLabel:SetFont(fontName) end

---[CLIENT] You really should use DLabel:SetTextColor.
---
--- Sets the color of the text to the highlight text color defined in the skin.
---
--- For the default Derma skin this makes the label red.
---
--- See also DLabel:SetBright and DLabel:SetDark.
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetHighlight)
---@param highlight boolean true to set the label's color to skins's text highlight color, false otherwise.
function DLabel:SetHighlight(highlight) end

---[CLIENT] Enables or disables toggle functionality for a label. Retrieved with DLabel:GetIsToggle.
---
--- You must call this before using DLabel:SetToggle, DLabel:GetToggle or DLabel:Toggle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetIsToggle)
---@param allowToggle boolean Whether or not to enable toggle functionality.
function DLabel:SetIsToggle(allowToggle) end

---[CLIENT] Sets the text color of the DLabel. This will take precedence over DLabel:SetTextStyleColor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetTextColor)
---@param color table The text color. Uses the Color.
function DLabel:SetTextColor(color) end

---[CLIENT] Use DLabel:SetTextColor instead!
---
---
--- Used by DLabel:SetDark, DLabel:SetBright and DLabel:SetHighlight to set the text color without affecting DLabel:SetTextColor calls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetTextStyleColor)
---@param color table The text color. Uses the Color.
function DLabel:SetTextStyleColor(color) end

---[CLIENT] Sets the toggle state of the label. This can be retrieved with DLabel:GetToggle and toggled with DLabel:Toggle.
---
--- In order to use toggle functionality, you must first call DLabel:SetIsToggle with `true`, as it is disabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:SetToggle)
---@param toggleState boolean The toggle state to be set.
function DLabel:SetToggle(toggleState) end

---[CLIENT] Toggles the label's state. This can be set and retrieved with DLabel:SetToggle and DLabel:GetToggle.
---
--- In order to use toggle functionality, you must first call DLabel:SetIsToggle with `true`, as it is disabled by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:Toggle)
function DLabel:Toggle() end

---[CLIENT] A hook called from within PANEL:ApplySchemeSettings to determine the color of the text on display.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:UpdateColours)
---@param skin table A table supposed to contain the color values listed above.
function DLabel:UpdateColours(skin) end

---[CLIENT] Called internally to update the color of the text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DLabel:UpdateFGColor)
function DLabel:UpdateFGColor() end
