---@meta

--- This object represents a .pcf ( Orange Box ) particle system. Created by Entity:CreateParticleEffect and Global.CreateParticleSystem.
---@class CNewParticleEffect
local CNewParticleEffect = {}

---[CLIENT] Adds a control point to the particle system.
---
--- This function will not work if the CNewParticleEffect:GetOwner entity is not valid
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:AddControlPoint)
---@param cpID number The control point ID, 0 to 63.
---@param ent Entity The entity to attach the control point to.
---@param partAttachment number See Enums/PATTACH.
---@param entAttachment? number The attachment ID on the entity to attach the particle system to
---@param offset? Vector The offset from the Entity:GetPos of the entity we are attaching this CP to.
function CNewParticleEffect:AddControlPoint(cpID, ent, partAttachment, entAttachment, offset) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetAutoUpdateBBox)
---@return boolean #
function CNewParticleEffect:GetAutoUpdateBBox() end

---[CLIENT] Returns the name of the particle effect this system is set to emit.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetEffectName)
---@return string # The name of the particle effect.
function CNewParticleEffect:GetEffectName() end

---[CLIENT] Returns the highest control point number for given particle system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetHighestControlPoint)
---@return boolean # The highest control point number for given particle system, 0 to 63.
function CNewParticleEffect:GetHighestControlPoint() end

---[CLIENT] Returns the owner of the particle system, the entity the particle system is attached to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetOwner)
---@return Entity # The owner of the particle system.
function CNewParticleEffect:GetOwner() end

---[CLIENT] Returns whether the particle system has finished emitting particles or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:IsFinished)
---@return boolean # Whether the particle system has finished emitting particles or not.
function CNewParticleEffect:IsFinished() end

---[CLIENT] Returns whether the particle system is valid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:IsValid)
---@return boolean # Whether the particle system is valid or not.
function CNewParticleEffect:IsValid() end

---[CLIENT] Returns whether the particle system is intended to be used on a view model?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:IsViewModelEffect)
---@return boolean #
function CNewParticleEffect:IsViewModelEffect() end

---[CLIENT] Forces the particle system to render using current rendering context.
---
--- Can be used to render the particle system in vgui panels, etc.
---
--- Used in conjunction with CNewParticleEffect:SetShouldDraw.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:Render)
function CNewParticleEffect:Render() end

---[CLIENT] Forces the particle system to restart emitting particles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:Restart)
function CNewParticleEffect:Restart() end

---[CLIENT] Sets a value for given control point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPoint)
---@param cpID number The control point ID, 0 to 63.
---@param value Vector The value to set for given control point.
function CNewParticleEffect:SetControlPoint(cpID, value) end

---[CLIENT] Sets an entity to given control point for particle to use.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointEntity)
---@param child number The child control point ID, 0 to 63.
---@param parent Entity The entity to set.
function CNewParticleEffect:SetControlPointEntity(child, parent) end

---[CLIENT] Sets the forward direction for given control point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointForwardVector)
---@param cpID number The control point ID, 0 to 63.
---@param forward Vector The forward direction for given control point
function CNewParticleEffect:SetControlPointForwardVector(cpID, forward) end

---[CLIENT] Sets the orientation for given control point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointOrientation)
---@param cpID number The control point ID, 0 to 63.
---@param forward Vector The forward direction for given control point.
---
--- This can also be an Angle, in which case the other 2 arguments are not used.
---@param right Vector The right direction for given control point
---@param up Vector The up direction for given control point
function CNewParticleEffect:SetControlPointOrientation(cpID, forward, right, up) end

---[CLIENT] Essentially makes child control point follow the parent control point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointParent)
---@param child number The child control point ID, 0 to 63.
---@param parent number The parent control point ID, 0 to 63.
function CNewParticleEffect:SetControlPointParent(child, parent) end

---[CLIENT] Sets the right direction for given control point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointRightVector)
---@param cpID number The control point ID, 0 to 63.
---@param right Vector The right direction for given control point.
function CNewParticleEffect:SetControlPointRightVector(cpID, right) end

---[CLIENT] Sets the upward direction for given control point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointUpVector)
---@param cpID number The control point ID, 0 to 63.
---@param upward Vector The upward direction for given control point
function CNewParticleEffect:SetControlPointUpVector(cpID, upward) end

---[CLIENT] Set whether this particle effect is a view model effect or not. This will have an effect on attachment positioning and other things.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetIsViewModelEffect)
---@param isViewModel boolean Whether this particle effect is a view model effect or not.
function CNewParticleEffect:SetIsViewModelEffect(isViewModel) end

---[CLIENT] Forces the particle system to stop automatically rendering.
---
--- Used in conjunction with CNewParticleEffect:Render.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetShouldDraw)
---@param should boolean Whether to automatically draw the particle effect or not.
function CNewParticleEffect:SetShouldDraw(should) end

---[CLIENT] Sets the sort origin for given particle system. This is used as a helper to determine which particles are in front of which.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetSortOrigin)
---@param origin Vector The new sort origin.
function CNewParticleEffect:SetSortOrigin(origin) end

---[CLIENT] Starts the particle emission.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:StartEmission)
---@param infiniteOnly? boolean
function CNewParticleEffect:StartEmission(infiniteOnly) end

---[CLIENT] Stops the particle emission.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:StopEmission)
---@param infiniteOnly? boolean
---@param removeAllParticles? boolean
---@param wakeOnStop? boolean
function CNewParticleEffect:StopEmission(infiniteOnly, removeAllParticles, wakeOnStop) end

---[CLIENT] Stops particle emission and destroys all particles instantly. Also detaches the particle effect from the entity it was attached to.
---
--- This function will work identically to CNewParticleEffect:StopEmission( false, true ) if  CNewParticleEffect:GetOwner entity is not valid.
---
--- Consider using CNewParticleEffect:StopEmission( false, true ) instead, which has same effect, but doesn't require owner entity, and does't detach the particle system from its entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNewParticleEffect:StopEmissionAndDestroyImmediately)
function CNewParticleEffect:StopEmissionAndDestroyImmediately() end
