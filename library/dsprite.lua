---@meta

---@class DSprite : DPanel
local DSprite = {}

---[CLIENT] Gets the color the sprite is using as a modifier.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:GetColor)
---@return table #The Global.Color being used.
function DSprite:GetColor() end

---[CLIENT] No Description
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:GetHandle)
---@return Vector #
function DSprite:GetHandle() end

---[CLIENT] Gets the material the sprite is using.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:GetMaterial)
---@return IMaterial #The material in use.
function DSprite:GetMaterial() end

---[CLIENT] Gets the 2D rotation angle of the sprite, in the plane of the screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:GetRotation)
---@return number #The anti-clockwise rotation in degrees.
function DSprite:GetRotation() end

---[CLIENT] Sets the color modifier for the sprite.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:SetColor)
---@param color table The Global.Color to use.
function DSprite:SetColor(color) end

---[CLIENT] Seems to be an unused feature. Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:SetHandle)
---@param vec Vector
function DSprite:SetHandle(vec) end

---[CLIENT] Sets the source material for the sprite.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:SetMaterial)
---@param material IMaterial The material to use. This will ideally be an [UnlitGeneric](https://developer.valvesoftware.com/wiki/UnlitGeneric).
function DSprite:SetMaterial(material) end

---[CLIENT] Sets the 2D rotation angle of the sprite, in the plane of the screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSprite:SetRotation)
---@param ang number The anti-clockwise rotation in degrees.
function DSprite:SetRotation(ang) end
