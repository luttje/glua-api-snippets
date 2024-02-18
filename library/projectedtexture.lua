---@meta

--- A client side projected texture, created by Global.ProjectedTexture.
---@class ProjectedTexture
local ProjectedTexture = {}

---[CLIENT] Returns the angle of the ProjectedTexture, which were previously set by ProjectedTexture:SetAngles
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetAngles)
---@return Angle # The angles of the ProjectedTexture.
function ProjectedTexture:GetAngles() end

---[CLIENT] Returns the brightness of the ProjectedTexture, which was previously set by ProjectedTexture:SetBrightness
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetBrightness)
---@return number # The brightness of the ProjectedTexture.
function ProjectedTexture:GetBrightness() end

---[CLIENT] Returns the color of the ProjectedTexture, which was previously set by ProjectedTexture:SetColor.
---
--- The returned color will not have the color metatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetColor)
---@return table # Color, the color of the ProjectedTexture.
function ProjectedTexture:GetColor() end

---[CLIENT] Returns the constant attenuation of the projected texture, which can also be set by ProjectedTexture:SetConstantAttenuation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetConstantAttenuation)
---@return number # The constant attenuation
function ProjectedTexture:GetConstantAttenuation() end

---[CLIENT] Returns whether shadows are enabled for this ProjectedTexture, which was previously set by ProjectedTexture:SetEnableShadows
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetEnableShadows)
---@return boolean # Whether shadows are enabled.
function ProjectedTexture:GetEnableShadows() end

---[CLIENT] Returns the projection distance of the ProjectedTexture, which was previously set by ProjectedTexture:SetFarZ
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetFarZ)
---@return number # The projection distance of the ProjectedTexture.
function ProjectedTexture:GetFarZ() end

---[CLIENT] Returns the horizontal FOV of the ProjectedTexture, which was previously set by ProjectedTexture:SetHorizontalFOV or ProjectedTexture:SetFOV
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetHorizontalFOV)
---@return number # The horizontal FOV of the ProjectedTexture.
function ProjectedTexture:GetHorizontalFOV() end

---[CLIENT] Returns whenever or not the Texture should light up world geometry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetLightWorld)
---@return boolean # `true` if the Texture should light up world geometry.
function ProjectedTexture:GetLightWorld() end

---[CLIENT] Returns the linear attenuation of the projected texture, which can also be set by ProjectedTexture:SetLinearAttenuation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetLinearAttenuation)
---@return number # The linear attenuation.
function ProjectedTexture:GetLinearAttenuation() end

---[CLIENT] Returns the NearZ value of the ProjectedTexture, which was previously set by ProjectedTexture:SetNearZ
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetNearZ)
---@return number # NearZ of the ProjectedTexture.
function ProjectedTexture:GetNearZ() end

---[CLIENT] Returns the current orthographic settings of the Projected Texture. To set these values, use ProjectedTexture:SetOrthographic.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetOrthographic)
---@return boolean # Whether or not this projected texture is orthographic. When false, nothing else is returned.
---@return number # left
---@return number # top
---@return number # right
---@return number # bottom
function ProjectedTexture:GetOrthographic() end

---[CLIENT] Returns the position of the ProjectedTexture, which was previously set by ProjectedTexture:SetPos
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetPos)
---@return Vector # The position of the ProjectedTexture.
function ProjectedTexture:GetPos() end

---[CLIENT] Returns the quadratic attenuation of the projected texture, which can also be set by ProjectedTexture:SetQuadraticAttenuation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetQuadraticAttenuation)
---@return number # The quadratic attenuation
function ProjectedTexture:GetQuadraticAttenuation() end

---[CLIENT] Returns the shadow depth bias of the projected texture.
---
--- Set by ProjectedTexture:SetShadowDepthBias.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetShadowDepthBias)
---@return number # The current shadow depth bias.
function ProjectedTexture:GetShadowDepthBias() end

---[CLIENT] Returns the shadow "filter size" of the projected texture. `0` is fully pixelated, higher values will blur the shadow more.
---
--- Set by ProjectedTexture:SetShadowFilter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetShadowFilter)
---@return number # The current shadow filter size.
function ProjectedTexture:GetShadowFilter() end

---[CLIENT] Returns the shadow depth slope scale bias of the projected texture.
---
--- Set by ProjectedTexture:SetShadowSlopeScaleDepthBias.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetShadowSlopeScaleDepthBias)
---@return number # The current shadow depth slope scale bias.
function ProjectedTexture:GetShadowSlopeScaleDepthBias() end

---[CLIENT] Returns the target entity of this projected texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetTargetEntity)
---@return Entity # The current target entity.
function ProjectedTexture:GetTargetEntity() end

---[CLIENT] Returns the texture of the ProjectedTexture, which was previously set by ProjectedTexture:SetTexture
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetTexture)
---@return ITexture # The texture of the ProjectedTexture.
function ProjectedTexture:GetTexture() end

---[CLIENT] Returns the texture frame of the ProjectedTexture, which was previously set by ProjectedTexture:SetTextureFrame
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetTextureFrame)
---@return number # The texture frame.
function ProjectedTexture:GetTextureFrame() end

---[CLIENT] Returns the vertical FOV of the ProjectedTexture, which was previously set by ProjectedTexture:SetVerticalFOV or ProjectedTexture:SetFOV
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:GetVerticalFOV)
---@return number # The vertical FOV of the ProjectedTexture.
function ProjectedTexture:GetVerticalFOV() end

---[CLIENT] Returns true if the projected texture is valid (i.e. has not been removed), false otherwise.
---
--- Instead of calling this directly it's a good idea to call Global.IsValid in case the variable is nil.
---
---
--- ```
--- IsValid( ptexture )
--- ```
---
---
--- This not only checks whether the projected texture is valid - but also checks whether it's nil.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:IsValid)
---@return boolean # Whether the projected texture is valid.
function ProjectedTexture:IsValid() end

---[CLIENT] Removes the projected texture. After calling this, ProjectedTexture:IsValid will return false, and any hooks with the projected texture as the identifier will be automatically deleted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:Remove)
function ProjectedTexture:Remove() end

---[CLIENT] Sets the angles (direction) of the projected texture.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetAngles)
---@param angle Angle
function ProjectedTexture:SetAngles(angle) end

---[CLIENT] Sets the brightness of the projected texture.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetBrightness)
---@param brightness number The brightness to give the projected texture.
function ProjectedTexture:SetBrightness(brightness) end

---[CLIENT] Sets the color of the projected texture.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetColor)
---@param color table Must be a Color.
---
--- Unlike other projected textures, this color can only go up to 255.
function ProjectedTexture:SetColor(color) end

---[CLIENT] Sets the constant attenuation of the projected texture.
---
--- See also ProjectedTexture:SetLinearAttenuation and ProjectedTexture:SetQuadraticAttenuation.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetConstantAttenuation)
---@param constAtten number
function ProjectedTexture:SetConstantAttenuation(constAtten) end

---[CLIENT] Enable or disable shadows cast from the projected texture.
---
--- As with all types of projected textures (including the player's flashlight and env_projectedtexture), there can only be 8 projected textures with shadows enabled in total.This limit can be increased with the launch parameter `-numshadowtextures LIMIT` where `LIMIT` is the new limit.Naturally, many projected lights with shadows enabled will drastically decrease framerate.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetEnableShadows)
---@param newState boolean
function ProjectedTexture:SetEnableShadows(newState) end

---[CLIENT] Sets the distance at which the projected texture ends.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetFarZ)
---@param farZ number
function ProjectedTexture:SetFarZ(farZ) end

---[CLIENT] Sets the angle of projection.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetFOV)
---@param fov number Must be higher than 0 and lower than 180
function ProjectedTexture:SetFOV(fov) end

---[CLIENT] Sets the horizontal angle of projection without affecting the vertical angle.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetHorizontalFOV)
---@param hFOV number The new horizontal Field Of View for the projected texture. Must be in range between 0 and 180.
function ProjectedTexture:SetHorizontalFOV(hFOV) end

---[CLIENT] Set whenever or not the Texture should light up world geometry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetLightWorld)
---@param lightworld boolean Set it to `true` if the Texture should light up world geometry.
function ProjectedTexture:SetLightWorld(lightworld) end

---[CLIENT] Sets the linear attenuation of the projected texture.
---
--- See also ProjectedTexture:SetConstantAttenuation and ProjectedTexture:SetQuadraticAttenuation.
---
--- The default value of linear attenuation when the projected texture is created is 100. (others are 0, as you are not supposed to mix them)
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetLinearAttenuation)
---@param linearAtten number
function ProjectedTexture:SetLinearAttenuation(linearAtten) end

---[CLIENT] Sets the distance at which the projected texture begins its projection.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
--- Setting this to 0 will disable the projected texture completely! This may be useful if you want to disable a projected texture without actually removing it
---
--- This seems to affect the rendering of shadows - a higher Near Z value will have shadows begin to render closer to their casting object. Comparing a low Near Z value (like 1) with a normal one (12) or high one (1000) is the easiest way to understand this artifact
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetNearZ)
---@param nearZ number
function ProjectedTexture:SetNearZ(nearZ) end

---[CLIENT] Changes the current projected texture between orthographic and perspective projection.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
--- Shadows dont work. (For non static props and for most map brushes)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetOrthographic)
---@param orthographic boolean When false, all other arguments are ignored and the texture is reset to perspective projection.
---@param left number The amount of units left from the projected texture's origin to project.
---@param top number The amount of units upwards from the projected texture's origin to project.
---@param right number The amount of units right from the projected texture's origin to project.
---@param bottom number The amount of units downwards from the projected texture's origin to project.
function ProjectedTexture:SetOrthographic(orthographic, left, top, right, bottom) end

---[CLIENT] Move the Projected Texture to the specified position.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetPos)
---@param position Vector
function ProjectedTexture:SetPos(position) end

---[CLIENT] Sets the quadratic attenuation of the projected texture.
---
--- See also ProjectedTexture:SetLinearAttenuation and ProjectedTexture:SetConstantAttenuation.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetQuadraticAttenuation)
---@param quadAtten number
function ProjectedTexture:SetQuadraticAttenuation(quadAtten) end

---[CLIENT] Sets the shadow depth bias of the projected texture.
---
--- The initial value is `0.0001`. Normal projected textures obey the value of the `mat_depthbias_shadowmap` ConVar.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowDepthBias)
---@param bias number The shadow depth bias to set.
function ProjectedTexture:SetShadowDepthBias(bias) end

---[CLIENT] Sets the shadow "filter size" of the projected texture. `0` is fully pixelated, higher values will blur the shadow more. The initial value is the value of `r_projectedtexture_filter` ConVar.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowFilter)
---@param filter number The shadow filter size to set.
function ProjectedTexture:SetShadowFilter(filter) end

---[CLIENT] Sets the shadow depth slope scale bias of the projected texture.
---
--- The initial value is `2`. Normal projected textures obey the value of the `mat_slopescaledepthbias_shadowmap` ConVar.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetShadowSlopeScaleDepthBias)
---@param bias number The shadow depth slope scale bias to set.
function ProjectedTexture:SetShadowSlopeScaleDepthBias(bias) end

---[CLIENT] Sets the target entity for this projected texture, meaning it will only be lighting the given entity and the world.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTargetEntity)
---@param target? Entity The target entity, or `NULL` to reset.
function ProjectedTexture:SetTargetEntity(target) end

---[CLIENT] Sets the texture to be projected.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTexture)
---@param texture string The name of the texture. Can also be an ITexture.
function ProjectedTexture:SetTexture(texture) end

---[CLIENT] For animated textures, this will choose which frame in the animation will be projected.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetTextureFrame)
---@param frame number The frame index to use.
function ProjectedTexture:SetTextureFrame(frame) end

---[CLIENT] Sets the vertical angle of projection without affecting the horizontal angle.
---
--- You must call ProjectedTexture:Update after using this function for it to take effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:SetVerticalFOV)
---@param vFOV number The new vertical Field Of View for the projected texture. Must be in range between 0 and 180.
function ProjectedTexture:SetVerticalFOV(vFOV) end

---[CLIENT] Updates the Projected Light and applies all previously set parameters.
---
--- The best place to call this function is in GM:PreDrawOpaqueRenderables.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ProjectedTexture:Update)
function ProjectedTexture:Update() end
