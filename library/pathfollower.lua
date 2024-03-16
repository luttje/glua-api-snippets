---@meta

--- Path object for a NextBot NPC and bots created by player.CreateNextbot. Returned by Global.Path.
---@class PathFollower
local PathFollower = {}

---[SERVER] If you created your path with type "Chase" this functions should be used in place of PathFollower:Update to cause the bot to chase the specified entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:Chase)
---@param bot NextBot The bot to update along the path. This can also be a nextbot player (player.CreateNextbot)
---@param ent Entity The entity we want to chase
function PathFollower:Chase(bot, ent) end

---[SERVER] Compute shortest path from bot to 'goal' via A* algorithm.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:Compute)
---@param bot NextBot The nextbot we're generating for.  This can also be a nextbot player (player.CreateNextbot).
---@param goal Vector The target location, the goal.
---@param generator? function A funtion that allows you to alter the path generation. See example below for the default function.
---
---
--- 	The area to move to.
--- 	The area to move from.
--- 	The ladder to move to or from (Validation required), if any.
--- 	Will probably be always NULL
--- 	Precomputed length between `area` and `fromArea`.
--- 	The cost of movement between `area` and `fromArea`.
---
---
---
---@param area CNavArea The area to move to.
---@param fromArea CNavArea The area to move from.
---@param ladder CNavLadder The ladder to move to or from (Validation required), if any.
---@param elevator Entity Will probably be always NULL
---@param length number Precomputed length between `area` and `fromArea`.
---@return boolean # * If returns true, path was found to the goal position. * If returns false, path may either be invalid (use IsValid() to check), or valid but doesn't reach all the way to the goal.
function PathFollower:Compute(bot, goal, generator, area, fromArea, ladder, elevator, length) end

---[SERVER] Draws the path. This is meant for debugging - and uses debugoverlay.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:Draw)
function PathFollower:Draw() end

---[SERVER] Returns the first segment of the path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:FirstSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:FirstSegment() end

---[SERVER] Returns the age since the path was built
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetAge)
---@return number # Path age
function PathFollower:GetAge() end

---[SERVER] Returns all of the segments of the given path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetAllSegments)
---@return table # A table of tables with Structures/PathSegment.
function PathFollower:GetAllSegments() end

---[SERVER] The closest position along the path to a position
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetClosestPosition)
---@param position Vector The point we're querying for
---@return Vector # The closest position on the path
function PathFollower:GetClosestPosition(position) end

---[SERVER] Returns the current goal data. Can return nil if the current goal is invalid, for example immediately after PathFollower:Update.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetCurrentGoal)
---@return table # A table with Structures/PathSegment.
function PathFollower:GetCurrentGoal() end

---[SERVER] Returns the cursor data
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetCursorData)
---@return table # A table with 3 keys: number curvature   Vector forward   Vector pos
function PathFollower:GetCursorData() end

---[SERVER] Returns the current progress along the path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetCursorPosition)
---@return number # The current progress
function PathFollower:GetCursorPosition() end

---[SERVER] Returns the path end position
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetEnd)
---@return Vector # The end position
function PathFollower:GetEnd() end

---[SERVER] Returns how close we can get to the goal to call it done.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetGoalTolerance)
---@return number # The distance we're setting it to
function PathFollower:GetGoalTolerance() end

---[SERVER]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetHindrance)
---@return Entity #
function PathFollower:GetHindrance() end

---[SERVER] Returns the total length of the path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetLength)
---@return number # The length of the path
function PathFollower:GetLength() end

---[SERVER] Returns the minimum range movement goal must be along path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetMinLookAheadDistance)
---@return number # The minimum look ahead distance
function PathFollower:GetMinLookAheadDistance() end

---[SERVER] Returns the vector position of distance along path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetPositionOnPath)
---@param distance number The distance along the path to query
---@return Vector # The position
function PathFollower:GetPositionOnPath(distance) end

---[SERVER] Returns the path start position
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:GetStart)
---@return Vector # The start position
function PathFollower:GetStart() end

---[SERVER] Invalidates the current path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:Invalidate)
function PathFollower:Invalidate() end

---[SERVER] Returns true if the path is valid
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:IsValid)
---@return boolean # Wether the path is valid or not.
function PathFollower:IsValid() end

---[SERVER] Returns the last segment of the path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:LastSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:LastSegment() end

---[SERVER] Moves the cursor by give distance.
---
--- For a function that sets the distance, see PathFollower:MoveCursorTo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:MoveCursor)
---@param distance number The distance to move the cursor (in relative world units)
function PathFollower:MoveCursor(distance) end

---[SERVER] Sets the cursor position to given distance.
---
--- For relative distance, see PathFollower:MoveCursor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorTo)
---@param distance number The distance to move the cursor (in world units)
function PathFollower:MoveCursorTo(distance) end

---[SERVER] Moves the cursor of the path to the closest position compared to given vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorToClosestPosition)
---@param pos Vector
---@param type? number Seek type
---
---
--- 0 = SEEK_ENTIRE_PATH - Search the entire path length
---
---
--- 1 = SEEK_AHEAD - Search from current cursor position forward toward end of path
---
---
--- 2 = SEEK_BEHIND - Search from current cursor position backward toward path start
---@param alongLimit? number
function PathFollower:MoveCursorToClosestPosition(pos, type, alongLimit) end

---[SERVER] Moves the cursor to the end of the path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorToEnd)
function PathFollower:MoveCursorToEnd() end

---[SERVER] Moves the cursor to the end of the path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorToStart)
function PathFollower:MoveCursorToStart() end

---[SERVER] Returns the next segment of the path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:NextSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:NextSegment() end

---[SERVER] Returns the previous segment of the path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:PriorSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:PriorSegment() end

---[SERVER] Resets the age which is retrieved by PathFollower:GetAge to 0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:ResetAge)
function PathFollower:ResetAge() end

---[SERVER] How close we can get to the goal to call it done
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:SetGoalTolerance)
---@param distance number The distance we're setting it to
function PathFollower:SetGoalTolerance(distance) end

---[SERVER] Sets minimum range movement goal must be along path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:SetMinLookAheadDistance)
---@param mindist number The minimum look ahead distance
function PathFollower:SetMinLookAheadDistance(mindist) end

---[SERVER] Move the bot along the path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PathFollower:Update)
---@param bot NextBot The bot to update along the path
function PathFollower:Update(bot) end
