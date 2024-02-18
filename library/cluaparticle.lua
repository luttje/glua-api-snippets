---@meta

--- List of all possible functions available for Lua particles. This is the object returned by the CLuaEmitter:Add function.
---@class CLuaParticle
local CLuaParticle = {}

---[CLIENT] Returns the air resistance of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetAirResistance)
---@return number # The air resistance of the particle
function CLuaParticle:GetAirResistance() end

---[CLIENT] Returns the current orientation of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetAngles)
---@return Angle # The angles of the particle
function CLuaParticle:GetAngles() end

---[CLIENT] Returns the angular velocity of the particle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetAngleVelocity)
---@return Angle # The angular velocity of the particle
function CLuaParticle:GetAngleVelocity() end

---[CLIENT] Returns the 'bounciness' of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetBounce)
---@return number # The 'bounciness' of the particle  2 means it will gain 100% of its previous velocity,   1 means it will not lose velocity,   0.5 means it will lose half of its velocity with each bounce.
function CLuaParticle:GetBounce() end

---[CLIENT] Returns the color of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetColor)
---@return number # Red part of the color
---@return number # Green part of the color
---@return number # Blue part of the color
function CLuaParticle:GetColor() end

---[CLIENT] Returns the amount of time in seconds after which the particle will be destroyed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetDieTime)
---@return number # The amount of time in seconds after which the particle will be destroyed
function CLuaParticle:GetDieTime() end

---[CLIENT] Returns the alpha value that the particle will reach on its death.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetEndAlpha)
---@return number # The alpha value the particle will fade to
function CLuaParticle:GetEndAlpha() end

---[CLIENT] Returns the length that the particle will reach on its death.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetEndLength)
---@return number # The length the particle will reach
function CLuaParticle:GetEndLength() end

---[CLIENT] Returns the size that the particle will reach on its death.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetEndSize)
---@return number # The size the particle will reach
function CLuaParticle:GetEndSize() end

---[CLIENT] Returns the gravity of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetGravity)
---@return Vector # The gravity of the particle.
function CLuaParticle:GetGravity() end

---[CLIENT] Returns the 'life time' of the particle, how long the particle existed since its creation.
---
--- This value will always be between 0 and CLuaParticle:GetDieTime.
---
---
--- It changes automatically as time goes.
---
--- It can be manipulated using CLuaParticle:SetLifeTime.
---
---
--- If the life time of the particle will be more than CLuaParticle:GetDieTime, it will be removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetLifeTime)
---@return number # How long the particle existed, in seconds.
function CLuaParticle:GetLifeTime() end

---[CLIENT] Returns the current material of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetMaterial)
---@return IMaterial # The material.
function CLuaParticle:GetMaterial() end

---[CLIENT] Returns the absolute position of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetPos)
---@return Vector # The absolute position of the particle.
function CLuaParticle:GetPos() end

---[CLIENT] Returns the current rotation of the particle in radians, this should only be used for 2D particles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetRoll)
---@return number # The current rotation of the particle in radians
function CLuaParticle:GetRoll() end

---[CLIENT] Returns the current rotation speed of the particle in radians, this should only be used for 2D particles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetRollDelta)
---@return number # The current rotation speed of the particle in radians
function CLuaParticle:GetRollDelta() end

---[CLIENT] Returns the alpha value which the particle has when it's created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetStartAlpha)
---@return number # The alpha value which the particle has when it's created.
function CLuaParticle:GetStartAlpha() end

---[CLIENT] Returns the length which the particle has when it's created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetStartLength)
---@return number # The length which the particle has when it's created.
function CLuaParticle:GetStartLength() end

---[CLIENT] Returns the size which the particle has when it's created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetStartSize)
---@return number # The size which the particle has when it's created.
function CLuaParticle:GetStartSize() end

---[CLIENT] Returns the current velocity of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:GetVelocity)
---@return Vector # The current velocity of the particle.
function CLuaParticle:GetVelocity() end

---[CLIENT] Sets the air resistance of the the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetAirResistance)
---@param airResistance number New air resistance.
function CLuaParticle:SetAirResistance(airResistance) end

---[CLIENT] Sets the angles of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetAngles)
---@param ang Angle New angle.
function CLuaParticle:SetAngles(ang) end

---[CLIENT] Sets the angular velocity of the the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetAngleVelocity)
---@param angVel Angle New angular velocity.
function CLuaParticle:SetAngleVelocity(angVel) end

---[CLIENT] Sets the 'bounciness' of the the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetBounce)
---@param bounce number New 'bounciness' of the particle
---
--- 2 means it will gain 100% of its previous velocity,
---
---
--- 1 means it will not lose velocity,
---
---
--- 0.5 means it will lose half of its velocity with each bounce.
function CLuaParticle:SetBounce(bounce) end

---[CLIENT] Sets the whether the particle should collide with the world or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetCollide)
---@param shouldCollide boolean Whether the particle should collide with the world or not
function CLuaParticle:SetCollide(shouldCollide) end

---[CLIENT] Sets the function that gets called whenever the particle collides with the world.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetCollideCallback)
---@param collideFunc function Collide callback, the arguments are:
---
---
---
---
--- CLuaParticle particle - The particle itself
---
--- Vector hitPos - Position of the collision
---
--- Vector hitNormal - Direction of the collision, perpendicular to the hit surface
function CLuaParticle:SetCollideCallback(collideFunc) end

---[CLIENT] Sets the color of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetColor)
---@param r number The red component.
---@param g number The green component.
---@param b number The blue component.
function CLuaParticle:SetColor(r, g, b) end

---[CLIENT] Sets the time where the particle will be removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetDieTime)
---@param dieTime number The new die time.
function CLuaParticle:SetDieTime(dieTime) end

---[CLIENT] Sets the alpha value of the particle that it will reach when it dies.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetEndAlpha)
---@param endAlpha number The new alpha value of the particle that it will reach when it dies.
function CLuaParticle:SetEndAlpha(endAlpha) end

---[CLIENT] Sets the length of the particle that it will reach when it dies.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetEndLength)
---@param endLength number The new length of the particle that it will reach when it dies.
function CLuaParticle:SetEndLength(endLength) end

---[CLIENT] Sets the size of the particle that it will reach when it dies.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetEndSize)
---@param endSize number The new size of the particle that it will reach when it dies.
function CLuaParticle:SetEndSize(endSize) end

---[CLIENT] Sets the directional gravity aka. acceleration of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetGravity)
---@param gravity Vector The directional gravity.
function CLuaParticle:SetGravity(gravity) end

---[CLIENT] Sets the 'life time' of the particle, how long the particle existed since its creation.
---
--- This value should always be between 0 and CLuaParticle:GetDieTime.
---
---
--- It changes automatically as time goes.
---
---
--- If the life time of the particle will be more than CLuaParticle:GetDieTime, it will be removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetLifeTime)
---@param lifeTime number The new life time of the particle.
function CLuaParticle:SetLifeTime(lifeTime) end

---[CLIENT] Sets whether the particle should be affected by lighting.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetLighting)
---@param useLighting boolean Whether the particle should be affected by lighting.
function CLuaParticle:SetLighting(useLighting) end

---[CLIENT] Sets the material of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetMaterial)
---@param mat IMaterial The new material to set. Can also be a string.
function CLuaParticle:SetMaterial(mat) end

---[CLIENT] Sets when the particles think function should be called next, this uses the synchronized server time returned by Global.CurTime.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetNextThink)
---@param nextThink number Next think time.
function CLuaParticle:SetNextThink(nextThink) end

---[CLIENT] Sets the absolute position of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetPos)
---@param pos Vector The new particle position.
function CLuaParticle:SetPos(pos) end

---[CLIENT] Sets the roll of the particle in radians. This should only be used for 2D particles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetRoll)
---@param roll number The new rotation of the particle in radians.
function CLuaParticle:SetRoll(roll) end

---[CLIENT] Sets the rotation speed of the particle in radians. This should only be used for 2D particles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetRollDelta)
---@param rollDelta number The new rotation speed of the particle in radians.
function CLuaParticle:SetRollDelta(rollDelta) end

---[CLIENT] Sets the initial alpha value of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetStartAlpha)
---@param startAlpha number Initial alpha.
function CLuaParticle:SetStartAlpha(startAlpha) end

---[CLIENT] Sets the initial length value of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetStartLength)
---@param startLength number Initial length.
function CLuaParticle:SetStartLength(startLength) end

---[CLIENT] Sets the initial size value of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetStartSize)
---@param startSize number Initial size.
function CLuaParticle:SetStartSize(startSize) end

---[CLIENT] Sets the think function of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetThinkFunction)
---@param thinkFunc function Think function. It has only one argument:
---
---
--- CLuaParticle particle - The particle the think hook is set on
function CLuaParticle:SetThinkFunction(thinkFunc) end

---[CLIENT] Sets the velocity of the particle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetVelocity)
---@param vel Vector The new velocity of the particle.
function CLuaParticle:SetVelocity(vel) end

---[CLIENT] Scales the velocity based on the particle speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaParticle:SetVelocityScale)
---@param doScale? boolean Use velocity scaling.
function CLuaParticle:SetVelocityScale(doScale) end
