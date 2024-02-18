---@meta

--- NextBots are a new system to create NPCs in the Source Engine, utilizing the more powerful navmesh system for navigation over the old node based system.
---
--- This page lists all possible functions usable with NextBots.
---
--- See NextBot NPC Creation for more information on how to create NextBot NPCs.
---@class NextBot : Entity
local NextBot = {}

---
--- The list of hooks for nextbot NPCs.
---
---@class NEXTBOT : NextBot
NEXTBOT = {}

---[SERVER] Become a ragdoll and remove the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:BecomeRagdoll)
---@param info CTakeDamageInfo Damage info passed from an onkilled event
---@return Entity # The created ragdoll, if any.
function NextBot:BecomeRagdoll(info) end

---[SERVER] Called to initialize the behaviour.
---
--- 		This is called automatically when the NextBot is created, you should not call it manually.
---
--- 		You shouldn't override this unless you know what you are doing - it's used to kick off the coroutine that runs the bot's behaviour. See NEXTBOT:RunBehaviour instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:BehaveStart)
function NEXTBOT:BehaveStart() end

---[SERVER] Called to update the bot's behaviour.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:BehaveUpdate)
---@param interval number How long since the last update
function NEXTBOT:BehaveUpdate(interval) end

---[SERVER] Should only be called in NEXTBOT:BodyUpdate. This sets the `move_x` and `move_y` pose parameters of the bot to fit how they're currently moving, sets the animation speed (Entity:GetPlaybackRate) to suit the ground speed, and calls Entity:FrameAdvance.
---
--- This function might cause crashes with some activities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:BodyMoveXY)
function NextBot:BodyMoveXY() end

---[SERVER] Called to update the bot's animation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:BodyUpdate)
function NEXTBOT:BodyUpdate() end

---[SERVER] Clears this bot's last known area. See NextBot:GetLastKnownArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:ClearLastKnownArea)
function NextBot:ClearLastKnownArea() end

---[SERVER] Like NextBot:FindSpots but only returns a vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:FindSpot)
---@param type string Either `"random"`, `"near"`, `"far"`.
---@param options table This table should contain the search info.
--- * string type - The type (Only `hiding` for now)
--- * Vector pos - the position to search.
--- * number radius - the radius to search.
--- * number stepup - the highest step to step up.
--- * number stepdown - the highest we can step down without being hurt.
---@return Vector # If it finds a spot it will return a vector. If not it will return nil.
function NextBot:FindSpot(type, options) end

---[SERVER] Returns a table of hiding spots.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:FindSpots)
---@param specs table This table should contain the search info.
--- * string type - The type (optional, only `hiding` supported)
--- * Vector pos - the position to search.
--- * number radius - the radius to search.
--- * number stepup - the highest step to step up.
--- * number stepdown - the highest we can step down without being hurt.
---@return table # An unsorted table of tables containing: * Vector vector - The position of the hiding spot * number distance - the distance to that position
function NextBot:FindSpots(specs) end

---[SERVER] Returns the currently running activity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:GetActivity)
---@return number # The current activity
function NextBot:GetActivity() end

---[SERVER] Returns the Field of View of the Nextbot NPC, used for its vision functionality, such as NextBot:IsAbleToSee.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:GetFOV)
---@return number # The current FOV of the nextbot
function NextBot:GetFOV() end

---[SERVER] Returns this bots last known area. See also NextBot:ClearLastKnownArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:GetLastKnownArea)
---@return CNavArea # The last area the bot is known to have been in.
function NextBot:GetLastKnownArea() end

---[SERVER] Returns the maximum range the nextbot can see other nextbots/players at. See NextBot:IsAbleToSee.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:GetMaxVisionRange)
---@return number # The current vision range
function NextBot:GetMaxVisionRange() end

---[SERVER] Returns squared distance to an entity or a position.
---
--- See also NextBot:GetRangeTo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:GetRangeSquaredTo)
---@param to Vector The position to measure distance to. Can be an entity.
---@return number # The squared distance
function NextBot:GetRangeSquaredTo(to) end

---[SERVER] Returns the distance to an entity or position.
---
--- See also NextBot:GetRangeSquaredTo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:GetRangeTo)
---@param to Vector The position to measure distance to. Can be an entity.
---@return number # The distance
function NextBot:GetRangeTo(to) end

---[SERVER] Returns the solid mask for given NextBot.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:GetSolidMask)
---@return number # The solid mask, see Enums/CONTENTS and Enums/MASK
function NextBot:GetSolidMask() end

---[SERVER] Called from Lua when the NPC is stuck. This should only be called from the behaviour coroutine - so if you want to override this function and do something special that yields - then go for it.
---
--- You should always call self.loco:ClearStuck() in this function to reset the stuck status - so it knows it's unstuck. See CLuaLocomotion:ClearStuck.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:HandleStuck)
function NextBot:HandleStuck() end

---[SERVER] Returns if the Nextbot NPC can see the give entity or not.
---
--- Using this function creates the nextbot vision interface which will cause a significant performance hit!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee)
---@param ent Entity The entity to test if we can see
---@param useFOV? number Whether to use the Field of View of the Nextbot
---@return boolean # If the nextbot can see or not
function NextBot:IsAbleToSee(ent, useFOV) end

---[SERVER] To be called in the behaviour coroutine only! Will yield until the bot has reached the goal or is stuck
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:MoveToPos)
---@param pos Vector The position we want to get to
---@param options table A table containing a bunch of tweakable options.
--- * number lookahead - Minimum look ahead distance.
--- * number tolerance - How close we must be to the goal before it can be considered complete.
--- * boolean draw - Draw the path. Only visible on listen servers and single player.
--- * number maxage - Maximum age of the path before it times out.
--- * number repath - Rebuilds the path after this number of seconds.
---@return string # Either `"failed"`, `"stuck"`, `"timeout"` or `"ok"` - depending on how the NPC got on
function NextBot:MoveToPos(pos, options) end

---[SERVER] Called when the nextbot touches another entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnContact)
---@param ent Entity The entity the nextbot came in contact with.
function NEXTBOT:OnContact(ent) end

---[SERVER] Called when the nextbot NPC sees another Nextbot NPC or a Player.
--- 		This hook will only run after NextBot:SetFOV or other vision related function is called on the nextbot. See NextBot:IsAbleToSee for more details.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnEntitySight)
---@param ent Entity the entity that was seen
function NEXTBOT:OnEntitySight(ent) end

---[SERVER] Called when the nextbot NPC loses sight of another Nextbot NPC or a Player.
--- 		This hook will only run after NextBot:SetFOV or other vision related function is called on the nextbot. See NextBot:IsAbleToSee for more details.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnEntitySightLost)
---@param ent Entity the entity that we lost sight of
function NEXTBOT:OnEntitySightLost(ent) end

---[SERVER] Called when the bot is ignited.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnIgnite)
function NEXTBOT:OnIgnite() end

---[SERVER] Called when the bot gets hurt. This is a good place to play hurt sounds or voice lines.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnInjured)
---@param info CTakeDamageInfo The damage info
function NEXTBOT:OnInjured(info) end

---[SERVER] Called when the bot gets killed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnKilled)
---@param info CTakeDamageInfo The damage info
function NEXTBOT:OnKilled(info) end

---[SERVER] Called when the bot's feet return to the ground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnLandOnGround)
---@param ent Entity The entity the nextbot has landed on.
function NEXTBOT:OnLandOnGround(ent) end

---[SERVER] Called when the bot's feet leave the ground - for whatever reason.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnLeaveGround)
---@param ent Entity The entity the bot "jumped" from.
function NEXTBOT:OnLeaveGround(ent) end

---[SERVER] Called when the nextbot enters a new navigation area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnNavAreaChanged)
---@param old CNavArea The navigation area the bot just left
---@param new CNavArea The navigation area the bot just entered
function NEXTBOT:OnNavAreaChanged(old, new) end

---[SERVER] Called when someone else or something else has been killed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnOtherKilled)
---@param victim Entity The victim that was killed
---@param info CTakeDamageInfo The damage info
function NEXTBOT:OnOtherKilled(victim, info) end

---[SERVER] Called when the bot thinks it is stuck.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnStuck)
function NEXTBOT:OnStuck() end

---[SERVER] Called when a trace attack is done against the nextbot, allowing override of the damage being dealt by altering the CTakeDamageInfo.
---
--- This is called before NEXTBOT:OnInjured.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnTraceAttack)
---@param info CTakeDamageInfo The damage info
---@param dir Vector The direction the damage goes in
---@param trace table The Structures/TraceResult of the attack, containing the hitgroup.
function NEXTBOT:OnTraceAttack(info, dir, trace) end

---[SERVER] Called when the bot thinks it is un-stuck.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:OnUnStuck)
function NEXTBOT:OnUnStuck() end

---[SERVER] To be called in the behaviour coroutine only! Plays an animation sequence and waits for it to end before returning.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:PlaySequenceAndWait)
---@param name string The sequence name
---@param speed? number Playback Rate of that sequence
function NextBot:PlaySequenceAndWait(name, speed) end

---[SERVER] A hook called to process nextbot logic.
---
--- This hook runs in a coroutine by default. It will only be called if NEXTBOT:BehaveStart is not overriden.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NEXTBOT:RunBehaviour)
function NEXTBOT:RunBehaviour() end

---[SERVER] Sets the Field of View for the Nextbot NPC, used for its vision functionality, such as NextBot:IsAbleToSee.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:SetFOV)
---@param fov number The new FOV
function NextBot:SetFOV(fov) end

---[SERVER] Sets the maximum range the nextbot can see other nextbots/players at. See NextBot:IsAbleToSee.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:SetMaxVisionRange)
---@param range number The new vision range to set.
function NextBot:SetMaxVisionRange(range) end

---[SERVER] Sets the solid mask for given NextBot.
---
--- The default solid mask of a NextBot is Enums/MASK.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:SetSolidMask)
---@param mask number The new mask, see Enums/CONTENTS and Enums/MASK
function NextBot:SetSolidMask(mask) end

---[SERVER] Start doing an activity (animation)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/NextBot:StartActivity)
---@param activity number One of the Enums/ACT
function NextBot:StartActivity(activity) end
