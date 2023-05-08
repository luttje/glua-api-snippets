---@meta

motionsensor = {}

---[SHARED]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.BuildSkeleton)
---@param translator table
---@param player Player
---@param rotation Angle
---@return Vector, Angle, table #Vector - Pos
---@return Vector, Angle, table #Angle - ang
---@return Vector, Angle, table #table - sensor
function motionsensor.BuildSkeleton(translator, player, rotation) end

---[SHARED]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ChooseBuilderFromEntity)
---@param ent Entity Entity to choose builder for
---@return string #Chosen builder
function motionsensor.ChooseBuilderFromEntity(ent) end

---[CLIENT AND MENU] Returns the depth map material.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.GetColourMaterial)
---@return IMaterial #The material
function motionsensor.GetColourMaterial() end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.GetSkeleton)
function motionsensor.GetSkeleton() end

---[CLIENT] Return whether a kinect is connected - and active (ie - Start has been called).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.IsActive)
---@return boolean #Connected and active or not
function motionsensor.IsActive() end

---[CLIENT AND MENU] Returns true if we have detected that there's a kinect connected to the PC
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.IsAvailable)
---@return boolean #Connected or not
function motionsensor.IsAvailable() end

---[SHARED]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ProcessAngle)
---@param translator table
---@param sensor table
---@param pos Vector
---@param ang Angle
---@param special_vectors table
---@param boneid number
---@param v table
---@return boolean #Return nil on failure
function motionsensor.ProcessAngle(translator, sensor, pos, ang, special_vectors, boneid, v) end

---[SHARED]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ProcessAnglesTable)
---@param translator table
---@param sensor table
---@param pos Vector
---@param rotation Angle
---@return Angle #Ang. If !translator.AnglesTable then return - {}
function motionsensor.ProcessAnglesTable(translator, sensor, pos, rotation) end

---[SHARED]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.ProcessPositionTable)
---@param translator table
---@param sensor table
---@return Vector #Pos. if !translator.PositionTable then return - {}
function motionsensor.ProcessPositionTable(translator, sensor) end

---[CLIENT AND MENU] This starts access to the kinect sensor. Note that this usually freezes the game for a couple of seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.Start)
---@return boolean #`true` if the access has been started
function motionsensor.Start() end

---[CLIENT] Stops the motion capture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/motionsensor.Stop)
function motionsensor.Stop() end
