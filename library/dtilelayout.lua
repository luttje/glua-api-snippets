---@meta

--- Similarly to [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout), this lays out panels in two dimensions as tiles.
---
--- The difference between this and [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout) is that [DIconLayout](https://wiki.facepunch.com/gmod/DIconLayout) items all have the same height while
--- [DTileLayout](https://wiki.facepunch.com/gmod/DTileLayout) items do not have this enforcement.
--- [DTileLayout](https://wiki.facepunch.com/gmod/DTileLayout) will find the best way to "pack" its children.
--- For example, in a two column layout, a item of height 2 units will be placed in one column while
--- two items of height 1 unit will be placed in the other column.
---
--- It is worth noting however that because this panel iterates through its children in an undefined order and lays out while
--- it is iterating, there is no guarantee that this packing will lead to the lowest possible height.
---
--- This is used by the spawnmenu to arrange spawnicons.
---
--- The base size defines the smallest a tile can be, and it will resize vertically to accommodate all child panels.
--- The number of elements in each row is determined by the base size and width.
---
--- It also optionally permits the rearrangement of these tiles.
--- To enable this functionality, call [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable) on the DTileLayout with a unique identifier.
--- All panels added following this will be moveable.
---@class DTileLayout : DDragBase
local DTileLayout = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Clears the panel's tile table. Used by [DTileLayout:LayoutTiles](https://wiki.facepunch.com/gmod/DTileLayout:LayoutTiles).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:ClearTiles)
function DTileLayout:ClearTiles() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called to designate a range of tiles as occupied by a panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:ConsumeTiles)
---@param x number The x coordinate of the top-left corner of the panel.
---@param y number The y coordinate of the top-left corner of the panel.
---@param w number The panel's width.
---@param h number The panel's height.
function DTileLayout:ConsumeTiles(x, y, w, h) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates and returns an exact copy of the DTileLayout.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:Copy)
---@return Panel # The created copy.
function DTileLayout:Copy() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates copies of all the children from the given panel object and parents them to this one.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:CopyContents)
---@param source Panel The source panel from which to copy all children.
function DTileLayout:CopyContents(source) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Finds the coordinates of the first group of free tiles that fit the given size.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:FindFreeTile)
---@param x number The x coordinate to start looking from.
---@param y number The y coordinate to start looking from.
---@param w number The needed width.
---@param h number The needed height.
---@return number # The x coordinate of the found available space.
---@return number # The y coordinate of the found available space.
function DTileLayout:FindFreeTile(x, y, w, h) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Determines if a group of tiles is vacant.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:FitsInTile)
---@param x number The x coordinate of the first tile.
---@param y number The y coordinate of the first tile.
---@param w number The width needed.
---@param h number The height needed.
---@return boolean # Whether or not this group is available for occupation.
function DTileLayout:FitsInTile(x, y, w, h) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the size of each single tile, set with [DTileLayout:SetBaseSize](https://wiki.facepunch.com/gmod/DTileLayout:SetBaseSize).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:GetBaseSize)
---@return number # Base tile size.
function DTileLayout:GetBaseSize() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the border spacing set by [DTileLayout:SetBorder](https://wiki.facepunch.com/gmod/DTileLayout:SetBorder).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:GetBorder)
---@return number # The border spacing
function DTileLayout:GetBorder() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the minimum height the DTileLayout can resize to.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:GetMinHeight)
---@return number # The minimum height the panel can shrink to.
function DTileLayout:GetMinHeight() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the X axis spacing between 2 elements set by [DTileLayout:SetSpaceX](https://wiki.facepunch.com/gmod/DTileLayout:SetSpaceX).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:GetSpaceX)
---@return number #
function DTileLayout:GetSpaceX() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the Y axis spacing between 2 elements set by [DTileLayout:SetSpaceY](https://wiki.facepunch.com/gmod/DTileLayout:SetSpaceY).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:GetSpaceY)
---@return number #
function DTileLayout:GetSpaceY() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Gets the occupied state of a tile.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:GetTile)
---@param x number The x coordinate of the tile.
---@param y number The y coordinate of the tile.
---@return any # The occupied state of the tile, normally `1` or `nil`.
function DTileLayout:GetTile(x, y) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Resets the last width/height info, and invalidates the panel's layout, causing it to recalculate all child positions. It is called whenever a child is added or removed, and can be called to refresh the panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:Layout)
function DTileLayout:Layout() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by [PANEL:PerformLayout](https://wiki.facepunch.com/gmod/PANEL:PerformLayout) to arrange and lay out the child panels, if it has changed in size.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:LayoutTiles)
function DTileLayout:LayoutTiles() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the size of a single tile. If a child panel is larger than this size, it will occupy several tiles.
---
--- If you are setting the size of the children properly then you probably don't need to change this.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:SetBaseSize)
---@param size number The size of each tile. It is recommended you use `2ⁿ` (`16, 32, 64...`) numbers, and those above `4`, as numbers lower than this will result in many tiles being processed and therefore slow operation.
function DTileLayout:SetBaseSize(size) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the spacing between the border/edge of the [DTileLayout](https://wiki.facepunch.com/gmod/DTileLayout) and all the elements inside.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:SetBorder)
---@param border number
function DTileLayout:SetBorder(border) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Determines the minimum height the DTileLayout will resize to. This is useful if child panels will be added/removed often.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:SetMinHeight)
---@param minH number The minimum height the panel can shrink to.
function DTileLayout:SetMinHeight(minH) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the spacing between 2 elements in the [DTileLayout](https://wiki.facepunch.com/gmod/DTileLayout) on the X axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:SetSpaceX)
---@param spacingX number New X axis spacing.
function DTileLayout:SetSpaceX(spacingX) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the spacing between 2 elements in the [DTileLayout](https://wiki.facepunch.com/gmod/DTileLayout) on the Y axis.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:SetSpaceY)
---@param spaceY number New Y axis spacing.
function DTileLayout:SetSpaceY(spaceY) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called to set the occupied state of a tile.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTileLayout:SetTile)
---@param x number The x coordinate of the tile.
---@param y number The y coordinate of the tile.
---@param state any The new state of the tile, normally `1` or `nil`.
function DTileLayout:SetTile(x, y, state) end
