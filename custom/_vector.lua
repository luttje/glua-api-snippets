---@meta

---[SHARED AND MENU] Creates a Vector object.
--- 		This function is very expensive when used in often running hooks or in operations requiring very frequent calls (like loops for example). It is better to store the vector in a variable or to use the [default vectors](https://wiki.facepunch.com/gmod/Global_Variables#misc) available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Global.Vector)
---@param vector string Will be parsed to a vector. If it fails, a 0 vector will be returned.
---@return Vector #The created vector object.
function _G.Vector(vector) end

---[SHARED AND MENU] Creates a Vector object.
--- 		This function is very expensive when used in often running hooks or in operations requiring very frequent calls (like loops for example). It is better to store the vector in a variable or to use the [default vectors](https://wiki.facepunch.com/gmod/Global_Variables#misc) available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Global.Vector)
---@param vector Vector A copy of this vector will be returned.
---@return Vector #The created vector object.
function _G.Vector(vector) end
