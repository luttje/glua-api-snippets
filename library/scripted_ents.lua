---@meta

--- The scripted_ents library allows you to access information about any scripted entities loaded into the game, as well as register your own entities.
scripted_ents = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines an alias string that can be used to refer to another classname
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.Alias)
---@param alias string A new string which can be used to refer to another classname
---@param classname string The classname the alias should refer to
function scripted_ents.Alias(alias, classname) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a copy of the ENT table for a class, including functions defined by the base class
--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.Get)
---@param classname string The classname of the ENT table to return, can be an alias
---@return table # entTable
function scripted_ents.Get(classname) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a copy of the list of all ENT tables registered
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.GetList)
---@return table # A table of all entities in the following format: (table keys are the classnames)
--- * table t - The Structures/ENT table associated with the entity
--- * boolean isBaseType - Always true
--- * string Base - The entity base (note capital B in the key name)
--- * string type - The entity type
function scripted_ents.GetList() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves a member of entity's table.
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.GetMember)
---@param class string Entity's class name
---@param name string Name of member to retrieve
---@return any # The member or nil if failed
function scripted_ents.GetMember(class, name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a list of all ENT tables which contain ENT.Spawnable
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.GetSpawnable)
---@return table # A table of Structures/ENTs
function scripted_ents.GetSpawnable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the actual ENT table for a class. Modifying functions/variables in this table will change newly spawned entities
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.GetStored)
---@param classname string The classname of the ENT table to return
---@return table # entTable
function scripted_ents.GetStored(classname) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the 'type' of a class, this will one of the following: 'anim', 'ai', 'brush', 'point'.
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.GetType)
---@param classname string The classname to check
---@return string # type
function scripted_ents.GetType(classname) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if name is based on base
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.IsBasedOn)
---@param name string Entity's class name to be checked
---@param base string Base class name to be checked
---@return boolean # Returns true if class name is based on base, else false.
function scripted_ents.IsBasedOn(name, base) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called after all ENTS have been loaded and runs [baseclass.Set](https://wiki.facepunch.com/gmod/baseclass.Set) on each one.
---
--- You can retrieve all the currently registered ENTS with [scripted_ents.GetList](https://wiki.facepunch.com/gmod/scripted_ents.GetList).
---
--- **NOTE**: This is not called after an ENT auto refresh, and thus the inherited baseclass functions retrieved with [baseclass.Get](https://wiki.facepunch.com/gmod/baseclass.Get) will not be updated
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.OnLoaded)
function scripted_ents.OnLoaded() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Registers an ENT table with a classname. Reregistering an existing classname will automatically update the functions of all existing entities of that class.
---
--- Sub-tables provided in the first argument will not carry over their metatable, and will receive a BaseClass key if the table was merged with the base's. Userdata references, which includes Vectors, Angles, Entities, etc. will not be copied.
---
---[View wiki](https://wiki.facepunch.com/gmod/scripted_ents.Register)
---@param ENT table The ENT table to register.
--- For the table's format and available options see the Structures/ENT page.
---@param classname string The classname to register.
function scripted_ents.Register(ENT, classname) end
