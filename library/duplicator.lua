---@meta

--- The duplicator library allows you to specify what should be saved when someone attempts to duplicate your custom entity with the duplicator tool. It can also be used by 3rd party duplicator tools to make use of the built in system.
duplicator = {}

---[SHARED] Allow entities with given class name to be duplicated. See duplicator.Disallow for the opposite effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.Allow)
---@param classname string An entity's classname to allow duplicating.
function duplicator.Allow(classname) end

---[SERVER] Calls every function registered with duplicator.RegisterBoneModifier on each bone the ent has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.ApplyBoneModifiers)
---@param ply Player The player whose entity this is
---@param ent Entity The entity in question
function duplicator.ApplyBoneModifiers(ply, ent) end

---[SERVER] Calls every function registered with duplicator.RegisterEntityModifier on the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.ApplyEntityModifiers)
---@param ply Player The player whose entity this is
---@param ent Entity The entity in question
function duplicator.ApplyEntityModifiers(ply, ent) end

---[SERVER] Clears/removes the chosen entity modifier from the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.ClearEntityModifier)
---@param ent Entity The entity the modification is stored on
---@param key any The key of the stored entity modifier
function duplicator.ClearEntityModifier(ent, key) end

---[SERVER] Copies the entity, and all of its constraints and entities, then returns them in a table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.Copy)
---@param ent Entity The entity to duplicate. The function will automatically copy all constrained entities.
---@param tableToAdd? table A preexisting table to add entities and constraints in from.
--- Uses the same table format as the table returned from this function.
---@return table # A table containing duplication info which includes the following members: * table Entities * table Constraints * Vector Mins * Vector Maxs  The values of Mins & Maxs from the table are returned from duplicator.WorkoutSize
function duplicator.Copy(ent, tableToAdd) end

---[SERVER] Copies the passed table of entities to save for later.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.CopyEnts)
---@param ents table A table of entities to save/copy.
---@return table # A table containing duplication info which includes the following members: * table Entities * table Constraints * Vector Mins * Vector Maxs
function duplicator.CopyEnts(ents) end

---[SERVER] Returns a table with some entity data that can be used to create a new entity with duplicator.CreateEntityFromTable
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.CopyEntTable)
---@param ent Entity The entity table to save
---@return table # See Structures/EntityCopyData
function duplicator.CopyEntTable(ent) end

---[SERVER] Creates a constraint from a saved/copied constraint table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.CreateConstraintFromTable)
---@param constraint table Saved/copied constraint table
---@param entityList table The list of entities that are to be constrained
---@return Entity # The newly created constraint entity
function duplicator.CreateConstraintFromTable(constraint, entityList) end

---[SERVER] "Create an entity from a table."
---
---
--- This creates an entity using the data in EntTable.
---
---
--- If an entity factory has been registered for the entity's Class, it will be called.
---
---
--- Otherwise, duplicator.GenericDuplicatorFunction will be called instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.CreateEntityFromTable)
---@param ply Player The player who wants to create something
---@param entTable table The duplication data to build the entity with. See Structures/EntityCopyData
---@return Entity # The newly created entity
function duplicator.CreateEntityFromTable(ply, entTable) end

---[SHARED] Disallow this entity to be duplicated. Opposite of duplicator.Allow.
---
--- By default, all classes are disallowed to be duplicated. This function is useful for temporarily disabling duplication of certain entity classes that may have been previously allowed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.Disallow)
---@param classname string An entity's classname to disallow duplicating.
function duplicator.Disallow(classname) end

---[SERVER] "Restores the bone's data."
---
---
--- Loops through Bones and calls Entity:ManipulateBoneScale, Entity:ManipulateBoneAngles and Entity:ManipulateBonePosition on ent with the table keys and the subtable values s, a and p respectively.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.DoBoneManipulator)
---@param ent Entity The entity to be bone manipulated
---@param bones table Table with a Structures/BoneManipulationData for every bone (that has manipulations applied) using the bone ID as the table index.
function duplicator.DoBoneManipulator(ent, bones) end

---[SERVER] Restores the flex data using Entity:SetFlexWeight and Entity:SetFlexScale
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.DoFlex)
---@param ent Entity The entity to restore the flexes on
---@param flex table The flexes to restore
---@param scale? number The flex scale to apply. (Flex scale is unchanged if omitted)
function duplicator.DoFlex(ent, flex, scale) end

---[SERVER] "Applies generic every-day entity stuff for ent from table data."
---
---
--- Depending on the values of Model, Angle, Pos, Skin, Flex, Bonemanip, ModelScale, ColGroup, Name, and BodyG (table of multiple values) in the data table, this calls Entity:SetModel, Entity:SetAngles, Entity:SetPos, Entity:SetSkin, duplicator.DoFlex, duplicator.DoBoneManipulator, Entity:SetModelScale, Entity:SetCollisionGroup, Entity:SetName, Entity:SetBodygroup on ent.
---
---
--- If ent has a RestoreNetworkVars function, it is called with data.DT.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.DoGeneric)
---@param ent Entity The entity to be applied upon
---@param data table The data to be applied onto the entity
function duplicator.DoGeneric(ent, data) end

---[SERVER] "Applies bone data, generically."
---
---
--- If data contains a PhysicsObjects table, it moves, re-angles and if relevent freezes all specified bones, first converting from local coordinates to world coordinates.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.DoGenericPhysics)
---@param ent Entity The entity to be applied upon
---@param ply? Player The player who owns the entity. Unused in function as of early 2013
---@param data table The data to be applied onto the entity
function duplicator.DoGenericPhysics(ent, ply, data) end

---[SHARED] Checks the given duplication table and tries to figure out any addons that might be required to correctly spawn the duplication. Currently this is limited to models and material overrides saved in the duplication.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.FigureOutRequiredAddons)
---@param dupe table The duplication table to process, for example from duplicator.Copy.
---
--- The provided table will have `RequiredAddons` key added.
---
function duplicator.FigureOutRequiredAddons(dupe) end

---[SHARED] Returns the entity class factory registered with duplicator.RegisterEntityClass.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.FindEntityClass)
---@param name string The name of the entity class factory
---@return table # Is compromised of the following members: * function Func - The function that creates the entity * table Args - Arguments to pass to the function
function duplicator.FindEntityClass(name) end

---[SERVER] "Generic function for duplicating stuff"
---
---
--- This is called when duplicator.CreateEntityFromTable can't find an entity factory to build with. It calls duplicator.DoGeneric and duplicator.DoGenericPhysics to apply standard duplicator stored things such as the model and position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.GenericDuplicatorFunction)
---@param ply Player The player who wants to create something
---@param data table The duplication data to build the entity with
---@return Entity # The newly created entity
function duplicator.GenericDuplicatorFunction(ply, data) end

---[SERVER] Fills entStorageTable with all of the entities in a group connected with constraints. Fills constraintStorageTable with all of the constrains constraining the group.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.GetAllConstrainedEntitiesAndConstraints)
---@param ent Entity The entity to start from
---@param entStorageTable table The table the entities will be inserted into
---@param constraintStorageTable table The table the constraints will be inserted into
---@return table # entStorageTable
---@return table # constraintStorageTable
function duplicator.GetAllConstrainedEntitiesAndConstraints(ent, entStorageTable, constraintStorageTable) end

---[SHARED] Returns whether the entity can be duplicated or not
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.IsAllowed)
---@param classname string An entity's classname
---@return boolean # Returns true if the entity can be duplicated (nil otherwise)
function duplicator.IsAllowed(classname) end

---[SERVER] "Given entity list and constraint list, create all entities and return their tables"
---
--- Calls duplicator.CreateEntityFromTable on each sub-table of EntityList. If an entity is actually created, it calls ENTITY:OnDuplicated with the entity's duplicator data, then duplicator.ApplyEntityModifiers, duplicator.ApplyBoneModifiers and finally  ENTITY:PostEntityPaste is called.
---
--- The constraints are then created with duplicator.CreateConstraintFromTable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.Paste)
---@param Player Player The player who wants to create something
---@param EntityList table A table of duplicator data to create the entities from
---@param ConstraintList table A table of duplicator data to create the constraints from
---@return table # List of created entities
---@return table # List of created constraints
function duplicator.Paste(Player, EntityList, ConstraintList) end

---[SHARED] Registers a function to be called on each of an entity's bones when duplicator.ApplyBoneModifiers is called.
---
--- This function is available to call on the client, but registered functions aren't used anywhere!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.RegisterBoneModifier)
---@param key any The type of the key doesn't appear to matter, but it is preferable to use a string.
---@param boneModifier fun(ply: Player, ent: Entity, boneID: number, bone: PhysObj, data: table) Function called on each bone that an ent has. Called during duplicator.ApplyBoneModifiers.
--- Function parameters are:
--- * Player ply
--- * Entity ent
--- * number boneID
--- * PhysObj bone
--- * table data
---
---
--- The data table that is passed to boneModifier is set with duplicator.StoreBoneModifier
function duplicator.RegisterBoneModifier(key, boneModifier) end

---[SHARED] Register a function used for creating a duplicated constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.RegisterConstraint)
---@param name string The unique name of new constraint
---@param callback function Function to be called when this constraint is created
---@param ... any Arguments passed to the callback function
function duplicator.RegisterConstraint(name, callback, ...) end

---[SHARED] This allows you to specify a specific function to be run when your SENT is pasted with the duplicator, instead of relying on the generic automatic functions.
---
--- Automatically calls duplicator.Allow for the entity class.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.RegisterEntityClass)
---@param name string The ClassName of the entity you wish to register a factory for
---@param _function fun(ply: Player, ...) The factory function you want to have called. It should have the arguments (Player, ...) where ... is whatever arguments you request to be passed. It also should return the entity created, otherwise duplicator.Paste result will not include it!
---@param ... any Strings of the names of arguments you want passed to function the from the Structures/EntityCopyData. As a special case, "Data" will pass the whole structure.
function duplicator.RegisterEntityClass(name, _function, ...) end

---[SHARED] This allows you to register tweaks to entities. For instance, if you were making an "unbreakable" addon, you would use this to enable saving the "unbreakable" state of entities between duplications.
---
--- This function registers a piece of generic code that is run on all entities with this modifier. In order to have it actually run, use duplicator.StoreEntityModifier.
---
--- This function does nothing when run clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.RegisterEntityModifier)
---@param name string An identifier for your modification. This is not limited, so be verbose. `Person's 'Unbreakable' mod` is far less likely to cause conflicts than `unbreakable`
---@param func fun(ply: Player, ent: Entity, data: table) The function to be called for your modification. It should have the arguments (`Player`, `Entity`, `Data`), where data is what you pass to duplicator.StoreEntityModifier.
function duplicator.RegisterEntityModifier(name, func) end

---[SERVER] Help to remove certain map created entities before creating the saved entities
--- This is obviously so we don't get duplicate props everywhere.
--- It should be called before calling Paste.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.RemoveMapCreatedEntities)
function duplicator.RemoveMapCreatedEntities() end

---[SHARED] "When a copy is copied it will be translated according to these.
--- If you set them - make sure to set them back to 0 0 0!"
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.SetLocalAng)
---@param v Angle The angle to offset all pastes from
function duplicator.SetLocalAng(v) end

---[SHARED] "When a copy is copied it will be translated according to these.
--- If you set them - make sure to set them back to 0 0 0!"
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.SetLocalPos)
---@param v Vector The position to offset all pastes from
function duplicator.SetLocalPos(v) end

---[SERVER] Stores bone mod data for a registered bone modification function
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.StoreBoneModifier)
---@param ent Entity The entity to add bone mod data to
---@param boneID number The bone ID.
--- See Entity:GetPhysicsObjectNum
---@param key any The key for the bone modification
---@param data table The bone modification data that is passed to the bone modification function
function duplicator.StoreBoneModifier(ent, boneID, key, data) end

---[SERVER] Stores an entity modifier into an entity for saving
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.StoreEntityModifier)
---@param entity Entity The entity to store modifier in
---@param name string Unique modifier name as defined in duplicator.RegisterEntityModifier
---@param data table Modifier data
function duplicator.StoreEntityModifier(entity, name, data) end

---[SERVER] Works out the AABB size of the duplication
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.WorkoutSize)
---@param Ents table A table of entity duplication datums.
---@return vector # AABB mins vector
---@return vector # AABB maxs vector
function duplicator.WorkoutSize(Ents) end
