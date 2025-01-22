---@meta

--- An object that represents a ladder for Nextbots.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder)
---@class CNavLadder
local CNavLadder = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Connects this ladder to a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) with a one way connection. ( From this ladder to the target area ).
---
--- See [CNavArea:ConnectTo](https://wiki.facepunch.com/gmod/CNavArea:ConnectTo) for making the connection from area to ladder.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:ConnectTo)
---@param area CNavArea The area this ladder leads to.
function CNavLadder:ConnectTo(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Disconnects this ladder from given area in a single direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:Disconnect)
---@param area CNavArea The CNavArea this to disconnect from.
function CNavLadder:Disconnect(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the bottom most position of the ladder.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetBottom)
---@return Vector # The bottom most position of the ladder.
function CNavLadder:GetBottom() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the bottom area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetBottomArea)
---@return CNavArea #
function CNavLadder:GetBottomArea() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder)s unique ID.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetID)
---@return number # The unique ID.
function CNavLadder:GetID() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the length of the ladder.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetLength)
---@return number # The length of the ladder.
function CNavLadder:GetLength() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the direction of this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder). ( The direction in which players back will be facing if they are looking directly at the ladder )
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetNormal)
---@return Vector # The direction of this CNavLadder.
function CNavLadder:GetNormal() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the world position based on given height relative to the ladder.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetPosAtHeight)
---@param height number The Z position in world space coordinates.
---@return Vector # The closest point on the ladder to that height.
function CNavLadder:GetPosAtHeight(height) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the topmost position of the ladder.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetTop)
---@return Vector # The topmost position of the ladder.
function CNavLadder:GetTop() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the top behind [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetTopBehindArea)
---@return CNavArea # The top behind CNavArea of the CNavLadder.
function CNavLadder:GetTopBehindArea() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the top forward [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetTopForwardArea)
---@return CNavArea # The top forward CNavArea of the CNavLadder.
function CNavLadder:GetTopForwardArea() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the top left [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetTopLeftArea)
---@return CNavArea # The top left CNavArea of the CNavLadder.
function CNavLadder:GetTopLeftArea() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the top right [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetTopRightArea)
---@return CNavArea # The top right CNavArea of the CNavLadder.
function CNavLadder:GetTopRightArea() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the width of the ladder in Hammer Units.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:GetWidth)
---@return number # The width of the ladder in Hammer Units.
function CNavLadder:GetWidth() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder) has an outgoing ( one or two way ) connection **to** given [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) in given direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:IsConnectedAtSide)
---@param navArea CNavArea The CNavArea to test against.
---@param navDirType number The direction, in which to look for the connection. See Enums/NavDir
---@return boolean # Whether this CNavLadder has an outgoing ( one or two way ) connection **to** given CNavArea in given direction.
function CNavLadder:IsConnectedAtSide(navArea, navDirType) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns whether this [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder) is valid or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:IsValid)
---@return boolean # Whether this CNavLadder is valid or not.
function CNavLadder:IsValid() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes the given nav ladder.
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:Remove)
function CNavLadder:Remove() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the bottom area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:SetBottomArea)
---@param area CNavArea
function CNavLadder:SetBottomArea(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the top behind area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:SetTopBehindArea)
---@param area CNavArea
function CNavLadder:SetTopBehindArea(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the top forward area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:SetTopForwardArea)
---@param area CNavArea
function CNavLadder:SetTopForwardArea(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the top left area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:SetTopLeftArea)
---@param area CNavArea
function CNavLadder:SetTopLeftArea(area) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the top right area of the [CNavLadder](https://wiki.facepunch.com/gmod/CNavLadder).
---
---[View wiki](https://wiki.facepunch.com/gmod/CNavLadder:SetTopRightArea)
---@param area CNavArea
function CNavLadder:SetTopRightArea(area) end
