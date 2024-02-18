---@meta

--- The navigation mesh library. To be used with CNavArea.
---
--- The navigation mesh is used by NextBot to calculate path to its target.
navmesh = {}

---[SERVER] Add this position and normal to the list of walkable positions, used before map generation with navmesh.BeginGeneration
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.AddWalkableSeed)
---@param pos Vector The terrain position.
---@param dir Vector The normal of this terrain position.
function navmesh.AddWalkableSeed(pos, dir) end

---[SERVER] Starts the generation of a new navmesh.
---
--- This process is highly resource intensive and it's not wise to use during normal gameplay
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.BeginGeneration)
function navmesh.BeginGeneration() end

---[SERVER] Clears all the walkable positions, used before calling navmesh.BeginGeneration.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.ClearWalkableSeeds)
function navmesh.ClearWalkableSeeds() end

---[SERVER] Creates a new CNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.CreateNavArea)
---@param corner Vector The first corner of the new CNavArea
---@param opposite_corner Vector The opposite (diagonally) corner of the new CNavArea
---@return CNavArea # The new CNavArea or nil if we failed for some reason.
function navmesh.CreateNavArea(corner, opposite_corner) end

---[SERVER] Creates a new CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.CreateNavLadder)
---@param top Vector The top position of the ladder.
---@param bottom Vector The bottom position of the ladder.
---@param width number Width for the new ladder.
---@param dir Vector Directional vector in which way the ladder should be facing. Please note that ladders can only face in the 4 cardinal directions - NORTH, SOUTH, WEST, EAST.
---@param maxHeightAboveTopArea? number If above 0, will limit how much the top of the ladder can be adjusted to the closest CNavArea when automatically connecting the newly created ladder to pre-existing nav areas.
---@return CNavLadder # The new CNavLadder or nil if we failed for some reason.
function navmesh.CreateNavLadder(top, bottom, width, dir, maxHeightAboveTopArea) end

---[SERVER] Returns a list of areas within distance, used to find hiding spots by NextBots for example.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.Find)
---@param pos Vector The position to search around. This position will be used to find the closest area to search from.
---@param radius number Radius to search within
---@param stepHeight number Maximum step up height allowed
---@param dropHeight number Maximum step down (fall distance) allowed
---@return table # A list of found CNavAreas.
function navmesh.Find(pos, radius, stepHeight, dropHeight) end

---[SERVER] Returns a list of CNavAreas overlapping the given cube extents.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.FindInBox)
---@param pos1 Vector The start position of the cube to search in.
---@param pos2 Vector The "end" position of the cube to search in. This is the opposite corner of the cube, diagonally.
---@return table # A list of found CNavAreas.
function navmesh.FindInBox(pos1, pos2) end

---[SERVER] Returns an integer indexed table of all CNavAreas on the current map. If the map doesn't have a navmesh generated then this will return an empty table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetAllNavAreas)
---@return table # A table of all the CNavAreas on the current map.
function navmesh.GetAllNavAreas() end

---[SERVER] Returns a table of all blocked CNavAreas on the current map. See CNavArea:MarkAsBlocked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetBlockedAreas)
---@return table # A table of all the blocked CNavAreas on the current map.
function navmesh.GetBlockedAreas() end

---[SERVER] Returns the position of the edit cursor when nav_edit is set to 1.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetEditCursorPosition)
---@return Vector # The position of the edit cursor.
function navmesh.GetEditCursorPosition() end

---[SERVER] Finds the closest standable ground at, above, or below the provided position.
---
--- The ground must have at least 32 units of empty space above it to be considered by this function, unless 16 layers are tested without finding valid ground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetGroundHeight)
---@param pos Vector Position to find the closest ground for.
---@return number # The height of the ground layer.
---@return Vector # The normal of the ground layer.
function navmesh.GetGroundHeight(pos) end

---[SERVER] Returns the currently marked CNavArea, for use with editing console commands.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetMarkedArea)
---@return CNavArea # The currently marked CNavArea.
function navmesh.GetMarkedArea() end

---[SERVER] Returns the currently marked CNavLadder, for use with editing console commands.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetMarkedLadder)
---@return CNavLadder # The currently marked CNavLadder.
function navmesh.GetMarkedLadder() end

---[SERVER] Returns the Nav Area contained in this position that also satisfies the elevation limit.
---
--- This function will properly see blocked CNavAreas. See navmesh.GetNearestNavArea.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetNavArea)
---@param pos Vector The position to search for.
---@param beneathLimit number The elevation limit at which the Nav Area will be searched.
---@return CNavArea # The nav area.
function navmesh.GetNavArea(pos, beneathLimit) end

---[SERVER] Returns a CNavArea by the given ID.
---
--- Avoid calling this function every frame, as internally it does a lookup trough all the CNavAreas, call this once and store the result
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetNavAreaByID)
---@param id number ID of the CNavArea to get. Starts with 1.
---@return CNavArea # The CNavArea with given ID.
function navmesh.GetNavAreaByID(id) end

---[SERVER] Returns the total count of nav areas on the map. If you want to get all nav areas, use navmesh.GetAllNavAreas instead as nav areas IDs are not always sequential.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetNavAreaCount)
---@return number # The total count of nav areas on the map.
function navmesh.GetNavAreaCount() end

---[SERVER] Returns a CNavLadder by the given ID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetNavLadderByID)
---@param id number ID of the CNavLadder to get. Starts with 1.
---@return CNavLadder # The CNavLadder with given ID.
function navmesh.GetNavLadderByID(id) end

---[SERVER] Returns the closest CNavArea to given position at the same height, or beneath it.
---
--- This function will ignore blocked CNavAreas. See navmesh.GetNavArea for a function that does see blocked areas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetNearestNavArea)
---@param pos Vector The position to look from
---@param anyZ? boolean This argument is ignored and has no effect
---@param maxDist? number This is the maximum distance from the given position that the function will look for a CNavArea
---@param checkLOS? boolean If this is set to true then the function will internally do a util.TraceLine from the starting position to each potential CNavArea with a [MASK_NPCSOLID_BRUSHONLY](https://wiki.facepunch.com/gmod/Enums/MASK). If the trace fails then the CNavArea is ignored.
---
--- If this is set to false then the function will find the closest CNavArea through anything, including the world.
---@param checkGround? boolean If checkGround is true then this function will internally call navmesh.GetNavArea to check if there is a CNavArea directly below the position, and return it if so, before checking anywhere else.
---@param team? number This will internally call CNavArea:IsBlocked to check if the target CNavArea is not to be navigated by the given team. Currently this appears to do nothing.
---@return CNavArea # The closest CNavArea found with the given parameters, or a NULL CNavArea if one was not found.
function navmesh.GetNearestNavArea(pos, anyZ, maxDist, checkLOS, checkGround, team) end

---[SERVER] Returns the classname of the player spawn entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.GetPlayerSpawnName)
---@return string # The classname of the spawn point entity. By default returns "info_player_start"
function navmesh.GetPlayerSpawnName() end

---[SERVER] Whether we're currently generating a new navmesh with navmesh.BeginGeneration.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.IsGenerating)
---@return boolean # Whether we're generating a nav mesh or not.
function navmesh.IsGenerating() end

---[SERVER] Returns true if a navmesh has been loaded when loading the map.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.IsLoaded)
---@return boolean # Whether a navmesh has been loaded when loading the map.
function navmesh.IsLoaded() end

---[SERVER] Loads a new navmesh from the .nav file for current map discarding any changes made to the navmesh previously.
---
--- 			Calling this function too soon, causes the Server to crash!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.Load)
function navmesh.Load() end

---[SERVER] Deletes every CNavArea and CNavLadder on the map **without saving the changes**.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.Reset)
function navmesh.Reset() end

---[SERVER] Saves any changes made to navmesh to the .nav file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.Save)
function navmesh.Save() end

---[SERVER] Sets the CNavArea as marked, so it can be used with editing console commands.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.SetMarkedArea)
---@param area CNavArea The CNavArea to set as the marked area.
function navmesh.SetMarkedArea(area) end

---[SERVER] Sets the CNavLadder as marked, so it can be used with editing console commands.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.SetMarkedLadder)
---@param area CNavLadder The CNavLadder to set as the marked ladder.
function navmesh.SetMarkedLadder(area) end

---[SERVER] Sets the classname of the default spawn point entity, used before generating a new navmesh with navmesh.BeginGeneration.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/navmesh.SetPlayerSpawnName)
---@param spawnPointClass string The classname of what the player uses to spawn, automatically adds it to the walkable positions during map generation.
function navmesh.SetPlayerSpawnName(spawnPointClass) end
