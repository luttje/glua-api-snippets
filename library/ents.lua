---@meta

--- The ents library provides functions for creating and finding entities in the game.
ents = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Creates an entity. This function will fail and return `NULL` if the networked-edict limit is hit (around **8176**), or the provided entity class doesn't exist.
---
--- **WARNING**: Do not use before [GM:InitPostEntity](https://wiki.facepunch.com/gmod/GM:InitPostEntity) has been called, otherwise the server will crash!
--- If you need to perform entity creation when the game starts, create a hook for [GM:InitPostEntity](https://wiki.facepunch.com/gmod/GM:InitPostEntity) and do it there.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.Create)
---@param class string The classname of the entity to create.
---@return Entity # The created entity, or `NULL` if failed.
function ents.Create(class) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a clientside only prop with optional physics. See also [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) if physics is not needed.
---
--- For physics to work you **must** use the _model_ argument, a simple `SetModel` call will not be enough.
--- Parented clientside prop will become detached if the parent entity leaves the PVS. **A workaround is available on its github page.**
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.CreateClientProp)
---@param model? string The model for the entity to be created.
---@return Entity # Created entity (`C_PhysPropClientside`).
function ents.CreateClientProp(model) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a clientside only rope, similar to those used by the Dog and Fast Zombie models from Half-Life 2.
---
--- Created ropes will be automatically cleaned up when one of the attached entities is removed.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.CreateClientRope)
---@param ent1 Entity The first entity to attach the rope to.
---@param ent1attach number|Vector The attachment ID on the first entity to attach the rope to, or a local Vector relative to the first entity.
---@param ent2 Entity The second entity to attach the rope to.
---@param ent2attach number|Vector The attachment ID on the second entity to attach the rope to, or a local Vector relative to the second entity.
---@param extra? table Extra optional settings for the rope. Possible values are:
--- * slack - How much extra rope to add to the length (default: 0)
--- * width - Width of the rope (default: 2)
--- * segments - How many segments the rope should have (default: 8, valid range is [2,10])
--- * material - Which material should the rope have (default: `"cable/cable"`)
--- * nogravity - If set, the rope should have no gravity. (default: 0)
---@return Entity # Created entity (`C_RopeKeyframe`).
function ents.CreateClientRope(ent1, ent1attach, ent2, ent2attach, extra) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a clientside only scripted entity. The scripted entity must be of "anim" type.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.CreateClientside)
---@param class string The class name of the entity to create.
---@return Entity # Created entity.
function ents.CreateClientside(class) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table of all entities along the ray. The ray does not stop on collisions, meaning it will go through walls/entities.
---
--- This function is capable of detecting clientside only entities by default.
---
--- This internally uses [spatial partitioning](https://en.wikipedia.org/wiki/Space_partitioning) to avoid looping through all entities.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindAlongRay)
---@param start Vector The start position of the ray
---@param _end Vector The end position of the ray
---@param mins? Vector The mins corner of the ray
---@param maxs? Vector The maxs corner of the ray
---@return Entity[] # Table of the found entities. There's a limit of 1024 entities.
function ents.FindAlongRay(start, _end, mins, maxs) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets all entities with the given class, supports wildcards.
---
--- This function returns a sequential table, meaning it should be looped with [Global.ipairs](https://wiki.facepunch.com/gmod/Global.ipairs) instead of [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) for efficiency reasons.
---
--- This works internally by iterating over [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll). `ents.FindByClass` is always faster than [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll) or [ents.Iterator](https://wiki.facepunch.com/gmod/ents.Iterator).
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindByClass)
---@param class string The class of the entities to find, supports wildcards.
---
--- Asterisks (`*`) are the only wildcard supported.
---@return Entity[] # A table containing all found entities
function ents.FindByClass(class) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Finds all entities that are of given class and are children of given entity. This works internally by iterating over [ents.FindByClass](https://wiki.facepunch.com/gmod/ents.FindByClass).
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindByClassAndParent)
---@param class string The class of entities to search for
---@param parent Entity Parent of entities that are being searched for
---@return Entity[] # A table of found entities or nil if none are found
function ents.FindByClassAndParent(class, parent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets all entities with the given model, supports wildcards.
---
--- This works internally by iterating over [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll).
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindByModel)
---@param model string The model of the entities to find.
---@return Entity[] # A table of all found entities.
function ents.FindByModel(model) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets all entities with the given hammer targetname. This works internally by iterating over [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll).
---
--- Doesn't do anything on client.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindByName)
---@param name string The targetname to look for
---@return Entity[] # A table of all found entities
function ents.FindByName(name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns all entities within the specified box.
---
--- This internally uses a Spatial Partition to avoid looping through all entities, so it is more efficient than using [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll) for this purpose.
---
--- **NOTE**: Clientside entities will not be returned by this function. Serverside only entities without networked edicts (entity indexes), such as point logic or Constraints are not returned either
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindInBox)
---@param boxMins Vector The box minimum coordinates.
---@param boxMaxs Vector The box maximum coordinates.
---@return Entity[] # A table of all found entities.
function ents.FindInBox(boxMins, boxMaxs) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Finds and returns all entities within the specified cone. Only entities whose [Entity:WorldSpaceCenter](https://wiki.facepunch.com/gmod/Entity:WorldSpaceCenter) is within the cone are considered to be in it.
---
--- The "cone" is actually a conical "slice" of an axis-aligned box (see: [ents.FindInBox](https://wiki.facepunch.com/gmod/ents.FindInBox)). The image to the right shows approximately how this function would look in 2D. Due to this, the entity may be farther than the specified range!
---
--- **NOTE**: Clientside entities will not be returned by this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindInCone)
---@param origin Vector The tip of the cone.
---@param normal Vector Direction of the cone.
---@param range number The range of the cone/box around the origin.
---  The function internally adds 1 to this argument before using it.
---@param angle_cos number The math.cos of the angle between the center of the cone to its edges, which is half the overall angle of the cone.
---
--- 1 makes a 0° cone, 0.707 makes approximately 90°, 0 makes 180°, and so on.
---@return Entity[] # A table of all found Entitys.
function ents.FindInCone(origin, normal, range, angle_cos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Finds all entities that lie within a [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community").
---
--- **NOTE**: The function won't take in to account [Global.AddOriginToPVS](https://wiki.facepunch.com/gmod/Global.AddOriginToPVS) and the like.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindInPVS)
---@param viewPoint Entity|Vector Entity or Vector to find entities within the PVS of. If a player is given, this function will use the player's view entity.
---@return Entity[] # The found Entitys.
function ents.FindInPVS(viewPoint) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets all entities within the specified sphere.
---
--- This function internally calls [util.IsBoxIntersectingSphere](https://wiki.facepunch.com/gmod/util.IsBoxIntersectingSphere) for every entity on the map based on their Orientated Bounding Box.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FindInSphere)
---@param origin Vector Center of the sphere.
---@param radius number Radius of the sphere.
---@return Entity[] # A table of all found Entitys.
function ents.FindInSphere(origin, radius) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Fires a use event.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.FireTargets)
---@param target string Name of the target entity.
---@param activator Entity Activator of the event.
---@param caller Entity Caller of the event.
---@param usetype USE Use type. See the Enums/USE.
---@param value number This value is passed to ENTITY:Use, but isn't used by any default entities in the engine.
function ents.FireTargets(target, activator, caller, usetype, value) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table of all existing entities.
---
--- Consider using [ents.Iterator](https://wiki.facepunch.com/gmod/ents.Iterator) instead for better performance.
---
--- This function returns a sequential table, meaning it should be looped with [Global.ipairs](https://wiki.facepunch.com/gmod/Global.ipairs) instead of [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs) for efficiency reasons.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.GetAll)
---@return Entity[] # Table of all existing Entitys.
function ents.GetAll() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an entity by its index. Same as [Global.Entity](https://wiki.facepunch.com/gmod/Global.Entity).
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.GetByIndex)
---@param entIdx number The index of the entity.
---@return Entity # The entity if it exists, or `NULL` if it doesn't.
function ents.GetByIndex(entIdx) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gives you the amount of currently existing entities.
---
--- Similar to **#**[ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll)() but with better performance since the entity table doesn't have to be generated.
--- If [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll) is already being called for iteration, than using the **#** operator on the table will be faster than calling this function since it is JITted.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.GetCount)
---@param IncludeKillMe? boolean Include entities with the FL_KILLME flag. This will skip an internal loop, and the function will be more efficient as a byproduct.
---@return number # Number of entities
function ents.GetCount(IncludeKillMe) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the amount of networked entities, which is limited to 8192. [ents.Create](https://wiki.facepunch.com/gmod/ents.Create) will fail somewhere between 8064 and 8176 - this can vary based on the amount of existing temp ents.
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.GetEdictCount)
---@return number # Number of networked entities
function ents.GetEdictCount() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns entity that has given [Entity:MapCreationID](https://wiki.facepunch.com/gmod/Entity:MapCreationID).
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.GetMapCreatedEntity)
---@param id number Entity's creation id.
---@return Entity|nil # Found entity, `nil` otherwise.
function ents.GetMapCreatedEntity(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a [Stateless Iterator](https://www.lua.org/pil/7.3.html) for all entities.
--- Intended for use in [Generic For Loops](https://www.lua.org/pil/4.3.5.html).
--- See [player.Iterator](https://wiki.facepunch.com/gmod/player.Iterator) for a similar function for all players.
---
--- Internally, this function uses cached values that exist entirely within lua, as opposed to [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll), which is a C++ function.
--- Because switching from lua to C++ (and vice versa) incurs a performance cost, this function will be somewhat more efficient than [ents.GetAll](https://wiki.facepunch.com/gmod/ents.GetAll).
---
---[View wiki](https://wiki.facepunch.com/gmod/ents.Iterator)
---@return function # The Iterator Function from Global.ipairs
---@return Entity[] # Table of all existing Entity.  This is a cached copy of ents.GetAll
--- This table is intended to be read-only.
---
--- Modifying the return table will affect all subsequent calls to this function until the cache is refreshed, replacing all of your ents.GetAll usages may come with unintended side effects because of this.
---@return number # The starting index for the table of players.
--- This is always `0` and is returned for the benefit of [Generic For Loops](https://www.lua.org/pil/4.3.5.html)
function ents.Iterator() end
