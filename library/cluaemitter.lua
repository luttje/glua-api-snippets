---@meta

--- List of all possible functions available for LuaEmitters. This is the object returned by the [Global.ParticleEmitter](https://wiki.facepunch.com/gmod/Global.ParticleEmitter) function.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter)
---@class CLuaEmitter
local CLuaEmitter = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new [CLuaParticle](https://wiki.facepunch.com/gmod/CLuaParticle) with the given material and position.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:Add)
---@param material string The particles material. Can also be an IMaterial.
---@param position Vector The position to spawn the particle on.
---@return CLuaParticle # The created particle, if any.
function CLuaEmitter:Add(material, position) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Manually renders all particles the emitter has created.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:Draw)
function CLuaEmitter:Draw() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Removes the emitter, making it no longer usable from Lua. If particles remain, the emitter will be removed when all particles die.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:Finish)
function CLuaEmitter:Finish() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the amount of active particles of this emitter.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:GetNumActiveParticles)
---@return number # The amount of active particles of this emitter
function CLuaEmitter:GetNumActiveParticles() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the position of this emitter. This is set when creating the emitter with [Global.ParticleEmitter](https://wiki.facepunch.com/gmod/Global.ParticleEmitter).
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:GetPos)
---@return Vector # Position of this particle emitter.
function CLuaEmitter:GetPos() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether this emitter is 3D or not. This is set when creating the emitter with [Global.ParticleEmitter](https://wiki.facepunch.com/gmod/Global.ParticleEmitter).
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:Is3D)
---@return boolean # Whether this emitter is 3D or not.
function CLuaEmitter:Is3D() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether this [CLuaEmitter](https://wiki.facepunch.com/gmod/CLuaEmitter) is valid or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:IsValid)
---@return boolean # Whether this CLuaEmitter is valid or not.
function CLuaEmitter:IsValid() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the bounding box for this emitter.
---
--- Usually the bounding box is automatically determined by the particles, but this function overrides it.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:SetBBox)
---@param mins Vector The minimum position of the box
---@param maxs Vector The maximum position of the box
function CLuaEmitter:SetBBox(mins, maxs) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) This function sets the the distance between the render camera and the emitter at which the particles should start fading and at which distance fade ends ( alpha becomes 0 ).
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:SetNearClip)
---@param distanceMin number Min distance where the alpha becomes 0.
---@param distanceMax number Max distance where the alpha starts fading.
function CLuaEmitter:SetNearClip(distanceMin, distanceMax) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Prevents all particles of the emitter from automatically drawing.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:SetNoDraw)
---@param noDraw boolean Whether we should draw the particles ( false ) or not ( true )
function CLuaEmitter:SetNoDraw(noDraw) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) The function name has not much in common with its actual function, it applies a radius to every particles that affects the building of the bounding box, as it, usually is constructed by the particle that has the lowest x, y and z and the highest x, y and z, this function just adds/subtracts the radius and inflates the bounding box.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:SetParticleCullRadius)
---@param radius number Particle radius.
function CLuaEmitter:SetParticleCullRadius(radius) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the position of the particle emitter.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaEmitter:SetPos)
---@param position Vector New position.
function CLuaEmitter:SetPos(position) end
