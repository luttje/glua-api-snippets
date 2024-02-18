---@meta

--- List of all possible functions available for LuaEmitters. This is the object returned by the Global.ParticleEmitter function.
---@class CLuaEmitter
local CLuaEmitter = {}

---[CLIENT] Creates a new CLuaParticle with the given material and position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:Add)
---@param material string The particles material. Can also be an IMaterial.
---@param position Vector The position to spawn the particle on.
---@return CLuaParticle # The created particle, if any.
function CLuaEmitter:Add(material, position) end

---[CLIENT] Manually renders all particles the emitter has created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:Draw)
function CLuaEmitter:Draw() end

---[CLIENT] Removes the emitter, making it no longer usable from Lua. If particles remain, the emitter will be removed when all particles die.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:Finish)
function CLuaEmitter:Finish() end

---[CLIENT] Returns the amount of active particles of this emitter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:GetNumActiveParticles)
---@return number # The amount of active particles of this emitter
function CLuaEmitter:GetNumActiveParticles() end

---[CLIENT] Returns the position of this emitter. This is set when creating the emitter with Global.ParticleEmitter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:GetPos)
---@return Vector # Position of this particle emitter.
function CLuaEmitter:GetPos() end

---[CLIENT] Returns whether this emitter is 3D or not. This is set when creating the emitter with Global.ParticleEmitter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:Is3D)
---@return boolean # Whether this emitter is 3D or not.
function CLuaEmitter:Is3D() end

---[CLIENT] Returns whether this CLuaEmitter is valid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:IsValid)
---@return boolean # Whether this CLuaEmitter is valid or not.
function CLuaEmitter:IsValid() end

---[CLIENT] Sets the bounding box for this emitter.
---
--- Usually the bounding box is automatically determined by the particles, but this function overrides it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:SetBBox)
---@param mins Vector The minimum position of the box
---@param maxs Vector The maximum position of the box
function CLuaEmitter:SetBBox(mins, maxs) end

---[CLIENT] This function sets the the distance between the render camera and the emitter at which the particles should start fading and at which distance fade ends ( alpha becomes 0 ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:SetNearClip)
---@param distanceMin number Min distance where the alpha becomes 0.
---@param distanceMax number Max distance where the alpha starts fading.
function CLuaEmitter:SetNearClip(distanceMin, distanceMax) end

---[CLIENT] Prevents all particles of the emitter from automatically drawing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:SetNoDraw)
---@param noDraw boolean Whether we should draw the particles ( false ) or not ( true )
function CLuaEmitter:SetNoDraw(noDraw) end

---[CLIENT] The function name has not much in common with its actual function, it applies a radius to every particles that affects the building of the bounding box, as it, usually is constructed by the particle that has the lowest x, y and z and the highest x, y and z, this function just adds/subtracts the radius and inflates the bounding box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:SetParticleCullRadius)
---@param radius number Particle radius.
function CLuaEmitter:SetParticleCullRadius(radius) end

---[CLIENT] Sets the position of the particle emitter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaEmitter:SetPos)
---@param position Vector New position.
function CLuaEmitter:SetPos(position) end
