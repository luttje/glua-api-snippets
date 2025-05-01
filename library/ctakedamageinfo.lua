---@meta

--- A class used to store and modify all the data concerning a damage event.
--- An empty CTakeDamageInfo object can be created with [Global.DamageInfo](https://wiki.facepunch.com/gmod/Global.DamageInfo)
---
--- List of hooks that this object is passed to:
--- * [ENTITY:OnTakeDamage](https://wiki.facepunch.com/gmod/ENTITY:OnTakeDamage)
--- * [GM:DoPlayerDeath](https://wiki.facepunch.com/gmod/GM:DoPlayerDeath)
--- * [GM:EntityTakeDamage](https://wiki.facepunch.com/gmod/GM:EntityTakeDamage)
--- * [GM:PostEntityTakeDamage](https://wiki.facepunch.com/gmod/GM:PostEntityTakeDamage)
--- * [GM:OnDamagedByExplosion](https://wiki.facepunch.com/gmod/GM:OnDamagedByExplosion)
--- * [GM:ScaleNPCDamage](https://wiki.facepunch.com/gmod/GM:ScaleNPCDamage)
--- * [GM:ScalePlayerDamage](https://wiki.facepunch.com/gmod/GM:ScalePlayerDamage)
--- * [NEXTBOT:OnInjured](https://wiki.facepunch.com/gmod/NEXTBOT:OnInjured)
--- * [NEXTBOT:OnKilled](https://wiki.facepunch.com/gmod/NEXTBOT:OnKilled)
--- * [NEXTBOT:OnOtherKilled](https://wiki.facepunch.com/gmod/NEXTBOT:OnOtherKilled)
---
--- List of functions that use this object:
--- * [util.BlastDamageInfo](https://wiki.facepunch.com/gmod/util.BlastDamageInfo)
--- * [Entity:TakeDamageInfo](https://wiki.facepunch.com/gmod/Entity:TakeDamageInfo)
--- * [Entity:TakePhysicsDamage](https://wiki.facepunch.com/gmod/Entity:TakePhysicsDamage)
--- * [Entity:DispatchTraceAttack](https://wiki.facepunch.com/gmod/Entity:DispatchTraceAttack)
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo)
---@class CTakeDamageInfo
local CTakeDamageInfo = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Increases the damage by damageIncrease.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:AddDamage)
---@param damageIncrease number The damage to add.
function CTakeDamageInfo:AddDamage(damageIncrease) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the ammo type used by the weapon that inflicted the damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetAmmoType)
---@return number # Ammo type ID
function CTakeDamageInfo:GetAmmoType() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the attacker ( character who originated the attack ), for example a player or an NPC that shot the weapon.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetAttacker)
---@return Entity # The attacker
function CTakeDamageInfo:GetAttacker() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the initial unmodified by skill level ( [game.GetSkillLevel](https://wiki.facepunch.com/gmod/game.GetSkillLevel) ) damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetBaseDamage)
---@return number # baseDamage
function CTakeDamageInfo:GetBaseDamage() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the total damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamage)
---@return number # damage
function CTakeDamageInfo:GetDamage() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the current bonus damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageBonus)
---@return number # Bonus damage
function CTakeDamageInfo:GetDamageBonus() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the custom damage type. This is used by Day of Defeat: Source and Team Fortress 2 for extended damage info, but isn't used in Garry's Mod by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageCustom)
---@return number # The custom damage type
function CTakeDamageInfo:GetDamageCustom() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a vector representing the damage force.
---
--- Can be set with [CTakeDamageInfo:SetDamageForce](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageForce).
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageForce)
---@return Vector # The damage force
function CTakeDamageInfo:GetDamageForce() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the position where the damage was or is going to be applied to.
---
--- Can be set using [CTakeDamageInfo:SetDamagePosition](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamagePosition).
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamagePosition)
---@return Vector # The damage position
function CTakeDamageInfo:GetDamagePosition() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a bitflag which indicates the damage type(s) of the damage.
---
--- Consider using [CTakeDamageInfo:IsDamageType](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsDamageType) instead. Value returned by this function can contain multiple damage types.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageType)
---@return DMG # Damage type(s), a combination of Enums/DMG
function CTakeDamageInfo:GetDamageType() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the inflictor of the damage. This is not necessarily a weapon.
---
--- For hitscan weapons this is the weapon.
---
--- For projectile weapons this is the projectile.
---
--- For a more reliable method of getting the weapon that damaged an entity, use [CTakeDamageInfo:GetWeapon](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetWeapon) or [GetAttacker](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetAttacker) with [GetActiveWeapon](https://wiki.facepunch.com/gmod/Player:GetActiveWeapon).
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetInflictor)
---@return Entity # The inflictor entity.
function CTakeDamageInfo:GetInflictor() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the maximum damage. See [CTakeDamageInfo:SetMaxDamage](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetMaxDamage)
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetMaxDamage)
---@return number # maxDmg
function CTakeDamageInfo:GetMaxDamage() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the initial, unmodified position where the damage occured.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetReportedPosition)
---@return Vector # position
function CTakeDamageInfo:GetReportedPosition() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the inflicting weapon of the damage event, if there is any.
---
--- This is not necessarily a [Weapon](https://wiki.facepunch.com/gmod/Weapon) entity, but it is very likely to be one.
---
--- See [CTakeDamageInfo:GetInflictor](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetInflictor) for the actual entity that did the damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetWeapon)
---@return Entity # The damage-inflicting weapon or NULL.
function CTakeDamageInfo:GetWeapon() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the damage was caused by a bullet.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsBulletDamage)
---@return boolean # isBulletDmg
function CTakeDamageInfo:IsBulletDamage() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the damageinfo contains the damage type specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsDamageType)
---@param dmgType DMG Damage type to test. See Enums/DMG.
---@return boolean # Whether this damage contains specified damage type or not
function CTakeDamageInfo:IsDamageType(dmgType) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the damageinfo contains explosion damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsExplosionDamage)
---@return boolean # isExplDamage
function CTakeDamageInfo:IsExplosionDamage() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the damageinfo contains fall damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsFallDamage)
---@return boolean # isFallDmg
function CTakeDamageInfo:IsFallDamage() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Scales the damage by the given value.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:ScaleDamage)
---@param scale number Value to scale the damage with.
function CTakeDamageInfo:ScaleDamage(scale) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Changes the ammo type used by the weapon that inflicted the damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetAmmoType)
---@param ammoType number Ammo type ID
function CTakeDamageInfo:SetAmmoType(ammoType) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the attacker ( character who originated the attack ) of the damage, for example a player or an NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetAttacker)
---@param ent Entity The entity to be set as the attacker.
function CTakeDamageInfo:SetAttacker(ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the initial unmodified by skill level ( [game.GetSkillLevel](https://wiki.facepunch.com/gmod/game.GetSkillLevel) ) damage. This function will not update or touch [CTakeDamageInfo:GetDamage](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamage).
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetBaseDamage)
---@param number number baseDamage
function CTakeDamageInfo:SetBaseDamage(number) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the amount of damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamage)
---@param damage number The value to set the absolute damage to.
function CTakeDamageInfo:SetDamage(damage) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the bonus damage. Bonus damage isn't automatically applied, so this will have no outer effect by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageBonus)
---@param damage number The extra damage to be added.
function CTakeDamageInfo:SetDamageBonus(damage) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the custom damage type. This is used by Day of Defeat: Source and Team Fortress 2 for extended damage info, but isn't used in Garry's Mod by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageCustom)
---@param DamageType number Any integer - can be based on your own custom enums.
function CTakeDamageInfo:SetDamageCustom(DamageType) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the directional force of the damage.
--- **NOTE**: This function only affects entities using the VPHYSICS movetype. This means players and most NPCs won't receive the force vector you provide as knockback.
---
--- If the entity taking damage is using the WALK or STEP movetypes, the damage force is instead automatically calculated. It will push the entity away from the inflictor's [Entity:WorldSpaceCenter](https://wiki.facepunch.com/gmod/Entity:WorldSpaceCenter), scaling the push by a calculated value involving the total amount of damage and the size of the entity. [Source](https://github.com/ValveSoftware/source-sdk-2013/blob/0565403b153dfcde602f6f58d8f4d13483696a13/src/game/server/baseentity.cpp#L1525)
---
--- To disable knockback entirely, see [EFL_NO_DAMAGE_FORCES](https://wiki.facepunch.com/gmod/Enums/EFL#EFL_NO_DAMAGE_FORCES) or use the workaround example below.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageForce)
---@param force Vector The vector to set the force to.
function CTakeDamageInfo:SetDamageForce(force) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the position of where the damage gets applied to.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamagePosition)
---@param pos Vector The position where the damage will be applied.
function CTakeDamageInfo:SetDamagePosition(pos) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the damage type.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageType)
---@param type DMG The damage type, see Enums/DMG.
function CTakeDamageInfo:SetDamageType(type) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the inflictor of the damage for example a weapon.
---
--- For hitscan/bullet weapons this should the weapon.
---
--- For projectile (rocket launchers, grenades, etc) weapons this should be the projectile and [CTakeDamageInfo:SetWeapon](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetWeapon) should be the weapon.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetInflictor)
---@param inflictor Entity The new inflictor.
function CTakeDamageInfo:SetInflictor(inflictor) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the maximum damage this damage event can cause.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetMaxDamage)
---@param maxDamage number Maximum damage value.
function CTakeDamageInfo:SetMaxDamage(maxDamage) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the origin of the damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetReportedPosition)
---@param pos Vector The location of where the damage is originating
function CTakeDamageInfo:SetReportedPosition(pos) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the damage-inflicting weapon of the damage event.
---
--- This should be a [Weapon](https://wiki.facepunch.com/gmod/Weapon) entity, not a projectile. See also [CTakeDamageInfo:SetInflictor](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetInflictor).
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetWeapon)
---@param Entity Entity The damage-inflicting weapon or NULL.
function CTakeDamageInfo:SetWeapon(Entity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Subtracts the specified amount from the damage.
---
---[View wiki](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SubtractDamage)
---@param damage number Value to subtract.
function CTakeDamageInfo:SubtractDamage(damage) end
