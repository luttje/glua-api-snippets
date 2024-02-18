---@meta

---
--- 		A standard Derma color mixer
--- 	Creates a DColorMixer in a DFrame, as seen above
---@class DColorMixer : DPanel
local DColorMixer = {}

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:ConVarThink)
function DColorMixer:ConVarThink() end

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:DoConVarThink)
---@param cvar string
function DColorMixer:DoConVarThink(cvar) end

---[CLIENT AND MENU] Return true if alpha bar is shown, false if not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetAlphaBar)
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetAlphaBar() end

---[CLIENT AND MENU] Returns the current selected color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetColor)
---@return table # The current selected color as a Color.
function DColorMixer:GetColor() end

---[CLIENT AND MENU] Returns the ConVar name for the alpha channel of the color.
---
--- See also:
--- * DColorMixer:GetConVarR - For the red channel
--- * DColorMixer:GetConVarG - For the green channel
--- * DColorMixer:GetConVarB - For the blue channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarA)
---@return string # The ConVar name for the alpha channel of the color
function DColorMixer:GetConVarA() end

---[CLIENT AND MENU] Returns the ConVar name for the blue channel of the color.
---
--- See also:
--- * DColorMixer:GetConVarR - For the red channel
--- * DColorMixer:GetConVarG - For the green channel
--- * DColorMixer:GetConVarA - For the alpha channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarB)
---@return string # The ConVar name for the blue channel of the color
function DColorMixer:GetConVarB() end

---[CLIENT AND MENU] Returns the ConVar name for the green channel of the color.
---
--- See also:
--- * DColorMixer:GetConVarR - For the red channel
--- * DColorMixer:GetConVarB - For the blue channel
--- * DColorMixer:GetConVarA - For the alpha channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarG)
---@return string # The ConVar name for the green channel of the color
function DColorMixer:GetConVarG() end

---[CLIENT AND MENU] Returns the ConVar name for the red channel of the color.
---
--- See also:
--- * DColorMixer:GetConVarG - For the green channel
--- * DColorMixer:GetConVarB - For the blue channel
--- * DColorMixer:GetConVarA - For the alpha channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetConVarR)
---@return string # The ConVar name for the red channel of the color
function DColorMixer:GetConVarR() end

---[CLIENT AND MENU] Return true if palette is shown, false if not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetPalette)
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetPalette() end

---[CLIENT AND MENU] Returns the color as a normalized Vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetVector)
---@return Vector # A vector representing the color of the DColorMixer, each value being in range of 0 to 1. Alpha is not included.
function DColorMixer:GetVector() end

---[CLIENT AND MENU] Return true if the wangs are shown, false if not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:GetWangs)
---@return boolean # Return true if shown, false if not.
function DColorMixer:GetWangs() end

---[CLIENT AND MENU] Show/Hide the alpha bar in DColorMixer
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetAlphaBar)
---@param show boolean Show / Hide the alpha bar
function DColorMixer:SetAlphaBar(show) end

---[CLIENT AND MENU] Sets the base color of the DColorCube part of the DColorMixer.
---
--- See also DColorCube:SetBaseRGB
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetBaseColor)
---@param clr table Color
function DColorMixer:SetBaseColor(clr) end

---[CLIENT AND MENU] Sets the color of the DColorMixer
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetColor)
---@param color table The color to set. See Global.Color
function DColorMixer:SetColor(color) end

---[CLIENT AND MENU] Sets the ConVar name for the alpha channel of the color.
---
--- See also:
--- * DColorMixer:SetConVarR - For the red channel
--- * DColorMixer:SetConVarG - For the green channel
--- * DColorMixer:SetConVarB - For the blue channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarA)
---@param convar string The ConVar name for the alpha channel of the color
function DColorMixer:SetConVarA(convar) end

---[CLIENT AND MENU] Sets the ConVar name for the blue channel of the color.
---
--- See also:
--- * DColorMixer:SetConVarR - For the red channel
--- * DColorMixer:SetConVarG - For the green channel
--- * DColorMixer:SetConVarA - For the alpha channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarB)
---@param convar string The ConVar name for the blue channel of the color
function DColorMixer:SetConVarB(convar) end

---[CLIENT AND MENU] Sets the ConVar name for the green channel of the color.
---
--- See also:
--- * DColorMixer:SetConVarR - For the red channel
--- * DColorMixer:SetConVarB - For the blue channel
--- * DColorMixer:SetConVarA - For the alpha channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarG)
---@param convar string The ConVar name for the green channel of the color
function DColorMixer:SetConVarG(convar) end

---[CLIENT AND MENU] Sets the ConVar name for the red channel of the color.
---
--- See also:
--- * DColorMixer:SetConVarG - For the green channel
--- * DColorMixer:SetConVarB - For the blue channel
--- * DColorMixer:SetConVarA - For the alpha channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetConVarR)
---@param convar string The ConVar name for the red channel of the color
function DColorMixer:SetConVarR(convar) end

---[CLIENT AND MENU] Sets the label's text to show.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetLabel)
---@param text? string Set to non empty string to show the label and its text.
---
--- Give it an empty string or nothing and the label will be hidden.
function DColorMixer:SetLabel(text) end

---[CLIENT AND MENU] Show or hide the palette panel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetPalette)
---@param enabled boolean Show or hide the palette panel?
function DColorMixer:SetPalette(enabled) end

---[CLIENT AND MENU] Sets the color of DColorMixer from a Vector. Alpha is not included.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetVector)
---@param vec Vector The color to set. It is expected that the vector will have values be from 0 to 1. (i.e. be normalized)
function DColorMixer:SetVector(vec) end

---[CLIENT AND MENU] Show / Hide the colors indicators in DColorMixer
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:SetWangs)
---@param show boolean Show / Hide the colors indicators
function DColorMixer:SetWangs(show) end

---[CLIENT AND MENU] Use DColorMixer:SetColor instead!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:UpdateColor)
---@param clr table
function DColorMixer:UpdateColor(clr) end

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:UpdateConVar)
---@param cvar string The ConVar name
---@param part string The color part to set the cvar to. "r", "g", "b" or "a".
---@param clr table The Color
function DColorMixer:UpdateConVar(cvar, part, clr) end

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DColorMixer:UpdateConVars)
---@param clr table The Color
function DColorMixer:UpdateConVars(clr) end
