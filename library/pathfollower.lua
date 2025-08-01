---@meta

--- Path object for a NextBot NPC and bots created by [player.CreateNextbot](https://wiki.facepunch.com/gmod/player.CreateNextbot). Returned by [Global.Path](https://wiki.facepunch.com/gmod/Global.Path).
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower)
---@class PathFollower
local PathFollower = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Computes the shortest path to the provided entity arg. PathFollower Object must have `Chase` type.
---
--- For PathFollower objects of the `Follow` type use [PathFollower:Compute](https://wiki.facepunch.com/gmod/PathFollower:Compute)
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:Chase)
---@param bot NextBot The bot to update along the path. This can also be a nextbot player (player.CreateNextbot)
---@param ent Entity The entity we want to chase
---@param generator? fun(area: CNavArea, fromArea: CNavArea, ladder: CNavLadder, elevator: Entity, length: number):(cost: number) A function that allows you to alter the path generation. See example on PathFollower:Compute for the default function.
---
--- Function argument(s):
--- * CNavArea `area` - The area to move to.
--- * CNavArea `fromArea` - The area to move from.
--- * CNavLadder `ladder` - The ladder to move to or from (Validation required), if any.
--- * Entity `elevator` - Will probably be always NULL
--- * number `length` - Precomputed length between `area` and `fromArea`.
---
--- Function return value(s):
--- * number `cost` - The cost of movement between `area` and `fromArea`.
function PathFollower:Chase(bot, ent, generator) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Compute shortest path from bot to 'goal' via A* algorithm. This only works if the PathFollower is the `Follow` Type.
---
--- For PathFollowers of the `Chase` Type see [PathFollower:Chase](https://wiki.facepunch.com/gmod/PathFollower:Chase)
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:Compute)
---@param bot NextBot The nextbot we're generating for.  This can also be a nextbot player (player.CreateNextbot).
---@param goal Vector The target location, the goal.
---@param generator? fun(area: CNavArea, fromArea: CNavArea, ladder: CNavLadder, elevator: Entity, length: number):(cost: number) A function that allows you to alter the path generation by adjusting the "cost". See example below for the default function.
---
--- Function argument(s):
--- * CNavArea `area` - The area to move to.
--- * CNavArea `fromArea` - The area to move from.
--- * CNavLadder `ladder` - The ladder to move to or from (Validation required), if any.
--- * Entity `elevator` - Will probably be always NULL
--- * number `length` - Precomputed length between `area` and `fromArea`.
---
--- Function return value(s):
--- * number `cost` - The cost of movement between `area` and `fromArea`.
---@return boolean # * If returns true, path was found to the goal position.
--- * If returns false, path may either be invalid (use IsValid() to check), or valid but doesn't reach all the way to the goal.
function PathFollower:Compute(bot, goal, generator) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Draws the path. This is meant for debugging - and uses [debugoverlay](https://wiki.facepunch.com/gmod/debugoverlay).
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:Draw)
function PathFollower:Draw() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the first segment of the path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:FirstSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:FirstSegment() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the age since the path was built
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetAge)
---@return number # Path age
function PathFollower:GetAge() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns all of the segments of the given path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetAllSegments)
---@return PathSegment # A table of tables with Structures/PathSegment.
function PathFollower:GetAllSegments() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) The closest position along the path to a position
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetClosestPosition)
---@param position Vector The point we're querying for
---@return Vector # The closest position on the path
function PathFollower:GetClosestPosition(position) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current goal data. Can return nil if the current goal is invalid, for example immediately after [PathFollower:Update](https://wiki.facepunch.com/gmod/PathFollower:Update).
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetCurrentGoal)
---@return table # A table with Structures/PathSegment.
function PathFollower:GetCurrentGoal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the cursor data
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetCursorData)
---@return table # A table with 3 keys:
--- number curvature
---
--- Vector forward
---
--- Vector pos
function PathFollower:GetCursorData() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the current progress along the path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetCursorPosition)
---@return number # The current progress
function PathFollower:GetCursorPosition() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the path end position
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetEnd)
---@return Vector # The end position
function PathFollower:GetEnd() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns how close we can get to the goal to call it done.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetGoalTolerance)
---@return number # The distance we're setting it to
function PathFollower:GetGoalTolerance() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1)
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetHindrance)
---@return Entity #
function PathFollower:GetHindrance() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the total length of the path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetLength)
---@return number # The length of the path
function PathFollower:GetLength() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the minimum range movement goal must be along path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetMinLookAheadDistance)
---@return number # The minimum look ahead distance
function PathFollower:GetMinLookAheadDistance() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the vector position of distance along path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetPositionOnPath)
---@param distance number The distance along the path to query
---@return Vector # The position
function PathFollower:GetPositionOnPath(distance) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the path start position
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:GetStart)
---@return Vector # The start position
function PathFollower:GetStart() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Invalidates the current path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:Invalidate)
function PathFollower:Invalidate() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if the path is valid
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:IsValid)
---@return boolean # Wether the path is valid or not.
function PathFollower:IsValid() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the last segment of the path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:LastSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:LastSegment() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Moves the cursor by give distance.
---
--- For a function that sets the distance, see [PathFollower:MoveCursorTo](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorTo).
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:MoveCursor)
---@param distance number The distance to move the cursor (in relative world units)
function PathFollower:MoveCursor(distance) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the cursor position to given distance.
---
--- For relative distance, see [PathFollower:MoveCursor](https://wiki.facepunch.com/gmod/PathFollower:MoveCursor).
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorTo)
---@param distance number The distance to move the cursor (in world units)
function PathFollower:MoveCursorTo(distance) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Moves the cursor of the path to the closest position compared to given vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorToClosestPosition)
---@param pos Vector
---@param type? number Seek type
---
--- 0 = SEEK_ENTIRE_PATH - Search the entire path length
---
--- 1 = SEEK_AHEAD - Search from current cursor position forward toward end of path
---
--- 2 = SEEK_BEHIND - Search from current cursor position backward toward path start
---@param alongLimit? number
function PathFollower:MoveCursorToClosestPosition(pos, type, alongLimit) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Moves the cursor to the end of the path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorToEnd)
function PathFollower:MoveCursorToEnd() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Moves the cursor to the end of the path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:MoveCursorToStart)
function PathFollower:MoveCursorToStart() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the next segment of the path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:NextSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:NextSegment() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the previous segment of the path.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:PriorSegment)
---@return table # A table with Structures/PathSegment.
function PathFollower:PriorSegment() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Resets the age which is retrieved by [PathFollower:GetAge](https://wiki.facepunch.com/gmod/PathFollower:GetAge) to 0.
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:ResetAge)
function PathFollower:ResetAge() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) How close we can get to the goal to call it done
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:SetGoalTolerance)
---@param distance number The distance we're setting it to
function PathFollower:SetGoalTolerance(distance) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets minimum range movement goal must be along path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:SetMinLookAheadDistance)
---@param mindist number The minimum look ahead distance
function PathFollower:SetMinLookAheadDistance(mindist) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Move the bot along the path.
---     **NOTE**: player nextbots require [CUserCmd:SetForwardMove](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove) to move forward along the path
---
---[View wiki](https://wiki.facepunch.com/gmod/PathFollower:Update)
---@param bot NextBot The bot to update along the path. This can also be a nextbot player (player.CreateNextbot)
function PathFollower:Update(bot) end
