---@meta

--- This is a list of all methods only available for vehicles. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on vehicles.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle)
---@class Vehicle : Entity
local Vehicle = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the remaining boosting time left.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:BoostTimeLeft)
---@return number # The remaining boosting time left
function Vehicle:BoostTimeLeft() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Tries to find an Exit Point for leaving vehicle, if one is unobstructed in the direction given.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:CheckExitPoint)
---@param yaw number Yaw/roll from vehicle angle to check for exit
---@param distance number Distance from origin to drop player
---@return Vector # Returns the vector for exit position or nil if cannot exit that way.
function Vehicle:CheckExitPoint(yaw, distance) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether the engine is enabled or disabled, i.e. can be started or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:EnableEngine)
---@param enable boolean Enable or disable the engine
function Vehicle:EnableEngine(enable) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns information about the ammo of the vehicle
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetAmmo)
---@return number # Ammo type of the vehicle ammo
---@return number # Clip size
---@return number # Count
function Vehicle:GetAmmo() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns third person camera distance.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetCameraDistance)
---@return number # Camera distance
function Vehicle:GetCameraDistance() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the driver of the vehicle, returns `NULL` if no driver is present.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetDriver)
---@return Entity # The driver of the vehicle.
function Vehicle:GetDriver() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current speed of the vehicle in Half-Life Hammer Units (in/s). Same as [Entity:GetVelocity](https://wiki.facepunch.com/gmod/Entity:GetVelocity) + [Vector:Length](https://wiki.facepunch.com/gmod/Vector:Length).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetHLSpeed)
---@return number # The speed of the vehicle
function Vehicle:GetHLSpeed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the max speed of the vehicle in MPH.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetMaxSpeed)
---@return number # The max speed of the vehicle in MPH
function Vehicle:GetMaxSpeed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns some info about the vehicle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetOperatingParams)
---@return table # The operating params. See Structures/OperatingParams.
function Vehicle:GetOperatingParams() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the passenger of the vehicle, returns NULL if no drivers is present.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetPassenger)
---@param passenger number The index of the passenger
---@return Entity # The passenger
function Vehicle:GetPassenger(passenger) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the seat position and angle of a given passenger seat.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetPassengerSeatPoint)
---@param role number The passenger role. ( 1 is the driver )
---@return Vector # The seat position
---@return Angle # The seat angle
function Vehicle:GetPassengerSeatPoint(role) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current RPM of the vehicle. This value is fake and doesn't actually affect the vehicle movement.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetRPM)
---@return number # The RPM.
function Vehicle:GetRPM() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current speed of the vehicle in MPH.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetSpeed)
---@return number # The speed of the vehicle in MPH
function Vehicle:GetSpeed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current steering of the vehicle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetSteering)
---@return number # The current steering of the vehicle.
function Vehicle:GetSteering() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the maximum steering degree of the vehicle
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetSteeringDegrees)
---@return number # The maximum steering degree of the vehicle
function Vehicle:GetSteeringDegrees() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if vehicle has thirdperson mode enabled or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetThirdPersonMode)
---@return boolean # Returns true if third person mode enabled, false otherwise
function Vehicle:GetThirdPersonMode() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current throttle of the vehicle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetThrottle)
---@return number # The current throttle of the vehicle
function Vehicle:GetThrottle() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the vehicle class name. This is only useful for Sandbox spawned vehicles or any vehicle that properly sets the vehicle class with [Vehicle:SetVehicleClass](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleClass).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetVehicleClass)
---@return string # The class name of the vehicle.
function Vehicle:GetVehicleClass() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the vehicle parameters of given vehicle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetVehicleParams)
---@return table # The vehicle parameters. See Structures/VehicleParams
function Vehicle:GetVehicleParams() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the view position and forward angle of a given passenger seat.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetVehicleViewPosition)
---@param role? number The passenger role. 0 is the driver. This parameter seems to be ignored by the game engine and is therefore optional.
---@return Vector # The view position, will be 0, 0, 0 on failure
---@return Angle # The view angles, will be 0, 0, 0 on failure
---@return number # The field of view, will be 0 on failure
function Vehicle:GetVehicleViewPosition(role) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) of given wheel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetWheel)
---@param wheel number The wheel to retrieve
---@return PhysObj # The wheel
function Vehicle:GetWheel(wheel) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the base wheel height.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetWheelBaseHeight)
---@param wheel number The wheel to get the base wheel height of.
---@return number # The base wheel height.
function Vehicle:GetWheelBaseHeight(wheel) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the wheel contact point.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetWheelContactPoint)
---@param wheel number The wheel to check
---@return Vector # The contact position
---@return number # The Surface Properties ID of hit surface.
---@return boolean # Whether the wheel is on ground or not
function Vehicle:GetWheelContactPoint(wheel) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the wheel count of the vehicle
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetWheelCount)
---@return number # The amount of wheels
function Vehicle:GetWheelCount() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the total wheel height.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:GetWheelTotalHeight)
---@param wheel number The wheel to get the base wheel height of.
---@return number # The total wheel height.
function Vehicle:GetWheelTotalHeight(wheel) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this vehicle has boost at all.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:HasBoost)
---@return boolean # Whether this vehicle has boost at all.
function Vehicle:HasBoost() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this vehicle has a brake pedal. See [Vehicle:SetHasBrakePedal](https://wiki.facepunch.com/gmod/Vehicle:SetHasBrakePedal).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:HasBrakePedal)
---@return boolean # Whether this vehicle has a brake pedal or not.
function Vehicle:HasBrakePedal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this vehicle is currently boosting or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:IsBoosting)
---@return boolean # Whether this vehicle is currently boosting or not.
function Vehicle:IsBoosting() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the engine is enabled or not, i.e. whether it can be started.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:IsEngineEnabled)
---@return boolean # Whether the engine is enabled
function Vehicle:IsEngineEnabled() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the engine is started or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:IsEngineStarted)
---@return boolean # Whether the engine is started or not.
function Vehicle:IsEngineStarted() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the vehicle object is a valid or not. This will return `false` when [Vehicle](https://wiki.facepunch.com/gmod/Vehicle) functions are not usable on the vehicle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:IsValidVehicle)
---@return boolean # Is the vehicle a valid vehicle or not
function Vehicle:IsValidVehicle() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this vehicle's engine is underwater or not. ( Internally the attachment point "engine" or "vehicle_engine" is checked )
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:IsVehicleBodyInWater)
---@return boolean # Whether this vehicle's engine is underwater or not.
function Vehicle:IsVehicleBodyInWater() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Releases the vehicle's handbrake (Jeep) so it can roll without any passengers.
---
--- This will be overwritten if the vehicle has a driver. Same as [Vehicle:SetHandbrake](https://wiki.facepunch.com/gmod/Vehicle:SetHandbrake)( false )
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:ReleaseHandbrake)
function Vehicle:ReleaseHandbrake() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the boost. It is possible that this function does not work while the vehicle has a valid driver in it.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetBoost)
---@param boost number The new boost value
function Vehicle:SetBoost(boost) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the third person camera distance of the vehicle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetCameraDistance)
---@param distance number Camera distance to set to
function Vehicle:SetCameraDistance(distance) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Turns on or off the Jeep handbrake so it can roll without a driver inside.
---
--- Does nothing while the vehicle has a driver in it.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetHandbrake)
---@param handbrake boolean true to turn on, false to turn off.
function Vehicle:SetHandbrake(handbrake) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether this vehicle has a brake pedal.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetHasBrakePedal)
---@param brakePedal boolean Whether this vehicle has a brake pedal
function Vehicle:SetHasBrakePedal(brakePedal) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets maximum reverse throttle
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetMaxReverseThrottle)
---@param maxRevThrottle number The new maximum throttle. This number must be negative.
function Vehicle:SetMaxReverseThrottle(maxRevThrottle) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets maximum forward throttle
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetMaxThrottle)
---@param maxThrottle number The new maximum throttle.
function Vehicle:SetMaxThrottle(maxThrottle) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets spring length of given wheel
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetSpringLength)
---@param wheel number The wheel to change spring length of
---@param length number The new spring length
function Vehicle:SetSpringLength(wheel, length) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the steering of the vehicle.
--- The correct range, 0 to 1 or -1 to 1
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetSteering)
---@param front number Angle of the front wheels (-1 to 1)
---@param rear number Angle of the rear wheels (-1 to 1)
function Vehicle:SetSteering(front, rear) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the maximum steering degrees of the vehicle
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetSteeringDegrees)
---@param steeringDegrees number The new maximum steering degree
function Vehicle:SetSteeringDegrees(steeringDegrees) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the third person mode state.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetThirdPersonMode)
---@param enable boolean Enable or disable the third person mode for this vehicle
function Vehicle:SetThirdPersonMode(enable) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the throttle of the vehicle. It is possible that this function does not work with a valid driver in it.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetThrottle)
---@param throttle number The new throttle.
function Vehicle:SetThrottle(throttle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Sets the vehicle class name.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleClass)
---@param class string The vehicle class name to set
function Vehicle:SetVehicleClass(class) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether the entry or exit camera animation should be played or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleEntryAnim)
---@param bOn boolean Whether the entry or exit camera animation should be played or not.
function Vehicle:SetVehicleEntryAnim(bOn) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the vehicle parameters for given vehicle.
---
--- **NOTE**: Not all variables from the [Structures/VehicleParams](https://wiki.facepunch.com/gmod/Structures/VehicleParams) can be set.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleParams)
---@param params table The new new vehicle parameters. See Structures/VehicleParams.
function Vehicle:SetVehicleParams(params) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets friction of given wheel.  This function may be broken.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:SetWheelFriction)
---@param wheel number The wheel to change the friction of
---@param friction number The new friction to set
function Vehicle:SetWheelFriction(wheel, friction) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts or stops the engine.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vehicle:StartEngine)
---@param start boolean True to start, false to stop.
function Vehicle:StartEngine(start) end
