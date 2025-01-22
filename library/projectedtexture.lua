---@meta

--- A client side projected texture, created by [Global.ProjectedTexture](https://wiki.facepunch.com/gmod/Global.ProjectedTexture).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture)
---@class ProjectedTexture
local ProjectedTexture = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the angle of the ProjectedTexture, which were previously set by [ProjectedTexture:SetAngles](https://wiki.facepunch.com/gmod/ProjectedTexture:SetAngles)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetAngles)
---@return Angle # The angles of the ProjectedTexture.
function ProjectedTexture:GetAngles() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the brightness of the ProjectedTexture, which was previously set by [ProjectedTexture:SetBrightness](https://wiki.facepunch.com/gmod/ProjectedTexture:SetBrightness)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetBrightness)
---@return number # The brightness of the ProjectedTexture.
function ProjectedTexture:GetBrightness() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the color of the ProjectedTexture, which was previously set by [ProjectedTexture:SetColor](https://wiki.facepunch.com/gmod/ProjectedTexture:SetColor).
---
--- The returned color will not have the color metatable.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetColor)
---@return table # Color, the color of the ProjectedTexture.
function ProjectedTexture:GetColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the constant attenuation of the projected texture, which can also be set by [ProjectedTexture:SetConstantAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetConstantAttenuation).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetConstantAttenuation)
---@return number # The constant attenuation
function ProjectedTexture:GetConstantAttenuation() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether shadows are enabled for this ProjectedTexture, which was previously set by [ProjectedTexture:SetEnableShadows](https://wiki.facepunch.com/gmod/ProjectedTexture:SetEnableShadows)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetEnableShadows)
---@return boolean # Whether shadows are enabled.
function ProjectedTexture:GetEnableShadows() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the projection distance of the ProjectedTexture, which was previously set by [ProjectedTexture:SetFarZ](https://wiki.facepunch.com/gmod/ProjectedTexture:SetFarZ)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetFarZ)
---@return number # The projection distance of the ProjectedTexture.
function ProjectedTexture:GetFarZ() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the horizontal FOV of the ProjectedTexture, which was previously set by [ProjectedTexture:SetHorizontalFOV](https://wiki.facepunch.com/gmod/ProjectedTexture:SetHorizontalFOV) or [ProjectedTexture:SetFOV](https://wiki.facepunch.com/gmod/ProjectedTexture:SetFOV)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetHorizontalFOV)
---@return number # The horizontal FOV of the ProjectedTexture.
function ProjectedTexture:GetHorizontalFOV() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whenever or not the Texture should light up world geometry.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetLightWorld)
---@return boolean # `true` if the Texture should light up world geometry.
function ProjectedTexture:GetLightWorld() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the linear attenuation of the projected texture, which can also be set by [ProjectedTexture:SetLinearAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetLinearAttenuation).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetLinearAttenuation)
---@return number # The linear attenuation.
function ProjectedTexture:GetLinearAttenuation() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the NearZ value of the ProjectedTexture, which was previously set by [ProjectedTexture:SetNearZ](https://wiki.facepunch.com/gmod/ProjectedTexture:SetNearZ)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetNearZ)
---@return number # NearZ of the ProjectedTexture.
function ProjectedTexture:GetNearZ() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the state of projected texture view-frustum culling. See [ProjectedTexture:SetNoCull](https://wiki.facepunch.com/gmod/ProjectedTexture:SetNoCull).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetNoCull)
---@return boolean # `false` if culling is enabled (default), `true` if disabled.
function ProjectedTexture:GetNoCull() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current orthographic settings of the Projected Texture. To set these values, use [ProjectedTexture:SetOrthographic](https://wiki.facepunch.com/gmod/ProjectedTexture:SetOrthographic).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetOrthographic)
---@return boolean # Whether or not this projected texture is orthographic. When false, nothing else is returned.
---@return number # left
---@return number # top
---@return number # right
---@return number # bottom
function ProjectedTexture:GetOrthographic() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the position of the ProjectedTexture, which was previously set by [ProjectedTexture:SetPos](https://wiki.facepunch.com/gmod/ProjectedTexture:SetPos)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetPos)
---@return Vector # The position of the ProjectedTexture.
function ProjectedTexture:GetPos() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the quadratic attenuation of the projected texture, which can also be set by [ProjectedTexture:SetQuadraticAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetQuadraticAttenuation).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetQuadraticAttenuation)
---@return number # The quadratic attenuation
function ProjectedTexture:GetQuadraticAttenuation() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the shadow depth bias of the projected texture.
---
--- Set by [ProjectedTexture:SetShadowDepthBias](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowDepthBias).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetShadowDepthBias)
---@return number # The current shadow depth bias.
function ProjectedTexture:GetShadowDepthBias() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the shadow "filter size" of the projected texture. `0` is fully pixelated, higher values will blur the shadow more.
---
--- Set by [ProjectedTexture:SetShadowFilter](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowFilter).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetShadowFilter)
---@return number # The current shadow filter size.
function ProjectedTexture:GetShadowFilter() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the shadow depth slope scale bias of the projected texture.
---
--- Set by [ProjectedTexture:SetShadowSlopeScaleDepthBias](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowSlopeScaleDepthBias).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetShadowSlopeScaleDepthBias)
---@return number # The current shadow depth slope scale bias.
function ProjectedTexture:GetShadowSlopeScaleDepthBias() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the target entity of this projected texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetTargetEntity)
---@return Entity # The current target entity.
function ProjectedTexture:GetTargetEntity() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the texture of the ProjectedTexture, which was previously set by [ProjectedTexture:SetTexture](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTexture)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetTexture)
---@return ITexture # The texture of the ProjectedTexture.
function ProjectedTexture:GetTexture() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the texture frame of the ProjectedTexture, which was previously set by [ProjectedTexture:SetTextureFrame](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTextureFrame)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetTextureFrame)
---@return number # The texture frame.
function ProjectedTexture:GetTextureFrame() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the vertical FOV of the ProjectedTexture, which was previously set by [ProjectedTexture:SetVerticalFOV](https://wiki.facepunch.com/gmod/ProjectedTexture:SetVerticalFOV) or [ProjectedTexture:SetFOV](https://wiki.facepunch.com/gmod/ProjectedTexture:SetFOV)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:GetVerticalFOV)
---@return number # The vertical FOV of the ProjectedTexture.
function ProjectedTexture:GetVerticalFOV() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns true if the projected texture is valid (i.e. has not been removed), false otherwise.
---
--- Instead of calling this directly it's a good idea to call [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) in case the variable is nil.
---
--- ```
--- IsValid( ptexture )
--- ```
---
--- This not only checks whether the projected texture is valid - but also checks whether it's nil.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:IsValid)
---@return boolean # Whether the projected texture is valid.
function ProjectedTexture:IsValid() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Removes the projected texture. After calling this, [ProjectedTexture:IsValid](https://wiki.facepunch.com/gmod/ProjectedTexture:IsValid) will return false, and any hooks with the projected texture as the identifier will be automatically deleted.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:Remove)
function ProjectedTexture:Remove() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the angles (direction) of the projected texture.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetAngles)
---@param angle Angle
function ProjectedTexture:SetAngles(angle) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the brightness of the projected texture.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetBrightness)
---@param brightness number The brightness to give the projected texture. A float from 0 to 1, where 1 is 100% brightness. Can be higher.
function ProjectedTexture:SetBrightness(brightness) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the color of the projected texture.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetColor)
---@param color table Must be a Color.
---
--- Unlike other projected textures, this color can only go up to 255.
function ProjectedTexture:SetColor(color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the constant attenuation of the projected texture.
---
--- See also [ProjectedTexture:SetLinearAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetLinearAttenuation) and [ProjectedTexture:SetQuadraticAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetQuadraticAttenuation).
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetConstantAttenuation)
---@param constAtten number
function ProjectedTexture:SetConstantAttenuation(constAtten) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Enable or disable shadows cast from the projected texture.
---
--- **NOTE**: As with all types of projected textures (including the player's flashlight and env_projectedtexture), there can only be 8 projected textures with shadows enabled in total.This limit can be increased with the launch parameter `-numshadowtextures LIMIT` where `LIMIT` is the new limit.Naturally, many projected lights with shadows enabled will drastically decrease framerate.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetEnableShadows)
---@param newState boolean
function ProjectedTexture:SetEnableShadows(newState) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the distance at which the projected texture ends.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetFarZ)
---@param farZ number
function ProjectedTexture:SetFarZ(farZ) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the angle of projection.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetFOV)
---@param fov number Must be higher than 0 and lower than 180
function ProjectedTexture:SetFOV(fov) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the horizontal angle of projection without affecting the vertical angle.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetHorizontalFOV)
---@param hFOV number The new horizontal Field Of View for the projected texture. Must be in range between 0 and 180.
function ProjectedTexture:SetHorizontalFOV(hFOV) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Set whenever or not the Texture should light up world geometry.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetLightWorld)
---@param lightworld boolean Set it to `true` if the Texture should light up world geometry.
function ProjectedTexture:SetLightWorld(lightworld) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the linear attenuation of the projected texture.
---
--- See also [ProjectedTexture:SetConstantAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetConstantAttenuation) and [ProjectedTexture:SetQuadraticAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetQuadraticAttenuation).
---
--- The default value of linear attenuation when the projected texture is created is 100. (others are 0, as you are not supposed to mix them)
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetLinearAttenuation)
---@param linearAtten number
function ProjectedTexture:SetLinearAttenuation(linearAtten) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the distance at which the projected texture begins its projection.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
--- **NOTE**: Setting this to 0 will disable the projected texture completely! This may be useful if you want to disable a projected texture without actually removing it
---
--- **NOTE**: This seems to affect the rendering of shadows - a higher Near Z value will have shadows begin to render closer to their casting object. Comparing a low Near Z value (like 1) with a normal one (12) or high one (1000) is the easiest way to understand this artifact
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetNearZ)
---@param nearZ number
function ProjectedTexture:SetNearZ(nearZ) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Allows disabling of projected texture view-frustum culling for cases where said culling creates unwanted side effects. Disabling culling will have a negative effect on performance.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetNoCull)
---@param enable boolean `false` to enable culling (default), `true` to disable.
function ProjectedTexture:SetNoCull(enable) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Changes the current projected texture between orthographic and perspective projection.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
--- Shadows dont work. (For non static props and for most map brushes)
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetOrthographic)
---@param orthographic boolean When false, all other arguments are ignored and the texture is reset to perspective projection.
---@param left number The amount of units left from the projected texture's origin to project.
---@param top number The amount of units upwards from the projected texture's origin to project.
---@param right number The amount of units right from the projected texture's origin to project.
---@param bottom number The amount of units downwards from the projected texture's origin to project.
function ProjectedTexture:SetOrthographic(orthographic, left, top, right, bottom) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Move the Projected Texture to the specified position.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetPos)
---@param position Vector
function ProjectedTexture:SetPos(position) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the quadratic attenuation of the projected texture.
---
--- See also [ProjectedTexture:SetLinearAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetLinearAttenuation) and [ProjectedTexture:SetConstantAttenuation](https://wiki.facepunch.com/gmod/ProjectedTexture:SetConstantAttenuation).
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetQuadraticAttenuation)
---@param quadAtten number
function ProjectedTexture:SetQuadraticAttenuation(quadAtten) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the shadow depth bias of the projected texture.
---
--- The initial value is `0.0001`. Normal projected textures obey the value of the `mat_depthbias_shadowmap` [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowDepthBias)
---@param bias number The shadow depth bias to set.
function ProjectedTexture:SetShadowDepthBias(bias) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the shadow "filter size" of the projected texture. `0` is fully pixelated, higher values will blur the shadow more. The initial value is the value of `r_projectedtexture_filter` [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowFilter)
---@param filter number The shadow filter size to set.
function ProjectedTexture:SetShadowFilter(filter) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the shadow depth slope scale bias of the projected texture.
---
--- The initial value is `2`. Normal projected textures obey the value of the `mat_slopescaledepthbias_shadowmap` [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowSlopeScaleDepthBias)
---@param bias number The shadow depth slope scale bias to set.
function ProjectedTexture:SetShadowSlopeScaleDepthBias(bias) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the target entity for this projected texture, meaning it will only be lighting the given entity and the world.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTargetEntity)
---@param target? Entity The target entity, or `NULL` to reset.
function ProjectedTexture:SetTargetEntity(target) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the texture to be projected.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTexture)
---@param texture string The name of the texture. Can also be an ITexture.
function ProjectedTexture:SetTexture(texture) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) For animated textures, this will choose which frame in the animation will be projected.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTextureFrame)
---@param frame number The frame index to use.
function ProjectedTexture:SetTextureFrame(frame) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the vertical angle of projection without affecting the horizontal angle.
---
--- You must call [ProjectedTexture:Update](https://wiki.facepunch.com/gmod/ProjectedTexture:Update) after using this function for it to take effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:SetVerticalFOV)
---@param vFOV number The new vertical Field Of View for the projected texture. Must be in range between 0 and 180.
function ProjectedTexture:SetVerticalFOV(vFOV) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Updates the Projected Light and applies all previously set parameters.
---
--- The best place to call this function is in [GM:PreDrawOpaqueRenderables](https://wiki.facepunch.com/gmod/GM:PreDrawOpaqueRenderables).
---
---[View wiki](https://wiki.facepunch.com/gmod/ProjectedTexture:Update)
function ProjectedTexture:Update() end
