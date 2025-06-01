---@meta

--- An object returned by [navmesh](https://wiki.facepunch.com/gmod/navmesh) functions.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea)
---@class CNavArea
local CNavArea = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds given attributes to given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea). See [CNavArea:HasAttributes](https://wiki.facepunch.com/gmod/CNavArea:HasAttributes) and [CNavArea:SetAttributes](https://wiki.facepunch.com/gmod/CNavArea:SetAttributes).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:AddAttributes)
---@param attribs number The attributes to add, as a bitflag. See Enums/NAV_MESH.
function CNavArea:AddAttributes(attribs) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds a hiding spot onto this nav area.
---
--- There's a limit of 255 hiding spots per area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:AddHidingSpot)
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

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) to the closed list, a list of areas that have been checked by A* pathfinding algorithm.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:AddToClosedList)
function CNavArea:AddToClosedList() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) to the Open List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:AddToOpenList)
function CNavArea:AddToOpenList() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Clears the open and closed lists for a new search.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:ClearSearchLists)
function CNavArea:ClearSearchLists() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the height difference between the edges of two connected navareas.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:ComputeAdjacentConnectionHeightChange)
---@param navarea CNavArea
---@return number # The height change
function CNavArea:ComputeAdjacentConnectionHeightChange(navarea) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the [Enums/NavDir](https://wiki.facepunch.com/gmod/Enums/NavDir) direction that the given vector faces on this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:ComputeDirection)
---@param pos Vector The position to compute direction towards.
---@return number # The direction the vector is in relation to this CNavArea. See Enums/NavDir.
function CNavArea:ComputeDirection(pos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the height difference on the Z axis of the two [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s. This is calculated from the center most point on both [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:ComputeGroundHeightChange)
---@param navArea CNavArea The nav area to test against.
---@return number # The ground height change.
function CNavArea:ComputeGroundHeightChange(navArea) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Connects this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) to another [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) or [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder) with a one way connection. ( From this area to the target )
---
--- See [CNavLadder:ConnectTo](https://wiki.facepunch.com/gmod/CNavLadder:ConnectTo) for making the connection from ladder to area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:ConnectTo)
---@param area CNavArea The CNavArea or CNavLadder this area leads to.
function CNavArea:ConnectTo(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) contains the given vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:Contains)
---@param pos Vector The position to test.
---@return boolean # True if the vector was inside and false otherwise.
function CNavArea:Contains(pos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Disconnects this nav area from given area or ladder. (Only disconnects one way)
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:Disconnect)
---@param area CNavArea The CNavArea or CNavLadder this to disconnect from.
function CNavArea:Disconnect(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Draws this navarea on debug overlay.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:Draw)
function CNavArea:Draw() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Draws the hiding spots on debug overlay. This includes sniper/exposed spots too!
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:DrawSpots)
function CNavArea:DrawSpots() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a list of all the [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a (one and two way) connection **from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) and their pre-computed distances.
---
--- If an area has a one-way incoming connection to this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea), then it will **not** be returned from this function, use [CNavArea:GetIncomingConnectionDistances](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnectionDistances) to get all one-way incoming connections.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreaDistances)
---@param dir? number If set, will only return areas in the specified direction. See Enums/NavDir.
---@return table # A list of tables in the following format:
--- * CNavArea **area** - the area that is connected to this area.
--- * number **dist** - Distance from the area to this area.
--- * number **dir** - Direction in which the area is in relative to this area.
function CNavArea:GetAdjacentAreaDistances(dir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a list of all the [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a  (one and two way) connection **from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
--- If an area has a one-way incoming connection to this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea), then it will **not** be returned from this function, use [CNavArea:GetIncomingConnections](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnections) to get all one-way incoming connections.
---
--- See [CNavArea:GetAdjacentAreasAtSide](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreasAtSide) for a function that only returns areas from one side/direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreas)
---@return table # A list of all CNavArea that have a (one and two way) connection **from** this CNavArea.
---
--- Returns an empty table if this area has no outgoing connections to any other areas.
function CNavArea:GetAdjacentAreas() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of all the [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a ( one and two way ) connection **from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) in given direction.
---
--- If an area has a one-way incoming connection to this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea), then it will **not** be returned from this function, use [CNavArea:GetIncomingConnections](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnections) to get all incoming connections.
---
--- See [CNavArea:GetAdjacentAreas](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreas) for a function that returns all areas from all sides/directions.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreasAtSide)
---@param navDir number The direction, in which to look for CNavAreas, see Enums/NavDir.
---@return table # A table of all CNavArea that have a ( one and two way ) connection **from** this CNavArea in given direction.
---
--- Returns an empty table if this area has no outgoing connections to any other areas in given direction.
function CNavArea:GetAdjacentAreasAtSide(navDir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the amount of [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a connection ( one and two way ) **from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
--- See [CNavArea:GetAdjacentCountAtSide](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentCountAtSide) for a function that only returns area count from one side/direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentCount)
---@return number # The amount of CNavAreas that have a connection ( one and two way ) **from** this CNavArea.
function CNavArea:GetAdjacentCount() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the amount of [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a connection ( one or two way ) **from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) in given direction.
---
--- See [CNavArea:GetAdjacentCount](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentCount) for a function that returns [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) count from/in all sides/directions.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentCountAtSide)
---@param navDir number The direction, in which to look for CNavAreas, see Enums/NavDir.
---@return number # The amount of CNavAreas that have a connection ( one or two way ) **from** this CNavArea in given direction.
function CNavArea:GetAdjacentCountAtSide(navDir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the attribute mask for the given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetAttributes)
---@return number # Attribute mask for this CNavArea, see Enums/NAV_MESH for the specific flags.
---
--- A navmesh that was generated with nav_quicksave set to 1 will have all [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s attribute masks set to 0
function CNavArea:GetAttributes() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the center most vector point for the given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetCenter)
---@return Vector # The center vector.
function CNavArea:GetCenter() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the closest point of this Nav Area from the given position.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetClosestPointOnArea)
---@param pos Vector The given position, can be outside of the Nav Area bounds.
---@return Vector # The closest position on this Nav Area.
function CNavArea:GetClosestPointOnArea(pos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the vector position of the corner for the given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetCorner)
---@param cornerid number The target corner to get the position of, takes Enums/NavCorner.
---@return Vector # The corner position.
function CNavArea:GetCorner(cornerid) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the cost from starting area this area when pathfinding. Set by [CNavArea:SetCostSoFar](https://wiki.facepunch.com/gmod/CNavArea:SetCostSoFar).
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetCostSoFar)
---@return number # The cost so far.
function CNavArea:GetCostSoFar() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of very bad hiding spots in this area.
---
--- See also [CNavArea:GetHidingSpots](https://wiki.facepunch.com/gmod/CNavArea:GetHidingSpots).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetExposedSpots)
---@return table # A table of Vectors
function CNavArea:GetExposedSpots() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns size info about the nav area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetExtentInfo)
---@return table # Returns a table containing the following keys:
--- * Vector hi|
--- * Vector lo|
--- * number SizeX|
--- * number SizeY|
--- * number SizeZ|
function CNavArea:GetExtentInfo() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of good hiding spots in this area.
---
--- See also [CNavArea:GetExposedSpots](https://wiki.facepunch.com/gmod/CNavArea:GetExposedSpots).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetHidingSpots)
---@param type? number The type of spots to include.
---
--- * 0 = None (Not recommended)
--- * 1 = In Cover/basically a hiding spot, in a corner with good hard cover nearby
--- * 2 = good sniper spot, had at least one decent sniping corridor
--- * 4 = perfect sniper spot, can see either very far, or a large area, or both
--- * 8 = exposed, spot in the open, usually on a ledge or cliff, same as GetExposedSpots
--- * Values over 255 and below 0 will be clamped.
---@return table # A table of Vectors
function CNavArea:GetHidingSpots(type) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s unique ID.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetID)
---@return number # The unique ID.
function CNavArea:GetID() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of all the [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a one-way connection **to** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) and their pre-computed distances.
---
--- If a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) has a two-way connection **to or from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) then it will not be returned from this function, use [CNavArea:GetAdjacentAreaDistances](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreaDistances) to get outgoing (one and two way) connections.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnectionDistances)
---@param dir? number If set, will only return areas in the specified direction. See Enums/NavDir.
---@return table # A list of tables in the following format:
--- * CNavArea **area** - the area that is connected to this area.
--- * number **dist** - Distance from the area to this area.
--- * number **dir** - Direction in which the area is in relative to this area.
function CNavArea:GetIncomingConnectionDistances(dir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of all the [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a one-way connection **to** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
--- If a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) has a two-way connection **to or from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) then it will not be returned from this function, use [CNavArea:GetAdjacentAreas](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreas) to get outgoing ( one and two way ) connections.
---
--- See [CNavArea:GetIncomingConnectionsAtSide](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnectionsAtSide) for a function that returns one-way incoming connections from  only one side/direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnections)
---@return CNavArea[] # A table of all CNavAreas with one-way connection **to** this CNavArea.
---
--- Returns an empty table if there are no one-way incoming connections **to** this CNavArea.
function CNavArea:GetIncomingConnections() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of all the [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that have a one-way connection **to** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) from given direction.
---
--- If a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) has a two-way connection **to or from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) then it will not be returned from this function, use [CNavArea:GetAdjacentAreas](https://wiki.facepunch.com/gmod/CNavArea:GetAdjacentAreas) to get outgoing ( one and two way ) connections.
---
--- See [CNavArea:GetIncomingConnections](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnections) for a function that returns one-way incoming connections from  all sides/directions.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetIncomingConnectionsAtSide)
---@param navDir number The direction, from which to look for CNavAreas, see Enums/NavDir.
---@return table # A table of all CNavAreas with one-way connection **to** this CNavArea from given direction.
---
--- Returns an empty table if there are no one-way incoming connections **to** this CNavArea from given direction.
function CNavArea:GetIncomingConnectionsAtSide(navDir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns all [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder)s that have a ( one or two way ) connection **from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
--- See [CNavArea:GetLaddersAtSide](https://wiki.facepunch.com/gmod/CNavArea:GetLaddersAtSide) for a function that only returns [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder)s in given direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetLadders)
---@return CNavLadder[] # The CNavLadders that have a ( one or two way ) connection **from** this CNavArea.
function CNavArea:GetLadders() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns all [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder)s that have a ( one or two way ) connection **from** ( one and two way ) this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) in given direction.
---
--- See [CNavArea:GetLadders](https://wiki.facepunch.com/gmod/CNavArea:GetLadders) for a function that returns [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder) from/in all sides/directions.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetLaddersAtSide)
---@param navDir number The direction, in which to look for CNavLadders.
---
--- 0 = Up ( LadderDirectionType::LADDER_UP )
--- 1 = Down ( LadderDirectionType::LADDER_DOWN )
---@return table # The CNavLadders that have a ( one or two way ) connection **from** this CNavArea in given direction.
function CNavArea:GetLaddersAtSide(navDir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the parent [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetParent)
---@return CNavArea # The parent CNavArea
function CNavArea:GetParent() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns how this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) is connected to its parent.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetParentHow)
---@return number # See Enums/NavTraverseType
function CNavArea:GetParentHow() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the Place of the nav area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetPlace)
---@return string # The place of the nav area, or no value if it doesn't have a place set.
function CNavArea:GetPlace() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a random [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) that has an outgoing ( one or two way ) connection **from** this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) in given direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetRandomAdjacentAreaAtSide)
---@param navDir number The direction, in which to look for CNavAreas, see Enums/NavDir.
---@return CNavArea # The random CNavArea that has an outgoing ( one or two way ) connection **from** this CNavArea in given direction, if any.
function CNavArea:GetRandomAdjacentAreaAtSide(navDir) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a random point on the nav area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetRandomPoint)
---@return Vector # The random point on the nav area.
function CNavArea:GetRandomPoint() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the width this Nav Area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetSizeX)
---@return number #
function CNavArea:GetSizeX() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the height of this Nav Area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetSizeY)
---@return number #
function CNavArea:GetSizeY() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns all possible path segments through a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea), and the dangerous spots to look at as we traverse that path segment.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetSpotEncounters)
---@return table # A sequential list of spot encounters in the following format:
--- * CNavArea **from** - What CNavArea the path segment is coming from
--- * Vector **from_pos** - Origin position of the path segment
--- * number **from_dir** - Source Enums/NavDir direction of the path segment
--- * CNavArea **to** - What CNavArea the path segment is going towards
--- * Vector **to_pos** - Target position of the path segment
--- * number **to_dir** - Target Enums/NavDir direction of the path segment
--- * table **spots** - List of spots to look at, a sequential list of the following structures:
---   * Vector **pos** - Position of the spot
---   * table **flags** - Type of spot this is
---   * CNavArea **area** - The nav area the spot belongs to
function CNavArea:GetSpotEncounters() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the total cost when passing from starting area to the goal area through this node. Set by [CNavArea:SetTotalCost](https://wiki.facepunch.com/gmod/CNavArea:SetTotalCost).
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetTotalCost)
---@return number # The total cost
function CNavArea:GetTotalCost() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns all [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)s that are visible from this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetVisibleAreas)
---@return table # A sequential table containing all CNavAreas that are visible from this CNavArea.
function CNavArea:GetVisibleAreas() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the elevation of this Nav Area at the given position.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:GetZ)
---@param pos Vector The position to get the elevation from, the z value from this position is ignored and only the X and Y values are used to this task.
---@return number # The elevation.
function CNavArea:GetZ(pos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if the given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) has this attribute flag set.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:HasAttributes)
---@param attribs number Attribute mask to check for, see Enums/NAV_MESH
---@return boolean # True if the CNavArea matches the given mask. False otherwise.
function CNavArea:HasAttributes(attribs) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the nav area is blocked or not, i.e. whether it can be walked through or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsBlocked)
---@param teamID? number The team ID to test, -2 = any team.
---
--- Only 2 actual teams are available, 0 and 1.
---@param ignoreNavBlockers? boolean Whether to ignore [func_nav_blocker](https://developer.valvesoftware.com/wiki/Func_nav_blocker) entities.
---@return boolean # Whether the area is blocked or not
function CNavArea:IsBlocked(teamID, ignoreNavBlockers) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this node is in the Closed List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsClosed)
---@return boolean # Whether this node is in the Closed List.
function CNavArea:IsClosed() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) can completely (i.e. all corners of this area can see all corners of the given area) see the given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsCompletelyVisible)
---@param area CNavArea The CNavArea to test.
---@return boolean # Whether the given area is visible from this area
function CNavArea:IsCompletelyVisible(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) has an outgoing ( one or two way ) connection **to** given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
--- See [CNavArea:IsConnectedAtSide](https://wiki.facepunch.com/gmod/CNavArea:IsConnectedAtSide) for a function that only checks for outgoing connections in one direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsConnected)
---@param navArea CNavArea The CNavArea to test against.
---@return boolean # Whether this CNavArea has an outgoing ( one or two way ) connection **to** given CNavArea.
function CNavArea:IsConnected(navArea) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) has an outgoing ( one or two way ) connection **to** given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) in given direction.
---
--- See [CNavArea:IsConnected](https://wiki.facepunch.com/gmod/CNavArea:IsConnected) for a function that checks all sides.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsConnectedAtSide)
---@param navArea CNavArea The CNavArea to test against.
---@param navDirType number The direction, in which to look for the connection. See Enums/NavDir
---@return boolean # Whether this CNavArea has an outgoing ( one or two way ) connection **to** given CNavArea in given direction.
function CNavArea:IsConnectedAtSide(navArea, navDirType) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this Nav Area is in the same plane as the given one.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsCoplanar)
---@param navArea CNavArea The Nav Area to test.
---@return boolean # Whether we're coplanar or not.
function CNavArea:IsCoplanar(navArea) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) would damage if traversed, as set by [CNavArea:MarkAsDamaging](https://wiki.facepunch.com/gmod/CNavArea:MarkAsDamaging).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsDamaging)
---@return boolean # Whether the area is damaging or not
function CNavArea:IsDamaging() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this Nav Area is flat within the tolerance of the **nav_coplanar_slope_limit_displacement** and **nav_coplanar_slope_limit** convars.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsFlat)
---@return boolean # Whether this CNavArea is mostly flat.
function CNavArea:IsFlat() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this area is in the Open List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsOpen)
---@return boolean # Whether this area is in the Open List.
function CNavArea:IsOpen() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether the Open List is empty or not.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsOpenListEmpty)
---@return boolean # Whether the Open List is empty or not.
function CNavArea:IsOpenListEmpty() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns if this position overlaps the Nav Area within the given tolerance.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsOverlapping)
---@param pos Vector The overlapping position to test.
---@param tolerance? number The tolerance of the overlapping, set to 0 for no tolerance.
---@return boolean # Whether the given position overlaps the Nav Area or not.
function CNavArea:IsOverlapping(pos, tolerance) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true if this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) is overlapping the given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsOverlappingArea)
---@param navArea CNavArea The CNavArea to test against.
---@return boolean # True if the given CNavArea overlaps this CNavArea at any point.
function CNavArea:IsOverlappingArea(navArea) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) can see given position.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsPartiallyVisible)
---@param pos Vector The position to test.
---@param ignoreEnt? Entity If set, the given entity will be ignored when doing LOS tests
---@return boolean # Whether the given position is visible from this area
function CNavArea:IsPartiallyVisible(pos, ignoreEnt) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) can potentially see the given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsPotentiallyVisible)
---@param area CNavArea The CNavArea to test.
---@return boolean # Whether the given area is visible from this area
function CNavArea:IsPotentiallyVisible(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns if we're shaped like a square.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsRoughlySquare)
---@return boolean # If we're a square or not.
function CNavArea:IsRoughlySquare() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Whether this Nav Area is placed underwater.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsUnderwater)
---@return boolean # Whether we're underwater or not.
function CNavArea:IsUnderwater() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) is valid or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsValid)
---@return boolean # Whether this CNavArea is valid or not.
function CNavArea:IsValid() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether we can be seen from the given position.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:IsVisible)
---@param pos Vector The position to check.
---@return boolean # Whether we can be seen or not.
---@return Vector # If we can be seen, this is returned with either the center or one of the corners of the Nav Area.
function CNavArea:IsVisible(pos) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Marks the area as blocked and unable to be traversed. See [CNavArea:IsBlocked](https://wiki.facepunch.com/gmod/CNavArea:IsBlocked) and [CNavArea:MarkAsUnblocked](https://wiki.facepunch.com/gmod/CNavArea:MarkAsUnblocked).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:MarkAsBlocked)
---@param teamID? number TeamID to mark the area as blocked for. `-2` means all teams. Only 2 valid teamIDs are supported: `0` and `1`.
function CNavArea:MarkAsBlocked(teamID) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Marks the area as damaging if traversed, for example when, for example having poisonous or no atmosphere, or a temporary fire present. See [CNavArea:IsDamaging](https://wiki.facepunch.com/gmod/CNavArea:IsDamaging).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:MarkAsDamaging)
---@param duration number For how long the area should stay marked as damaging. Multiple calls will overwrite the previous value.
function CNavArea:MarkAsDamaging(duration) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Unblocked this area if it was previously blocked by [CNavArea:MarkAsBlocked](https://wiki.facepunch.com/gmod/CNavArea:MarkAsBlocked).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:MarkAsUnblocked)
---@param teamID? number TeamID to unblock the area for. `-2` means all teams. Only 2 valid teamIDs are supported: `0` and `1`.
function CNavArea:MarkAsUnblocked(teamID) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Drops a corner or all corners of a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) to the ground below it.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:PlaceOnGround)
---@param corner number The corner(s) to drop, uses Enums/NavCorner
function CNavArea:PlaceOnGround(corner) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes a CNavArea from the Open List with the lowest cost to traverse to from the starting node, and returns it.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:PopOpenList)
---@return CNavArea # The CNavArea from the Open List with the lowest cost to traverse to from the starting node.
function CNavArea:PopOpenList() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes the given nav area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:Remove)
function CNavArea:Remove() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes given attributes from given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea). See also [CNavArea:SetAttributes](https://wiki.facepunch.com/gmod/CNavArea:SetAttributes).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:RemoveAttributes)
---@param attribs number The attributes to remove, as a bitflag. See Enums/NAV_MESH.
function CNavArea:RemoveAttributes(attribs) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes this node from the Closed List.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:RemoveFromClosedList)
---@deprecated Does nothing
function CNavArea:RemoveFromClosedList() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the attributes for given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea). See [CNavArea:HasAttributes](https://wiki.facepunch.com/gmod/CNavArea:HasAttributes).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:SetAttributes)
---@param attribs number The attributes to set, as a bitflag. See Enums/NAV_MESH.
function CNavArea:SetAttributes(attribs) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the position of a corner of a nav area.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:SetCorner)
---@param corner number The corner to set, uses Enums/NavCorner
---@param position Vector The new position to set.
function CNavArea:SetCorner(corner, position) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the cost from starting area this area when pathfinding.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:SetCostSoFar)
---@param cost number The cost so far
function CNavArea:SetCostSoFar(cost) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the new parent of this [CNavArea](https://wiki.facepunch.com/gmod/CNavArea).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:SetParent)
---@param parent CNavArea The new parent to set
---@param how number How we get from parent to us using Enums/NavTraverseType
function CNavArea:SetParent(parent, how) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the Place of the nav area.
---
--- There is a limit of 256 unique places per `.nav` file.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:SetPlace)
---@param place string Set to `""` to remove place from the nav area. There's a limit of 255 characters.
---@return boolean # Returns true of operation succeeded, false otherwise.
function CNavArea:SetPlace(place) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the total cost when passing from starting area to the goal area through this node.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:SetTotalCost)
---@param cost number The total cost of the path to set.
---
--- Must be above or equal 0.
function CNavArea:SetTotalCost(cost) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Moves this open list to appropriate position based on its [CNavArea:GetTotalCost](https://wiki.facepunch.com/gmod/CNavArea:GetTotalCost) compared to the total cost of other areas in the open list.
---
--- Used in pathfinding via the [A* algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm).
---
--- More information can be found on the [Simple Pathfinding](https://wiki.facepunch.com/gmod/Simple_Pathfinding) page.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavArea:UpdateOnOpenList)
function CNavArea:UpdateOnOpenList() end
