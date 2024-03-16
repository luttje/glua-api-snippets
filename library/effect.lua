---@meta

---
--- These hooks are used inside of a Lua effect. Lua effects are stored in either the `/lua/effects` directory or in a gamemode in `/gamemodes//entities/effects`.
---
--- Effects are entities with the classname `class CLuaEffect`, and as such, Entity functions are usable on them (using the `self` argument).
---
--- An `EFFECT` is made using either a combination of the EFFECT:Init, EFFECT:Render and optionally the EFFECT:Think hook. Another way is to create all particles in one go in the `Init` hook and don't use the other hooks at all.
---
--- 	Creates a particle effect using a combination of the Init and the Think hooks.
---
--- function EFFECT:Init( data )
--- 	-- Because CEffectData is a shared object, we can't just store it and use its' properties later
--- 	-- Instead, we store the properties themselves
--- 	self.offset = data:GetOrigin() + Vector( 0, 0, 0.2 )
--- 	self.angles = data:GetAngles()
--- 	self.particles = 4
--- end
---
--- function EFFECT:Think()
--- 	return true
--- end
---
--- function EFFECT:Render()
--- 	local emitter = ParticleEmitter( self.offset, false )
--- 		for i=0, self.particles do
--- 			local particle = emitter:Add( "effects/softglow", self.offset )
--- 			if particle then
--- 				particle:SetAngles( self.angles )
--- 				particle:SetVelocity( Vector( 0, 0, 15 ) )
--- 				particle:SetColor( 255, 102, 0 )
--- 				particle:SetLifeTime( 0 )
--- 				particle:SetDieTime( 0.2 )
--- 				particle:SetStartAlpha( 255 )
--- 				particle:SetEndAlpha( 0 )
--- 				particle:SetStartSize( 1.6 )
--- 				particle:SetStartLength( 1 )
--- 				particle:SetEndSize( 1.2 )
--- 				particle:SetEndLength( 4 )
--- 			end
--- 		end
--- 	emitter:Finish()
--- end
---
---
---
---
---
---
--- 	Creates a particle effect using only the Init hook. To use this effect in a loop one needs to create a new instance of this effect every drawn frame.
---
--- function EFFECT:Init( data )
--- 	local vOffset = data:GetOrigin() + Vector( 0, 0, 0.2 )
--- 	local vAngle = data:GetAngles()
--- 	local emitter = ParticleEmitter( vOffset, false )
--- 		for i=0,4 do
--- 			local particle = emitter:Add( "effects/softglow", vOffset )
--- 			if particle then
--- 				particle:SetAngles( vAngle )
--- 				particle:SetVelocity( Vector( 0, 0, 15 ) )
--- 				particle:SetColor( 255, 102, 0 )
--- 				particle:SetLifeTime( 0 )
--- 				particle:SetDieTime( 0.2 )
--- 				particle:SetStartAlpha( 255 )
--- 				particle:SetEndAlpha( 0 )
--- 				particle:SetStartSize( 1.6 )
--- 				particle:SetStartLength( 1 )
--- 				particle:SetEndSize( 1.2 )
--- 				particle:SetEndLength( 4 )
--- 			end
--- 		end
--- 	emitter:Finish()
--- end
---
--- function EFFECT:Think()
--- 	return false
--- end
---
--- function EFFECT:Render()
--- end
---
---
---
---
---@class EFFECT : Entity
EFFECT = {}

---[CLIENT] Effect alternative to ENTITY:EndTouch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:EndTouch)
function EFFECT:EndTouch() end

---[CLIENT] Used to get the "real" start position of a trace, for weapon tracer effects.
---
--- "real" meaning in 3rd person, the 3rd person position will be used, in first person the first person position will be used.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:GetTracerShootPos)
---@param pos Vector Default position if we fail
---@param ent Weapon The weapon to use.
---@param attachment number Attachment ID of on the weapon "muzzle", to use as the start position.
---
--- Please note that it is expected that the same attachment ID is used on both, the world and the view model.
---@return Vector # The "real" start position.
function EFFECT:GetTracerShootPos(pos, ent, attachment) end

---[CLIENT] Called when the effect is created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:Init)
---@param effectData CEffectData The effect data used to create the effect.
function EFFECT:Init(effectData) end

---[CLIENT] Called when the effect collides with anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:PhysicsCollide)
---@param colData table Information regarding the collision. See Structures/CollisionData
---@param collider PhysObj The physics object of the entity that collided with the effect.
function EFFECT:PhysicsCollide(colData, collider) end

---[CLIENT] Called when the effect should be rendered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:Render)
function EFFECT:Render() end

---[CLIENT] Effect alternative to ENTITY:StartTouch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:StartTouch)
function EFFECT:StartTouch() end

---[CLIENT] Called when the effect should think, return false to kill the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:Think)
---@return boolean # Return false to remove this effect.
function EFFECT:Think() end

---[CLIENT] Effect alternative to ENTITY:Touch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:Touch)
function EFFECT:Touch() end
