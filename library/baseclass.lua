---@meta

--- The baseclass library. Used to lookup a field from a metatable.
baseclass = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the base class of an an object.
---
--- This is used not just by entities, but also by widgets, panels, drive modes, weapons and gamemodes (with "gamemode_" prefix).
---
--- The keyword **DEFINE_BASECLASS** translates into a call to this function. In the engine, it is replaced with:
---
--- ```lua
--- local BaseClass = baseclass.Get
--- ```
---
--- **NOTE**: You should prefer using this instead of `self.BaseClass` to avoid infinite recursion.
---
--- For more information, including usage examples, see the [BaseClasses](https://wiki.facepunch.com/gmod/BaseClasses) reference page.
---
---[View wiki](https://wiki.facepunch.com/gmod/baseclass.Get)
---@param name string The child class.
---@return table # The base class's meta table.
function baseclass.Get(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Add a new base class that can be derived by others. This is done automatically for:
--- * [panels](https://wiki.facepunch.com/gmod/vgui.Register)
--- * [drive modes](https://wiki.facepunch.com/gmod/drive.Register)
--- * [entities and widgets](https://wiki.facepunch.com/gmod/scripted_ents.Register)
--- * [weapons](https://wiki.facepunch.com/gmod/weapons.Register)
--- * [gamemodes](https://wiki.facepunch.com/gmod/gamemode.Register) (with prefix "gamemode_")
---
--- For more information, including usage examples, see the [BaseClasses](https://wiki.facepunch.com/gmod/BaseClasses) reference page.
---
---[View wiki](https://wiki.facepunch.com/gmod/baseclass.Set)
---@param name string The name of this base class. Must be completely unique.
---@param tab table The base class.
function baseclass.Set(name, tab) end
