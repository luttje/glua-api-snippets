---@meta

--- This is a list of all methods only available for NPCs. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on NPCs.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC)
---@class NPC : Entity
NPC = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes the NPC like, hate, feel neutral towards, or fear the entity in question. If you want to setup relationship towards a certain entity `class`, use [NPC:AddRelationship](https://wiki.facepunch.com/gmod/NPC:AddRelationship).
---
--- **NOTE**: NPCs do not see [NextBot](https://wiki.facepunch.com/gmod/NextBot)s by default. This can be fixed by adding the [FL_OBJECT](https://wiki.facepunch.com/gmod/Enums/FL) flag to the NextBot.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship)
---@param target Entity The entity for the relationship to be applied to.
---@param disposition number A Enums/D representing the relationship type.
---@param priority? number How strong the relationship is. Higher values mean higher priority over relationships with lower priority.
function NPC:AddEntityRelationship(target, disposition, priority) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Changes how an NPC feels towards another NPC.  If you want to setup relationship towards a certain `entity`, use [NPC:AddEntityRelationship](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship).
---
--- **WARNING**: Avoid using this in [GM:OnEntityCreated](https://wiki.facepunch.com/gmod/GM:OnEntityCreated) to prevent crashing due to infinite loops. This function may create an entity with given class and delete it immediately after.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:AddRelationship)
---@param relationstring string A string representing how the relationship should be set up.
--- Should be formatted as `"npc_class `Enums/D` numberPriority"`.
function NPC:AddRelationship(relationstring) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Advances the NPC on its path to the next waypoint.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:AdvancePath)
function NPC:AdvancePath() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Force an NPC to play their Alert sound.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:AlertSound)
function NPC:AlertSound() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Executes any movement the current sequence may have.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:AutoMovement)
---@param interval number This is a good place to use Entity:GetAnimTimeInterval.
---@param target? Entity
---@return boolean # `true` if any movement was performed.
function NPC:AutoMovement(interval, target) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds a capability to the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:CapabilitiesAdd)
---@param capabilities number Capabilities to add, see Enums/CAP.
function NPC:CapabilitiesAdd(capabilities) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes all of Capabilities the NPC has.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:CapabilitiesClear)
function NPC:CapabilitiesClear() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC's capabilities along the ones defined on its weapon.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:CapabilitiesGet)
---@return number # The capabilities as a bitflag.
--- See Enums/CAP
function NPC:CapabilitiesGet() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Remove a certain capability.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:CapabilitiesRemove)
---@param capabilities number Capabilities to remove, see Enums/CAP
function NPC:CapabilitiesRemove(capabilities) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC class. Do not confuse with [Entity:GetClass](https://wiki.facepunch.com/gmod/Entity:GetClass)!
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:Classify)
---@return number # See Enums/CLASS
function NPC:Classify() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Resets the [NPC:GetBlockingEntity](https://wiki.facepunch.com/gmod/NPC:GetBlockingEntity).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ClearBlockingEntity)
function NPC:ClearBlockingEntity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Clears out the specified [Enums/COND](https://wiki.facepunch.com/gmod/Enums/COND) on this NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ClearCondition)
---@param condition number The Enums/COND to clear out.
function NPC:ClearCondition(condition) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Clears the Enemy from the NPC's memory, effectively forgetting it until met again with either the NPC vision or with [NPC:UpdateEnemyMemory](https://wiki.facepunch.com/gmod/NPC:UpdateEnemyMemory).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ClearEnemyMemory)
---@param enemy? Entity The enemy to mark
function NPC:ClearEnemyMemory(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Clears the NPC's current expression which can be set with [NPC:SetExpression](https://wiki.facepunch.com/gmod/NPC:SetExpression).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ClearExpression)
function NPC:ClearExpression() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Clears the current NPC goal or target.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ClearGoal)
function NPC:ClearGoal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Stops the current schedule that the NPC is doing.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ClearSchedule)
function NPC:ClearSchedule() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Translates condition ID to a string.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ConditionName)
---@param cond number The NPCs condition ID, see Enums/COND
---@return string # A human understandable string equivalent of that condition.
function NPC:ConditionName(cond) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the way the NPC "feels" about a given entity. See [NPC:AddEntityRelationship](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship).
---
--- **NOTE**: For `ai` type entities, this will return [ENTITY:GetRelationship](https://wiki.facepunch.com/gmod/ENTITY:GetRelationship). If it returns `nil` or for engine NPCs, this will return whatever was last set by [NPC:AddEntityRelationship](https://wiki.facepunch.com/gmod/NPC:AddEntityRelationship). As a last resort, engine will decide on the disposition based on this NPC's [NPC:Classify](https://wiki.facepunch.com/gmod/NPC:Classify).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:Disposition)
---@param ent Entity The entity to test our disposition towards.
---@return number # The NPCs disposition, see Enums/D.
---@return number # The NPCs disposition priority.
function NPC:Disposition(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the NPC to drop the specified weapon.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:DropWeapon)
---@param weapon? Weapon Weapon to be dropped. If unset, will default to the currently equipped weapon.
---@param target? Vector If set, launches the weapon at given position. There is a limit to how far it is willing to throw the weapon. Overrides velocity argument.
---@param velocity? Vector If set and previous argument is unset, launches the weapon with given velocity. If the velocity is higher than 400, it will be clamped to 400.
function NPC:DropWeapon(weapon, target, velocity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes an NPC exit a scripted sequence, if one is playing.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ExitScriptedSequence)
function NPC:ExitScriptedSequence() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Force an NPC to play its Fear sound.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:FearSound)
function NPC:FearSound() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Force an NPC to play its FoundEnemy sound.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:FoundEnemySound)
function NPC:FoundEnemySound() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the weapon the NPC is currently carrying, or [NULL](https://wiki.facepunch.com/gmod/Global_Variables).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetActiveWeapon)
---@return Entity # The NPCs current weapon
function NPC:GetActiveWeapon() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC's current activity.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetActivity)
---@return number # Current activity, see Enums/ACT.
function NPC:GetActivity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the aim vector of the NPC. NPC alternative of [Player:GetAimVector](https://wiki.facepunch.com/gmod/Player:GetAimVector).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetAimVector)
---@return Vector # The aim direction of the NPC.
function NPC:GetAimVector() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the activity to be played when the NPC arrives at its goal
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetArrivalActivity)
---@return number # The arrival activity. See Enums/ACT.
function NPC:GetArrivalActivity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the direction from the NPC origin to its current navigational destination.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetArrivalDirection)
---@return Vector # The arrival direction.
function NPC:GetArrivalDirection() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns NPC arrival distance, set by [NPC:SetArrivalDistance](https://wiki.facepunch.com/gmod/NPC:SetArrivalDistance).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetArrivalDistance)
---@return number # The current arrival distance.
function NPC:GetArrivalDistance() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the sequence to be played when the NPC arrives at its goal.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetArrivalSequence)
---@return number # Sequence ID to be played, or -1 if there's no sequence.
function NPC:GetArrivalSequence() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns NPC arrival speed, set by [NPC:SetArrivalSpeed](https://wiki.facepunch.com/gmod/NPC:SetArrivalSpeed).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetArrivalSpeed)
---@return number # The current arrival peed.
function NPC:GetArrivalSpeed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the most dangerous/closest sound hint based on the NPCs location and the types of sounds it can sense.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetBestSoundHint)
---@param types number The types of sounds to choose from. See Enums/SOUND
---@return table # A table with Structures/SoundHintData structure or `nil` if no sound hints are nearby.
function NPC:GetBestSoundHint(types) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the entity blocking the NPC along its path.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetBlockingEntity)
---@return Entity # Blocking entity
function NPC:GetBlockingEntity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the goal type for current navigation path.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetCurGoalType)
---@return number # The goal type. See Enums/GOALTYPE.
function NPC:GetCurGoalType() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC's current schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetCurrentSchedule)
---@return number # The NPCs schedule, see Enums/SCHED or -1 if we failed for some reason
function NPC:GetCurrentSchedule() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns how proficient (skilled) an NPC is with its current weapon.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetCurrentWeaponProficiency)
---@return number # NPC's proficiency for current weapon. See Enums/WEAPON_PROFICIENCY.
function NPC:GetCurrentWeaponProficiency() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gets the NPC's current waypoint position (where NPC is currently moving towards), if any is available.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetCurWaypointPos)
---@return Vector # The position of the current NPC waypoint.
function NPC:GetCurWaypointPos() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the entity that this NPC is trying to fight.
---
--- This returns nil if the NPC has no enemy. You should use [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) (which accounts for nil and NULL) on the return to verify validity of the enemy.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetEnemy)
---@return NPC # Enemy NPC.
function NPC:GetEnemy() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the first time an NPC's enemy was seen by the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetEnemyFirstTimeSeen)
---@param enemy? Entity The enemy to check.
---@return number # First time the given enemy was seen.
function NPC:GetEnemyFirstTimeSeen(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the last known position of an NPC's enemy.
---
--- Similar to [NPC:GetEnemyLastSeenPos](https://wiki.facepunch.com/gmod/NPC:GetEnemyLastSeenPos), but the known position will be a few seconds ahead of the last seen position.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetEnemyLastKnownPos)
---@param enemy? Entity The enemy to check.
---@return Vector # The last known position.
function NPC:GetEnemyLastKnownPos(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the last seen position of an NPC's enemy.
---
--- Similar to [NPC:GetEnemyLastKnownPos](https://wiki.facepunch.com/gmod/NPC:GetEnemyLastKnownPos), but the known position will be a few seconds ahead of the last seen position.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetEnemyLastSeenPos)
---@param enemy? Entity The enemy to check.
---@return Vector # The last seen position.
function NPC:GetEnemyLastSeenPos(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the last time an NPC's enemy was seen by the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetEnemyLastTimeSeen)
---@param enemy? Entity The enemy to check.
---@return number # Last time the given enemy was seen.
function NPC:GetEnemyLastTimeSeen(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the expression file the NPC is currently playing.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetExpression)
---@return string # The file path of the expression.
function NPC:GetExpression() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the Field Of View of the NPC. See [NPC:SetFOV](https://wiki.facepunch.com/gmod/NPC:SetFOV).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetFOV)
---@return number # The FOV for the NPC in degrees.
function NPC:GetFOV() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the position we are trying to reach, if any.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetGoalPos)
---@return Vector # The position we are trying to reach.
function NPC:GetGoalPos() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the entity we are trying to reach, if any.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetGoalTarget)
---@return Entity # The entity we are trying to reach, or `NULL`.
function NPC:GetGoalTarget() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns NPCs hull type set by [NPC:SetHullType](https://wiki.facepunch.com/gmod/NPC:SetHullType).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetHullType)
---@return number # Hull type, see Enums/HULL
function NPC:GetHullType() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the ideal activity the NPC currently wants to achieve.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetIdealActivity)
---@return number # The ideal activity. Enums/ACT.
function NPC:GetIdealActivity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the ideal move acceleration of the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetIdealMoveAcceleration)
---@return number # The ideal move acceleration.
function NPC:GetIdealMoveAcceleration() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the ideal move speed of the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetIdealMoveSpeed)
---@return number # The ideal move speed.
function NPC:GetIdealMoveSpeed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the ideal sequence the NPC currently wants to achieve.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetIdealSequence)
---@return number # The ideal sequence, specific to the NPCs model.
function NPC:GetIdealSequence() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the ideal yaw (left right rotation) for this NPC at this moment.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetIdealYaw)
---@return number # The ideal yaw.
function NPC:GetIdealYaw() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns all known enemies this NPC has.
---
--- See also [NPC:GetKnownEnemyCount](https://wiki.facepunch.com/gmod/NPC:GetKnownEnemyCount)
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetKnownEnemies)
---@return table # Table of entities that this NPC knows as enemies.
function NPC:GetKnownEnemies() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns known enemy count of this NPC.
---
--- See also [NPC:GetKnownEnemies](https://wiki.facepunch.com/gmod/NPC:GetKnownEnemies)
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetKnownEnemyCount)
---@return number # Amount of entities that this NPC knows as enemies.
function NPC:GetKnownEnemyCount() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the last registered or memorized position of the NPC. When using scheduling, the NPC will focus on navigating to the last position via nodes.
---
--- See [NPC:SetLastPosition](https://wiki.facepunch.com/gmod/NPC:SetLastPosition).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetLastPosition)
---@return Vector # Where the NPC's last position was set to.
function NPC:GetLastPosition() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) based time since this NPC last received damage from given enemy. The last damage time is set when [NPC:MarkTookDamageFromEnemy](https://wiki.facepunch.com/gmod/NPC:MarkTookDamageFromEnemy) is called.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetLastTimeTookDamageFromEnemy)
---@param enemy? Entity The enemy to test. Defaults to currently active enemy (NPC:GetEnemy)
---@return number # Time since this NPC last received damage from given enemy.
function NPC:GetLastTimeTookDamageFromEnemy(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns NPCs max view distance. An NPC will not be able to see enemies outside of this distance.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMaxLookDistance)
---@return number # The maximum distance the NPC can see at.
function NPC:GetMaxLookDistance() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns how far should the NPC look ahead in its route.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMinMoveCheckDist)
---@return number # How far the NPC checks ahead of its route.
function NPC:GetMinMoveCheckDist() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns how far before the NPC can come to a complete stop.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMinMoveStopDist)
---@param minResult? number The minimum value that will be returned by this function.
---@return number # The minimum stop distance.
function NPC:GetMinMoveStopDist(minResult) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the movement delay for given NPC.
---
--- See [NPC:SetMoveDelay](https://wiki.facepunch.com/gmod/NPC:SetMoveDelay).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMoveDelay)
---@return number # The movement delay.
function NPC:GetMoveDelay() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current timestep the internal NPC motor is working on.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMoveInterval)
---@return number # The current timestep.
function NPC:GetMoveInterval() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC's current movement activity.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMovementActivity)
---@return number # Current NPC movement activity, see Enums/ACT.
function NPC:GetMovementActivity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the index of the sequence the NPC uses to move.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMovementSequence)
---@return number # The movement sequence index
function NPC:GetMovementSequence() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current move velocity of the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetMoveVelocity)
---@return Vector # The current move velocity of the NPC.
function NPC:GetMoveVelocity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC's navigation type.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetNavType)
---@return number # The nav type. See Enums/NAV.
function NPC:GetNavType() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the nearest member of the squad the NPC is in.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetNearestSquadMember)
---@return NPC # The nearest member of the squad the NPC is in.
function NPC:GetNearestSquadMember() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gets the NPC's next waypoint position, where NPC will be moving after reaching current waypoint, if any is available.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetNextWaypointPos)
---@return Vector # The position of the next NPC waypoint.
function NPC:GetNextWaypointPos() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC's state.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetNPCState)
---@return number # The NPC's current state, see Enums/NPC_STATE.
function NPC:GetNPCState() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the distance the NPC is from Target Goal.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetPathDistanceToGoal)
---@return number # The number of hammer units the NPC is away from the Goal.
function NPC:GetPathDistanceToGoal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the amount of time it will take for the NPC to get to its Target Goal.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetPathTimeToGoal)
---@return number # The amount of time to get to the target goal.
function NPC:GetPathTimeToGoal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the shooting position of the NPC, i.e. where their bullets would come from, etc.
---
--- If the NPC does not overwrite this, it will return [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetShootPos)
---@return Vector # The NPC's shooting position.
function NPC:GetShootPos() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current squad name of the NPC, as set via [NPC:SetSquad](https://wiki.facepunch.com/gmod/NPC:SetSquad).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetSquad)
---@return string # The new squad name to set.
function NPC:GetSquad() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns NPC step height.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetStepHeight)
---@return number # The current step height.
function NPC:GetStepHeight() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the NPC's current target set by [NPC:SetTarget](https://wiki.facepunch.com/gmod/NPC:SetTarget).
---
--- This returns nil if the NPC has no target. You should use [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) (which accounts for nil and NULL) on the return to verify validity of the target.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetTarget)
---@return Entity # Target entity
function NPC:GetTarget() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the status of the current task.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetTaskStatus)
---@return number # The status. See Enums/TASKSTATUS.
function NPC:GetTaskStatus() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) based time since the enemy was reacquired, meaning it is currently in Line of Sight of the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetTimeEnemyLastReacquired)
---@param enemy? Entity The enemy to test. Defaults to currently active enemy (NPC:GetEnemy)
---@return number # Time enemy was last reacquired.
function NPC:GetTimeEnemyLastReacquired(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the view offset of the NPC. Set by [NPC:SetViewOffset](https://wiki.facepunch.com/gmod/NPC:SetViewOffset).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetViewOffset)
---@return Vector # The view offset of the NPC.
function NPC:GetViewOffset() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a specific weapon the NPC owns.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetWeapon)
---@param class string A classname of the weapon to try to get.
---@return Weapon # The weapon for the specified class, or NULL of the NPC doesn't have given weapon.
function NPC:GetWeapon(class) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of the NPC's weapons.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:GetWeapons)
---@return Weapon[] # A list of the weapons the NPC currently has.
function NPC:GetWeapons() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Used to give a weapon to an already spawned NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:Give)
---@param weapon string Class name of the weapon to equip to the NPC.
---@return Weapon # The weapon entity given to the NPC.
function NPC:Give(weapon) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether or not the NPC has the given condition.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:HasCondition)
---@param condition number The condition index, see Enums/COND.
---@return boolean # True if the NPC has the given condition, false otherwise.
function NPC:HasCondition(condition) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Polls the enemy memory to check if the given entity has eluded us or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:HasEnemyEluded)
---@param enemy? Entity The enemy to test.
---@return boolean # If the enemy has eluded us.
function NPC:HasEnemyEluded(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Polls the enemy memory to check if the NPC has any memory of given enemy.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:HasEnemyMemory)
---@param enemy? Entity The entity to test.
---@return boolean # If we have any memory on given enemy.
function NPC:HasEnemyMemory(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if the current navigation has an obstacle, this is different from [NPC:GetBlockingEntity](https://wiki.facepunch.com/gmod/NPC:GetBlockingEntity), this is for virtual navigation obstacles put by AI's local navigation system to prevent movement to the marked area, forcing NPC to steer around, [for example](https://github.com/ValveSoftware/source-sdk-2013/blob/master/mp/src/game/server/hl2/npc_playercompanion.cpp#L2897).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:HasObstacles)
---@return boolean # `true` if the current navigation has an obstacle.
function NPC:HasObstacles() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Force an NPC to play their Idle sound.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IdleSound)
function NPC:IdleSound() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes the NPC ignore given entity/enemy until given time.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IgnoreEnemyUntil)
---@param enemy Entity The enemy to ignore.
---@param _until number How long to ignore the enemy for. This will be compared to Global.CurTime, so your value should be based on it.
function NPC:IgnoreEnemyUntil(enemy, _until) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether or not the NPC is performing the given schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsCurrentSchedule)
---@param schedule number The schedule number, see Enums/SCHED.
---@return boolean # True if the NPC is performing the given schedule, false otherwise.
function NPC:IsCurrentSchedule(schedule) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the current navigational waypoint is the final one.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsCurWaypointGoal)
---@return boolean # Whether the current navigational waypoint is the final one.
function NPC:IsCurWaypointGoal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the NPC is facing their ideal yaw. See [NPC:SetIdealYaw](https://wiki.facepunch.com/gmod/NPC:SetIdealYaw), [NPC:GetIdealYaw](https://wiki.facepunch.com/gmod/NPC:GetIdealYaw) and [NPC:SetIdealYawAndUpdate](https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsFacingIdealYaw)
---@return boolean # Whether the NPC is facing their ideal yaw.
function NPC:IsFacingIdealYaw() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the NPC has an active goal.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsGoalActive)
---@return boolean # Whether the NPC has an active goal or not.
function NPC:IsGoalActive() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Tests whether a position or an NPC is in the view cone of the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsInViewCone)
---@param position Vector The position to test.
---@return boolean # If the given position is in the view cone.
function NPC:IsInViewCone(position) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Tests whether a position or an NPC is in the view cone of the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsInViewCone)
---@param ent Entity The entity to test. Will use the entity's position.
---@return boolean # If the given position is in the view cone.
function NPC:IsInViewCone(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns if the current movement is locked on the Yaw axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsMoveYawLocked)
---@return boolean # Whether the movement is yaw locked or not.
function NPC:IsMoveYawLocked() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the NPC is moving or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsMoving)
---@return boolean # Whether the NPC is moving or not.
function NPC:IsMoving() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Checks if the NPC is running an **ai_goal**. ( e.g. An npc_citizen NPC following the Player. )
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsRunningBehavior)
---@return boolean # Returns true if running an ai_goal, otherwise returns false.
function NPC:IsRunningBehavior() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the current NPC is the leader of the squad it is in.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsSquadLeader)
---@return boolean # Whether the NPC is the leader of the squad or not.
function NPC:IsSquadLeader() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if the entity was remembered as unreachable. The memory is updated automatically from following engine tasks if they failed:
--- * TASK_GET_CHASE_PATH_TO_ENEMY
--- * TASK_GET_PATH_TO_ENEMY_LKP
--- * TASK_GET_PATH_TO_INTERACTION_PARTNER
--- * TASK_ANTLIONGUARD_GET_CHASE_PATH_ENEMY_TOLERANCE
--- * SCHED_FAIL_ESTABLISH_LINE_OF_FIRE - Combine NPCs, also when failing to change their enemy
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:IsUnreachable)
---@param testEntity Entity The entity to test.
---@return boolean # If the entity is reachable or not.
function NPC:IsUnreachable(testEntity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Force an NPC to play their LostEnemy sound.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:LostEnemySound)
function NPC:LostEnemySound() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Tries to achieve our ideal animation state, playing any transition sequences that we need to play to get there.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MaintainActivity)
function NPC:MaintainActivity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Causes the NPC to temporarily forget the current enemy and switch on to a better one.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MarkEnemyAsEluded)
---@param enemy? Entity The enemy to mark
function NPC:MarkEnemyAsEluded(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Marks the NPC as took damage from given entity.
---
--- See also [NPC:GetLastTimeTookDamageFromEnemy](https://wiki.facepunch.com/gmod/NPC:GetLastTimeTookDamageFromEnemy).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MarkTookDamageFromEnemy)
---@param enemy? Entity The enemy to mark. Defaults to currently active enemy (NPC:GetEnemy)
function NPC:MarkTookDamageFromEnemy(enemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Executes a climb move.
---
--- Related functions are [NPC:MoveClimbStart](https://wiki.facepunch.com/gmod/NPC:MoveClimbStart) and [NPC:MoveClimbStop](https://wiki.facepunch.com/gmod/NPC:MoveClimbStop).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveClimbExec)
---@param destination Vector The destination of the climb.
---@param dir Vector The direction of the climb.
---@param distance number The distance.
---@param yaw number The yaw angle.
---@param left number Amount of climb nodes left?
---@return number # The result. See Enums/AIMR.
function NPC:MoveClimbExec(destination, dir, distance, yaw, left) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts a climb move.
---
--- Related functions are [NPC:MoveClimbExec](https://wiki.facepunch.com/gmod/NPC:MoveClimbExec) and [NPC:MoveClimbStop](https://wiki.facepunch.com/gmod/NPC:MoveClimbStop).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveClimbStart)
---@param destination Vector The destination of the climb.
---@param dir Vector The direction of the climb.
---@param distance number The distance.
---@param yaw number The yaw angle.
function NPC:MoveClimbStart(destination, dir, distance, yaw) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Stops a climb move.
---
--- Related functions are [NPC:MoveClimbExec](https://wiki.facepunch.com/gmod/NPC:MoveClimbExec) and [NPC:MoveClimbStart](https://wiki.facepunch.com/gmod/NPC:MoveClimbStart).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveClimbStop)
function NPC:MoveClimbStop() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Executes a jump move.
---
--- Related functions are [NPC:MoveJumpStart](https://wiki.facepunch.com/gmod/NPC:MoveJumpStart) and [NPC:MoveJumpStop](https://wiki.facepunch.com/gmod/NPC:MoveJumpStop).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveJumpExec)
---@return number # The result. See Enums/AIMR.
function NPC:MoveJumpExec() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts a jump move.
---
--- Related functions are [NPC:MoveJumpExec](https://wiki.facepunch.com/gmod/NPC:MoveJumpExec) and [NPC:MoveJumpStop](https://wiki.facepunch.com/gmod/NPC:MoveJumpStop).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveJumpStart)
---@param vel Vector The jump velocity.
function NPC:MoveJumpStart(vel) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Stops a jump move.
---
--- Related functions are [NPC:MoveJumpExec](https://wiki.facepunch.com/gmod/NPC:MoveJumpExec) and [NPC:MoveJumpStart](https://wiki.facepunch.com/gmod/NPC:MoveJumpStart).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveJumpStop)
---@return number # The result. See Enums/AIMR.
function NPC:MoveJumpStop() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes the NPC walk toward the given position. The NPC will return to the player after amount of time set by **player_squad_autosummon_time** [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
--- Only works on Citizens (npc_citizen) and is a part of the Half-Life 2 squad system.
---
--- The NPC **must** be in the player's squad for this to work.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveOrder)
---@param position Vector The target position for the NPC to walk to.
function NPC:MoveOrder(position) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Pauses the NPC movement?
---
--- Related functions are [NPC:MoveStart](https://wiki.facepunch.com/gmod/NPC:MoveStart), [NPC:MoveStop](https://wiki.facepunch.com/gmod/NPC:MoveStop) and [NPC:ResetMoveCalc](https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MovePause)
function NPC:MovePause() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts NPC movement?
---
--- Related functions are [NPC:MoveStop](https://wiki.facepunch.com/gmod/NPC:MoveStop), [NPC:MovePause](https://wiki.facepunch.com/gmod/NPC:MovePause) and [NPC:ResetMoveCalc](https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveStart)
function NPC:MoveStart() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Stops the NPC movement?
---
--- Related functions are [NPC:MoveStart](https://wiki.facepunch.com/gmod/NPC:MoveStart), [NPC:MovePause](https://wiki.facepunch.com/gmod/NPC:MovePause) and [NPC:ResetMoveCalc](https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:MoveStop)
function NPC:MoveStop() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Works similarly to [NPC:NavSetRandomGoal](https://wiki.facepunch.com/gmod/NPC:NavSetRandomGoal).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:NavSetGoal)
---@param pos Vector The origin to calculate a path from.
---@param length number The target length of the path to calculate.
---@param dir Vector The direction in which to look for a new path end goal.
---@return boolean # Whether path generation was successful or not.
function NPC:NavSetGoal(pos, length, dir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Creates a path to closest node at given position. This won't actually force the NPC to move.
---
--- See also [NPC:NavSetRandomGoal](https://wiki.facepunch.com/gmod/NPC:NavSetRandomGoal).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:NavSetGoalPos)
---@param pos Vector The position to calculate a path to.
---@return boolean # Whether path generation was successful or not.
function NPC:NavSetGoalPos(pos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Set the goal target for an NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:NavSetGoalTarget)
---@param target Entity The targeted entity to set the goal to.
---@param offset? Vector The offset to apply to the targeted entity's position.
---@return boolean # Whether path generation was successful or not
function NPC:NavSetGoalTarget(target, offset) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Creates a random path of specified minimum length between a closest start node and random node in the specified direction. This won't actually force the NPC to move.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:NavSetRandomGoal)
---@param minPathLength number Minimum length of path in units
---@param dir Vector Unit vector pointing in the direction of the target random node
---@return boolean # Whether path generation was successful or not
function NPC:NavSetRandomGoal(minPathLength, dir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets a goal in x, y offsets for the NPC to wander to
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:NavSetWanderGoal)
---@param xOffset number X offset
---@param yOffset number Y offset
---@return boolean # Whether path generation was successful or not
function NPC:NavSetWanderGoal(xOffset, yOffset) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the NPC to pickup an existing weapon entity. The NPC will not pick up the weapon if they already own a weapon of given type, or if the NPC could not normally have this weapon in their inventory.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:PickupWeapon)
---@param wep Weapon The weapon to try to pick up.
---@return boolean # Whether the NPC succeeded in picking up the weapon or not.
function NPC:PickupWeapon(wep) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the NPC to play a sentence from scripts/sentences.txt
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:PlaySentence)
---@param sentence string The sentence string to speak.
---@param delay number Delay in seconds until the sentence starts playing.
---@param volume number The volume of the sentence, from 0 to 1.
---@return number # Returns the sentence index, -1 if the sentence couldn't be played.
function NPC:PlaySentence(sentence, delay, volume) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes the NPC remember an entity or an enemy as unreachable, for a specified amount of time. Use [NPC:IsUnreachable](https://wiki.facepunch.com/gmod/NPC:IsUnreachable) to check if an entity is still unreachable.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:RememberUnreachable)
---@param ent Entity The entity to mark as unreachable.
---@param time? number For how long to remember the entity as unreachable. Negative values will act as `3` seconds.
function NPC:RememberUnreachable(ent, time) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes conditions to ignore for the this NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:RemoveIgnoreConditions)
---@param conditions? table Ignore conditions to remove, see Enums/COND. If omitted, removes all ignore conditions.
function NPC:RemoveIgnoreConditions(conditions) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Resets the ideal activity of the NPC. See also [NPC:SetIdealActivity](https://wiki.facepunch.com/gmod/NPC:SetIdealActivity).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ResetIdealActivity)
---@param act number The new activity. See Enums/ACT.
function NPC:ResetIdealActivity(act) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Resets all the movement calculations.
---
--- Related functions are [NPC:MoveStart](https://wiki.facepunch.com/gmod/NPC:MoveStart), [NPC:MovePause](https://wiki.facepunch.com/gmod/NPC:MovePause) and [NPC:MoveStop](https://wiki.facepunch.com/gmod/NPC:MoveStop).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:ResetMoveCalc)
function NPC:ResetMoveCalc() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts an engine task.
---
--- Used internally by the [ai_task](https://wiki.facepunch.com/gmod/ai_task).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:RunEngineTask)
---@param taskID number The task ID, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param taskData number The task data.
function NPC:RunEngineTask(taskID, taskData) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the NPC to switch to a specific weapon the NPC owns. See [NPC:GetWeapons](https://wiki.facepunch.com/gmod/NPC:GetWeapons).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SelectWeapon)
---@param class string A classname of the weapon or a Weapon entity to switch to.
function NPC:SelectWeapon(class) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Stops any sounds (speech) the NPC is currently palying.
---
--- Equivalent to `Entity:EmitSound( "AI_BaseNPC.SentenceStop" )`
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SentenceStop)
function NPC:SentenceStop() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the NPC's current activity.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetActivity)
---@param act number The new activity to set, see Enums/ACT.
function NPC:SetActivity(act) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1)
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetArrivalActivity)
---@param act number See Enums/ACT.
function NPC:SetArrivalActivity(act) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the direction from the NPC origin to its current navigational destination.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetArrivalDirection)
---@param dir Vector The new arrival direction.
function NPC:SetArrivalDirection(dir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the distance to goal at which the NPC should stop moving and continue to other business such as doing the rest of their tasks in a schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetArrivalDistance)
---@param dist number The distance to goal that is close enough for the NPC
function NPC:SetArrivalDistance(dist) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the sequence to be played when the NPC arrives at its goal.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetArrivalSequence)
---@param seq number See Entity:LookupSequence.
function NPC:SetArrivalSequence(seq) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the arrival speed? of the NPC
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetArrivalSpeed)
---@param speed number The new arrival speed
function NPC:SetArrivalSpeed(speed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets an NPC condition.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetCondition)
---@param condition number The condition index, see Enums/COND.
function NPC:SetCondition(condition) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the weapon proficiency of an NPC (how skilled an NPC is with its current weapon).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetCurrentWeaponProficiency)
---@param proficiency number The proficiency for the NPC's current weapon. See Enums/WEAPON_PROFICIENCY.
function NPC:SetCurrentWeaponProficiency(proficiency) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the target for an NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetEnemy)
---@param enemy Entity The enemy that the NPC should target
---@param newenemy? boolean Calls NPC:SetCondition(COND.NEW_ENEMY) if the new enemy is valid and not equal to the last enemy.
function NPC:SetEnemy(enemy, newenemy) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the NPC's .vcd expression. Similar to [Entity:PlayScene](https://wiki.facepunch.com/gmod/Entity:PlayScene) except the scene is looped until it's interrupted by default NPC behavior or [NPC:ClearExpression](https://wiki.facepunch.com/gmod/NPC:ClearExpression).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetExpression)
---@param expression string The expression filepath.
---@return number #
function NPC:SetExpression(expression) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the Field Of View of the NPC, for use with such functions as [NPC:IsInViewCone](https://wiki.facepunch.com/gmod/NPC:IsInViewCone). it is also used internally by the NPC for enemy detection, etc.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetFOV)
---@param fov number The new FOV for the NPC in degrees.
function NPC:SetFOV(fov) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Updates the NPC's hull and physics hull in order to match its model scale. [Entity:SetModelScale](https://wiki.facepunch.com/gmod/Entity:SetModelScale) seems to take care of this regardless.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetHullSizeNormal)
function NPC:SetHullSizeNormal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the hull type for the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetHullType)
---@param hullType number Hull type. See Enums/HULL
function NPC:SetHullType(hullType) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the ideal activity the NPC currently wants to achieve. This is most useful for custom SNPCs.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetIdealActivity)
---@param number number The ideal activity to set. Enums/ACT.
function NPC:SetIdealActivity(number) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the ideal sequence the NPC currently wants to achieve. This is most useful for custom SNPCs.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetIdealSequence)
---@param sequenceId number The ideal sequence to set. Entity:LookupSequence.
function NPC:SetIdealSequence(sequenceId) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the ideal yaw angle (left-right rotation) for the NPC. Does not actually force the NPC to start turning in that direction. See [NPC:UpdateYaw](https://wiki.facepunch.com/gmod/NPC:UpdateYaw), [NPC:GetIdealYaw](https://wiki.facepunch.com/gmod/NPC:GetIdealYaw) and [NPC:SetIdealYawAndUpdate](https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetIdealYaw)
---@param angle number The aim direction to set, the `yaw` component.
function NPC:SetIdealYaw(angle) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the ideal yaw angle (left-right rotation) for the NPC and forces them to turn to that angle.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate)
---@param angle number The aim direction to set, the `yaw` component.
---@param speed? number The turn speed. Special values are:
--- * `-1` - Calculate automatically
--- * `-2` - Keep the previous yaw speed
function NPC:SetIdealYawAndUpdate(angle, speed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets conditions to ignore, which would normally interrupt an Engine-based schedule. Specified conditions will still be set, will call [ENTITY:OnCondition](https://wiki.facepunch.com/gmod/ENTITY:OnCondition) and can be returned by [NPC:HasCondition](https://wiki.facepunch.com/gmod/NPC:HasCondition), but they will no longer interrupt the Engine schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetIgnoreConditions)
---@param conditions table Conditions to ignore, see Enums/COND. The table must be sequential, numerical and values must correspond to condition enums.
---@param size number Number of conditions to include in the ignored conditions table. Set this to the size of ignored conditions table to ignore all specified conditions.
function NPC:SetIgnoreConditions(conditions, size) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the last registered or memorized position for this NPC. When using scheduling, the NPC will focus on navigating to the last position via nodes.
---
--- **NOTE**: The navigation requires ground nodes to function properly, otherwise the NPC could only navigate in a small area. (https://developer.valvesoftware.com/wiki/Info_node)
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetLastPosition)
---@param position Vector Where the NPC's last position will be set.
function NPC:SetLastPosition(position) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets NPC's max view distance. An NPC will not be able to see enemies outside of this distance.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMaxLookDistance)
---@param dist number New maximum distance the NPC can see at. Default is 2048 and 6000 for long range NPCs such as the sniper.
function NPC:SetMaxLookDistance(dist) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets how long to try rebuilding path before failing task.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMaxRouteRebuildTime)
---@param time number How long to try rebuilding path before failing task
function NPC:SetMaxRouteRebuildTime(time) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the movement delay for given NPC.
---
--- See [NPC:GetMoveDelay](https://wiki.facepunch.com/gmod/NPC:GetMoveDelay).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMoveDelay)
---@param delay number The amount of time in seconds to delay movement by.
function NPC:SetMoveDelay(delay) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the timestep the internal NPC motor is working on.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMoveInterval)
---@param time number The new timestep.
function NPC:SetMoveInterval(time) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the activity the NPC uses when it moves.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMovementActivity)
---@param activity number The movement activity, see Enums/ACT.
function NPC:SetMovementActivity(activity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the sequence the NPC navigation path uses for speed calculation. Doesn't seem to have any visible effect on NPC movement.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMovementSequence)
---@param sequenceId number The movement sequence index
function NPC:SetMovementSequence(sequenceId) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the move velocity of the NPC
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMoveVelocity)
---@param vel Vector The new movement velocity.
function NPC:SetMoveVelocity(vel) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether the current movement should locked on the Yaw axis or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetMoveYawLocked)
---@param lock boolean Whether the movement should yaw locked or not.
function NPC:SetMoveYawLocked(lock) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the navigation type of the NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetNavType)
---@param navtype number The new nav type. See Enums/NAV.
function NPC:SetNavType(navtype) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the state the NPC is in to help it decide on a ideal schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetNPCState)
---@param state number New NPC state, see Enums/NPC_STATE
function NPC:SetNPCState(state) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the NPC's current schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetSchedule)
---@param schedule number The NPC schedule, see Enums/SCHED.
function NPC:SetSchedule(schedule) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Assigns the NPC to a new squad. A squad can have up to 16 NPCs. NPCs in a single squad should be friendly to each other.
---
--- See also [ai.GetSquadMembers](https://wiki.facepunch.com/gmod/ai.GetSquadMembers) and [NPC:GetSquad](https://wiki.facepunch.com/gmod/NPC:GetSquad).
---
--- NPCs within the same squad are meant to function more effectively, tactics wise.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetSquad)
---@param name? string The new squad name to set. Do not provide this argument to reset the squad.
function NPC:SetSquad(name) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the SNPC step height.
---
--- **NOTE**: This only works for [scripted NPCs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetStepHeight)
---@param height number The new step height. Default is 18 Hammer Units.
function NPC:SetStepHeight(height) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the NPC's target. This is used in some engine schedules.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetTarget)
---@param entity Entity The target of the NPC.
function NPC:SetTarget(entity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the status of the current task.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetTaskStatus)
---@param status number The status. See Enums/TASKSTATUS.
function NPC:SetTaskStatus(status) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets given entity as an unforgettable enemy.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetUnforgettable)
---@param enemy Entity The enemy entity to set.
---@param set? boolean The entity to set.
function NPC:SetUnforgettable(enemy, set) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the view offset of the NPC. Player alternative of [Player:SetViewOffset](https://wiki.facepunch.com/gmod/Player:SetViewOffset).
---
--- This affects NPC's [NPC:GetShootPos](https://wiki.facepunch.com/gmod/NPC:GetShootPos).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:SetViewOffset)
---@param Vector Vector The view offset to set.
function NPC:SetViewOffset(Vector) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the NPC to start an engine task, this has different results for every NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:StartEngineTask)
---@param task number The id of the task to start, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param taskData number The task data as a float, not all tasks make use of it.
function NPC:StartEngineTask(task, taskData) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Resets the NPC's movement animation and velocity. Does not actually stop the NPC from moving.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:StopMoving)
---@param immediate? boolean Whether to stop moving even when currently active goal doesn't want us to.
function NPC:StopMoving(immediate) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Cancels [NPC:MoveOrder](https://wiki.facepunch.com/gmod/NPC:MoveOrder) basically.
---
--- Only works on Citizens (npc_citizen) and is a part of the Half-Life 2 squad system.
---
--- The NPC **must** be in the player's squad for this to work.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:TargetOrder)
---@param target Entity Must be a player, does nothing otherwise.
function NPC:TargetOrder(target) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Marks the current NPC task as completed.
---
--- This is meant to be used alongside [NPC:TaskFail](https://wiki.facepunch.com/gmod/NPC:TaskFail) to complete or fail custom Lua defined tasks. ([Schedule:AddTask](https://wiki.facepunch.com/gmod/Schedule:AddTask))
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:TaskComplete)
function NPC:TaskComplete() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Marks the current NPC task as failed.
---
--- This is meant to be used alongside [NPC:TaskComplete](https://wiki.facepunch.com/gmod/NPC:TaskComplete) to complete or fail custom Lua defined tasks. ([Schedule:AddTask](https://wiki.facepunch.com/gmod/Schedule:AddTask))
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:TaskFail)
---@param task string A string most likely defined as a Source Task, for more information on Tasks go to https://developer.valvesoftware.com/wiki/Task
function NPC:TaskFail(task) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Force the NPC to update information on the supplied enemy, as if it had line of sight to it.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UpdateEnemyMemory)
---@param enemy Entity The enemy to update.
---@param pos Vector The last known position of the enemy.
function NPC:UpdateEnemyMemory(enemy, pos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Updates the turn activity. Basically applies the turn animations depending on the current turn yaw.
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UpdateTurnActivity)
function NPC:UpdateTurnActivity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Forces the NPC to turn to their ideal yaw angle. See [NPC:SetIdealYaw](https://wiki.facepunch.com/gmod/NPC:SetIdealYaw) and [NPC:SetIdealYawAndUpdate](https://wiki.facepunch.com/gmod/NPC:SetIdealYawAndUpdate).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UpdateYaw)
---@param speed? number The turn speed. Special values are:
--- * `-1` - Calculate automatically
--- * `-2` - Keep the previous yaw speed
function NPC:UpdateYaw(speed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UseActBusyBehavior)
---@return boolean # If we succeeded setting the behavior.
function NPC:UseActBusyBehavior() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UseAssaultBehavior)
---@return boolean # Whether the action succeeded.
function NPC:UseAssaultBehavior() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UseFollowBehavior)
---@return boolean # If we succeeded setting the behavior.
function NPC:UseFollowBehavior() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UseFuncTankBehavior)
---@return boolean # Whether the action succeeded.
function NPC:UseFuncTankBehavior() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UseLeadBehavior)
---@return boolean # Whether the action succeeded.
function NPC:UseLeadBehavior() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Undoes the other `Use*Behavior` functions.
---
--- **NOTE**: This function only works on `ai` type [SENTs](https://wiki.facepunch.com/gmod/Scripted_Entities).
---
---[View wiki](https://wiki.facepunch.com/gmod/NPC:UseNoBehavior)
function NPC:UseNoBehavior() end
