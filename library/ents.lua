---@meta

--- The ents library provides functions for creating and finding entities in the game.
ents = {}

---[SERVER] Creates an entity. This function will fail and return `NULL` if the networked-edict limit is hit (around **8176**), or the provided entity class doesn't exist.
---
--- Do not use before GM:InitPostEntity has been called, otherwise the server will crash!
--- If you need to perform entity creation when the game starts, create a hook for GM:InitPostEntity and do it there.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.Create)
---@param class string The classname of the entity to create.
---@return Entity # The created entity, or `NULL` if failed.
function ents.Create(class) end

---[CLIENT] Creates a clientside only prop. See also Global.ClientsideModel.
---
---
--- For physics to work you **must** use the _model_ argument, a simple `SetModel` call will not be enough.
--- Parented clientside prop will become detached if the parent entity leaves the PVS. **A workaround is available on its github page.**
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.CreateClientProp)
---@param model? string The model for the entity to be created.
---@return Entity # Created entity (`C_PhysPropClientside`).
function ents.CreateClientProp(model) end

---[CLIENT] Creates a clientside only scripted entity. The scripted entity must be of "anim" type.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.CreateClientside)
---@param class string The class name of the entity to create.
---@return Entity # Created entity.
function ents.CreateClientside(class) end

---[SHARED] Returns a table of all entities along the ray. The ray does not stop on collisions, meaning it will go through walls/entities.
--- This internally uses a Spatial Partition to avoid looping through all entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindAlongRay)
---@param start Vector The start position of the ray
---@param _end Vector The end position of the ray
---@param mins? Vector The mins corner of the ray
---@param maxs? Vector The maxs corner of the ray
---@return table # Table of the found entities. There's a limit of 1024 entities.
function ents.FindAlongRay(start, _end, mins, maxs) end

---[SHARED] Gets all entities with the given class, supports wildcards. This works internally by iterating over ents.GetAll. Even if internally ents.GetAll is used, It is faster to use ents.FindByClass than ents.GetAll with a single class comparison.
---
--- Asterisks (*) are the only wildcard supported.
--- This function returns a sequential table, meaning it should be looped with Global.ipairs instead of Global.pairs for efficiency reasons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindByClass)
---@param class string The class of the entities to find.
---@return table # A table containing all found entities
function ents.FindByClass(class) end

---[SHARED] Finds all entities that are of given class and are children of given entity. This works internally by iterating over ents.GetAll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindByClassAndParent)
---@param class string The class of entities to search for
---@param parent Entity Parent of entities that are being searched for
---@return table # A table of found entities or nil if none are found
function ents.FindByClassAndParent(class, parent) end

---[SHARED] Gets all entities with the given model, supports wildcards.
--- 	This works internally by iterating over ents.GetAll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindByModel)
---@param model string The model of the entities to find.
---@return table # A table of all found entities.
function ents.FindByModel(model) end

---[SHARED] Gets all entities with the given hammer targetname. This works internally by iterating over ents.GetAll.
---
--- Doesn't do anything on client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindByName)
---@param name string The targetname to look for
---@return table # A table of all found entities
function ents.FindByName(name) end

---[SHARED] Returns all entities within the specified box.
---
--- This internally uses a Spatial Partition to avoid looping through all entities.
---
--- Clientside entities will not be returned by this function.
---
--- There is a limit of 512 entities for the output!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindInBox)
---@param boxMins Vector The box minimum coordinates.
---@param boxMaxs Vector The box maximum coordinates.
---@return table # A table of all found entities.
function ents.FindInBox(boxMins, boxMaxs) end

---[SHARED] Finds and returns all entities within the specified cone. Only entities whose Entity:WorldSpaceCenter is within the cone are considered to be in it.
---
--- The "cone" is actually a conical "slice" of an axis-aligned box (see: ents.FindInBox). The image to the right shows approximately how this function would look in 2D. Due to this, the entity may be farther than the specified range!
---
---
---
--- Clientside entities will not be returned by this function.
---
--- If there are more than 512 entities in the axis-aligned box around the origin, then the result may be incomplete!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindInCone)
---@param origin Vector The tip of the cone.
---@param normal Vector Direction of the cone.
---@param range number The range of the cone/box around the origin.
---  The function internally adds 1 to this argument before using it.
---
---@param angle_cos number The math.cos of the angle between the center of the cone to its edges, which is half the overall angle of the cone.
---
--- 1 makes a 0° cone, 0.707 makes approximately 90°, 0 makes 180°, and so on.
---@return table # A table of all found Entitys.
function ents.FindInCone(origin, normal, range, angle_cos) end

---[SERVER] Finds all entities that lie within a [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community").
---
--- The function won't take in to account Global.AddOriginToPVS and the like.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindInPVS)
---@param viewPoint any Entity or Vector to find entities within the PVS of. If a player is given, this function will use the player's view entity.
---@return table # The found Entitys.
function ents.FindInPVS(viewPoint) end

---[SHARED] Gets all entities within the specified sphere.
---
---     This internally uses a Spatial Partition to avoid looping through all entities.
--- 	Clientside entities will not be returned by this function.
--- 	This function internally calls ents.FindInBox with some [radius checks](https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/public/collisionutils.cpp#L256-L301).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FindInSphere)
---@param origin Vector Center of the sphere.
---@param radius number Radius of the sphere.
---@return table # A table of all found Entitys. Has a limit of 1024 entities.
function ents.FindInSphere(origin, radius) end

---[SERVER] Fires a use event.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.FireTargets)
---@param target string Name of the target entity.
---@param activator Entity Activator of the event.
---@param caller Entity Caller of the event.
---@param usetype number Use type. See the Enums/USE.
---@param value number This value is passed to ENTITY:Use, but isn't used by any default entities in the engine.
function ents.FireTargets(target, activator, caller, usetype, value) end

---[SHARED] Returns a table of all existing entities.
---
--- Consider using ents.Iterator instead for better performance.
---
--- This function returns a sequential table, meaning it should be looped with Global.ipairs instead of Global.pairs for efficiency reasons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.GetAll)
---@return table # Table of all existing Entitys.
function ents.GetAll() end

---[SHARED] Returns an entity by its index. Same as Global.Entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.GetByIndex)
---@param entIdx number The index of the entity.
---@return Entity # The entity if it exists.
function ents.GetByIndex(entIdx) end

---[SHARED] Gives you the amount of currently existing entities.
---
--- Similar to **#**ents.GetAll() but with better performance since the entity table doesn't have to be generated. If ents.GetAll is already being called for iteration, than using the **#** operator on the table will be faster than calling this function since it is JITted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.GetCount)
---@param IncludeKillMe? boolean Include entities with the FL_KILLME flag. This will skip an internal loop, and the function will be more efficient as a byproduct.
---@return number # Number of entities
function ents.GetCount(IncludeKillMe) end

---[SERVER] Returns the amount of networked entities, which is limited to 8192. ents.Create will fail somewhere between 8064 and 8176 - this can vary based on the amount of existing temp ents.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.GetEdictCount)
---@return number # Number of networked entities
function ents.GetEdictCount() end

---[SHARED] Returns entity that has given Entity:MapCreationID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.GetMapCreatedEntity)
---@param id number Entity's creation id
---@return Entity # Found entity
function ents.GetMapCreatedEntity(id) end

---[SHARED] Returns a [Stateless Iterator](https://www.lua.org/pil/7.3.html) for all entities.
--- 		Intended for use in [Generic For Loops](https://www.lua.org/pil/4.3.5.html).
--- 		See player.Iterator for a similar function for all players.
---
--- 		Internally, this function uses cached values that exist entirely within lua, as opposed to ents.GetAll, which is a C++ function.
--- 		Because switching from lua to C++ (and vice versa) incurs a performance cost, this function will be somewhat more efficient than ents.GetAll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ents.Iterator)
---@return function # The Iterator Function from Global.ipairs
---@return table # Table of all existing Entity.  This is a cached copy of ents.GetAll
---@return number #  			The starting index for the table of players.   			This is always `0` and is returned for the benefit of [Generic For Loops](https://www.lua.org/pil/4.3.5.html)
function ents.Iterator() end
