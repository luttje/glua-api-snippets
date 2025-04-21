---@meta

--- A panel that draws a sprite on the player's HUD with the given [IMaterial](https://wiki.facepunch.com/gmod/IMaterial), [Global.Color](https://wiki.facepunch.com/gmod/Global.Color) and rotation.
---
--- A shortcut for this is [Global.CreateSprite](https://wiki.facepunch.com/gmod/Global.CreateSprite)().
---@class DSprite : DPanel
local DSprite = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets the color the sprite is using as a modifier.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:GetColor)
---@return table # The Global.Color being used.
function DSprite:GetColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the value set by [DSprite:SetHandle](https://wiki.facepunch.com/gmod/DSprite:SetHandle)
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:GetHandle)
---@return Vector #
function DSprite:GetHandle() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets the material the sprite is using.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:GetMaterial)
---@return IMaterial # The material in use.
function DSprite:GetMaterial() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets the 2D rotation angle of the sprite, in the plane of the screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:GetRotation)
---@return number # The anti-clockwise rotation in degrees.
function DSprite:GetRotation() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the color modifier for the sprite.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:SetColor)
---@param color table The Global.Color to use.
function DSprite:SetColor(color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Seems to be an unused feature. Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:SetHandle)
---@param vec Vector
function DSprite:SetHandle(vec) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the source material for the sprite.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:SetMaterial)
---@param material IMaterial The material to use. This will ideally be an [UnlitGeneric](https://developer.valvesoftware.com/wiki/UnlitGeneric).
function DSprite:SetMaterial(material) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the 2D rotation angle of the sprite, in the plane of the screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSprite:SetRotation)
---@param ang number The anti-clockwise rotation in degrees.
function DSprite:SetRotation(ang) end
