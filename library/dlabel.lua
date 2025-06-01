---@meta

--- A standard Derma text label. A lot of this panels functionality is a base for button elements, such as [DButton](https://wiki.facepunch.com/gmod/DButton)
---@class DLabel : Label
local DLabel = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called just before [DLabel:DoClick](https://wiki.facepunch.com/gmod/DLabel:DoClick).
---
--- In [DLabel](https://wiki.facepunch.com/gmod/DLabel) does nothing and is safe to override. Used by [DMenuOption](https://wiki.facepunch.com/gmod/DMenuOption) and [DCollapsibleCategory](https://wiki.facepunch.com/gmod/DCollapsibleCategory)'s tabs.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:DoClickInternal)
function DLabel:DoClickInternal() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called just before [DLabel:DoDoubleClick](https://wiki.facepunch.com/gmod/DLabel:DoDoubleClick). In [DLabel](https://wiki.facepunch.com/gmod/DLabel) does nothing and is safe to override.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:DoDoubleClickInternal)
function DLabel:DoDoubleClickInternal() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the label stretches vertically or not.
---
--- Set by [DLabel:SetAutoStretchVertical](https://wiki.facepunch.com/gmod/DLabel:SetAutoStretchVertical).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetAutoStretchVertical)
---@return boolean # Whether the label stretches vertically or not.
function DLabel:GetAutoStretchVertical() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DLabel](https://wiki.facepunch.com/gmod/DLabel) should set its text color to the current skin's bright text color.
---
--- See [DLabel:SetBright](https://wiki.facepunch.com/gmod/DLabel:SetBright).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetBright)
---@return boolean #
function DLabel:GetBright() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the actual color of the text.
---
--- See also [DLabel:GetTextColor](https://wiki.facepunch.com/gmod/DLabel:GetTextColor) and [DLabel:GetTextStyleColor](https://wiki.facepunch.com/gmod/DLabel:GetTextStyleColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetColor)
---@return table # The the actual color of the text.
function DLabel:GetColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DLabel](https://wiki.facepunch.com/gmod/DLabel) should set its text color to the current skin's dark text color.
---
--- See [DLabel:SetDark](https://wiki.facepunch.com/gmod/DLabel:SetDark).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetDark)
---@return boolean #
function DLabel:GetDark() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the disabled state of the [DLabel](https://wiki.facepunch.com/gmod/DLabel). This is set with [DLabel:SetDisabled](https://wiki.facepunch.com/gmod/DLabel:SetDisabled).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetDisabled)
---@return boolean # The disabled state of the label.
---@deprecated Use Panel:IsEnabled instead.
function DLabel:GetDisabled() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not double clicking will call [DLabel:DoDoubleClick](https://wiki.facepunch.com/gmod/DLabel:DoDoubleClick).
---
--- See [DLabel:SetDoubleClickingEnabled](https://wiki.facepunch.com/gmod/DLabel:SetDoubleClickingEnabled).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetDoubleClickingEnabled)
---@return boolean # true = enabled, false means disabled
function DLabel:GetDoubleClickingEnabled() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the panel background is being drawn. Alias of [DLabel:GetPaintBackground](https://wiki.facepunch.com/gmod/DLabel:GetPaintBackground).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetDrawBackground)
---@return boolean # True if the panel background is drawn, false otherwise.
---@deprecated You should use DLabel:GetPaintBackground instead.
function DLabel:GetDrawBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the current font of the DLabel. This is set with [DLabel:SetFont](https://wiki.facepunch.com/gmod/DLabel:SetFont).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetFont)
---@return string # The name of the font in use.
function DLabel:GetFont() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DLabel](https://wiki.facepunch.com/gmod/DLabel) should set its text color to the current skin's highlighted text color.
---
--- See [DLabel:SetHighlight](https://wiki.facepunch.com/gmod/DLabel:SetHighlight).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetHighlight)
---@return boolean #
function DLabel:GetHighlight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used internally by [DComboBox](https://wiki.facepunch.com/gmod/DComboBox).
---
--- Returns whether the frame is part of a derma menu or not.
---
--- If this is `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetIsMenu)
---@return boolean # Whether this panel is a Menu Component
function DLabel:GetIsMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the toggle functionality is enabled for a label. Set with [DLabel:SetIsToggle](https://wiki.facepunch.com/gmod/DLabel:SetIsToggle).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetIsToggle)
---@return boolean # Whether or not toggle functionality is enabled.
function DLabel:GetIsToggle() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the background should be painted.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetPaintBackground)
---@return boolean # If the background is painted or not
function DLabel:GetPaintBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the "override" text color, set by [DLabel:SetTextColor](https://wiki.facepunch.com/gmod/DLabel:SetTextColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetTextColor)
---@return table # The color of the text, or nil.
function DLabel:GetTextColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the "internal" or fallback color of the text.
---
--- See also [DLabel:GetTextColor](https://wiki.facepunch.com/gmod/DLabel:GetTextColor) and [DLabel:SetTextStyleColor](https://wiki.facepunch.com/gmod/DLabel:SetTextStyleColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetTextStyleColor)
---@return table # The "internal" color of the text
function DLabel:GetTextStyleColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the current toggle state of the label. This can be set with [DLabel:SetToggle](https://wiki.facepunch.com/gmod/DLabel:SetToggle) and toggled with [DLabel:Toggle](https://wiki.facepunch.com/gmod/DLabel:Toggle).
---
--- In order to use toggle functionality, you must first call [DLabel:SetIsToggle](https://wiki.facepunch.com/gmod/DLabel:SetIsToggle) with `true`, as it is disabled by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:GetToggle)
---@return boolean # The current toggle state.
function DLabel:GetToggle() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Automatically adjusts the height of the label dependent of the height of the text inside of it.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetAutoStretchVertical)
---@param stretch boolean Whenever to stretch the label vertically or not.
function DLabel:SetAutoStretchVertical(stretch) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color of the text to the bright text color defined in the skin.
---
--- Disables [DLabel:SetDark](https://wiki.facepunch.com/gmod/DLabel:SetDark). Gets overridden by [DLabel:SetHighlight](https://wiki.facepunch.com/gmod/DLabel:SetHighlight).
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors. Otherwise use [DLabel:SetTextColor](https://wiki.facepunch.com/gmod/DLabel:SetTextColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetBright)
---@param bright boolean Whenever to set the text to bright or not.
function DLabel:SetBright(bright) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Changes color of label. Alias of [DLabel:SetTextColor](https://wiki.facepunch.com/gmod/DLabel:SetTextColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetColor)
---@param color table The color to set. Uses the Color structure.
function DLabel:SetColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color of the text to the dark text color defined in the skin.
---
--- Disables [DLabel:SetBright](https://wiki.facepunch.com/gmod/DLabel:SetBright). Gets overridden by [DLabel:SetHighlight](https://wiki.facepunch.com/gmod/DLabel:SetHighlight).
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors. Otherwise use [DLabel:SetTextColor](https://wiki.facepunch.com/gmod/DLabel:SetTextColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetDark)
---@param dark boolean Whenever to set the text to dark or not.
function DLabel:SetDark(dark) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the disabled state of the [DLabel](https://wiki.facepunch.com/gmod/DLabel).
---
--- When disabled, the label does not respond to click, toggle or drag & drop actions.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetDisabled)
---@param disable boolean `true` to disable the DLabel, `false` to enable it.
---@deprecated Use Panel:SetEnabled instead.
function DLabel:SetDisabled(disable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not double clicking should call [DLabel:DoDoubleClick](https://wiki.facepunch.com/gmod/DLabel:DoDoubleClick).
---
--- This is enabled by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetDoubleClickingEnabled)
---@param enable boolean true to enable, false to disable
function DLabel:SetDoubleClickingEnabled(enable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not to draw the panel background. Alias of [DLabel:SetPaintBackground](https://wiki.facepunch.com/gmod/DLabel:SetPaintBackground).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetDrawBackground)
---@param draw boolean True to show the panel's background, false to hide it.
---@deprecated You should use DLabel:SetPaintBackground instead.
function DLabel:SetDrawBackground(draw) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the font of the label.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetFont)
---@param fontName string The name of the font.
---
--- See Default_Fonts for a list of existing fonts.
--- Alternatively, use surface.CreateFont to create your own custom font.
function DLabel:SetFont(fontName) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color of the text to the highlight text color defined in the skin.
---
--- For the default Derma skin this makes the label red.
---
--- Overrides colors set by both [DLabel:SetBright](https://wiki.facepunch.com/gmod/DLabel:SetBright) and [DLabel:SetDark](https://wiki.facepunch.com/gmod/DLabel:SetDark) while active.
---
--- You should only consider using this if you are using background elements that are not manually painted and are using the skin colors. Otherwise use [DLabel:SetTextColor](https://wiki.facepunch.com/gmod/DLabel:SetTextColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetHighlight)
---@param highlight boolean true to set the label's color to skins's text highlight color, false otherwise.
function DLabel:SetHighlight(highlight) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used internally by [DComboBox](https://wiki.facepunch.com/gmod/DComboBox).
---
--- Sets whether the frame is part of a derma menu or not.
---
--- If this is set to `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetIsMenu)
---@param isMenu boolean Whether this pane is a Menu Component
function DLabel:SetIsMenu(isMenu) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Enables or disables toggle functionality for a label. Retrieved with [DLabel:GetIsToggle](https://wiki.facepunch.com/gmod/DLabel:GetIsToggle).
---
--- You must call this before using [DLabel:SetToggle](https://wiki.facepunch.com/gmod/DLabel:SetToggle), [DLabel:GetToggle](https://wiki.facepunch.com/gmod/DLabel:GetToggle) or [DLabel:Toggle](https://wiki.facepunch.com/gmod/DLabel:Toggle).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetIsToggle)
---@param allowToggle boolean Whether or not to enable toggle functionality.
function DLabel:SetIsToggle(allowToggle) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the background should be painted. This is mainly used by derivative classes, such as [DButton](https://wiki.facepunch.com/gmod/DButton).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetPaintBackground)
---@param paint boolean
function DLabel:SetPaintBackground(paint) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the text color of the [DLabel](https://wiki.facepunch.com/gmod/DLabel). This will take precedence over [DLabel:SetTextStyleColor](https://wiki.facepunch.com/gmod/DLabel:SetTextStyleColor).
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetTextColor)
---@param color table The text color. Uses the Color.
function DLabel:SetTextColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: Use [DLabel:SetTextColor](https://wiki.facepunch.com/gmod/DLabel:SetTextColor) instead!
---
--- Used by [DLabel:SetDark](https://wiki.facepunch.com/gmod/DLabel:SetDark), [DLabel:SetBright](https://wiki.facepunch.com/gmod/DLabel:SetBright) and [DLabel:SetHighlight](https://wiki.facepunch.com/gmod/DLabel:SetHighlight) to set the text color without affecting [DLabel:SetTextColor](https://wiki.facepunch.com/gmod/DLabel:SetTextColor) calls.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetTextStyleColor)
---@param color table The text color. Uses the Color.
function DLabel:SetTextStyleColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the toggle state of the label. This can be retrieved with [DLabel:GetToggle](https://wiki.facepunch.com/gmod/DLabel:GetToggle) and toggled with [DLabel:Toggle](https://wiki.facepunch.com/gmod/DLabel:Toggle).
---
--- In order to use toggle functionality, you must first call [DLabel:SetIsToggle](https://wiki.facepunch.com/gmod/DLabel:SetIsToggle) with `true`, as it is disabled by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:SetToggle)
---@param toggleState boolean The toggle state to be set.
function DLabel:SetToggle(toggleState) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Toggles the label's state. This can be set and retrieved with [DLabel:SetToggle](https://wiki.facepunch.com/gmod/DLabel:SetToggle) and [DLabel:GetToggle](https://wiki.facepunch.com/gmod/DLabel:GetToggle).
---
--- In order to use toggle functionality, you must first call [DLabel:SetIsToggle](https://wiki.facepunch.com/gmod/DLabel:SetIsToggle) with `true`, as it is disabled by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:Toggle)
function DLabel:Toggle() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) A hook called from within [PANEL:ApplySchemeSettings](https://wiki.facepunch.com/gmod/PANEL:ApplySchemeSettings) to determine the color of the text on display.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:UpdateColours)
---@param skin table A table supposed to contain the color values listed above.
function DLabel:UpdateColours(skin) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally to update the color of the text.
---
---[View wiki](https://wiki.facepunch.com/gmod/DLabel:UpdateFGColor)
function DLabel:UpdateFGColor() end
