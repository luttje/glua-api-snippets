---@meta

--- Functions related to Kinect for Windows usage in GMod.
--- **WARNING**: Kinect feature works only on 32-bit version of the game.
motionsensor = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called to build the skeleton. See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton)
---@param translator table `list.Get( "SkeletonConvertor" )` and motionsensor.ChooseBuilderFromEntity.
---@param player Player The player to get motion sensor positions from.
---@param rotation Angle Global rotation of the player?
---@return Vector # Position
---@return Angle # Angles
---@return table # Sensor
function motionsensor.BuildSkeleton(translator, player, rotation) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc)
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.ChooseBuilderFromEntity)
---@param ent Entity Entity to choose builder for
---@return string # Chosen builder. The builders are stored in `list.Get( "SkeletonConvertor" )`
function motionsensor.ChooseBuilderFromEntity(ent) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the depth map material.
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.GetColourMaterial)
---@return IMaterial # The material
function motionsensor.GetColourMaterial() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns players skeletal data if they are using Kinect. See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.GetSkeleton)
---@return table # The skeleton data.
function motionsensor.GetSkeleton() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Return whether a kinect is connected - and active (ie - Start has been called).
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.IsActive)
---@return boolean # Connected and active or not
function motionsensor.IsActive() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns true if we have detected that there's a kinect connected to the PC
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.IsAvailable)
---@return boolean # Connected or not
function motionsensor.IsAvailable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [motionsensor.ProcessAnglesTable](https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.ProcessAngle)
---@param translator table
---@param sensor table
---@param pos Vector
---@param ang Angle
---@param special_vectors table
---@param boneid number
---@param v table
---@return boolean # Return nil on failure
function motionsensor.ProcessAngle(translator, sensor, pos, ang, special_vectors, boneid, v) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [motionsensor.BuildSkeleton](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable)
---@param translator table
---@param sensor table
---@param pos Vector
---@param rotation Angle
---@return table # Ang. If `!translator.AnglesTable` then `return {}`
function motionsensor.ProcessAnglesTable(translator, sensor, pos, rotation) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [motionsensor.BuildSkeleton](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using_The_Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect_developing).
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.ProcessPositionTable)
---@param translator table
---@param sensor table
---@return table # Positions. if `!translator.PositionTable` then return - `{}`
function motionsensor.ProcessPositionTable(translator, sensor) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) This starts access to the kinect sensor. Note that this usually freezes the game for a couple of seconds.
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.Start)
---@return boolean # `true` if the access has been started
function motionsensor.Start() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Stops the motion capture.
---
---[View wiki](https://wiki.facepunch.com/gmod/motionsensor.Stop)
function motionsensor.Stop() end
