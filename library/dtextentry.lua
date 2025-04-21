---@meta

--- A form which may be used to display text the player is meant to select and copy or alternately allow them to enter some text of their own.
---
--- **NOTE**: At least one of your `DTextEntry`'s parents must either be an [EditablePanel](https://wiki.facepunch.com/gmod/EditablePanel) or derived from it (like a [DFrame](https://wiki.facepunch.com/gmod/DFrame), for example), else it won't be able to focus and thus be unselectable.
---
--- You must also call [Panel:MakePopup](https://wiki.facepunch.com/gmod/Panel:MakePopup) on said panel or the `DTextEntry` will not work.
---@class DTextEntry : TextEntry
local DTextEntry = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds an entry to [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry)'s history.
---
--- See [DTextEntry:SetHistoryEnabled](https://wiki.facepunch.com/gmod/DTextEntry:SetHistoryEnabled).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:AddHistory)
---@param text string Text to add to the text entry's history.
function DTextEntry:AddHistory(text) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called whenever the value of the panel has been updated (whether by user input or otherwise).
---
--- It allows you to determine whether a user can modify the [TextEntry](https://wiki.facepunch.com/gmod/TextEntry)'s text.
---
--- By default, this only checks whether the panel disallows numeric characters, preventing it from being edited if the value contains any.
---
--- This is actually an engine hook that only works on [TextEntry](https://wiki.facepunch.com/gmod/TextEntry) derived elements.
---
--- If you are looking for a way to modify character limits, see [Panel:SetMaximumCharCount](https://wiki.facepunch.com/gmod/Panel:SetMaximumCharCount)
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:AllowInput)
---@param char string The last character entered into the panel.
---@return boolean # Return `true` to prevent the value from changing, `false` to allow it.
function DTextEntry:AllowInput(char) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether a string is numeric or not.
--- Always returns false if the [DTextEntry:SetNumeric](https://wiki.facepunch.com/gmod/DTextEntry:SetNumeric) is set to false.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:CheckNumeric)
---@param strValue string The string to check.
---@return boolean # Whether the string is numeric or not.
function DTextEntry:CheckNumeric(strValue) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called by the DTextEntry when a list of autocompletion options is requested. Meant to be overridden.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetAutoComplete)
---@param inputText string Player's current input.
---@return table # If a table is returned, the values of the table will show up as autocomplete suggestions for the user.
function DTextEntry:GetAutoComplete(inputText) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the cursor color of a DTextEntry.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetCursorColor)
---@return table # The color of the cursor as a Color.
function DTextEntry:GetCursorColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the textbox is disabled. Use [Panel:IsEnabled](https://wiki.facepunch.com/gmod/Panel:IsEnabled) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetDisabled)
---@return boolean # Whether the textbox is disabled.
---@deprecated Use Panel:IsEnabled instead.
function DTextEntry:GetDisabled() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Alias of [DTextEntry:GetPaintBackground](https://wiki.facepunch.com/gmod/DTextEntry:GetPaintBackground). Use that instead.
---
--- Whether the background is displayed or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetDrawBackground)
---@return boolean #
function DTextEntry:GetDrawBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the value set by [DTextEntry:SetDrawBorder](https://wiki.facepunch.com/gmod/DTextEntry:SetDrawBorder).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetDrawBorder)
---@return boolean #
function DTextEntry:GetDrawBorder() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether pressing Enter can cause the panel to lose focus. Note that a multiline DTextEntry cannot be escaped using the Enter key even when this function returns true.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetEnterAllowed)
---@return boolean # Whether pressing the Enter key can cause the panel to lose focus.
function DTextEntry:GetEnterAllowed() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the contents of the DTextEntry as a number.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetFloat)
---@return number # Text of the DTextEntry as a float, or nil if it cannot be converted to a number using Global.tonumber.
function DTextEntry:GetFloat() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the highlight/text selection color of the text entry. If it was not overwritten, it will return the derma skin value. (`colTextEntryTextHighlight`)
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetHighlightColor)
---@return table # The highlight Global.Color.
function DTextEntry:GetHighlightColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the history functionality of  [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) is enabled. See [DTextEntry:AddHistory](https://wiki.facepunch.com/gmod/DTextEntry:AddHistory).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetHistoryEnabled)
---@return boolean # Whether the history is enabled or not.
function DTextEntry:GetHistoryEnabled() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Similar to [DTextEntry:GetFloat](https://wiki.facepunch.com/gmod/DTextEntry:GetFloat), but rounds the value to the nearest integer.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetInt)
---@return number # Text of the DTextEntry as a round number, or nil if it cannot be converted to a number.
function DTextEntry:GetInt() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether only numeric characters (`123456789.-`) can be entered into the DTextEntry.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetNumeric)
---@return boolean # Whether the DTextEntry is numeric or not.
function DTextEntry:GetNumeric() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Whether the background is displayed or not
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetPaintBackground)
---@return boolean # `false` hides the background; this is `true` by default.
function DTextEntry:GetPaintBackground() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Return current color of panel placeholder
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetPlaceholderColor)
---@return table # Current placeholder color
function DTextEntry:GetPlaceholderColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the placeholder text set with [DTextEntry:SetPlaceholderText](https://wiki.facepunch.com/gmod/DTextEntry:SetPlaceholderText).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetPlaceholderText)
---@return string #
function DTextEntry:GetPlaceholderText() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether or not the panel accepts tab key.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetTabbingDisabled)
---@return boolean # Whether the DTextEntry should ignore tab.
function DTextEntry:GetTabbingDisabled() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the text color of a DTextEntry.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetTextColor)
---@return table # The color of the text as a Color.
function DTextEntry:GetTextColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) is set to run [DTextEntry:OnValueChange](https://wiki.facepunch.com/gmod/DTextEntry:OnValueChange) every time a character is typed or deleted or only when Enter is pressed.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:GetUpdateOnType)
---@return boolean #
function DTextEntry:GetUpdateOnType() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether this DTextEntry is being edited or not. (i.e. has focus)
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:IsEditing)
---@return boolean # Whether this DTextEntry is being edited or not
function DTextEntry:IsEditing() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally when the text inside the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) changes. This is an implementation of [TextEntry:OnTextChanged](https://wiki.facepunch.com/gmod/TextEntry:OnTextChanged)
---
--- You should not override this function. Use [DTextEntry:OnValueChange](https://wiki.facepunch.com/gmod/DTextEntry:OnValueChange) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:OnTextChanged)
---@param noMenuRemoval boolean Determines whether to remove the autocomplete menu (false) or not (true).
function DTextEntry:OnTextChanged(noMenuRemoval) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: You really should be using [DTextEntry:GetAutoComplete](https://wiki.facepunch.com/gmod/DTextEntry:GetAutoComplete) instead.
---
--- Builds a [DMenu](https://wiki.facepunch.com/gmod/DMenu) for the DTextEntry based on the input table.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:OpenAutoComplete)
---@param tab table Table containing results from DTextEntry:GetAutoComplete.
function DTextEntry:OpenAutoComplete(tab) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the cursor's color in  DTextEntry (the blinking line).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetCursorColor)
---@param color table The color to set the cursor to.
function DTextEntry:SetCursorColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Disables input on a DTextEntry and greys it out visually. This differs from [DTextEntry:SetEditable](https://wiki.facepunch.com/gmod/DTextEntry:SetEditable) which doesn't visually change the textbox.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetDisabled)
---@param disabled boolean Whether the textbox should be disabled
---@deprecated Use Panel:SetEnabled instead.
function DTextEntry:SetDisabled(disabled) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Alias of [DTextEntry:SetPaintBackground](https://wiki.facepunch.com/gmod/DTextEntry:SetPaintBackground). Use that instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetDrawBackground)
---@param show boolean
function DTextEntry:SetDrawBackground(show) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetDrawBorder)
---@param bool boolean
function DTextEntry:SetDrawBorder(bool) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Disables Input on a DTextEntry. This differs from [DTextEntry:SetDisabled](https://wiki.facepunch.com/gmod/DTextEntry:SetDisabled) - SetEditable will not affect the appearance of the textbox.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetEditable)
---@param enabled boolean Whether the DTextEntry should be editable
function DTextEntry:SetEditable(enabled) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether pressing the Enter key will cause the DTextEntry to lose focus or not, provided it is not multiline. This is true by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetEnterAllowed)
---@param allowEnter boolean If set to false, pressing Enter will not cause the panel to lose focus and will never call DTextEntry:OnEnter.
function DTextEntry:SetEnterAllowed(allowEnter) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Changes the font of the DTextEntry.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetFont)
---@param font string The name of the font to be changed to.
function DTextEntry:SetFont(font) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets/overrides the default highlight/text selection color of the text entry.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetHighlightColor)
---@param color table The new highlight Global.Color.
function DTextEntry:SetHighlightColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Enables or disables the history functionality of  [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry). This allows the player to scroll through history elements using up and down arrow keys.
---
--- See [DTextEntry:AddHistory](https://wiki.facepunch.com/gmod/DTextEntry:AddHistory).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetHistoryEnabled)
---@param enable boolean Whether to enable history or not.
function DTextEntry:SetHistoryEnabled(enable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not to decline non-numeric characters as input.
---
--- Numeric characters are `1234567890.-`
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetNumeric)
---@param numericOnly boolean Whether to accept only numeric characters.
function DTextEntry:SetNumeric(numericOnly) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether to show the default background of the DTextEntry.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetPaintBackground)
---@param show boolean `false` hides the background; this is `true` by default.
function DTextEntry:SetPaintBackground(show) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Allow you to set placeholder color.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetPlaceholderColor)
---@param color? table The color of the placeholder.
function DTextEntry:SetPlaceholderColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the placeholder text that will be shown while the text entry has no user text. The player will not need to delete the placeholder text if they decide to start typing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetPlaceholderText)
---@param text? string
function DTextEntry:SetPlaceholderText(text) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the panel accepts tab key.
--- **NOTE**: Disabling tab key prevents the panel from unfocusing by mouse, however, still works for focusing to other keyboard focus.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetTabbingDisabled)
---@param enabled boolean Whether the DTextEntry should ignore tab.
function DTextEntry:SetTabbingDisabled(enabled) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the text color of the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetTextColor)
---@param color table The text color. Uses the Color.
function DTextEntry:SetTextColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether we should fire [DTextEntry:OnValueChange](https://wiki.facepunch.com/gmod/DTextEntry:OnValueChange) every time we type or delete a character or only when Enter is pressed.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetUpdateOnType)
---@param updateOnType boolean
function DTextEntry:SetUpdateOnType(updateOnType) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the text of the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) and calls [DTextEntry:OnValueChange](https://wiki.facepunch.com/gmod/DTextEntry:OnValueChange).
---
---         **NOTE**: The text of the [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) only changes if it's not currently being typed in. If you would rather set the text regardless, use [Panel:SetText](https://wiki.facepunch.com/gmod/Panel:SetText).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:SetValue)
---@param text string The value to set.
function DTextEntry:SetValue(text) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: Used by [DTextEntry:OnTextChanged](https://wiki.facepunch.com/gmod/DTextEntry:OnTextChanged), [DTextEntry:OnEnter](https://wiki.facepunch.com/gmod/DTextEntry:OnEnter) and [DTextEntry:OnLoseFocus](https://wiki.facepunch.com/gmod/DTextEntry:OnLoseFocus)
---
--- Updates the ConVar associated with the TextEntry to its new value.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:UpdateConvarValue)
function DTextEntry:UpdateConvarValue() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to set text from the history.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:UpdateFromHistory)
function DTextEntry:UpdateFromHistory() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to set text from the autocomplete menu.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTextEntry:UpdateFromMenu)
function DTextEntry:UpdateFromMenu() end
