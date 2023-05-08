---@meta

---[SHARED AND MENU] Creates an Angle object.
--- 		This function is very expensive when used in often running hooks or in operations requiring very frequent calls (like loops for example). It is better to store the angle in a variable or to use the [default angle](https://wiki.facepunch.com/gmod/Global_Variables#misc) available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Global.Angle)
---@param angle string Will be parsed to an angle. If it fails, a 0 angle will be returned.
---@return Angle #Created angle
function _G.Angle(angle) end

---[SHARED AND MENU] Creates an Angle object.
--- 		This function is very expensive when used in often running hooks or in operations requiring very frequent calls (like loops for example). It is better to store the angle in a variable or to use the [default angle](https://wiki.facepunch.com/gmod/Global_Variables#misc) available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Global.Angle)
---@param angle Angle A copy of this angle will be returned.
---@return Angle #Created angle
function _G.Angle(angle) end
