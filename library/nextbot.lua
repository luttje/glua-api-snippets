---@meta

--- NextBots are a new system to create NPCs in the Source Engine, utilizing the more powerful [navmesh](https://wiki.facepunch.com/gmod/navmesh) system for navigation over the old node based system.
---
--- This page lists all possible functions usable with NextBots.
---
--- See [NextBot NPC Creation](https://wiki.facepunch.com/gmod/NextBot_NPC_Creation) for more information on how to create NextBot NPCs.
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot)
---@class NextBot : Entity
local NextBot = {}

--- The list of hooks for nextbot NPCs.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT_Hooks)
---@class NEXTBOT : NextBot
NEXTBOT = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Become a ragdoll and remove the entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:BecomeRagdoll)
---@param info CTakeDamageInfo Damage info passed from an onkilled event
---@return Entity # The created ragdoll, if any.
function NextBot:BecomeRagdoll(info) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called to initialize the behaviour.
---
--- This is called automatically when the NextBot is created, you should not call it manually.
---
--- **NOTE**: You shouldn't override this unless you know what you are doing - it's used to kick off the [coroutine](https://wiki.facepunch.com/gmod/coroutine) that runs the bot's behaviour. See [NEXTBOT:RunBehaviour](https://wiki.facepunch.com/gmod/NEXTBOT:RunBehaviour) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:BehaveStart)
function NEXTBOT:BehaveStart() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called to update the bot's behaviour.
---
--- If you override this hook you must call `coroutine.resume(self.BehaveThread)` to resume the [NEXTBOT:RunBehaviour](https://wiki.facepunch.com/gmod/NEXTBOT:RunBehaviour) Behavior
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:BehaveUpdate)
---@param interval number How long since the last update
function NEXTBOT:BehaveUpdate(interval) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Should only be called in [NEXTBOT:BodyUpdate](https://wiki.facepunch.com/gmod/NEXTBOT:BodyUpdate). This sets the `move_x` and `move_y` pose parameters of the bot to fit how they're currently moving, sets the animation speed ([Entity:GetPlaybackRate](https://wiki.facepunch.com/gmod/Entity:GetPlaybackRate)) to suit the ground speed, and calls [Entity:FrameAdvance](https://wiki.facepunch.com/gmod/Entity:FrameAdvance).
---
--- This function might cause crashes with some activities.
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:BodyMoveXY)
function NextBot:BodyMoveXY() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called to update the bot's animation.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:BodyUpdate)
function NEXTBOT:BodyUpdate() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Clears this bot's last known area. See [NextBot:GetLastKnownArea](https://wiki.facepunch.com/gmod/NextBot:GetLastKnownArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:ClearLastKnownArea)
function NextBot:ClearLastKnownArea() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Like [NextBot:FindSpots](https://wiki.facepunch.com/gmod/NextBot:FindSpots) but only returns a vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:FindSpot)
---@param type string Either `"random"`, `"near"`, `"far"`.
---@param options table This table should contain the search info.
--- * string type - The type (Only `hiding` for now)
--- * Vector pos - the position to search.
--- * number radius - the radius to search.
--- * number stepup - the highest step to step up.
--- * number stepdown - the highest we can step down without being hurt.
---@return Vector # If it finds a spot it will return a vector. If not it will return nil.
function NextBot:FindSpot(type, options) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of hiding spots.
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:FindSpots)
---@param specs table This table should contain the search info.
--- * string type - The type (optional, only `hiding` supported)
--- * Vector pos - the position to search.
--- * number radius - the radius to search.
--- * number stepup - the highest step to step up.
--- * number stepdown - the highest we can step down without being hurt.
---@return table # An unsorted table of tables containing:
--- * Vector vector - The position of the hiding spot
--- * number distance - the distance to that position
function NextBot:FindSpots(specs) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the currently running activity
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:GetActivity)
---@return number # The current activity
function NextBot:GetActivity() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the Field of View of the Nextbot NPC, used for its vision functionality, such as [NextBot:IsAbleToSee](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:GetFOV)
---@return number # The current FOV of the nextbot
function NextBot:GetFOV() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns this bots last known area. See also [NextBot:ClearLastKnownArea](https://wiki.facepunch.com/gmod/NextBot:ClearLastKnownArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:GetLastKnownArea)
---@return CNavArea # The last area the bot is known to have been in.
function NextBot:GetLastKnownArea() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the maximum range the nextbot can see other nextbots/players at. See [NextBot:IsAbleToSee](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:GetMaxVisionRange)
---@return number # The current vision range
function NextBot:GetMaxVisionRange() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns squared distance to an entity or a position.
---
--- See also [NextBot:GetRangeTo](https://wiki.facepunch.com/gmod/NextBot:GetRangeTo).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:GetRangeSquaredTo)
---@param to Vector The position to measure distance to. Can be an entity.
---@return number # The squared distance
function NextBot:GetRangeSquaredTo(to) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the distance to an entity or position.
---
--- See also [NextBot:GetRangeSquaredTo](https://wiki.facepunch.com/gmod/NextBot:GetRangeSquaredTo).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:GetRangeTo)
---@param to Vector The position to measure distance to. Can be an entity.
---@return number # The distance
function NextBot:GetRangeTo(to) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the solid mask for given NextBot.
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:GetSolidMask)
---@return number # The solid mask, see Enums/CONTENTS and Enums/MASK
function NextBot:GetSolidMask() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called from Lua when the NPC is stuck. This should only be called from the behaviour coroutine - so if you want to override this function and do something special that yields - then go for it.
---
--- You should always call self.loco:ClearStuck() in this function to reset the stuck status - so it knows it's unstuck. See [CLuaLocomotion:ClearStuck](https://wiki.facepunch.com/gmod/CLuaLocomotion:ClearStuck).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:HandleStuck)
function NextBot:HandleStuck() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns if the Nextbot NPC can see the give entity or not.
---
--- **WARNING**: Using this function creates the nextbot vision interface which will cause a significant performance hit!
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee)
---@param ent Entity The entity to test if we can see
---@param useFOV? number Whether to use the Field of View of the Nextbot
---@return boolean # If the nextbot can see or not
function NextBot:IsAbleToSee(ent, useFOV) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) To be called in the behaviour coroutine only! Will yield until the bot has reached the goal or is stuck
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:MoveToPos)
---@param pos Vector The position we want to get to
---@param options table A table containing a bunch of tweakable options.
--- * number lookahead - Minimum look ahead distance.
--- * number tolerance - How close we must be to the goal before it can be considered complete.
--- * boolean draw - Draw the path. Only visible on listen servers and single player.
--- * number maxage - Maximum age of the path before it times out.
--- * number repath - Rebuilds the path after this number of seconds.
---@return string # Either `"failed"`, `"stuck"`, `"timeout"` or `"ok"` - depending on how the NPC got on
function NextBot:MoveToPos(pos, options) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the nextbot touches another entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnContact)
---@param ent Entity The entity the nextbot came in contact with.
function NEXTBOT:OnContact(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the nextbot NPC sees another Nextbot NPC or a Player.
--- 		**NOTE**: This hook will only run after [NextBot:SetFOV](https://wiki.facepunch.com/gmod/NextBot:SetFOV) or other vision related function is called on the nextbot. See [NextBot:IsAbleToSee](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee) for more details.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnEntitySight)
---@param ent Entity the entity that was seen
function NEXTBOT:OnEntitySight(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the nextbot NPC loses sight of another Nextbot NPC or a Player.
--- 		**NOTE**: This hook will only run after [NextBot:SetFOV](https://wiki.facepunch.com/gmod/NextBot:SetFOV) or other vision related function is called on the nextbot. See [NextBot:IsAbleToSee](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee) for more details.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnEntitySightLost)
---@param ent Entity the entity that we lost sight of
function NEXTBOT:OnEntitySightLost(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the bot is ignited.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnIgnite)
function NEXTBOT:OnIgnite() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the bot gets hurt. This is a good place to play hurt sounds or voice lines.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnInjured)
---@param info CTakeDamageInfo The damage info
function NEXTBOT:OnInjured(info) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the bot gets killed.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnKilled)
---@param info CTakeDamageInfo The damage info
function NEXTBOT:OnKilled(info) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the bot's feet return to the ground.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnLandOnGround)
---@param ent Entity The entity the nextbot has landed on.
function NEXTBOT:OnLandOnGround(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the bot's feet leave the ground - for whatever reason.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnLeaveGround)
---@param ent Entity The entity the bot "jumped" from.
function NEXTBOT:OnLeaveGround(ent) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the nextbot enters a new navigation area.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnNavAreaChanged)
---@param old CNavArea The navigation area the bot just left
---@param new CNavArea The navigation area the bot just entered
function NEXTBOT:OnNavAreaChanged(old, new) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when someone else or something else has been killed.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnOtherKilled)
---@param victim Entity The victim that was killed
---@param info CTakeDamageInfo The damage info
function NEXTBOT:OnOtherKilled(victim, info) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the bot thinks it is stuck.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnStuck)
function NEXTBOT:OnStuck() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when a trace attack is done against the nextbot, allowing override of the damage being dealt by altering the [CTakeDamageInfo](https://wiki.facepunch.com/gmod/CTakeDamageInfo).
---
--- This is called before [NEXTBOT:OnInjured](https://wiki.facepunch.com/gmod/NEXTBOT:OnInjured).
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnTraceAttack)
---@param info CTakeDamageInfo The damage info
---@param dir Vector The direction the damage goes in
---@param trace table The Structures/TraceResult of the attack, containing the hitgroup.
function NEXTBOT:OnTraceAttack(info, dir, trace) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the bot thinks it is un-stuck.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:OnUnStuck)
function NEXTBOT:OnUnStuck() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) To be called in the behaviour coroutine only! Plays an animation sequence and waits for it to end before returning.
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:PlaySequenceAndWait)
---@param name string The sequence name
---@param speed? number Playback Rate of that sequence
function NextBot:PlaySequenceAndWait(name, speed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) A hook called to process nextbot logic.
---
--- This hook runs in a [coroutine](https://wiki.facepunch.com/gmod/coroutine) by default. It will only be called if [NEXTBOT:BehaveStart](https://wiki.facepunch.com/gmod/NEXTBOT:BehaveStart) is not overriden.
---
---[View wiki](https://wiki.facepunch.com/gmod/NEXTBOT:RunBehaviour)
function NEXTBOT:RunBehaviour() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the Field of View for the Nextbot NPC, used for its vision functionality, such as [NextBot:IsAbleToSee](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:SetFOV)
---@param fov number The new FOV
function NextBot:SetFOV(fov) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the maximum range the nextbot can see other nextbots/players at. See [NextBot:IsAbleToSee](https://wiki.facepunch.com/gmod/NextBot:IsAbleToSee).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:SetMaxVisionRange)
---@param range number The new vision range to set.
function NextBot:SetMaxVisionRange(range) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the solid mask for given NextBot.
---
--- The default solid mask of a NextBot is [MASK_NPCSOLID](https://wiki.facepunch.com/gmod/Enums/MASK).
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:SetSolidMask)
---@param mask number The new mask, see Enums/CONTENTS and Enums/MASK
function NextBot:SetSolidMask(mask) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Start doing an activity (animation).
---
--- This function may not produce the desired result if [Entity:SetModel](https://wiki.facepunch.com/gmod/Entity:SetModel) has not yet been called on the nextbot entity
---
---[View wiki](https://wiki.facepunch.com/gmod/NextBot:StartActivity)
---@param activity number One of the Enums/ACT
function NextBot:StartActivity(activity) end
