---@meta

---@class CNavArea
local CNavArea = {}

---[SERVER] Adds a hiding spot onto this nav area.
---
--- There's a limit of 255 hiding spots per area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:AddHidingSpot)
---@param pos Vector The position on the nav area
---@param flags? number Flags describing what kind of hiding spot this is.
--- * 0 = None (Not recommended)
--- * 1 = In Cover/basically a hiding spot, in a corner with good hard cover nearby
--- * 2 = good sniper spot, had at least one decent sniping corridor
--- * 4 = perfect sniper spot, can see either very far, or a large area, or both
--- * 8 = exposed, spot in the open, usually on a ledge or cliff
---
--- Values over 255 will be clamped.
function CNavArea:AddHidingSpot(pos, flags) end

---[SERVER] Adds this CNavArea to the closed list, a list of areas that have been checked by A* pathfinding algorithm.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:AddToClosedList)
function CNavArea:AddToClosedList() end

---[SERVER] Adds this CNavArea to the Open List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:AddToOpenList)
function CNavArea:AddToOpenList() end

---[SERVER] Clears the open and closed lists for a new search.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:ClearSearchLists)
function CNavArea:ClearSearchLists() end

---[SERVER] Returns the height difference between the edges of two connected navareas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:ComputeAdjacentConnectionHeightChange)
---@param navarea CNavArea
---@return number #The height change
function CNavArea:ComputeAdjacentConnectionHeightChange(navarea) end

---[SERVER] Returns the Enums/NavDir direction that the given vector faces on this CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:ComputeDirection)
---@param pos Vector The position to compute direction towards.
---@return number #The direction the vector is in relation to this CNavArea. See Enums/NavDir.
function CNavArea:ComputeDirection(pos) end

---[SERVER] Returns the height difference on the Z axis of the two CNavAreas. This is calculated from the center most point on both CNavAreas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:ComputeGroundHeightChange)
---@param navArea CNavArea The nav area to test against.
---@return number #The ground height change.
function CNavArea:ComputeGroundHeightChange(navArea) end

---[SERVER] Connects this CNavArea to another CNavArea or CNavLadder with a one way connection. ( From this area to the target )
---
--- See CNavLadder:ConnectTo for making the connection from ladder to area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:ConnectTo)
---@param area CNavArea The CNavArea or CNavLadder this area leads to.
function CNavArea:ConnectTo(area) end

---[SERVER] Returns true if this CNavArea contains the given vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:Contains)
---@param pos Vector The position to test.
---@return boolean #True if the vector was inside and false otherwise.
function CNavArea:Contains(pos) end

---[SERVER] Disconnects this nav area from given area or ladder. (Only disconnects one way)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:Disconnect)
---@param area CNavArea The CNavArea or CNavLadder this to disconnect from.
function CNavArea:Disconnect(area) end

---[SERVER] Draws this navarea on debug overlay.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:Draw)
function CNavArea:Draw() end

---[SERVER] Draws the hiding spots on debug overlay. This includes sniper/exposed spots too!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:DrawSpots)
function CNavArea:DrawSpots() end

---[SERVER] Returns a table of all the CNavAreas that have a  ( one and two way ) connection **from** this CNavArea.
---
--- If an area has a one-way incoming connection to this CNavArea, then it will **not** be returned from this function, use CNavArea:GetIncomingConnections to get all one-way incoming connections.
---
--- See CNavArea:GetAdjacentAreasAtSide for a function that only returns areas from one side/direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreas)
---@return table #A table of all CNavArea that have a ( one and two way ) connection **from** this CNavArea.   Returns an empty table if this area has no outgoing connections to any other areas.
function CNavArea:GetAdjacentAreas() end

---[SERVER] Returns a table of all the CNavAreas that have a ( one and two way ) connection **from** this CNavArea in given direction.
---
--- If an area has a one-way incoming connection to this CNavArea, then it will **not** be returned from this function, use CNavArea:GetIncomingConnections to get all incoming connections.
---
--- See CNavArea:GetAdjacentAreas for a function that returns all areas from all sides/directions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreasAtSide)
---@param navDir number The direction, in which to look for CNavAreas, see Enums/NavDir.
---@return table #A table of all CNavArea that have a ( one and two way ) connection **from** this CNavArea in given direction.  Returns an empty table if this area has no outgoing connections to any other areas in given direction.
function CNavArea:GetAdjacentAreasAtSide(navDir) end

---[SERVER] Returns the amount of CNavAreas that have a connection ( one and two way ) **from** this CNavArea.
---
--- See CNavArea:GetAdjacentCountAtSide for a function that only returns area count from one side/direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentCount)
---@return number #The amount of CNavAreas that have a connection ( one and two way ) **from** this CNavArea.
function CNavArea:GetAdjacentCount() end

---[SERVER] Returns the amount of CNavAreas that have a connection ( one or two way ) **from** this CNavArea in given direction.
---
--- See CNavArea:GetAdjacentCount for a function that returns CNavArea count from/in all sides/directions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentCountAtSide)
---@param navDir number The direction, in which to look for CNavAreas, see Enums/NavDir.
---@return number #The amount of CNavAreas that have a connection ( one or two way ) **from** this CNavArea in given direction.
function CNavArea:GetAdjacentCountAtSide(navDir) end

---[SERVER] Returns the attribute mask for the given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetAttributes)
---@return number #Attribute mask for this CNavArea, see Enums/NAV_MESH for the specific flags.   A navmesh that was generated with nav_quicksave set to 1 will have all CNavAreas attribute masks set to 0
function CNavArea:GetAttributes() end

---[SERVER] Returns the center most vector point for the given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetCenter)
---@return Vector #The center vector.
function CNavArea:GetCenter() end

---[SERVER] Returns the closest point of this Nav Area from the given position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetClosestPointOnArea)
---@param pos Vector The given position, can be outside of the Nav Area bounds.
---@return Vector #The closest position on this Nav Area.
function CNavArea:GetClosestPointOnArea(pos) end

---[SERVER] Returns the vector position of the corner for the given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetCorner)
---@param cornerid number The target corner to get the position of, takes Enums/NavCorner.
---@return Vector #The corner position.
function CNavArea:GetCorner(cornerid) end

---[SERVER] Returns the cost from starting area this area when pathfinding. Set by CNavArea:SetCostSoFar.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetCostSoFar)
---@return number #The cost so far.
function CNavArea:GetCostSoFar() end

---[SERVER] Returns a table of very bad hiding spots in this area.
---
--- See also CNavArea:GetHidingSpots.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetExposedSpots)
---@return table #A table of Vectors
function CNavArea:GetExposedSpots() end

---[SERVER] Returns size info about the nav area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetExtentInfo)
---@return table #Returns a table containing the following keys: * Vector hi| * Vector lo| * number SizeX| * number SizeY| * number SizeZ|
function CNavArea:GetExtentInfo() end

---[SERVER] Returns a table of good hiding spots in this area.
---
--- See also CNavArea:GetExposedSpots.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetHidingSpots)
---@param type? number The type of spots to include.
---
--- * 0 = None (Not recommended)
--- * 1 = In Cover/basically a hiding spot, in a corner with good hard cover nearby
--- * 2 = good sniper spot, had at least one decent sniping corridor
--- * 4 = perfect sniper spot, can see either very far, or a large area, or both
--- * 8 = exposed, spot in the open, usually on a ledge or cliff, same as GetExposedSpots
--- * Values over 255 and below 0 will be clamped.
---@return table #A table of Vectors
function CNavArea:GetHidingSpots(type) end

---[SERVER] Returns this CNavAreas unique ID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetID)
---@return number #The unique ID.
function CNavArea:GetID() end

---[SERVER] Returns a table of all the CNavAreas that have a one-way connection **to** this CNavArea.
---
--- If a CNavArea has a two-way connection **to or from** this CNavArea then it will not be returned from this function, use CNavArea:GetAdjacentAreas to get outgoing ( one and two way ) connections.
---
--- See CNavArea:GetIncomingConnectionsAtSide for a function that returns one-way incoming connections from  only one side/direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnections)
---@return table #A table of all CNavAreas with one-way connection **to** this CNavArea.  Returns an empty table if there are no one-way incoming connections **to** this CNavArea.
function CNavArea:GetIncomingConnections() end

---[SERVER] Returns a table of all the CNavAreas that have a one-way connection **to** this CNavArea from given direction.
---
--- If a CNavArea has a two-way connection **to or from** this CNavArea then it will not be returned from this function, use CNavArea:GetAdjacentAreas to get outgoing ( one and two way ) connections.
---
--- See CNavArea:GetIncomingConnections for a function that returns one-way incoming connections from  all sides/directions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnectionsAtSide)
---@param navDir number The direction, from which to look for CNavAreas, see Enums/NavDir.
---@return table #A table of all CNavAreas with one-way connection **to** this CNavArea from given direction.  Returns an empty table if there are no one-way incoming connections **to** this CNavArea from given direction.
function CNavArea:GetIncomingConnectionsAtSide(navDir) end

---[SERVER] Returns all CNavLadders that have a ( one or two way ) connection **from** this CNavArea.
---
--- See CNavArea:GetLaddersAtSide for a function that only returns CNavLadders in given direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetLadders)
---@return table #The CNavLadders that have a ( one or two way ) connection **from** this CNavArea.
function CNavArea:GetLadders() end

---[SERVER] Returns all CNavLadders that have a ( one or two way ) connection **from** ( one and two way ) this CNavArea in given direction.
---
--- See CNavArea:GetLadders for a function that returns CNavLadder from/in all sides/directions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetLaddersAtSide)
---@param navDir number The direction, in which to look for CNavLadders.
---
--- 0 = Up ( LadderDirectionType::LADDER_UP )
--- 1 = Down ( LadderDirectionType::LADDER_DOWN )
---@return table #The CNavLadders that have a ( one or two way ) connection **from** this CNavArea in given direction.
function CNavArea:GetLaddersAtSide(navDir) end

---[SERVER] Returns the parent CNavArea
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetParent)
---@return CNavArea #The parent CNavArea
function CNavArea:GetParent() end

---[SERVER] Returns how this CNavArea is connected to its parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetParentHow)
---@return number #See Enums/NavTraverseType
function CNavArea:GetParentHow() end

---[SERVER] Returns the Place of the nav area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetPlace)
---@return string #The place of the nav area, or no value if it doesn't have a place set.
function CNavArea:GetPlace() end

---[SERVER] Returns a random CNavArea that has an outgoing ( one or two way ) connection **from** this CNavArea in given direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetRandomAdjacentAreaAtSide)
---@param navDir number The direction, in which to look for CNavAreas, see Enums/NavDir.
---@return CNavArea #The random CNavArea that has an outgoing ( one or two way ) connection **from** this CNavArea in given direction, if any.
function CNavArea:GetRandomAdjacentAreaAtSide(navDir) end

---[SERVER] Returns a random point on the nav area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetRandomPoint)
---@return Vector #The random point on the nav area.
function CNavArea:GetRandomPoint() end

---[SERVER] Returns the width this Nav Area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetSizeX)
---@return number #
function CNavArea:GetSizeX() end

---[SERVER] Returns the height of this Nav Area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetSizeY)
---@return number #
function CNavArea:GetSizeY() end

---[SERVER] Returns the total cost when passing from starting area to the goal area through this node. Set by CNavArea:SetTotalCost.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetTotalCost)
---@return number #The total cost
function CNavArea:GetTotalCost() end

---[SERVER] Returns the elevation of this Nav Area at the given position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:GetZ)
---@param pos Vector The position to get the elevation from, the z value from this position is ignored and only the X and Y values are used to this task.
---@return number #The elevation.
function CNavArea:GetZ(pos) end

---[SERVER] Returns true if the given CNavArea has this attribute flag set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:HasAttributes)
---@param attribs number Attribute mask to check for, see Enums/NAV_MESH
---@return boolean #True if the CNavArea matches the given mask. False otherwise.
function CNavArea:HasAttributes(attribs) end

---[SERVER] Returns whether the nav area is blocked or not, i.e. whether it can be walked through or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsBlocked)
---@param teamID? number The team ID to test, -2 = any team.
---
--- Only 2 actual teams are available, 0 and 1.
---@param ignoreNavBlockers? boolean Whether to ignore [func_nav_blocker](https://developer.valvesoftware.com/wiki/Func_nav_blocker) entities.
---@return boolean #Whether the area is blocked or not
function CNavArea:IsBlocked(teamID, ignoreNavBlockers) end

---[SERVER] Returns whether this node is in the Closed List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsClosed)
---@return boolean #Whether this node is in the Closed List.
function CNavArea:IsClosed() end

---[SERVER] Returns whether this CNavArea can completely (i.e. all corners of this area can see all corners of the given area) see the given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsCompletelyVisible)
---@param area CNavArea The CNavArea to test.
---@return boolean #Whether the given area is visible from this area
function CNavArea:IsCompletelyVisible(area) end

---[SERVER] Returns whether this CNavArea has an outgoing ( one or two way ) connection **to** given CNavArea.
---
--- See CNavArea:IsConnectedAtSide for a function that only checks for outgoing connections in one direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsConnected)
---@param navArea CNavArea The CNavArea to test against.
---@return boolean #Whether this CNavArea has an outgoing ( one or two way ) connection **to** given CNavArea.
function CNavArea:IsConnected(navArea) end

---[SERVER] Returns whether this CNavArea has an outgoing ( one or two way ) connection **to** given CNavArea in given direction.
---
--- See CNavArea:IsConnected for a function that checks all sides.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsConnectedAtSide)
---@param navArea CNavArea The CNavArea to test against.
---@param navDirType number The direction, in which to look for the connection. See Enums/NavDir
---@return boolean #Whether this CNavArea has an outgoing ( one or two way ) connection **to** given CNavArea in given direction.
function CNavArea:IsConnectedAtSide(navArea, navDirType) end

---[SERVER] Returns whether this Nav Area is in the same plane as the given one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsCoplanar)
---@param navArea CNavArea The Nav Area to test.
---@return boolean #Whether we're coplanar or not.
function CNavArea:IsCoplanar(navArea) end

---[SERVER] Returns whether this Nav Area is flat within the tolerance of the **nav_coplanar_slope_limit_displacement** and **nav_coplanar_slope_limit** convars.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsFlat)
---@return boolean #Whether this CNavArea is mostly flat.
function CNavArea:IsFlat() end

---[SERVER] Returns whether this area is in the Open List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsOpen)
---@return boolean #Whether this area is in the Open List.
function CNavArea:IsOpen() end

---[SERVER] Returns whether the Open List is empty or not.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsOpenListEmpty)
---@return boolean #Whether the Open List is empty or not.
function CNavArea:IsOpenListEmpty() end

---[SERVER] Returns if this position overlaps the Nav Area within the given tolerance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsOverlapping)
---@param pos Vector The overlapping position to test.
---@param tolerance? number The tolerance of the overlapping, set to 0 for no tolerance.
---@return boolean #Whether the given position overlaps the Nav Area or not.
function CNavArea:IsOverlapping(pos, tolerance) end

---[SERVER] Returns true if this CNavArea is overlapping the given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsOverlappingArea)
---@param navArea CNavArea The CNavArea to test against.
---@return boolean #True if the given CNavArea overlaps this CNavArea at any point.
function CNavArea:IsOverlappingArea(navArea) end

---[SERVER] Returns whether this CNavArea can see given position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsPartiallyVisible)
---@param pos Vector The position to test.
---@param ignoreEnt? Entity If set, the given entity will be ignored when doing LOS tests
---@return boolean #Whether the given position is visible from this area
function CNavArea:IsPartiallyVisible(pos, ignoreEnt) end

---[SERVER] Returns whether this CNavArea can potentially see the given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsPotentiallyVisible)
---@param area CNavArea The CNavArea to test.
---@return boolean #Whether the given area is visible from this area
function CNavArea:IsPotentiallyVisible(area) end

---[SERVER] Returns if we're shaped like a square.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsRoughlySquare)
---@return boolean #If we're a square or not.
function CNavArea:IsRoughlySquare() end

---[SERVER] Whether this Nav Area is placed underwater.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsUnderwater)
---@return boolean #Whether we're underwater or not.
function CNavArea:IsUnderwater() end

---[SERVER] Returns whether this CNavArea is valid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsValid)
---@return boolean #Whether this CNavArea is valid or not.
function CNavArea:IsValid() end

---[SERVER] Returns whether we can be seen from the given position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:IsVisible)
---@param pos Vector The position to check.
---@return boolean, Vector #boolean - Whether we can be seen or not.
---@return boolean, Vector #Vector - If we can be seen, this is returned with either the center or one of the corners of the Nav Area.
function CNavArea:IsVisible(pos) end

---[SERVER] Drops a corner or all corners of a CNavArea to the ground below it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:PlaceOnGround)
---@param corner number The corner(s) to drop, uses Enums/NavCorner
function CNavArea:PlaceOnGround(corner) end

---[SERVER] Removes a CNavArea from the Open List with the lowest cost to traverse to from the starting node, and returns it.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:PopOpenList)
---@return CNavArea #The CNavArea from the Open List with the lowest cost to traverse to from the starting node.
function CNavArea:PopOpenList() end

---[SERVER] Removes the given nav area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:Remove)
function CNavArea:Remove() end

---[SERVER] Removes this node from the Closed List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:RemoveFromClosedList)
function CNavArea:RemoveFromClosedList() end

---[SERVER] Sets the attributes for given CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:SetAttributes)
---@param attribs number The attribute bitflag. See Enums/NAV_MESH
function CNavArea:SetAttributes(attribs) end

---[SERVER] Sets the position of a corner of a nav area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:SetCorner)
---@param corner number The corner to set, uses Enums/NavCorner
---@param position Vector The new position to set.
function CNavArea:SetCorner(corner, position) end

---[SERVER] Sets the cost from starting area this area when pathfinding.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:SetCostSoFar)
---@param cost number The cost so far
function CNavArea:SetCostSoFar(cost) end

---[SERVER] Sets the new parent of this CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:SetParent)
---@param parent CNavArea The new parent to set
---@param how number How we get from parent to us using Enums/NavTraverseType
function CNavArea:SetParent(parent, how) end

---[SERVER] Sets the Place of the nav area.
---
--- There is a limit of 256 Places per nav file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:SetPlace)
---@param place string Set to "" to remove place from the nav area.
---@return boolean #Returns true of operation succeeded, false otherwise.
function CNavArea:SetPlace(place) end

---[SERVER] Sets the total cost when passing from starting area to the goal area through this node.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:SetTotalCost)
---@param cost number The total cost of the path to set.
---
--- Must be above or equal 0.
function CNavArea:SetTotalCost(cost) end

---[SERVER] Moves this open list to appropriate position based on its CNavArea:GetTotalCost compared to the total cost of other areas in the open list.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
---
--- More information can be found on the Simple Pathfinding page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavArea:UpdateOnOpenList)
function CNavArea:UpdateOnOpenList() end