---@meta

--- This class is essentially what controls a [NextBot](https://wiki.facepunch.com/gmod/NextBot) NPC. You can access it in a [NextBot](https://wiki.facepunch.com/gmod/NextBot) NPC by using **self.loco** variable.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion)
---@class CLuaLocomotion
local CLuaLocomotion = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Moves the [NextBot](https://wiki.facepunch.com/gmod/NextBot) incrementally closer to the provided goal location.
---
--- Each time this function is called, the NextBot moves towards the goal position passed as an argument by the amount previously set by [CLuaLocomotion:SetDesiredSpeed](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDesiredSpeed).
---
--- To achieve smooth movement, this function must be called frequently.
--- This is commonly accomplished by calling it in the [ENTITY:Think](https://wiki.facepunch.com/gmod/ENTITY:Think) hook.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:Approach)
---@param goal Vector The vector we want to get to.
---@param goalWeight number How influential the movement should be, in case of this function being called multiple times in between physical movements of the entity.
---
--- If unsure then set this to `1`.
function CLuaLocomotion:Approach(goal, goalWeight) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes the stuck status from the bot
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:ClearStuck)
function CLuaLocomotion:ClearStuck() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the direction we want to face
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:FaceTowards)
---@param goal Vector The vector we want to face
function CLuaLocomotion:FaceTowards(goal) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the acceleration speed
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetAcceleration)
---@return number # Current acceleration speed
function CLuaLocomotion:GetAcceleration() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the Nextbot is allowed to avoid obstacles or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetAvoidAllowed)
---@return boolean # Whether this bot is allowed to try to avoid obstacles.
function CLuaLocomotion:GetAvoidAllowed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the Nextbot is allowed to climb or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetClimbAllowed)
---@return boolean # Whether this bot is allowed to climb.
function CLuaLocomotion:GetClimbAllowed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current acceleration as a vector
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetCurrentAcceleration)
---@return Vector # Current acceleration
function CLuaLocomotion:GetCurrentAcceleration() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gets the height the bot is scared to fall from
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDeathDropHeight)
---@return number # Current death drop height
function CLuaLocomotion:GetDeathDropHeight() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gets the deceleration speed
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDeceleration)
---@return number # Current deceleration speed
function CLuaLocomotion:GetDeceleration() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the desired movement speed set by [CLuaLocomotion:SetDesiredSpeed](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDesiredSpeed)
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetDesiredSpeed)
---@return number # The desired movement speed.
function CLuaLocomotion:GetDesiredSpeed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the locomotion's gravity.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGravity)
---@return number # The gravity.
function CLuaLocomotion:GetGravity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Return unit vector in XY plane describing our direction of motion - even if we are currently not moving
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGroundMotionVector)
---@return Vector # A vector representing the X and Y movement
function CLuaLocomotion:GetGroundMotionVector() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current ground normal.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetGroundNormal)
---@return Vector # The current ground normal.
function CLuaLocomotion:GetGroundNormal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the Nextbot is allowed to jump gaps or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetJumpGapsAllowed)
---@return boolean # Whether this bot is allowed to jump gaps.
function CLuaLocomotion:GetJumpGapsAllowed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gets the height of the bot's jump
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetJumpHeight)
---@return number # Current jump height
function CLuaLocomotion:GetJumpHeight() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns maximum jump height of this [CLuaLocomotion](https://wiki.facepunch.com/gmod/CLuaLocomotion).
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetMaxJumpHeight)
---@return number # The maximum jump height.
function CLuaLocomotion:GetMaxJumpHeight() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the max rate at which the NextBot can visually rotate.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetMaxYawRate)
---@return number # Maximum yaw rate
function CLuaLocomotion:GetMaxYawRate() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the [NextBot](https://wiki.facepunch.com/gmod/NextBot) this locomotion is associated with.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetNextBot)
---@return NextBot # The nextbot
function CLuaLocomotion:GetNextBot() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Gets the max height the bot can step up
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetStepHeight)
---@return number # Current step height
function CLuaLocomotion:GetStepHeight() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current movement velocity as a vector
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:GetVelocity)
---@return Vector # Current velocity
function CLuaLocomotion:GetVelocity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CLuaLocomotion](https://wiki.facepunch.com/gmod/CLuaLocomotion) can reach and/or traverse/move in given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsAreaTraversable)
---@param area CNavArea The area to test
---@return boolean # Whether this CLuaLocomotion can traverse given CNavArea.
function CLuaLocomotion:IsAreaTraversable(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if we're trying to move.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsAttemptingToMove)
---@return boolean # Whether we're trying to move or not.
function CLuaLocomotion:IsAttemptingToMove() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true of the locomotion engine is jumping or climbing
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsClimbingOrJumping)
---@return boolean # Whether we're climbing or jumping or not
function CLuaLocomotion:IsClimbingOrJumping() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the nextbot this locomotion is attached to is on ground or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsOnGround)
---@return boolean # Whether the nextbot is on ground or not.
function CLuaLocomotion:IsOnGround() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if we're stuck
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsStuck)
---@return boolean # Whether we're stuck or not
function CLuaLocomotion:IsStuck() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether or not the target in question is on a ladder or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:IsUsingLadder)
---@return boolean # If the target is on a ladder or not.
function CLuaLocomotion:IsUsingLadder() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes the bot jump. It must be on ground ([Entity:IsOnGround](https://wiki.facepunch.com/gmod/Entity:IsOnGround)) and its model must have `ACT_JUMP` activity.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:Jump)
---@param act? number The activity to use as the jumping animation.
function CLuaLocomotion:Jump(act) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Makes the bot jump across a gap. The bot must be on ground ([Entity:IsOnGround](https://wiki.facepunch.com/gmod/Entity:IsOnGround)) and its model must have `ACT_JUMP` activity.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:JumpAcrossGap)
---@param landingGoal Vector
---@param landingForward Vector
function CLuaLocomotion:JumpAcrossGap(landingGoal, landingForward) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the acceleration speed
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetAcceleration)
---@param speed? number Speed acceleration
function CLuaLocomotion:SetAcceleration(speed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether the Nextbot is allowed try to to avoid obstacles or not. This is used during path generation. Works similarly to `nb_allow_avoiding` convar. By default bots are allowed to try to avoid obstacles.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetAvoidAllowed)
---@param allowed boolean Whether this bot should be allowed to try to avoid obstacles.
function CLuaLocomotion:SetAvoidAllowed(allowed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether the Nextbot is allowed to climb or not. This is used during path generation. Works similarly to `nb_allow_climbing` convar. By default bots are allowed to climb.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetClimbAllowed)
---@param allowed boolean Whether this bot should be allowed to climb.
function CLuaLocomotion:SetClimbAllowed(allowed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the height the bot is scared to fall from.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDeathDropHeight)
---@param height? number Height
function CLuaLocomotion:SetDeathDropHeight(height) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the deceleration speed.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDeceleration)
---@param deceleration? number New deceleration speed.
function CLuaLocomotion:SetDeceleration(deceleration) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets how far the NextBot will need to move each time [CLuaLocomotion:Approach](https://wiki.facepunch.com/gmod/CLuaLocomotion:Approach) is called to move at given speed.
---
--- The default amount is 0. This means the bot will not move if this value has not been set.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetDesiredSpeed)
---@param speed? number The new desired speed
function CLuaLocomotion:SetDesiredSpeed(speed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the locomotion's gravity.
---
--- **NOTE**: With values 0 or below, or even lower positive values, the nextbot will start to drift sideways, use [CLuaLocomotion:SetVelocity](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetVelocity) to counteract this.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetGravity)
---@param gravity? number New gravity to set.
function CLuaLocomotion:SetGravity(gravity) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets whether the Nextbot is allowed to jump gaps or not. This is used during path generation. Works similarly to `nb_allow_gap_jumping` convar. By default bots are allowed to jump gaps.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetJumpGapsAllowed)
---@param allowed boolean Whether this bot should be allowed to jump gaps.
function CLuaLocomotion:SetJumpGapsAllowed(allowed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the height of the bot's jump
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetJumpHeight)
---@param height? number Height
function CLuaLocomotion:SetJumpHeight(height) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the max rate at which the NextBot can visually rotate. This will not affect moving or pathing.
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetMaxYawRate)
---@param yawRate? number Desired new maximum yaw rate
function CLuaLocomotion:SetMaxYawRate(yawRate) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the max height the bot can step up
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetStepHeight)
---@param height? number Height
function CLuaLocomotion:SetStepHeight(height) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the current movement velocity
---
---[View wiki](https://wiki.facepunch.com/gmod/CLuaLocomotion:SetVelocity)
---@param velocity Vector
function CLuaLocomotion:SetVelocity(velocity) end
