---@meta

--- This is the object returned by [Entity:GetPhysicsObject](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObject), [Entity:GetPhysicsObjectNum](https://wiki.facepunch.com/gmod/Entity:GetPhysicsObjectNum) and [Vehicle:GetWheel](https://wiki.facepunch.com/gmod/Vehicle:GetWheel).
---
--- It represents a physics object. An entity can have multiple physics objects (ragdolls), one physics objects (props), or none. (NPCs, non physics entities, etc.)
---
--- Physics objects are usually simulated by the physics engine and usually dictate the position of the entity, and not the other way around.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj)
---@class PhysObj
local PhysObj = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adds the specified [angular velocity](https://en.wikipedia.org/wiki/Angular_velocity) velocity to the current [PhysObj](https://wiki.facepunch.com/gmod/PhysObj).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:AddAngleVelocity)
---@param angularVelocity Vector The additional velocity in `degrees/s`. (Local to the physics object.)
--- 			Does nothing on frozen objects.
function PhysObj:AddAngleVelocity(angularVelocity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adds one or more bit flags.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:AddGameFlag)
---@param flags number Bitflag, see Enums/FVPHYSICS.
function PhysObj:AddGameFlag(flags) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adds the specified velocity to the current.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:AddVelocity)
---@param velocity Vector Additional velocity in `source_unit/s`. (World frame)
--- 			Does nothing on frozen objects.
function PhysObj:AddVelocity(velocity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Rotates the object so that it's angles are aligned to the ones inputted.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:AlignAngles)
---@param from Angle
---@param to Angle
---@return Angle #
function PhysObj:AlignAngles(from, to) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Applies the specified impulse in the mass center of the physics object.
---
--- **NOTE**: This will not work on players, use [Entity:SetVelocity](https://wiki.facepunch.com/gmod/Entity:SetVelocity) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:ApplyForceCenter)
---@param impulse Vector The [impulse](https://en.wikipedia.org/wiki/Impulse_(physics)) to be applied in `kg*source_unit/s`. (The vector is in world frame)
function PhysObj:ApplyForceCenter(impulse) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Applies the specified impulse on the physics object at the specified position.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:ApplyForceOffset)
---@param impulse Vector The impulse to be applied in `kg*source_unit/s`. (World frame)
---@param position Vector The position in world coordinates (`source units`) where the force is applied to the physics object.
function PhysObj:ApplyForceOffset(impulse, position) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Applies the specified angular impulse to the physics object. See [PhysObj:CalculateForceOffset](https://wiki.facepunch.com/gmod/PhysObj:CalculateForceOffset)
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:ApplyTorqueCenter)
---@param angularImpulse Vector The angular impulse to be applied in `kg * m^2 * degrees / s`. (The vector is in world frame)
---
--- 				The unit conversion between meters and source units in this case is `1 meter ≈ 39.37 source units (100/2.54 exactly)`
function PhysObj:ApplyTorqueCenter(angularImpulse) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Calculates the linear and angular impulse on the object's center of mass for an offset impulse.The outputs can be used with [PhysObj:ApplyForceCenter](https://wiki.facepunch.com/gmod/PhysObj:ApplyForceCenter) and [PhysObj:ApplyTorqueCenter](https://wiki.facepunch.com/gmod/PhysObj:ApplyTorqueCenter), respectively.
---
--- **Be careful to convert the angular impulse to world frame ([PhysObj:LocalToWorldVector](https://wiki.facepunch.com/gmod/PhysObj:LocalToWorldVector)) if you are going to use it with ApplyTorqueCenter.**
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:CalculateForceOffset)
---@param impulse Vector The impulse acting on the object in `kg*source_unit/s`. (World frame)
---@param position Vector The location of the impulse in world coordinates (`source units`)
---@return Vector # The calculated linear impulse on the physics object's center of mass in `kg*source_unit/s`. (World frame)
---@return Vector # The calculated angular impulse on the physics object's center of mass in `kg*m^2*degrees/s`. (Local frame)
function PhysObj:CalculateForceOffset(impulse, position) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Calculates the linear and angular velocities on the center of mass for an offset impulse. The outputs can be directly passed to [PhysObj:AddVelocity](https://wiki.facepunch.com/gmod/PhysObj:AddVelocity) and [PhysObj:AddAngleVelocity](https://wiki.facepunch.com/gmod/PhysObj:AddAngleVelocity), respectively.
---
--- **WARNING**: This will return zero length vectors if the physics object's motion is disabled. See [PhysObj:IsMotionEnabled](https://wiki.facepunch.com/gmod/PhysObj:IsMotionEnabled).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:CalculateVelocityOffset)
---@param impulse Vector The impulse acting on the object in `kg*source_unit/s`. (World frame)
---@param position Vector The location of the impulse in world coordinates (`source units`)
---@return Vector # The calculated linear velocity from the impulse on the physics object's center of mass in `source_unit/s`. (World frame)
---@return Vector # The calculated angular velocity from the impulse on the physics object's center of mass in `degrees/s`. (Local frame)
function PhysObj:CalculateVelocityOffset(impulse, position) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Removes one of more specified flags.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:ClearGameFlag)
---@param flags number Bitflag, see Enums/FVPHYSICS.
function PhysObj:ClearGameFlag(flags) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Allows you to move a PhysObj to a point and angle in 3D space. Works with any PhysObj, not just physics shadows.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:ComputeShadowControl)
---@param shadowparams table The parameters for the shadow. See Structures/ShadowControlParams.
function PhysObj:ComputeShadowControl(shadowparams) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets whether the physics object should collide with anything or not, including world.
---
--- **WARNING**: This function currently has major problems with player collisions, and as such should be avoided at all costs.
---
--- A better alternative to this function would be using [Entity:SetCollisionGroup](https://wiki.facepunch.com/gmod/Entity:SetCollisionGroup)( COLLISION_GROUP_WORLD ).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:EnableCollisions)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableCollisions(enable) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets whenever the physics object should be affected by drag.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:EnableDrag)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableDrag(enable) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets whether the PhysObject should be affected by gravity
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:EnableGravity)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableGravity(enable) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets whether the physobject should be able to move or not.
---
--- This is the exact method the Physics Gun uses to freeze props. If a motion-disabled physics object is grabbed with the physics gun, the object will be able to move again. To disallow this, use [GM:PhysgunPickup](https://wiki.facepunch.com/gmod/GM:PhysgunPickup).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:EnableMotion)
---@param enable boolean True to enable, false to disable.
function PhysObj:EnableMotion(enable) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the mins and max of the physics object Axis-Aligned Bounding Box.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetAABB)
---@return Vector # The minimum extents of the bounding box.
---@return Vector # The maximum extents of the bounding box.
function PhysObj:GetAABB() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the angles of the physics object in degrees.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetAngles)
---@return Angle # The angles of the physics object.
function PhysObj:GetAngles() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the angular velocity of the object in degrees per second as a local vector. You can use dot product to read the magnitude from a specific axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetAngleVelocity)
---@return Vector # The angular velocity
function PhysObj:GetAngleVelocity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the contents flag of the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetContents)
---@return number # The Enums/CONTENTS.
function PhysObj:GetContents() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the linear and angular damping of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetDamping)
---@return number # The linear damping
---@return number # The angular damping
function PhysObj:GetDamping() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the sum of the linear and rotational kinetic energies of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetEnergy)
---@return number # The kinetic energy
function PhysObj:GetEnergy() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the parent entity of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetEntity)
---@return Entity # The entity this physics object belongs to
function PhysObj:GetEntity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the friction snapshot of this physics object. This is useful for determining if an object touching ground for example.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetFrictionSnapshot)
---@return table # A table of tables containing the following data:
--- * PhysObj Other - The other physics object we came in contact with
--- * number EnergyAbsorbed -
--- * number FrictionCoefficient -
--- * number NormalForce -
--- * Vector Normal - Direction of the friction event
--- * Vector ContactPoint - Contact point of the friction event
--- * number Material - Surface Property ID of our physics obj
--- * number MaterialOther - Surface Property ID of the physics obj we came in contact with
function PhysObj:GetFrictionSnapshot() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the index this physics object is on its [PhysObj:GetEntity](https://wiki.facepunch.com/gmod/PhysObj:GetEntity).
---
--- Useful for [Entity:TranslateBoneToPhysBone](https://wiki.facepunch.com/gmod/Entity:TranslateBoneToPhysBone).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetIndex)
---@return number # The physics object index on its parent entity.
function PhysObj:GetIndex() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the principal moments of inertia `(Ixx, Iyy, Izz)` of the physics object, in the local frame, with respect to the center of mass.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetInertia)
---@return Vector # The moment of inertia in `kg * m^2`
--- 			The unit conversion between meters and source units in this case is `1 meter ≈ 39.37 source units (100/2.54 exactly)`
--- 			This value changes proportionally to the physics object's mass (e.g. making the object twice as heavy will result in it having twice the angular inertia)
function PhysObj:GetInertia() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns 1 divided by the angular inertia. See [PhysObj:GetInertia](https://wiki.facepunch.com/gmod/PhysObj:GetInertia)
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetInvInertia)
---@return Vector # The inverted angular inertia
--- 			Returns `[0, 0, 0]` on frozen physics objects.
function PhysObj:GetInvInertia() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns 1 divided by the physics object's mass (in kilograms).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetInvMass)
---@return number # The inverted mass.
--- 			Returns 0 on frozen physics objects.
function PhysObj:GetInvMass() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the mass of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetMass)
---@return number # The mass in kilograms.
function PhysObj:GetMass() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the center of mass of the physics object as a local vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetMassCenter)
---@return Vector # The center of mass of the physics object.
function PhysObj:GetMassCenter() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the [physical material](https://developer.valvesoftware.com/wiki/Material_surface_properties) of the physics object.
---
--- See [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) for a function that adds these types as well as further explanation of what they are.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetMaterial)
---@return string # The physical material name.
function PhysObj:GetMaterial() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the physics mesh of the object which is used for physobj-on-physobj collision.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetMesh)
---@return table # Table of Structures/MeshVertexs where each three vertices represent a triangle. Returns nil if the physics object is a sphere.
function PhysObj:GetMesh() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns all convex physics meshes of the object. See [Entity:PhysicsInitMultiConvex](https://wiki.facepunch.com/gmod/Entity:PhysicsInitMultiConvex) for more information.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetMeshConvexes)
---@return table # Table of Structures/MeshVertexs where each Structures/MeshVertex is an independent convex mesh and each three vertices represent a triangle. Returns nil if the physics object is a sphere.
function PhysObj:GetMeshConvexes() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the name of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetName)
---@return string # The name of the physics object.
function PhysObj:GetName() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the position of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetPos)
---@return Vector # The position in world coordinates. (`source units`)
function PhysObj:GetPos() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the position and angle of the physics object as a 3x4 matrix ([VMatrix](https://wiki.facepunch.com/gmod/VMatrix) is 4x4 so the fourth row goes unused). The first three columns store the angle as a [rotation matrix](https://en.wikipedia.org/wiki/Rotation_matrix), and the fourth column stores the position vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetPositionMatrix)
---@return VMatrix # The position and angle matrix.
function PhysObj:GetPositionMatrix() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the rotation damping of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetRotDamping)
---@return number # The rotation damping
function PhysObj:GetRotDamping() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the angles of the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) shadow. See [PhysObj:UpdateShadow](https://wiki.facepunch.com/gmod/PhysObj:UpdateShadow).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetShadowAngles)
---@return Angle # The angles of the PhysObj shadow.
function PhysObj:GetShadowAngles() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the position of the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) shadow. See [PhysObj:UpdateShadow](https://wiki.facepunch.com/gmod/PhysObj:UpdateShadow).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetShadowPos)
---@return Vector # The position of the PhysObj shadow.
function PhysObj:GetShadowPos() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the speed damping of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetSpeedDamping)
---@return number # speedDamping
function PhysObj:GetSpeedDamping() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the internal and external stress of the entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetStress)
---@return number # The external stress (`𝜎𝑒`). It's the value of a giving force to other entities (in kg).
---@return number # The internal stress (`𝜎𝑖`). It's the value of a receiving force from other entities (in kg).
function PhysObj:GetStress() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the surface area of the physics object in source-units². Or nil if the PhysObj is a generated sphere or box.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetSurfaceArea)
---@return number|nil # The surface area or `nil` if the PhysObj is a generated sphere or box.
function PhysObj:GetSurfaceArea() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the absolute directional velocity of the physobject.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetVelocity)
---@return Vector # velocity
function PhysObj:GetVelocity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the world velocity of a point in world coordinates about the object. This is useful for objects rotating around their own axis/origin.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetVelocityAtPoint)
---@param point Vector A point to test in world space coordinates
---@return Vector # Velocity at the given point
function PhysObj:GetVelocityAtPoint(point) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the volume in source units³. Or nil if the PhysObj is a generated sphere or box.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:GetVolume)
---@return number|nil # The volume or `nil` if the PhysObj is a generated sphere or box.
function PhysObj:GetVolume() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the specified flag(s) is/are set.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:HasGameFlag)
---@param flags number Bitflag, see Enums/FVPHYSICS.
---@return boolean # If flag was set or not
function PhysObj:HasGameFlag(flags) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the physics object is "sleeping".
---
--- See [PhysObj:Sleep](https://wiki.facepunch.com/gmod/PhysObj:Sleep) for more information.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsAsleep)
---@return boolean # Whether the physics object is sleeping.
function PhysObj:IsAsleep() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the entity is able to collide or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsCollisionEnabled)
---@return boolean # isCollisionEnabled
function PhysObj:IsCollisionEnabled() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the entity is affected by drag.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsDragEnabled)
---@return boolean # dragEnabled
function PhysObj:IsDragEnabled() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the entity is affected by gravity.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsGravityEnabled)
---@return boolean # `true` if the gravity is enabled, `false` otherwise
function PhysObj:IsGravityEnabled() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if the physics object can move itself (by velocity, acceleration)
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsMotionEnabled)
---@return boolean # `true` if the motion is enabled, `false` otherwise.
function PhysObj:IsMotionEnabled() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the entity is able to move.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsMoveable)
---@return boolean # movable
function PhysObj:IsMoveable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the physics object is penetrating another physics object.
---
--- This is internally implemented as `PhysObj:HasGameFlag( FVPHYSICS_PENETRATING )` and thus is only updated for non-static physics objects.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsPenetrating)
---@return boolean # Whether the physics object is penetrating another object.
function PhysObj:IsPenetrating() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if the physics object is valid/not NULL.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:IsValid)
---@return boolean # Whether the physics object is valid or not.
function PhysObj:IsValid() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Mapping a vector in local frame of the physics object to world frame.
---
--- **NOTE**: this function does translation and rotation, with translation done first.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:LocalToWorld)
---@param LocalVec Vector A vector in the physics object's local frame
---@return Vector # The corresponding vector in world frame
function PhysObj:LocalToWorld(LocalVec) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Rotate a vector from the local frame of the physics object to world frame.
---
--- **NOTE**: This function only rotates the vector, without any translation operation.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:LocalToWorldVector)
---@param LocalVec Vector A vector in the physics object's local frame
---@return Vector # The corresponding vector in world frame
function PhysObj:LocalToWorldVector(LocalVec) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Prints debug info about the state of the physics object to the console.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:OutputDebugInfo)
function PhysObj:OutputDebugInfo() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Call this when the collision filter conditions change due to this object's state (e.g. changing solid type or collision group)
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:RecheckCollisionFilter)
function PhysObj:RecheckCollisionFilter() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) A convinience function for [Angle:RotateAroundAxis](https://wiki.facepunch.com/gmod/Angle:RotateAroundAxis).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:RotateAroundAxis)
---@param dir Vector Direction, around which we will rotate
---@param ang number Amount of rotation, in degrees
---@return Angle # The resulting angle
function PhysObj:RotateAroundAxis(dir, ang) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the amount of [drag](https://en.wikipedia.org/wiki/Drag_(physics)) to apply to a physics object when attempting to rotate.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetAngleDragCoefficient)
---@param coefficient number [Drag coefficient](https://en.wikipedia.org/wiki/Drag_coefficient). The bigger this value is, the slower the angles will change.
function PhysObj:SetAngleDragCoefficient(coefficient) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the angles of the physobject in degrees.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetAngles)
---@param angles Angle The new angles of the physobject.
--- 			The new angle will not be applied on the parent entity while the physics object is asleep ([PhysObj:Sleep](https://wiki.facepunch.com/gmod/PhysObj:Sleep))
function PhysObj:SetAngles(angles) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the specified [angular velocity](https://en.wikipedia.org/wiki/Angular_velocity) on the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetAngleVelocity)
---@param angularVelocity Vector The new velocity in `degrees/s`. (Local frame)
function PhysObj:SetAngleVelocity(angularVelocity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the specified instantaneous [angular velocity](https://en.wikipedia.org/wiki/Angular_velocity) on the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj)
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetAngleVelocityInstantaneous)
---@param angularVelocity Vector The new velocity to set velocity.
function PhysObj:SetAngleVelocityInstantaneous(angularVelocity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the buoyancy ratio of the physics object. (How well it floats in water)
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetBuoyancyRatio)
---@param buoyancy number Buoyancy ratio, where 0 is not buoyant at all (like a rock), and 1 is very buoyant (like wood). You can set values larger than 1 for greater effect.
function PhysObj:SetBuoyancyRatio(buoyancy) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the contents flag of the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetContents)
---@param contents CONTENTS The Enums/CONTENTS.
function PhysObj:SetContents(contents) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the linear and angular damping of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetDamping)
---@param linearDamping number Linear damping.
---@param angularDamping number Angular damping.
function PhysObj:SetDamping(linearDamping, angularDamping) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Modifies how much drag (air resistance) affects the object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetDragCoefficient)
---@param drag number The drag coefficient
--- It can be positive or negative.
function PhysObj:SetDragCoefficient(drag) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the angular inertia. See [PhysObj:GetInertia](https://wiki.facepunch.com/gmod/PhysObj:GetInertia).
---
--- **NOTE**: This does not affect linear inertia.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetInertia)
---@param angularInertia Vector The angular inertia of the object.
function PhysObj:SetInertia(angularInertia) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the mass of the physics object.
---
--- **WARNING**: This resets [PhysObj:SetBuoyancyRatio](https://wiki.facepunch.com/gmod/PhysObj:SetBuoyancyRatio) (Recalculated based materials' and the physics objects' densities, latter of which is dependent on mass). This is a physics engine limitation.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetMass)
---@param mass number The mass in kilograms, in range `[0, 50000]`
function PhysObj:SetMass(mass) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the material of the physobject.
---
--- **NOTE**: Impact sounds will only change if this is called on client
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetMaterial)
---@param materialName string The name of the phys material to use. From this list: [Valve Developer](https://developer.valvesoftware.com/wiki/Material_surface_properties)
function PhysObj:SetMaterial(materialName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the position of the physobject.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetPos)
---@param position Vector The new position of the physobject in world coordinates. (`source units`).
--- 			The new position will not be applied on the parent entity while the physics object is asleep ([PhysObj:Sleep](https://wiki.facepunch.com/gmod/PhysObj:Sleep))
---@param teleport? boolean If `true`, temporarily disables collisions of the physics objects just before moving it, then enables collisions back again.
function PhysObj:SetPos(position, teleport) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the velocity of the physics object for the next iteration.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetVelocity)
---@param velocity Vector The new velocity of the physics object in `source_unit/s`. (World frame)
function PhysObj:SetVelocity(velocity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the velocity of the physics object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:SetVelocityInstantaneous)
---@param velocity Vector The new velocity of the physics object.
function PhysObj:SetVelocityInstantaneous(velocity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Makes the physics object "sleep". The physics object will no longer be moving unless it is "woken up" by either a collision with another moving object, or by [PhysObj:Wake](https://wiki.facepunch.com/gmod/PhysObj:Wake).
---
--- This is an optimization feature of the physics engine. Normally physics objects will automatically "sleep" when not moving for a short while, to save resources, but it can be used for other purposes, for example to temporarily suspend an object mid air.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:Sleep)
function PhysObj:Sleep() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Unlike [PhysObj:SetPos](https://wiki.facepunch.com/gmod/PhysObj:SetPos) and [PhysObj:SetAngles](https://wiki.facepunch.com/gmod/PhysObj:SetAngles), this allows the movement of a physobj while leaving physics interactions intact.
--- This is used internally by the motion controller of the Gravity Gun , the +use pickup and the Physics Gun, and entities such as the crane.
---
--- **NOTE**: This is the ideal function to move a physics shadow created with [Entity:PhysicsInitShadow](https://wiki.facepunch.com/gmod/Entity:PhysicsInitShadow) or [Entity:MakePhysicsObjectAShadow](https://wiki.facepunch.com/gmod/Entity:MakePhysicsObjectAShadow).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:UpdateShadow)
---@param targetPosition Vector The position we should move to.
---@param targetAngles Angle The angle we should rotate towards.
---@param frameTime number The frame time to use for this movement, can be generally filled with Global.FrameTime or ENTITY:PhysicsSimulate with the deltaTime.
---
--- Can be set to 0 when you need to update the physics object just once.
function PhysObj:UpdateShadow(targetPosition, targetAngles, frameTime) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Wakes the physics object, so that it will continue to simulate physics/gravity.
---
--- See [PhysObj:Sleep](https://wiki.facepunch.com/gmod/PhysObj:Sleep) for more information.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:Wake)
function PhysObj:Wake() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Converts a vector to a relative to the physics object coordinate system.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:WorldToLocal)
---@param vec Vector The vector in world space coordinates.
---@return Vector # The vector local to PhysObj:GetPos.
function PhysObj:WorldToLocal(vec) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Rotate a vector from the world frame to the local frame of the physics object.
---
--- **NOTE**: This function only rotates the vector, without any translation operation.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysObj:WorldToLocalVector)
---@param WorldVec Vector A vector in the world frame
---@return Vector # The corresponding vector relative to the PhysObj
function PhysObj:WorldToLocalVector(WorldVec) end
