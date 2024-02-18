---@meta

--- A class used to store and modify all the data concerning a damage event.
--- An empty CTakeDamageInfo object can be created with Global.DamageInfo
---
--- List of hooks that this object is passed to:
--- * ENTITY:OnTakeDamage
--- * GM:DoPlayerDeath
--- * GM:EntityTakeDamage
--- * GM:PostEntityTakeDamage
--- * GM:OnDamagedByExplosion
--- * GM:ScaleNPCDamage
--- * GM:ScalePlayerDamage
--- * NEXTBOT:OnInjured
--- * NEXTBOT:OnKilled
--- * NEXTBOT:OnOtherKilled
---
--- List of functions that use this object:
--- * util.BlastDamageInfo
--- * Entity:TakeDamageInfo
--- * Entity:TakePhysicsDamage
--- * Entity:DispatchTraceAttack
---@class CTakeDamageInfo
local CTakeDamageInfo = {}

---[SHARED] Increases the damage by damageIncrease.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:AddDamage)
---@param damageIncrease number The damage to add.
function CTakeDamageInfo:AddDamage(damageIncrease) end

---[SHARED] Returns the ammo type used by the weapon that inflicted the damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetAmmoType)
---@return number # Ammo type ID
function CTakeDamageInfo:GetAmmoType() end

---[SHARED] Returns the attacker ( character who originated the attack ), for example a player or an NPC that shot the weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetAttacker)
---@return Entity # The attacker
function CTakeDamageInfo:GetAttacker() end

---[SHARED] Returns the initial unmodified by skill level ( game.GetSkillLevel ) damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetBaseDamage)
---@return number # baseDamage
function CTakeDamageInfo:GetBaseDamage() end

---[SHARED] Returns the total damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamage)
---@return number # damage
function CTakeDamageInfo:GetDamage() end

---[SHARED] Gets the current bonus damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageBonus)
---@return number # Bonus damage
function CTakeDamageInfo:GetDamageBonus() end

---[SHARED] Gets the custom damage type. This is used by Day of Defeat: Source and Team Fortress 2 for extended damage info, but isn't used in Garry's Mod by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageCustom)
---@return number # The custom damage type
function CTakeDamageInfo:GetDamageCustom() end

---[SHARED] Returns a vector representing the damage force.
---
--- Can be set with CTakeDamageInfo:SetDamageForce.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageForce)
---@return Vector # The damage force
function CTakeDamageInfo:GetDamageForce() end

---[SHARED] Returns the position where the damage was or is going to be applied to.
---
--- Can be set using CTakeDamageInfo:SetDamagePosition.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamagePosition)
---@return Vector # The damage position
function CTakeDamageInfo:GetDamagePosition() end

---[SHARED] Returns a bitflag which indicates the damage type(s) of the damage.
---
--- Consider using CTakeDamageInfo:IsDamageType instead. Value returned by this function can contain multiple damage types.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetDamageType)
---@return number # Damage type(s), a combination of Enums/DMG
function CTakeDamageInfo:GetDamageType() end

---[SHARED] Returns the inflictor of the damage. This is not necessarily a weapon.
---
--- For hitscan weapons this is the weapon.
---
---
--- For projectile weapons this is the projectile.
---
---
---
---
---
--- For a more reliable method of getting the weapon that damaged an entity, use CTakeDamageInfo:GetAttacker with Player:GetActiveWeapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetInflictor)
---@return Entity # The inflictor
function CTakeDamageInfo:GetInflictor() end

---[SHARED] Returns the maximum damage. See CTakeDamageInfo:SetMaxDamage
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetMaxDamage)
---@return number # maxDmg
function CTakeDamageInfo:GetMaxDamage() end

---[SHARED] Returns the initial, unmodified position where the damage occured.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:GetReportedPosition)
---@return Vector # position
function CTakeDamageInfo:GetReportedPosition() end

---[SHARED] Returns true if the damage was caused by a bullet.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsBulletDamage)
---@return boolean # isBulletDmg
function CTakeDamageInfo:IsBulletDamage() end

---[SHARED] Returns whenever the damageinfo contains the damage type specified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsDamageType)
---@param dmgType number Damage type to test. See Enums/DMG.
---@return boolean # Whether this damage contains specified damage type or not
function CTakeDamageInfo:IsDamageType(dmgType) end

---[SHARED] Returns whenever the damageinfo contains explosion damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsExplosionDamage)
---@return boolean # isExplDamage
function CTakeDamageInfo:IsExplosionDamage() end

---[SHARED] Returns whenever the damageinfo contains fall damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:IsFallDamage)
---@return boolean # isFallDmg
function CTakeDamageInfo:IsFallDamage() end

---[SHARED] Scales the damage by the given value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:ScaleDamage)
---@param scale number Value to scale the damage with.
function CTakeDamageInfo:ScaleDamage(scale) end

---[SHARED] Changes the ammo type used by the weapon that inflicted the damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetAmmoType)
---@param ammoType number Ammo type ID
function CTakeDamageInfo:SetAmmoType(ammoType) end

---[SHARED] Sets the attacker ( character who originated the attack ) of the damage, for example a player or an NPC.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetAttacker)
---@param ent Entity The entity to be set as the attacker.
function CTakeDamageInfo:SetAttacker(ent) end

---[SHARED] Sets the initial unmodified by skill level ( game.GetSkillLevel ) damage. This function will not update or touch CTakeDamageInfo:GetDamage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetBaseDamage)
---@param number number baseDamage
function CTakeDamageInfo:SetBaseDamage(number) end

---[SHARED] Sets the amount of damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamage)
---@param damage number The value to set the absolute damage to.
function CTakeDamageInfo:SetDamage(damage) end

---[SHARED] Sets the bonus damage. Bonus damage isn't automatically applied, so this will have no outer effect by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageBonus)
---@param damage number The extra damage to be added.
function CTakeDamageInfo:SetDamageBonus(damage) end

---[SHARED] Sets the custom damage type. This is used by Day of Defeat: Source and Team Fortress 2 for extended damage info, but isn't used in Garry's Mod by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageCustom)
---@param DamageType number Any integer - can be based on your own custom enums.
function CTakeDamageInfo:SetDamageCustom(DamageType) end

---[SHARED] Sets the directional force of the damage.
---
--- 	This function seems to have no effect on player knockback. To disable knockback entirely, see [EFL_NO_DAMAGE_FORCES](https://wiki.facepunch.com/gmod/Enums/EFL#EFL_NO_DAMAGE_FORCES) or use workaround example below.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageForce)
---@param force Vector The vector to set the force to.
function CTakeDamageInfo:SetDamageForce(force) end

---[SHARED] Sets the position of where the damage gets applied to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamagePosition)
---@param pos Vector The position where the damage will be applied.
function CTakeDamageInfo:SetDamagePosition(pos) end

---[SHARED] Sets the damage type.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetDamageType)
---@param type number The damage type, see Enums/DMG.
function CTakeDamageInfo:SetDamageType(type) end

---[SHARED] Sets the inflictor of the damage for example a weapon.
---
--- For hitscan/bullet weapons this should the weapon.
---
---
--- For projectile ( rockets, etc ) weapons this should be the projectile.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetInflictor)
---@param inflictor Entity The new inflictor.
function CTakeDamageInfo:SetInflictor(inflictor) end

---[SHARED] Sets the maximum damage this damage event can cause.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetMaxDamage)
---@param maxDamage number Maximum damage value.
function CTakeDamageInfo:SetMaxDamage(maxDamage) end

---[SHARED] Sets the origin of the damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SetReportedPosition)
---@param pos Vector The location of where the damage is originating
function CTakeDamageInfo:SetReportedPosition(pos) end

---[SHARED] Subtracts the specified amount from the damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CTakeDamageInfo:SubtractDamage)
---@param damage number Value to subtract.
function CTakeDamageInfo:SubtractDamage(damage) end
