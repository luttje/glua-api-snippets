---@meta

---
--- 		Similarly to DIconLayout, this lays out panels in two dimensions as tiles.
---
--- 		The difference between this and DIconLayout is that DIconLayout items all have the same height while
--- 		DTileLayout items do not have this enforcement.
--- 		DTileLayout will find the best way to "pack" its children.
--- 		For example, in a two column layout, a item of height 2 units will be placed in one column while
--- 		two items of height 1 unit will be placed in the other column.
---
--- 		It is worth noting however that because this panel iterates through its children in an undefined order and lays out while
--- 		it is iterating, there is no guarantee that this packing will lead to the lowest possible height.
---
--- 		This is used by the spawnmenu to arrange spawnicons.
---
--- 		The base size defines the smallest a tile can be, and it will resize vertically to accommodate all child panels.
--- 		The number of elements in each row is determined by the base size and width.
---
--- 		It also optionally permits the rearrangement of these tiles.
--- 		To enable this functionality, call DDragBase:MakeDroppable on the DTileLayout with a unique identifier.
--- 		All panels added following this will be moveable.
--- 	Creates a DTileLayout within a DFrame, sets the base size and adds 32 DLabels.
---@class DTileLayout : DDragBase
local DTileLayout = {}

---[CLIENT] Clears the panel's tile table. Used by DTileLayout:LayoutTiles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:ClearTiles)
function DTileLayout:ClearTiles() end

---[CLIENT] Called to designate a range of tiles as occupied by a panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:ConsumeTiles)
---@param x number The x coordinate of the top-left corner of the panel.
---@param y number The y coordinate of the top-left corner of the panel.
---@param w number The panel's width.
---@param h number The panel's height.
function DTileLayout:ConsumeTiles(x, y, w, h) end

---[CLIENT] Creates and returns an exact copy of the DTileLayout.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:Copy)
---@return Panel # The created copy.
function DTileLayout:Copy() end

---[CLIENT] Creates copies of all the children from the given panel object and parents them to this one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:CopyContents)
---@param source Panel The source panel from which to copy all children.
function DTileLayout:CopyContents(source) end

---[CLIENT] Finds the coordinates of the first group of free tiles that fit the given size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:FindFreeTile)
---@param x number The x coordinate to start looking from.
---@param y number The y coordinate to start looking from.
---@param w number The needed width.
---@param h number The needed height.
---@return number # The x coordinate of the found available space.
---@return number # The y coordinate of the found available space.
function DTileLayout:FindFreeTile(x, y, w, h) end

---[CLIENT] Determines if a group of tiles is vacant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:FitsInTile)
---@param x number The x coordinate of the first tile.
---@param y number The y coordinate of the first tile.
---@param w number The width needed.
---@param h number The height needed.
---@return boolean # Whether or not this group is available for occupation.
function DTileLayout:FitsInTile(x, y, w, h) end

---[CLIENT] Returns the size of each single tile, set with DTileLayout:SetBaseSize.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:GetBaseSize)
---@return number # Base tile size.
function DTileLayout:GetBaseSize() end

---[CLIENT] Returns the border spacing set by DTileLayout:SetBorder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:GetBorder)
---@return number # The border spacing
function DTileLayout:GetBorder() end

---[CLIENT] Returns the minimum height the DTileLayout can resize to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:GetMinHeight)
---@return number # The minimum height the panel can shrink to.
function DTileLayout:GetMinHeight() end

---[CLIENT] Returns the X axis spacing between 2 elements set by DTileLayout:SetSpaceX.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:GetSpaceX)
---@return number #
function DTileLayout:GetSpaceX() end

---[CLIENT] Returns the Y axis spacing between 2 elements set by DTileLayout:SetSpaceY.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:GetSpaceY)
---@return number #
function DTileLayout:GetSpaceY() end

---[CLIENT] Gets the occupied state of a tile.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:GetTile)
---@param x number The x coordinate of the tile.
---@param y number The y coordinate of the tile.
---@return any # The occupied state of the tile, normally `1` or `nil`.
function DTileLayout:GetTile(x, y) end

---[CLIENT] Resets the last width/height info, and invalidates the panel's layout, causing it to recalculate all child positions. It is called whenever a child is added or removed, and can be called to refresh the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:Layout)
function DTileLayout:Layout() end

---[CLIENT] Called by PANEL:PerformLayout to arrange and lay out the child panels, if it has changed in size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:LayoutTiles)
function DTileLayout:LayoutTiles() end

---[CLIENT] Sets the size of a single tile. If a child panel is larger than this size, it will occupy several tiles.
---
--- If you are setting the size of the children properly then you probably don't need to change this.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:SetBaseSize)
---@param size number The size of each tile. It is recommended you use `2ⁿ` (`16, 32, 64...`) numbers, and those above `4`, as numbers lower than this will result in many tiles being processed and therefore slow operation.
function DTileLayout:SetBaseSize(size) end

---[CLIENT] Sets the spacing between the border/edge of the DTileLayout and all the elements inside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:SetBorder)
---@param border number
function DTileLayout:SetBorder(border) end

---[CLIENT] Determines the minimum height the DTileLayout will resize to. This is useful if child panels will be added/removed often.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:SetMinHeight)
---@param minH number The minimum height the panel can shrink to.
function DTileLayout:SetMinHeight(minH) end

---[CLIENT] Sets the spacing between 2 elements in the DTileLayout on the X axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:SetSpaceX)
---@param spacingX number New X axis spacing.
function DTileLayout:SetSpaceX(spacingX) end

---[CLIENT] Sets the spacing between 2 elements in the DTileLayout on the Y axis.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:SetSpaceY)
---@param spaceY number New Y axis spacing.
function DTileLayout:SetSpaceY(spaceY) end

---[CLIENT] Called to set the occupied state of a tile.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTileLayout:SetTile)
---@param x number The x coordinate of the tile.
---@param y number The y coordinate of the tile.
---@param state any The new state of the tile, normally `1` or `nil`.
function DTileLayout:SetTile(x, y, state) end
