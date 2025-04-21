---@meta

--- The **DColorPalette** allows the player to select a color from a list of given colors.
--- This panel supports saving across sessions via the panel cookie system.
--- Use [Panel:SetCookieName](https://wiki.facepunch.com/gmod/Panel:SetCookieName) to change "save files".
---@class DColorPalette : DIconLayout
local DColorPalette = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Basically the same functionality as [DColorPalette:OnValueChanged](https://wiki.facepunch.com/gmod/DColorPalette:OnValueChanged), you should use that instead!
---
--- For Override
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:DoClick)
---@param clr table The new color via the Color
---@param btn Panel The DColorButton that was pressed.
function DColorPalette:DoClick(clr, btn) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the size of each palette button. Set by [DColorPalette:SetButtonSize](https://wiki.facepunch.com/gmod/DColorPalette:SetButtonSize).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:GetButtonSize)
---@return number # The size of each palette button
function DColorPalette:GetButtonSize() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the alpha channel of the color.
---
--- See also:
--- * [DColorPalette:GetConVarR](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarR) - For the red channel
--- * [DColorPalette:GetConVarG](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarG) - For the green channel
--- * [DColorPalette:GetConVarB](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarB) - For the blue channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarA)
---@return string # The ConVar name for the alpha channel of the color
function DColorPalette:GetConVarA() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the blue channel of the color.
---
--- See also:
--- * [DColorPalette:GetConVarR](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarR) - For the red channel
--- * [DColorPalette:GetConVarG](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarG) - For the green channel
--- * [DColorPalette:GetConVarA](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarB)
---@return string # The ConVar name for the blue channel of the color
function DColorPalette:GetConVarB() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the green channel of the color.
---
--- See also:
--- * [DColorPalette:GetConVarR](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarR) - For the red channel
--- * [DColorPalette:GetConVarB](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarB) - For the blue channel
--- * [DColorPalette:GetConVarA](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarG)
---@return string # The ConVar name for the green channel of the color
function DColorPalette:GetConVarG() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the red channel of the color.
---
--- See also:
--- * [DColorPalette:GetConVarG](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarG) - For the green channel
--- * [DColorPalette:GetConVarB](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarB) - For the blue channel
--- * [DColorPalette:GetConVarA](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:GetConVarR)
---@return string # The ConVar name for the red channel of the color
function DColorPalette:GetConVarR() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the number of rows of the palette, provided 6 colors fill each row. This value is equal to the number of colors in the DColorPalette divided by 6.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:GetNumRows)
---@return number # Number of rows of the DColorPalette.
function DColorPalette:GetNumRows() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to make sure changes on one palette affect other palettes with same name.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:NetworkColorChange)
function DColorPalette:NetworkColorChange() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called when a palette button has been pressed. For Override
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:OnRightClickButton)
---@param pnl Panel The DColorButton that was pressed.
function DColorPalette:OnRightClickButton(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Resets this entire color palette to a default preset one, without saving.
---
--- See [DColorPalette:ResetSavedColors](https://wiki.facepunch.com/gmod/DColorPalette:ResetSavedColors) for version that also saves the changes.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:Reset)
function DColorPalette:Reset() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Resets this entire color palette to a default preset one and saves the changes.
---
--- See [DColorPalette:Reset](https://wiki.facepunch.com/gmod/DColorPalette:Reset) for version that does not save the changes.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:ResetSavedColors)
function DColorPalette:ResetSavedColors() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Saves the color of given button across sessions.
--- The color is saved as a panel cookie, see [Panel:SetCookie](https://wiki.facepunch.com/gmod/Panel:SetCookie) and [Panel:SetCookieName](https://wiki.facepunch.com/gmod/Panel:SetCookieName).
--- It is expected that the amount of colors per palette ([Panel:SetCookieName](https://wiki.facepunch.com/gmod/Panel:SetCookieName)) is the same every time.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SaveColor)
---@param btn Panel The button to save the color of. Used to get the ID of the button.
---@param clr table The color to save to this button's index
function DColorPalette:SaveColor(btn, clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the size of each palette button.
---
--- This is best kept to such a number, where this equation would return a whole number:
--- `WidthOfColorPalette / ButtonSize= WholeNumber`
---
--- If not, there will be ugly whitespace on the right side of the panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetButtonSize)
---@param size number Sets the new size
function DColorPalette:SetButtonSize(size) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Currently does nothing. Intended to "select" the color.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetColor)
---@param clr table
function DColorPalette:SetColor(clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Clears the palette and adds new buttons with given colors.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetColorButtons)
---@param tab table A number indexed table where each value is a Color
function DColorPalette:SetColorButtons(tab) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the alpha channel of the color.
---
--- See also:
--- * [DColorPalette:SetConVarR](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarR) - For the red channel
--- * [DColorPalette:SetConVarG](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarG) - For the green channel
--- * [DColorPalette:SetConVarB](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarB) - For the blue channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarA)
---@param convar string The ConVar name for the alpha channel of the color
function DColorPalette:SetConVarA(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the blue channel of the color.
---
--- See also:
--- * [DColorPalette:SetConVarR](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarR) - For the red channel
--- * [DColorPalette:SetConVarG](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarG) - For the green channel
--- * [DColorPalette:SetConVarA](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarB)
---@param convar string The ConVar name for the blue channel of the color
function DColorPalette:SetConVarB(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the green channel of the color.
---
--- See also:
--- * [DColorPalette:SetConVarR](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarR) - For the red channel
--- * [DColorPalette:SetConVarB](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarB) - For the blue channel
--- * [DColorPalette:SetConVarA](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarG)
---@param convar string The ConVar name for the green channel of the color
function DColorPalette:SetConVarG(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the red channel of the color.
---
--- See also:
--- * [DColorPalette:SetConVarG](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarG) - For the green channel
--- * [DColorPalette:SetConVarB](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarB) - For the blue channel
--- * [DColorPalette:SetConVarA](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarR)
---@param convar string The ConVar name for the red channel of the color
function DColorPalette:SetConVarR(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Roughly sets the number of colors that can be picked by the user. If the DColorPalette is exactly 6 rows tall, this function will set the number of colors shown per row in the palette. This is an [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
--- **NOTE**: [DColorPalette:Reset](https://wiki.facepunch.com/gmod/DColorPalette:Reset) or [DColorPalette:ResetSavedColors](https://wiki.facepunch.com/gmod/DColorPalette:ResetSavedColors) must be called after this function to apply changes.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:SetNumRows)
---@param rows number Scale for the range of colors that the user can pick. Default is 8.
function DColorPalette:SetNumRows(rows) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Internal helper function for [DColorPalette:UpdateConVars](https://wiki.facepunch.com/gmod/DColorPalette:UpdateConVars).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:UpdateConVar)
---@param name string The name of the console variable to set
---@param key string The key of the 3rd argument to set the convar to
--- Possible values: "r", "g", "b", "a"
---@param clr table The Color to retrieve the info from.
function DColorPalette:UpdateConVar(name, key, clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates all the console variables set by [DColorPalette:SetConVarR](https://wiki.facepunch.com/gmod/DColorPalette:SetConVarR) and so on with given color.
---
--- Called internally when a palette color is clicked.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorPalette:UpdateConVars)
---@param clr table A Color
function DColorPalette:UpdateConVars(clr) end
