---@meta

--- An object that represents a ladder for Nextbots.
---@class CNavLadder
local CNavLadder = {}

---[SERVER] Connects this ladder to a CNavArea with a one way connection. ( From this ladder to the target area ).
---
--- See CNavArea:ConnectTo for making the connection from area to ladder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:ConnectTo)
---@param area CNavArea The area this ladder leads to.
function CNavLadder:ConnectTo(area) end

---[SERVER] Disconnects this ladder from given area in a single direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:Disconnect)
---@param area CNavArea The CNavArea this to disconnect from.
function CNavLadder:Disconnect(area) end

---[SERVER] Returns the bottom most position of the ladder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetBottom)
---@return Vector # The bottom most position of the ladder.
function CNavLadder:GetBottom() end

---[SERVER] Returns the bottom area of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetBottomArea)
---@return CNavArea #
function CNavLadder:GetBottomArea() end

---[SERVER] Returns this CNavLadders unique ID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetID)
---@return number # The unique ID.
function CNavLadder:GetID() end

---[SERVER] Returns the length of the ladder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetLength)
---@return number # The length of the ladder.
function CNavLadder:GetLength() end

---[SERVER] Returns the direction of this CNavLadder. ( The direction in which players back will be facing if they are looking directly at the ladder )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetNormal)
---@return Vector # The direction of this CNavLadder.
function CNavLadder:GetNormal() end

---[SERVER] Returns the world position based on given height relative to the ladder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetPosAtHeight)
---@param height number The Z position in world space coordinates.
---@return Vector # The closest point on the ladder to that height.
function CNavLadder:GetPosAtHeight(height) end

---[SERVER] Returns the topmost position of the ladder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetTop)
---@return Vector # The topmost position of the ladder.
function CNavLadder:GetTop() end

---[SERVER] Returns the top behind CNavArea of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetTopBehindArea)
---@return CNavArea # The top behind CNavArea of the CNavLadder.
function CNavLadder:GetTopBehindArea() end

---[SERVER] Returns the top forward CNavArea of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetTopForwardArea)
---@return CNavArea # The top forward CNavArea of the CNavLadder.
function CNavLadder:GetTopForwardArea() end

---[SERVER] Returns the top left CNavArea of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetTopLeftArea)
---@return CNavArea # The top left CNavArea of the CNavLadder.
function CNavLadder:GetTopLeftArea() end

---[SERVER] Returns the top right CNavArea of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetTopRightArea)
---@return CNavArea # The top right CNavArea of the CNavLadder.
function CNavLadder:GetTopRightArea() end

---[SERVER] Returns the width of the ladder in Hammer Units.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:GetWidth)
---@return number # The width of the ladder in Hammer Units.
function CNavLadder:GetWidth() end

---[SERVER] Returns whether this CNavLadder has an outgoing ( one or two way ) connection **to** given CNavArea in given direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:IsConnectedAtSide)
---@param navArea CNavArea The CNavArea to test against.
---@param navDirType number The direction, in which to look for the connection. See Enums/NavDir
---@return boolean # Whether this CNavLadder has an outgoing ( one or two way ) connection **to** given CNavArea in given direction.
function CNavLadder:IsConnectedAtSide(navArea, navDirType) end

---[SERVER] Returns whether this CNavLadder is valid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:IsValid)
---@return boolean # Whether this CNavLadder is valid or not.
function CNavLadder:IsValid() end

---[SERVER] Removes the given nav ladder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:Remove)
function CNavLadder:Remove() end

---[SERVER] Sets the bottom area of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:SetBottomArea)
---@param area CNavArea
function CNavLadder:SetBottomArea(area) end

---[SERVER] Sets the top behind area of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:SetTopBehindArea)
---@param area CNavArea
function CNavLadder:SetTopBehindArea(area) end

---[SERVER] Sets the top forward area of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:SetTopForwardArea)
---@param area CNavArea
function CNavLadder:SetTopForwardArea(area) end

---[SERVER] Sets the top left area of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:SetTopLeftArea)
---@param area CNavArea
function CNavLadder:SetTopLeftArea(area) end

---[SERVER] Sets the top right area of the CNavLadder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CNavLadder:SetTopRightArea)
---@param area CNavArea
function CNavLadder:SetTopRightArea(area) end
