---[SHARED AND MENU] Creates a Color.
--- 	This function is very expensive when used in rendering hooks or in operations requiring very frequent calls (like loops for example). It is better to store the color in a variable or to use the [default colors](https://wiki.facepunch.com/gmod/Global_Variables#misc) available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Global.Color)
---@param r number An integer from `0-255` describing the red value of the color.
---@param g number An integer from `0-255` describing the green value of the color.
---@param b number An integer from `0-255` describing the blue value of the color.
---@param a number An integer from `0-255` describing the alpha (transparency) of the color.
---@return Color #The created Color. Is returned as a table without the Color metatable, [(See GitHub issue)](https://github.com/Facepunch/garrysmod-issues/issues/2407).
function _G.Color(r, g, b, a) end
