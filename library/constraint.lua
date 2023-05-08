---@meta

constraint = {}

---[SERVER] Stores information about constraints in an entity's table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.AddConstraintTable)
---@param ent1 Entity The entity to store the information on.
---@param constrt Entity The constraint to store in the entity's table.
---@param ent2? Entity Optional. If different from `ent1`, the info will also be stored in the table for this entity.
---@param ent3? Entity Optional. Same as `ent2`.
---@param ent4? Entity Optional. Same as `ent2`.
function constraint.AddConstraintTable(ent1, constrt, ent2, ent3, ent4) end

---[SERVER] Stores info about the constraints on the entity's table. The only difference between this and constraint.AddConstraintTable is that the constraint does not get deleted when the entity is removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.AddConstraintTableNoDelete)
---@param ent1 Entity The entity to store the information on.
---@param constrt Entity The constraint to store in the entity's table.
---@param ent2? Entity Optional. If different from `ent1`, the info will also be stored in the table for this entity.
---@param ent3? Entity Optional. Same as `ent2`.
---@param ent4? Entity Optional. Same as `ent2`.
function constraint.AddConstraintTableNoDelete(ent1, constrt, ent2, ent3, ent4) end

---[SERVER] Creates an advanced ballsocket (ragdoll) constraint.
---
--- Uses a https://developer.valvesoftware.com/wiki/Phys_ragdollconstraint
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.AdvBallsocket)
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param LPos1 Vector Position on the first entity, in its local space coordinates.
---@param LPos2 Vector Position on the second entity, in its local space coordinates.
---@param forcelimit number Amount of force until it breaks (0 = unbreakable)
---@param torquelimit number Amount of torque (rotation speed) until it breaks (0 = unbreakable)
---@param xmin number Minimum angle in rotations around the X axis local to the constraint.
---@param ymin number Minimum angle in rotations around the Y axis local to the constraint.
---@param zmin number Minimum angle in rotations around the Z axis local to the constraint.
---@param xmax number Maximum angle in rotations around the X axis local to the constraint.
---@param ymax number Maximum angle in rotations around the Y axis local to the constraint.
---@param zmax number Maximum angle in rotations around the Z axis local to the constraint.
---@param xfric number Rotational friction in the X axis local to the constraint.
---@param yfric number Rotational friction in the Y axis local to the constraint.
---@param zfric number Rotational friction in the Z axis local to the constraint.
---@param onlyrotation number Only limit rotation, free movement.
---@param nocollide number Whether the entities should be no-collided.
---@return Entity #A phys_ragdollconstraint entity. Will return false if the constraint could not be created.
function constraint.AdvBallsocket(
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	forcelimit,
	torquelimit,
	xmin,
	ymin,
	zmin,
	xmax,
	ymax,
	zmax,
	xfric,
	yfric,
	zfric,
	onlyrotation,
	nocollide
)
end

---[SERVER] Creates an axis constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Axis)
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param LPos1 Vector Position on the first entity, in its local space coordinates.
---@param LPos2 Vector Position on the second entity, in its local space coordinates.
---@param forcelimit number Amount of force until it breaks (0 = unbreakable)
---@param torquelimit number Amount of torque (rotational force) until it breaks (0 = unbreakable)
---@param friction number Constraint friction.
---@param nocollide number Whether the entities should be no-collided.
---@param LocalAxis Vector If you include the LocalAxis then LPos2 will not be used in the final constraint. However, LPos2 is still a required argument.
---@param DontAddTable boolean Whether or not to add the constraint info on the entity table. See constraint.AddConstraintTable.
---@return Entity #Constraint. Will return false if the constraint could not be created.
function constraint.Axis(
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	forcelimit,
	torquelimit,
	friction,
	nocollide,
	LocalAxis,
	DontAddTable
)
end

---[SERVER] Creates a ballsocket joint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Ballsocket)
---@param Ent1 Entity First entity
---@param Ent2 Entity Second entity
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param LocalPos Vector Centerposition of the joint, relative to the **second** entity.
---@param forcelimit number Amount of force until it breaks (0 = unbreakable)
---@param torquelimit number Amount of torque (rotation speed) until it breaks (0 = unbreakable)
---@param nocollide number Whether the entities should be nocollided
---@return Entity #Constraint. Will return false if the constraint could not be created.
function constraint.Ballsocket(Ent1, Ent2, Bone1, Bone2, LocalPos, forcelimit, torquelimit, nocollide) end

---[SERVER] Basic checks to make sure that the specified entity and bone are valid. Returns false if we should not be constraining the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.CanConstrain)
---@param ent Entity The entity to check
---@param bone number The bone of the entity to check (use 0 for mono boned ents)
---@return boolean #shouldConstrain
function constraint.CanConstrain(ent, bone) end

---[SERVER] Creates a rope without any constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.CreateKeyframeRope)
---@param pos Vector Starting position of the rope.
---@param width number Width of the rope.
---@param material string Material of the rope.
---@param Constraint Entity Constraint for the rope.
---@param Ent1 Entity First entity.
---@param LPos1 Vector Position of first end of the rope. Local to Ent1.
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Ent2 Entity Second entity.
---@param LPos2 Vector Position of second end of the rope. Local to Ent2.
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param kv table (Optional) Any additional key/values to be set on the rope.
---@return Entity #rope
function constraint.CreateKeyframeRope(pos, width, material, Constraint, Ent1, LPos1, Bone1, Ent2, LPos2, Bone2, kv) end

---[SERVER] Creates an invisible, non-moveable anchor point in the world to which things can be attached.
--- 		The entity used internally by this function (`gmod_anchor`) only exists in Sandbox derived gamemodes, meaning this function will only work in these gamemodes.
---
--- 		To use this in other gamemodes, you may need to create your own [gmod_anchor](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/entities/entities/gmod_anchor.lua) entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.CreateStaticAnchorPoint)
---@param pos Vector The position to spawn the anchor at
---@return Entity, PhysObj, number, Vector #Entity - anchor
---@return Entity, PhysObj, number, Vector #PhysObj - physicsObject,
---@return Entity, PhysObj, number, Vector #number - bone
---@return Entity, PhysObj, number, Vector #Vector - LPos
function constraint.CreateStaticAnchorPoint(pos) end

---[SERVER] Creates an elastic constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Elastic)
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param LPos1 Vector Position of first end of the rope. Local to Ent1.
---@param LPos2 Vector Position of second end of the rope. Local to Ent2.
---@param constant number
---@param damping number
---@param rdamping number
---@param material string The material of the rope.
---@param width number Width of rope.
---@param stretchonly boolean
---@param color table The color of the rope. See Global.Color.
---@return Entity, Entity #Entity - Constraint. Will return false if the constraint could not be created.
---@return Entity, Entity #Entity - rope.  Will return nil if the constraint could not be created.
function constraint.Elastic(
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	constant,
	damping,
	rdamping,
	material,
	width,
	stretchonly,
	color
)
end

---[SERVER] Returns the constraint of a specified type between two entities, if it exists
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Find)
---@param ent1 Entity The first entity to check
---@param ent2 Entity The second entity to check
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@param bone1 number The bone number for the first entity (0 for monoboned entities)
---@param bone2 number The bone number for the second entity
---@return Entity #constraint
function constraint.Find(ent1, ent2, type, bone1, bone2) end

---[SERVER] Returns the first constraint of a specific type directly connected to the entity found
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.FindConstraint)
---@param ent Entity The entity to check
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@return table #The constraint table, set with constraint.AddConstraintTable
function constraint.FindConstraint(ent, type) end

---[SERVER] Returns the other entity involved in the first constraint of a specific type directly connected to the entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.FindConstraintEntity)
---@param ent Entity The entity to check
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@return Entity #The other entity.
function constraint.FindConstraintEntity(ent, type) end

---[SERVER] Returns a table of all constraints of a specific type directly connected to the entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.FindConstraints)
---@param ent Entity The entity to check
---@param type string The type of constraint, case sensitive. List of default constrains is as follows:
--- * `Weld`
--- * `Axis`
--- * `AdvBallsocket`
--- * `Rope`
--- * `Elastic`
--- * `NoCollide`
--- * `Motor`
--- * `Pulley`
--- * `Ballsocket`
--- * `Winch`
--- * `Hydraulic`
--- * `Muscle`
--- * `Keepupright`
--- * `Slider`
---@return table #All the constraints of this entity.
function constraint.FindConstraints(ent, type) end

---[SERVER] Make this entity forget any constraints it knows about. Note that this will not actually remove the constraints.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.ForgetConstraints)
---@param ent Entity The entity that will forget its constraints.
function constraint.ForgetConstraints(ent) end

---[SERVER] Returns a table of all entities recursively constrained to an entitiy.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.GetAllConstrainedEntities)
---@param ent Entity The entity to check
---@param ResultTable? table Table used to return result. Optional.
---@return table #A table containing all of the constrained entities. This includes all entities constrained to entities constrained to the supplied entity, etc.
function constraint.GetAllConstrainedEntities(ent, ResultTable) end

---[SERVER] Returns a table of all constraints directly connected to the entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.GetTable)
---@param ent Entity The entity to check
---@return table #A list of all constraints connected to the entity.
function constraint.GetTable(ent) end

---[SERVER] Returns true if the entity has constraints attached to it
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.HasConstraints)
---@param ent Entity The entity to check
---@return boolean #Whether the entity has any constraints or not.
function constraint.HasConstraints(ent) end

---[SERVER] Creates a Hydraulic constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Hydraulic)
---@param pl Player The player that will be used to call numpad.OnDown.
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls),
---@param Bone2 number Bone of second entity (0 for non-ragdolls).
---@param LPos1 Vector
---@param LPos2 Vector
---@param Length1 number
---@param Length2 number
---@param width number The width of the rope.
---@param key number The key binding, corresponding to an Enums/KEY
---@param fixed number Whether the hydraulic is fixed.
---@param speed number
---@param material string The material of the rope.
---@param color table The color of the rope. See Global.Color.
---@return Entity, Entity, Entity, Entity #Entity - Constraint. Will return false if the constraint could not be created.
---@return Entity, Entity, Entity, Entity #Entity - rope. Will return nil if the constraint could not be created.
---@return Entity, Entity, Entity, Entity #Entity - controller. Can return nil depending on how the constraint was created. Will return nil if the constraint could not be created.
---@return Entity, Entity, Entity, Entity #Entity - slider. Can return nil depending on how the constraint was created. Will return nil if the constraint could not be created.
function constraint.Hydraulic(
	pl,
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	Length1,
	Length2,
	width,
	key,
	fixed,
	speed,
	material,
	color
)
end

---[SERVER] Creates a keep upright constraint.
---
--- This function only works on prop_physics or prop_ragdoll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Keepupright)
---@param ent Entity The entity to keep upright
---@param ang Angle The angle defined as "upright"
---@param bone number The bone of the entity to constrain (0 for boneless)
---@param angularLimit number Basically, the strength of the constraint
---@return Entity #The created constraint, if any or false if the constraint failed to set
function constraint.Keepupright(ent, ang, bone, angularLimit) end

---[SERVER] Creates a motor constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Motor)
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param LPos1 Vector
---@param LPos2 Vector
---@param friction number
---@param torque number
---@param forcetime number
---@param nocollide number Whether the entities should be no-collided.
---@param toggle number Whether the constraint is on toggle.
---@param pl Player The player that will be used to call numpad.OnDown and numpad.OnUp.
---@param forcelimit number Amount of force until it breaks (0 = unbreakable)
---@param numpadkey_fwd number The key binding for "forward", corresponding to an Enums/KEY
---@param numpadkey_bwd number The key binding for "backwards", corresponding to an Enums/KEY
---@param direction number
---@param LocalAxis Vector
---@return Entity, Entity #Entity - Constraint. Will return false if the constraint could not be created.
---@return Entity, Entity #Entity - axis. Will return nil if the constraint could not be created.
function constraint.Motor(
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	friction,
	torque,
	forcetime,
	nocollide,
	toggle,
	pl,
	forcelimit,
	numpadkey_fwd,
	numpadkey_bwd,
	direction,
	LocalAxis
)
end

---[SERVER] Creates a muscle constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Muscle)
---@param pl Player The player that will be used to call numpad.OnDown.
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param LPos1 Vector
---@param LPos2 Vector
---@param Length1 number
---@param Length2 number
---@param width number Width of the rope.
---@param key number The key binding, corresponding to an Enums/KEY
---@param fixed number Whether the constraint is fixed.
---@param period number
---@param amplitude number
---@param starton boolean
---@param material string Material of the rope.
---@param color table The color of the rope. See Global.Color.
---@return Entity, Entity, Entity, Entity #Entity - Constraint. Will return false if the constraint could not be created.
---@return Entity, Entity, Entity, Entity #Entity - rope. Will return nil if the constraint could not be created.
---@return Entity, Entity, Entity, Entity #Entity - controller. Will return nil if the constraint could not be created.
---@return Entity, Entity, Entity, Entity #Entity - slider. Will return nil if the fixed argument is not 1 or if the constraint could not be created.
function constraint.Muscle(
	pl,
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	Length1,
	Length2,
	width,
	key,
	fixed,
	period,
	amplitude,
	starton,
	material,
	color
)
end

---[SERVER] Creates an no-collide "constraint". Disables collision between two entities.
--- Does not work with players.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.NoCollide)
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls).
---@param Bone2 number Bone of second entity (0 for non-ragdolls).
---@return Entity #Constraint. Will return false if the constraint could not be created.
function constraint.NoCollide(Ent1, Ent2, Bone1, Bone2) end

---[SERVER] Creates a pulley constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Pulley)
---@param Ent1 Entity
---@param Ent4 Entity
---@param Bone1 number
---@param Bone4 number
---@param LPos1 Vector
---@param LPos4 Vector
---@param WPos2 Vector
---@param WPos3 Vector
---@param forcelimit number Amount of force until it breaks (0 = unbreakable)
---@param rigid boolean Whether the constraint is rigid.
---@param width number Width of the rope.
---@param material string Material of the rope.
---@param color table The color of the rope. See Global.Color.
---@return Entity #Constraint. Will return false if the constraint could not be created.
function constraint.Pulley(
	Ent1,
	Ent4,
	Bone1,
	Bone4,
	LPos1,
	LPos4,
	WPos2,
	WPos3,
	forcelimit,
	rigid,
	width,
	material,
	color
)
end

---[SERVER] Attempts to remove all constraints associated with an entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.RemoveAll)
---@param ent Entity The entity to remove constraints from
---@return boolean, number #boolean - Whether any constraints were removed
---@return boolean, number #number - Number of constraints removed
function constraint.RemoveAll(ent) end

---[SERVER] Attempts to remove all constraints of a specified type associated with an entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.RemoveConstraints)
---@param ent Entity The entity to check
---@param type string The constraint type to remove (eg. "Weld", "Elastic", "NoCollide")
---@return boolean, number #boolean - Whether we removed any constraints or not
---@return boolean, number #number - The amount of constraints removed
function constraint.RemoveConstraints(ent, type) end

---[SERVER] Creates a rope constraint - with rope!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Rope)
---@param Ent1 Entity First entity
---@param Ent2 Entity Second entity
---@param Bone1 number Bone of first entity (0 for non-ragdolls)
---@param Bone2 number Bone of second entity (0 for non-ragdolls)
---@param LPos1 Vector Position of first end of the rope. Local to Ent1.
---@param LPos2 Vector Position of second end of the rope. Local to Ent2.
---@param length number Length of the rope.
---@param addlength number Amount to add to the length of the rope. Works as it does in the Rope tool.
---@param forcelimit number Amount of force until it breaks (0 = unbreakable).
---@param width number Width of the rope.
---@param material string Material of the rope.
---@param rigid boolean Whether the constraint is rigid.
---@param color table The color of the rope. See Global.Color.
---@return Entity, Entity #Entity - Constraint. Will be a keyframe_rope if you roping to the same bone on the same entity. Will return false if the constraint could not be created.
---@return Entity, Entity #Entity - rope. Will return nil if "Constraint" is a keyframe_rope or if the constraint could not be created.
function constraint.Rope(
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	length,
	addlength,
	forcelimit,
	width,
	material,
	rigid,
	color
)
end

---[SERVER] Creates a slider constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Slider)
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls),
---@param Bone2 number Bone of second entity (0 for non-ragdolls).
---@param LPos1 Vector
---@param LPos2 Vector
---@param width number The width of the rope.
---@param material string The material of the rope.
---@param color table The color of the rope. See Global.Color.
---@return Entity, Entity #Entity - Constraint. Will return false if the constraint could not be created.
---@return Entity, Entity #Entity - rope. Will return nil if the constraint could not be created.
function constraint.Slider(Ent1, Ent2, Bone1, Bone2, LPos1, LPos2, width, material, color) end

---[SERVER] Creates a weld constraint
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Weld)
---@param ent1 Entity The first entity
---@param ent2 Entity The second entity
---@param bone1 number The bonenumber of the first entity (0 for monoboned entities)
---
--- PhysObj number for ragdolls, see: Entity:TranslateBoneToPhysBone.
---@param bone2 number The bonenumber of the second entity
---@param forcelimit number The amount of force appliable to the constraint before it will break (0 is never)
---@param nocollide boolean Should ent1 be nocollided to ent2 via this constraint
---@param deleteent1onbreak boolean If true, when ent2 is removed, ent1 will also be removed
---@return Entity #constraint
function constraint.Weld(ent1, ent2, bone1, bone2, forcelimit, nocollide, deleteent1onbreak) end

---[SERVER] Creates a Winch constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/constraint.Winch)
---@param pl Player The player that will be used to call numpad.OnDown and numpad.OnUp.
---@param Ent1 Entity First entity.
---@param Ent2 Entity Second entity.
---@param Bone1 number Bone of first entity (0 for non-ragdolls),
---@param Bone2 number Bone of second entity (0 for non-ragdolls).
---@param LPos1 Vector
---@param LPos2 Vector
---@param width number The width of the rope.
---@param fwd_bind number The key binding for "forward", corresponding to an Enums/KEY
---@param bwd_bind number The key binding for "backwards", corresponding to an Enums/KEY
---@param fwd_speed number Forward speed.
---@param bwd_speed number Backwards speed.
---@param material string The material of the rope.
---@param toggle boolean Whether the winch should be on toggle.
---@param color table The color of the rope. See Global.Color.
---@return Entity, Entity, Entity #Entity - Constraint. Can return nil. Will return false if the constraint could not be created.
---@return Entity, Entity, Entity #Entity - rope. Will return nil if the constraint could not be created.
---@return Entity, Entity, Entity #Entity - controller. Can return nil.
function constraint.Winch(
	pl,
	Ent1,
	Ent2,
	Bone1,
	Bone2,
	LPos1,
	LPos2,
	width,
	fwd_bind,
	bwd_bind,
	fwd_speed,
	bwd_speed,
	material,
	toggle,
	color
)
end
