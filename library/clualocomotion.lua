---@meta

--- This class is essentially what controls a NextBot NPC. You can access it in a NextBot NPC by using **self.loco** variable.
---@class CLuaLocomotion
local CLuaLocomotion = {}

---[SERVER] Sets the location we want to get to.
---
--- Each call of CLuaLocomotion:Approach moves the NextBot 1 unit towards the specified goal. The size of this unit is determined by CLuaLocomotion:SetDesiredSpeed; the default is `0` (each call of CLuaLocomotion:Approach moves the NextBot 0).
---
--- To achieve smooth movement with CLuaLocomotion:Approach, it should be called in a hook like ENTITY:Think, as shown in the example.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:Approach)
---@param goal Vector The vector we want to get to.
---@param goalweight number If unsure then set this to `1`.
function CLuaLocomotion:Approach(goal, goalweight) end

---[SERVER] Removes the stuck status from the bot
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:ClearStuck)
function CLuaLocomotion:ClearStuck() end

---[SERVER] Sets the direction we want to face
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:FaceTowards)
---@param goal Vector The vector we want to face
function CLuaLocomotion:FaceTowards(goal) end

---[SERVER] Returns the acceleration speed
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetAcceleration)
---@return number # Current acceleration speed
function CLuaLocomotion:GetAcceleration() end

---[SERVER] Returns whether the Nextbot is allowed to avoid obstacles or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetAvoidAllowed)
---@return boolean # Whether this bot is allowed to try to avoid obstacles.
function CLuaLocomotion:GetAvoidAllowed() end

---[SERVER] Returns whether the Nextbot is allowed to climb or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetClimbAllowed)
---@return boolean # Whether this bot is allowed to climb.
function CLuaLocomotion:GetClimbAllowed() end

---[SERVER] Returns the current acceleration as a vector
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetCurrentAcceleration)
---@return Vector # Current acceleration
function CLuaLocomotion:GetCurrentAcceleration() end

---[SERVER] Gets the height the bot is scared to fall from
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDeathDropHeight)
---@return number # Current death drop height
function CLuaLocomotion:GetDeathDropHeight() end

---[SERVER] Gets the deceleration speed
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDeceleration)
---@return number # Current deceleration speed
function CLuaLocomotion:GetDeceleration() end

---[SERVER] Returns the desired movement speed set by CLuaLocomotion:SetDesiredSpeed
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDesiredSpeed)
---@return number # The desired movement speed.
function CLuaLocomotion:GetDesiredSpeed() end

---[SERVER] Returns the locomotion's gravity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGravity)
---@return number # The gravity.
function CLuaLocomotion:GetGravity() end

---[SERVER] Return unit vector in XY plane describing our direction of motion - even if we are currently not moving
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGroundMotionVector)
---@return Vector # A vector representing the X and Y movement
function CLuaLocomotion:GetGroundMotionVector() end

---[SERVER] Returns the current ground normal.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGroundNormal)
---@return Vector # The current ground normal.
function CLuaLocomotion:GetGroundNormal() end

---[SERVER] Returns whether the Nextbot is allowed to jump gaps or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetJumpGapsAllowed)
---@return boolean # Whether this bot is allowed to jump gaps.
function CLuaLocomotion:GetJumpGapsAllowed() end

---[SERVER] Gets the height of the bot's jump
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetJumpHeight)
---@return number # Current jump height
function CLuaLocomotion:GetJumpHeight() end

---[SERVER] Returns maximum jump height of this CLuaLocomotion.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetMaxJumpHeight)
---@return number # The maximum jump height.
function CLuaLocomotion:GetMaxJumpHeight() end

---[SERVER] Returns the max rate at which the NextBot can visually rotate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetMaxYawRate)
---@return number # Maximum yaw rate
function CLuaLocomotion:GetMaxYawRate() end

---[SERVER] Returns the NextBot this locomotion is associated with.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetNextBot)
---@return NextBot # The nextbot
function CLuaLocomotion:GetNextBot() end

---[SERVER] Gets the max height the bot can step up
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetStepHeight)
---@return number # Current step height
function CLuaLocomotion:GetStepHeight() end

---[SERVER] Returns the current movement velocity as a vector
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetVelocity)
---@return Vector # Current velocity
function CLuaLocomotion:GetVelocity() end

---[SERVER] Returns whether this CLuaLocomotion can reach and/or traverse/move in given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsAreaTraversable)
---@param area CNavArea The area to test
---@return boolean # Whether this CLuaLocomotion can traverse given CNavArea.
function CLuaLocomotion:IsAreaTraversable(area) end

---[SERVER] Returns true if we're trying to move.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsAttemptingToMove)
---@return boolean # Whether we're trying to move or not.
function CLuaLocomotion:IsAttemptingToMove() end

---[SERVER] Returns true of the locomotion engine is jumping or climbing
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsClimbingOrJumping)
---@return boolean # Whether we're climbing or jumping or not
function CLuaLocomotion:IsClimbingOrJumping() end

---[SERVER] Returns whether the nextbot this locomotion is attached to is on ground or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsOnGround)
---@return boolean # Whether the nextbot is on ground or not.
function CLuaLocomotion:IsOnGround() end

---[SERVER] Returns true if we're stuck
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsStuck)
---@return boolean # Whether we're stuck or not
function CLuaLocomotion:IsStuck() end

---[SERVER] Returns whether or not the target in question is on a ladder or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsUsingLadder)
---@return boolean # If the target is on a ladder or not.
function CLuaLocomotion:IsUsingLadder() end

---[SERVER] Makes the bot jump. It must be on ground (Entity:IsOnGround) and its model must have `ACT_JUMP` activity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:Jump)
---@param act? number The activity to use as the jumping animation.
function CLuaLocomotion:Jump(act) end

---[SERVER] Makes the bot jump across a gap. The bot must be on ground (Entity:IsOnGround) and its model must have `ACT_JUMP` activity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:JumpAcrossGap)
---@param landingGoal Vector
---@param landingForward Vector
function CLuaLocomotion:JumpAcrossGap(landingGoal, landingForward) end

---[SERVER] Sets the acceleration speed
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetAcceleration)
---@param speed number Speed acceleration (default is 400)
function CLuaLocomotion:SetAcceleration(speed) end

---[SERVER] Sets whether the Nextbot is allowed try to to avoid obstacles or not. This is used during path generation. Works similarly to `nb_allow_avoiding` convar. By default bots are allowed to try to avoid obstacles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetAvoidAllowed)
---@param allowed boolean Whether this bot should be allowed to try to avoid obstacles.
function CLuaLocomotion:SetAvoidAllowed(allowed) end

---[SERVER] Sets whether the Nextbot is allowed to climb or not. This is used during path generation. Works similarly to `nb_allow_climbing` convar. By default bots are allowed to climb.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetClimbAllowed)
---@param allowed boolean Whether this bot should be allowed to climb.
function CLuaLocomotion:SetClimbAllowed(allowed) end

---[SERVER] Sets the height the bot is scared to fall from.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDeathDropHeight)
---@param height number Height (default is 200)
function CLuaLocomotion:SetDeathDropHeight(height) end

---[SERVER] Sets the deceleration speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDeceleration)
---@param deceleration number New deceleration speed (default is 400)
function CLuaLocomotion:SetDeceleration(deceleration) end

---[SERVER] Sets movement speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDesiredSpeed)
---@param speed number The new desired speed
function CLuaLocomotion:SetDesiredSpeed(speed) end

---[SERVER] Sets the locomotion's gravity.
---
--- With values 0 or below, or even lower positive values, the nextbot will start to drift sideways, use CLuaLocomotion:SetVelocity to counteract this.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetGravity)
---@param gravity number New gravity to set. Default is 1000.
function CLuaLocomotion:SetGravity(gravity) end

---[SERVER] Sets whether the Nextbot is allowed to jump gaps or not. This is used during path generation. Works similarly to `nb_allow_gap_jumping` convar. By default bots are allowed to jump gaps.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetJumpGapsAllowed)
---@param allowed boolean Whether this bot should be allowed to jump gaps.
function CLuaLocomotion:SetJumpGapsAllowed(allowed) end

---[SERVER] Sets the height of the bot's jump
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetJumpHeight)
---@param height number Height (default is 58)
function CLuaLocomotion:SetJumpHeight(height) end

---[SERVER] Sets the max rate at which the NextBot can visually rotate. This will not affect moving or pathing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetMaxYawRate)
---@param yawRate number Desired new maximum yaw rate
function CLuaLocomotion:SetMaxYawRate(yawRate) end

---[SERVER] Sets the max height the bot can step up
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetStepHeight)
---@param height number Height (default is 18)
function CLuaLocomotion:SetStepHeight(height) end

---[SERVER] Sets the current movement velocity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetVelocity)
---@param velocity Vector
function CLuaLocomotion:SetVelocity(velocity) end
