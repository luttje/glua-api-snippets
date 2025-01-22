---@meta

--- This object represents a .pcf ( Orange Box ) particle system. Created by [Entity:CreateParticleEffect](https://wiki.facepunch.com/gmod/Entity:CreateParticleEffect) and [Global.CreateParticleSystem](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect)
---@class CNewParticleEffect
local CNewParticleEffect = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a control point to the particle system.
---
--- **NOTE**: This function will not work if the [CNewParticleEffect:GetOwner](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetOwner) entity is not valid
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:AddControlPoint)
---@param cpID number The control point ID, 0 to 63.
---@param ent Entity The entity to attach the control point to.
---@param partAttachment number See Enums/PATTACH.
---@param entAttachment? string The attachment name on the entity to attach the particle system to
---@param offset? Vector The offset from the Entity:GetPos of the entity we are attaching this CP to.
function CNewParticleEffect:AddControlPoint(cpID, ent, partAttachment, entAttachment, offset) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808)
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetAutoUpdateBBox)
---@return boolean #
function CNewParticleEffect:GetAutoUpdateBBox() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the name of the particle effect this system is set to emit.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetEffectName)
---@return string # The name of the particle effect.
function CNewParticleEffect:GetEffectName() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the highest control point number for given particle system.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetHighestControlPoint)
---@return boolean # The highest control point number for given particle system, 0 to 63.
function CNewParticleEffect:GetHighestControlPoint() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the owner of the particle system, the entity the particle system is attached to.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetOwner)
---@return Entity # The owner of the particle system.
function CNewParticleEffect:GetOwner() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the bounding box of the particle effect, including all the particles it emitted.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetRenderBounds)
---@return Vector # Mins of the bounding box.
---@return Vector # Maxs of the bounding box.
function CNewParticleEffect:GetRenderBounds() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether the particle system has finished emitting particles or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:IsFinished)
---@return boolean # Whether the particle system has finished emitting particles or not.
function CNewParticleEffect:IsFinished() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether the particle system is valid or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:IsValid)
---@return boolean # Whether the particle system is valid or not.
function CNewParticleEffect:IsValid() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether the particle system is intended to be used on a view model?
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:IsViewModelEffect)
---@return boolean #
function CNewParticleEffect:IsViewModelEffect() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Forces the particle system to render using current rendering context.
---
--- Can be used to render the particle system in vgui panels, etc.
---
--- Used in conjunction with [CNewParticleEffect:SetShouldDraw](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetShouldDraw).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:Render)
function CNewParticleEffect:Render() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Forces the particle system to restart emitting particles.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:Restart)
function CNewParticleEffect:Restart() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets a value for given control point.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPoint)
---@param cpID number The control point ID, 0 to 63.
---@param value Vector The value to set for given control point.
function CNewParticleEffect:SetControlPoint(cpID, value) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets an entity to given control point for particle to use.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointEntity)
---@param cpID number The control point ID, 0 to 63.
---@param parent Entity The entity to set.
function CNewParticleEffect:SetControlPointEntity(cpID, parent) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the forward direction for given control point.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointForwardVector)
---@param cpID number The control point ID, 0 to 63.
---@param forward Vector The forward direction for given control point
function CNewParticleEffect:SetControlPointForwardVector(cpID, forward) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the orientation for given control point.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointOrientation)
---@param cpID number The control point ID, 0 to 63.
---@param forward Vector The forward direction for given control point.
---
--- This can also be an Angle, in which case the other 2 arguments are not used.
---@param right Vector The right direction for given control point
---@param up Vector The up direction for given control point
function CNewParticleEffect:SetControlPointOrientation(cpID, forward, right, up) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Essentially makes child control point follow the parent control point.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointParent)
---@param childID number The child control point ID, 0 to 63.
---@param parentID number The parent control point ID, 0 to 63.
function CNewParticleEffect:SetControlPointParent(childID, parentID) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the right direction for given control point.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointRightVector)
---@param cpID number The control point ID, 0 to 63.
---@param right Vector The right direction for given control point.
function CNewParticleEffect:SetControlPointRightVector(cpID, right) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the upward direction for given control point.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetControlPointUpVector)
---@param cpID number The control point ID, 0 to 63.
---@param upward Vector The upward direction for given control point
function CNewParticleEffect:SetControlPointUpVector(cpID, upward) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Set whether this particle effect is a view model effect or not. This will have an effect on attachment positioning and other things.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetIsViewModelEffect)
---@param isViewModel boolean Whether this particle effect is a view model effect or not.
function CNewParticleEffect:SetIsViewModelEffect(isViewModel) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Forces the particle system to stop automatically rendering.
---
--- Used in conjunction with [CNewParticleEffect:Render](https://wiki.facepunch.com/gmod/CNewParticleEffect:Render).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetShouldDraw)
---@param should boolean Whether to automatically draw the particle effect or not.
function CNewParticleEffect:SetShouldDraw(should) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the sort origin for given particle system. This is used as a helper to determine which particles are in front of which.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:SetSortOrigin)
---@param origin Vector The new sort origin.
function CNewParticleEffect:SetSortOrigin(origin) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Starts the particle emission.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:StartEmission)
---@param infiniteOnly? boolean
function CNewParticleEffect:StartEmission(infiniteOnly) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Stops the particle emission.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:StopEmission)
---@param infiniteOnly? boolean
---@param removeAllParticles? boolean
---@param wakeOnStop? boolean
function CNewParticleEffect:StopEmission(infiniteOnly, removeAllParticles, wakeOnStop) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Stops particle emission and destroys all particles instantly. Also detaches the particle effect from the entity it was attached to.
---
--- **NOTE**: This function will work identically to [CNewParticleEffect:StopEmission](https://wiki.facepunch.com/gmod/CNewParticleEffect:StopEmission)( false, true ) if  [CNewParticleEffect:GetOwner](https://wiki.facepunch.com/gmod/CNewParticleEffect:GetOwner) entity is not valid.
---
--- Consider using [CNewParticleEffect:StopEmission](https://wiki.facepunch.com/gmod/CNewParticleEffect:StopEmission)( false, true ) instead, which has same effect, but doesn't require owner entity, and does't detach the particle system from its entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNewParticleEffect:StopEmissionAndDestroyImmediately)
function CNewParticleEffect:StopEmissionAndDestroyImmediately() end
