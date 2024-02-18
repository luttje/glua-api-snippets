---@meta

--- The weapons library allows you to access information about any scripted weapons loaded into the game, as well as register your own weapons.
weapons = {}

---[SHARED] Get a `copy` of weapon table by name. This function also inherits fields from the weapon's base class, unlike weapons.GetStored.
--- 	 This will only work on SWEP's, this means that this will not return anything for HL2/HL:S weapons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/weapons.Get)
---@param classname string Class name of weapon to retrieve
---@return table # The retrieved table or nil
function weapons.Get(classname) end

---[SHARED] Get a list of all the registered SWEPs. This does not include weapons added to spawnmenu manually.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/weapons.GetList)
---@return table # List of all the registered SWEPs
function weapons.GetList() end

---[SHARED] Gets the REAL weapon table, not a copy. The produced table does *not* inherit fields from the weapon's base class, unlike weapons.Get.
---
--- Modifying this table will modify what is stored by the weapons library. Take a copy or use weapons.Get to avoid this.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/weapons.GetStored)
---@param weapon_class string Weapon class to retrieve weapon table of
---@return table # The weapon table
function weapons.GetStored(weapon_class) end

---[SHARED] Checks if name is based on base
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/weapons.IsBasedOn)
---@param name string Entity's class name to be checked
---@param base string Base class name to be checked
---@return boolean # Returns true if class name is based on base, else false.
function weapons.IsBasedOn(name, base) end

---[SHARED] Called after all SWEPS have been loaded and runs baseclass.Set on each one.
---
--- You can retrieve all the currently registered SWEPS with weapons.GetList.
---
--- This is not called after a SWEP auto refresh, and thus the inherited baseclass functions retrieved with baseclass.Get will not be updated
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/weapons.OnLoaded)
function weapons.OnLoaded() end

---[SHARED] Registers a Scripted Weapon (SWEP) class manually. When the engine spawns an entity, weapons registered with this function will be created if the class names match.
---
--- See also scripted_ents.Register for Scripted Entities (SENTs)
---
--- Sub-tables provided in the first argument will not carry over their metatable, and will receive a BaseClass key if the table was merged with the base's. Userdata references, which includes Vectors, Angles, Entities, etc. will not be copied.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/weapons.Register)
---@param swep_table table The SWEP table
---@param classname string Classname to assign to that swep
function weapons.Register(swep_table, classname) end
