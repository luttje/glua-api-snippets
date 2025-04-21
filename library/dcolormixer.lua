---@meta

--- A standard Derma color mixer
---@class DColorMixer : DPanel
local DColorMixer = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:ConVarThink)
function DColorMixer:ConVarThink() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:DoConVarThink)
---@param cvar string
function DColorMixer:DoConVarThink(cvar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns true if alpha bar is shown, false if not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetAlphaBar)
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetAlphaBar() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the current selected color.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetColor)
---@return table # The current selected color as a Color.
function DColorMixer:GetColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the alpha channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR) - For the red channel
--- * [DColorMixer:GetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG) - For the green channel
--- * [DColorMixer:GetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB) - For the blue channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA)
---@return string # The ConVar name for the alpha channel of the color
function DColorMixer:GetConVarA() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the blue channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR) - For the red channel
--- * [DColorMixer:GetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG) - For the green channel
--- * [DColorMixer:GetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB)
---@return string # The ConVar name for the blue channel of the color
function DColorMixer:GetConVarB() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the green channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR) - For the red channel
--- * [DColorMixer:GetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB) - For the blue channel
--- * [DColorMixer:GetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG)
---@return string # The ConVar name for the green channel of the color
function DColorMixer:GetConVarG() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the red channel of the color.
---
--- See also:
--- * [DColorMixer:GetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG) - For the green channel
--- * [DColorMixer:GetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB) - For the blue channel
--- * [DColorMixer:GetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR)
---@return string # The ConVar name for the red channel of the color
function DColorMixer:GetConVarR() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns true if palette is shown, false if not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetPalette)
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetPalette() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the color as a normalized [Vector](https://wiki.facepunch.com/gmod/Vector).
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetVector)
---@return Vector # A vector representing the color of the DColorMixer, each value being in range of 0 to 1. Alpha is not included.
function DColorMixer:GetVector() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns true if the wangs are shown, false if not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:GetWangs)
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetWangs() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that show/hide the alpha bar in DColorMixer
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetAlphaBar)
---@param show boolean Show / Hide the alpha bar
function DColorMixer:SetAlphaBar(show) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the base color of the [DColorCube](https://wiki.facepunch.com/gmod/DColorCube) part of the [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer).
---
--- See also [DColorCube:SetBaseRGB](https://wiki.facepunch.com/gmod/DColorCube:SetBaseRGB)
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetBaseColor)
---@param clr table Color
function DColorMixer:SetBaseColor(clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the color of the [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer). See also [DColorMixer:GetColor](https://wiki.facepunch.com/gmod/DColorMixer:GetColor)
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetColor)
---@param color table The color to set. See Global.Color
function DColorMixer:SetColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the alpha channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR) - For the red channel
--- * [DColorMixer:SetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG) - For the green channel
--- * [DColorMixer:SetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB) - For the blue channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA)
---@param convar string The ConVar name for the alpha channel of the color
function DColorMixer:SetConVarA(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the blue channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR) - For the red channel
--- * [DColorMixer:SetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG) - For the green channel
--- * [DColorMixer:SetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB)
---@param convar string The ConVar name for the blue channel of the color
function DColorMixer:SetConVarB(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the green channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarR](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR) - For the red channel
--- * [DColorMixer:SetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB) - For the blue channel
--- * [DColorMixer:SetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG)
---@param convar string The ConVar name for the green channel of the color
function DColorMixer:SetConVarG(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) name for the red channel of the color.
---
--- See also:
--- * [DColorMixer:SetConVarG](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG) - For the green channel
--- * [DColorMixer:SetConVarB](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB) - For the blue channel
--- * [DColorMixer:SetConVarA](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA) - For the alpha channel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR)
---@param convar string The ConVar name for the red channel of the color
function DColorMixer:SetConVarR(convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the label's text to show.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetLabel)
---@param text? string Set to non empty string to show the label and its text.
---
--- Give it an empty string or nothing and the label will be hidden.
function DColorMixer:SetLabel(text) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Show or hide the palette panel
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetPalette)
---@param enabled boolean Show or hide the palette panel?
function DColorMixer:SetPalette(enabled) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color of [DColorMixer](https://wiki.facepunch.com/gmod/DColorMixer) from a [Vector](https://wiki.facepunch.com/gmod/Vector). Alpha is not included.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetVector)
---@param vec Vector The color to set. It is expected that the vector will have values be from 0 to 1. (i.e. be normalized)
function DColorMixer:SetVector(vec) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Show / Hide the colors indicators in DColorMixer
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:SetWangs)
---@param show boolean Show / Hide the colors indicators
function DColorMixer:SetWangs(show) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Use [DColorMixer:SetColor](https://wiki.facepunch.com/gmod/DColorMixer:SetColor) instead!
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:UpdateColor)
---@param clr table
function DColorMixer:UpdateColor(clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:UpdateConVar)
---@param cvar string The ConVar name
---@param part string The color part to set the cvar to. "r", "g", "b" or "a".
---@param clr table The Color
function DColorMixer:UpdateConVar(cvar, part, clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:UpdateConVars)
---@param clr table The Color
function DColorMixer:UpdateConVars(clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) sets the default color of the element to the currently selected color
---
---[View wiki](https://wiki.facepunch.com/gmod/DColorMixer:UpdateDefaultColor)
function DColorMixer:UpdateDefaultColor() end
