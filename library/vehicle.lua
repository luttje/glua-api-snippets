---@meta

--- This is a list of all methods only available for vehicles. It is also possible to call [Entity](https://wiki.facepunch.com/gmod/Entity) functions on vehicles.
---@class Vehicle : Entity
local Vehicle = {}

---[SERVER] Returns the remaining boosting time left.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:BoostTimeLeft)
---@return number # The remaining boosting time left
function Vehicle:BoostTimeLeft() end

---[SERVER] Tries to find an Exit Point for leaving vehicle, if one is unobstructed in the direction given.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:CheckExitPoint)
---@param yaw number Yaw/roll from vehicle angle to check for exit
---@param distance number Distance from origin to drop player
---@return Vector # Returns the vector for exit position or nil if cannot exit that way.
function Vehicle:CheckExitPoint(yaw, distance) end

---[SERVER] Sets whether the engine is enabled or disabled, i.e. can be started or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:EnableEngine)
---@param enable boolean Enable or disable the engine
function Vehicle:EnableEngine(enable) end

---[CLIENT] Returns information about the ammo of the vehicle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetAmmo)
---@return number # Ammo type of the vehicle ammo
---@return number # Clip size
---@return number # Count
function Vehicle:GetAmmo() end

---[SHARED] Returns third person camera distance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetCameraDistance)
---@return number # Camera distance
function Vehicle:GetCameraDistance() end

---[SHARED] Gets the driver of the vehicle, returns `NULL` if no driver is present.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetDriver)
---@return Entity # The driver of the vehicle.
function Vehicle:GetDriver() end

---[SERVER] Returns the current speed of the vehicle in Half-Life Hammer Units (in/s). Same as Entity:GetVelocity + Vector:Length.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetHLSpeed)
---@return number # The speed of the vehicle
function Vehicle:GetHLSpeed() end

---[SERVER] Returns the max speed of the vehicle in MPH.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetMaxSpeed)
---@return number # The max speed of the vehicle in MPH
function Vehicle:GetMaxSpeed() end

---[SERVER] Returns some info about the vehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetOperatingParams)
---@return table # The operating params. See Structures/OperatingParams.
function Vehicle:GetOperatingParams() end

---[SHARED] Gets the passenger of the vehicle, returns NULL if no drivers is present.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetPassenger)
---@param passenger number The index of the passenger
---@return Entity # The passenger
function Vehicle:GetPassenger(passenger) end

---[SERVER] Returns the seat position and angle of a given passenger seat.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetPassengerSeatPoint)
---@param role number The passenger role. ( 1 is the driver )
---@return Vector # The seat position
---@return Angle # The seat angle
function Vehicle:GetPassengerSeatPoint(role) end

---[SERVER] Returns the current RPM of the vehicle. This value is fake and doesn't actually affect the vehicle movement.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetRPM)
---@return number # The RPM.
function Vehicle:GetRPM() end

---[SERVER] Returns the current speed of the vehicle in MPH.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetSpeed)
---@return number # The speed of the vehicle in MPH
function Vehicle:GetSpeed() end

---[SERVER] Returns the current steering of the vehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetSteering)
---@return number # The current steering of the vehicle.
function Vehicle:GetSteering() end

---[SERVER] Returns the maximum steering degree of the vehicle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetSteeringDegrees)
---@return number # The maximum steering degree of the vehicle
function Vehicle:GetSteeringDegrees() end

---[SHARED] Returns if vehicle has thirdperson mode enabled or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetThirdPersonMode)
---@return boolean # Returns true if third person mode enabled, false otherwise
function Vehicle:GetThirdPersonMode() end

---[SERVER] Returns the current throttle of the vehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetThrottle)
---@return number # The current throttle of the vehicle
function Vehicle:GetThrottle() end

---[SHARED] Returns the vehicle class name. This is only useful for Sandbox spawned vehicles or any vehicle that properly sets the vehicle class with Vehicle:SetVehicleClass.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetVehicleClass)
---@return string # The class name of the vehicle.
function Vehicle:GetVehicleClass() end

---[SERVER] Returns the vehicle parameters of given vehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetVehicleParams)
---@return table # The vehicle parameters. See Structures/VehicleParams
function Vehicle:GetVehicleParams() end

---[SHARED] Returns the view position and forward angle of a given passenger seat.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetVehicleViewPosition)
---@param role? number The passenger role. 0 is the driver. This parameter seems to be ignored by the game engine and is therefore optional.
---@return Vector # The view position, will be 0, 0, 0 on failure
---@return Angle # The view angles, will be 0, 0, 0 on failure
---@return number # The field of view, will be 0 on failure
function Vehicle:GetVehicleViewPosition(role) end

---[SERVER] Returns the PhysObj of given wheel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetWheel)
---@param wheel number The wheel to retrieve
---@return PhysObj # The wheel
function Vehicle:GetWheel(wheel) end

---[SERVER] Returns the base wheel height.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetWheelBaseHeight)
---@param wheel number The wheel to get the base wheel height of.
---@return number # The base wheel height.
function Vehicle:GetWheelBaseHeight(wheel) end

---[SERVER] Returns the wheel contact point.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetWheelContactPoint)
---@param wheel number The wheel to check
---@return Vector # The contact position
---@return number # The Surface Properties ID of hit surface.
---@return boolean # Whether the wheel is on ground or not
function Vehicle:GetWheelContactPoint(wheel) end

---[SERVER] Returns the wheel count of the vehicle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetWheelCount)
---@return number # The amount of wheels
function Vehicle:GetWheelCount() end

---[SERVER] Returns the total wheel height.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:GetWheelTotalHeight)
---@param wheel number The wheel to get the base wheel height of.
---@return number # The total wheel height.
function Vehicle:GetWheelTotalHeight(wheel) end

---[SERVER] Returns whether this vehicle has boost at all.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:HasBoost)
---@return boolean # Whether this vehicle has boost at all.
function Vehicle:HasBoost() end

---[SERVER] Returns whether this vehicle has a brake pedal. See Vehicle:SetHasBrakePedal.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:HasBrakePedal)
---@return boolean # Whether this vehicle has a brake pedal or not.
function Vehicle:HasBrakePedal() end

---[SERVER] Returns whether this vehicle is currently boosting or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:IsBoosting)
---@return boolean # Whether this vehicle is currently boosting or not.
function Vehicle:IsBoosting() end

---[SERVER] Returns whether the engine is enabled or not, i.e. whether it can be started.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:IsEngineEnabled)
---@return boolean # Whether the engine is enabled
function Vehicle:IsEngineEnabled() end

---[SERVER] Returns whether the engine is started or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:IsEngineStarted)
---@return boolean # Whether the engine is started or not.
function Vehicle:IsEngineStarted() end

---[SHARED] Returns true if the vehicle object is a valid or not. This will return `false` when Vehicle functions are not usable on the vehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:IsValidVehicle)
---@return boolean # Is the vehicle a valid vehicle or not
function Vehicle:IsValidVehicle() end

---[SERVER] Returns whether this vehicle's engine is underwater or not. ( Internally the attachment point "engine" or "vehicle_engine" is checked )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:IsVehicleBodyInWater)
---@return boolean # Whether this vehicle's engine is underwater or not.
function Vehicle:IsVehicleBodyInWater() end

---[SERVER] Releases the vehicle's handbrake (Jeep) so it can roll without any passengers.
---
--- This will be overwritten if the vehicle has a driver. Same as Vehicle:SetHandbrake( false )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:ReleaseHandbrake)
function Vehicle:ReleaseHandbrake() end

---[SERVER] Sets the boost. It is possible that this function does not work while the vehicle has a valid driver in it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetBoost)
---@param boost number The new boost value
function Vehicle:SetBoost(boost) end

---[SHARED] Sets the third person camera distance of the vehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetCameraDistance)
---@param distance number Camera distance to set to
function Vehicle:SetCameraDistance(distance) end

---[SERVER] Turns on or off the Jeep handbrake so it can roll without a driver inside.
---
--- Does nothing while the vehicle has a driver in it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetHandbrake)
---@param handbrake boolean true to turn on, false to turn off.
function Vehicle:SetHandbrake(handbrake) end

---[SERVER] Sets whether this vehicle has a brake pedal.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetHasBrakePedal)
---@param brakePedal boolean Whether this vehicle has a brake pedal
function Vehicle:SetHasBrakePedal(brakePedal) end

---[SERVER] Sets maximum reverse throttle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetMaxReverseThrottle)
---@param maxRevThrottle number The new maximum throttle. This number must be negative.
function Vehicle:SetMaxReverseThrottle(maxRevThrottle) end

---[SERVER] Sets maximum forward throttle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetMaxThrottle)
---@param maxThrottle number The new maximum throttle.
function Vehicle:SetMaxThrottle(maxThrottle) end

---[SERVER] Sets spring length of given wheel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetSpringLength)
---@param wheel number The wheel to change spring length of
---@param length number The new spring length
function Vehicle:SetSpringLength(wheel, length) end

---[SERVER] Sets the steering of the vehicle.
--- The correct range, 0 to 1 or -1 to 1
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetSteering)
---@param front number Angle of the front wheels (-1 to 1)
---@param rear number Angle of the rear wheels (-1 to 1)
function Vehicle:SetSteering(front, rear) end

---[SERVER] Sets the maximum steering degrees of the vehicle
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetSteeringDegrees)
---@param steeringDegrees number The new maximum steering degree
function Vehicle:SetSteeringDegrees(steeringDegrees) end

---[SHARED] Sets the third person mode state.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetThirdPersonMode)
---@param enable boolean Enable or disable the third person mode for this vehicle
function Vehicle:SetThirdPersonMode(enable) end

---[SERVER] Sets the throttle of the vehicle. It is possible that this function does not work with a valid driver in it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetThrottle)
---@param throttle number The new throttle.
function Vehicle:SetThrottle(throttle) end

---[SHARED] Sets the vehicle class name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleClass)
---@param class string The vehicle class name to set
function Vehicle:SetVehicleClass(class) end

---[SERVER] Sets whether the entry or exit camera animation should be played or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleEntryAnim)
---@param bOn boolean Whether the entry or exit camera animation should be played or not.
function Vehicle:SetVehicleEntryAnim(bOn) end

---[SERVER] Sets the vehicle parameters for given vehicle.
---
--- Not all variables from the Structures/VehicleParams can be set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetVehicleParams)
---@param params table The new new vehicle parameters. See Structures/VehicleParams.
function Vehicle:SetVehicleParams(params) end

---[SERVER] Sets friction of given wheel.  This function may be broken.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:SetWheelFriction)
---@param wheel number The wheel to change the friction of
---@param friction number The new friction to set
function Vehicle:SetWheelFriction(wheel, friction) end

---[SERVER] Starts or stops the engine.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Vehicle:StartEngine)
---@param start boolean True to start, false to stop.
function Vehicle:StartEngine(start) end
