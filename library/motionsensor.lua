---@meta

--- Functions related to Kinect for Windows usage in GMod.
--- **WARNING**: Kinect feature works only on 32-bit version of the game.
motionsensor = {}

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called to build the skeleton. See [Using The Kinect](https://wiki.facepunch.com/gmod/Using The Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect developing).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton)
---@param translator table `list.Get( "SkeletonConvertor" )` and motionsensor.ChooseBuilderFromEntity.
---@param player Player The player to get motion sensor positions from.
---@param rotation Angle Global rotation of the player?
---@return Vector # Position
---@return Angle # Angles
---@return table # Sensor
function motionsensor.BuildSkeleton(translator, player, rotation) end

---[SHARED]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ChooseBuilderFromEntity)
---@param ent Entity Entity to choose builder for
---@return string # Chosen builder. The builders are stored in `list.Get( "SkeletonConvertor" )`
function motionsensor.ChooseBuilderFromEntity(ent) end

---[CLIENT AND MENU] Returns the depth map material.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.GetColourMaterial)
---@return IMaterial # The material
function motionsensor.GetColourMaterial() end

---[CLIENT] Returns players skeletal data if they are using Kinect. See [Using The Kinect](https://wiki.facepunch.com/gmod/Using The Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect developing).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.GetSkeleton)
---@return table # The skeleton data.
function motionsensor.GetSkeleton() end

---[CLIENT] Return whether a kinect is connected - and active (ie - Start has been called).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.IsActive)
---@return boolean # Connected and active or not
function motionsensor.IsActive() end

---[CLIENT AND MENU] Returns true if we have detected that there's a kinect connected to the PC
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.IsAvailable)
---@return boolean # Connected or not
function motionsensor.IsAvailable() end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [motionsensor.ProcessAnglesTable](https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using The Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect developing).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ProcessAngle)
---@param translator table
---@param sensor table
---@param pos Vector
---@param ang Angle
---@param special_vectors table
---@param boneid number
---@param v table
---@return boolean # Return nil on failure
function motionsensor.ProcessAngle(translator, sensor, pos, ang, special_vectors, boneid, v) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [motionsensor.BuildSkeleton](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using The Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect developing).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable)
---@param translator table
---@param sensor table
---@param pos Vector
---@param rotation Angle
---@return table # Ang. If `!translator.AnglesTable` then `return {}`
function motionsensor.ProcessAnglesTable(translator, sensor, pos, rotation) end

---[SHARED] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used internally by [motionsensor.BuildSkeleton](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton). See [Using The Kinect](https://wiki.facepunch.com/gmod/Using The Kinect) and [Kinect developing](https://wiki.facepunch.com/gmod/Kinect developing).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ProcessPositionTable)
---@param translator table
---@param sensor table
---@return table # Positions. if `!translator.PositionTable` then return - `{}`
function motionsensor.ProcessPositionTable(translator, sensor) end

---[CLIENT AND MENU] This starts access to the kinect sensor. Note that this usually freezes the game for a couple of seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.Start)
---@return boolean # `true` if the access has been started
function motionsensor.Start() end

---[CLIENT] Stops the motion capture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.Stop)
function motionsensor.Stop() end
