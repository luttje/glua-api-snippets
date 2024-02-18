---@meta

---
--- A form which may be used to display text the player is meant to select and copy or alternately allow them to enter some text of their own.
---
--- At least one of your `DTextEntry`'s parents must either be an EditablePanel or derived from it (like a DFrame, for example), else it won't be able to focus and thus be unselectable.
---
--- You must also call Panel:MakePopup on said panel or the `DTextEntry` will not work.
--- 	Creates a text entry form that allows you to print messages into the local player's chat window.
--- 	Creates a text entry with a browse button.
---@class DTextEntry : TextEntry
local DTextEntry = {}

---[CLIENT AND MENU] Adds an entry to DTextEntry's history.
---
--- See DTextEntry:SetHistoryEnabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:AddHistory)
---@param text string Text to add to the text entry's history.
function DTextEntry:AddHistory(text) end

---[CLIENT AND MENU] Called whenever the value of the panel has been updated (whether by user input or otherwise).
---
--- It allows you to determine whether a user can modify the TextEntry's text.
---
--- By default, this only checks whether the panel disallows numeric characters, preventing it from being edited if the value contains any.
---
--- This is actually an engine hook that only works on TextEntry derived elements.
---
--- If you are looking for a way to modify character limits, see Panel:SetMaximumCharCount
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:AllowInput)
---@param char string The last character entered into the panel.
---@return boolean # Return `true` to prevent the value from changing, `false` to allow it.
function DTextEntry:AllowInput(char) end

---[CLIENT AND MENU] Returns whether a string is numeric or not.
--- Always returns false if the DTextEntry:SetNumeric is set to false.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:CheckNumeric)
---@param strValue string The string to check.
---@return boolean # Whether the string is numeric or not.
function DTextEntry:CheckNumeric(strValue) end

---[CLIENT AND MENU] Called by the DTextEntry when a list of autocompletion options is requested. Meant to be overridden.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetAutoComplete)
---@param inputText string Player's current input.
---@return table # If a table is returned, the values of the table will show up as autocomplete suggestions for the user.
function DTextEntry:GetAutoComplete(inputText) end

---[CLIENT AND MENU] Returns the cursor color of a DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetCursorColor)
---@return table # The color of the cursor as a Color.
function DTextEntry:GetCursorColor() end

---[CLIENT AND MENU] Returns whether the textbox is disabled. Use Panel:IsEnabled instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetDisabled)
---@return boolean # Whether the textbox is disabled.
---@deprecated Use Panel:IsEnabled instead.
function DTextEntry:GetDisabled() end

---[CLIENT AND MENU] Alias of DTextEntry:GetPaintBackground. Use that instead.
---
--- Whether the background is displayed or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetDrawBackground)
---@return boolean #
function DTextEntry:GetDrawBackground() end

---[CLIENT AND MENU] Returns the value set by DTextEntry:SetDrawBorder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetDrawBorder)
---@return boolean #
function DTextEntry:GetDrawBorder() end

---[CLIENT AND MENU] Returns whether pressing Enter can cause the panel to lose focus. Note that a multiline DTextEntry cannot be escaped using the Enter key even when this function returns true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetEnterAllowed)
---@return boolean # Whether pressing the Enter key can cause the panel to lose focus.
function DTextEntry:GetEnterAllowed() end

---[CLIENT AND MENU] Returns the contents of the DTextEntry as a number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetFloat)
---@return number # Text of the DTextEntry as a float, or nil if it cannot be converted to a number using Global.tonumber.
function DTextEntry:GetFloat() end

---[CLIENT AND MENU] Returns the highlight/text selection color of the text entry. If it was not overwritten, it will return the derma skin value. (`colTextEntryTextHighlight`)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetHighlightColor)
---@return table # The highlight Global.Color.
function DTextEntry:GetHighlightColor() end

---[CLIENT AND MENU] Returns whether the history functionality of  DTextEntry is enabled. See DTextEntry:AddHistory.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetHistoryEnabled)
---@return boolean # Whether the history is enabled or not.
function DTextEntry:GetHistoryEnabled() end

---[CLIENT AND MENU] Similar to DTextEntry:GetFloat, but rounds the value to the nearest integer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetInt)
---@return number # Text of the DTextEntry as a round number, or nil if it cannot be converted to a number.
function DTextEntry:GetInt() end

---[CLIENT AND MENU] Returns whether only numeric characters (`123456789.-`) can be entered into the DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetNumeric)
---@return boolean # Whether the DTextEntry is numeric or not.
function DTextEntry:GetNumeric() end

---[CLIENT AND MENU] Whether the background is displayed or not
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetPaintBackground)
---@return boolean # `false` hides the background; this is `true` by default.
function DTextEntry:GetPaintBackground() end

---[CLIENT AND MENU] Return current color of panel placeholder
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetPlaceholderColor)
---@return table # Current placeholder color
function DTextEntry:GetPlaceholderColor() end

---[CLIENT AND MENU] Returns the placeholder text set with DTextEntry:SetPlaceholderText.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetPlaceholderText)
---@return string #
function DTextEntry:GetPlaceholderText() end

---[CLIENT AND MENU] Returns whether or not the panel accepts tab key.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetTabbingDisabled)
---@return boolean # Whether the DTextEntry should ignore tab.
function DTextEntry:GetTabbingDisabled() end

---[CLIENT AND MENU] Returns the text color of a DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetTextColor)
---@return table # The color of the text as a Color.
function DTextEntry:GetTextColor() end

---[CLIENT AND MENU] Returns whether the DTextEntry is set to run DTextEntry:OnValueChange every time a character is typed or deleted or only when Enter is pressed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:GetUpdateOnType)
---@return boolean #
function DTextEntry:GetUpdateOnType() end

---[CLIENT AND MENU] Returns whether this DTextEntry is being edited or not. (i.e. has focus)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:IsEditing)
---@return boolean # Whether this DTextEntry is being edited or not
function DTextEntry:IsEditing() end

---[CLIENT AND MENU] Called internally when the text inside the DTextEntry changes. This is an implementation of TextEntry:OnTextChanged
---
--- You should not override this function. Use DTextEntry:OnValueChange instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:OnTextChanged)
---@param noMenuRemoval boolean Determines whether to remove the autocomplete menu (false) or not (true).
function DTextEntry:OnTextChanged(noMenuRemoval) end

---[CLIENT AND MENU] You really should be using DTextEntry:GetAutoComplete instead.
--- Builds a DMenu for the DTextEntry based on the input table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:OpenAutoComplete)
---@param tab table Table containing results from DTextEntry:GetAutoComplete.
function DTextEntry:OpenAutoComplete(tab) end

---[CLIENT AND MENU] Sets the cursor's color in  DTextEntry (the blinking line).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetCursorColor)
---@param color table The color to set the cursor to.
function DTextEntry:SetCursorColor(color) end

---[CLIENT AND MENU] Disables input on a DTextEntry and greys it out visually. This differs from DTextEntry:SetEditable which doesn't visually change the textbox.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetDisabled)
---@param disabled boolean Whether the textbox should be disabled
---@deprecated Use Panel:SetEnabled instead.
function DTextEntry:SetDisabled(disabled) end

---[CLIENT AND MENU] Alias of DTextEntry:SetPaintBackground. Use that instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetDrawBackground)
---@param show boolean
function DTextEntry:SetDrawBackground(show) end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetDrawBorder)
---@param bool boolean
function DTextEntry:SetDrawBorder(bool) end

---[CLIENT AND MENU] Disables Input on a DTextEntry. This differs from DTextEntry:SetDisabled - SetEditable will not affect the appearance of the textbox.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetEditable)
---@param enabled boolean Whether the DTextEntry should be editable
function DTextEntry:SetEditable(enabled) end

---[CLIENT AND MENU] Sets whether pressing the Enter key will cause the DTextEntry to lose focus or not, provided it is not multiline. This is true by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetEnterAllowed)
---@param allowEnter boolean If set to false, pressing Enter will not cause the panel to lose focus and will never call DTextEntry:OnEnter.
function DTextEntry:SetEnterAllowed(allowEnter) end

---[CLIENT AND MENU] Changes the font of the DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetFont)
---@param font string The name of the font to be changed to.
function DTextEntry:SetFont(font) end

---[CLIENT AND MENU] Sets/overrides the default highlight/text selection color of the text entry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetHighlightColor)
---@param color table The new highlight Global.Color.
function DTextEntry:SetHighlightColor(color) end

---[CLIENT AND MENU] Enables or disables the history functionality of  DTextEntry. This allows the player to scroll through history elements using up and down arrow keys.
---
--- See DTextEntry:AddHistory.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetHistoryEnabled)
---@param enable boolean Whether to enable history or not.
function DTextEntry:SetHistoryEnabled(enable) end

---[CLIENT AND MENU] Sets whether or not to decline non-numeric characters as input.
---
--- Numeric characters are `1234567890.-`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetNumeric)
---@param numericOnly boolean Whether to accept only numeric characters.
function DTextEntry:SetNumeric(numericOnly) end

---[CLIENT AND MENU] Sets whether to show the default background of the DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetPaintBackground)
---@param show boolean `false` hides the background; this is `true` by default.
function DTextEntry:SetPaintBackground(show) end

---[CLIENT AND MENU] Allow you to set placeholder color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetPlaceholderColor)
---@param color? table The color of the placeholder.
function DTextEntry:SetPlaceholderColor(color) end

---[CLIENT AND MENU] Sets the placeholder text that will be shown while the text entry has no user text. The player will not need to delete the placeholder text if they decide to start typing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetPlaceholderText)
---@param text? string
function DTextEntry:SetPlaceholderText(text) end

---[CLIENT AND MENU] Sets whether or not the panel accepts tab key.
--- Disabling tab key prevents the panel from unfocusing by mouse, however, still works for focusing to other keyboard focus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetTabbingDisabled)
---@param enabled boolean Whether the DTextEntry should ignore tab.
function DTextEntry:SetTabbingDisabled(enabled) end

---[CLIENT AND MENU] Sets the text color of the DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetTextColor)
---@param color table The text color. Uses the Color.
function DTextEntry:SetTextColor(color) end

---[CLIENT AND MENU] Sets whether we should fire DTextEntry:OnValueChange every time we type or delete a character or only when Enter is pressed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetUpdateOnType)
---@param updateOnType boolean
function DTextEntry:SetUpdateOnType(updateOnType) end

---[CLIENT AND MENU] Sets the text of the DTextEntry and calls DTextEntry:OnValueChange.
---
---         The text of the DTextEntry only changes if it's not currently being typed in. If you would rather set the text regardless, use Panel:SetText.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:SetValue)
---@param text string The value to set.
function DTextEntry:SetValue(text) end

---[CLIENT AND MENU] Used by DTextEntry:OnTextChanged, DTextEntry:OnEnter and DTextEntry:OnLoseFocus
---
--- Updates the ConVar associated with the TextEntry to its new value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:UpdateConvarValue)
function DTextEntry:UpdateConvarValue() end

---[CLIENT AND MENU] Used internally to set text from the history.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:UpdateFromHistory)
function DTextEntry:UpdateFromHistory() end

---[CLIENT AND MENU] Used internally to set text from the autocomplete menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTextEntry:UpdateFromMenu)
function DTextEntry:UpdateFromMenu() end
