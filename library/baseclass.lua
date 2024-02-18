---@meta

--- The baseclass library. Used to lookup a field from a metatable.
baseclass = {}

---[SHARED AND MENU] Gets the base class of an an object.
---
--- This is used not just by entities, but also by widgets, panels, drive modes, weapons and gamemodes (with "gamemode_" prefix).
---
--- The keyword **DEFINE_BASECLASS** translates into a call to this function. In the engine, it is replaced with:
---
--- ```
--- local BaseClass = baseclass.Get
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/baseclass.Get)
---@param name string The child class.
---@return table # The base class's meta table.
function baseclass.Get(name) end

---[SHARED AND MENU] Add a new base class that can be derived by others. This is done automatically for:
--- * widgets
--- * panels
--- * drive modes
--- * entities
--- * weapons
--- * gamemodes (with prefix "gamemode_")
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/baseclass.Set)
---@param name string The name of this base class. Must be completely unique.
---@param tab table The base class.
function baseclass.Set(name, tab) end
