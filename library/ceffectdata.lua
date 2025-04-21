---@meta

--- List of all possible functions available for effect data. This is the object returned by the [EffectData](https://wiki.facepunch.com/gmod/Global.EffectData) function and is required for [util.Effect](https://wiki.facepunch.com/gmod/util.Effect) function.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData)
---@class CEffectData
local CEffectData = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the angles of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetAngles)
---@return Angle # The angles of the effect
function CEffectData:GetAngles() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the attachment ID for the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetAttachment)
---@return number # The attachment ID of the effect.
function CEffectData:GetAttachment() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns byte which represents the color of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetColor)
---@return number # The color of the effect
function CEffectData:GetColor() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the damage type of the effect
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetDamageType)
---@return number # Damage type of the effect, see Enums/DMG
function CEffectData:GetDamageType() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the entity index of the entity set for the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetEntIndex)
---@return number # The entity index of the entity set for the effect.
function CEffectData:GetEntIndex() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the entity assigned to the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetEntity)
---@return Entity # The entity assigned to the effect
function CEffectData:GetEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the flags of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetFlags)
---@return number # The flags of the effect.
function CEffectData:GetFlags() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the hit box ID of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetHitBox)
---@return number # The hit box ID of the effect.
function CEffectData:GetHitBox() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the magnitude of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetMagnitude)
---@return number # The magnitude of the effect.
function CEffectData:GetMagnitude() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the material ID of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetMaterialIndex)
---@return number # The material ID of the effect.
function CEffectData:GetMaterialIndex() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the normalized direction vector of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetNormal)
---@return Vector # The normalized direction vector of the effect.
function CEffectData:GetNormal() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the origin position of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetOrigin)
---@return Vector # The origin position of the effect.
function CEffectData:GetOrigin() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the radius of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetRadius)
---@return number # The radius of the effect.
function CEffectData:GetRadius() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the scale of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetScale)
---@return number # The scale of the effect
function CEffectData:GetScale() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the start position of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetStart)
---@return Vector # The start position of the effect
function CEffectData:GetStart() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the surface property index of the effect. See [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) for more details about what they are.
---
--- See [CEffectData:SetSurfaceProp](https://wiki.facepunch.com/gmod/CEffectData:SetSurfaceProp) for details about limitations of this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:GetSurfaceProp)
---@return number # The surface property index of the effect.
function CEffectData:GetSurfaceProp() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the angles of the effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetAngles)
---@param ang Angle The new angles to be set.
function CEffectData:SetAngles(ang) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the attachment id of the effect to be created with this effect data.
---
--- **NOTE**: This is internally stored as an integer, but only the first 5 bits will be networked, effectively limiting this function to 0-31 range.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetAttachment)
---@param attachment number New attachment ID of the effect.
function CEffectData:SetAttachment(attachment) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the "color" of the effect.
---
--- All this does is provide an addition 8 bits of data for the effect to use. What this will actually do will vary from effect to effect, depending on how a specific effect uses this given data, if at all.
---
--- **NOTE**: Internally stored as an integer, but only first 8 bits are networked, effectively limiting this function to 0-255 range.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetColor)
---@param color number Color represented by a byte.
function CEffectData:SetColor(color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the damage type of the effect to be created with this effect data.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetDamageType)
---@param damageType number Damage type, see Enums/DMG.
function CEffectData:SetDamageType(damageType) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Sets the entity of the effect via its index.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetEntIndex)
---@param entIndex number The entity index to be set.
function CEffectData:SetEntIndex(entIndex) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the entity of the effect to be created with this effect data.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetEntity)
---@param entity Entity Entity of the effect, mostly used for parenting.
function CEffectData:SetEntity(entity) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the flags of the effect. Can be used to change the appearance of a MuzzleFlash effect.
---
--- ## Example values for MuzzleFlash effect
--- Flags |  Description |
--- ------|--------------|
--- 1 | Regular muzzleflash|
--- 5 | Combine muzzleflash|
--- 7 | Regular muzzle but bigger|
---
--- **NOTE**: Internally stored as an integer, but only first 8 bits are networked, effectively limiting this function to `0-255` range.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetFlags)
---@param flags number The flags of the effect. Each effect has their own flags.
function CEffectData:SetFlags(flags) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the hit box index of the effect.
---
--- **NOTE**: Internally stored as an integer, but only first 11 bits are networked, effectively limiting this function to 0-2047 range.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetHitBox)
---@param hitBoxIndex number The hit box index of the effect.
function CEffectData:SetHitBox(hitBoxIndex) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the magnitude of the effect.
--- **NOTE**: Internally stored as a float with 12 bit precision for networking purposes, limited to range of 0-1023.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetMagnitude)
---@param magnitude number The magnitude of the effect.
function CEffectData:SetMagnitude(magnitude) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the material index of the effect.
---
--- **NOTE**: Internally stored as an integer, but only first 12 bits are networked, effectively limiting this function to 0-4095 range.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetMaterialIndex)
---@param materialIndex number The material index of the effect.
function CEffectData:SetMaterialIndex(materialIndex) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the normalized (length=1) direction vector of the effect to be created with this effect data. This **must** be a normalized vector for networking purposes.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetNormal)
---@param normal Vector The normalized direction vector of the effect.
function CEffectData:SetNormal(normal) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the origin of the effect to be created with this effect data.
--- **NOTE**: Limited to world bounds (+-16386 on every axis) and has horrible networking precision. (17 bit float per component)
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetOrigin)
---@param origin Vector Origin of the effect.
function CEffectData:SetOrigin(origin) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the radius of the effect to be created with this effect data.
---
--- **NOTE**: Internally stored as a float, but networked as a 10bit float, and is clamped to 0-1023 range.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetRadius)
---@param radius number Radius of the effect.
function CEffectData:SetRadius(radius) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the scale of the effect to be created with this effect data.
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetScale)
---@param scale number Scale of the effect.
function CEffectData:SetScale(scale) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the start of the effect to be created with this effect data.
--- **NOTE**: Limited to world bounds (+-16386 on every axis) and has horrible networking precision. (17 bit float per component)
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetStart)
---@param start Vector Start of the effect.
function CEffectData:SetStart(start) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the surface property index of the effect. See [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) for more details about what they are.
---
--- **NOTE**: Internally stored as an integer, but only first 8 bits are networked, effectively limiting this function to `-1`-`254` range. (Yes, that's not a mistake, `-1` signifying an invalid value.)
---
---[View wiki](https://wiki.facepunch.com/gmod/CEffectData:SetSurfaceProp)
---@param surfaceProperties number The surface property index of the effect.
function CEffectData:SetSurfaceProp(surfaceProperties) end
