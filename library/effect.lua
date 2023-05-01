---@meta

---@class EFFECT
local EFFECT = {}

---[CLIENT]
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
---@return Vector The "real" start position.
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

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:StartTouch)
function EFFECT:StartTouch() end

---[CLIENT] Called when the effect should think, return false to kill the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:Think)
---@return boolean Return false to remove this effect.
function EFFECT:Think() end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/EFFECT:Touch)
function EFFECT:Touch() end
