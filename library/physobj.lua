---@meta

--- This is the object returned by Entity:GetPhysicsObject, Entity:GetPhysicsObjectNum and Vehicle:GetWheel.
---
--- It represents a physics object.
---
---@class PhysObj
local PhysObj = {}

---[SHARED] Adds the specified [angular velocity](https://en.wikipedia.org/wiki/Angular_velocity) velocity to the current PhysObj.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:AddAngleVelocity)
---@param angularVelocity Vector The additional velocity in `degrees/s`. (Local to the physics object.)
--- 			Does nothing on frozen objects.
---
function PhysObj:AddAngleVelocity(angularVelocity) end

---[SHARED] Adds one or more bit flags.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:AddGameFlag)
---@param flags number Bitflag, see Enums/FVPHYSICS.
function PhysObj:AddGameFlag(flags) end

---[SHARED] Adds the specified velocity to the current.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:AddVelocity)
---@param velocity Vector Additional velocity in `source_unit/s`. (World frame)
--- 			Does nothing on frozen objects.
---
function PhysObj:AddVelocity(velocity) end

---[SHARED] Rotates the object so that it's angles are aligned to the ones inputted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:AlignAngles)
---@param from Angle
---@param to Angle
---@return Angle #
function PhysObj:AlignAngles(from, to) end

---[SHARED] Applies the specified impulse in the mass center of the physics object.
---
--- This will not work on players, use Entity:SetVelocity instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:ApplyForceCenter)
---@param impulse Vector The [impulse](https://en.wikipedia.org/wiki/Impulse_(physics)) to be applied in `kg*source_unit/s`. (The vector is in world frame)
function PhysObj:ApplyForceCenter(impulse) end

---[SHARED] Applies the specified impulse on the physics object at the specified position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:ApplyForceOffset)
---@param impulse Vector The impulse to be applied in `kg*source_unit/s`. (World frame)
---@param position Vector The position in world coordinates (`source units`) where the force is applied to the physics object.
function PhysObj:ApplyForceOffset(impulse, position) end

---[SHARED] Applies the specified angular impulse to the physics object. See PhysObj:CalculateForceOffset
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:ApplyTorqueCenter)
---@param angularImpulse Vector The angular impulse to be applied in `kg * m^2 * degrees / s`. (The vector is in world frame)
---
--- 				The unit conversion between meters and source units in this case is `1 meter ≈ 39.37 source units (100/2.54 exactly)`
---
---
function PhysObj:ApplyTorqueCenter(angularImpulse) end

---[SHARED] Calculates the linear and angular impulse on the object's center of mass for an offset impulse.The outputs can be used with PhysObj:ApplyForceCenter and PhysObj:ApplyTorqueCenter, respectively. **Be careful to convert the angular impulse to world frame (PhysObj:LocalToWorldVector) if you are going to use it with ApplyTorqueCenter.**
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:CalculateForceOffset)
---@param impulse Vector The impulse acting on the object in `kg*source_unit/s`. (World frame)
---@param position Vector The location of the impulse in world coordinates (`source units`)
---@return Vector # The calculated linear impulse on the physics object's center of mass in `kg*source_unit/s`. (World frame)
---@return Vector # The calculated angular impulse on the physics object's center of mass in `kg*m^2*degrees/s`. (Local frame)
function PhysObj:CalculateForceOffset(impulse, position) end

---[SHARED] Calculates the linear and angular velocities on the center of mass for an offset impulse. The outputs can be directly passed to PhysObj:AddVelocity and PhysObj:AddAngleVelocity, respectively.
---
--- This will return zero length vectors if the physics object's motion is disabled. See PhysObj:IsMotionEnabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:CalculateVelocityOffset)
---@param impulse Vector The impulse acting on the object in `kg*source_unit/s`. (World frame)
---@param position Vector The location of the impulse in world coordinates (`source units`)
---@return Vector # The calculated linear velocity from the impulse on the physics object's center of mass in `source_unit/s`. (World frame)
---@return Vector # The calculated angular velocity from the impulse on the physics object's center of mass in `degrees/s`. (Local frame)
function PhysObj:CalculateVelocityOffset(impulse, position) end

---[SHARED] Removes one of more specified flags.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:ClearGameFlag)
---@param flags number Bitflag, see Enums/FVPHYSICS.
function PhysObj:ClearGameFlag(flags) end

---[SHARED] Allows you to move a PhysObj to a point and angle in 3D space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:ComputeShadowControl)
---@param shadowparams table The parameters for the shadow. See example code to see how its used.
function PhysObj:ComputeShadowControl(shadowparams) end

---[SHARED] Sets whether the physics object should collide with anything or not, including world.
---
--- This function currently has major problems with player collisions, and as such should be avoided at all costs.
---
---
---
--- A better alternative to this function would be using Entity:SetCollisionGroup( COLLISION_GROUP_WORLD ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:EnableCollisions)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableCollisions(enable) end

---[SHARED] Sets whenever the physics object should be affected by drag.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:EnableDrag)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableDrag(enable) end

---[SHARED] Sets whether the PhysObject should be affected by gravity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:EnableGravity)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableGravity(enable) end

---[SHARED] Sets whether the physobject should be able to move or not.
---
--- This is the exact method the Physics Gun uses to freeze props. If a motion-disabled physics object is grabbed with the physics gun, the object will be able to move again. To disallow this, use GM:PhysgunPickup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:EnableMotion)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableMotion(enable) end

---[SHARED] Returns the mins and max of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetAABB)
---@return Vector # Mins
---@return Vector # Maxs
function PhysObj:GetAABB() end

---[SHARED] Returns the angles of the physics object in degrees.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetAngles)
---@return Angle # The angles of the physics object.
function PhysObj:GetAngles() end

---[SHARED] Gets the angular velocity of the object in degrees per second as a local vector. You can use dot product to read the magnitude from a specific axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetAngleVelocity)
---@return Vector # The angular velocity
function PhysObj:GetAngleVelocity() end

---[SHARED] Returns the contents flag of the PhysObj.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetContents)
---@return number # The Enums/CONTENTS.
function PhysObj:GetContents() end

---[SHARED] Returns the linear and angular damping of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetDamping)
---@return number # The linear damping
---@return number # The angular damping
function PhysObj:GetDamping() end

---[SHARED] Returns the sum of the linear and rotational kinetic energies of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetEnergy)
---@return number # The kinetic energy
function PhysObj:GetEnergy() end

---[SHARED] Returns the parent entity of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetEntity)
---@return Entity # The entity this physics object belongs to
function PhysObj:GetEntity() end

---[SERVER] Returns the friction snapshot of this physics object. This is useful for determining if an object touching ground for example.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetFrictionSnapshot)
---@return table # A table of tables containing the following data: * PhysObj Other - The other physics object we came in contact with * number EnergyAbsorbed -  * number FrictionCoefficient -  * number NormalForce -  * Vector Normal - Direction of the friction event * Vector ContactPoint - Contact point of the friction event * number Material - Surface Property ID of our physics obj * number MaterialOther - Surface Property ID of the physics obj we came in contact with
function PhysObj:GetFrictionSnapshot() end

---[SHARED] Returns the principal moments of inertia `(Ixx, Iyy, Izz)` of the physics object, in the local frame, with respect to the center of mass.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetInertia)
---@return Vector # The moment of inertia in `kg * m^2` 			The unit conversion between meters and source units in this case is `1 meter ≈ 39.37 source units (100/2.54 exactly)` 			This value changes proportionally to the physics object's mass (e.g. making the object twice as heavy will result in it having twice the angular inertia)
function PhysObj:GetInertia() end

---[SHARED] Returns 1 divided by the angular inertia. See PhysObj:GetInertia
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetInvInertia)
---@return Vector # The inverted angular inertia 			Returns `[0, 0, 0]` on frozen physics objects.
function PhysObj:GetInvInertia() end

---[SHARED] Returns 1 divided by the physics object's mass (in kilograms).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetInvMass)
---@return number # The inverted mass. 			Returns 0 on frozen physics objects.
function PhysObj:GetInvMass() end

---[SHARED] Returns the mass of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetMass)
---@return number # The mass in kilograms.
function PhysObj:GetMass() end

---[SHARED] Returns the center of mass of the physics object as a local vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetMassCenter)
---@return Vector # The center of mass of the physics object.
function PhysObj:GetMassCenter() end

---[SHARED] Returns the physical material of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetMaterial)
---@return string # The physical material
function PhysObj:GetMaterial() end

---[SHARED] Returns the physics mesh of the object which is used for physobj-on-physobj collision.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetMesh)
---@return table # Table of Structures/MeshVertexs where each three vertices represent a triangle. Returns nil if the physics object is a sphere.
function PhysObj:GetMesh() end

---[SHARED] Returns all convex physics meshes of the object. See Entity:PhysicsInitMultiConvex for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetMeshConvexes)
---@return table # Table of Structures/MeshVertexs where each Structures/MeshVertex is an independent convex mesh and each three vertices represent a triangle. Returns nil if the physics object is a sphere.
function PhysObj:GetMeshConvexes() end

---[SHARED] Returns the name of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetName)
---@return string # The name of the physics object.
function PhysObj:GetName() end

---[SHARED] Returns the position of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetPos)
---@return Vector # The position in world coordinates. (`source units`)
function PhysObj:GetPos() end

---[SHARED] Returns the position and angle of the physics object as a 3x4 matrix (VMatrix is 4x4 so the fourth row goes unused). The first three columns store the angle as a [rotation matrix](https://en.wikipedia.org/wiki/Rotation_matrix), and the fourth column stores the position vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetPositionMatrix)
---@return VMatrix # The position and angle matrix.
function PhysObj:GetPositionMatrix() end

---[SHARED] Returns the rotation damping of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetRotDamping)
---@return number # The rotation damping
function PhysObj:GetRotDamping() end

---[SHARED] Returns the angles of the PhysObj shadow. See PhysObj:UpdateShadow.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetShadowAngles)
---@return Angle # The angles of the PhysObj shadow.
function PhysObj:GetShadowAngles() end

---[SHARED] Returns the position of the PhysObj shadow. See PhysObj:UpdateShadow.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetShadowPos)
---@return Vector # The position of the PhysObj shadow.
function PhysObj:GetShadowPos() end

---[SHARED] Returns the speed damping of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetSpeedDamping)
---@return number # speedDamping
function PhysObj:GetSpeedDamping() end

---[SERVER] Returns the internal and external stress of the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetStress)
---@return number # The external stress (`𝜎𝑒`). It's the value of a giving force to other entities (in kg).
---@return number # The internal stress (`𝜎𝑖`). It's the value of a receiving force from other entities (in kg).
function PhysObj:GetStress() end

---[SHARED] Returns the surface area of the physics object in source-units². Or nil if the PhysObj is a generated sphere or box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetSurfaceArea)
---@return number # The surface area or nil if the PhysObj is a generated sphere or box.
function PhysObj:GetSurfaceArea() end

---[SHARED] Returns the absolute directional velocity of the physobject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetVelocity)
---@return Vector # velocity
function PhysObj:GetVelocity() end

---[SHARED] Returns the world velocity of a point in world coordinates about the object. This is useful for objects rotating around their own axis/origin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetVelocityAtPoint)
---@param point Vector A point to test in world space coordinates
---@return Vector # Velocity at the given point
function PhysObj:GetVelocityAtPoint(point) end

---[SHARED] Returns the volume in source units³. Or nil if the PhysObj is a generated sphere or box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:GetVolume)
---@return number # The volume or nil if the PhysObj is a generated sphere or box.
function PhysObj:GetVolume() end

---[SHARED] Returns whenever the specified flag(s) is/are set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:HasGameFlag)
---@param flags number Bitflag, see Enums/FVPHYSICS.
---@return boolean # If flag was set or not
function PhysObj:HasGameFlag(flags) end

---[SHARED] Returns whether the physics object is "sleeping".
---
--- See PhysObj:Sleep for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsAsleep)
---@return boolean # Whether the physics object is sleeping.
function PhysObj:IsAsleep() end

---[SHARED] Returns whenever the entity is able to collide or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsCollisionEnabled)
---@return boolean # isCollisionEnabled
function PhysObj:IsCollisionEnabled() end

---[SHARED] Returns whenever the entity is affected by drag.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsDragEnabled)
---@return boolean # dragEnabled
function PhysObj:IsDragEnabled() end

---[SHARED] Returns whenever the entity is affected by gravity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsGravityEnabled)
---@return boolean # `true` if the gravity is enabled, `false` otherwise
function PhysObj:IsGravityEnabled() end

---[SHARED] Returns if the physics object can move itself (by velocity, acceleration)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsMotionEnabled)
---@return boolean # `true` if the motion is enabled, `false` otherwise.
function PhysObj:IsMotionEnabled() end

---[SHARED] Returns whenever the entity is able to move.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsMoveable)
---@return boolean # movable
function PhysObj:IsMoveable() end

---[SHARED] Returns whenever the physics object is penetrating another physics object.
---
--- This is internally implemented as `PhysObj:HasGameFlag( FVPHYSICS_PENETRATING )` and thus is only updated for non-static physics objects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsPenetrating)
---@return boolean # Whether the physics object is penetrating another object.
function PhysObj:IsPenetrating() end

---[SHARED] Returns if the physics object is valid/not NULL.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:IsValid)
---@return boolean # isValid
function PhysObj:IsValid() end

---[SHARED] Mapping a vector in local frame of the physics object to world frame.
---
--- this function does translation and rotation, with translation done first.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:LocalToWorld)
---@param LocalVec Vector A vector in the physics object's local frame
---@return Vector # The corresponding vector in world frame
function PhysObj:LocalToWorld(LocalVec) end

---[SHARED] Rotate a vector from the local frame of the physics object to world frame.
---
--- This function only rotates the vector, without any translation operation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:LocalToWorldVector)
---@param LocalVec Vector A vector in the physics object's local frame
---@return Vector # The corresponding vector in world frame
function PhysObj:LocalToWorldVector(LocalVec) end

---[SHARED] Prints debug info about the state of the physics object to the console.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:OutputDebugInfo)
function PhysObj:OutputDebugInfo() end

---[SHARED] Call this when the collision filter conditions change due to this object's state (e.g. changing solid type or collision group)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:RecheckCollisionFilter)
function PhysObj:RecheckCollisionFilter() end

---[SHARED] A convinience function for Angle:RotateAroundAxis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:RotateAroundAxis)
---@param dir Vector Direction, around which we will rotate
---@param ang number Amount of rotation, in degrees
---@return Angle # The resulting angle
function PhysObj:RotateAroundAxis(dir, ang) end

---[SHARED] Sets the amount of [drag](https://en.wikipedia.org/wiki/Drag_(physics)) to apply to a physics object when attempting to rotate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetAngleDragCoefficient)
---@param coefficient number [Drag coefficient](https://en.wikipedia.org/wiki/Drag_coefficient). The bigger this value is, the slower the angles will change.
function PhysObj:SetAngleDragCoefficient(coefficient) end

---[SHARED] Sets the angles of the physobject in degrees.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetAngles)
---@param angles Angle The new angles of the physobject.
--- 			The new angle will not be applied on the parent entity while the physics object is asleep (PhysObj:Sleep)
---
function PhysObj:SetAngles(angles) end

---[SHARED] Sets the specified [angular velocity](https://en.wikipedia.org/wiki/Angular_velocity) on the PhysObj
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetAngleVelocity)
---@param angularVelocity Vector The new velocity in `degrees/s`. (Local frame)
function PhysObj:SetAngleVelocity(angularVelocity) end

---[SHARED] Sets the specified instantaneous [angular velocity](https://en.wikipedia.org/wiki/Angular_velocity) on the PhysObj
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetAngleVelocityInstantaneous)
---@param angularVelocity Vector The new velocity to set velocity.
function PhysObj:SetAngleVelocityInstantaneous(angularVelocity) end

---[SHARED] Sets the buoyancy ratio of the physics object. (How well it floats in water)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetBuoyancyRatio)
---@param buoyancy number Buoyancy ratio, where 0 is not buoyant at all (like a rock), and 1 is very buoyant (like wood). You can set values larger than 1 for greater effect.
function PhysObj:SetBuoyancyRatio(buoyancy) end

---[SHARED] Sets the contents flag of the PhysObj.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetContents)
---@param contents number The Enums/CONTENTS.
function PhysObj:SetContents(contents) end

---[SHARED] Sets the linear and angular damping of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetDamping)
---@param linearDamping number Linear damping.
---@param angularDamping number Angular damping.
function PhysObj:SetDamping(linearDamping, angularDamping) end

---[SHARED] Modifies how much drag (air resistance) affects the object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetDragCoefficient)
---@param drag number The drag coefficient
--- It can be positive or negative.
function PhysObj:SetDragCoefficient(drag) end

---[SHARED] Sets the angular inertia. See PhysObj:GetInertia.
---
--- This does not affect linear inertia.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetInertia)
---@param angularInertia Vector The angular inertia of the object.
---
function PhysObj:SetInertia(angularInertia) end

---[SHARED] Sets the mass of the physics object.
---
--- This resets PhysObj:SetBuoyancyRatio (Recalculated based materials' and the physics objects' densities, latter of which is dependent on mass). This is a physics engine limitation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetMass)
---@param mass number The mass in kilograms, in range `[0, 50000]`
function PhysObj:SetMass(mass) end

---[SHARED] Sets the material of the physobject.
---
--- Impact sounds will only change if this is called on client
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetMaterial)
---@param materialName string The name of the phys material to use. From this list: [Valve Developer](https://developer.valvesoftware.com/wiki/Material_surface_properties)
function PhysObj:SetMaterial(materialName) end

---[SHARED] Sets the position of the physobject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetPos)
---@param position Vector The new position of the physobject in world coordinates. (`source units`).
--- 			The new position will not be applied on the parent entity while the physics object is asleep (PhysObj:Sleep)
---
---@param teleport? boolean If `true`, temporarily disables collisions of the physics objects just before moving it, then enables collisions back again.
function PhysObj:SetPos(position, teleport) end

---[SHARED] Sets the velocity of the physics object for the next iteration.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetVelocity)
---@param velocity Vector The new velocity of the physics object in `source_unit/s`. (World frame)
function PhysObj:SetVelocity(velocity) end

---[SHARED] Sets the velocity of the physics object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:SetVelocityInstantaneous)
---@param velocity Vector The new velocity of the physics object.
function PhysObj:SetVelocityInstantaneous(velocity) end

---[SHARED] Makes the physics object "sleep". The physics object will no longer be moving unless it is "woken up" by either a collision with another moving object, or by PhysObj:Wake.
---
--- This is an optimization feature of the physics engine. Normally physics objects will automatically "sleep" when not moving for a short while, to save resources, but it can be used for other purposes, for example to temporarily suspend an object mid air.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:Sleep)
function PhysObj:Sleep() end

---[SHARED] Unlike PhysObj:SetPos and PhysObj:SetAngles, this allows the movement of a physobj while leaving physics interactions intact.
--- This is used internally by the motion controller of the Gravity Gun , the +use pickup and the Physics Gun, and entities such as the crane.
---
--- This is the ideal function to move a physics shadow created with Entity:PhysicsInitShadow or Entity:MakePhysicsObjectAShadow.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:UpdateShadow)
---@param targetPosition Vector The position we should move to.
---@param targetAngles Angle The angle we should rotate towards.
---@param frameTime number The frame time to use for this movement, can be generally filled with Global.FrameTime or ENTITY:PhysicsSimulate with the deltaTime.
---
--- Can be set to 0 when you need to update the physics object just once.
function PhysObj:UpdateShadow(targetPosition, targetAngles, frameTime) end

---[SHARED] Wakes the physics object, so that it will continue to simulate physics/gravity.
---
--- See PhysObj:Sleep for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:Wake)
function PhysObj:Wake() end

---[SHARED] Converts a vector to a relative to the physics object coordinate system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:WorldToLocal)
---@param vec Vector The vector in world space coordinates.
---@return Vector # The vector local to PhysObj:GetPos.
function PhysObj:WorldToLocal(vec) end

---[SHARED] Rotate a vector from the world frame to the local frame of the physics object.
---
--- This function only rotates the vector, without any translation operation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PhysObj:WorldToLocalVector)
---@param WorldVec Vector A vector in the world frame
---@return Vector # The corresponding vector relative to the PhysObj
function PhysObj:WorldToLocalVector(WorldVec) end
