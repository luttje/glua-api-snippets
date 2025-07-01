---@meta

--- The physenv library allows you to control the physics environment created by the engine, and lets you modify constants such as gravity and maximum velocity.
physenv = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adds a [material surface property](https://developer.valvesoftware.com/wiki/Material_surface_properties) type to the game's physics environment.
---
--- See [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) for the opposite function.
---
--- The game has a limit of 128 surface properties - this includes properties loaded automatically from [surfaceproperties.txt](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/surfaceproperties.txt). Due to this, there's only a small amount of open slots that can be registered with GMod's provided surfaceproperties.txt.
---
--- Does nothing on `x86-64` beta.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.AddSurfaceData)
---@param properties string The properties to add. Each one should include `"base"` or the game will crash due to some values being missing.
function physenv.AddSurfaceData(properties) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the air density used to calculate drag on physics objects.
--- 		The unit is in `kg/m³`.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.GetAirDensity)
---@return number # Default value is 2.
function physenv.GetAirDensity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the gravitational acceleration used for physics objects in `source_unit/s^2`.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.GetGravity)
---@return Vector # Gravity direction and strength.
function physenv.GetGravity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the last simulation duration of the in-game physics.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.GetLastSimulationTime)
---@return number # The last simulation duration of the in-game physics in seconds
function physenv.GetLastSimulationTime() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the current performance settings in table form.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.GetPerformanceSettings)
---@return table # Performance settings or nil if called too early. See Structures/PhysEnvPerformanceSettings
function physenv.GetPerformanceSettings() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the pause status of global physics simulation. See [physenv.SetPhysicsPaused](https://wiki.facepunch.com/gmod/physenv.SetPhysicsPaused) for the setter.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.GetPhysicsPaused)
---@return boolean # `true` if paused.
function physenv.GetPhysicsPaused() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the air density.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.SetAirDensity)
---@param airDensity number The new air density.
function physenv.SetAirDensity(airDensity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the gravitational acceleration used for physics objects. Does not affect players.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.SetGravity)
---@param gravAccel Vector The new gravity in `source_unit/s^2`.
function physenv.SetGravity(gravAccel) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the performance settings.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.SetPerformanceSettings)
---@param performanceSettings table The new performance settings. See Structures/PhysEnvPerformanceSettings
function physenv.SetPerformanceSettings(performanceSettings) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Pauses or unpauses the physics simulation globally. See [physenv.GetPhysicsPaused](https://wiki.facepunch.com/gmod/physenv.GetPhysicsPaused) for the getter.
---
---[View wiki](https://wiki.facepunch.com/gmod/physenv.SetPhysicsPaused)
---@param pause boolean `true` to pause, `false` to unpause.
function physenv.SetPhysicsPaused(pause) end
