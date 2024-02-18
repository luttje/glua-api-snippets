---@meta

--- A class used to store the inputs from CUserCmd and other information related to the current movement simulation, such as velocity, position and so on.
---
--- This can only be accessed during GM:SetupMove , GM:Move , GM:PlayerTick and GM:FinishMove.
---@class CMoveData
local CMoveData = {}

---[SHARED] Adds keys to the move data, as if player pressed them.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:AddKey)
---@param keys number Keys to add, see Enums/IN
function CMoveData:AddKey(keys) end

---[SHARED] Gets the aim angle. Seems to be same as CMoveData:GetAngles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetAbsMoveAngles)
---@return Angle # Aiming angle
function CMoveData:GetAbsMoveAngles() end

---[SHARED] Gets the aim angle. On client is the same as Entity:GetAngles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetAngles)
---@return Angle # Aiming angle
function CMoveData:GetAngles() end

---[SHARED] Gets which buttons are down
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetButtons)
---@return number # An integer representing which buttons are down, see Enums/IN
function CMoveData:GetButtons() end

---[SHARED] Returns the center of the player movement constraint. See CMoveData:SetConstraintCenter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetConstraintCenter)
---@return Vector # The constraint origin.
function CMoveData:GetConstraintCenter() end

---[SHARED] Returns the radius that constrains the players movement. See CMoveData:SetConstraintRadius.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetConstraintRadius)
---@return number # The constraint radius
function CMoveData:GetConstraintRadius() end

---[SHARED] Returns the player movement constraint speed scale. See CMoveData:SetConstraintSpeedScale.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetConstraintSpeedScale)
---@return number # The constraint speed scale
function CMoveData:GetConstraintSpeedScale() end

---[SHARED] Returns the width (distance from the edge of the radius, inward) where the actual movement constraint functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetConstraintWidth)
---@return number # The constraint width
function CMoveData:GetConstraintWidth() end

---[SHARED] Returns an internal player movement variable `m_outWishVel`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetFinalIdealVelocity)
---@return Vector #
function CMoveData:GetFinalIdealVelocity() end

---[SHARED] Returns an internal player movement variable `m_outJumpVel`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetFinalJumpVelocity)
---@return Vector #
function CMoveData:GetFinalJumpVelocity() end

---[SHARED] Returns an internal player movement variable `m_outStepHeight`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetFinalStepHeight)
---@return number #
function CMoveData:GetFinalStepHeight() end

---[SHARED] Returns the players forward speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetForwardSpeed)
---@return number # speed
function CMoveData:GetForwardSpeed() end

---[SHARED] Gets the number passed to "impulse" console command
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetImpulseCommand)
---@return number # The impulse
function CMoveData:GetImpulseCommand() end

---[SHARED] Returns the maximum client speed of the player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetMaxClientSpeed)
---@return number # The maximum client speed
function CMoveData:GetMaxClientSpeed() end

---[SHARED] Returns the maximum speed of the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetMaxSpeed)
---@return number # The maximum speed
function CMoveData:GetMaxSpeed() end

---[SHARED] Returns the angle the player is moving at. For more info, see CMoveData:SetMoveAngles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetMoveAngles)
---@return Angle # The move direction
function CMoveData:GetMoveAngles() end

---[SHARED] Gets the aim angle. Only works clientside, server returns same as CMoveData:GetAngles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetOldAngles)
---@return Angle # The aim angle
function CMoveData:GetOldAngles() end

---[SHARED] Get which buttons were down last frame
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetOldButtons)
---@return number # An integer representing which buttons were down, see Enums/IN
function CMoveData:GetOldButtons() end

---[SHARED] Gets the player's position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetOrigin)
---@return Vector # The player's position.
function CMoveData:GetOrigin() end

---[SHARED] Returns the strafe speed of the player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetSideSpeed)
---@return number # speed
function CMoveData:GetSideSpeed() end

---[SHARED] Returns the vertical speed of the player. ( Z axis of CMoveData:GetVelocity )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetUpSpeed)
---@return number # Vertical speed
function CMoveData:GetUpSpeed() end

---[SHARED] Gets the players velocity.
---
--- This will return Vector(0,0,0) sometimes when walking on props.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:GetVelocity)
---@return Vector # The players velocity
function CMoveData:GetVelocity() end

---[SHARED] Returns whether the key is down or not
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:KeyDown)
---@param key number The key to test, see Enums/IN
---@return boolean # Is the key down or not
function CMoveData:KeyDown(key) end

---[SHARED] Returns whether the key was pressed. If you want to check if the key is held down, try CMoveData:KeyDown
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:KeyPressed)
---@param key number The key to test, see Enums/IN
---@return boolean # Was the key pressed or not.
function CMoveData:KeyPressed(key) end

---[SHARED] Returns whether the key was released
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:KeyReleased)
---@param key number A key to test, see Enums/IN
---@return boolean # Was the key released or not.
function CMoveData:KeyReleased(key) end

---[SHARED] Returns whether the key was down or not.
---
---
---
---
--- Unlike CMoveData:KeyDown, it will return false if CMoveData:KeyPressed is true and it will return true if CMoveData:KeyReleased is true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:KeyWasDown)
---@param key number The key to test, see Enums/IN
---@return boolean # Was the key down or not
function CMoveData:KeyWasDown(key) end

---[SHARED] Sets absolute move angles.( ? ) Doesn't seem to do anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetAbsMoveAngles)
---@param ang Angle New absolute move angles
function CMoveData:SetAbsMoveAngles(ang) end

---[SHARED] Sets angles.
---
--- This function does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetAngles)
---@param ang Angle The angles.
function CMoveData:SetAngles(ang) end

---[SHARED] Sets the pressed buttons on the move data
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetButtons)
---@param buttons number A number representing which buttons are down, see Enums/IN
function CMoveData:SetButtons(buttons) end

---[SHARED] Sets the center of the player movement constraint. See CMoveData:SetConstraintRadius.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintCenter)
---@param pos Vector The constraint origin.
function CMoveData:SetConstraintCenter(pos) end

---[SHARED] Sets the radius that constrains the players movement.
---
--- Works with conjunction of:
--- * CMoveData:SetConstraintWidth
--- * CMoveData:SetConstraintSpeedScale
--- * CMoveData:SetConstraintCenter
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintRadius)
---@param radius number The new constraint radius
function CMoveData:SetConstraintRadius(radius) end

---[SHARED] Sets the player movement constraint speed scale. This will be applied to the player within the CMoveData:SetConstraintRadius when approaching its edge.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintSpeedScale)
---@param number number The constraint speed scale
function CMoveData:SetConstraintSpeedScale(number) end

---[SHARED] Sets  the width (distance from the edge of the CMoveData:SetConstraintRadius, inward) where the actual movement constraint functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetConstraintWidth)
---@param number number The constraint width
function CMoveData:SetConstraintWidth(number) end

---[SHARED] Sets an internal player movement variable `m_outWishVel`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetFinalIdealVelocity)
---@param idealVel Vector
function CMoveData:SetFinalIdealVelocity(idealVel) end

---[SHARED] Sets an internal player movement variable `m_outJumpVel`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetFinalJumpVelocity)
---@param jumpVel Vector
function CMoveData:SetFinalJumpVelocity(jumpVel) end

---[SHARED] Sets an internal player movement variable `m_outStepHeight`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetFinalStepHeight)
---@param stepHeight number
function CMoveData:SetFinalStepHeight(stepHeight) end

---[SHARED] Sets players forward speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetForwardSpeed)
---@param speed number New forward speed
function CMoveData:SetForwardSpeed(speed) end

---[SHARED] Sets the impulse command. This isn't actually utilised in the engine anywhere.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetImpulseCommand)
---@param impulse number The impulse to set
function CMoveData:SetImpulseCommand(impulse) end

---[SHARED] Sets the maximum player speed. Player won't be able to run or sprint faster then this value.
---
---
--- This also automatically sets CMoveData:SetMaxSpeed when used in the GM:SetupMove hook. You must set it manually in the GM:Move hook.
---
---
--- This must be called on both client and server to avoid prediction errors.
---
---
--- This will **not** reduce speed in air.
--- Setting this to 0 will not make the player stationary. It won't do anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetMaxClientSpeed)
---@param maxSpeed number The new maximum speed
function CMoveData:SetMaxClientSpeed(maxSpeed) end

---[SHARED] Sets the maximum speed of the player. This must match with CMoveData:SetMaxClientSpeed both, on server and client.
---
---
--- Doesn't seem to be doing anything on it's own, use CMoveData:SetMaxClientSpeed instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetMaxSpeed)
---@param maxSpeed number The new maximum speed
function CMoveData:SetMaxSpeed(maxSpeed) end

---[SHARED] Sets the serverside move angles, making the movement keys act as if player was facing that direction.
---
--- This function is predicted, and should be called shared with matching data on client and server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetMoveAngles)
---@param dir Angle The aim direction.
function CMoveData:SetMoveAngles(dir) end

---[SHARED] Sets old aim angles. ( ? ) Doesn't seem to be doing anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetOldAngles)
---@param aimAng Angle The old angles
function CMoveData:SetOldAngles(aimAng) end

---[SHARED] Sets the 'old' pressed buttons on the move data. These buttons are used to work out which buttons have been released, which have just been pressed and which are being held down.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetOldButtons)
---@param buttons number A number representing which buttons were down, see Enums/IN
function CMoveData:SetOldButtons(buttons) end

---[SHARED] Sets the players position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetOrigin)
---@param pos Vector The position
function CMoveData:SetOrigin(pos) end

---[SHARED] Sets players strafe speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetSideSpeed)
---@param speed number Strafe speed
function CMoveData:SetSideSpeed(speed) end

---[SHARED] Sets vertical speed of the player. ( Z axis of CMoveData:SetVelocity )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetUpSpeed)
---@param speed number Vertical speed to set
function CMoveData:SetUpSpeed(speed) end

---[SHARED] Sets the player's velocity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CMoveData:SetVelocity)
---@param velocity Vector The velocity to set
function CMoveData:SetVelocity(velocity) end
