---@meta

--- List of all possible functions available for effect data. This is the object returned by the Global.EffectData function and is required for util.Effect function.
---@class CEffectData
local CEffectData = {}

---[SHARED] Returns the angles of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetAngles)
---@return Angle # The angles of the effect
function CEffectData:GetAngles() end

---[SHARED] Returns the attachment ID for the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetAttachment)
---@return number # The attachment ID of the effect.
function CEffectData:GetAttachment() end

---[SHARED] Returns byte which represents the color of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetColor)
---@return number # The color of the effect
function CEffectData:GetColor() end

---[SHARED] Returns the damage type of the effect
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetDamageType)
---@return number # Damage type of the effect, see Enums/DMG
function CEffectData:GetDamageType() end

---[SERVER] Returns the entity index of the entity set for the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetEntIndex)
---@return number # The entity index of the entity set for the effect.
function CEffectData:GetEntIndex() end

---[SHARED] Returns the entity assigned to the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetEntity)
---@return Entity # The entity assigned to the effect
function CEffectData:GetEntity() end

---[SHARED] Returns the flags of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetFlags)
---@return number # The flags of the effect.
function CEffectData:GetFlags() end

---[SHARED] Returns the hit box ID of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetHitBox)
---@return number # The hit box ID of the effect.
function CEffectData:GetHitBox() end

---[SHARED] Returns the magnitude of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetMagnitude)
---@return number # The magnitude of the effect.
function CEffectData:GetMagnitude() end

---[SHARED] Returns the material ID of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetMaterialIndex)
---@return number # The material ID of the effect.
function CEffectData:GetMaterialIndex() end

---[SHARED] Returns the normalized direction vector of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetNormal)
---@return Vector # The normalized direction vector of the effect.
function CEffectData:GetNormal() end

---[SHARED] Returns the origin position of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetOrigin)
---@return Vector # The origin position of the effect.
function CEffectData:GetOrigin() end

---[SHARED] Returns the radius of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetRadius)
---@return number # The radius of the effect.
function CEffectData:GetRadius() end

---[SHARED] Returns the scale of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetScale)
---@return number # The scale of the effect
function CEffectData:GetScale() end

---[SHARED] Returns the start position of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetStart)
---@return Vector # The start position of the effect
function CEffectData:GetStart() end

---[SHARED] Returns the surface property index of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:GetSurfaceProp)
---@return number # The surface property index of the effect
function CEffectData:GetSurfaceProp() end

---[SHARED] Sets the angles of the effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetAngles)
---@param ang Angle The new angles to be set.
function CEffectData:SetAngles(ang) end

---[SHARED] Sets the attachment id of the effect to be created with this effect data.
---
--- This is internally stored as an integer, but only the first 5 bits will be networked, effectively limiting this function to 0-31 range.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetAttachment)
---@param attachment number New attachment ID of the effect.
function CEffectData:SetAttachment(attachment) end

---[SHARED] Sets the "color" of the effect.
---
--- All this does is provide an addition 8 bits of data for the effect to use. What this will actually do will vary from effect to effect, depending on how a specific effect uses this given data, if at all.
---
--- Internally stored as an integer, but only first 8 bits are networked, effectively limiting this function to 0-255 range.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetColor)
---@param color number Color represented by a byte.
function CEffectData:SetColor(color) end

---[SHARED] Sets the damage type of the effect to be created with this effect data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetDamageType)
---@param damageType number Damage type, see Enums/DMG.
function CEffectData:SetDamageType(damageType) end

---[SERVER] Sets the entity of the effect via its index.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetEntIndex)
---@param entIndex number The entity index to be set.
function CEffectData:SetEntIndex(entIndex) end

---[SHARED] Sets the entity of the effect to be created with this effect data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetEntity)
---@param entity Entity Entity of the effect, mostly used for parenting.
function CEffectData:SetEntity(entity) end

---[SHARED] Sets the flags of the effect. Can be used to change the appearance of a MuzzleFlash effect.
---
--- ## Example values for MuzzleFlash effect
--- Flags |  Description |
--- ------|--------------|
--- 1 | Regular muzzleflash|
--- 5 | Combine muzzleflash|
--- 7 | Regular muzzle but bigger|
---
--- Internally stored as an integer, but only first 8 bits are networked, effectively limiting this function to `0-255` range.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetFlags)
---@param flags number The flags of the effect. Each effect has their own flags.
function CEffectData:SetFlags(flags) end

---[SHARED] Sets the hit box index of the effect.
---
--- Internally stored as an integer, but only first 11 bits are networked, effectively limiting this function to 0-2047 range.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetHitBox)
---@param hitBoxIndex number The hit box index of the effect.
function CEffectData:SetHitBox(hitBoxIndex) end

---[SHARED] Sets the magnitude of the effect.
--- Internally stored as a float with 12 bit precision for networking purposes, limited to range of 0-1023.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetMagnitude)
---@param magnitude number The magnitude of the effect.
function CEffectData:SetMagnitude(magnitude) end

---[SHARED] Sets the material index of the effect.
---
--- Internally stored as an integer, but only first 12 bits are networked, effectively limiting this function to 0-4095 range.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetMaterialIndex)
---@param materialIndex number The material index of the effect.
function CEffectData:SetMaterialIndex(materialIndex) end

---[SHARED] Sets the normalized (length=1) direction vector of the effect to be created with this effect data. This **must** be a normalized vector for networking purposes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetNormal)
---@param normal Vector The normalized direction vector of the effect.
function CEffectData:SetNormal(normal) end

---[SHARED] Sets the origin of the effect to be created with this effect data.
--- Limited to world bounds (+-16386 on every axis) and has horrible networking precision. (17 bit float per component)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetOrigin)
---@param origin Vector Origin of the effect.
function CEffectData:SetOrigin(origin) end

---[SHARED] Sets the radius of the effect to be created with this effect data.
---
--- Internally stored as a float, but networked as a 10bit float, and is clamped to 0-1023 range.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetRadius)
---@param radius number Radius of the effect.
function CEffectData:SetRadius(radius) end

---[SHARED] Sets the scale of the effect to be created with this effect data.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetScale)
---@param scale number Scale of the effect.
function CEffectData:SetScale(scale) end

---[SHARED] Sets the start of the effect to be created with this effect data.
--- Limited to world bounds (+-16386 on every axis) and has horrible networking precision. (17 bit float per component)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetStart)
---@param start Vector Start of the effect.
function CEffectData:SetStart(start) end

---[SHARED] Sets the surface property index of the effect.
--- Internally stored as an integer, but only first 8 bits are networked, effectively limiting this function to `-1`-`254` range.(yes, that's not a mistake)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CEffectData:SetSurfaceProp)
---@param surfaceProperties number The surface property index of the effect.
function CEffectData:SetSurfaceProp(surfaceProperties) end
