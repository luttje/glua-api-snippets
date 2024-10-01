---@meta

--- This is a list of all available methods for all entities, which includes [Players](https://wiki.facepunch.com/gmod/Player), [Weapons](https://wiki.facepunch.com/gmod/Weapon), [NPCs](https://wiki.facepunch.com/gmod/NPC) and [Vehicles](https://wiki.facepunch.com/gmod/Vehicle).
---
--- For a list of possible members of [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities) see [ENT Structure](https://wiki.facepunch.com/gmod/Structures/ENT)
---
---@class Entity
local Entity = {}

---
--- A list of hooks **only** available for [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities).
---
--- The exceptions to this rule are documented at [Custom Entity Fields](https://wiki.facepunch.com/gmod/Custom Entity Fields), which can be applied to all entities.
---
--- Some more "hooks" are available for all entities (including engine entities) with the function [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback).
---
--- See also: [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT)
---
--- **NOTE**: The hooks listed here are also dependent on the scripted entity type. For instance, a base scripted entity will not use [ENTITY:DoSchedule](https://wiki.facepunch.com/gmod/ENTITY:DoSchedule) at all, that is only for scripted NPCs
---
---
---@class ENTITY : Entity
ENTITY = {}

---[SERVER] Called when another entity fires an event to this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:AcceptInput)
---@param inputName string The name of the input that was triggered.
---@param activator Entity The initial cause for the input getting triggered. (EG the player who pushed a button)
---@param caller Entity The entity that directly triggered the input. (EG the button that was pushed)
---@param data string The data passed.
---@return boolean # Should we suppress the default action for this input?
function ENTITY:AcceptInput(inputName, activator, caller, data) end

---[SHARED] Activates the entity. This needs to be used on some entities (like constraints) after being spawned.
---
--- **NOTE**: For some entity types when this function is used after [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale), the physics object will be recreated with the new scale. [Source-sdk-2013](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/baseanimating.cpp#L321-L327).
---
--- Calling this method after [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale) will recreate a new scaled `SOLID_VPHYSICS` [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) on scripted entities. This can be a problem if you made a properly scaled [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) of another kind (using [Entity:PhysicsInitSphere](https://wiki.facepunch.com/gmod/Entity:PhysicsInitSphere) for instance) or if you edited the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)'s properties. This is especially the behavior of the Sandbox spawn menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Activate)
function Entity:Activate() end

---[SHARED] Add a callback function to a specific event. This is used instead of hooks to avoid calling empty functions unnecessarily.
---
--- This also allows you to use certain hooks in engine entities (non-scripted entities).
---
--- **WARNING**: This method does not check if the function has already been added to this object before, so if you add the same callback twice, it will be run twice! Make sure to add your callback only once.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddCallback)
---@param hook string The hook name to hook onto. See Entity Callbacks
---@param func function The function to call. It's arguments and return values will depend on the hook specified in the first argument.
---@return number # The callback ID that was just added, which can later be used in Entity:RemoveCallback.
---
--- Returns nothing if the passed callback function was invalid or when asking for a non-existent hook.
function Entity:AddCallback(hook, func) end

---[SHARED] Applies an engine effect to an entity.
---
--- See also [Entity:IsEffectActive](https://wiki.facepunch.com/gmod/Entity:IsEffectActive) and  [Entity:RemoveEffects](https://wiki.facepunch.com/gmod/Entity:RemoveEffects).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddEffects)
---@param effect number The effect to apply, see Enums/EF.
function Entity:AddEffects(effect) end

---[SHARED] Adds engine flags.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddEFlags)
---@param flag number Engine flag to add, see Enums/EFL
function Entity:AddEFlags(flag) end

---[SHARED] Adds flags to the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddFlags)
---@param flag number Flag to add, see Enums/FL
function Entity:AddFlags(flag) end

---[SERVER] Adds a gesture animation to the entity and plays it.
---
--- See [Entity:AddGestureSequence](https://wiki.facepunch.com/gmod/Entity:AddGestureSequence) and [Entity:AddLayeredSequence](https://wiki.facepunch.com/gmod/Entity:AddLayeredSequence) for functions that takes sequences instead of [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddGesture)
---@param activity number The activity to play as the gesture. See Enums/ACT.
---@param autokill? boolean
---@return number # Layer ID of the started gesture, used to manipulate the played gesture by other functions.
function Entity:AddGesture(activity, autokill) end

---[SERVER] Adds a gesture animation to the entity and plays it.
---
--- See [Entity:AddGesture](https://wiki.facepunch.com/gmod/Entity:AddGesture) for a function that takes [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT).
---
--- See also [Entity:AddLayeredSequence](https://wiki.facepunch.com/gmod/Entity:AddLayeredSequence).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddGestureSequence)
---@param sequence number The sequence ID to play as the gesture. See Entity:LookupSequence.
---@param autokill? boolean
---@return number # Layer ID of the started gesture, used to manipulate the played gesture by other functions.
function Entity:AddGestureSequence(sequence, autokill) end

---[SERVER] Adds a gesture animation to the entity and plays it.
---
--- See [Entity:AddGestureSequence](https://wiki.facepunch.com/gmod/Entity:AddGestureSequence) for a function that doesn't take priority.
---
--- See [Entity:AddGesture](https://wiki.facepunch.com/gmod/Entity:AddGesture) for a function that takes [Enums/ACT](https://wiki.facepunch.com/gmod/Enums/ACT).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddLayeredSequence)
---@param sequence number The sequence ID to play as the gesture. See Entity:LookupSequence.
---@param priority number
---@return number # Layer ID of created layer
function Entity:AddLayeredSequence(sequence, priority) end

---[SERVER] A helper function for creating [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities).
---
--- Similar to [ENTITY:AddOutputFromKeyValue](https://wiki.facepunch.com/gmod/ENTITY:AddOutputFromKeyValue), call it from [ENTITY:AcceptInput](https://wiki.facepunch.com/gmod/ENTITY:AcceptInput) and it'll return true if it successfully added an output from the passed input data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:AddOutputFromAcceptInput)
---@param name string The input name from ENTITY:AcceptInput.
---@param data string The input data from ENTITY:AcceptInput.
---@return boolean # Whether any outputs were added or not.
function ENTITY:AddOutputFromAcceptInput(name, data) end

---[SERVER] A helper function for creating [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities).
---
--- Call it from [ENTITY:KeyValue](https://wiki.facepunch.com/gmod/ENTITY:KeyValue) and it'll return true if it successfully added an output from the passed KV pair.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:AddOutputFromKeyValue)
---@param key string The key-value key.
---@param value string The key-value value.
---@return boolean # Whether any outputs were added or not.
function ENTITY:AddOutputFromKeyValue(key, value) end

---[SHARED] Adds solid flag(s) to the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddSolidFlags)
---@param flags number The flag(s) to apply, see Enums/FSOLID.
function Entity:AddSolidFlags(flags) end

---[SHARED] Adds a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect to the entity's motion controller so that [ENTITY:PhysicsSimulate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate) will be called for given [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect as well.
---
--- You must first create a motion controller with [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController).
---
--- You can remove added [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects by using [Entity:RemoveFromMotionController](https://wiki.facepunch.com/gmod/Entity:RemoveFromMotionController).
---
--- **NOTE**: Only works on a scripted [Entity](https://wiki.facepunch.com/gmod/Entity) of anim type
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AddToMotionController)
---@param physObj PhysObj The PhysObj to add to the motion controller.
function Entity:AddToMotionController(physObj) end

---[SHARED] Returns an angle based on the ones inputted that you can use to align an object.
---
--- **NOTE**: This function doesn't change the angle of the entity on its own (see example).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:AlignAngles)
---@param from Angle The angle you want to align from
---@param to Angle The angle you want to align to
---@return Angle # The resulting aligned angle
function Entity:AlignAngles(from, to) end

---[CLIENT] Spawns a clientside ragdoll for the entity, positioning it in place of the original entity, and makes the entity invisible. It doesn't preserve flex values (face posing) as CSRagdolls don't support flex.
---
--- It does not work on players. Use [Player:CreateRagdoll](https://wiki.facepunch.com/gmod/Player:CreateRagdoll) instead.
---
--- The original entity is not removed, and neither are any ragdolls previously generated with this function.
---
--- To make the entity re-appear, run [Entity:SetNoDraw](https://wiki.facepunch.com/gmod/Entity:SetNoDraw)( false )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:BecomeRagdollOnClient)
---@return Entity # The created ragdoll. (class C_ClientRagdoll])
function Entity:BecomeRagdollOnClient() end

---[CLIENT] Returns true if the entity is being looked at by the local player and is within 256 units of distance.
---
--- **NOTE**: This function is only available in entities that are based off of sandbox's base_gmodentity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:BeingLookedAtByLocalPlayer)
---@return boolean # Is the entity being looked at by the local player and within 256 units.
function Entity:BeingLookedAtByLocalPlayer() end

---[SERVER] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Dispatches blocked events to this entity's blocked handler. This function is only useful when interacting with entities like func_movelinear.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Blocked)
---@param entity Entity The entity that is blocking us
function Entity:Blocked(entity) end

---[SERVER] Returns a centered vector of this entity, NPCs use this internally to aim at their targets.
---
--- **NOTE**: This only works on players and NPCs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:BodyTarget)
---@param origin Vector The vector of where the the attack comes from.
---@param noisy? boolean Decides if it should return the centered vector with a random offset to it.
---@return Vector # The centered vector.
function Entity:BodyTarget(origin, noisy) end

---[SHARED] Returns whether the entity's bone has the flag or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:BoneHasFlag)
---@param boneID number Bone ID to test flag of.
---@param flag number The flag to test, see Enums/BONE
---@return boolean # Whether the bone has that flag or not
function Entity:BoneHasFlag(boneID, flag) end

---[SHARED] Returns the length between given bone's position and the position of given bone's parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:BoneLength)
---@param boneID number The ID of the bone you want the length of. You may want to get the length of the next bone ( boneID + 1 ) for decent results
---@return number # The length of the bone
function Entity:BoneLength(boneID) end

---[SHARED] Returns the distance between the center of the bounding box and the furthest bounding box corner.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:BoundingRadius)
---@return number # The radius of the bounding box.
function Entity:BoundingRadius() end

---[SHARED] Called whenever the entity's position changes. A callback for when an entity's angle changes is available via [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback).
---
--- Like [ENTITY:RenderOverride](https://wiki.facepunch.com/gmod/ENTITY:RenderOverride), this hook works on any entity (scripted or not) it is applied on.
---
--- **NOTE**: If EFL_DIRTY_ABSTRANSFORM is set on the entity, this will be called serverside only; otherwise, this will be called clientside only. This means serverside calls of [Entity:SetPos](https://wiki.facepunch.com/gmod/Entity:SetPos) without the EFL_DIRTY_ABSTRANSFORM flag enabled (most cases) will be called clientside only.
---
--- **NOTE**: The give concommand will call this hook serverside only upon entity spawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:CalcAbsolutePosition)
---@param pos Vector The entity's actual position. May differ from Entity:GetPos
---@param ang Angle The entity's actual angles. May differ from Entity:GetAngles
---@return Vector # New position
---@return Angle # New angles
function ENTITY:CalcAbsolutePosition(pos, ang) end

---[SHARED] Calls all [Entity:NetworkVarNotify](https://wiki.facepunch.com/gmod/Entity:NetworkVarNotify) functions with the given new value, but doesn't change the real value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:CallDTVarProxies)
---@param Type string The NetworkVar Type.
--- * `String`
--- * `Bool`
--- * `Float`
--- * `Int` (32-bit signed integer)
--- * `Vector`
--- * `Angle`
--- * `Entity`
---@param index number The NetworkVar index.
---@param newValue any The new value.
function Entity:CallDTVarProxies(Type, index, newValue) end

---[SHARED] Causes a specified function to be run if the entity is removed by any means. This can later be undone by [Entity:RemoveCallOnRemove](https://wiki.facepunch.com/gmod/Entity:RemoveCallOnRemove) if you need it to not run.
---
--- **WARNING**: This hook is called clientside during full updates. See [GM:EntityRemoved](https://wiki.facepunch.com/gmod/GM:EntityRemoved) for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:CallOnRemove)
---@param identifier string Identifier that can be optionally used with Entity:RemoveCallOnRemove to undo this call on remove.
---@param removeFunc fun(ent: Entity, ...: any) Function to be called on remove.
---
--- Function argument(s):
--- * Entity `ent` - The entity about to be removed.
--- * vararg `data` - Data passed from the arguments to `CallOnRemove`.
---@param ... any Optional arguments to pass to removeFunc. Do note that the first argument passed to the function will always be the entity being removed, and the arguments passed on here start after that.
function Entity:CallOnRemove(identifier, removeFunc, ...) end

---[SHARED] Controls if a property can be used on this entity or not.
---
--- This hook will only work in Sandbox derived gamemodes that do not have [SANDBOX:CanProperty](https://wiki.facepunch.com/gmod/SANDBOX:CanProperty) overridden.
---
--- **NOTE**: This hook will work on ALL entities, not just the scripted ones (SENTs)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:CanProperty)
---@param ply Player Player, that tried to use the property
---@param property string Class of the property that is tried to use, for example - bonemanipulate
---@return boolean # Return false to disallow using that property, return true to allow.
---
--- You must return a value. Not returning anything can cause unexpected results.
function ENTITY:CanProperty(ply, property) end

---[SHARED] Controls if a tool can be used on this entity or not.
---
--- This hook will only work in Sandbox derived gamemodes that do not have [SANDBOX:CanTool](https://wiki.facepunch.com/gmod/SANDBOX:CanTool) overridden.
---
--- **NOTE**: This hook will work on ALL entities, not just the scripted ones (SENTs)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:CanTool)
---@param ply Player Player, that tried to use the tool
---@param tr table The trace of the tool. See Structures/TraceResult.
---@param toolname string Class of the tool that is tried to use, for example - `weld`
---@param tool table The tool mode table the player currently has selected.
---@param button number The tool button pressed.
---@return boolean # Return `false` to disallow using that tool on this entity, return `true` to allow.
function ENTITY:CanTool(ply, tr, toolname, tool, button) end

---[SERVER] Clears all registered events for map I/O outputs on this entity. If a string is given, will use the string as a wildcard to limit removed outputs by name matches.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ClearAllOutputs)
---@param outputName? string An optional string that will be used to limit removed outputs by name matches, supports wildcards.
function Entity:ClearAllOutputs(outputName) end

---[SHARED] Resets all pose parameters such as aim_yaw, aim_pitch and rotation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ClearPoseParameters)
function Entity:ClearPoseParameters() end

---[SHARED] Declares that the collision rules of the entity have changed, and subsequent calls for [GM:ShouldCollide](https://wiki.facepunch.com/gmod/GM:ShouldCollide) with this entity may return a different value than they did previously.
---
--- **WARNING**: This function must **not** be called inside of [GM:ShouldCollide](https://wiki.facepunch.com/gmod/GM:ShouldCollide). Instead, it must be called in advance when the condition is known to change.
---
--- **WARNING**: Failure to use this function correctly will result in a crash of the physics engine.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:CollisionRulesChanged)
function Entity:CollisionRulesChanged() end

---[SERVER] Creates bone followers based on the current entity model.
---
--- Bone followers are physics objects that follow the visual mesh. This is what is used by `prop_dynamic` for things like big combine doors for vehicles with multiple physics objects which follow the visual mesh of the door when it animates.
---
--- Be mindful that bone followers create a separate entity (`phys_bone_follower`) for each physics object.
---
--- You must call [Entity:UpdateBoneFollowers](https://wiki.facepunch.com/gmod/Entity:UpdateBoneFollowers) every tick for bone followers to update their positions.
---
--- **NOTE**: This function only works on `anim`, `nextbot` and `ai` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:CreateBoneFollowers)
---@param bone_whitelist? table If set, a whitelist of bone names to create bone followers for. If a models' bone name is not in this list, a bone follower entity will not be created for it.
function Entity:CreateBoneFollowers(bone_whitelist) end

---[SHARED] Returns whether the entity was created by map or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:CreatedByMap)
---@return boolean # Is created by map?
function Entity:CreatedByMap() end

---[CLIENT] Creates a clientside particle system attached to the entity. See also [Global.CreateParticleSystem](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem)
---
--- **NOTE**: The particle effect must be precached with [Global.PrecacheParticleSystem](https://wiki.facepunch.com/gmod/Global.PrecacheParticleSystem) and the file its from must be added via [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) before it can be used!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:CreateParticleEffect)
---@param particle string The particle name to create
---@param attachment number Attachment ID to attach the particle to
---@param options? table A table of tables ( IDs 1 to 64 ) having the following structure:
--- * number attachtype - The particle attach type. See Enums/PATTACH. **Default:** PATTACH_ABSORIGIN
--- * Entity entity - The parent entity? **Default:** NULL
--- * Vector position - The offset position for given control point. **Default:**  nil
---
--- This only affects the control points of the particle effects and will do nothing if the effect doesn't use control points.
---@return CNewParticleEffect # The created particle system.
function Entity:CreateParticleEffect(particle, attachment, options) end

---[SERVER] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Called just before [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) for "ai" type entities only.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:CreateSchedulesInternal)
function ENTITY:CreateSchedulesInternal() end

---[CLIENT] Draws the shadow of an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:CreateShadow)
function Entity:CreateShadow() end

---[SERVER] Whenever the entity is removed, entityToRemove will be removed also.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DeleteOnRemove)
---@param entityToRemove Entity The entity to be removed
function Entity:DeleteOnRemove(entityToRemove) end

---[SERVER] Destroys bone followers created by [Entity:CreateBoneFollowers](https://wiki.facepunch.com/gmod/Entity:CreateBoneFollowers).
---
--- **NOTE**: This function only works on `anim` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DestroyBoneFollowers)
function Entity:DestroyBoneFollowers() end

---[CLIENT] Removes the shadow for the entity.
---
--- The shadow will be recreated as soon as the entity wakes.
---
--- **NOTE**: Doesn't affect shadows from flashlight/lamps/env_projectedtexture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DestroyShadow)
function Entity:DestroyShadow() end

---[CLIENT] Disables an active matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DisableMatrix)
---@param matrixType string The name of the matrix type to disable.
---
--- The only known matrix type is "RenderMultiply".
function Entity:DisableMatrix(matrixType) end

---[SHARED] Performs a trace attack towards the entity this function is called on, as if an invisible bullet is shot towards it. Visually identical to [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo).
--- **WARNING**: Calling this function on the victim entity in [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage) can cause infinite loops.
---
--- **NOTE**: This function correctly applies damage to [func_breakable_surf](https://developer.valvesoftware.com/wiki/Func_breakable_surf) entities, unlike [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack)
---@param damageInfo CTakeDamageInfo The damage to apply.
---@param traceRes table Trace result to use to deal damage. See Structures/TraceResult
---@param dir? Vector Direction of the attack.
function Entity:DispatchTraceAttack(damageInfo, traceRes, dir) end

---[SERVER] Dissolves the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Dissolve)
---@param type? number Dissolve type. Should be one of the following values:
---
--- | ID | Description |
--- |||
--- | 0 | ENTITY_DISSOLVE_NORMAL |
--- | 1 | ELECTRICAL|
--- | 2 | ELECTRICAL_LIGHT |
--- | 3 | ENTITY_DISSOLVE_CORE |
---@param magnitude? number Magnitude of the dissolve effect, its effect depends on the dissolve type.
---@param origin? Vector The origin for the dissolve effect, its effect depends on the dissolve type. Defaults to entity's origin.
function Entity:Dissolve(type, magnitude, origin) end

---[SHARED] Called so the entity can override the bullet impact effects it makes. This is called when the entity itself fires bullets via [Entity:FireBullets](https://wiki.facepunch.com/gmod/Entity:FireBullets), not when it gets hit.
---
--- **NOTE**: This hook only works for the "anim" type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:DoImpactEffect)
---@param tr table A Structures/TraceResult from the bullet's start point to the impact point
---@param damageType number The damage type of bullet. See Enums/DMG
---@return boolean # Return true to not do the default thing - which is to call UTIL_ImpactTrace in C++
function ENTITY:DoImpactEffect(tr, damageType) end

---[SERVER] Called by the default `base_ai` SNPC, checking whether `ENT.bDoingEngineSchedule` is set by [ENTITY:StartEngineSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule)..
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:DoingEngineSchedule)
function ENTITY:DoingEngineSchedule() end

---[SERVER] This removes the argument entity from an ent's list of entities to 'delete on remove'
--- 	**NOTE**: Also see [Entity:DeleteOnRemove](https://wiki.facepunch.com/gmod/Entity:DeleteOnRemove)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DontDeleteOnRemove)
---@param entityToUnremove Entity The entity to be removed from the list of entities to delete
function Entity:DontDeleteOnRemove(entityToUnremove) end

---[SERVER] Runs a Lua schedule. Runs tasks inside the schedule.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:DoSchedule)
---@param sched table The schedule to run.
function ENTITY:DoSchedule(sched) end

---[CLIENT] Called if and when the entity should be drawn opaquely, based on the [Entity:GetRenderGroup](https://wiki.facepunch.com/gmod/Entity:GetRenderGroup) of the entity.
---
--- See [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT) and [Enums/RENDERGROUP](https://wiki.facepunch.com/gmod/Enums/RENDERGROUP) for more information.
---
--- See also [ENTITY:DrawTranslucent](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent).
---
--- **NOTE**: This function is not called by the game whenever the player looks away from the entity due to optimizations. To change that,
--- you must define an empty [Entity:Think](https://wiki.facepunch.com/gmod/Entity:Think) method client-side!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:Draw)
---@param flags number The bit flags from Enums/STUDIO
function ENTITY:Draw(flags) end

---[CLIENT] Draws the entity or model.
---
--- If called inside [ENTITY:Draw](https://wiki.facepunch.com/gmod/ENTITY:Draw) or [ENTITY:DrawTranslucent](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent), it only draws the entity's model itself.
---
--- If called outside of those hooks, it will call both of said hooks depending on [Entity:GetRenderGroup](https://wiki.facepunch.com/gmod/Entity:GetRenderGroup), drawing the entire entity again.
---
--- When drawing an entity more than once per frame in different positions, you should call [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) before each draw; Otherwise, the entity will retain its first drawn position.
---
--- Calling this on entities with [EF_BONEMERGE](https://wiki.facepunch.com/gmod/Enums/EF) and [EF_NODRAW](https://wiki.facepunch.com/gmod/Enums/EF) applied causes a crash.
---
--- Using this with a map model ([game.GetWorld](https://wiki.facepunch.com/gmod/game.GetWorld)():[GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel)()) crashes the game.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DrawModel)
---@param flags? number The optional Enums/STUDIO flags, usually taken from ENTITY:Draw and similar hooks.
function Entity:DrawModel(flags) end

---[SHARED] Sets whether an entity's shadow should be drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DrawShadow)
---@param shouldDraw boolean True to enable, false to disable shadow drawing.
function Entity:DrawShadow(shouldDraw) end

---[CLIENT] Called when the entity should be drawn translucently. If your scripted entity has a translucent model, it will be invisible unless it is drawn here.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:DrawTranslucent)
---@param flags number The bit flags from Enums/STUDIO
function ENTITY:DrawTranslucent(flags) end

---[SERVER] Move an entity down until it collides with something.
--- **WARNING**: The entity needs to already have something below it within 256 units.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DropToFloor)
function Entity:DropToFloor() end

---[SHARED] **INTERNAL**: You should use [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) instead
---
--- Sets up a self.dt.NAME alias for a Data Table variable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:DTVar)
---@param Type string The type of the DTVar being set up. It can be one of the following: 'Int', 'Float', 'Vector', 'Angle', 'Bool', 'Entity' or 'String'
---@param ID number The ID of the DTVar. Can be between 0 and 3 for strings, 0 and 31 for everything else.
---@param Name string Name by which you will refer to DTVar. It must be a valid variable name. (No spaces!)
function Entity:DTVar(Type, ID, Name) end

---[SHARED] Plays a sound on an entity. If run clientside, the sound will only be heard locally.
---
--- If used on a player or NPC character with the mouth rigged, the character will "lip-sync". This does not work with all sound files.
---
--- **NOTE**: When using this function with weapons, use the [Weapon](https://wiki.facepunch.com/gmod/Weapon) itself as the entity, not its owner!
---
--- This does not respond to [Global.SuppressHostEvents](https://wiki.facepunch.com/gmod/Global.SuppressHostEvents).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:EmitSound)
---@param soundName string The name of the sound to be played.
---
--- This should either be a sound script name (sound.Add) or a file path relative to the `sound/` folder. (Make note that it's not sound**s**)
---
--- The string cannot have whitespace at the start or end. You can remove this with [string.Trim](https://wiki.facepunch.com/gmod/string.Trim).
---@param soundLevel? number A modifier for the distance this sound will reach, acceptable range is 0 to 511. 100 means no adjustment to the level. See Enums/SNDLVL
---
--- Will not work if a [sound script](https://developer.valvesoftware.com/wiki/Soundscripts) is used.
---@param pitchPercent? number The pitch applied to the sound. The acceptable range is from 0 to 255. 100 means the pitch is not changed.
---@param volume? number The volume, from 0 to 1.
---@param channel? number The sound channel, see Enums/CHAN.
---
--- Will not work if a [sound script](https://developer.valvesoftware.com/wiki/Soundscripts) is used.
---@param soundFlags? number The flags of the sound, see Enums/SND
---@param dsp? number The DSP preset for this sound. [List of DSP presets](https://developer.valvesoftware.com/wiki/Dsp_presets)
---@param filter? CRecipientFilter If set serverside, the sound will only be networked to the clients in the filter.
function Entity:EmitSound(soundName, soundLevel, pitchPercent, volume, channel, soundFlags, dsp, filter) end

---[SERVER] Toggles the constraints of this ragdoll entity on and off.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:EnableConstraints)
---@param toggleConstraints boolean Set to true to enable the constraints and false to disable them.
---
--- Disabling constraints will delete the constraint entities.
function Entity:EnableConstraints(toggleConstraints) end

---[SHARED] Flags an entity as using custom lua defined collisions. Fixes entities having spongy player collisions or not hitting traces, such as after [Entity:PhysicsFromMesh](https://wiki.facepunch.com/gmod/Entity:PhysicsFromMesh)
---
--- Internally identical to `Entity:AddSolidFlags( bit.bor( FSOLID_CUSTOMRAYTEST, FSOLID_CUSTOMBOXTEST ) )`
---
--- Do not confuse this function with [Entity:SetCustomCollisionCheck](https://wiki.facepunch.com/gmod/Entity:SetCustomCollisionCheck), they are not the same.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions)
function Entity:EnableCustomCollisions() end

---[CLIENT] Can be used to apply a custom [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) to the entity, mostly used for scaling the model by a [Vector](https://wiki.facepunch.com/gmod/Vector).
---
--- To disable it, use [Entity:DisableMatrix](https://wiki.facepunch.com/gmod/Entity:DisableMatrix).
---
--- If your old scales are wrong due to a recent update, use [Entity:SetLegacyTransform](https://wiki.facepunch.com/gmod/Entity:SetLegacyTransform) as a quick fix.
---
--- **NOTE**: The matrix can also be modified to apply a custom rotation and offset via the [VMatrix:SetAngles](https://wiki.facepunch.com/gmod/VMatrix:SetAngles) and [VMatrix:SetTranslation](https://wiki.facepunch.com/gmod/VMatrix:SetTranslation) functions.
---
--- This does not scale procedural bones, and disables inverse kinematics of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:EnableMatrix)
---@param matrixType string The name of the matrix type.
--- The only implemented matrix type is "RenderMultiply".
---@param matrix VMatrix The matrix to apply before drawing the entity.
function Entity:EnableMatrix(matrixType, matrix) end

---[SERVER] Called when the entity stops touching another entity.
---
--- **WARNING**: This only works for **brush** entities and for entities that have [Entity:SetTrigger](https://wiki.facepunch.com/gmod/Entity:SetTrigger) set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:EndTouch)
---@param entity Entity The entity which was touched.
function ENTITY:EndTouch(entity) end

---[SERVER] Called whenever an engine schedule is finished; either the last task within the engine schedule has been finished or the schedule has been interrupted by an interrupt condition.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
--- **NOTE**: This hook isn't called when the engine schedule is failed, the schedule is cleared with [NPC:ClearSchedule](https://wiki.facepunch.com/gmod/NPC:ClearSchedule) or [NPC:SetSchedule](https://wiki.facepunch.com/gmod/NPC:SetSchedule) has been called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:EngineScheduleFinish)
function ENTITY:EngineScheduleFinish() end

---[SHARED] Gets the unique entity index of an entity.
---
--- **NOTE**: Entity indices are marked as unused after deletion, and can be reused by newly-created entities
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:EntIndex)
---@return number # The index of the entity.
---
--- -1 for clientside-only or 0 for serverside-only entities.
function Entity:EntIndex() end

---[SERVER] Called when an NPC's expression has finished.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:ExpressionFinished)
---@param strExp string The path of the expression.
function ENTITY:ExpressionFinished(strExp) end

---[SERVER] Extinguishes the entity if it is on fire.
---
--- Has no effect if called inside [GM:EntityTakeDamage](https://wiki.facepunch.com/gmod/GM:EntityTakeDamage) (and the attacker is the flame that's hurting the entity)
---
--- See also [Entity:Ignite](https://wiki.facepunch.com/gmod/Entity:Ignite).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Extinguish)
function Entity:Extinguish() end

---[SHARED] Returns the direction a player, npc or ragdoll is looking as a world-oriented angle.
---
--- This can return an incorrect value in vehicles (like pods, buggy, ...). **This bug has been fixed in the past but was causing many addons being broken, so the fix has been removed but applied to [Player:GetAimVector](https://wiki.facepunch.com/gmod/Player:GetAimVector) only**.
---
--- This may return local angles in jeeps when used with [Player:EnterVehicle](https://wiki.facepunch.com/gmod/Player:EnterVehicle). **A workaround is available in the second example.**
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:EyeAngles)
---@return Angle # Player's eye angle.
function Entity:EyeAngles() end

---[SHARED] Returns the position of an Player/NPC's view.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:EyePos)
---@return Vector # View position of the entity.
function Entity:EyePos() end

---[SHARED] Searches for bodygroup with given name.
--- **NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model will return value form view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:FindBodygroupByName)
---@param name string The bodygroup name to search for.
---@return number # Bodygroup ID, -1 if not found
function Entity:FindBodygroupByName(name) end

---[SHARED] Returns a transition from the given start and end sequence.
---
--- This function was only used by HL1 entities and NPCs, before the advent of sequence blending and gestures.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:FindTransitionSequence)
---@param currentSequence number The currently playing sequence
---@param goalSequence number The goal sequence.
---@return number # The transition sequence, -1 if not available.
function Entity:FindTransitionSequence(currentSequence, goalSequence) end

---[SERVER] Fires an entity's input, conforming to the map IO event queue system. You can find inputs for most entities on the [Valve Developer Wiki](https://developer.valvesoftware.com/wiki/Output)
---
--- See also [Entity:Input](https://wiki.facepunch.com/gmod/Entity:Input) for a function that bypasses the event queue and [GM:AcceptInput](https://wiki.facepunch.com/gmod/GM:AcceptInput).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Fire)
---@param input string The name of the input to fire
---@param param? string The value to give to the input, can also be a number or a boolean.
---@param delay? number Delay in seconds before firing
---@param activator? Entity The entity that caused this input (i.e. the player who pushed a button)
---@param caller? Entity The entity that is triggering this input (i.e. the button that was pushed)
function Entity:Fire(input, param, delay, activator, caller) end

---[CLIENT] Called before firing clientside animation events, such as muzzle flashes or shell ejections.
---
--- See [ENTITY:HandleAnimEvent](https://wiki.facepunch.com/gmod/ENTITY:HandleAnimEvent) for the serverside version.
---
--- **NOTE**: This hook only works on "anim", "nextbot" and "ai" type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:FireAnimationEvent)
---@param pos Vector Position of the effect
---@param ang Angle Angle of the effect
---@param event number The event ID of happened even. See [this page](http://developer.valvesoftware.com/wiki/Animation_Events).
---@param name string Name of the event
---@return boolean # Return true to disable the effect
function ENTITY:FireAnimationEvent(pos, ang, event, name) end

---[SHARED] Fires a bullet.
---
--- When used in a  hook such as [WEAPON:Think](https://wiki.facepunch.com/gmod/WEAPON:Think) or [WEAPON:PrimaryAttack](https://wiki.facepunch.com/gmod/WEAPON:PrimaryAttack), it will use [Player:LagCompensation](https://wiki.facepunch.com/gmod/Player:LagCompensation) internally.
---
--- **NOTE**: Lag compensation will not work if this function is called in a timer, regardless if the timer was made in a  hook.
---
--- **NOTE**: Due to how FireBullets is set up internally, bullet tracers will always originate from attachment 1.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:FireBullets)
---@param bulletInfo table The bullet data to be used. See the Structures/Bullet.
---@param suppressHostEvents? boolean Has the effect of encasing the FireBullets call in Global.SuppressHostEvents, only works in multiplayer.
function Entity:FireBullets(bulletInfo, suppressHostEvents) end

---[SHARED] Makes an entity follow another entity's bone.
---
--- Internally this function calls [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent)( parent, boneid ), [Entity:AddEffects](https://wiki.facepunch.com/gmod/Entity:AddEffects)( EF_FOLLOWBONE
---  ) and sets an internal flag to always rebuild all bones.
--- **NOTE**: If the entity vibrates or stops following the parent, you probably need to run [Entity:SetPredictable](https://wiki.facepunch.com/gmod/Entity:SetPredictable)( true ) clientside.
---
--- **WARNING**: This function will not work if the target bone's parent bone is invalid or if the bone is not used by VERTEX LOD0
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:FollowBone)
---@param parent? Entity The entity to follow the bone of. If unset, removes the FollowBone effect.
---@param boneid number The bone to follow
function Entity:FollowBone(parent, boneid) end

---[SHARED] Forces the entity to be dropped, if it is being held by a player's Gravity Gun, Physics Gun or `+use` pickup.
---
--- See also [Player:DropObject](https://wiki.facepunch.com/gmod/Player:DropObject).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ForcePlayerDrop)
function Entity:ForcePlayerDrop() end

---[SHARED] Advances the cycle of an animated entity.
---
--- Animations that loop will automatically reset the cycle so you don't have to - ones that do not will stop animating once you reach the end of their sequence.
---
--- **WARNING**: Do not call this function multiple times a frame, as it can cause unexpected results, such as animations playing at increased rate, etc.
---
--- [NextBot:BodyMoveXY](https://wiki.facepunch.com/gmod/NextBot:BodyMoveXY) calls this internally, so do not call this function before or after [NextBot:BodyMoveXY](https://wiki.facepunch.com/gmod/NextBot:BodyMoveXY).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:FrameAdvance)
function Entity:FrameAdvance() end

---[SHARED] Returns the entity's velocity.
---
--- **NOTE**: Actually binds to CBaseEntity::GetLocalVelocity() which retrieves the velocity of the entity due to its movement in the world from forces such as gravity. Does not include velocity from entity-on-entity collision.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAbsVelocity)
---@return Vector # The velocity of the entity.
function Entity:GetAbsVelocity() end

---[SHARED] Gets the angles of given entity.
---
--- This returns incorrect results for the local player clientside.
---
--- This will return the local player's [Global.EyeAngles](https://wiki.facepunch.com/gmod/Global.EyeAngles) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks).
---
--- This will return [Global.Angle](https://wiki.facepunch.com/gmod/Global.Angle)(0,0,0) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks) while paused in single-player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAngles)
---@return Angle # The angles of the entity.
function Entity:GetAngles() end

---[SHARED] Returns the amount of animations (not to be confused with sequences) the entity's model has. A sequence can consist of multiple animations.
---
--- See also [Entity:GetAnimInfo](https://wiki.facepunch.com/gmod/Entity:GetAnimInfo)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAnimCount)
---@return number # The amount of animations the entity's model has.
function Entity:GetAnimCount() end

---[SHARED] Returns a table containing the number of frames, flags, name, and FPS of an entity's animation ID.
---
--- **NOTE**: Animation ID is not the same as sequence ID. See [Entity:GetAnimCount](https://wiki.facepunch.com/gmod/Entity:GetAnimCount)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAnimInfo)
---@param animIndex number The animation ID to look up
---@return table # Information about the animation, or nil if the index is out of bounds
function Entity:GetAnimInfo(animIndex) end

---[CLIENT] Returns the last time the entity had an animation update. Returns 0 if the entity doesn't animate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAnimTime)
---@return number # The last time the entity had an animation update.
function Entity:GetAnimTime() end

---[SHARED] Returns the amount of time since last animation.
---
--- Works only on `CBaseAnimating` entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAnimTimeInterval)
---@return number # The amount of time since last animation.
function Entity:GetAnimTimeInterval() end

---[SHARED] Gets the orientation and position of the attachment by its ID, returns nothing if the attachment does not exist.
---
--- **NOTE**: The update rate of this function is limited by the setting of ENT.AutomaticFrameAdvance for [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities)!
---
--- This will return improper values for viewmodels if used in [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAttachment)
---@param attachmentId number The internal ID of the attachment.
---@return table # The angle and position of the attachment. See the Structures/AngPos. Most notably, the table contains the keys `Ang` and `Pos` as well as `Bone`.
function Entity:GetAttachment(attachmentId) end

---[SHARED] Returns a table containing all attachments of the given entity's model.
---
--- Returns an empty table or **nil** in case its model has no attachments.
---
--- This can have inconsistent results in single-player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetAttachments)
---@return table # Attachment data. See Structures/AttachmentData.
function Entity:GetAttachments() end

---[SERVER] Called to determine how good an NPC is at using a particular weapon.
---
--- **NOTE**: "ai" base only
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GetAttackSpread)
---@param wep Entity The weapon being used by the NPC.
---@param target Entity The target the NPC is attacking
---@return number # The number of degrees of inaccuracy in the NPC's attack.
function ENTITY:GetAttackSpread(wep, target) end

---[SHARED] Returns the entity's base velocity which is their velocity due to forces applied by other entities. This includes entity-on-entity collision or riding a treadmill.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBaseVelocity)
---@return Vector # The base velocity of the entity.
function Entity:GetBaseVelocity() end

---[SHARED] Returns the blood color of this entity. This can be set with [Entity:SetBloodColor](https://wiki.facepunch.com/gmod/Entity:SetBloodColor).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBloodColor)
---@return number # Color from Enums/BLOOD_COLOR
function Entity:GetBloodColor() end

---[SHARED] Gets the exact value for specific bodygroup of given entity.
--- **NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model will return value form view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBodygroup)
---@param id number The id of bodygroup to get value of. Starts from 0.
---@return number # Current bodygroup. Starts from 0.
function Entity:GetBodygroup(id) end

---[SHARED] Returns the count of possible values for this bodygroup.
---
--- This is **not** the maximum value, since the bodygroups start with 0, not 1.
---  **NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model will return value form view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBodygroupCount)
---@param bodygroup number The ID of bodygroup to retrieve count of.
---@return number # Count of values of passed bodygroup.
function Entity:GetBodygroupCount(bodygroup) end

---[SHARED] Gets the name of specific bodygroup for given entity.
--- 	**NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model will return value form view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBodygroupName)
---@param id number The id of bodygroup to get the name of.
---@return string # The name of the bodygroup
function Entity:GetBodygroupName(id) end

---[SHARED] Returns a list of all body groups of the entity.
--- 	**NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model will return body groups form view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBodyGroups)
---@return table # Bodygroups as a table of Structures/BodyGroupDatas if the entity can have bodygroups.
function Entity:GetBodyGroups() end

---[SHARED] Returns the contents of the specified bone.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBoneContents)
---@param bone number The bone id, starting at index 0. See Entity:LookupBone.
---@return number # The contents as a Enums/CONTENTS or 0 on failure.
function Entity:GetBoneContents(bone) end

---[SHARED] Returns the value of the bone controller with the specified ID.
---
--- **NOTE**: This is the precursor of pose parameters, and only works for Half Life 1: Source models supporting it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBoneController)
---@param boneID number ID of the bone controller. Goes from 0 to 3.
---@return number # The value set on the bone controller.
function Entity:GetBoneController(boneID) end

---[SHARED] Returns the amount of bones in the entity.
---
--- **NOTE**: Will return `0` for [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) or undrawn entities until [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) is called on the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBoneCount)
---@return number # The amount of bones in given entity.
function Entity:GetBoneCount() end

---[SHARED] Returns the transformation matrix of a given bone on the entity's model. The matrix contains the transformation used to position the bone in the world. It is not relative to the parent bone.
---
--- This is equivalent to constructing a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) using [Entity:GetBonePosition](https://wiki.facepunch.com/gmod/Entity:GetBonePosition).
---
--- This can return the server's matrix during server lag.
---
--- This can return garbage serverside or a 0,0,0 fourth column (represents position) for v49 models.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBoneMatrix)
---@param boneID number The bone ID to retrieve matrix of, starting at index 0.
--- * Bones clientside and serverside will differ
---@return VMatrix # The matrix
---
--- * Some entities don't update animation every frame such as prop_physics and won't have accurate bone matrix.
function Entity:GetBoneMatrix(boneID) end

---[SHARED] Returns name of given bone id.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBoneName)
---@param index number ID of bone to lookup name of, starting at index 0.
---@return string # The name of given bone.
---
--- * `nil` in case we failed or entity doesn't have a model.
--- * `__INVALIDBONE__` in case the name cannot be read or the index is out of range.
function Entity:GetBoneName(index) end

---[SHARED] Returns parent bone of given bone.
---
--- **NOTE**: Will return -1 for [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) until [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) is called on the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBoneParent)
---@param bone number The bone ID of the bone to get parent of, starting at index 0.
---@return number # Parent bone ID or -1 if we failed for some reason.
function Entity:GetBoneParent(bone) end

---[SHARED] Returns the position and angle of the given attachment, relative to the world.
---
--- **WARNING**: This function can return entity's `GetPos()` instead if the entity doesn't have it's bone cache set up.
---
--- To ensure the bone position is correct use this:
--- ```lua
--- local pos = ent:GetBonePosition(0)
--- if pos == ent:GetPos() then
--- 	pos = ent:GetBoneMatrix(0):GetTranslation()
--- end
--- ```
---
--- **NOTE**: This function returns the bone position from the last tick, so if your framerate is higher than the server's tickrate it may appear to lag behind if used on a fast moving entity. You can fix this by using the bone's matrix instead:
--- ```lua
--- local matrix = entity:GetBoneMatrix(0)
--- local pos = matrix:GetTranslation()
--- local ang = matrix:GetAngles()
--- ```
---
--- This can return the server's position during server lag.
---
--- This can return garbage serverside or [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)(0,0,0) for v49 models.
---
--- This can return garbage if a trace passed through the target bone during bone matrix access.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBonePosition)
---@param boneIndex number The bone index of the bone to get the position of, starting at index 0. See Entity:LookupBone.
---@return Vector # The bone's position relative to the world. It can return nothing if the requested bone is out of bounds, or the entity has no model.
---@return Angle # The bone's angle relative to the world.
function Entity:GetBonePosition(boneIndex) end

---[SHARED] Returns the surface property of the specified bone.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBoneSurfaceProp)
---@param bone number The bone id, starting at index 0. See Entity:LookupBone.
---@return string # The surface property of the bone to be used with util.GetSurfaceIndex or an empty string on failure.
function Entity:GetBoneSurfaceProp(bone) end

---[SHARED] Returns info about given plane of non-nodraw brush model surfaces of the entity's model. Works on worldspawn as well.
---
--- **WARNING**: This only works on entities with brush models.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBrushPlane)
---@param id number The index of the plane to get info of. Starts from 0.
---@return Vector # The origin of the plane.
---
--- This will be either the first vertex's position (if available) or the plane's normal multiplied by the plane's distance.
---@return Vector # The normal of the plane.
---@return number # The "distance" of the plane.
---
--- The distance is the dot product of the plane's normal and the point it was initialized with.
function Entity:GetBrushPlane(id) end

---[SHARED] Returns the amount of planes of non-nodraw brush model surfaces of the entity's model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBrushPlaneCount)
---@return number # The amount of brush model planes of the entity's model. This will be 0 for any non-brush model.
function Entity:GetBrushPlaneCount() end

---[SHARED] Returns a table of brushes surfaces for brush model entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetBrushSurfaces)
---@return table # Table of SurfaceInfos if the entity has a brush model, or no value otherwise.
function Entity:GetBrushSurfaces() end

---[SHARED] Returns the specified hook callbacks for this entity added with [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback)
---
--- The callbacks can then be removed with [Entity:RemoveCallback](https://wiki.facepunch.com/gmod/Entity:RemoveCallback).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCallbacks)
---@param hook string The hook to retrieve the callbacks from, see Entity Callbacks for the possible hooks.
---@return table # A table containing the callbackid and function of all the callbacks for the specified hook
function Entity:GetCallbacks(hook) end

---[SHARED] Returns ids of child bones of given bone.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetChildBones)
---@param boneid number Bone id to lookup children of
---@return table # A table of bone ids
function Entity:GetChildBones(boneid) end

---[SHARED] Gets the children of the entity - that is, every entity whose move parent is this entity.
---
--- **NOTE**: This function returns [Entity:SetMoveParent](https://wiki.facepunch.com/gmod/Entity:SetMoveParent) children, **NOT** [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent)!
---
--- [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent) however also calls [Entity:SetMoveParent](https://wiki.facepunch.com/gmod/Entity:SetMoveParent).
---
--- This means that some entities in the returned list might have a NULL [Entity:GetParent](https://wiki.facepunch.com/gmod/Entity:GetParent).
---
--- This also means that using this function on players will return their weapons on the client but not the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetChildren)
---@return table # A list of movement children entities
function Entity:GetChildren() end

---[SHARED] Returns the classname of a entity. This is often the name of the Lua file or folder containing the files for the entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetClass)
---@return string # The entity's classname
function Entity:GetClass() end

---[SHARED] Returns an entity's collision bounding box. In most cases, this will return the same bounding box as [Entity:GetModelBounds](https://wiki.facepunch.com/gmod/Entity:GetModelBounds) unless the entity does not have a physics mesh or it has a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) different from the default.
---
--- This can be out-of-sync between the client and server for weapons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds)
---@return Vector # The minimum vector of the collision bounds
---@return Vector # The maximum vector of the collision bounds
function Entity:GetCollisionBounds() end

---[SHARED] Returns the entity's collision group
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCollisionGroup)
---@return number # The collision group. See Enums/COLLISION_GROUP
function Entity:GetCollisionGroup() end

---[SHARED] Returns the color the entity is set to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetColor)
---@return table # The color of the entity as a Color.
function Entity:GetColor() end

---[SHARED] Returns the color the entity is set to without using a color object.
---
--- **INTERNAL**: Internally used to implement [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetColor4Part)
---@return number #
---@return number #
---@return number #
---@return number #
function Entity:GetColor4Part() end

---[SERVER] Returns the two entities involved in a constraint ent, or nil if the entity is not a constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetConstrainedEntities)
---@return Entity # ent1
---@return Entity # ent2
function Entity:GetConstrainedEntities() end

---[SERVER] Returns the two entities physobjects involved in a constraint ent, or no value if the entity is not a constraint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetConstrainedPhysObjects)
---@return PhysObj # phys1
---@return PhysObj # phys2
function Entity:GetConstrainedPhysObjects() end

---[SHARED] Returns entity's creation ID. Unlike [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex) or [Entity:MapCreationID](https://wiki.facepunch.com/gmod/Entity:MapCreationID).
---
--- It will increase up until value of `10 000 000`, at which point it will reset back to `0`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCreationID)
---@return number # The creation ID
function Entity:GetCreationID() end

---[SHARED] Returns the time the entity was created on, relative to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCreationTime)
---@return number # The time the entity was created on.
function Entity:GetCreationTime() end

---[SERVER] Gets the creator of the SENT.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCreator)
---@return Player # The creator, NULL for no creator.
function Entity:GetCreator() end

---[SHARED] Returns whether this entity uses custom collision check set by [Entity:SetCustomCollisionCheck](https://wiki.facepunch.com/gmod/Entity:SetCustomCollisionCheck).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCustomCollisionCheck)
---@return boolean # Whether this entity uses custom collision check or not
function Entity:GetCustomCollisionCheck() end

---[SHARED] Returns the frame of the currently played sequence. This will be a number between 0 and 1 as a representation of sequence progress.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetCycle)
---@return number # The frame of the currently played sequence
function Entity:GetCycle() end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get an angle stored in the datatable of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetDTAngle)
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return Angle # Requested angle.
function Entity:GetDTAngle(key) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a boolean stored in the datatable of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetDTBool)
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return boolean # Requested boolean.
function Entity:GetDTBool(key) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Returns an entity stored in the datatable of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetDTEntity)
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return Entity # Requested entity.
function Entity:GetDTEntity(key) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a float stored in the datatable of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetDTFloat)
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return number # Requested float.
function Entity:GetDTFloat(key) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get an integer stored in the datatable of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetDTInt)
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return number # 32-bit signed integer
function Entity:GetDTInt(key) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a string stored in the datatable of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetDTString)
---@param key number Goes from 0 to 3.
--- Specifies what key to grab from datatable.
---@return string # Requested string.
function Entity:GetDTString(key) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Get a vector stored in the datatable of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetDTVector)
---@param key number Goes from 0 to 31.
--- Specifies what key to grab from datatable.
---@return Vector # Requested vector.
function Entity:GetDTVector(key) end

---[SHARED] Returns internal data about editable [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar)s.
---
--- 		This is used internally by [DEntityProperties](https://wiki.facepunch.com/gmod/DEntityProperties) and [Editable Entities](https://wiki.facepunch.com/gmod/Editable Entities) system.
---
--- 		**NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetEditingData)
---@return table # The internal data
function Entity:GetEditingData() end

---[SHARED] Returns a bit flag of all engine effect flags of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetEffects)
---@return number # Engine effect flags, see Enums/EF
function Entity:GetEffects() end

---[SHARED] Returns a bit flag of all engine flags of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetEFlags)
---@return number # Engine flags, see Enums/EFL
function Entity:GetEFlags() end

---[SHARED] Returns the elasticity of this entity, used by some flying entities such as the Helicopter NPC to determine how much it should bounce around when colliding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetElasticity)
---@return number # elasticity
function Entity:GetElasticity() end

---[SHARED] Returns all flags of given entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlags)
---@return number # Flags of given entity as a bitflag, see Enums/FL
function Entity:GetFlags() end

---[SHARED] Returns acceptable value range for the flex.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlexBounds)
---@param flex number The ID of the flex to look up bounds of
---@return number # The minimum value for this flex
---@return number # The maximum value for this flex
function Entity:GetFlexBounds(flex) end

---[SHARED] Returns the ID of the flex based on the beginning or the entire name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlexIDByName)
---@param name string The name of the flex to get the ID of. Case sensitive.
---@return number # The ID of flex
--- * `nil` if no flex with given name was found
function Entity:GetFlexIDByName(name) end

---[SHARED] Returns flex name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlexName)
---@param id number The flex index to look up name of. The range is between `0` and Entity:GetFlexNum - 1.
---@return string # The flex name, or no value if the requested ID is out of bounds.
function Entity:GetFlexName(id) end

---[SHARED] Returns the number of flex controllers this entity's model has.
---
--- **NOTE**: Please note that while this function can return the real number of flex controllers, the game supports only a certain amount due to networking limitations. See [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlexNum)
---@return number # The number of flexes.
function Entity:GetFlexNum() end

---[SHARED] Returns the flex scale of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlexScale)
---@return number # The flex scale
function Entity:GetFlexScale() end

---[SHARED] Returns flex controller type or "category". Used internally by Faceposer to categorize flex controllers.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlexType)
---@param id number The flex index to look up type of. The range is between `0` and Entity:GetFlexNum - 1.
---@return string # The flex type, or no value if the requested ID is out of bounds.
function Entity:GetFlexType(id) end

---[SHARED] Returns current weight ( value ) of given flex controller. Please see [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight) regarding limitations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFlexWeight)
---@param flex number The ID of the flex to get weight of
---@return number # The current weight of the flex, or 0 if out of bounds.
function Entity:GetFlexWeight(flex) end

---[SHARED] Returns the forward vector of the entity, as a normalized direction vector
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetForward)
---@return Vector # forwardDir
function Entity:GetForward() end

---[SHARED] Returns the friction modifier for this entity. Entities default to `1` (100%) and can be higher.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetFriction)
---@return number # friction
function Entity:GetFriction() end

---[SHARED] Gets the gravity multiplier of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetGravity)
---@return number # gravityMultiplier
function Entity:GetGravity() end

---[SHARED] Returns the object the entity is standing on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetGroundEntity)
---@return Entity # The ground entity.
function Entity:GetGroundEntity() end

---[SERVER] Returns the entity's ground speed velocity, which is based on the entity's walk/run speed and/or the ground speed of their sequence ( [Entity:GetSequenceGroundSpeed](https://wiki.facepunch.com/gmod/Entity:GetSequenceGroundSpeed) ). Will return an empty [Vector](https://wiki.facepunch.com/gmod/Vector) if the entity isn't moving on the ground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetGroundSpeedVelocity)
---@return Vector # The ground speed velocity.
function Entity:GetGroundSpeedVelocity() end

---[SHARED] Gets the bone the hit box is attached to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetHitBoxBone)
---@param hitbox number The number of the hit box.
---@param hboxset number The number of the hit box set. This should be 0 in most cases.
---
--- Numbering for these sets start from 0. The total amount of sets can be found with Entity:GetHitBoxSetCount.
---@return number # The number of the bone. Will be nil if the hit box index was out of range.
function Entity:GetHitBoxBone(hitbox, hboxset) end

---[SHARED] Gets the bounds (min and max corners) of a hit box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetHitBoxBounds)
---@param hitbox number The number of the hit box.
---@param set number The hitbox set of the hit box. This should be 0 in most cases.
---@return Vector # Hit box mins. Will be nil if the hit box index was out of range.
---@return Vector # Hit box maxs. Will be nil if the hit box index was out of range.
function Entity:GetHitBoxBounds(hitbox, set) end

---[SHARED] Gets how many hit boxes are in a given hit box set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetHitBoxCount)
---@param set number The number of the hit box set.
---@return number # The number of hit boxes.
function Entity:GetHitBoxCount(set) end

---[SHARED] Returns the number of hit box sets that an entity has. Functionally identical to [Entity:GetHitboxSetCount](https://wiki.facepunch.com/gmod/Entity:GetHitboxSetCount)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetHitBoxGroupCount)
---@return number # number of hit box sets
---@deprecated You should use Entity:GetHitboxSetCount instead.
function Entity:GetHitBoxGroupCount() end

---[SHARED] Gets the hit group of a given hitbox in a given hitbox set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetHitBoxHitGroup)
---@param hitbox number The number of the hit box.
---@param hitboxset number The number of the hit box set. This should be 0 in most cases.
---
--- Numbering for these sets start from 0. The total group count can be found with Entity:GetHitBoxSetCount.
---@return number # The hitbox group of given hitbox. See Enums/HITGROUP
function Entity:GetHitBoxHitGroup(hitbox, hitboxset) end

---[SHARED] Returns entity's current hit box set
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetHitboxSet)
---@return number # The current hit box set id, or no value if the entity doesn't have hit boxes
---@return string # The current hit box set name, or no value if the entity doesn't have hit boxes
function Entity:GetHitboxSet() end

---[SHARED] Returns the amount of hitbox sets in the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetHitboxSetCount)
---@return number # The amount of hitbox sets in the entity.
function Entity:GetHitboxSetCount() end

---[SHARED] An interface for accessing internal key values on entities.
---
--- See [Entity:GetSaveTable](https://wiki.facepunch.com/gmod/Entity:GetSaveTable) for a more detailed explanation. See [Entity:SetSaveValue](https://wiki.facepunch.com/gmod/Entity:SetSaveValue) for the opposite of this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable)
---@param variableName string Name of variable corresponding to an entity save value.
---@return any # The internal variable value.
function Entity:GetInternalVariable(variableName) end

---[SERVER] Returns a table containing Hammer key values the entity has stored. **Not all key values will be accessible this way.** Use [GM:EntityKeyValue](https://wiki.facepunch.com/gmod/GM:EntityKeyValue) or [ENTITY:KeyValue](https://wiki.facepunch.com/gmod/ENTITY:KeyValue) to capture and store every key value.
---
--- Single key values can usually be retrieved with [Entity:GetInternalVariable](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable).
---
--- Here's a list of keyvalues that will not appear in this list, as they are not stored/defined as actual keyvalues internally:
--- * rendercolor - [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor) (Only RGB)
--- * rendercolor32 - [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor) (RGBA)
--- * renderamt - [Entity:GetColor](https://wiki.facepunch.com/gmod/Entity:GetColor) (Alpha)
--- * disableshadows - [EF_NOSHADOW](https://wiki.facepunch.com/gmod/Enums/EF#EF_NOSHADOW)
--- * mins - [Entity:GetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds)
--- * maxs - [Entity:GetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:GetCollisionBounds)
--- * disablereceiveshadows - [EF_NORECEIVESHADOW](https://wiki.facepunch.com/gmod/Enums/EF#EF_NORECEIVESHADOW)
--- * nodamageforces - [EFL_NO_DAMAGE_FORCES](https://wiki.facepunch.com/gmod/Enums/EFL#EFL_NO_DAMAGE_FORCES)
--- * angle - [Entity:GetAngles](https://wiki.facepunch.com/gmod/Entity:GetAngles)
--- * angles - [Entity:GetAngles](https://wiki.facepunch.com/gmod/Entity:GetAngles)
--- * origin - [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos)
--- * targetname - [Entity:GetName](https://wiki.facepunch.com/gmod/Entity:GetName)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetKeyValues)
---@return table # A table of key values.
function Entity:GetKeyValues() end

---[SHARED] Returns the animation cycle/frame for given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLayerCycle)
---@param layerID number The Layer ID
---@return number # The animation cycle/frame for given layer.
function Entity:GetLayerCycle(layerID) end

---[SHARED] Returns the duration of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLayerDuration)
---@param layerID number The Layer ID
---@return number # The duration of the layer
function Entity:GetLayerDuration(layerID) end

---[SHARED] Returns the layer playback rate. See also [Entity:GetLayerDuration](https://wiki.facepunch.com/gmod/Entity:GetLayerDuration).
--- 	**NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLayerPlaybackRate)
---@param layerID number The Layer ID
---@return number # The current playback rate.
function Entity:GetLayerPlaybackRate(layerID) end

---[SHARED] Returns the sequence id of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLayerSequence)
---@param layerID number The Layer ID.
---@return number # The sequenceID of the layer.
function Entity:GetLayerSequence(layerID) end

---[SHARED] Returns the current weight of the layer. See [Entity:SetLayerWeight](https://wiki.facepunch.com/gmod/Entity:SetLayerWeight) for more information.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLayerWeight)
---@param layerID number The Layer ID
---@return number # The current weight of the layer
function Entity:GetLayerWeight(layerID) end

---[SERVER] Returns the entity that is being used as the light origin position for this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLightingOriginEntity)
---@return Entity # The lighting entity. This will usually be NULL.
function Entity:GetLightingOriginEntity() end

---[SHARED] Returns the rotation of the entity relative to its parent entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLocalAngles)
---@return Angle # Relative angle
function Entity:GetLocalAngles() end

---[SHARED] Returns the non-VPhysics angular velocity of the entity relative to its parent entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLocalAngularVelocity)
---@return Angle # The velocity
function Entity:GetLocalAngularVelocity() end

---[SHARED] Returns entity's position relative to it's parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetLocalPos)
---@return Vector # Relative position
function Entity:GetLocalPos() end

---[SHARED] Gets the entity's angle manipulation of the given bone. This is relative to the default angle, so the angle is zero when unmodified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetManipulateBoneAngles)
---@param boneID number The bone's ID
---@return Angle # The entity's angle manipulation of the given bone.
function Entity:GetManipulateBoneAngles(boneID) end

---[SHARED] Returns the jiggle amount of the entity's bone.
---
--- See [Entity:ManipulateBoneJiggle](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneJiggle) for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetManipulateBoneJiggle)
---@param boneID number The bone ID
---@return number # The jiggle bone type, as set by Entity:ManipulateBoneJiggle.
function Entity:GetManipulateBoneJiggle(boneID) end

---[SHARED] Gets the entity's position manipulation of the given bone. This is relative to the default position, so it is zero when unmodified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetManipulateBonePosition)
---@param boneId number The bone's ID
---@return Vector # The entity's position manipulation of the given bone.
function Entity:GetManipulateBonePosition(boneId) end

---[SHARED] Gets the entity's scale manipulation of the given bone. Normal scale is Vector( 1, 1, 1 )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetManipulateBoneScale)
---@param boneID number The bone's ID
---@return Vector # The entity's scale manipulation of the given bone
function Entity:GetManipulateBoneScale(boneID) end

---[SHARED] Returns the material override for this entity.
---
--- Returns an empty string if no material override exists. Use [Entity:GetMaterials](https://wiki.facepunch.com/gmod/Entity:GetMaterials) to list its default materials.
---
--- The server's value takes priority on the client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMaterial)
---@return string # material
function Entity:GetMaterial() end

---[SHARED] Returns all materials of the entity's model.
---
--- This function is unaffected by [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial) as it returns the original materials.
---
--- The table returned by this function will not contain materials if they are missing from the disk/repository. This means that if you are attempting to find the ID of a material to replace with [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial) and there are missing materials on the model, all subsequent materials will be offset in the table, meaning that the ID you are trying to get will be incorrect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMaterials)
---@return table # A table containing full paths to the materials of the model.
---
--- For models, it's limited to 128 materials.
function Entity:GetMaterials() end

---[SERVER] Returns the surface material of this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMaterialType)
---@return number # Surface material. See Enums/MAT
function Entity:GetMaterialType() end

---[SHARED] Returns the max health that the entity was given. It can be set via [Entity:SetMaxHealth](https://wiki.facepunch.com/gmod/Entity:SetMaxHealth).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMaxHealth)
---@return number # Max health.
function Entity:GetMaxHealth() end

---[SHARED] Gets the model of given entity.
---
--- This does not necessarily return the model's path, as is the case for brush and virtual models. This is intentional behaviour, however, there is currently no way to retrieve the actual file path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetModel)
---@return string # The entity's model. Will be a filesystem path for most models.
---
--- This will be nil for entities which cannot have models, such as point entities.
function Entity:GetModel() end

---[SHARED] Returns the entity's model bounds, not scaled by [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale).
---
--- These bounds are affected by all the animations the model has at compile time, if they go outside of the models' render bounds at any point.
--- See [Entity:GetModelRenderBounds](https://wiki.facepunch.com/gmod/Entity:GetModelRenderBounds) for just the render bounds of the model.
---
--- This is different than the collision bounds/hull, which are set via [Entity:SetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetModelBounds)
---@return Vector # The minimum vector of the bounds
---@return Vector # The maximum vector of the bounds
function Entity:GetModelBounds() end

---[SHARED] Returns the contents of the entity's current model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetModelContents)
---@return number # The contents of the entity's model. See Enums/CONTENTS.
function Entity:GetModelContents() end

---[CLIENT] Gets the physics bone count of the entity's model. This is only applicable to `anim` type [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities) with ragdoll models.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetModelPhysBoneCount)
---@return number # How many physics bones exist on the model.
function Entity:GetModelPhysBoneCount() end

---[SHARED] Gets the models radius.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetModelRadius)
---@return number #
--- 			The radius of the model.
--- 			This can return [nil](https://wiki.facepunch.com/gmod/nil) instead of a [number](https://wiki.facepunch.com/gmod/number) in some cases.
function Entity:GetModelRadius() end

---[SHARED] Returns the entity's model render bounds. Unlike [Entity:GetModelBounds](https://wiki.facepunch.com/gmod/Entity:GetModelBounds), bounds returning by this function will not be affected by animations (at compile time).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetModelRenderBounds)
---@return Vector # The minimum vector of the bounds
---@return Vector # The maximum vector of the bounds
function Entity:GetModelRenderBounds() end

---[SHARED] Gets the selected entity's model scale.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetModelScale)
---@return number # Scale of that entity's model.
function Entity:GetModelScale() end

---[SERVER] Returns the amount a momentary_rot_button entity is turned based on the given angle. 0 meaning completely turned closed, 1 meaning completely turned open.
---
--- **WARNING**: This only works on momentary_rot_button entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMomentaryRotButtonPos)
---@param turnAngle Angle The angle of rotation to compare - usually should be Entity:GetAngles.
---@return number # The amount the momentary_rot_button is turned, ranging from 0 to 1, or nil if the entity is not a momentary_rot_button.
function Entity:GetMomentaryRotButtonPos(turnAngle) end

---[SHARED] Returns the move collide type of the entity. The move collide is the way a physics object reacts to hitting an object - will it bounce, slide?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMoveCollide)
---@return number # The move collide type, see Enums/MOVECOLLIDE
function Entity:GetMoveCollide() end

---[SHARED] Returns the movement parent of this entity.
---
--- See [Entity:SetMoveParent](https://wiki.facepunch.com/gmod/Entity:SetMoveParent) for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMoveParent)
---@return Entity # The movement parent of this entity.
function Entity:GetMoveParent() end

---[SHARED] Returns the entity's movetype
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetMoveType)
---@return number # Move type. See Enums/MOVETYPE
function Entity:GetMoveType() end

---[SERVER] Returns the map/hammer targetname of this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetName)
---@return string # The name of the Entity
function Entity:GetName() end

---[CLIENT] Gets networked angles for entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkAngles)
---@return Angle # angle
function Entity:GetNetworkAngles() end

---[SHARED] Retrieves a networked angle value at specified index on the entity that is set by [Entity:SetNetworked2Angle](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Angle).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Angle)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Angle instead.
function Entity:GetNetworked2Angle(key, fallback) end

---[SHARED] Retrieves a networked boolean value at specified index on the entity that is set by [Entity:SetNetworked2Bool](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Bool).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Bool)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Bool instead.
function Entity:GetNetworked2Bool(key, fallback) end

---[SHARED] Retrieves a networked entity value at specified index on the entity that is set by [Entity:SetNetworked2Entity](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Entity).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Entity)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Entity instead.
function Entity:GetNetworked2Entity(key, fallback) end

---[SHARED] Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNetworked2Float](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Float).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Float)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Float instead.
function Entity:GetNetworked2Float(key, fallback) end

---[SHARED] Retrieves a networked integer (whole number) value that was previously set by [Entity:SetNetworked2Int](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Int).
---
--- **WARNING**: The integer has a 32 bit limit. Use [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt) and [Entity:GetNWInt](https://wiki.facepunch.com/gmod/Entity:GetNWInt) instead
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Int)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value (If it isn't set).
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Int instead.
function Entity:GetNetworked2Int(key, fallback) end

---[SHARED] Retrieves a networked string value at specified index on the entity that is set by [Entity:SetNetworked2String](https://wiki.facepunch.com/gmod/Entity:SetNetworked2String).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2String)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2String instead.
function Entity:GetNetworked2String(key, fallback) end

---[SHARED] Retrieves a networked value at specified index on the entity that is set by [Entity:SetNetworked2Var](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Var).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Var)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Var instead.
function Entity:GetNetworked2Var(key, fallback) end

---[SHARED] Returns callback function for given NWVar of this entity. Alias of [Entity:GetNW2VarProxy](https://wiki.facepunch.com/gmod/Entity:GetNW2VarProxy)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2VarProxy)
---@param key any The key of the NWVar to get callback of.
---@return function # The callback of given NWVar, or nil if not found.
---@deprecated You should be using Entity:GetNW2VarProxy instead.
function Entity:GetNetworked2VarProxy(key) end

---[SHARED] Returns all the networked2 variables in an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2VarTable)
---@return table # Key-Value table of all networked2 variables.
---@deprecated You should be using Entity:GetNW2VarTable instead.
function Entity:GetNetworked2VarTable() end

---[SHARED] Retrieves a networked vector value at specified index on the entity that is set by [Entity:SetNetworked2Vector](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Vector).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Vector)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
---@deprecated You should be using Entity:GetNW2Vector instead.
function Entity:GetNetworked2Vector(key, fallback) end

---[SHARED] Retrieves a networked angle value at specified index on the entity that is set by [Entity:SetNetworkedAngle](https://wiki.facepunch.com/gmod/Entity:SetNetworkedAngle).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedAngle)
---@param key string The key that is associated with the value
---@param fallback? Angle The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Angle # The retrieved value
---@deprecated You should use Entity:GetNWAngle instead.
function Entity:GetNetworkedAngle(key, fallback) end

---[SHARED] Retrieves a networked boolean value at specified index on the entity that is set by [Entity:SetNetworkedBool](https://wiki.facepunch.com/gmod/Entity:SetNetworkedBool).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedBool)
---@param key string The key that is associated with the value
---@param fallback? boolean The value to return if we failed to retrieve the value. ( If it isn't set )
---@return boolean # The retrieved value
---@deprecated You should use Entity:GetNWBool instead.
function Entity:GetNetworkedBool(key, fallback) end

---[SHARED] Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNetworkedEntity](https://wiki.facepunch.com/gmod/Entity:SetNetworkedEntity).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedEntity)
---@param key string The key that is associated with the value
---@param fallback? Entity The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Entity # The retrieved value
---@deprecated You should use Entity:GetNWEntity instead.
function Entity:GetNetworkedEntity(key, fallback) end

---[SHARED] Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNetworkedFloat](https://wiki.facepunch.com/gmod/Entity:SetNetworkedFloat).
---
--- Seems to be the same as [Entity:GetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedFloat)
---@param key string The key that is associated with the value
---@param fallback? number The value to return if we failed to retrieve the value. ( If it isn't set )
---@return number # The retrieved value
---@deprecated You should use Entity:GetNWFloat instead.
function Entity:GetNetworkedFloat(key, fallback) end

---[SHARED] Retrieves a networked integer value at specified index on the entity that is set by [Entity:SetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:SetNetworkedInt).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt)
---@param key string The key that is associated with the value
---@param fallback? number The value to return if we failed to retrieve the value. ( If it isn't set )
---@return number # The retrieved value
---@deprecated You should use Entity:GetNWInt instead.
function Entity:GetNetworkedInt(key, fallback) end

---[SHARED] Retrieves a networked string value at specified index on the entity that is set by [Entity:SetNetworkedString](https://wiki.facepunch.com/gmod/Entity:SetNetworkedString).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedString)
---@param key string The key that is associated with the value
---@param fallback? string The value to return if we failed to retrieve the value. ( If it isn't set )
---@return string # The retrieved value
---@deprecated You should use Entity:GetNWString instead.
function Entity:GetNetworkedString(key, fallback) end

---[SHARED] Retrieves a networked value at specified index on the entity that is set by [Entity:SetNetworkedVar](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVar).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVar)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNetworkedVar(key, fallback) end

---[SHARED] This function was superseded by [Entity:GetNetworked2VarProxy](https://wiki.facepunch.com/gmod/Entity:GetNetworked2VarProxy). This page still exists an archive in case anybody ever stumbles across old code and needs to know what it is
--- Returns callback function for given NWVar of this entity, previously set by [Entity:SetNWVarProxy](https://wiki.facepunch.com/gmod/Entity:SetNWVarProxy).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVarProxy)
---@param name string The name of the NWVar to get callback of.
---@return fun(ent: Entity, name: string, oldval: any, newval: any) # The callback of given NWVar, if any.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:GetNetworkedVarProxy(name) end

---[SHARED] Returns all the networked variables in an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVarTable)
---@return table # Key-Value table of all networked variables.
---@deprecated You should be using Entity:GetNWVarTable instead.
function Entity:GetNetworkedVarTable() end

---[SHARED] Retrieves a networked vector value at specified index on the entity that is set by [Entity:SetNetworkedVector](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVector).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVector)
---@param key string The key that is associated with the value
---@param fallback? Vector The value to return if we failed to retrieve the value. ( If it isn't set )
---@return Vector # The retrieved value
---@deprecated You should use Entity:GetNWVector instead.
function Entity:GetNetworkedVector(key, fallback) end

---[SHARED] Gets networked origin for entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkOrigin)
---@return Vector # origin
function Entity:GetNetworkOrigin() end

---[SHARED] Returns all network vars created by [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) and [Entity:NetworkVarElement](https://wiki.facepunch.com/gmod/Entity:NetworkVarElement) and their current values.
---
--- 		This is used internally by the duplicator. `Entity` type Network vars will not be returned!
---
--- 		For NWVars see [Entity:GetNWVarTable](https://wiki.facepunch.com/gmod/Entity:GetNWVarTable).
---
--- 		**NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNetworkVars)
---@return table # The Key-Value formatted table of network var names and their current values
function Entity:GetNetworkVars() end

---[SHARED] Returns if the entity's rendering and transmitting has been disabled.
---
--- **NOTE**: This is equivalent to calling [Entity:IsEffectActive](https://wiki.facepunch.com/gmod/Entity:IsEffectActive)( EF_NODRAW )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNoDraw)
---@return boolean # Whether the entity's rendering and transmitting has been disabled.
function Entity:GetNoDraw() end

---[SERVER] Gets the NPC classification. Internally gets the `m_iClass` variable which is polled by the engine. This will be equivalent to [NPC:Classify](https://wiki.facepunch.com/gmod/NPC:Classify).
---
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GetNPCClass)
---@return number # See Enums/CLASS
function ENTITY:GetNPCClass() end

---[SHARED] Returns the body group count of the entity.
--- **NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model will return value form view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNumBodyGroups)
---@return number # Amount of bodygroups the entitys model has
function Entity:GetNumBodyGroups() end

---[SHARED] Returns the number of pose parameters this entity has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNumPoseParameters)
---@return number # Amount of pose parameters the entity has
function Entity:GetNumPoseParameters() end

---[SHARED] Retrieves a networked angle value at specified index on the entity that is set by [Entity:SetNW2Angle](https://wiki.facepunch.com/gmod/Entity:SetNW2Angle).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2Angle)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2Angle(key, fallback) end

---[SHARED] Retrieves a networked boolean value at specified index on the entity that is set by [Entity:SetNW2Bool](https://wiki.facepunch.com/gmod/Entity:SetNW2Bool).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2Bool)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2Bool(key, fallback) end

---[SHARED] Retrieves a networked entity value at specified index on the entity that is set by [Entity:SetNW2Entity](https://wiki.facepunch.com/gmod/Entity:SetNW2Entity).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2Entity)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2Entity(key, fallback) end

---[SHARED] Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNW2Float](https://wiki.facepunch.com/gmod/Entity:SetNW2Float).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2Float)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2Float(key, fallback) end

---[SHARED] Retrieves a networked integer (whole number) value that was previously set by [Entity:SetNW2Int](https://wiki.facepunch.com/gmod/Entity:SetNW2Int).
--- **WARNING**: The integer has a 32 bit limit. Use [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt) and [Entity:GetNWInt](https://wiki.facepunch.com/gmod/Entity:GetNWInt) instead
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2Int)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value (If it isn't set).
---@return any # The value associated with the key
function Entity:GetNW2Int(key, fallback) end

---[SHARED] Retrieves a networked string value at specified index on the entity that is set by [Entity:SetNW2String](https://wiki.facepunch.com/gmod/Entity:SetNW2String).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2String)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2String(key, fallback) end

---[SHARED] Retrieves a networked value at specified index on the entity that is set by [Entity:SetNW2Var](https://wiki.facepunch.com/gmod/Entity:SetNW2Var).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2Var)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2Var(key, fallback) end

---[SHARED] Returns callback function for given NWVar of this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2VarProxy)
---@param key any The key of the NWVar to get callback of.
---@return fun(ent: Entity, name: string, oldval: any, newval: any) # The callback of given NWVar, or nil if not found.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NW2Var that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:GetNW2VarProxy(key) end

---[SHARED] Returns all the NW2 variables in an entity.
--- 		This function will return keys with empty tables if the NW2Var is nil.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2VarTable)
---@return table # Key-Value table of all NW2 variables.
function Entity:GetNW2VarTable() end

---[SHARED] Retrieves a networked vector value at specified index on the entity that is set by [Entity:SetNW2Vector](https://wiki.facepunch.com/gmod/Entity:SetNW2Vector).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNW2Vector)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNW2Vector(key, fallback) end

---[SHARED] Retrieves a networked angle value at specified index on the entity that is set by [Entity:SetNWAngle](https://wiki.facepunch.com/gmod/Entity:SetNWAngle).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWAngle)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNWAngle(key, fallback) end

---[SHARED] Retrieves a networked boolean value at specified index on the entity that is set by [Entity:SetNWBool](https://wiki.facepunch.com/gmod/Entity:SetNWBool).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWBool)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNWBool(key, fallback) end

---[SHARED] Retrieves a networked entity value at specified index on the entity that is set by [Entity:SetNWEntity](https://wiki.facepunch.com/gmod/Entity:SetNWEntity).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWEntity)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNWEntity(key, fallback) end

---[SHARED] Retrieves a networked float value at specified index on the entity that is set by [Entity:SetNWFloat](https://wiki.facepunch.com/gmod/Entity:SetNWFloat).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWFloat)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNWFloat(key, fallback) end

---[SHARED] Retrieves a networked integer (whole number) value that was previously set by [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt).
---
--- This function will not round decimal values as it actually networks a float internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWInt)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value (If it isn't set).
---@return any # The value associated with the key
function Entity:GetNWInt(key, fallback) end

---[SHARED] Retrieves a networked string value at specified index on the entity that is set by [Entity:SetNWString](https://wiki.facepunch.com/gmod/Entity:SetNWString).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWString)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNWString(key, fallback) end

---[SHARED] Returns callback function for given NWVar of this entity, previously set by [Entity:SetNWVarProxy](https://wiki.facepunch.com/gmod/Entity:SetNWVarProxy).
--- This function was superseded by [Entity:GetNW2VarProxy](https://wiki.facepunch.com/gmod/Entity:GetNW2VarProxy). This page still exists an archive in case anybody ever stumbles across old code and needs to know what it is
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWVarProxy)
---@param key string The key of the NWVar to get callback of.
---@return fun(ent: Entity, name: string, oldval: any, newval: any) # The callback of given NWVar, or nil if not found.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:GetNWVarProxy(key) end

---[SHARED] Returns all the networked variables in an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWVarTable)
---@return table # Key-Value table of all networked variables.
function Entity:GetNWVarTable() end

---[SHARED] Retrieves a networked vector value at specified index on the entity that is set by [Entity:SetNWVector](https://wiki.facepunch.com/gmod/Entity:SetNWVector).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetNWVector)
---@param key string The key that is associated with the value
---@param fallback? any The value to return if we failed to retrieve the value. (If it isn't set)
---@return any # The value associated with the key
function Entity:GetNWVector(key, fallback) end

---[SHARED] Returns the owner entity of this entity. See [Entity:SetOwner](https://wiki.facepunch.com/gmod/Entity:SetOwner) for more info.
---
--- 	**NOTE**: This function is generally used to disable physics interactions on projectiles being fired by their owner, but can also be used for normal ownership in case physics interactions are not involved at all. The Gravity gun will be able to pick up the entity even if the owner can't collide with it, the Physics gun however will not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetOwner)
---@return Entity # The owner entity of this entity.
function Entity:GetOwner() end

---[SHARED] Returns the parent entity of this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetParent)
---@return Entity # parentEntity
function Entity:GetParent() end

---[SHARED] Returns the attachment/bone index of the entity's parent. Returns 0 if the entity is not parented to an attachment/bone or if it isn't parented at all.
---
--- This is set by second argument of [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent) or the **SetParentAttachment** input.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetParentAttachment)
---@return number #
--- The parented attachment/bone index
--- Will return bone index instead of attachment index if the **EF_FOLLOWBONE** effect is active on the entity. See [Entity:IsEffectActive](https://wiki.facepunch.com/gmod/Entity:IsEffectActive).
function Entity:GetParentAttachment() end

---[SHARED] If the entity is parented to an entity that has a model with multiple physics objects (like a ragdoll), this is used to retrieve what physics object number the entity is parented to on it's parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetParentPhysNum)
---@return number # The physics object id, or nil if the entity has no parent
function Entity:GetParentPhysNum() end

---[SHARED] Returns the position and angle of the entity's move parent as a 3x4 matrix ([VMatrix](https://wiki.facepunch.com/gmod/VMatrix) is 4x4 so the fourth row goes unused). The first three columns store the angle as a [rotation matrix](https://en.wikipedia.org/wiki/Rotation_matrix), and the fourth column stores the position vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetParentWorldTransformMatrix)
---@return VMatrix # The position and angle matrix.
---
--- If the entity has no move parent, an identity matrix will be returned.
--- If the entity is Entity:GetParentAttachment 0 or the parent isn't a BaseAnimating entity, the equivalent of Entity:Entity:GetMoveParent:Entity:GetWorldTransformMatrix will be returned.
function Entity:GetParentWorldTransformMatrix() end

---[SHARED] Returns whether the entity is persistent or not.
---
--- See [Entity:SetPersistent](https://wiki.facepunch.com/gmod/Entity:SetPersistent) for more information on persistence.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPersistent)
---@return boolean # True if the entity is set to be persistent.
function Entity:GetPersistent() end

---[SERVER] Returns player who is claiming kills of physics damage the entity deals.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPhysicsAttacker)
---@param timeLimit? number The time to check if the entity was still a proper physics attacker.
---
--- Some entities such as the Combine Ball disregard the time limit and always return the physics attacker.
---@return Player # The player. If entity that was set is not a player, it will return NULL entity.
function Entity:GetPhysicsAttacker(timeLimit) end

---[SHARED] Returns the entity's physics object, if the entity has physics.
---
--- **NOTE**: Entities don't have clientside physics objects by default, so this will return `[NULL PHYSOBJ]` on the client in most cases.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObject)
---@return PhysObj # The entity's physics object.
function Entity:GetPhysicsObject() end

---[SHARED] Returns the number of physics objects an entity has (usually 1 for non-ragdolls)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObjectCount)
---@return number # numObjects
function Entity:GetPhysicsObjectCount() end

---[SHARED] Returns a specific physics object from an entity with multiple [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects (like ragdolls)
---
--- See also [Entity:TranslateBoneToPhysBone](https://wiki.facepunch.com/gmod/Entity:TranslateBoneToPhysBone).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObjectNum)
---@param physNum number The number corresponding to the PhysObj to grab. Starts at 0.
---@return PhysObj # The physics object
function Entity:GetPhysicsObjectNum(physNum) end

---[SHARED] Returns the playback rate of the main sequence on this entity, with 1.0 being the default speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPlaybackRate)
---@return number # The playback rate.
function Entity:GetPlaybackRate() end

---[SHARED] Gets the position of entity in world.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPos)
---@return Vector # The position of the entity.
function Entity:GetPos() end

---[SHARED] Returns the pose parameter value
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPoseParameter)
---@param name string|number Pose parameter name to look up. Can also be a pose parameter ID.
---@return number # Value of given pose parameter.
---
--- This value will be from 0 - 1 on the client and from minimum range to maximum range on the server! You'll have to [remap](https://wiki.facepunch.com/gmod/math.Remap) this value clientside to [Entity:GetPoseParameterRange](https://wiki.facepunch.com/gmod/Entity:GetPoseParameterRange)'s returns if you want get the actual pose parameter value. See [Entity:SetPoseParameter](https://wiki.facepunch.com/gmod/Entity:SetPoseParameter)'s example.
function Entity:GetPoseParameter(name) end

---[SHARED] Returns name of given pose parameter
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPoseParameterName)
---@param id number Id of the pose paremeter
---@return string # Name of given pose parameter
function Entity:GetPoseParameterName(id) end

---[SHARED] Returns pose parameter range
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPoseParameterRange)
---@param id number|string Pose parameter ID to look up. Can also be a pose parameter name.
---@return number # The minimum value
---@return number # The maximum value
function Entity:GetPoseParameterRange(id) end

---[CLIENT] Returns whether this entity is predictable or not.
---
--- See [Entity:SetPredictable](https://wiki.facepunch.com/gmod/Entity:SetPredictable) for more information
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetPredictable)
---@return boolean # Whether this entity is predictable or not.
function Entity:GetPredictable() end

---[SERVER] Called to override the preferred carry angles of this object.
---
--- **NOTE**: This callback is only called for `anim` and `ai` type entities. For rest use [GM:GetPreferredCarryAngles](https://wiki.facepunch.com/gmod/GM:GetPreferredCarryAngles).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GetPreferredCarryAngles)
---@param ply Player The player who is holding the object.
---@return Angle # Return an angle to override the carry angles.
function Entity:GetPreferredCarryAngles(ply) end

---[SHARED] Returns the entity which the ragdoll came from. The opposite of [Player:GetRagdollEntity](https://wiki.facepunch.com/gmod/Player:GetRagdollEntity).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRagdollOwner)
---@return Entity # The entity who owns the ragdoll.
function Entity:GetRagdollOwner() end

---[SERVER] Called when scripted NPC needs to check how he "feels" against another entity, such as when [NPC:Disposition](https://wiki.facepunch.com/gmod/NPC:Disposition) is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GetRelationship)
---@param ent Entity The entity in question
---@return number # How our scripter NPC "feels" towards the entity in question. See Enums/D. Not returning any value will make NPC:Disposition return the default disposition for this SNPC's given `m_iClass` by the engine.
function ENTITY:GetRelationship(ent) end

---[CLIENT] Returns the entity's render angles, set by [Entity:SetRenderAngles](https://wiki.facepunch.com/gmod/Entity:SetRenderAngles) in a drawing hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRenderAngles)
---@return Angle # The entitys render angles
function Entity:GetRenderAngles() end

---[CLIENT] Returns render bounds of the entity as local vectors. Can be overridden by [Entity:SetRenderBounds](https://wiki.facepunch.com/gmod/Entity:SetRenderBounds).
---
--- If the render bounds are not inside players view, the entity will not be drawn!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRenderBounds)
---@return Vector # The minimum vector of the bounds
---@return Vector # The maximum vector of the bounds.
function Entity:GetRenderBounds() end

---[SHARED] Returns current render FX of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRenderFX)
---@return number # The current render FX of the entity. See Enums/kRenderFx
function Entity:GetRenderFX() end

---[CLIENT] Returns the render group of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRenderGroup)
---@return number # The render group. See Enums/RENDERGROUP
function Entity:GetRenderGroup() end

---[CLIENT] Specify a mesh that should be rendered instead of this SENT's model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GetRenderMesh)
---@return table # A table containing the following keys:
--- * IMesh Mesh - Required
--- * IMaterial Material - Required
--- * VMatrix Matrix - Optional
function ENTITY:GetRenderMesh() end

---[SHARED] Returns the render mode of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRenderMode)
---@return number # The render Mode. See Enums/RENDERMODE
function Entity:GetRenderMode() end

---[CLIENT] Returns the entity's render origin, set by [Entity:SetRenderOrigin](https://wiki.facepunch.com/gmod/Entity:SetRenderOrigin) in a drawing hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRenderOrigin)
---@return Vector # The entitys render origin
function Entity:GetRenderOrigin() end

---[SHARED] Returns the rightward vector of the entity, as a normalized direction vector
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRight)
---@return Vector # rightDir
function Entity:GetRight() end

---[SHARED] Returns axis-aligned bounding box (AABB) of a orientated bounding box (OBB) based on entity's rotation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetRotatedAABB)
---@param min Vector Minimum extent of an OBB in local coordinates.
---@param max Vector Maximum extent of an OBB in local coordinates.
---@return Vector # Minimum extent of the AABB relative to entity's position.
---@return Vector # Maximum extent of the AABB relative to entity's position.
function Entity:GetRotatedAABB(min, max) end

---[SHARED] Returns a table of save values for an entity.
---
--- These tables are not the same between the client and the server, and different entities may have different fields.
---
--- **NOTE**: It is highly recommended to use [Entity:GetInternalVariable](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable) for retrieving a single key of the save table for performance reasons.
---
--- You can get the list different fields an entity has by looking at it's source code (the 2013 SDK can be found [online](https://github.com/ValveSoftware/source-sdk-2013)). Accessible fields are defined by each `DEFINE_FIELD` and `DEFINE_KEYFIELD` inside the `DATADESC` block.
---
--- Take the headcrab, for example:
---
--- ```
--- BEGIN_DATADESC( CBaseHeadcrab )
--- 	// m_nGibCount - don't save
--- 	DEFINE_FIELD( m_bHidden, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_flTimeDrown, FIELD_TIME ),
--- 	DEFINE_FIELD( m_bCommittedToJump, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_vecCommittedJumpPos, FIELD_POSITION_VECTOR ),
--- 	DEFINE_FIELD( m_flNextNPCThink, FIELD_TIME ),
--- 	DEFINE_FIELD( m_flIgnoreWorldCollisionTime, FIELD_TIME ),
---
--- 	DEFINE_KEYFIELD( m_bStartBurrowed, FIELD_BOOLEAN, "startburrowed" ),
--- 	DEFINE_FIELD( m_bBurrowed, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_flBurrowTime, FIELD_TIME ),
--- 	DEFINE_FIELD( m_nContext, FIELD_INTEGER ),
--- 	DEFINE_FIELD( m_bCrawlFromCanister, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_bMidJump, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_nJumpFromCanisterDir, FIELD_INTEGER ),
--- 	DEFINE_FIELD( m_bHangingFromCeiling, FIELD_BOOLEAN ),
--- 	DEFINE_FIELD( m_flIlluminatedTime, FIELD_TIME ),
---
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "Burrow", InputBurrow ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "BurrowImmediate", InputBurrowImmediate ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "Unburrow", InputUnburrow ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "StartHangingFromCeiling", InputStartHangingFromCeiling ),
--- 	DEFINE_INPUTFUNC( FIELD_VOID, "DropFromCeiling", InputDropFromCeiling ),
---
--- 	// Function Pointers
--- 	DEFINE_THINKFUNC( EliminateRollAndPitch ),
--- 	DEFINE_THINKFUNC( ThrowThink ),
--- 	DEFINE_ENTITYFUNC( LeapTouch ),
--- END_DATADESC()
--- ```
---
--- * For each **DEFINE_FIELD**, the save table will have a key with name of **first** argument.
--- * For each **DEFINE_KEYFIELD**, the save table will have a key with name of the **third** argument.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSaveTable)
---@param showAll boolean If set, shows all variables, not just the ones marked for save/load system.
---@return table # A table containing all save values in key/value format.
---
--- The value may be a sequential table (starting with **1**) if the field in question is an array in engine.
function Entity:GetSaveTable(showAll) end

---[SHARED] Return the index of the model sequence that is currently active for the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequence)
---@return number # The index of the model sequence.
function Entity:GetSequence() end

---[SHARED] Return activity id out of sequence id. Opposite of [Entity:SelectWeightedSequence](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceActivity)
---@param seq number The sequence ID
---@return number # The activity ID, ie Enums/ACT
function Entity:GetSequenceActivity(seq) end

---[SHARED] Returns the activity name for the given sequence id.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceActivityName)
---@param sequenceId number The sequence id.
---@return string # The Enums/ACT as a string, returns "Not Found!" with an invalid sequence and "No model!" when no model is set.
function Entity:GetSequenceActivityName(sequenceId) end

---[SHARED] Returns the amount of sequences ( animations ) the entity's model has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceCount)
---@return number # The amount of sequences ( animations ) the entity's model has.
function Entity:GetSequenceCount() end

---[SHARED] Returns the ground speed of the entity's sequence.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceGroundSpeed)
---@param sequenceId number The sequence ID.
---@return number # The ground speed of this sequence.
function Entity:GetSequenceGroundSpeed(sequenceId) end

---[SHARED] Returns a table of information about an entity's sequence.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceInfo)
---@param sequenceId number The sequence id of the entity.
---@return table # Table of information about the entity's sequence, or `nil` is ID is out of range. See Structures/SequenceInfo.
function Entity:GetSequenceInfo(sequenceId) end

---[SHARED] Returns a list of all sequences ( animations ) the model has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceList)
---@return table # The list of all sequences ( animations ) the model has. The indices start with 0!
function Entity:GetSequenceList() end

---[SHARED] Returns an entity's sequence move distance (the change in position over the course of the entire sequence).
---
--- See [Entity:GetSequenceMovement](https://wiki.facepunch.com/gmod/Entity:GetSequenceMovement) for a similar function with more options.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceMoveDist)
---@param sequenceId number The sequence index.
---@return number # The move distance of the sequence.
function Entity:GetSequenceMoveDist(sequenceId) end

---[SHARED] Returns the delta movement and angles of a sequence of the entity's model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceMovement)
---@param sequenceId number The sequence index. See Entity:LookupSequence.
---@param startCycle? number The sequence start cycle. 0 is the start of the animation, 1 is the end.
---@param endCyclnde? number The sequence end cycle. 0 is the start of the animation, 1 is the end. Values like 2, etc are allowed.
---@return boolean # Whether the operation was successful
---@return Vector # The delta vector of the animation, how much the model's origin point moved.
---@return Angle # The delta angle of the animation.
function Entity:GetSequenceMovement(sequenceId, startCycle, endCyclnde) end

---[SERVER] Returns the change in heading direction in between the start and the end of the sequence.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceMoveYaw)
---@param seq number The sequence index. See Entity:LookupSequence.
---@return number # The yaw delta. Returns 99999 for no movement.
function Entity:GetSequenceMoveYaw(seq) end

---[SHARED] Return the name of the sequence for the index provided.
--- Refer to [Entity:GetSequence](https://wiki.facepunch.com/gmod/Entity:GetSequence) to find the current active sequence on this entity.
---
--- See [Entity:LookupSequence](https://wiki.facepunch.com/gmod/Entity:LookupSequence) for a function that does the opposite.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceName)
---@param index number The index of the sequence to look up.
---@return string # Name of the sequence.
function Entity:GetSequenceName(index) end

---[SHARED] Returns an entity's sequence velocity at given animation frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSequenceVelocity)
---@param sequenceId number The sequence index.
---@param cycle number The point in animation, from `0` to `1`.
---@return Vector # Velocity of the sequence at given point in the animation.
function Entity:GetSequenceVelocity(sequenceId, cycle) end

---[CLIENT] Called when the shadow needs to be recomputed. Allows shadow angles to be customized. This only works for `anim` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GetShadowCastDirection)
---@param type number Type of the shadow this entity uses. Possible values:
--- * 0 - No shadow
--- * 1 - Simple 'blob' shadow
--- * 2 - Render To Texture shadow (updates only when necessary)
--- * 3 - Dynamic RTT - updates always
--- * 4 - Render to Depth Texture
---@return Vector # The new shadow direction to use.
function ENTITY:GetShadowCastDirection(type) end

---[SHARED] Checks if the entity plays a sound when picked up by a player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetShouldPlayPickupSound)
---@return boolean # `true` if it plays the pickup sound, `false` otherwise.
function Entity:GetShouldPlayPickupSound() end

---[SHARED] Returns if entity should create a server ragdoll on death or a client one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetShouldServerRagdoll)
---@return boolean # Returns true if ragdoll will be created on server, false if on client
function Entity:GetShouldServerRagdoll() end

---[SHARED] Returns the skin index of the current skin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSkin)
---@return number # skinIndex
function Entity:GetSkin() end

---[SHARED] Returns solid type of an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSolid)
---@return number # The solid type. See the Enums/SOLID.
function Entity:GetSolid() end

---[SHARED] Returns solid flag(s) of an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSolidFlags)
---@return number # The flag(s) of the entity, see Enums/FSOLID.
function Entity:GetSolidFlags() end

---[SERVER] Called every second to poll the sound hint interests of this SNPC. This is used in conjunction with other sound hint functions, such as [sound.EmitHint](https://wiki.facepunch.com/gmod/sound.EmitHint) and [NPC:GetBestSoundHint](https://wiki.facepunch.com/gmod/NPC:GetBestSoundHint).
--- **NOTE**: This hook only exists for `ai` type SENTs
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GetSoundInterests)
---@return number # A bitflag representing which sound types this NPC wants to react to.  See Enums/SOUND.
function ENTITY:GetSoundInterests() end

---[SHARED] Returns if we should show a spawn effect on spawn on this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSpawnEffect)
---@return boolean # The flag to allow or disallow the spawn effect.
function Entity:GetSpawnEffect() end

---[SHARED] Returns the bitwise spawn flags used by the entity. These can be set by [Entity:SetKeyValue](https://wiki.facepunch.com/gmod/Entity:SetKeyValue).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSpawnFlags)
---@return number # The spawn flags of the entity, see Enums/SF.
function Entity:GetSpawnFlags() end

---[SHARED] Returns the material override for the given index.
---
--- Returns "" if no material override exists. Use [Entity:GetMaterials](https://wiki.facepunch.com/gmod/Entity:GetMaterials) to list it's default materials.
---
--- The server's value takes priority on the client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSubMaterial)
---@param index number The index of the sub material. Acceptable values are from 0 to 31.
---@return string # The material that overrides this index, if any.
function Entity:GetSubMaterial(index) end

---[SHARED] Returns a list of models included into the entity's model in the .qc file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSubModels)
---@return table # The list of models included into the entity's model in the .qc file.
function Entity:GetSubModels() end

---[SHARED] Returns two vectors representing the minimum and maximum extent of the entity's axis-aligned bounding box for hitbox detection. In most cases, this will return the same bounding box as [Entity:WorldSpaceAABB](https://wiki.facepunch.com/gmod/Entity:WorldSpaceAABB) unless it was changed by [Entity:SetSurroundingBounds](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBounds) or [Entity:SetSurroundingBoundsType](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetSurroundingBounds)
---@return Vector # The minimum vector for the entity's bounding box in world space.
---@return Vector # The maximum vector for the entity's bounding box in world space.
function Entity:GetSurroundingBounds() end

---[SHARED] Returns a [table](https://wiki.facepunch.com/gmod/table) that contains all lua-based key-value pairs saved on the [Entity](https://wiki.facepunch.com/gmod/Entity).
---
--- 		For retrieving engine-based key-value pairs, see [Entity:GetSaveTable](https://wiki.facepunch.com/gmod/Entity:GetSaveTable)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetTable)
---@return table #
--- 			A table of the lua data stored on the Entity, or `nil` if the Entity is NULL.
function Entity:GetTable() end

---[SHARED] Returns the last trace used in the collision callbacks such as [ENTITY:StartTouch](https://wiki.facepunch.com/gmod/ENTITY:StartTouch), [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch) and [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch).
---
--- **NOTE**: This returns the last collision trace used, regardless of the entity that caused it. As such, it's only reliable when used in the hooks mentioned above
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetTouchTrace)
---@return table # The Structures/TraceResult
function Entity:GetTouchTrace() end

---[SHARED] Returns true if the TransmitWithParent flag is set or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetTransmitWithParent)
---@return boolean # Is the TransmitWithParent flag is set or not
function Entity:GetTransmitWithParent() end

---[SERVER] Returns if the entity is unfreezable, meaning it can't be frozen with the physgun. By default props are freezable, so this function will typically return false.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetUnFreezable)
---@return boolean # True if the entity is unfreezable, false otherwise.
function Entity:GetUnFreezable() end

---[SHARED] Returns the upward vector of the entity, as a normalized direction vector
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetUp)
---@return Vector # upDir
function Entity:GetUp() end

---[SHARED] Retrieves a value from entity's [Entity:GetTable](https://wiki.facepunch.com/gmod/Entity:GetTable). Set by [Entity:SetVar](https://wiki.facepunch.com/gmod/Entity:SetVar).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetVar)
---@param key any Key of the value to retrieve
---@param default? any A default value to fallback to if we couldn't retrieve the value from entity
---@return any # Retrieved value
function Entity:GetVar(key, default) end

---[SHARED] Returns the entity's velocity.
---
--- **NOTE**: Actually binds to `CBaseEntity::GetAbsVelocity()` on the server and `C_BaseEntity::EstimateAbsVelocity()` on the client. This returns the total velocity of the entity and is equal to local velocity + base velocity.
---
--- This can become out-of-sync on the client if the server has been up for a long time.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetVelocity)
---@return Vector # The velocity of the entity.
function Entity:GetVelocity() end

---[SERVER] Returns ID of workshop addon that the entity is from.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetWorkshopID)
---@return number # The workshop ID
---@deprecated The function **currently** does nothing and always returns nil
function Entity:GetWorkshopID() end

---[SHARED] Returns the position and angle of the entity as a 3x4 matrix ([VMatrix](https://wiki.facepunch.com/gmod/VMatrix) is 4x4 so the fourth row goes unused). The first three columns store the angle as a [rotation matrix](https://en.wikipedia.org/wiki/Rotation_matrix), and the fourth column stores the position vector.
---
--- This returns incorrect results for the angular component (columns 1-3) for the local player clientside.
---
--- This will use the local player's [Global.EyeAngles](https://wiki.facepunch.com/gmod/Global.EyeAngles) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks).
---
--- Columns 1-3 will be all 0 (angular component) in [rendering hooks](https://wiki.facepunch.com/gmod/3D_Rendering_Hooks) while paused in single-player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GetWorldTransformMatrix)
---@return VMatrix # The position and angle matrix.
function Entity:GetWorldTransformMatrix() end

---[SHARED] Causes the entity to break into its current models gibs, if it has any.
---
--- You must call [Entity:PrecacheGibs](https://wiki.facepunch.com/gmod/Entity:PrecacheGibs) on the entity before using this function, or it will not create any gibs.
---
--- If called on server, the gibs will be spawned on the currently connected clients and will not be synchronized. Otherwise the gibs will be spawned only for the client the function is called on.
---
--- **NOTE**: this function will not remove or hide the entity it is called on.
--- 	For more expensive version of this function see [Entity:GibBreakServer](https://wiki.facepunch.com/gmod/Entity:GibBreakServer).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GibBreakClient)
---@param force Vector The force to apply to the created gibs.
---@param clr? table If set, this will be color of the broken gibs instead of the entity's color.
function Entity:GibBreakClient(force, clr) end

---[SHARED] Causes the entity to break into its current models gibs, if it has any.
---
--- You must call [Entity:PrecacheGibs](https://wiki.facepunch.com/gmod/Entity:PrecacheGibs) on the entity before using this function, or it will not create any gibs.
---
--- The gibs will be spawned on the server and be synchronized with all clients.
---
--- Note, that this function will not remove or hide the entity it is called on.
---
--- This function is affected by `props_break_max_pieces_perframe` and `props_break_max_pieces` console variables.
---
--- **WARNING**: Large numbers of serverside gibs will cause lag.
---
--- You can avoid this cost by spawning the gibs on the client using [Entity:GibBreakClient](https://wiki.facepunch.com/gmod/Entity:GibBreakClient)
---
--- **NOTE**: Despite existing on client, it doesn't actually do anything on client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:GibBreakServer)
---@param force Vector The force to apply to the created gibs
function Entity:GibBreakServer(force) end

---[SERVER] Called by [GM:GravGunPickupAllowed](https://wiki.facepunch.com/gmod/GM:GravGunPickupAllowed) on ALL entites in Sandbox-derived  gamemodes and acts as an override.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GravGunPickupAllowed)
---@param ply Player The player aiming at us
---@return boolean # Return true to allow the entity to be picked up
function ENTITY:GravGunPickupAllowed(ply) end

---[SHARED] Called when this entity is about to be punted with the gravity gun (primary fire).
---
--- Only works in Sandbox derived gamemodes and only if [GM:GravGunPunt](https://wiki.facepunch.com/gmod/GM:GravGunPunt) is not overridden.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:GravGunPunt)
---@param ply Player The player pressing left-click with the gravity gun at an entity
---@return boolean # Return true or false to enable or disable punting respectively.
function ENTITY:GravGunPunt(ply) end

---[SERVER] Called before firing serverside animation events, such as weapon reload, drawing and holstering for NPCs, scripted sequences, etc.
---
--- See [ENTITY:FireAnimationEvent](https://wiki.facepunch.com/gmod/ENTITY:FireAnimationEvent) for the clientside version.
---
--- **NOTE**: This hook only works on "anim", "ai" and "nextbot" type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:HandleAnimEvent)
---@param event number The event ID of happened even. See [this page](http://developer.valvesoftware.com/wiki/Animation_Events).
---@param eventTime number The absolute time this event occurred using Global.CurTime.
---@param cycle number The frame this event occurred as a number between 0 and 1.
---@param type number Event type. See [the Source SDK](https://github.com/ValveSoftware/source-sdk-2013/blob/master/mp/src/game/shared/eventlist.h#L14-L23).
---@param options string Name or options of this event.
---@return boolean # Return true to mark the event as handled
function ENTITY:HandleAnimEvent(event, eventTime, cycle, type, options) end

---[SHARED] Returns whether or not the bone manipulation functions have ever been called on given  entity.
---
--- Related functions are [Entity:ManipulateBonePosition](https://wiki.facepunch.com/gmod/Entity:ManipulateBonePosition), [Entity:ManipulateBoneAngles](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneAngles), [Entity:ManipulateBoneJiggle](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneJiggle), and [Entity:ManipulateBoneScale](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneScale).
---
--- This will return true if the entity's bones have ever been manipulated. Resetting the position/angles/jiggle/scaling to 0,0,0 will not affect this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:HasBoneManipulations)
---@return boolean # True if the entity has been bone manipulated, false otherwise.
function Entity:HasBoneManipulations() end

---[SHARED] Returns whether or not the the entity has had flex manipulations performed with [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight) or [Entity:SetFlexScale](https://wiki.facepunch.com/gmod/Entity:SetFlexScale).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:HasFlexManipulatior)
---@return boolean # True if the entity has flex manipulations, false otherwise.
function Entity:HasFlexManipulatior() end

---[SHARED] Returns whether this entity has the specified spawnflags bits set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:HasSpawnFlags)
---@param spawnFlags number The spawnflag bits to check, see Enums/SF.
---@return boolean # Whether the entity has that spawnflag set or not.
function Entity:HasSpawnFlags(spawnFlags) end

---[SERVER] Returns the position of the head of this entity, NPCs use this internally to aim at their targets.
---
--- **NOTE**: This only works on players and NPCs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:HeadTarget)
---@param origin Vector The vector of where the attack comes from.
---@return Vector # The head position.
function Entity:HeadTarget(origin) end

---[SHARED] Returns the health of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Health)
---@return number # health
function Entity:Health() end

---[SERVER] Sets the entity on fire.
---
--- See also [Entity:Extinguish](https://wiki.facepunch.com/gmod/Entity:Extinguish).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Ignite)
---@param length number How long to keep the entity ignited, in seconds.
---@param radius? number The radius of the ignition, will ignite everything around the entity that is in this radius.
function Entity:Ignite(length, radius) end

---[CLIENT] Called when a bullet trace hits this entity and allows you to override the default behavior by returning true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:ImpactTrace)
---@param traceResult table The trace that hit this entity as a Structures/TraceResult.
---@param damageType number The damage bits associated with the trace, see Enums/DMG
---@param customImpactName? string The effect name to override the impact effect with.
--- Possible arguments are ImpactJeep, AirboatGunImpact, HelicopterImpact, ImpactGunship.
---@return boolean # Return true to override the default impact effects.
function ENTITY:ImpactTrace(traceResult, damageType, customImpactName) end

---[SHARED] Called when the entity is created. This is called when you [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn) the custom entity.
---
--- This is called **after** [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables) and [GM:OnEntityCreated](https://wiki.facepunch.com/gmod/GM:OnEntityCreated).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:Initialize)
function ENTITY:Initialize() end

---[CLIENT] Initializes this entity as being clientside only.
---
--- Only works on entities fully created clientside, and as such it currently has no use due to this being automatically called by [ents.CreateClientProp](https://wiki.facepunch.com/gmod/ents.CreateClientProp), [ents.CreateClientside](https://wiki.facepunch.com/gmod/ents.CreateClientside), [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) and [Global.ClientsideScene](https://wiki.facepunch.com/gmod/Global.ClientsideScene).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:InitializeAsClientEntity)
---@deprecated This function got disabled and will always throw an error if it's used. This is the error:  ``` [ERROR] InitializeAsClientEntity is deprecated and should no longer be used. ```
function Entity:InitializeAsClientEntity() end

---[SERVER] Fires input to the entity with the ability to make another entity responsible, bypassing the event queue system.
---
--- You should only use this function over [Entity:Fire](https://wiki.facepunch.com/gmod/Entity:Fire) if you know what you are doing.
---
--- See also [Entity:Fire](https://wiki.facepunch.com/gmod/Entity:Fire) for a function that conforms to the internal map IO event queue and [GM:AcceptInput](https://wiki.facepunch.com/gmod/GM:AcceptInput) for a hook that can intercept inputs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Input)
---@param input string The name of the input to fire
---@param activator? Entity The entity that caused this input (i.e. the player who pushed a button)
---@param caller? Entity The entity that is triggering this input (i.e. the button that was pushed)
---@param param? any The value to give to the input. Can be either a string, a number or a boolean.
function Entity:Input(input, activator, caller, param) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Sets up Data Tables from entity to use with [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:InstallDataTable)
function Entity:InstallDataTable() end

---[CLIENT] Resets the entity's bone cache values in order to prepare for a model change.
---
--- This should be called after calling [Entity:SetPoseParameter](https://wiki.facepunch.com/gmod/Entity:SetPoseParameter).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:InvalidateBoneCache)
function Entity:InvalidateBoneCache() end

---[SHARED] Returns true if the entity has constraints attached to it
---
--- This will only update clientside if the server calls it first. This only checks constraints added through the [constraint](https://wiki.facepunch.com/gmod/constraint) so this will not react to map constraints.
---
--- For a serverside alternative, see [constraint.HasConstraints](https://wiki.facepunch.com/gmod/constraint.HasConstraints)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsConstrained)
---@return boolean # Whether the entity is constrained or not.
function Entity:IsConstrained() end

---[SERVER] Returns if entity is constraint or not
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsConstraint)
---@return boolean # Is the entity a constraint or not
function Entity:IsConstraint() end

---[SHARED] Returns whether the entity is dormant or not.
---
--- Client/server entities become dormant when they leave the PVS on the server. Client side entities can decide for themselves whether to become dormant.
--- This mainly applies to [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community").
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsDormant)
---@return boolean # Whether the entity is dormant or not.
function Entity:IsDormant() end

---[SHARED] Returns whether an entity has engine effect applied or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsEffectActive)
---@param effect number The effect to check for, see Enums/EF.
---@return boolean # Whether the entity has the engine effect applied or not.
function Entity:IsEffectActive(effect) end

---[SHARED] Checks if given flag is set or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsEFlagSet)
---@param flag number The engine flag to test, see Enums/EFL
---@return boolean # Is set or not
function Entity:IsEFlagSet(flag) end

---[SHARED] Checks if given flag(s) is set or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsFlagSet)
---@param flag number The engine flag(s) to test, see Enums/FL
---@return boolean # Is set or not
function Entity:IsFlagSet(flag) end

---[SERVER] Returns whether the entity is in the world (not inside a wall or outside of the map).
---
--- **NOTE**: Internally this function uses [util.IsInWorld](https://wiki.facepunch.com/gmod/util.IsInWorld), that means that this function only checks [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos) of the entity. If an entity is only partially inside a wall, or has a weird GetPos offset, this function may not give reliable output.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsInWorld)
---@return boolean # False if the entity is inside a wall or outside of the map, true otherwise.
function Entity:IsInWorld() end

---[SERVER] Called when deciding if the Scripted NPC should be able to perform a certain jump or not.
--- **NOTE**: This is only called for "ai" type entities
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:IsJumpLegal)
---@param startPos Vector Start of the jump
---@param apex Vector Apex point of the jump
---@param endPos Vector The landing position
---@return boolean # Return true if this jump should be allowed to be performed, false otherwise.
---
--- Not returning anything, or returning a non boolean will perform the default action.
function ENTITY:IsJumpLegal(startPos, apex, endPos) end

---[SERVER] Returns whether the entity is lag compensated or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsLagCompensated)
---@return boolean # Whether the entity is lag compensated or not.
function Entity:IsLagCompensated() end

---[SHARED] Returns true if the target is in line of sight.
--- 		**NOTE**: This will only work when called on CBaseCombatCharacter entities. This includes players, NPCs, grenades, RPG rockets, crossbow bolts, and physics cannisters.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsLineOfSightClear)
---@param target Vector The target to test. You can also supply an Entity instead of a Vector
---@return boolean # Returns true if the line of sight is clear
function Entity:IsLineOfSightClear(target) end

---[SHARED] Returns if the entity is going to be deleted in the next frame. Entities marked for deletion should not be accessed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsMarkedForDeletion)
---@return boolean # If the entity is going to be deleted.
function Entity:IsMarkedForDeletion() end

---[SHARED] Checks if the entity is a [NextBot](https://wiki.facepunch.com/gmod/NextBot) or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsNextBot)
---@return boolean # Whether the entity is an NextBot entity or not.
function Entity:IsNextBot() end

---[SHARED] Checks if the entity is an NPC or not.
---
--- This will return false for [NextBot](https://wiki.facepunch.com/gmod/NextBot)s, see [Entity:IsNextBot](https://wiki.facepunch.com/gmod/Entity:IsNextBot) for that.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsNPC)
---@return boolean # Whether the entity is an NPC.
function Entity:IsNPC() end

---[SHARED] Returns whether the entity is on fire.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsOnFire)
---@return boolean # Whether the entity is on fire or not.
function Entity:IsOnFire() end

---[SHARED] Returns whether the entity is on ground or not.
---
--- Internally, this checks if [FL_ONGROUND](https://wiki.facepunch.com/gmod/Enums/FL) is set on the entity.
---
--- This function is an alias of [Entity:OnGround](https://wiki.facepunch.com/gmod/Entity:OnGround).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsOnGround)
---@return boolean # Whether the entity is on ground or not.
function Entity:IsOnGround() end

---[SHARED] Checks if the entity is a player or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsPlayer)
---@return boolean # Whether the entity is a player.
function Entity:IsPlayer() end

---[SERVER] Returns true if the entity is being held by a player. Either by physics gun, gravity gun or use-key (+use).
---
--- If multiple players are holding an object and one drops it, this will return false despite the object still being held.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsPlayerHolding)
---@return boolean # IsBeingHeld
function Entity:IsPlayerHolding() end

---[SERVER] Returns whether there's a gesture with the given activity being played.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsPlayingGesture)
---@param activity number The activity to test. See Enums/ACT.
---@return boolean # Whether there's a gesture is given activity being played.
function Entity:IsPlayingGesture(activity) end

---[SHARED] Returns whether a given point is within the entity's Orientated Bounding Box.
---
--- This relies on the entity having a collision mesh (not a physics object) and will be affected by `SOLID_NONE`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsPointInBounds)
---@param point Vector The point to test, in world space coordinates.
---@return boolean # Whether the point is within the entity's bounds.
function Entity:IsPointInBounds(point) end

---[SHARED] Checks if the entity is a ragdoll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsRagdoll)
---@return boolean # Is ragdoll or not
function Entity:IsRagdoll() end

---[SHARED] Checks if the entity is a SENT or a built-in entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsScripted)
---@return boolean # Returns true if entity is scripted ( SENT ), false if not ( A built-in engine entity )
function Entity:IsScripted() end

---[SHARED] Returns whether the entity's current sequence is finished or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsSequenceFinished)
---@return boolean # Whether the entity's sequence is finished or not.
function Entity:IsSequenceFinished() end

---[SHARED] Returns if the entity is solid or not.
--- Very useful for determining if the entity is a trigger or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsSolid)
---@return boolean # Whether the entity is solid or not.
function Entity:IsSolid() end

---[SHARED] Returns whether the entity is a valid entity or not.
---
--- An entity is valid if:
--- * It is not a [NULL](https://wiki.facepunch.com/gmod/Global_Variables) entity
--- * It is not the worldspawn entity ([game.GetWorld](https://wiki.facepunch.com/gmod/game.GetWorld))
---
--- **NOTE**: Instead of calling this method directly, it's a good idea to call the global [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) instead, however if you're sure the variable you're using is always an entity object it's better to use this method
---
--- It will check whether the given variable contains an object (an Entity) or nothing at all for you. See examples.
---
--- **WARNING**: NULL entities can still be assigned with key/value pairs, but they will be instantly negated. See example 3
---
--- This might be a cause for a lot of headache. Usually happening during networking etc., when completely valid entities suddenly become invalid on the client, but are never filtered with IsValid(). See [GM:InitPostEntity](https://wiki.facepunch.com/gmod/GM:InitPostEntity) for more details.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsValid)
---@return boolean # true if the entity is valid, false otherwise
function Entity:IsValid() end

---[SHARED] Returns whether the given layer ID is valid and exists on this entity.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsValidLayer)
---@param layerID number The Layer ID
---@return boolean # Whether the given layer ID is valid and exists on this entity.
function Entity:IsValidLayer(layerID) end

---[SHARED] Checks if the entity is a vehicle or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsVehicle)
---@return boolean # Whether the entity is a vehicle.
function Entity:IsVehicle() end

---[SHARED] Checks if the entity is a weapon or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsWeapon)
---@return boolean # Whether the entity is a weapon
function Entity:IsWeapon() end

---[SHARED] Returns whether the entity is a widget or not.
---
--- This is used by the "Edit Bones" context menu property.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsWidget)
---@return boolean # Whether the entity is a widget or not.
function Entity:IsWidget() end

---[SHARED] Returns if this entity is the map entity `Entity[0] worldspawn`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:IsWorld)
---@return boolean # Whether this entity is the world entity.
function Entity:IsWorld() end

---[SERVER] Called when the engine sets a value for this scripted entity.
---
--- This hook is called **before** [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) when the key-values are set by the map.
--- Otherwise this hook will be called whenever [Entity:SetKeyValue](https://wiki.facepunch.com/gmod/Entity:SetKeyValue) is called on the entity.
---
--- See [GM:EntityKeyValue](https://wiki.facepunch.com/gmod/GM:EntityKeyValue) for a hook that works for all entities.
---
--- See [WEAPON:KeyValue](https://wiki.facepunch.com/gmod/WEAPON:KeyValue) for a hook that works for scripted weapons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:KeyValue)
---@param key string The key that was affected.
---@param value string The new value.
---@return boolean # Return true to suppress this KeyValue or return false or nothing to apply this key value.
function ENTITY:KeyValue(key, value) end

---[SHARED] Converts a vector local to an entity into a worldspace vector
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:LocalToWorld)
---@param lpos Vector The local vector
---@return Vector # The translated to world coordinates vector
function Entity:LocalToWorld(lpos) end

---[SHARED] Converts a local angle (local to the entity) to a world angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:LocalToWorldAngles)
---@param ang Angle The local angle
---@return Angle # The world angle
function Entity:LocalToWorldAngles(ang) end

---[SHARED] Returns the attachment index of the given attachment name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:LookupAttachment)
---@param attachmentName string The name of the attachment.
---@return number # The attachment index, or 0 if the attachment does not exist and -1 if the model is invalid.
function Entity:LookupAttachment(attachmentName) end

---[SHARED] Gets the bone index of the given bone name, returns `nil` if the bone does not exist.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:LookupBone)
---@param boneName string The name of the bone.
---
--- Common generic bones ( for player models and some HL2 models ):
--- * ValveBiped.Bip01_Head1
--- * ValveBiped.Bip01_Spine
--- * ValveBiped.Anim_Attachment_RH
---
--- Common hand bones (left hand equivalents also available, replace _R_ with _L_)
--- * ValveBiped.Bip01_R_Hand
--- * ValveBiped.Bip01_R_Forearm
--- * ValveBiped.Bip01_R_Foot
--- * ValveBiped.Bip01_R_Thigh
--- * ValveBiped.Bip01_R_Calf
--- * ValveBiped.Bip01_R_Shoulder
--- * ValveBiped.Bip01_R_Elbow
---@return number # Index of the given bone name, or `nil` if the bone doesn't exist on the Entity
function Entity:LookupBone(boneName) end

---[SHARED] Returns pose parameter ID from its name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:LookupPoseParameter)
---@param name string Pose parameter name
---@return number # The ID of the given pose parameter name, if it exists, -1 otherwise
function Entity:LookupPoseParameter(name) end

---[SHARED] Returns sequence ID from its name. See [Entity:GetSequenceName](https://wiki.facepunch.com/gmod/Entity:GetSequenceName) for a function that does the opposite.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:LookupSequence)
---@param name string Sequence name
---@return number # Sequence ID for that name. This **will** differ for models with same sequence names. Will be -1 when the sequence is invalid.
---@return number # The sequence duration
--- * 0 if the sequence is invalid
function Entity:LookupSequence(name) end

---[SHARED] Turns the [Entity:GetPhysicsObject](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObject) into a physics shadow.
--- It's used internally for the Player's and NPC's physics object, and certain HL2 entities such as the crane.
---
--- A physics shadow can be used to have static entities that never move by setting both arguments to false.
---
--- **NOTE**: Unlike [Entity:PhysicsInitShadow](https://wiki.facepunch.com/gmod/Entity:PhysicsInitShadow), this function doesn't remove the current physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:MakePhysicsObjectAShadow)
---@param allowPhysicsMovement? boolean Whether to allow the physics shadow to move under stress.
---@param allowPhysicsRotation? boolean Whether to allow the physics shadow to rotate under stress.
function Entity:MakePhysicsObjectAShadow(allowPhysicsMovement, allowPhysicsRotation) end

---[SHARED] Sets custom bone angles.
---
--- When used repeatedly serverside, this method is strongly discouraged due to the huge network traffic produced.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneAngles)
---@param boneID number Index of the bone you want to manipulate
---@param ang Angle Angle to apply.
---
--- The angle is relative to the original bone angle, not relative to the world or the entity.
---@param networking? boolean boolean to network these changes (if called from server)
function Entity:ManipulateBoneAngles(boneID, ang, networking) end

---[SHARED] Manipulates the bone's jiggle status. This allows non jiggly bones to become jiggly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneJiggle)
---@param boneID number Index of the bone you want to manipulate.
---@param type number The jiggle bone type. There are currently the following options:
--- * `0` = No jiggle override, use model default
--- * `1` = Force jiggle, with hardcoded settings
--- * `2` = Force disable jiggle bone (currently also broken, but will be fixed in the next update)
function Entity:ManipulateBoneJiggle(boneID, type) end

---[SHARED] Sets custom bone offsets.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ManipulateBonePosition)
---@param boneID number Index of the bone you want to manipulate.
---@param pos Vector Position vector to apply. Note that the position is relative to the original bone position, not relative to the world or the entity.
---@param networking? boolean boolean to network these changes (if called from server)
function Entity:ManipulateBonePosition(boneID, pos, networking) end

---[SHARED] Sets custom bone scale.
---
--- When used repeatedly serverside, this method is strongly discouraged due to the huge network traffic produced.
---
--- This does not scale procedural bones.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneScale)
---@param boneID number Index of the bone you want to manipulate
---@param scale Vector Scale vector to apply. Note that the scale is relative to the original bone scale, not relative to the world or the entity.
---
--- The vector will be normalised if its longer than 32 units.
function Entity:ManipulateBoneScale(boneID, scale) end

---[SHARED] Returns entity's map creation ID. Unlike [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex) or [Entity:GetCreationID](https://wiki.facepunch.com/gmod/Entity:GetCreationID), it will always be the same on same map, no matter how much you clean up or restart it.
---
--- To be used in conjunction with [ents.GetMapCreatedEntity](https://wiki.facepunch.com/gmod/ents.GetMapCreatedEntity).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:MapCreationID)
---@return number # The map creation ID or -1 if the entity is not compiled into the map.
function Entity:MapCreationID() end

---[CLIENT] Refreshes the shadow of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:MarkShadowAsDirty)
function Entity:MarkShadowAsDirty() end

---[SHARED] Fires the muzzle flash effect of the weapon the entity is carrying. This only creates a light effect and is often called alongside [Weapon:SendWeaponAnim](https://wiki.facepunch.com/gmod/Weapon:SendWeaponAnim)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:MuzzleFlash)
function Entity:MuzzleFlash() end

---[SHARED] Performs a Ray-Orientated Bounding Box intersection from the given position to the origin of the OBBox with the entity and returns the hit position on the OBBox.
---
--- This relies on the entity having a collision mesh (not a physics object) and will be affected by `SOLID_NONE`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:NearestPoint)
---@param position Vector The vector to start the intersection from.
---@return Vector # The nearest hit point of the entity's bounding box in world coordinates.
function Entity:NearestPoint(position) end

---[SHARED] Creates a network variable on the entity and adds Set/Get functions for it. This function should only be called in [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables).
---
--- See [Entity:NetworkVarNotify](https://wiki.facepunch.com/gmod/Entity:NetworkVarNotify) for a function to hook NetworkVar changes.
---
--- **NOTE**: Entity NetworkVars are influenced by the return value of [ENTITY:UpdateTransmitState](https://wiki.facepunch.com/gmod/ENTITY:UpdateTransmitState).
--- 	So if you use the **PVS**(**default**), then the NetworkVars can be different for each client.
---
--- **WARNING**: Make sure to not call the SetDT* and your custom set methods on the client realm unless you know exactly what you are doing.
---
--- Combining this function with [util.TableToJSON](https://wiki.facepunch.com/gmod/util.TableToJSON) can also provide a way to network tables as serialized strings.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:NetworkVar)
---@param type string Supported choices:
---
--- * `String` (up to 511 characters)
--- * `Bool`
--- * `Float`
--- * `Int` (32-bit signed integer)
--- * `Vector`
--- * `Angle`
--- * `Entity`
---@param slot number Each network variable has to have a unique slot. The slot is per type - so you can have an int in slot `0`, a bool in slot `0` and a float in slot `0` etc. You can't have two ints in slot `0`, instead you would do a int in slot `0` and another int in slot `1`.
---
--- The max slots right now are `32` - so you should pick a number between `0` and `31`. An exception to this is strings which has a max slots of `4`.
---
--- This can be omitted entirely (arguments will shift) and it will use the next available slot.
---@param name string The name will affect how you access it. If you call it `Foo` you would add two new functions on your entity - `SetFoo()` and `GetFoo()`. So be careful that what you call it won't collide with any existing functions (don't call it `Pos` for example).
---@param extended? table A table of extended information.
---
--- `KeyName`
--- * Allows the NetworkVar to be set using Entity:SetKeyValue. This is useful if you're making an entity that you want to be loaded in a map. The sky entity uses this.
---
--- `Edit`
--- * The edit key lets you mark this variable as editable. See Editable Entities for more information.
function Entity:NetworkVar(type, slot, name, extended) end

---[SHARED] Similarly to [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar), creates a network variable on the entity and adds Set/Get functions for it. This method stores it's value as a member value of a vector or an angle. This allows to go beyond the normal variable limit of [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) for `Int` and `Float` types, at the expense of `Vector` and `Angle` limit.
---
--- This function should only be called in [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables).
---
--- **WARNING**: Make sure to not call the SetDT* and your custom set methods on the client realm unless you know exactly what you are doing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:NetworkVarElement)
---@param type string Supported choices:
--- * `Vector`
--- * `Angle`
---@param slot number The slot for this `Vector` or `Angle`, from `0` to `31`. See Entity:NetworkVar for more detailed explanation.
---@param element string
--- 			Which element of a `Vector` or an `Angle` to store the value on. This can be `p`, `y`, `r` for Angles, and `x`, `y`, `z` for Vectors
---@param name string The name will affect how you access it. If you call it `Foo` you would add two new functions on your entity - `SetFoo()` and `GetFoo()`. So be careful that what you call it won't collide with any existing functions (don't call it "Pos" for example).
---@param extended? table A table of extra information. See Entity:NetworkVar for details.
function Entity:NetworkVarElement(type, slot, element, name, extended) end

---[SHARED] Creates a callback that will execute when the given network variable changes - that is, when the `Set()` function is run.
---
--- The callback is executed **before** the value is changed, and is called even if the new and old values are the same.
---
--- This function does not exist on entities in which [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) has not been called.
---
--- By default, this means this function only exists on SENTs (both serverside and clientside) and on players with a [Player Class](https://wiki.facepunch.com/gmod/Player_Classes) (serverside and clientside [Global.LocalPlayer](https://wiki.facepunch.com/gmod/Global.LocalPlayer) only).
---
--- It's therefore safest to only use this in [ENTITY:SetupDataTables](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables).
---
--- The callback will not be called clientside if the var is changed right after entity spawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:NetworkVarNotify)
---@param name string Name of variable to track changes of.
---@param callback fun(entity: Entity, name: string, old: any, new: any) The function to call when the variable changes.
---
--- Function argument(s):
--- * Entity `entity` - Entity whos variable changed.
--- * string `name` - Name of changed variable.
--- * any `old` - Old/current variable value.
--- * any `new` - New variable value that it was set to.
function Entity:NetworkVarNotify(name, callback) end

---[SERVER] Start the next task in specific schedule.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:NextTask)
---@param sched table The schedule to start next task in.
function ENTITY:NextTask(sched) end

---[SHARED] Controls when, relative to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime), the [Entity](https://wiki.facepunch.com/gmod/Entity) will next run its Think function.
---
--- For Scripted Entities, this is the [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) function.
--- For engine Entities, this is an internal function whose behavior will depend on the specific Entity type.
---
--- For a Client-side equivalent, see [Entity:SetNextClientThink](https://wiki.facepunch.com/gmod/Entity:SetNextClientThink).
---
--- This does not work with SWEPs or Nextbots.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:NextThink)
---@param timestamp number
--- 			The timestamp, relative to Global.CurTime, when the next think should occur.
function Entity:NextThink(timestamp) end

---[SHARED] Returns the center of an entity's bounding box in local space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:OBBCenter)
---@return Vector # The center of an entity's bounding box relative to its Entity:GetPos.
function Entity:OBBCenter() end

---[SHARED] Returns the highest corner of an entity's bounding box as a local vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:OBBMaxs)
---@return Vector # The local position of the highest corner of the entity's oriented bounding box.
function Entity:OBBMaxs() end

---[SHARED] Returns the lowest corner of an entity's bounding box as a local vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:OBBMins)
---@return Vector # The local position of the lowest corner of the entity's oriented bounding box.
function Entity:OBBMins() end

---[SHARED] Returns the entity's capabilities as a bitfield.
---
--- In the engine this function is mostly used to check the use type, the save/restore system and level transitions flags.
---
--- Even though the function is defined shared, it is not guaranteed to return the same value across states.
---
--- **NOTE**: The enums for this are not currently implemented in Lua, however you can access the defines [here](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/shared/baseentity_shared.h#L21-L38).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ObjectCaps)
---@return number # The bitfield, a combination of the [FCAP_](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/shared/baseentity_shared.h#L21-L38) flags.
function Entity:ObjectCaps() end

---[SERVER] Called when the currently active weapon of the SNPC changes.
--- **NOTE**: This hook only works on `ai` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnChangeActiveWeapon)
---@param old Weapon The previous active weapon.
---@param new Weapon The new active weapon.
function ENTITY:OnChangeActiveWeapon(old, new) end

---[SERVER] Called when the NPC has changed its activity.
---
--- **NOTE**: This hook only works for `ai` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnChangeActivity)
---@param act number The new activity. See Enums/ACT.
function ENTITY:OnChangeActivity(act) end

---[SERVER] Called each time the NPC updates its condition.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnCondition)
---@param conditionID number The ID of condition. See NPC:ConditionName.
function ENTITY:OnCondition(conditionID) end

---[SERVER] Called on any entity after it has been created by the [duplicator](https://wiki.facepunch.com/gmod/duplicator) and before any bone/entity modifiers have been applied.
---
--- This hook is called after [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) and before [ENTITY:PostEntityPaste](https://wiki.facepunch.com/gmod/ENTITY:PostEntityPaste).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnDuplicated)
---@param entTable table The stored data about the original entity that was duplicated. This would typically contain the Entity:GetTable fields that are serializalble. See Structures/EntityCopyData.
function ENTITY:OnDuplicated(entTable) end

---[SERVER] Called after duplicator finishes saving the entity, allowing you to modify the save data.
---
--- This is called after [ENTITY:PostEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PostEntityCopy).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnEntityCopyTableFinish)
---@param data table The save Structures/EntityCopyData that you can modify.
function ENTITY:OnEntityCopyTableFinish(data) end

---[SHARED] Returns true if the entity is on the ground, and false if it isn't.
---
--- Internally, this checks if [FL_ONGROUND](https://wiki.facepunch.com/gmod/Enums/FL) is set on the entity. This is only updated for players and NPCs, and thus won't inherently work for other entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:OnGround)
---@return boolean # Whether the entity is on the ground or not.
function Entity:OnGround() end

---[SERVER] Called when the SNPC completes its movement to its destination.
--- **NOTE**: This hook only works on `ai` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnMovementComplete)
function ENTITY:OnMovementComplete() end

---[SERVER] Called when the SNPC failed to move to its destination.
--- **NOTE**: This hook only works on `ai` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnMovementFailed)
function ENTITY:OnMovementFailed() end

---[SHARED] Called when the entity is reloaded by the lua auto-refresh system, i.e. when the developer edits the lua file for the entity while the game is running.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnReloaded)
function ENTITY:OnReloaded() end

---[SHARED] Called when the entity is about to be removed.
---
--- See also [Entity:CallOnRemove](https://wiki.facepunch.com/gmod/Entity:CallOnRemove), which can even be used on engine (non-Lua) entities.
---
--- 	Create an explosion when the entity will be removed. To create an entity, you can read [ents.Create](https://wiki.facepunch.com/gmod/ents.Create).
---
--- function ENT:OnRemove()
--- 	local explosion = ents.Create( "env_explosion" ) -- The explosion entity
--- 	explosion:SetPos( self:GetPos() ) -- Put the position of the explosion at the position of the entity
--- 	explosion:Spawn() -- Spawn the explosion
--- 	explosion:SetKeyValue( "iMagnitude", "50" ) -- the magnitude of the explosion
--- 	explosion:Fire( "Explode", 0, 0 ) -- explode
--- end
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnRemove)
---@param fullUpdate boolean Whether the removal is happening due to a full update clientside.
---
--- The entity may or **may not** be recreated immediately after, depending on whether it is in the local player's [PVS](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community"). (See Entity:IsDormant)
function ENTITY:OnRemove(fullUpdate) end

---[SHARED] Called when the entity is reloaded from a Source Engine save (not the Sandbox saves or dupes) or on a changelevel (for example Half-Life 2 campaign level transitions).
---
--- For the [duplicator](https://wiki.facepunch.com/gmod/duplicator) callbacks, see [ENTITY:OnDuplicated](https://wiki.facepunch.com/gmod/ENTITY:OnDuplicated).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnRestore)
function ENTITY:OnRestore() end

---[SERVER] Called by the engine when NPC's state changes.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnStateChange)
---@param oldState number The old state. See Enums/NPC_STATE.
---@param newState number The new state. See Enums/NPC_STATE.
function ENTITY:OnStateChange(oldState, newState) end

---[SERVER] Called when the entity is taking damage.
---
--- **WARNING**: Calling [Entity:TakeDamage](https://wiki.facepunch.com/gmod/Entity:TakeDamage), [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo), [Entity:DispatchTraceAttack](https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack), or [Player:TraceHullAttack](https://wiki.facepunch.com/gmod/Player:TraceHullAttack) (if the entity is hit) in this hook on the victim entity can cause infinite loops since the hook will be called again. Make sure to setup recursion safeguards like the example below.
---
--- **NOTE**: This hook is only called for `ai`, `nextbot` and `anim` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage)
---@param damage CTakeDamageInfo The damage to be applied to the entity.
---@return number # How much damage the entity took. Basically `> 0` means took damage, `0` means did not take damage.
function ENTITY:OnTakeDamage(damage) end

---[SERVER] Called from the engine when TaskComplete is called.
--- This allows us to move onto the next task - even when TaskComplete was called from an engine side task.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnTaskComplete)
function ENTITY:OnTaskComplete() end

---[SERVER] Called when a task this NPC was running has failed for whatever reason.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OnTaskFailed)
---@param failCode number The fail code for the task. It will be a [FAIL_ enum](https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/sp/src/game/server/ai_task.h#L26) or a generated code for a custom string. (second argument)
---@param failReason string If set, a custom reason for the failure.
function ENTITY:OnTaskFailed(failCode, failReason) end

---[SERVER] Called to completely override NPC movement. This can be used for example for flying NPCs.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OverrideMove)
---@param interval number Time interval for the movement, in seconds. Usually time since last movement.
---@return boolean # Return `true` to disable the default movement code.
function ENTITY:OverrideMove(interval) end

---[SERVER] Called to completely override the direction NPC will be facing during navigation.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---
--- **NOTE**: This hook is called by the default movement hook. Returning `true` inside [ENTITY:OverrideMove](https://wiki.facepunch.com/gmod/ENTITY:OverrideMove) will prevent engine from calling this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:OverrideMoveFacing)
---@param interval number Time interval for the movement, in seconds. Usually time since last movement.
---@param data table Extra data for the movement. A table containing the following data:
--- * boolean hasTraced - The result if a forward probing trace has been done
--- * number expectedDist - The distance expected to move this think
--- * number flags - AILMG flags
--- * number maxDist - The distance maximum distance intended to travel in path length
--- * number navType - Enums/NAV
--- * number speed - The sequence ground speed. Note these need not always agree with `target`
--- * Entity moveTarget - Target entity
--- * Vector dir - The actual move. Note these need not always agree with `target`
--- * Vector facing - The actual move. Note these need not always agree with `target`
--- * Vector target - Object of the goal
---@return boolean # Return `true` to disable the default movement facing code.
function ENTITY:OverrideMoveFacing(interval, data) end

---[SERVER] Tests whether the damage passes the entity filter.
---
--- This will call [ENTITY:PassesDamageFilter](https://wiki.facepunch.com/gmod/ENTITY:PassesDamageFilter) on scripted entities of the type "filter".
---
--- **NOTE**: This function only works on entities of the type "filter". ( filter_* entities, including base game filter entites )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PassesDamageFilter)
---@param dmg CTakeDamageInfo The damage info to test
---@return boolean # Whether the damage info passes the entity filter.
function Entity:PassesDamageFilter(dmg) end

---[SERVER] Tests whether the entity passes the entity filter.
---
--- This will call [ENTITY:PassesFilter](https://wiki.facepunch.com/gmod/ENTITY:PassesFilter) on scripted entities of the type "filter".
---
--- **NOTE**: This function only works on entities of the type "filter". ( filter_* entities, including base game filter entites )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PassesFilter)
---@param caller Entity The initiator of the test.
---
--- For example the trigger this filter entity is used in.
---@param ent Entity The entity to test against the entity filter.
---@return boolean # Whether the entity info passes the entity filter.
function Entity:PassesFilter(caller, ent) end

---[SERVER] Polls whenever the entity should trigger the brush.
---
--- **WARNING**: This hook is broken and will not work without code below
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:PassesTriggerFilters)
---@param ent Entity The entity that is about to trigger.
---@return boolean # Should trigger or not.
function ENTITY:PassesTriggerFilters(ent) end

---[SERVER] Called when the entity collides with anything. The move type and solid type must be VPHYSICS for the hook to be called.
---
--- **NOTE**: If you want to use this hook on default/engine/non-Lua entites ( like prop_physics ), use [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback) instead! This page describes a hook for Lua entities
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:PhysicsCollide)
---@param colData table Information regarding the collision. See Structures/CollisionData.
---@param collider PhysObj The physics object that collided.
function ENTITY:PhysicsCollide(colData, collider) end

---[SHARED] Destroys the current physics object of an entity.
---
--- **NOTE**: Cannot be used on a ragdoll or the world entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsDestroy)
function Entity:PhysicsDestroy() end

---[SHARED] Initializes the physics mesh of the entity from a triangle soup defined by a table of vertices. The resulting mesh is hollow, may contain holes, and always has a volume of 0.
---
--- While this is very useful for static geometry such as terrain displacements, it is advised to use [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) or [Entity:PhysicsInitMultiConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitMultiConvex) for moving solid objects instead.
---
--- [Entity:EnableCustomCollisions](https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions) needs to be called if you want players to collide with the entity correctly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsFromMesh)
---@param vertices table A table consisting of Structures/MeshVertex (only the `pos` element is taken into account). Every 3 vertices define a triangle in the physics mesh.
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@return boolean # Returns `true` on success, `nil` otherwise.
function Entity:PhysicsFromMesh(vertices, surfaceprop) end

---[SHARED] Initializes the [physics object](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObject) of the entity using its current [model](https://wiki.facepunch.com/gmod/Entity:GetModel). Deletes the previous physics object if it existed and the new object creation was successful.
---
--- If the entity's current model has no physics mesh associated to it, no physics object will be created and the previous object will still exist, if applicable.
---
--- **NOTE**: When called clientside, this will not create a valid [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) if the model hasn't been [precached](https://wiki.facepunch.com/gmod/util.PrecacheModel) serverside.
---
--- If successful, this function will automatically call [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( solidType ) and [Entity:SetSolidFlags](https://wiki.facepunch.com/gmod/Entity:SetSolidFlags)( 0 ).
---
--- Clientside physics objects are broken and do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsInit)
---@param solidType number The solid type of the physics object to create, see Enums/SOLID. Should be `SOLID_VPHYSICS` in most cases.
---
--- 		Using `SOLID_NONE` will only delete the current physics object - it does not create a new one.
---@return boolean # Returns `true` on success, `false` otherwise.
function Entity:PhysicsInit(solidType) end

---[SHARED] Makes the physics object of the entity a AABB.
---
--- This function will automatically destroy any previous physics objects and do the following:
--- * [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( `SOLID_BBOX` )
--- * [Entity:SetMoveType](https://wiki.facepunch.com/gmod/Entity:SetMoveType)( `MOVETYPE_VPHYSICS` )
--- * [Entity:SetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds)( `mins`, `maxs` )
---
--- **NOTE**: If the volume of the resulting box is 0 (the mins and maxs are the same), the mins and maxs will be changed to [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)( -1, -1, -1 ) and [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)( 1, 1, 1 ), respectively.
---
--- Clientside physics objects are broken and do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsInitBox)
---@param mins Vector The minimum position of the box. This is automatically ordered with the maxs.
---@param maxs Vector The maximum position of the box. This is automatically ordered with the mins.
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@return boolean # Returns `true` on success, `nil` otherwise. This fails when the game cannot create any more PhysCollides.
function Entity:PhysicsInitBox(mins, maxs, surfaceprop) end

---[SHARED] Initializes the physics mesh of the entity with a convex mesh defined by a table of points. The resulting mesh is the  of all the input points. If successful, the previous physics object will be removed.
---
--- This is the standard way of creating moving physics objects with a custom convex shape. For more complex, concave shapes, see [Entity:PhysicsInitMultiConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitMultiConvex).
---
--- This will crash if given all [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)(0,0,0)s.
---
--- Clientside physics objects are broken and do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- You can use the following workaround for movement, though clientside collisions will still be broken.
--- ```
--- function ENT:Think()
--- 	if ( CLIENT ) then
--- 		local physobj = self:GetPhysicsObject()
---
--- 		if ( IsValid( physobj ) ) then
--- 			physobj:SetPos( self:GetPos() )
--- 			physobj:SetAngles( self:GetAngles() )
--- 		end
--- 	end
--- end
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex)
---@param points table A table of eight Vectors, in local coordinates, to be used in the computation of the convex mesh. Order does not matter.
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@return boolean # Returns `true` on success, `false` otherwise.
function Entity:PhysicsInitConvex(points, surfaceprop) end

---[SHARED] An advanced version of [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) which initializes a physics object from multiple convex meshes. This should be used for physics objects with a custom shape which cannot be represented by a single convex mesh.
---
--- If successful, the previous physics object will be removed.
---
--- Clientside physics objects are broken and do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsInitMultiConvex)
---@param vertices table A table consisting of tables of Vectors. Each sub-table defines a set of points to be used in the computation of one convex mesh.
---@param surfaceprop? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@return boolean # Returns `true` on success, `nil` otherwise.
function Entity:PhysicsInitMultiConvex(vertices, surfaceprop) end

---[SHARED] Initializes the entity's physics object as a physics shadow. Removes the previous physics object if successful. This is used internally for the Player's and NPC's physics object, and certain HL2 entities such as the crane.
---
--- A physics shadow can be used to have static entities that never move by setting both arguments to false.
---
--- The created physics object will depend on the entity's solidity `SOLID_NONE` will not create a physics object, `SOLID_BBOX` will create a Axis-Aligned BBox one, `SOLID_OBB` will create Orientated Bounding Box one, and anything else will use the models' physics mesh.
---
--- Clientside physics objects are broken and do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsInitShadow)
---@param allowPhysicsMovement? boolean Whether to allow the physics shadow to move under stress.
---@param allowPhysicsRotation? boolean Whether to allow the physics shadow to rotate under stress.
---@return boolean # Return `true` on success, `nil` otherwise.
function Entity:PhysicsInitShadow(allowPhysicsMovement, allowPhysicsRotation) end

---[SHARED] Makes the physics object of the entity a sphere.
---
--- This function will automatically destroy any previous physics objects and do the following:
--- * [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( `SOLID_BBOX` )
--- * [Entity:SetMoveType](https://wiki.facepunch.com/gmod/Entity:SetMoveType)( `MOVETYPE_VPHYSICS` )
---
--- Clientside physics objects are broken and do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsInitSphere)
---@param radius number The radius of the sphere.
---@param physmat? string Physical material from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt) or added with physenv.AddSurfaceData.
---@return boolean # Returns `true` on success, `false` otherwise
function Entity:PhysicsInitSphere(radius, physmat) end

---[SHARED] Initializes a static physics object of the entity using its [current model](https://wiki.facepunch.com/gmod/Entity:GetModel). If successful, the previous physics object is removed.
---
--- This is what used by entities such as `func_breakable`, `prop_dynamic`, `item_suitcharger`, `prop_thumper` and `npc_rollermine` while it is in its "buried" state in the Half-Life 2 Campaign.
---
--- If the entity's current model has no physics mesh associated to it, no physics object will be created.
---
--- **NOTE**: This function will automatically call [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid)( `solidType` ).
---
--- Clientside physics objects are broken and do not move properly in some cases. Physics objects should only created on the server or you will experience incorrect physgun beam position, prediction issues, and other unexpected behavior.
---
--- A workaround is available on the [Entity:PhysicsInitConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitConvex) page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysicsInitStatic)
---@param solidType number The solid type of the physics object to create, see Enums/SOLID. Should be `SOLID_VPHYSICS` in most cases.
---@return boolean # Returns `true` on success, `false` otherwise. This will fail if the entity's current model has no associated physics mesh.
function Entity:PhysicsInitStatic(solidType) end

---[SHARED] Called from the Entity's motion controller to simulate physics.
---
--- This will only be called after using [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController) on a [scripted entity](https://wiki.facepunch.com/gmod/Scripted_Entities) of `anim` type.
---
--- **NOTE**: This hook can work on the CLIENT if you call [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController) and use [Entity:AddToMotionController](https://wiki.facepunch.com/gmod/Entity:AddToMotionController) on the physics objects you want to control
---
--- **WARNING**: Do not use functions such as [PhysObj:EnableCollisions](https://wiki.facepunch.com/gmod/PhysObj:EnableCollisions) or [PhysObj:EnableGravity](https://wiki.facepunch.com/gmod/PhysObj:EnableGravity) in this hook as they're very likely to crash your game. You may want to use [ENTITY:PhysicsUpdate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsUpdate) instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate)
---@param phys PhysObj The physics object of the entity.
---@param deltaTime number Time since the last call.
---@return Vector # Angular force
---@return Vector # Linear force
---@return number # One of the Enums/SIM.
function ENTITY:PhysicsSimulate(phys, deltaTime) end

---[SHARED] Called whenever the physics of the entity are updated.
---
--- **WARNING**: This hook won't be called if the Entity's [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) goes asleep
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:PhysicsUpdate)
---@param phys PhysObj The physics object of the entity.
function ENTITY:PhysicsUpdate(phys) end

---[SHARED] Wakes up the entity's physics object
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PhysWake)
function Entity:PhysWake() end

---[SERVER] Makes the entity play a .vcd scene. [All scenes from Half-Life 2](https://developer.valvesoftware.com/wiki/Half-Life_2_Scenes_List).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PlayScene)
---@param scene string Filepath to scene.
---@param delay? number Delay in seconds until the scene starts playing.
---@return number # Estimated length of the scene.
---@return Entity # The scene entity, removing which will stop the scene from continuing to play.
function Entity:PlayScene(scene, delay) end

---[SERVER] Changes an entities angles so that it faces the target entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PointAtEntity)
---@param target Entity The entity to face.
function Entity:PointAtEntity(target) end

---[SERVER] Called after the duplicator finished copying the entity.
---
--- See also [ENTITY:PreEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PreEntityCopy), [ENTITY:PostEntityPaste](https://wiki.facepunch.com/gmod/ENTITY:PostEntityPaste) and [ENTITY:OnEntityCopyTableFinish](https://wiki.facepunch.com/gmod/ENTITY:OnEntityCopyTableFinish).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:PostEntityCopy)
function ENTITY:PostEntityCopy() end

---[SERVER] Called after the [duplicator](https://wiki.facepunch.com/gmod/duplicator) pastes the entity, after the bone/entity modifiers have been applied to the entity.
---
--- This hook is called after [ENTITY:OnDuplicated](https://wiki.facepunch.com/gmod/ENTITY:OnDuplicated). See also [ENTITY:PreEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PreEntityCopy).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:PostEntityPaste)
---@param ply Player The player who pasted the entity.
---
--- This may not be a valid player in some circumstances. For example, when a save is loaded from the main menu, this hook will be called before the player is spawned. This argument will be a NULL entity in that case.
---@param ent Entity The entity itself. Same as `self` within the function context.
---@param createdEntities table All entities that are within the placed dupe.
--- The keys of each value in this table are the original entity indexes when the duplication was created. This can be utilized to restore entity references that don't get saved in duplications.
function ENTITY:PostEntityPaste(ply, ent, createdEntities) end

---[SERVER] Precaches gibs for the entity's model.
---
--- Normally this function should be ran when the entity is spawned, for example the [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize), after [Entity:SetModel](https://wiki.facepunch.com/gmod/Entity:SetModel) is called.
---
--- This is required for [Entity:GibBreakServer](https://wiki.facepunch.com/gmod/Entity:GibBreakServer) and [Entity:GibBreakClient](https://wiki.facepunch.com/gmod/Entity:GibBreakClient) to work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:PrecacheGibs)
---@return number # The amount of gibs the prop has
function Entity:PrecacheGibs() end

---[SERVER] Called before the duplicator copies the entity.
---
--- If you are looking for a way to make the duplicator spawn another entity when duplicated. (For example, you duplicate a `prop_physics`, but you want the duplicator to spawn `prop_physics_my`), you should add `prop_physics.ClassOverride = "prop_physics_my"`. The duplication table should be also stored on that `prop_physics`, not on `prop_physics_my`.
---
--- See also [ENTITY:PostEntityCopy](https://wiki.facepunch.com/gmod/ENTITY:PostEntityCopy).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:PreEntityCopy)
function ENTITY:PreEntityCopy() end

---[SERVER] Normalizes the ragdoll. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RagdollSolve)
function Entity:RagdollSolve() end

---[SERVER] Sets the function to build the ragdoll. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RagdollStopControlling)
function Entity:RagdollStopControlling() end

---[SERVER] Makes the physics objects follow the set bone positions. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RagdollUpdatePhysics)
function Entity:RagdollUpdatePhysics() end

---[SHARED] Removes the entity it is used on. The entity will be removed at the start of next tick.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Remove)
function Entity:Remove() end

---[SHARED] Removes all decals from the entities surface.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveAllDecals)
function Entity:RemoveAllDecals() end

---[SERVER] Removes and stops all gestures.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveAllGestures)
function Entity:RemoveAllGestures() end

---[SHARED] Removes a callback previously added with [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveCallback)
---@param hook string The hook name to remove. See Entity Callbacks
---@param callbackid number The callback id previously retrieved with the return of Entity:AddCallback or Entity:GetCallbacks
function Entity:RemoveCallback(hook, callbackid) end

---[SHARED] Removes a function previously added via [Entity:CallOnRemove](https://wiki.facepunch.com/gmod/Entity:CallOnRemove).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveCallOnRemove)
---@param identifier string Identifier of the function given to Entity:CallOnRemove.
function Entity:RemoveCallOnRemove(identifier) end

---[SHARED] Removes an engine effect applied to an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveEffects)
---@param effect number The effect to remove, see Enums/EF.
function Entity:RemoveEffects(effect) end

---[SHARED] Removes specified engine flag
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveEFlags)
---@param flag number The flag to remove, see Enums/EFL
function Entity:RemoveEFlags(flag) end

---[SHARED] Removes specified flag(s) from the entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveFlags)
---@param flag number The flag(s) to remove, see Enums/FL
function Entity:RemoveFlags(flag) end

---[SHARED] Removes a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect from the entity's motion controller so that [ENTITY:PhysicsSimulate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate) will no longer be called for given [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ect.
---
--- You must first create a motion controller with [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController).
---
--- **NOTE**: Only works on a scripted [Entity](https://wiki.facepunch.com/gmod/Entity) of anim type
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveFromMotionController)
---@param physObj PhysObj The PhysObj to remove from the motion controller.
function Entity:RemoveFromMotionController(physObj) end

---[SERVER] Removes and stops the gesture with given activity.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveGesture)
---@param activity number The activity remove. See Enums/ACT.
function Entity:RemoveGesture(activity) end

---[SERVER] Breaks internal Ragdoll constrains, so you can for example separate an arm from the body of a ragdoll and preserve all physics.
---
--- The visual mesh will still stretch as if it was properly connected unless the ragdoll model is specifically designed to avoid that.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveInternalConstraint)
---@param num? number Which constraint to break, values below 0 mean break them all
function Entity:RemoveInternalConstraint(num) end

---[SHARED] Removes solid flag(s) from the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RemoveSolidFlags)
---@param flags number The flag(s) to remove, see Enums/FSOLID.
function Entity:RemoveSolidFlags(flags) end

---[CLIENT] Called instead of the engine drawing function of the entity. This hook works on any entity (scripted or not) it is applied on.
---
--- This does not work on "physgun_beam", use [GM:DrawPhysgunBeam](https://wiki.facepunch.com/gmod/GM:DrawPhysgunBeam) instead.
---
--- **NOTE**: As a downside of this implementation, only one RenderOverride may be applied at a time.
---
--- Drawing a viewmodel in this function will cause [GM:PreDrawViewModel](https://wiki.facepunch.com/gmod/GM:PreDrawViewModel), [WEAPON:PreDrawViewModel](https://wiki.facepunch.com/gmod/WEAPON:PreDrawViewModel), [WEAPON:ViewModelDrawn](https://wiki.facepunch.com/gmod/WEAPON:ViewModelDrawn), [GM:PostDrawViewModel](https://wiki.facepunch.com/gmod/GM:PostDrawViewModel), and [WEAPON:PostDrawViewModel](https://wiki.facepunch.com/gmod/WEAPON:PostDrawViewModel) to be called twice.
---
--- This is called before PrePlayerDraw for players. If this function exists at all on a player, their worldmodel will always be rendered regardless of PrePlayerDraw's return.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:RenderOverride)
---@param flags number The Enums/STUDIO flags for this render operation.
function ENTITY:RenderOverride(flags) end

---[SHARED] Plays an animation on the entity. This may not always work on engine entities.
---
--- **WARNING**: This will not reset the animation on viewmodels, use [Entity:SendViewModelMatchingSequence](https://wiki.facepunch.com/gmod/Entity:SendViewModelMatchingSequence) instead.
---
--- **NOTE**: This will not work properly if called directly after calling [Entity:SetModel](https://wiki.facepunch.com/gmod/Entity:SetModel). Consider waiting until the next Tick.
---
--- Will not work on players due to the animations being reset every frame by the base gamemode animation system. See [GM:CalcMainActivity](https://wiki.facepunch.com/gmod/GM:CalcMainActivity).
---
--- For custom scripted entities you will want to apply example from [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) to make animations work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ResetSequence)
---@param sequence number|string The sequence to play. Also accepts strings.
---
--- If set to a string, the function will automatically call [Entity:LookupSequence](https://wiki.facepunch.com/gmod/Entity:LookupSequence) to retrieve the sequence ID as a number.
function Entity:ResetSequence(sequence) end

---[SHARED] Reset entity sequence info such as playback rate, ground speed, last event check, etc.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ResetSequenceInfo)
function Entity:ResetSequenceInfo() end

---[SERVER] Makes the entity/weapon respawn.
---
--- Only usable on HL2/HL:S pickups and any weapons. Seems to be buggy with weapons.
--- Very unreliable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Respawn)
function Entity:Respawn() end

---[SERVER] Restarts the entity's animation gesture. If the given gesture is already playing, it will reset it and play it from the beginning.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RestartGesture)
---@param activity number The activity number to send to the entity. See Enums/ACT and Entity:GetSequenceActivity
---@param addIfMissing? boolean Add/start the gesture to if it has not been yet started.
---@param autokill? boolean
function Entity:RestartGesture(activity, addIfMissing, autokill) end

---[SHARED] Calls the associated `Entity:Set*` function for each network var provided.
---
--- 		**INTERNAL**: Used for the built-in duplicator, you do not need to call this yourself.
---
--- 		**NOTE**: This function will only work on entities which had [Entity:InstallDataTable](https://wiki.facepunch.com/gmod/Entity:InstallDataTable) called on them, which is done automatically for players and all [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted Entities)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:RestoreNetworkVars)
---@param data table The data from Entity:GetNetworkVars.
function Entity:RestoreNetworkVars(data) end

---[SERVER] Called from the engine every 0.1 seconds. Returning `true` inside this hook will allow `CAI_BaseNPC::MaintainSchedule` to also be called.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:RunAI)
function ENTITY:RunAI() end

---[SERVER] Called when an engine task is ran on the entity.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:RunEngineTask)
---@param taskID number The task ID, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param taskData number The task data.
---@return boolean # true to prevent default action
function ENTITY:RunEngineTask(taskID, taskData) end

---[SERVER] Called every think on running task.
--- The actual task function should tell us when the task is finished.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:RunTask)
---@param task table The task to run
function ENTITY:RunTask(task) end

---[SERVER] Called whenever a Lua schedule is finished or [ENTITY:StartEngineSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule) is called. Clears out schedule and task data stored within NPC's table.
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:ScheduleFinished)
function ENTITY:ScheduleFinished() end

---[SERVER] Set the schedule we should be playing right now. Allows the NPC to start either a Lua schedule or an engine schedule. Despite sharing the same name as `CAI_BaseNPC::SelectSchedule()`, this isn't hooked to that function; this is called by Lua's [ENTITY:RunAI](https://wiki.facepunch.com/gmod/ENTITY:RunAI), doesn't return an engine function, returning an engine function doesn't help and doesn't make the NPC start an engine schedule. To alter initial engine schedule, it is recommended to use [ENTITY:TranslateSchedule](https://wiki.facepunch.com/gmod/ENTITY:TranslateSchedule).
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:SelectSchedule)
function ENTITY:SelectSchedule() end

---[SHARED] Returns sequence ID corresponding to given activity ID.
---
--- Opposite of [Entity:GetSequenceActivity](https://wiki.facepunch.com/gmod/Entity:GetSequenceActivity).
---
--- Similar to [Entity:LookupSequence](https://wiki.facepunch.com/gmod/Entity:LookupSequence).
---
--- See also [Entity:SelectWeightedSequenceSeeded](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequenceSeeded).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence)
---@param act number The activity ID, see Enums/ACT.
---@return number # The sequence ID
function Entity:SelectWeightedSequence(act) end

---[SHARED] Returns the sequence ID corresponding to given activity ID, and uses the provided seed for random selection. The seed should be the same server-side and client-side if used in a predicted environment.
---
--- See [Entity:SelectWeightedSequence](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequence) for a provided-seed version of this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SelectWeightedSequenceSeeded)
---@param act number The activity ID, see Enums/ACT.
---@param seed number The seed to use for randomly selecting a sequence in the case the activity ID has multiple sequences bound to it. Entity:SelectWeightedSequence uses the same seed as util.SharedRandom internally for this.
---@return number # The sequence ID
function Entity:SelectWeightedSequenceSeeded(act, seed) end

---[SHARED] Sends sequence animation to the view model. It is recommended to use this for view model animations, instead of [Entity:ResetSequence](https://wiki.facepunch.com/gmod/Entity:ResetSequence).
---
--- This function is only usable on view models.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SendViewModelMatchingSequence)
---@param seq number The sequence ID returned by Entity:LookupSequence or  Entity:SelectWeightedSequence.
function Entity:SendViewModelMatchingSequence(seq) end

---[SHARED] Returns length of currently played sequence.
---
--- This will return incorrect results for weapons and viewmodels clientside in thirdperson.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SequenceDuration)
---@param seqid? number A sequence ID to return the length specific sequence of instead of the entity's main/currently playing sequence.
---@return number # The length of the sequence
function Entity:SequenceDuration(seqid) end

---[SHARED] Sets the entity's velocity.
---
--- **NOTE**: Actually binds to CBaseEntity::SetLocalVelocity() which sets the entity's velocity due to movement in the world from forces such as gravity. Does not include velocity from entity-on-entity collision or other world movement.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetAbsVelocity)
---@param velocity Vector The new velocity to set.
function Entity:SetAbsVelocity(velocity) end

---[SHARED] Sets the angles of the entity.
---
--- **NOTE**: To set a player's angles, use [Player:SetEyeAngles](https://wiki.facepunch.com/gmod/Player:SetEyeAngles) instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetAngles)
---@param angles Angle The new angles.
function Entity:SetAngles(angles) end

---[SHARED] Sets a player's third-person animation. Mainly used by [Weapon](https://wiki.facepunch.com/gmod/Weapon)s to start the player's weapon attack and reload animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetAnimation)
---@param playerAnim number Player animation, see Enums/PLAYER.
function Entity:SetAnimation(playerAnim) end

---[CLIENT] Sets the start time (relative to [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime)) of the current animation, which is used to determine [Entity:GetCycle](https://wiki.facepunch.com/gmod/Entity:GetCycle). Should be less than CurTime to play an animation from the middle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetAnimTime)
---@param time number The time the animation was supposed to begin.
function Entity:SetAnimTime(time) end

---[SHARED] Parents the sprite to an attachment on another model.
---
--- Works only on `env_sprite` entities.
---
--- Despite existing on client, it doesn't actually do anything on client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetAttachment)
---@param ent Entity The entity to attach/parent to
---@param attachment number The attachment ID to parent to
---@deprecated You should be using Entity:SetParent instead.
function Entity:SetAttachment(ent, attachment) end

---[SHARED] Toggles automatic frame advancing for animated sequences on an entity.
---
--- This has the same effect as setting the ``ENT.AutomaticFrameAdvance`` property. (See [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT))
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:SetAutomaticFrameAdvance)
---@param enable boolean Whether or not to set automatic frame advancing.
function ENTITY:SetAutomaticFrameAdvance(enable) end

---[SERVER] Sets the blood color this entity uses.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetBloodColor)
---@param bloodColor number An integer corresponding to Enums/BLOOD_COLOR.
function Entity:SetBloodColor(bloodColor) end

---[SHARED] Sets an entities' bodygroup.
--- **NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model, check will occur by view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetBodygroup)
---@param bodygroup number The id of the bodygroup you're setting. Starts from 0.
---@param value number The value you're setting the bodygroup to. Starts from 0.
function Entity:SetBodygroup(bodygroup, value) end

---[SHARED] Sets the bodygroups from a string. A convenience function for [Entity:SetBodygroup](https://wiki.facepunch.com/gmod/Entity:SetBodygroup).
--- **NOTE**: If called for Weapon (after Initialize hook) with different body groups on world model and view model, check will occur by view model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetBodyGroups)
---@param bodygroups string Body groups to set. Each character in the string represents a separate bodygroup. (`0` to `9`, `a` to `z` being (`10` to `35`))
function Entity:SetBodyGroups(bodygroups) end

---[SHARED] Sets the specified value on the bone controller with the given ID of this entity, it's used in HL1 to change the head rotation of NPCs, turret aiming and so on.
---
--- **NOTE**: This is the precursor of pose parameters, and only works for Half Life 1: Source models supporting it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetBoneController)
---@param boneControllerID number The ID of the bone controller to set the value to.
--- Goes from 0 to 3.
---@param value number The value to set on the specified bone controller.
function Entity:SetBoneController(boneControllerID, value) end

---[SHARED] Sets the bone matrix of given bone to given matrix. See also [Entity:GetBoneMatrix](https://wiki.facepunch.com/gmod/Entity:GetBoneMatrix).
---
--- **NOTE**: Despite existing serverside, it does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetBoneMatrix)
---@param boneid number The ID of the bone
---@param matrix VMatrix The matrix to set.
function Entity:SetBoneMatrix(boneid, matrix) end

---[CLIENT] Sets the bone position and angles.
---
--- 	For changes to happen, this must be called in a [rendering](https://wiki.facepunch.com/gmod/Render_Order) hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetBonePosition)
---@param bone number The bone ID to manipulate
---@param pos Vector The position to set
---@param ang Angle The angles to set
function Entity:SetBonePosition(bone, pos, ang) end

---[SHARED] Sets the collision bounds for the entity, which are used for triggers ([Entity:SetTrigger](https://wiki.facepunch.com/gmod/Entity:SetTrigger), [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch)), and collision (If [Entity:SetSolid](https://wiki.facepunch.com/gmod/Entity:SetSolid) set as [SOLID_BBOX](https://wiki.facepunch.com/gmod/Enums/SOLID)).
---
--- Input bounds are relative to [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos)!
--- See also [Entity:SetCollisionBoundsWS](https://wiki.facepunch.com/gmod/Entity:SetCollisionBoundsWS).
---
--- **NOTE**: Player collision bounds are reset every frame to player's [Player:SetHull](https://wiki.facepunch.com/gmod/Player:SetHull) values.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds)
---@param mins Vector The minimum vector of the bounds.
---@param maxs Vector The maximum vector of the bounds.
function Entity:SetCollisionBounds(mins, maxs) end

---[SHARED] A convenience function that sets the collision bounds for the entity in world space coordinates by transforming given vectors to entity's local space and passing them to [Entity:SetCollisionBounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetCollisionBoundsWS)
---@param vec1 Vector The first vector of the bounds.
---@param vec2 Vector The second vector of the bounds.
function Entity:SetCollisionBoundsWS(vec1, vec2) end

---[SHARED] Sets the entity's collision group.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetCollisionGroup)
---@param group number Collision group of the entity, see Enums/COLLISION_GROUP
function Entity:SetCollisionGroup(group) end

---[SHARED] Sets the color of an entity.
---
--- Some entities may need a custom [render mode](https://wiki.facepunch.com/gmod/Enums/RENDERMODE) set for transparency to work. See example 2.
--- Entities also must have a proper [render group](https://wiki.facepunch.com/gmod/Enums/RENDERGROUP) set for transparency to work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetColor)
---@param color? table The color to set. Uses the Color.
function Entity:SetColor(color) end

---[SHARED] Sets the color of an entity without usage of a [Global.Color](https://wiki.facepunch.com/gmod/Global.Color) object.
---
--- **INTERNAL**: Used internally to implement [Entity:SetColor](https://wiki.facepunch.com/gmod/Entity:SetColor).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetColor4Part)
---@param r number
---@param g number
---@param b number
---@param a number
function Entity:SetColor4Part(r, g, b, a) end

---[SERVER] Sets the creator of the Entity. This is set automatically in Sandbox gamemode when spawning SENTs, but is never used/read by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetCreator)
---@param ply Player The creator
function Entity:SetCreator(ply) end

---[SHARED] Marks the entity to call [GM:ShouldCollide](https://wiki.facepunch.com/gmod/GM:ShouldCollide). Not to be confused with [Entity:EnableCustomCollisions](https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetCustomCollisionCheck)
---@param enable boolean Enable or disable the custom collision check
function Entity:SetCustomCollisionCheck(enable) end

---[SHARED] Sets the progress of the current animation to a specific value between 0 and 1.
---
--- Viewmodels overwrite their animation cycle every frame, for prediction/interpolation purposes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetCycle)
---@param value number The desired cycle value
function Entity:SetCycle(value) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified angle on the entity's datatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetDTAngle)
---@param key number Goes from 0 to 31.
---@param ang Angle The angle to write on the entity's datatable.
function Entity:SetDTAngle(key, ang) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified bool on the entity's datatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetDTBool)
---@param key number Goes from 0 to 31.
---@param bool boolean The boolean to write on the entity's metatable.
function Entity:SetDTBool(key, bool) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified entity on this entity's datatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetDTEntity)
---@param key number Goes from 0 to 31.
---@param ent Entity The entity to write on this entity's datatable.
function Entity:SetDTEntity(key, ent) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified float on the entity's datatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetDTFloat)
---@param key number Goes from 0 to 31.
---@param float number The float to write on the entity's datatable.
function Entity:SetDTFloat(key, float) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified integer on the entity's datatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetDTInt)
---@param key number Goes from 0 to 31.
---@param integer number The integer to write on the entity's datatable. This will be cast to a 32-bit signed integer internally.
function Entity:SetDTInt(key, integer) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified string on the entity's datatable.
---
--- **NOTE**: The length of these strings are capped at 512 characters.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetDTString)
---@param key number Goes from 0 to 3.
---@param str string The string to write on the entity's datatable, can't be more than 512 characters per string.
function Entity:SetDTString(key, str) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This is called internally by the [Entity:NetworkVar](https://wiki.facepunch.com/gmod/Entity:NetworkVar) system, you can use this in cases where using NetworkVar is not possible.
---
--- Sets the specified vector on the entity's datatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetDTVector)
---@param key number Goes from 0 to 31.
---@param vec Vector The vector to write on the entity's datatable.
function Entity:SetDTVector(key, vec) end

---[SHARED] Sets the elasticity of this entity, used by some flying entities such as the Helicopter NPC to determine how much it should bounce around when colliding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetElasticity)
---@param elasticity number The elasticity to set.
function Entity:SetElasticity(elasticity) end

---[SHARED] Allows you to set the Start or End entity attachment for the rope.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetEntity)
---@param name string The name of the variable to modify.
--- Accepted names are StartEntity and EndEntity.
---@param entity Entity The entity to apply to the specific attachment.
function Entity:SetEntity(name, entity) end

---[SHARED] Sets the position an entity's eyes look toward. This works as an override for default behavior. Set to `0,0,0` to disable the override.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetEyeTarget)
---@param pos Vector If NPC, the **world position** for the entity to look towards, for Ragdolls, a **local position** in front of their `eyes` attachment.
function Entity:SetEyeTarget(pos) end

---[SHARED] Sets the scale of all the flexes of this entity. See [Entity:SetFlexWeight](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetFlexScale)
---@param scale number The new flex scale to set to
function Entity:SetFlexScale(scale) end

---[SHARED] Sets the weight/value of given flex controller.
---
--- **NOTE**: Only `96` flex controllers can be set! Flex controllers on models with higher amounts will not be accessible.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetFlexWeight)
---@param flex number The ID of the flex to modify weight of.  The range is between `0` and Entity:GetFlexNum - 1.
---@param weight number The new weight to set
function Entity:SetFlexWeight(flex, weight) end

---[SHARED] Sets friction multiplier for this entity when sliding against a surface. Entities default to 1 (100%) and can be higher.
---
--- This may not affect all entities, but does work for players (the range is 0 to 10), as well as other entities using [MOVETYPE_STEP ](https://wiki.facepunch.com/gmod/Enums/MOVETYPE#MOVETYPE_STEP )
---
--- This only multiplies the friction of the entity, to change the value itself use [PhysObj:SetMaterial](https://wiki.facepunch.com/gmod/PhysObj:SetMaterial).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetFriction)
---@param friction number Friction multiplier
function Entity:SetFriction(friction) end

---[SHARED] Sets the gravity multiplier of the entity.
---
--- This may not affect affect all entities, but does affect players, and entities with [MOVETYPE_FLYGRAVITY](https://wiki.facepunch.com/gmod/Enums/MOVETYPE#MOVETYPE_FLYGRAVITY), such as projectiles.
---
--- This function is not predicted or networked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetGravity)
---@param multiplier number By how much to multiply the gravity. `1` is normal gravity, `0.5` is half-gravity, etc.
function Entity:SetGravity(multiplier) end

---[SHARED] Sets the ground the entity is standing on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetGroundEntity)
---@param ground Entity The ground entity.
function Entity:SetGroundEntity(ground) end

---[SHARED] Sets the health of the entity.
---
--- **NOTE**: You may want to take [Entity:GetMaxHealth](https://wiki.facepunch.com/gmod/Entity:GetMaxHealth) into account when calculating what to set health to, in case a gamemode has a different max health than 100.
--- In some cases, setting health only serverside can cause hitches in movement, for example if something is modifying the player speed based on health.
--- To solve this issue, it is better to set it shared in a predicted hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetHealth)
---@param newHealth number New health value.
function Entity:SetHealth(newHealth) end

---[SHARED] Sets the current Hitbox set for the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetHitboxSet)
---@param id number The new hitbox set to set. Can be a name as a string, or the ID as a number.
---
--- If the operation failed, the function will silently fail.
function Entity:SetHitboxSet(id) end

---[CLIENT] Enables or disable the inverse kinematic usage of this entity.
--- 		**WARNING**: Calling this with false outside of [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) requires a model change to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetIK)
---@param useIK? boolean The state of the IK.
function Entity:SetIK(useIK) end

---[SHARED] Sets Hammer key values on an entity.
---
--- You can look up which entities have what key values on the [Valve Developer Community](https://developer.valvesoftware.com/wiki/) on entity pages.
---
--- A  list of basic entities can be found [here](https://developer.valvesoftware.com/wiki/List_of_entities).
---
--- Alternatively you can look at the .fgd files shipped with Garry's Mod in the bin/ folder with a text editor to see the key values as they appear in Hammer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetKeyValue)
---@param key string The internal key name
---@param value string|number The value to set
function Entity:SetKeyValue(key, value) end

---[SERVER] This allows the entity to be lag compensated during [Player:LagCompensation](https://wiki.facepunch.com/gmod/Player:LagCompensation).
---
--- **NOTE**: Players are lag compensated by default and there's no need to call this function for them.
---
--- It's best to not enable lag compensation on parented entities, as the system does not handle it that well ( they will be moved back but then the entity will lag behind ).
--- Parented entities move back with the parent if it's lag compensated, so if you are making some kind of armor piece you shouldn't do anything.
---
--- As a side note for parented entities, if your entity can be shot at, keep in mind that its collision bounds need to be bigger than the bone's hitbox the entity is parented to, or hull/line traces ( such as the crowbar attack or bullets ) might not hit at all.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLagCompensated)
---@param enable boolean Whether the entity should be lag compensated or not.
function Entity:SetLagCompensated(enable) end

---[SHARED] **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendIn)
---@param layerID number The Layer ID
---@param blendIn number
function Entity:SetLayerBlendIn(layerID, blendIn) end

---[SHARED] **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerBlendOut)
---@param layerID number The Layer ID
---@param blendOut number
function Entity:SetLayerBlendOut(layerID, blendOut) end

---[SHARED] Sets the animation cycle/frame of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerCycle)
---@param layerID number The Layer ID
---@param cycle number The new animation cycle/frame for given layer.
function Entity:SetLayerCycle(layerID, cycle) end

---[SHARED] Sets the duration of given layer. This internally overrides the [Entity:SetLayerPlaybackRate](https://wiki.facepunch.com/gmod/Entity:SetLayerPlaybackRate).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerDuration)
---@param layerID number The Layer ID
---@param duration number The new duration of the layer in seconds.
function Entity:SetLayerDuration(layerID, duration) end

---[SERVER] Sets whether the layer should loop or not.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerLooping)
---@param layerID number The Layer ID
---@param loop boolean Whether the layer should loop or not.
function Entity:SetLayerLooping(layerID, loop) end

---[SHARED] Sets the layer playback rate. See also [Entity:SetLayerDuration](https://wiki.facepunch.com/gmod/Entity:SetLayerDuration).
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerPlaybackRate)
---@param layerID number The Layer ID
---@param rate number The new playback rate.
function Entity:SetLayerPlaybackRate(layerID, rate) end

---[SERVER] Sets the priority of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entites!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerPriority)
---@param layerID number The Layer ID
---@param priority number The new priority of the layer.
function Entity:SetLayerPriority(layerID, priority) end

---[SHARED] Sets the sequence of given layer.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerSequence)
---@param layerID number The Layer ID.
---@param seq number The sequenceID to set. See Entity:LookupSequence.
function Entity:SetLayerSequence(layerID, seq) end

---[SHARED] Sets the layer weight. This influences how strongly the animation should be overriding the normal animations of the entity.
---
--- **NOTE**: This function only works on [BaseAnimatingOverlay](https://wiki.facepunch.com/gmod/BaseAnimatingOverlay) entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLayerWeight)
---@param layerID number The Layer ID
---@param weight number The new layer weight.
function Entity:SetLayerWeight(layerID, weight) end

---[CLIENT] This forces an entity to use the bone transformation behaviour from versions prior to **8 July 2014**.
---
--- This behaviour affects [Entity:EnableMatrix](https://wiki.facepunch.com/gmod/Entity:EnableMatrix) and [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale) and is incorrect, therefore this function be used exclusively as a quick fix for old scripts that rely on it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLegacyTransform)
---@param enabled boolean Whether the entity should use the old bone transformation behaviour or not.
function Entity:SetLegacyTransform(enabled) end

---[SERVER] Sets the entity to be used as the light origin position for this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLightingOriginEntity)
---@param lightOrigin Entity The lighting entity.
function Entity:SetLightingOriginEntity(lightOrigin) end

---[SHARED] Sets angles relative to angles of [Entity:GetParent](https://wiki.facepunch.com/gmod/Entity:GetParent)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLocalAngles)
---@param ang Angle The local angle
function Entity:SetLocalAngles(ang) end

---[SHARED] Sets the entity's angular velocity (rotation speed).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLocalAngularVelocity)
---@param angVel Angle The angular velocity to set.
function Entity:SetLocalAngularVelocity(angVel) end

---[SHARED] Sets local position relative to the parented position. This is for use with [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent) to offset position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLocalPos)
---@param pos Vector The local position
function Entity:SetLocalPos(pos) end

---[SHARED] Sets the entity's local velocity which is their velocity due to movement in the world from forces such as gravity. Does not include velocity from entity-on-entity collision or other world movement.
---
--- **WARNING**: Same as [Entity:SetAbsVelocity](https://wiki.facepunch.com/gmod/Entity:SetAbsVelocity), but clamps the given velocity, and is not recommended to be used because of that.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLocalVelocity)
---@param velocity Vector The new velocity to set.
function Entity:SetLocalVelocity(velocity) end

---[CLIENT] Sets the Level Of Detail model to use with this entity. This may not work for all models if the model doesn't include any LOD sub models.
---
--- This function works exactly like the clientside r_lod convar and takes priority over it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetLOD)
---@param lod? number The Level Of Detail model ID to use. -1 leaves the engine to automatically set the Level of Detail.
---
--- The Level Of Detail may range from 0 to 8, with 0 being the highest quality and 8 the lowest.
function Entity:SetLOD(lod) end

---[SHARED] Sets the rendering material override of the entity.
---
--- To set a Lua material created with [Global.CreateMaterial](https://wiki.facepunch.com/gmod/Global.CreateMaterial), just prepend a "!" to the material name.
---
--- If you wish to override a single material on the model, use [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial) instead.
---
--- **NOTE**: To apply materials to models, that material **must** have **VertexLitGeneric** shader. For that reason you cannot apply map textures onto models, map textures use a different material shader - **LightmappedGeneric**, which can be used on brush entities.
---
--- The server's value takes priority on the client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetMaterial)
---@param materialName string New material name. Use an empty string ("") to reset to the default materials.
function Entity:SetMaterial(materialName) end

---[SERVER] Sets the maximum health for entity. Note, that you can still set entity's health above this amount with [Entity:SetHealth](https://wiki.facepunch.com/gmod/Entity:SetHealth).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetMaxHealth)
---@param maxhealth number What the max health should be
function Entity:SetMaxHealth(maxhealth) end

---[SERVER] Sets the NPC max yaw speed. Internally sets the `m_fMaxYawSpeed` variable which is polled by the engine.
---
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:SetMaxYawSpeed)
---@param maxyaw number The new max yaw value to set
function ENTITY:SetMaxYawSpeed(maxyaw) end

---[SHARED] Sets the model of the entity.
---
--- This does not update the physics of the entity - see [Entity:PhysicsInit](https://wiki.facepunch.com/gmod/Entity:PhysicsInit).
---
--- **WARNING**: This silently fails when given an empty string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetModel)
---@param modelName string New model value.
function Entity:SetModel(modelName) end

---[SHARED] Alter the model name returned by [Entity:GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel). Does not affect the entity's actual model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetModelName)
---@param modelname string The new model name.
function Entity:SetModelName(modelname) end

---[SHARED] Scales the model of the entity, if the entity is a [Player](https://wiki.facepunch.com/gmod/Player) or an [NPC](https://wiki.facepunch.com/gmod/NPC) the hitboxes will be scaled as well.
---
--- For some entities, calling [Entity:Activate](https://wiki.facepunch.com/gmod/Entity:Activate) after this will scale the collision bounds and [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) as well; be wary as there's no optimization being done internally and highly complex collision models might crash the server.
---
--- This is the same system used in TF2 for the Mann Vs Machine robots.
---
--- To resize the entity along any axis, use [Entity:EnableMatrix](https://wiki.facepunch.com/gmod/Entity:EnableMatrix) instead.
---
--- Client-side trace detection seems to mess up if deltaTime is set to anything but zero. A very small decimal can be used instead of zero to solve this issue.
---
--- If your old scales are wrong, use [Entity:SetLegacyTransform](https://wiki.facepunch.com/gmod/Entity:SetLegacyTransform) as a quick fix.
---
--- **NOTE**: If you do not want the physics to be affected by [Entity:Activate](https://wiki.facepunch.com/gmod/Entity:Activate), you can use [Entity:ManipulateBoneScale](https://wiki.facepunch.com/gmod/Entity:ManipulateBoneScale)`( 0, Vector( scale, scale, scale ) )` instead.
---
--- This does not scale procedural bones and disables IK.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetModelScale)
---@param scale number A float to scale the model by. 0 will not draw anything. A number less than 0 will draw the model inverted.
---@param deltaTime? number Transition time of the scale change, set to 0 to modify the scale right away. To avoid issues with client-side trace detection this must be set, and can be an extremely low number to mimic a value of 0 such as .000001.
function Entity:SetModelScale(scale, deltaTime) end

---[SHARED] Sets the move collide type of the entity. The move collide is the way a physics object reacts to hitting an object - will it bounce, slide?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetMoveCollide)
---@param moveCollideType number The move collide type, see Enums/MOVECOLLIDE
function Entity:SetMoveCollide(moveCollideType) end

---[SHARED] Sets the Movement Parent of an entity to another entity.
---
--- Similar to [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent), except the object's coordinates are not translated automatically before parenting.
---
--- Does nothing on client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetMoveParent)
---@param Parent Entity The entity to change this entity's Movement Parent to.
function Entity:SetMoveParent(Parent) end

---[SHARED] Sets the entity's move type. This should be called before initializing the physics object on the entity, unless it will override SetMoveType such as [Entity:PhysicsInitBox](https://wiki.facepunch.com/gmod/Entity:PhysicsInitBox).
---
--- Despite existing on client, it doesn't actually do anything on client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetMoveType)
---@param movetype number The new movetype, see Enums/MOVETYPE
function Entity:SetMoveType(movetype) end

---[SERVER] Sets the mapping name of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetName)
---@param mappingName string The name to set for the entity.
function Entity:SetName(mappingName) end

---[CLIENT] Alters the entity's perceived serverside angle on the client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkAngles)
---@param angle Angle Networked angle.
function Entity:SetNetworkAngles(angle) end

---[SHARED] Sets a networked angle value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Angle](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Angle) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWAngle](https://wiki.facepunch.com/gmod/Entity:SetNWAngle) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Angle)
---@param key string The key to associate the value with
---@param value Angle The value to set
---@deprecated You should be using Entity:SetNW2Angle instead.
function Entity:SetNetworked2Angle(key, value) end

---[SHARED] Sets a networked boolean value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Bool](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Bool) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWBool](https://wiki.facepunch.com/gmod/Entity:SetNWBool) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Bool)
---@param key string The key to associate the value with
---@param value boolean The value to set
---@deprecated You should be using Entity:SetNW2Bool instead.
function Entity:SetNetworked2Bool(key, value) end

---[SHARED] Sets a networked entity value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Entity](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Entity) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWEntity](https://wiki.facepunch.com/gmod/Entity:SetNWEntity) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Entity)
---@param key string The key to associate the value with
---@param value Entity The value to set
---@deprecated You should be using Entity:SetNW2Entity instead.
function Entity:SetNetworked2Entity(key, value) end

---[SHARED] Sets a networked float (number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Float](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Float) both from client and server.
---
--- Unlike [Entity:SetNetworked2Int](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Int), floats don't have to be whole numbers.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWFloat](https://wiki.facepunch.com/gmod/Entity:SetNWFloat) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Float)
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNetworked2Float(key, value) end

---[SHARED] Sets a networked integer (whole number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Int](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Int) both from client and server.
---
--- See [Entity:SetNW2Float](https://wiki.facepunch.com/gmod/Entity:SetNW2Float) for numbers that aren't integers.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS.
--- The integer has a 32 bit limit. Use [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Int)
---@param key string The key to associate the value with
---@param value number The value to set
---@deprecated You should be using Entity:SetNW2Int instead.
function Entity:SetNetworked2Int(key, value) end

---[SHARED] Sets a networked string value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2String](https://wiki.facepunch.com/gmod/Entity:GetNetworked2String) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWString](https://wiki.facepunch.com/gmod/Entity:SetNWString) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2String)
---@param key string The key to associate the value with
---@param value string The value to set, up to 511 characters.
---@deprecated You should be using Entity:SetNW2String instead.
function Entity:SetNetworked2String(key, value) end

---[SHARED] Sets a networked value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Var](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Var) both from client and server.
---
--- | Allowed Types   |
--- | --------------- |
--- | Angle           |
--- | Boolean         |
--- | Entity          |
--- | Float           |
--- | Int             |
--- | String          |
--- | Vector          |
---
--- **WARNING**: Trying to network a type that is not listed above leads to the value not being networked!
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only ne networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Var)
---@param key string The key to associate the value with
---@param value any The value to set
---@deprecated You should be using Entity:SetNW2Var instead.
function Entity:SetNetworked2Var(key, value) end

---[SHARED] Sets a function to be called when the NW2Var changes. Internally uses [GM:EntityNetworkedVarChanged](https://wiki.facepunch.com/gmod/GM:EntityNetworkedVarChanged) to call the function.
--- **NOTE**: Only one NW2VarProxy can be set per-var
--- Running this function clientside will only set it for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2VarProxy)
---@param name string The name of the NW2Var to add callback for.
---@param callback fun(ent: Entity, name: string, oldval: any, newval: any) The function to be called when the NW2Var changes.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NW2Var that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:SetNetworked2VarProxy(name, callback) end

---[SHARED] Sets a networked vector value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworked2Vector](https://wiki.facepunch.com/gmod/Entity:GetNetworked2Vector) both from client and server.
---
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWVector](https://wiki.facepunch.com/gmod/Entity:SetNWVector) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworked2Vector)
---@param key string The key to associate the value with
---@param value Vector The value to set
---@deprecated You should be using Entity:SetNW2Vector instead.
function Entity:SetNetworked2Vector(key, value) end

---[SHARED] Sets a networked angle value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedAngle](https://wiki.facepunch.com/gmod/Entity:GetNetworkedAngle) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedAngle)
---@param key string The key to associate the value with
---@param value? Angle The value to set
---@deprecated You should use Entity:SetNWAngle instead.
function Entity:SetNetworkedAngle(key, value) end

---[SHARED] Sets a networked boolean value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedBool](https://wiki.facepunch.com/gmod/Entity:GetNetworkedBool) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedBool)
---@param key string The key to associate the value with
---@param value? boolean The value to set
---@deprecated You should use Entity:SetNWBool instead.
function Entity:SetNetworkedBool(key, value) end

---[SHARED] Sets a networked entity value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedEntity](https://wiki.facepunch.com/gmod/Entity:GetNetworkedEntity) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedEntity)
---@param key string The key to associate the value with
---@param value? Entity The value to set
---@deprecated You should use Entity:SetNWEntity instead.
function Entity:SetNetworkedEntity(key, value) end

---[SHARED] Sets a networked float value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedFloat](https://wiki.facepunch.com/gmod/Entity:GetNetworkedFloat) both from client and server.
---
--- Seems to be the same as [Entity:GetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt).
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedFloat)
---@param key string The key to associate the value with
---@param value? number The value to set
---@deprecated You should use Entity:SetNWFloat instead.
function Entity:SetNetworkedFloat(key, value) end

---[SHARED] Sets a networked integer value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedInt](https://wiki.facepunch.com/gmod/Entity:GetNetworkedInt) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedInt)
---@param key string The key to associate the value with
---@param value? number The value to set
---@deprecated You should use Entity:SetNWInt instead.
function Entity:SetNetworkedInt(key, value) end

---[SHARED] Sets a networked number at the specified index on the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedNumber)
---@param index any The index that the value is stored in.
---@param number number The value to network.
---@deprecated You should be using Entity:SetNWFloat instead.
function Entity:SetNetworkedNumber(index, number) end

---[SHARED] Sets a networked string value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedString](https://wiki.facepunch.com/gmod/Entity:GetNetworkedString) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedString)
---@param key string The key to associate the value with
---@param value? string The value to set
---@deprecated You should use Entity:SetNWString instead.
function Entity:SetNetworkedString(key, value) end

---[SHARED] Sets a networked value on the entity.
---
--- The value can then be accessed with [Entity:GetNetworkedVar](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVar) both from client and server.
---
--- | Allowed Types   |
--- | --------------- |
--- | Angle           |
--- | Boolean         |
--- | Entity          |
--- | Float           |
--- | Int             |
--- | String          |
--- | Vector          |
---
--- **WARNING**: Trying to network a type that is not listed above leads to the value not being networked!
--- the value will only be updated clientside if the entity is or enters the clients PVS.
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVar)
---@param key string The key to associate the value with
---@param value any The value to set
function Entity:SetNetworkedVar(key, value) end

---[SHARED] Sets callback function to be called when given NWVar changes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVarProxy)
---@param name string The name of the NWVar to add callback for.
---@param callback fun(ent: Entity, name: string, oldval: any, newval: any) The function to be called when the NWVar changes.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
---@deprecated You should be using Entity:SetNWVarProxy instead.
function Entity:SetNetworkedVarProxy(name, callback) end

---[SHARED] Sets a networked vector value at specified index on the entity.
---
--- The value then can be accessed with [Entity:GetNetworkedVector](https://wiki.facepunch.com/gmod/Entity:GetNetworkedVector) both from client and server.
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkedVector)
---@param key string The key to associate the value with
---@param value? Vector The value to set
---@deprecated You should use Entity:SetNWVector instead.
function Entity:SetNetworkedVector(key, value) end

---[SHARED] Virtually changes entity position for clients. Does the same thing as [Entity:SetPos](https://wiki.facepunch.com/gmod/Entity:SetPos) when used serverside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNetworkOrigin)
---@param origin Vector The position to make clients think this entity is at.
function Entity:SetNetworkOrigin(origin) end

---[CLIENT] Sets the next time the clientside [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNextClientThink)
---@param nextthink number The next time, relative to Global.CurTime, to execute the ENTITY:Think clientside.
function Entity:SetNextClientThink(nextthink) end

---[SHARED] Sets if the entity's model should render at all.
---
--- If set on the server, this entity will no longer network to clients, and for all intents and purposes cease to exist clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNoDraw)
---@param shouldNotDraw boolean true disables drawing
function Entity:SetNoDraw(shouldNotDraw) end

---[SHARED] Sets whether the entity is solid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNotSolid)
---@param IsNotSolid boolean True will make the entity not solid, false will make it solid.
function Entity:SetNotSolid(IsNotSolid) end

---[SERVER] Sets the NPC classification. Internally sets the `m_iClass` variable which is polled by the engine.
---
--- **NOTE**: This is a helper function only available if your SENT is based on `base_ai`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:SetNPCClass)
---@param classification number The Enums/CLASS
function ENTITY:SetNPCClass(classification) end

---[SHARED] Sets a networked angle value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Angle](https://wiki.facepunch.com/gmod/Entity:GetNW2Angle) both from client and server.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWAngle](https://wiki.facepunch.com/gmod/Entity:SetNWAngle) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2Angle)
---@param key string The key to associate the value with
---@param value Angle The value to set
function Entity:SetNW2Angle(key, value) end

---[SHARED] Sets a networked boolean value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Bool](https://wiki.facepunch.com/gmod/Entity:GetNW2Bool) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWBool](https://wiki.facepunch.com/gmod/Entity:SetNWBool) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2Bool)
---@param key string The key to associate the value with
---@param value boolean The value to set
function Entity:SetNW2Bool(key, value) end

---[SHARED] Sets a networked entity value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Entity](https://wiki.facepunch.com/gmod/Entity:GetNW2Entity) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWEntity](https://wiki.facepunch.com/gmod/Entity:SetNWEntity) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2Entity)
---@param key string The key to associate the value with
---@param value Entity The value to set
function Entity:SetNW2Entity(key, value) end

---[SHARED] Sets a networked float (number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Float](https://wiki.facepunch.com/gmod/Entity:GetNW2Float) both from client and server.
---
--- Unlike [Entity:SetNW2Int](https://wiki.facepunch.com/gmod/Entity:SetNW2Int), floats don't have to be whole numbers.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWFloat](https://wiki.facepunch.com/gmod/Entity:SetNWFloat) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2Float)
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNW2Float(key, value) end

---[SHARED] Sets a networked integer (whole number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Int](https://wiki.facepunch.com/gmod/Entity:GetNW2Int) both from client and server.
---
--- See [Entity:SetNW2Float](https://wiki.facepunch.com/gmod/Entity:SetNW2Float) for numbers that aren't integers.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS.
--- The integer has a 32 bit limit. Use [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2Int)
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNW2Int(key, value) end

---[SHARED] Sets a networked string value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2String](https://wiki.facepunch.com/gmod/Entity:GetNW2String) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWString](https://wiki.facepunch.com/gmod/Entity:SetNWString) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2String)
---@param key string The key to associate the value with
---@param value string The value to set, up to 511 characters.
function Entity:SetNW2String(key, value) end

---[SHARED] Sets a networked value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Var](https://wiki.facepunch.com/gmod/Entity:GetNW2Var) both from client and server.
---
--- | Allowed Types   |
--- | --------------- |
--- | Angle           |
--- | Boolean         |
--- | Entity          |
--- | Float           |
--- | Int             |
--- | String          |
--- | Vector          |
--- **WARNING**: Trying to network a type that is not listed above leads to the value not being networked!
--- the value will only be updated clientside if the entity is or enters the clients PVS.
---
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2Var)
---@param key string The key to associate the value with
---@param value any The value to set
function Entity:SetNW2Var(key, value) end

---[SHARED] Sets a function to be called when the NW2Var changes. Internally uses [GM:EntityNetworkedVarChanged](https://wiki.facepunch.com/gmod/GM:EntityNetworkedVarChanged) to call the function.
--- Alias of [Entity:SetNetworked2VarProxy](https://wiki.facepunch.com/gmod/Entity:SetNetworked2VarProxy)
--- You should not use the NW2 System on entities that are based on a Lua Entity, or else this will be called multiple times and the NW2Var could get mixed up with other ones.
--- **NOTE**: Only one NW2VarProxy can be set per-var
--- Running this function will only set it for the realm it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2VarProxy)
---@param key string The key of the NW2Var to add callback for.
---@param callback function The function to be called when the NW2Var changes. It has 4 arguments:
--- * Entity ent - The entity
--- * string name - Name of the NW2Var that has changed
--- * any oldval - The old value
--- * any newval - The new value
function Entity:SetNW2VarProxy(key, callback) end

---[SHARED] Sets a networked vector value on the entity.
---
--- The value can then be accessed with [Entity:GetNW2Vector](https://wiki.facepunch.com/gmod/Entity:GetNW2Vector) both from client and server.
--- You should not use the NW2 System on entities that are based on a Lua Entity or else NW2Vars could get mixed up, updated multiple times or not be set.
--- **WARNING**: The value will only be updated clientside if the entity is or enters the clients PVS. use [Entity:SetNWVector](https://wiki.facepunch.com/gmod/Entity:SetNWVector) instead
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
--- The value will only be networked if it isn't the same as the current value and unlike SetNW*
--- the value will only be networked once and not every 10 seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNW2Vector)
---@param key string The key to associate the value with
---@param value Vector The value to set
function Entity:SetNW2Vector(key, value) end

---[SHARED] Sets a networked angle value on the entity.
---
--- The value can then be accessed with [Entity:GetNWAngle](https://wiki.facepunch.com/gmod/Entity:GetNWAngle) both from client and server.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Angle](https://wiki.facepunch.com/gmod/Entity:SetNW2Angle). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWAngle)
---@param key string The key to associate the value with
---@param value Angle The value to set
function Entity:SetNWAngle(key, value) end

---[SHARED] Sets a networked boolean value on the entity.
---
--- The value can then be accessed with [Entity:GetNWBool](https://wiki.facepunch.com/gmod/Entity:GetNWBool) both from client and server.
--- **WARNING**: There's a 4096 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Bool](https://wiki.facepunch.com/gmod/Entity:SetNW2Bool). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWBool)
---@param key string The key to associate the value with
---@param value boolean The value to set
function Entity:SetNWBool(key, value) end

---[SHARED] Sets a networked entity value on the entity.
---
--- The value can then be accessed with [Entity:GetNWEntity](https://wiki.facepunch.com/gmod/Entity:GetNWEntity) both from client and server.
--- **WARNING**: There's a 4096 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Entity](https://wiki.facepunch.com/gmod/Entity:SetNW2Entity). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWEntity)
---@param key string The key to associate the value with
---@param value Entity The value to set
function Entity:SetNWEntity(key, value) end

---[SHARED] Sets a networked float (number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNWFloat](https://wiki.facepunch.com/gmod/Entity:GetNWFloat) both from client and server.
---
--- Unlike [Entity:SetNWInt](https://wiki.facepunch.com/gmod/Entity:SetNWInt), floats don't have to be whole numbers.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Float](https://wiki.facepunch.com/gmod/Entity:SetNW2Float). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWFloat)
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNWFloat(key, value) end

---[SHARED] Sets a networked integer (whole number) value on the entity.
---
--- The value can then be accessed with [Entity:GetNWInt](https://wiki.facepunch.com/gmod/Entity:GetNWInt) both from client and server.
---
--- See [Entity:SetNWFloat](https://wiki.facepunch.com/gmod/Entity:SetNWFloat) for numbers that aren't integers.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Int](https://wiki.facepunch.com/gmod/Entity:SetNW2Int). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
--- This function will not round decimal values as it actually networks a float internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWInt)
---@param key string The key to associate the value with
---@param value number The value to set
function Entity:SetNWInt(key, value) end

---[SHARED] Sets a networked string value on the entity.
---
--- The value can then be accessed with [Entity:GetNWString](https://wiki.facepunch.com/gmod/Entity:GetNWString) both from client and server.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2String](https://wiki.facepunch.com/gmod/Entity:SetNW2String). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWString)
---@param key string The key to associate the value with
---@param value string The value to set, up to 199 characters.
function Entity:SetNWString(key, value) end

---[SHARED] **NOTE**: Only one NWVarProxy can be set per-var
--- Running this function will only set it for the realm it is called on.
---
--- Sets a function to be called when the NWVar changes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWVarProxy)
---@param key string The key of the NWVar to add callback for.
---@param callback fun(ent: Entity, name: string, oldval: any, newval: any) The function to be called when the NWVar changes.
---
--- Function argument(s):
--- * Entity `ent` - The entity
--- * string `name` - Name of the NWVar that has changed
--- * any `oldval` - The old value
--- * any `newval` - The new value
function Entity:SetNWVarProxy(key, callback) end

---[SHARED] Sets a networked vector value on the entity.
---
--- The value can then be accessed with [Entity:GetNWVector](https://wiki.facepunch.com/gmod/Entity:GetNWVector) both from client and server.
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Entity:SetNW2Vector](https://wiki.facepunch.com/gmod/Entity:SetNW2Vector). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage#nwlimits](https://wiki.facepunch.com/gmod/Networking_Usage#nwlimits)
---
--- **NOTE**: Running this function clientside will only set it for the client it is called on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetNWVector)
---@param key string The key to associate the value with
---@param value Vector The value to set
function Entity:SetNWVector(key, value) end

---[SHARED] Sets the owner of this entity, disabling all physics interaction with it.
---
--- **NOTE**: This function is generally used to disable physics interactions on projectiles being fired by their owner, but can also be used for normal ownership in case physics interactions are not involved at all. The Gravity gun will be able to pick up the entity even if the owner can't collide with it, the Physics gun however will not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetOwner)
---@param owner? Entity The entity to be set as owner.
function Entity:SetOwner(owner) end

---[SHARED] Sets the parent of this entity, making it move with its parent. This will make the child entity non solid, nothing can interact with them, including traces.
---
--- **NOTE**: This does not work on [the world](https://wiki.facepunch.com/gmod/game.GetWorld).
---
--- **WARNING**: This can cause undefined physics behavior when used on entities that don't support parenting. See the [Valve developer wiki](https://developer.valvesoftware.com/wiki/Entity_Hierarchy_(parenting)) for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetParent)
---@param parent? Entity The entity to parent to. Setting this to nil will clear the parent.
---@param attachmentOrBoneId? number The attachment or bone id to use when parenting. Defaults to -1 or whatever the parent had set previously.
---
--- Use Entity:AddEffects( EF_FOLLOWBONE ) to treat this argument as a Bone ID instead of an Attachment ID. Similar to Entity:FollowBone.
---
--- You must call [Entity:SetMoveType](https://wiki.facepunch.com/gmod/Entity:SetMoveType)( MOVETYPE_NONE ) on the child for this argument to have any effect!
function Entity:SetParent(parent, attachmentOrBoneId) end

---[SHARED] Sets the parent of an entity to another entity with the given physics bone number. Similar to [Entity:SetParent](https://wiki.facepunch.com/gmod/Entity:SetParent), except it is parented to a physbone. This function is useful mainly for ragdolls.
---
--- **NOTE**: Despite this function being available server side, it doesn't actually do anything server side.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetParentPhysNum)
---@param bone number Physics bone number to attach to. Use 0 for objects with only one physics bone. (See Entity:GetPhysicsObjectNum)
function Entity:SetParentPhysNum(bone) end

---[SHARED] Sets whether or not the given entity is persistent. A persistent entity will be saved on server shutdown and loaded back when the server starts up. Additionally, by default persistent entities cannot be grabbed with the physgun and tools cannot be used on them.
---
--- In sandbox, this can be set on an entity by opening the context menu, right clicking the entity, and choosing `"Make Persistent"`.
---
--- **NOTE**: Persistence can only be enabled with the sbox_persist convar, which works as an identifier for the current set of persistent entities. An empty identifier (which is the default value) disables this feature.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPersistent)
---@param persist boolean Whether or not the entity should be persistent.
function Entity:SetPersistent(persist) end

---[SERVER] When called on a constraint entity, sets the two physics objects to be constrained.
---
--- Usage is not recommended as the Constraint library provides easier ways to deal with constraints.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPhysConstraintObjects)
---@param Phys1 PhysObj The first physics object to be constrained.
---@param Phys2 PhysObj The second physics object to be constrained.
function Entity:SetPhysConstraintObjects(Phys1, Phys2) end

---[SERVER] Sets the player who gets credit if this entity kills something with physics damage within the time limit.
---
--- **NOTE**: This can only be called on props, "anim" type SENTs and vehicles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPhysicsAttacker)
---@param ent Player Player who gets the kills. Setting this to a non-player entity will not work.
---@param timeLimit? number Time in seconds until the entity forgets its physics attacker and prevents it from getting the kill credit.
function Entity:SetPhysicsAttacker(ent, timeLimit) end

---[SHARED] Allows you to set how fast an entity's animation will play, with 1.0 being the default speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPlaybackRate)
---@param fSpeed number How fast the animation will play.
function Entity:SetPlaybackRate(fSpeed) end

---[SHARED] Moves the entity to the specified position.
---
--- Some entities, such as ragdolls, will continually reset their position. Consider using [PhysObj:SetPos](https://wiki.facepunch.com/gmod/PhysObj:SetPos) on every physics object to move ragdolls.
---
--- **NOTE**: If the new position doesn't take effect right away, you can use [Entity:SetupBones](https://wiki.facepunch.com/gmod/Entity:SetupBones) to force it to do so. This issue is especially common when trying to render the same entity twice or more in a single frame at different positions.
---
--- **WARNING**: Entities with [Entity:GetSolid](https://wiki.facepunch.com/gmod/Entity:GetSolid) of `SOLID_BBOX` will have their angles reset!
---
--- This will fail inside of predicted functions called during player movement processing. This includes [WEAPON:PrimaryAttack](https://wiki.facepunch.com/gmod/WEAPON:PrimaryAttack) and [WEAPON:Think](https://wiki.facepunch.com/gmod/WEAPON:Think).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPos)
---@param position Vector The position to move the entity to.
function Entity:SetPos(position) end

---[SHARED] Sets the specified pose parameter to the specified value.
---
--- You should call [Entity:InvalidateBoneCache](https://wiki.facepunch.com/gmod/Entity:InvalidateBoneCache) after calling this function.
---
--- **NOTE**: Avoid calling this in draw hooks, especially when animating things, as it might cause visual artifacts.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPoseParameter)
---@param poseName string|number Name of the pose parameter. Entity:GetPoseParameterName might come in handy here.
---
--- Can also be a pose parameter ID.
---@param poseValue number The value to set the pose to.
function Entity:SetPoseParameter(poseName, poseValue) end

---[CLIENT] Sets whether an entity should be predictable or not.
--- When an entity is set as predictable, its DT vars can be changed during predicted hooks. This is useful for entities which can be controlled by player input.
---
--- Any datatable value that mismatches from the server will be overridden and a prediction error will be spewed.
---
--- Weapons are predictable by default, and the drive system uses this function to make the controlled prop predictable as well.
---
--- Visit  for a list of all predicted hooks, and the [Prediction](https://wiki.facepunch.com/gmod/Prediction) page.
--- For further technical information on the subject, visit [valve's wiki](https://developer.valvesoftware.com/wiki/Prediction).
---
--- **NOTE**: This function resets the datatable variables everytime it's called, it should ideally be called when a player starts using the entity and when he stops
---
--- **NOTE**: Entities set as predictable with this function will be unmarked when the user lags and receives a full packet update, to handle such case visit [GM:NotifyShouldTransmit](https://wiki.facepunch.com/gmod/GM:NotifyShouldTransmit)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPredictable)
---@param setPredictable boolean whether to make this entity predictable or not.
function Entity:SetPredictable(setPredictable) end

---[SERVER] Prevents the server from sending any further information about the entity to a player.
---
--- **NOTE**: You must also call this function on all entity's children. See [Entity:GetChildren](https://wiki.facepunch.com/gmod/Entity:GetChildren).
---
--- [issue tracker](https://github.com/Facepunch/garrysmod-issues/issues/1736)
---
--- [Entity:SetFlexScale](https://wiki.facepunch.com/gmod/Entity:SetFlexScale) and other flex/bone manipulation functions will create a child entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetPreventTransmit)
---@param player Player|CRecipientFilter The player to stop networking the entity to. Can also be a CRecipientFilter or a table as of March 2024 to affect multiple players at once.
---@param stopTransmitting boolean true to stop the entity from networking, false to make it network again.
function Entity:SetPreventTransmit(player, stopTransmitting) end

---[SERVER] Sets the bone angles. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRagdollAng)
---@param boneid number Bone ID
---@param pos Angle Angle to set
function Entity:SetRagdollAng(boneid, pos) end

---[SERVER] Sets the function to build the ragdoll. This is used alongside Kinect, for more info see `ragdoll_motion` entity in the game files.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction)
---@param builder fun(ragdoll: Entity) The build function.
---
--- Function argument(s):
--- * Entity `ragdoll` - The ragdoll to build
function Entity:SetRagdollBuildFunction(builder) end

---[SERVER] Sets the bone position. This is used alongside Kinect in [Entity:SetRagdollBuildFunction](https://wiki.facepunch.com/gmod/Entity:SetRagdollBuildFunction), for more info see ragdoll_motion entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRagdollPos)
---@param boneid number Bone ID
---@param pos Vector Position to set
function Entity:SetRagdollPos(boneid, pos) end

---[CLIENT] Sets the render angle override for the Entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderAngles)
---@param newAngles? Angle The new render angles to be set to. To disable the override, set to nil.
function Entity:SetRenderAngles(newAngles) end

---[CLIENT] Sets the render bounds for the entity. For world space coordinates see [Entity:SetRenderBoundsWS](https://wiki.facepunch.com/gmod/Entity:SetRenderBoundsWS).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderBounds)
---@param mins Vector The minimum corner of the bounds, relative to origin of the entity.
---@param maxs Vector The maximum corner of the bounds, relative to origin of the entity.
---@param add? Vector If defined, adds this vector to maxs and subtracts this vector from mins.
function Entity:SetRenderBounds(mins, maxs, add) end

---[CLIENT] Sets the render bounds for the entity in world space coordinates. For relative coordinates see [Entity:SetRenderBounds](https://wiki.facepunch.com/gmod/Entity:SetRenderBounds).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderBoundsWS)
---@param mins Vector The minimum corner of the bounds, relative to origin of the world/map.
---@param maxs Vector The maximum corner of the bounds, relative to origin of the world/map.
---@param add? Vector If defined, adds this vector to maxs and subtracts this vector from mins.
function Entity:SetRenderBoundsWS(mins, maxs, add) end

---[CLIENT] Used to specify a plane, past which an object will be visually clipped.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderClipPlane)
---@param planeNormal Vector The normal of the plane. Anything behind the normal will be clipped.
---@param planePosition number The position of the plane.
function Entity:SetRenderClipPlane(planeNormal, planePosition) end

---[CLIENT] Enables the use of clipping planes to "cut" objects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderClipPlaneEnabled)
---@param enabled boolean Enable or disable clipping planes
function Entity:SetRenderClipPlaneEnabled(enabled) end

---[SHARED] Sets entity's render FX.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderFX)
---@param renderFX number The new render FX to set, see Enums/kRenderFx
function Entity:SetRenderFX(renderFX) end

---[SHARED] Sets the render mode of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderMode)
---@param renderMode number New render mode to set, see Enums/RENDERMODE.
function Entity:SetRenderMode(renderMode) end

---[CLIENT] Set the render origin override, a position where the Entity will be rendered at.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetRenderOrigin)
---@param newOrigin? Vector The new origin in world coordinates where the Entity's model will now be rendered at. To disable the override, set to nil.
function Entity:SetRenderOrigin(newOrigin) end

---[SHARED] Sets a save value for an entity. You can see a full list of an entity's save values by creating it and printing [Entity:GetSaveTable](https://wiki.facepunch.com/gmod/Entity:GetSaveTable)().
---
--- See [Entity:GetInternalVariable](https://wiki.facepunch.com/gmod/Entity:GetInternalVariable) for the opposite of this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSaveValue)
---@param name string Name of the save value to set
---@param value any Value to set
---@return boolean # Key successfully set
function Entity:SetSaveValue(name, value) end

---[SHARED] Sets the entity's model sequence.
---
--- If the specified sequence is already active, the animation will not be restarted. See [Entity:ResetSequence](https://wiki.facepunch.com/gmod/Entity:ResetSequence) for a function that restarts the animation even if it is already playing.
---
--- In some cases you want to run [Entity:ResetSequenceInfo](https://wiki.facepunch.com/gmod/Entity:ResetSequenceInfo) to make this function run.
---
--- **NOTE**: This will not work properly if called directly after calling [Entity:SetModel](https://wiki.facepunch.com/gmod/Entity:SetModel). Consider waiting until the next Tick.
---
--- Will not work on players due to the animations being reset every frame by the base gamemode animation system. See [GM:CalcMainActivity](https://wiki.facepunch.com/gmod/GM:CalcMainActivity).
---
--- For custom scripted entities you will want to apply example from [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) to make animations work.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSequence)
---@param sequenceId number The sequence to play. Also accepts strings.
---
--- If set to a string, the function will automatically call [Entity:LookupSequence](https://wiki.facepunch.com/gmod/Entity:LookupSequence) to retrieve the sequence ID as a number.
function Entity:SetSequence(sequenceId) end

---[SHARED] Sets whether or not the entity should make a physics contact sound when it's been picked up by a player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetShouldPlayPickupSound)
---@param playsound? boolean True to play the pickup sound, false otherwise.
function Entity:SetShouldPlayPickupSound(playsound) end

---[SHARED] Sets if entity should create a server ragdoll on death or a client one.
---
--- **NOTE**: Player ragdolls created with this enabled will have an owner set, see [Entity:SetOwner](https://wiki.facepunch.com/gmod/Entity:SetOwner) for more information on what effects this has.
---
--- This is reset for players when they respawn ([Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn)).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetShouldServerRagdoll)
---@param serverragdoll boolean Set `true` if ragdoll should be created on server, `false` if on client.
function Entity:SetShouldServerRagdoll(serverragdoll) end

---[SHARED] Sets the skin of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSkin)
---@param skinIndex number 0-based index of the skin to use.
function Entity:SetSkin(skinIndex) end

---[SHARED] Sets the solidity of an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSolid)
---@param solid_type number The solid type. See the Enums/SOLID.
function Entity:SetSolid(solid_type) end

---[SHARED] Sets solid flag(s) for the entity.
---
--- This overrides any other flags the entity might have had. See [Entity:AddSolidFlags](https://wiki.facepunch.com/gmod/Entity:AddSolidFlags) for adding flags.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSolidFlags)
---@param flags number The flag(s) to set, see Enums/FSOLID.
function Entity:SetSolidFlags(flags) end

---[SHARED] Sets whether the entity should use a spawn effect when it is created on the client.
---
--- See [Entity:GetSpawnEffect](https://wiki.facepunch.com/gmod/Entity:GetSpawnEffect) for more information on how the effect is applied.
---
--- **NOTE**: This function will only have an effect when the entity spawns. After that it will do nothing even is set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSpawnEffect)
---@param spawnEffect boolean Sets if we should show a spawn effect.
function Entity:SetSpawnEffect(spawnEffect) end

---[SHARED] Overrides a single material on the model of this entity.
---
--- To set a Lua material created with [Global.CreateMaterial](https://wiki.facepunch.com/gmod/Global.CreateMaterial), just prepend a `!` to the material name.
---
--- The server's value takes priority on the client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial)
---@param index? number Index of the material to override, acceptable values are from 0 to 31.
---
--- Indexes are by Entity:GetMaterials, but you have to subtract 1 from them.
---
--- If called with no arguments, all sub materials will be reset.
---@param material? string The material to override the default one with. Set to nil to revert to default material.
function Entity:SetSubMaterial(index, material) end

---[SHARED] Sets the axis-aligned bounding box (AABB) for an entity's hitbox detection.
---
--- 	See also [Entity:SetSurroundingBoundsType](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType) (mutually exclusive).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBounds)
---@param min Vector Minimum extent of the AABB relative to entity's position.
---@param max Vector Maximum extent of the AABB relative to entity's position.
function Entity:SetSurroundingBounds(min, max) end

---[SHARED] Automatically sets the axis-aligned bounding box (AABB) for an entity's hitbox detection.
---
--- 	See also [Entity:SetSurroundingBounds](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBounds) (mutually exclusive).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetSurroundingBoundsType)
---@param bounds number Bounds type of the entity, see Enums/BOUNDS
function Entity:SetSurroundingBoundsType(bounds) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Changes the table that can be accessed by indexing an entity. Each entity starts with its own table by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetTable)
---@param tab table Table for the entity to use
function Entity:SetTable(tab) end

---[SERVER] Sets the current task.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:SetTask)
---@param task table The task to set.
function ENTITY:SetTask(task) end

---[SHARED] When this flag is set the entity will only transmit to the player when its parent is transmitted. This is useful for things like viewmodel attachments since without this flag they will transmit to everyone (and cause the viewmodels to transmit to everyone too).
---
--- **NOTE**: In the case of scripted entities, this will override [ENTITY:UpdateTransmitState](https://wiki.facepunch.com/gmod/ENTITY:UpdateTransmitState)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetTransmitWithParent)
---@param onoff boolean Will set the TransmitWithParent flag on or off
function Entity:SetTransmitWithParent(onoff) end

---[SERVER] Marks the entity as a trigger, so it will generate [ENTITY:StartTouch](https://wiki.facepunch.com/gmod/ENTITY:StartTouch), [ENTITY:Touch](https://wiki.facepunch.com/gmod/ENTITY:Touch) and [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch) callbacks.
---
--- Internally this is stored as [FSOLID_TRIGGER](https://wiki.facepunch.com/gmod/Enums/FSOLID) flag.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetTrigger)
---@param maketrigger boolean Make the entity trigger or not
function Entity:SetTrigger(maketrigger) end

---[SERVER] Sets whether an entity can be unfrozen, meaning that it cannot be unfrozen using the physgun.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetUnFreezable)
---@param freezable? boolean True to make the entity unfreezable, false otherwise.
function Entity:SetUnFreezable(freezable) end

---[CLIENT] Forces the entity to reconfigure its bones. You might need to call this after changing your model's scales or when manually drawing the entity multiple times at different positions.
---
--- **NOTE**: This calls the BuildBonePositions callback added via [Entity:AddCallback](https://wiki.facepunch.com/gmod/Entity:AddCallback), so avoid calling this function inside it to prevent an infinite loop.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetupBones)
function Entity:SetupBones() end

---[SHARED] Called when the entity should set up its [ Data Tables](https://wiki.facepunch.com/gmod/Networking_Entities).
---
--- This is a much better option than using Set/Get Networked Values.
---
--- This hook is called after [GM:OnEntityCreated](https://wiki.facepunch.com/gmod/GM:OnEntityCreated) and [GM:NetworkEntityCreated](https://wiki.facepunch.com/gmod/GM:NetworkEntityCreated).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:SetupDataTables)
function ENTITY:SetupDataTables() end

---[CLIENT] Initializes the class names of an entity's phoneme mappings (mouth movement data). This is called by default with argument "phonemes" when a flex-based entity (such as an [NPC](https://wiki.facepunch.com/gmod/NPC)) is created.
---
--- **NOTE**: TF2 phonemes can be accessed by using a path such as "player/scout/phonemes/phonemes" , check TF2's "tf2_misc_dir.vpk" with GCFScape for other paths, however it seems that TF2 sounds don't contain phoneme definitions anymore after being converted to mp3 and only rely on VCD animations, this needs to be further investigated
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetupPhonemeMappings)
---@param fileRoot string The file prefix of the phoneme mappings (relative to "garrysmod/expressions/").
function Entity:SetupPhonemeMappings(fileRoot) end

---[SERVER] Sets the use type of an entity, affecting how often [ENTITY:Use](https://wiki.facepunch.com/gmod/ENTITY:Use) will be called for Lua entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetUseType)
---@param useType number The use type to apply to the entity. Uses Enums/_USE.
function Entity:SetUseType(useType) end

---[SHARED] Allows to quickly set variable to entity's [Entity:GetTable](https://wiki.facepunch.com/gmod/Entity:GetTable).
---
--- **NOTE**: This will not network the variable to client(s). You want [Entity:SetNWString](https://wiki.facepunch.com/gmod/Entity:SetNWString) and similar functions for that
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetVar)
---@param key any Key of the value to set
---@param value any Value to set the variable to
function Entity:SetVar(key, value) end

---[SHARED] Sets the entity's velocity. For entities with physics, consider using [PhysObj:SetVelocity](https://wiki.facepunch.com/gmod/PhysObj:SetVelocity) on the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) of the entity.
---
--- **NOTE**: Actually binds to CBaseEntity::SetBaseVelocity() which sets the entity's velocity due to forces applied by other entities.
---
--- **WARNING**: If applied to a player, this will actually **ADD** velocity, not set it. (due to how movement code handles base velocity)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetVelocity)
---@param velocity Vector The new velocity to set.
function Entity:SetVelocity(velocity) end

---[SHARED] Sets the model and associated weapon to this viewmodel entity.
---
--- This is used internally when the player switches weapon.
---
--- **NOTE**: View models are not drawn without a weapons associated to them.
---
--- **WARNING**: This will silently fail if the entity is not a viewmodel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SetWeaponModel)
---@param viewModel string The model string to give to this viewmodel.
--- Example: "models/weapons/c_smg1.mdl"
---@param weapon? Weapon The weapon entity to associate this viewmodel to.
function Entity:SetWeaponModel(viewModel, weapon) end

---[SHARED] Returns the amount of skins the entity has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SkinCount)
---@return number # The amount of skins the entity's model has.
function Entity:SkinCount() end

---[CLIENT] Moves the model instance from the source entity to this entity. This can be used to transfer decals that have been applied on one entity to another.
---
--- Both entities must have the same model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:SnatchModelInstance)
---@param srcEntity Entity Entity to move the model instance from.
---@return boolean # Whether the operation was successful or not
function Entity:SnatchModelInstance(srcEntity) end

---[SHARED] Initializes the entity and starts its networking. If called on a player, it will respawn them.
---
--- This calls [ENTITY:Initialize](https://wiki.facepunch.com/gmod/ENTITY:Initialize) on Lua-defined entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Spawn)
function Entity:Spawn() end

---[SERVER] This is the spawn function. It's called when a player spawns the entity from the spawnmenu.
---
--- If you want to make your SENT spawnable you need this function to properly create the entity.
---
--- **WARNING**: Unlike other ENTITY functions, the "self" parameter of this function is not an entity but rather the table used to generate the SENT. This table is equivalent to [scripted_ents.GetStored](https://wiki.facepunch.com/gmod/scripted_ents.GetStored)("ent_name").
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:SpawnFunction)
---@param ply Player The player that is spawning this SENT
---@param tr table A Structures/TraceResult from player eyes to their aim position
---@param ClassName string The classname of your entity
function ENTITY:SpawnFunction(ply, tr, ClassName) end

---[SERVER] Called by the engine only whenever [NPC:SetSchedule](https://wiki.facepunch.com/gmod/NPC:SetSchedule) is called.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule)
---@param scheduleID number Schedule ID to start. See Enums/SCHED
function ENTITY:StartEngineSchedule(scheduleID) end

---[SERVER] Called when an engine task has been started on the entity.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:StartEngineTask)
---@param taskID number Task ID to start, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param TaskData number Task data
---@return boolean # true to stop default action
function ENTITY:StartEngineTask(taskID, TaskData) end

---[SHARED] Starts a "looping" sound. As with any other sound playing methods, this function expects the sound file to be looping itself and will not automatically loop a non looping sound file as one might expect.
---
--- This function is almost identical to [Global.CreateSound](https://wiki.facepunch.com/gmod/Global.CreateSound), with the exception of the sound being created in the STATIC channel and with normal attenuation.
---
--- See also [Entity:StopLoopingSound](https://wiki.facepunch.com/gmod/Entity:StopLoopingSound)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StartLoopingSound)
---@param sound string Sound to play. Can be either a sound script or a filepath.
---@return number # The ID number of started sound starting with 0, or -1 if we failed for some reason.
function Entity:StartLoopingSound(sound) end

---[SHARED] Starts a motion controller in the physics engine tied to this entity's [PhysObj](https://wiki.facepunch.com/gmod/PhysObj), which enables the use of [ENTITY:PhysicsSimulate](https://wiki.facepunch.com/gmod/ENTITY:PhysicsSimulate).
---
--- The motion controller can later be destroyed via [Entity:StopMotionController](https://wiki.facepunch.com/gmod/Entity:StopMotionController).
---
--- Motion controllers are used internally to control other Entities' [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)ects, such as the Gravity Gun, +use pickup and the Physics Gun.
---
--- This function should be called every time you recreate the Entity's [PhysObj](https://wiki.facepunch.com/gmod/PhysObj). Or alternatively you should call [Entity:AddToMotionController](https://wiki.facepunch.com/gmod/Entity:AddToMotionController) on the new [PhysObj](https://wiki.facepunch.com/gmod/PhysObj).
---
--- Also see [Entity:AddToMotionController](https://wiki.facepunch.com/gmod/Entity:AddToMotionController) and [Entity:RemoveFromMotionController](https://wiki.facepunch.com/gmod/Entity:RemoveFromMotionController).
---
--- **NOTE**: Only works on a scripted [Entity](https://wiki.facepunch.com/gmod/Entity) of anim type.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StartMotionController)
function Entity:StartMotionController() end

---[SERVER] Starts a schedule previously created by [ai_schedule.New](https://wiki.facepunch.com/gmod/ai_schedule.New).
---
--- Not to be confused with [ENTITY:StartEngineSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartEngineSchedule) or [NPC:SetSchedule](https://wiki.facepunch.com/gmod/NPC:SetSchedule) which start an Engine-based schedule.
---
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:StartSchedule)
---@param sched Schedule Schedule to start.
function ENTITY:StartSchedule(sched) end

---[SERVER] Called once on starting task.
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:StartTask)
---@param task Task The task to start, created by ai_task.New.
function ENTITY:StartTask(task) end

---[SERVER] Called when the entity starts touching another entity.
---
--- **WARNING**: This only works for **brush** entities and for entities that have [Entity:SetTrigger](https://wiki.facepunch.com/gmod/Entity:SetTrigger) set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:StartTouch)
---@param entity Entity The entity which is being touched.
function ENTITY:StartTouch(entity) end

---[CLIENT] Stops all particle effects parented to the entity and immediately destroys them.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopAndDestroyParticles)
function Entity:StopAndDestroyParticles() end

---[SHARED] Stops a sound created by [Entity:StartLoopingSound](https://wiki.facepunch.com/gmod/Entity:StartLoopingSound).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopLoopingSound)
---@param id number The sound ID returned by Entity:StartLoopingSound
function Entity:StopLoopingSound(id) end

---[SHARED] Stops the motion controller created with [Entity:StartMotionController](https://wiki.facepunch.com/gmod/Entity:StartMotionController).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopMotionController)
function Entity:StopMotionController() end

---[CLIENT] Stops all particle effects parented to the entity.
---
--- This is ran automatically on every client by [Entity:StopParticles](https://wiki.facepunch.com/gmod/Entity:StopParticles) if called on the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopParticleEmission)
function Entity:StopParticleEmission() end

---[SHARED] Stops any attached to the entity .pcf particles using [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) or [Global.ParticleEffect](https://wiki.facepunch.com/gmod/Global.ParticleEffect).
---
--- On client, this is the same as [Entity:StopParticleEmission](https://wiki.facepunch.com/gmod/Entity:StopParticleEmission). ( and you should use StopParticleEmission instead )
---
--- On server, this is the same as running [Entity:StopParticleEmission](https://wiki.facepunch.com/gmod/Entity:StopParticleEmission) on every client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopParticles)
function Entity:StopParticles() end

---[CLIENT] Stops all particle effects parented to the entity with given name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopParticlesNamed)
---@param name string The name of the particle to stop.
function Entity:StopParticlesNamed(name) end

---[CLIENT] Stops all particle effects parented to the entity with given name on given attachment.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopParticlesWithNameAndAttachment)
---@param name string The name of the particle to stop.
---@param attachment number The attachment of the entity to stop particles on.
function Entity:StopParticlesWithNameAndAttachment(name, attachment) end

---[SHARED] Stops emitting the given sound from the entity, especially useful for looping sounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:StopSound)
---@param sound string The name of the sound script or the filepath to stop playback of.
function Entity:StopSound(sound) end

---[SERVER] Used to store an output so it can be triggered with [ENTITY:TriggerOutput](https://wiki.facepunch.com/gmod/ENTITY:TriggerOutput).
--- Outputs compiled into a map are passed to entities as key/value pairs through [ENTITY:KeyValue](https://wiki.facepunch.com/gmod/ENTITY:KeyValue).
---
--- TriggerOutput will do nothing if this function has not been called first.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:StoreOutput)
---@param name string Name of output to store
---@param info string Output info
function ENTITY:StoreOutput(name, info) end

---[SERVER] Applies the specified amount of damage to the entity with [DMG_GENERIC](https://wiki.facepunch.com/gmod/Enums/DMG) flag.
---
--- **WARNING**: Calling this function on the victim entity in [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage) can cause infinite loops.
---
--- **WARNING**: This function does not seem to do any damage if you apply it to a player who is driving a prop_vehicle_jeep or prop_vehicle_jeep_old vehicle. You need to call it on the vehicle instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:TakeDamage)
---@param damageAmount number The amount of damage to be applied.
---@param attacker? Entity The entity that initiated the attack that caused the damage.
---@param inflictor? Entity The entity that applied the damage, eg. a weapon.
function Entity:TakeDamage(damageAmount, attacker, inflictor) end

---[SERVER] Applies the damage specified by the damage info to the entity.
---
--- **WARNING**: Calling this function on the victim entity in [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage) can cause infinite loops.
---
--- **WARNING**: This function does not seem to do any damage if you apply it to a player who is driving a prop_vehicle_jeep or prop_vehicle_jeep_old vehicle. You need to call it on the vehicle instead.
---
--- **NOTE**: This function does not apply damage to [func_breakable_surf](https://developer.valvesoftware.com/wiki/Func_breakable_surf) entities correctly. To do this, you will need to use [Entity:DispatchTraceAttack](https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack) instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo)
---@param damageInfo CTakeDamageInfo The damage to apply.
function Entity:TakeDamageInfo(damageInfo) end

---[SERVER] Applies forces to our physics object in response to damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:TakePhysicsDamage)
---@param dmginfo CTakeDamageInfo The damageinfo to apply. Only CTakeDamageInfo:GetDamageForce and CTakeDamageInfo:GetDamagePosition are used.
function Entity:TakePhysicsDamage(dmginfo) end

---[SERVER] Returns true if the current running [Task](https://wiki.facepunch.com/gmod/Task) is finished.
--- Tasks finish whenever [NPC:TaskComplete](https://wiki.facepunch.com/gmod/NPC:TaskComplete) is called, which sets `TASKSTATUS_COMPLETE` for all NPCs, also sets `self.bTaskComplete` for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:TaskFinished)
---@return boolean # Is the current running Task is finished or not.
function ENTITY:TaskFinished() end

---[SERVER] Returns how many seconds we've been doing this current task
--- **NOTE**: This hook only exists for `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:TaskTime)
---@return number # How many seconds we've been doing this current task
function ENTITY:TaskTime() end

---[SHARED] Allows you to override trace result when a trace hits the entity.
---
--- Your entity **must** have [Entity:EnableCustomCollisions](https://wiki.facepunch.com/gmod/Entity:EnableCustomCollisions) enabled for this hook to work.
---
--- Your entity must also be otherwise "hit-able" with a trace, so it should have [SOLID_OBB](https://wiki.facepunch.com/gmod/Enums/SOLID#SOLID_OBB) or [SOLID_VPHYSICS](https://wiki.facepunch.com/gmod/Enums/SOLID#SOLID_VPHYSICS) be set (as an example), and it must have its [collision bounds](https://wiki.facepunch.com/gmod/Entity:SetCollisionBounds) be set accordingly.
---
--- **NOTE**: This hook is called for `anim` type only.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:TestCollision)
---@param startpos Vector Start position of the trace.
---@param delta Vector Offset from startpos to the endpos of the trace.
---@param isbox boolean Is the trace a hull trace?
---@param extents Vector Size of the hull trace, with the center of the Bounding Box being `0, 0, 0`, so mins are `-extents`, and maxs are `extents`.
---@param mask number The Enums/CONTENTS mask.
---@return table #
--- Returning a `table` will allow you to override trace results. Table should contain the following keys: (All keys fallback to the original trace value)
--- * Vector `HitPos` - The new hit position of the trace.
--- * number `Fraction` - A number from `0` to `1`, describing how far the trace went from its origin point, `1` = did not hit.
---   * Could be calculated like so : `Fraction = ( startpos + delta ):Length() / myCustomHitPos:Length()`
--- * Vector `Normal` - A unit vector (length=1) describing the direction perpendicular to the hit surface.
---
--- Returning `true` will allow "normal" collisions to happen for `SOLID_VPHYSICS` and `SOLID_OBB` entities.
--- Returning `nothing` or `false` allows the trace to ignore the entity completely.
function ENTITY:TestCollision(startpos, delta, isbox, extents, mask) end

---[SERVER] Check if the given position or entity is within this entity's [PVS(Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community").
---
--- See also [Entity:IsDormant](https://wiki.facepunch.com/gmod/Entity:IsDormant).
---
--- **NOTE**: The function won't take in to account [Global.AddOriginToPVS](https://wiki.facepunch.com/gmod/Global.AddOriginToPVS) and the like.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:TestPVS)
---@param testPoint any Entity or Vector to test against. If an entity is given, this function will test using its bounding box.
---@return boolean # True if the testPoint is within our PVS.
function Entity:TestPVS(testPoint) end

---[SHARED] Called every frame on the client.
--- Called about 5-6 times per second on the server.
---
--- **NOTE**: You may need to call [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn) to get this hook to run server side.
---
--- You can force it to run at servers tickrate using the example below.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:Think)
---@return boolean # Return `true` if you used Entity:NextThink to override the next execution time.
function ENTITY:Think() end

---[SERVER] Called every tick for every entity being "touched".
---
--- See also [ENTITY:StartTouch](https://wiki.facepunch.com/gmod/ENTITY:StartTouch) and [ENTITY:EndTouch](https://wiki.facepunch.com/gmod/ENTITY:EndTouch).
---
--- **NOTE**: For physics enabled entities, this hook will **not** be ran while the entity's physics is asleep. See [PhysObj:Wake](https://wiki.facepunch.com/gmod/PhysObj:Wake).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:Touch)
---@param entity Entity The entity that touched it.
function ENTITY:Touch(entity) end

---[SERVER] Called by the engine to alter NPC activities, if desired by the NPC.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:TranslateActivity)
---@param act number The activity to translate. See Enums/ACT.
---@return number # The activity that should override the incoming activity. See Enums/ACT.
---
--- Do not return anything to not override.
function ENTITY:TranslateActivity(act) end

---[SHARED] Returns the ID of a [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) attached to the given bone.
---
--- See [Entity:TranslatePhysBoneToBone](https://wiki.facepunch.com/gmod/Entity:TranslatePhysBoneToBone) for reverse function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:TranslateBoneToPhysBone)
---@param boneID number The ID of a bone to look up the "physics root" bone of.
---@return number # The PhysObj ID of the given bone to be used with Entity:GetPhysicsObjectNum or `-1` if we cannot translate for some reason, such as a model bone having no physics object associated with it.
function Entity:TranslateBoneToPhysBone(boneID) end

---[SHARED] Returns the boneID of the bone the given [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) is attached to.
---
--- See [Entity:TranslateBoneToPhysBone](https://wiki.facepunch.com/gmod/Entity:TranslateBoneToPhysBone) for reverse function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:TranslatePhysBoneToBone)
---@param physNum number The PhysObj number on the entity
---@return number # The boneID of the bone the PhysObj is attached to.
function Entity:TranslatePhysBoneToBone(physNum) end

---[SERVER] Called by the engine to alter NPC schedules, if desired by the NPC.
---
--- **NOTE**: This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:TranslateSchedule)
---@param schedule number The schedule to translate. See Enums/SCHED.
---@return number # The schedule that should override the incoming schedule. See Enums/SCHED.
---
--- Do not return anything to not override.
function ENTITY:TranslateSchedule(schedule) end

---[SERVER] Triggers all outputs stored using [ENTITY:StoreOutput](https://wiki.facepunch.com/gmod/ENTITY:StoreOutput).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:TriggerOutput)
---@param output string Name of output to fire
---@param activator Entity Activator entity
---@param data? string The data to give to the output.
function ENTITY:TriggerOutput(output, activator, data) end

---[SERVER] Updates positions of bone followers created by [Entity:CreateBoneFollowers](https://wiki.facepunch.com/gmod/Entity:CreateBoneFollowers).
---
--- This should be called every tick.
---
--- **NOTE**: This function only works on `anim`, `nextbot` and `ai` type entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:UpdateBoneFollowers)
function Entity:UpdateBoneFollowers() end

---[CLIENT] Marks the render-to-texture (RTT) shadow of this entity as dirty, as well as any potential projected texture shadows related to this entity, so they will be updated as soon as possible.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:UpdateShadow)
function Entity:UpdateShadow() end

---[SERVER] Called whenever the transmit state should be updated.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:UpdateTransmitState)
---@return number # Transmit state to set, see Enums/TRANSMIT.
function ENTITY:UpdateTransmitState() end

---[SERVER] Called when an entity "uses" this entity, for example a player pressing their `+use` key (default E) on this entity.
---
--- To change how often the hook is called, see [Entity:SetUseType](https://wiki.facepunch.com/gmod/Entity:SetUseType).
---
--- **NOTE**: This hook only works for `nextbot`, `ai` and `anim` scripted entity types.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENTITY:Use)
---@param activator Entity The entity that caused this input. This will usually be the player who pressed their use key.
---@param caller Entity The entity responsible for the input. This will typically be the same as `activator` unless some other entity is acting as a proxy
---@param useType number Use type, see Enums/USE.
---@param value number Any passed value.
function ENTITY:Use(activator, caller, useType, value) end

---[SERVER] Simulates a `+use` action on an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Use(function))
---@param activator Entity The entity that caused this input. This will usually be the player who pressed their use key
---@param caller? Entity The entity responsible for the input. This will typically be the same as `activator` unless some other entity is acting as a proxy
---@param useType? number Use type, see Enums/USE.
---@param value? number Any value.
function Entity:Use(activator, caller, useType, value) end

---[SHARED] **NOTE**: Does nothing on server.
---
--- Animations will be handled purely clientside instead of a fixed animtime, enabling interpolation. This does not affect layers and gestures.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:UseClientSideAnimation)
function Entity:UseClientSideAnimation() end

---[SHARED] Enables or disables trigger bounds.
---
--- This will give the entity a "trigger box" that extends around its bounding box by boundSize units in X/Y and (boundSize / 2) in +Z (-Z remains the same).
--- The trigger box is world aligned and will work regardless of the object's solidity and collision group.
---
--- Valve use trigger boxes for all pickup items. Their bloat size is 24, a surprisingly large figure.
---
--- **NOTE**: The trigger boxes can be made visible as a light blue box by using the **ent_bbox** console command while looking at the entity. Alternatively a classname or entity index can be used as the first argument.
---
--- This requires **developer** to be set to **1**.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:UseTriggerBounds)
---@param enable boolean Enable or disable the bounds.
---@param boundSize? number The distance/size of the trigger bounds.
function Entity:UseTriggerBounds(enable, boundSize) end

---[SHARED] Returns the index of this view model, it can be used to identify which one of the player's view models this entity is.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:ViewModelIndex)
---@return number # View model index, ranges from 0 to 2, nil if the entity is not a view model
function Entity:ViewModelIndex() end

---[SERVER] Returns whether the target/given entity is visible from the this entity.
---
--- This is meant to be used only with NPCs.
---
--- Differences from a simple trace include:
--- * If target has `FL_NOTARGET`, returns `false`
--- * If `ai_ignoreplayers` is turned on and target is a player, returns `false`
--- * Reacts to `ai_LOS_mode`:
--- * * If `1`, does a simple trace with `COLLISION_GROUP_NONE` and `MASK_BLOCKLOS`
--- * * If not, does a trace with `MASK_BLOCKLOS_AND_NPCS` (- `CONTENTS_BLOCKLOS` is target is player) and a custom LOS filter (`CTraceFilterLOS`)
--- * Returns `true` if hits a vehicle the target is driving
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Visible)
---@param target Entity Entity to check for visibility to.
---@return boolean # If the entities can see each other.
function Entity:Visible(target) end

---[SERVER] Returns true if supplied vector is visible from the entity's line of sight.
---
--- This is achieved similarly to a trace.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:VisibleVec)
---@param pos Vector The position to check for visibility
---@return boolean # Within line of sight
function Entity:VisibleVec(pos) end

---[SHARED] Returns an integer that represents how deep in water the entity is.
--- 		**NOTE**: This function will currently work on players only due to the way it is implemented in the engine. If you need to check interaction with water for regular entities you better use [util.PointContents](https://wiki.facepunch.com/gmod/util.PointContents).
---
--- * **0** - The entity isn't in water.
---
--- * **1** - Slightly submerged (at least to the feet).
---
--- * **2** - The majority of the entity is submerged (at least to the waist).
---
--- * **3** - Completely submerged.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:WaterLevel)
---@return number # The water level.
function Entity:WaterLevel() end

---[SHARED] Sets the activity of the entity's active weapon.
---
--- **NOTE**: This does nothing on the client.
---
--- **NOTE**: Only works for CBaseCombatCharacter entities, which includes players and NPCs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Weapon_SetActivity)
---@param act number Activity number. See Enums/ACT.
---@param duration number How long the animation should take in seconds.
function Entity:Weapon_SetActivity(act, duration) end

---[SHARED] Calls and returns [WEAPON:TranslateActivity](https://wiki.facepunch.com/gmod/WEAPON:TranslateActivity) on the weapon the entity ( player or NPC ) carries.
---
--- Despite existing on client, it doesn't actually do anything on client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:Weapon_TranslateActivity)
---@param act number The activity to translate
---@return number # The translated activity
function Entity:Weapon_TranslateActivity(act) end

---[SHARED] Returns two vectors representing the minimum and maximum extent of the entity's axis-aligned bounding box (which is calculated from entity's collision bounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:WorldSpaceAABB)
---@return Vector # The minimum vector for the entity's bounding box in world space.
---@return Vector # The maximum vector for the entity's bounding box in world space.
function Entity:WorldSpaceAABB() end

---[SHARED] Returns the center of the entity according to its collision model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:WorldSpaceCenter)
---@return Vector # The center of the entity
function Entity:WorldSpaceCenter() end

---[SHARED] Converts a worldspace vector into a vector local to an entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:WorldToLocal)
---@param wpos Vector The world vector
---@return Vector # The local vector
function Entity:WorldToLocal(wpos) end

---[SHARED] Converts world angles to local angles ( local to the entity )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Entity:WorldToLocalAngles)
---@param ang Angle The world angles
---@return Angle # The local angles
function Entity:WorldToLocalAngles(ang) end
