---@meta

--- The render library is a powerful set of functions that let you control how the world and its contents are rendered. It can also be used to draw some 3D clientside effects such as beams, boxes and spheres.
render = {}

---[CLIENT] Adds a beam segment to the beam started by render.StartBeam.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.AddBeam)
---@param startPos Vector Beam start position.
---@param width number The width of the beam.
---@param textureEnd number The end coordinate of the texture used.
---@param color table The color to be used. Uses the Color.
function render.AddBeam(startPos, width, textureEnd, color) end

---[CLIENT] Blurs the render target ( or a given texture )
---
--- 		Calling this on a RenderTarget created with TEXTUREFLAGS_POINTSAMPLE will result in strange visual glitching.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.BlurRenderTarget)
---@param rendertarget ITexture The texture to blur
---@param blurx number Horizontal amount of blur
---@param blury number Vertical amount of blur
---@param passes number Amount of passes to go through
function render.BlurRenderTarget(rendertarget, blurx, blury, passes) end

---[CLIENT] This function overrides the brush material for next render operations. It can be used with Entity:DrawModel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.BrushMaterialOverride)
---@param mat? IMaterial
function render.BrushMaterialOverride(mat) end

---[CLIENT] Captures a part of the current render target and returns the data as a binary string in the given format.
---
--- Since the pixel buffer clears itself every frame, this will return a black screen outside of render hooks. To capture the user's final view, use GM:PostRender. This will not capture the Steam overlay or third-party injections (such as the Discord overlay, Overwolf, and advanced cheats) on the user's screen.
---
--- In PNG mode, this function can produce unexpected result where foreground is rendered as transparent.
--- This is caused by render.SetWriteDepthToDestAlpha set to `true` when doing most of render operations, including rendering in `_rt_fullframefb`. If you want to capture render target's content as PNG image only for output quality, set Structures/RenderCaptureData's `alpha` to `false` when capturing render targets with render.SetWriteDepthToDestAlpha set to `true`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.Capture)
---@param captureData table Parameters of the capture. See Structures/RenderCaptureData.
---@return string # binaryData
function render.Capture(captureData) end

---[CLIENT] Dumps the current render target and allows the pixels to be accessed by render.ReadPixel.
---
--- 	Capturing outside a render hook will return 0 0 0 255
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.CapturePixels)
function render.CapturePixels() end

---[CLIENT AND MENU] Clears the current render target and the specified buffers.
---
--- This sets the alpha incorrectly for surface draw calls for render targets.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.Clear)
---@param r number Red component to clear to.
---@param g number Green component to clear to.
---@param b number Blue component to clear to.
---@param a number Alpha component to clear to.
---@param clearDepth? boolean Clear the depth.
---@param clearStencil? boolean Clear the stencil.
function render.Clear(r, g, b, a, clearDepth, clearStencil) end

---[CLIENT AND MENU] Clears the portion of the active Render Target that passes the current stencil buffer conditions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ClearBuffersObeyStencil)
---@param r number Value of the **red** channel to clear the current rt with.
---@param g number Value of the **green** channel to clear the current rt with.
---@param b number Value of the **blue** channel to clear the current rt with.
---@param a number Value of the **alpha** channel to clear the current rt with.
---@param depth boolean Clear the depth buffer.
function render.ClearBuffersObeyStencil(r, g, b, a, depth) end

---[CLIENT AND MENU] Resets the depth buffer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ClearDepth)
---@param clearStencil? boolean Whether to also clear the stencil buffer.
function render.ClearDepth(clearStencil) end

---[CLIENT] Clears a render target
---
--- It uses render.Clear then render.SetRenderTarget on the modified render target.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ClearRenderTarget)
---@param texture ITexture
---@param color table The color, see Color
function render.ClearRenderTarget(texture, color) end

---[CLIENT AND MENU] Resets all values in the stencil buffer to zero.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ClearStencil)
function render.ClearStencil() end

---[CLIENT AND MENU] Sets the stencil value in a specified rect.
---
--- This is **not** affected by render.SetStencilWriteMask
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ClearStencilBufferRectangle)
---@param originX number X origin of the rectangle.
---@param originY number Y origin of the rectangle.
---@param endX number The end X coordinate of the rectangle.
---@param endY number The end Y coordinate of the rectangle.
---@param stencilValue number Value to set cleared stencil buffer to.
function render.ClearStencilBufferRectangle(originX, originY, endX, endY, stencilValue) end

---[CLIENT] Calculates the lighting caused by dynamic lights for the specified surface.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ComputeDynamicLighting)
---@param position Vector The position to sample from.
---@param normal Vector The normal of the surface.
---@return Vector # A vector representing the light at that point.
function render.ComputeDynamicLighting(position, normal) end

---[CLIENT] Calculates the light color of a certain surface.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ComputeLighting)
---@param position Vector The position of the surface to get the light from.
---@param normal Vector The normal of the surface to get the light from.
---@return Vector # A vector representing the light at that point.
function render.ComputeLighting(position, normal) end

---[CLIENT] Calculates diameter of a 3D sphere on a 2D screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ComputePixelDiameterOfSphere)
---@param point Vector The position of the sphere in 3D space.
---@param radius number The radius of the sphere in 3D space.
---@return number # The diameter of the sphere in 2D screen space.
function render.ComputePixelDiameterOfSphere(point, radius) end

---[CLIENT] Copies the currently active Render Target to the specified texture.
--- 		This does not copy the Depth buffer, no method for that is known at this moment so a common workaround is to store the source texture somewhere else, perform your drawing operations, save the result somewhere else and reapply the source texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.CopyRenderTargetToTexture)
---@param Target ITexture The texture to copy to
function render.CopyRenderTargetToTexture(Target) end

---[CLIENT] Copies the contents of one texture to another. Only works with rendertargets.
--- 		This does not copy the Depth buffer, no method for that is known at this moment so a common workaround is to store the source texture somewhere else, perform your drawing operations, save the result somewhere else and reapply the source texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.CopyTexture)
---@param texture_from ITexture
---@param texture_to ITexture
function render.CopyTexture(texture_from, texture_to) end

---[CLIENT AND MENU] Sets the cull mode. The culling mode defines how back faces are culled when rendering geometry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.CullMode)
---@param cullMode number Cullmode, see Enums/MATERIAL_CULLMODE
function render.CullMode(cullMode) end

---[CLIENT] Set's the depth range of the upcoming render.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DepthRange)
---@param depthmin number The minimum depth of the upcoming render. `0.0` = render normally; `1.0` = render nothing.
---@param depthmax number The maximum depth of the upcoming render. `0.0` = render everything (through walls); `1.0` = render normally.
function render.DepthRange(depthmin, depthmax) end

---[CLIENT] Draws a single-segment Beam made out of a textured, billboarded quad stretching between two points.
---
--- 		For more detailed information, including usage examples, see the [Beams Rendering Reference](https://wiki.facepunch.com/gmod/Beam_Rendering)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawBeam)
---@param startPos Vector The Beam's start position.
---@param endPos Vector The Beam's end position.
---@param width number The width of the Beam.
---@param textureStart number The starting coordinate of the Beam's texture.
---@param textureEnd number The end coordinate of the Beam's texture.
---@param color? Color What Color to tint the Beam.
function render.DrawBeam(startPos, endPos, width, textureStart, textureEnd, color) end

---[CLIENT] Draws a box in 3D space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawBox)
---@param position Vector Origin of the box.
---@param angles Angle Orientation of the box.
---@param mins Vector Start position of the box, relative to origin.
---@param maxs Vector End position of the box, relative to origin.
---@param color? table The color of the box. Uses the Color.
function render.DrawBox(position, angles, mins, maxs, color) end

---[CLIENT] Draws a line in 3D space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawLine)
---@param startPos Vector Line start position in world coordinates.
---@param endPos Vector Line end position in world coordinates.
---@param color? table The color to be used. Uses the Color.
---@param writeZ? boolean Whether or not to consider the Z buffer. If false, the line will be drawn over everything currently drawn, if true, the line will be drawn with depth considered, as if it were a regular object in 3D space.
---
--- Enabling this option will cause the line to ignore the color's alpha.
function render.DrawLine(startPos, endPos, color, writeZ) end

---[CLIENT] Draws 2 connected triangles. Expects material to be set by render.SetMaterial.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawQuad)
---@param vert1 Vector First vertex.
---@param vert2 Vector The second vertex.
---@param vert3 Vector The third vertex.
---@param vert4 Vector The fourth vertex.
---@param color? table The color of the quad. See Global.Color
function render.DrawQuad(vert1, vert2, vert3, vert4, color) end

---[CLIENT] Draws a quad.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawQuadEasy)
---@param position Vector Origin of the sprite.
---@param normal Vector The face direction of the quad.
---@param width number The width of the quad.
---@param height number The height of the quad.
---@param color table The color of the quad. Uses the Color.
---@param rotation? number The rotation of the quad counter-clockwise in degrees around the normal axis. In other words, the quad will always face the same way but this will rotate its corners.
function render.DrawQuadEasy(position, normal, width, height, color, rotation) end

---[CLIENT] Draws the current material set by render.SetMaterial to the whole screen. The color cannot be customized.
---
--- See also render.DrawScreenQuadEx.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawScreenQuad)
---@param applyPoster? boolean If set to true, when rendering a poster the quad will be properly drawn in parts in the poster. This is used internally by some Post Processing effects. Certain special textures (frame buffer like textures) do not need this adjustment.
function render.DrawScreenQuad(applyPoster) end

---[CLIENT] Draws the current material set by render.SetMaterial to the area specified. Color cannot be customized.
---
--- See also render.DrawScreenQuad.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawScreenQuadEx)
---@param startX number X start position of the rect.
---@param startY number Y start position of the rect.
---@param width number Width of the rect.
---@param height number Height of the rect.
function render.DrawScreenQuadEx(startX, startY, width, height) end

---[CLIENT] Draws a sphere in 3D space. The material previously set with render.SetMaterial will be applied the sphere's surface.
---
--- See also render.DrawWireframeSphere for a wireframe equivalent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawSphere)
---@param position Vector Position of the sphere.
---@param radius number Radius of the sphere. Negative radius will make the sphere render inwards rather than outwards.
---@param longitudeSteps number The number of longitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
---@param latitudeSteps number The number of latitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
---@param color? table The color of the sphere. Uses the Color.
function render.DrawSphere(position, radius, longitudeSteps, latitudeSteps, color) end

---[CLIENT] Draws a sprite in 3D space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawSprite)
---@param position Vector Position of the sprite.
---@param width number Width of the sprite.
---@param height number Height of the sprite.
---@param color? table Color of the sprite. Uses the Color.
function render.DrawSprite(position, width, height, color) end

---[CLIENT] Draws a texture over the whole screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawTextureToScreen)
---@param tex ITexture The texture to draw
function render.DrawTextureToScreen(tex) end

---[CLIENT] Draws a textured rectangle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawTextureToScreenRect)
---@param tex ITexture The texture to draw
---@param x number The x coordinate of the rectangle to draw.
---@param y number The y coordinate of the rectangle to draw.
---@param width number The width of the rectangle to draw.
---@param height number The height of the rectangle to draw.
function render.DrawTextureToScreenRect(tex, x, y, width, height) end

---[CLIENT] Draws a wireframe box in 3D space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawWireframeBox)
---@param position Vector Position of the box.
---@param angle Angle Angles of the box.
---@param mins Vector The lowest corner of the box.
---@param maxs Vector The highest corner of the box.
---@param color? table The color of the box. Uses the Color.
---@param writeZ? boolean Sets whenever to write to the zBuffer.
function render.DrawWireframeBox(position, angle, mins, maxs, color, writeZ) end

---[CLIENT] Draws a wireframe sphere in 3d space.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.DrawWireframeSphere)
---@param position Vector Position of the sphere.
---@param radius number The size of the sphere.
---@param longitudeSteps number The amount of longitude steps.
--- The larger this number is, the smoother the sphere is.
---@param latitudeSteps number The amount of latitude steps.
--- The larger this number is, the smoother the sphere is.
---@param color? table The color of the wireframe. Uses the Color.
---@param writeZ? boolean Whether or not to consider the Z buffer. If false, the wireframe will be drawn over everything currently drawn. If true, it will be drawn with depth considered, as if it were a regular object in 3D space.
function render.DrawWireframeSphere(position, radius, longitudeSteps, latitudeSteps, color, writeZ) end

---[CLIENT AND MENU] Sets the status of the clip renderer, returning previous state.
---
--- To prevent unintended rendering behavior of other mods/the game, you must reset the clipping state to its previous value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.EnableClipping)
---@param state boolean New clipping state.
---@return boolean # Previous clipping state.
function render.EnableClipping(state) end

---[CLIENT] Ends the beam mesh of a beam started with render.StartBeam.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.EndBeam)
function render.EndBeam() end

---[CLIENT] Sets the color of the fog.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.FogColor)
---@param red number Red channel of the fog color, 0 - 255.
---@param green number Green channel of the fog color, 0 - 255.
---@param blue number Blue channel of the fog color, 0 - 255.
function render.FogColor(red, green, blue) end

---[CLIENT] Sets the at which the fog reaches its max density.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.FogEnd)
---@param distance number The distance at which the fog reaches its max density.
---
--- If used in GM:SetupSkyboxFog, this value **must** be scaled by the first argument of the hook
function render.FogEnd(distance) end

---[CLIENT] Sets the maximum density of the fog.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.FogMaxDensity)
---@param maxDensity number The maximum density of the fog, 0-1.
function render.FogMaxDensity(maxDensity) end

---[CLIENT] Sets the mode of fog.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.FogMode)
---@param fogMode number Fog mode, see Enums/MATERIAL_FOG.
function render.FogMode(fogMode) end

---[CLIENT] Sets the distance at which the fog starts showing up.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.FogStart)
---@param fogStart number The distance at which the fog starts showing up.
--- If used in GM:SetupSkyboxFog, this value **must** be scaled by the first argument of the hook
function render.FogStart(fogStart) end

---[CLIENT] Returns the ambient color of the map.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetAmbientLightColor)
---@return Vector # color
function render.GetAmbientLightColor() end

---[CLIENT] Returns the current alpha blending.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetBlend)
---@return number # Current alpha blending in range 0 to 1.
function render.GetBlend() end

---[CLIENT] You can use Global.GetRenderTargetEx if you need to create a Render Target
--- Returns the Render Target texture that is used internally for the Global.DrawBloom Post-Processing_Materials effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetBloomTex0)
---@return ITexture # The render target texture named `s_pBloomTex0`.
function render.GetBloomTex0() end

---[CLIENT] You probably want to just use a custom render target. See Global.GetRenderTargetEx.
---
--- Returns the Render Target texture used internally for the render.BlurRenderTarget Post-Processing_Materials effect.
---
--- Despite its name, this function is not used for the Global.DrawBloom effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetBloomTex1)
---@return ITexture # The render target texture named `s_pBloomTex1`.
function render.GetBloomTex1() end

---[CLIENT] Returns the current color modulation values as normals.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetColorModulation)
---@return number # r
---@return number # g
---@return number # b
function render.GetColorModulation() end

---[CLIENT AND MENU] Returns the maximum available directX version.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetDXLevel)
---@return number # dxLevel
function render.GetDXLevel() end

---[CLIENT] Returns the current fog color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetFogColor)
---@return number # Red part of the color.
---@return number # Green part of the color
---@return number # Blue part of the color
function render.GetFogColor() end

---[CLIENT] Returns the fog start and end distance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetFogDistances)
---@return number # Fog start distance set by render.FogStart
---@return number # For end distance set by render.FogEnd
---@return number # Fog Z distance set by render.SetFogZ
function render.GetFogDistances() end

---[CLIENT] Returns the fog mode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetFogMode)
---@return number # Fog mode, see Enums/MATERIAL_FOG
function render.GetFogMode() end

---[CLIENT] Returns the full screen depth texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetFullScreenDepthTexture)
---@return ITexture # The `_rt_FullFrameDepth` texture.
function render.GetFullScreenDepthTexture() end

---[CLIENT AND MENU] Returns whether HDR is currently enabled or not. This takes into account hardware support, current map and current client settings.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetHDREnabled)
---@return boolean # `true` if the player currently has HDR enabled.
function render.GetHDREnabled() end

---[CLIENT] Gets the light exposure on the specified position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetLightColor)
---@param position Vector The position of the surface to get the light from.
---@return Vector # lightColor
function render.GetLightColor(position) end

---[CLIENT] You probably want to just use a custom render target. See Global.GetRenderTargetEx.
---
--- Returns the first render target texture that is used internally for Motion Blur and Frame Blend post processing effects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetMoBlurTex0)
---@return ITexture # The render target named `s_pMoBlurTex0`.
function render.GetMoBlurTex0() end

---[CLIENT] You probably want to just use a custom render target. See Global.GetRenderTargetEx.
---
--- Returns the second render target texture that is used internally for Motion Blur and Frame Blend post processing effects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetMoBlurTex1)
---@return ITexture # The render target named `s_pMoBlurTex1`.
function render.GetMoBlurTex1() end

---[CLIENT] You probably want to just use a custom render target. See Global.GetRenderTargetEx.
---
--- Returns the first render target texture that was used internally for Morph post processing effect
---
--- The post processing effect was removed from the base game at some point during development of Garry's Mod 13, but can still be found as a community mod: https://steamcommunity.com/sharedfiles/filedetails/?id=501088470
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetMorphTex0)
---@return ITexture # The render target texture named `s_pMorphTexture0`.
function render.GetMorphTex0() end

---[CLIENT] You probably want to just use a custom render target. See Global.GetRenderTargetEx.
---
--- Returns the second render target texture that was used internally for Morph post processing effect.
---
--- See render.GetMorphTex0 for more information..
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetMorphTex1)
---@return ITexture # The render target texture named `s_pMorphTexture1`.
function render.GetMorphTex1() end

---[CLIENT] Returns the Power Of Two Frame Buffer texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetPowerOfTwoTexture)
---@return ITexture # The power of two texture, which is `_rt_PowerOfTwoFB` by default.
function render.GetPowerOfTwoTexture() end

---[CLIENT] Alias of render.GetPowerOfTwoTexture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetRefractTexture)
---@return ITexture # The render.GetPowerOfTwoTexture.
---@deprecated Alias of render.GetPowerOfTwoTexture.
function render.GetRefractTexture() end

---[CLIENT] Returns the currently active render target.
---
--- Instead of saving the current render target using this function and restoring to it later, it is generally better practice to use render.PushRenderTarget and render.PopRenderTarget.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetRenderTarget)
---@return ITexture # The currently active Render Target
function render.GetRenderTarget() end

---[CLIENT] Returns the `_rt_ResolvedFullFrameDepth` texture for SSAO depth. It will only be updated if GM:NeedsDepthPass returns true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetResolvedFullFrameDepth)
---@return ITexture # The depth texture.
function render.GetResolvedFullFrameDepth() end

---[CLIENT] Obtain an ITexture of the screen. You must call render.UpdateScreenEffectTexture in order to update this texture with the currently rendered scene.
---
--- This texture is mainly used within GM:RenderScreenspaceEffects
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetScreenEffectTexture)
---@param textureIndex? number Max index is 3, but engine only creates the first two for you.
---@return ITexture # The requested texture.
function render.GetScreenEffectTexture(textureIndex) end

---[CLIENT] Returns the first quarter sized frame buffer texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetSmallTex0)
---@return ITexture # The render target texture named `_rt_SmallFB0`.
function render.GetSmallTex0() end

---[CLIENT] Returns the second quarter sized frame buffer texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetSmallTex1)
---@return ITexture # The render target texture named `_rt_SmallFB1`.
function render.GetSmallTex1() end

---[CLIENT] Returns a floating point texture (RGBA16161616F format) the same resolution as the screen.
---
--- The gmodscreenspace doesn't behave as expected when drawing a floating-point texture to an integer texture (e.g. the default render target). Use an UnlitGeneric material instead
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetSuperFPTex)
---@return ITexture # Render target named `__rt_SuperTexture1`
function render.GetSuperFPTex() end

---[CLIENT] See render.GetSuperFPTex
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetSuperFPTex2)
---@return ITexture # Render target named `__rt_SuperTexture2`.
function render.GetSuperFPTex2() end

---[CLIENT] Performs a render trace and returns the color of the surface hit, this uses a low res version of the texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetSurfaceColor)
---@param startPos Vector The start position to trace from.
---@param endPos Vector The end position of the trace.
---@return Vector # color
function render.GetSurfaceColor(startPos, endPos) end

---[CLIENT] Returns a vector representing linear tone mapping scale.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetToneMappingScaleLinear)
---@return Vector # The vector representing linear tone mapping scale.
function render.GetToneMappingScaleLinear() end

---[CLIENT] Returns the current view setup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.GetViewSetup)
---@param noPlayer? boolean If `true`, returns the `view->GetViewSetup`, if `false` - returns `view->GetPlayerViewSetup`
---@return table # Current current view setup. See Structures/ViewSetup
function render.GetViewSetup(noPlayer) end

---[CLIENT] Sets the render material override for all next calls of Entity:DrawModel. Also overrides render.MaterialOverrideByIndex.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.MaterialOverride)
---@param material? IMaterial The material to use as override, use nil to disable.
function render.MaterialOverride(material) end

---[CLIENT] Similar to render.MaterialOverride, but overrides the materials per index. Similar to Entity:SetSubMaterial
---
--- render.MaterialOverride overrides effects of this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.MaterialOverrideByIndex)
---@param index? number The index of the material to override, in range of 0 to 31. `nil` will reset all overrides.
---@param material? IMaterial The material to override with, `nil` will reset the override for given index.
function render.MaterialOverrideByIndex(index, material) end

---[CLIENT AND MENU] Returns the maximum texture height the renderer can handle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.MaxTextureHeight)
---@return number # maxTextureHeight
function render.MaxTextureHeight() end

---[CLIENT AND MENU] Returns the maximum texture width the renderer can handle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.MaxTextureWidth)
---@return number # maxTextureWidth
function render.MaxTextureWidth() end

---[CLIENT] Creates a new Global.ClientsideModel, renders it at the specified pos/ang, and removes it. Can also be given an existing CSEnt to reuse instead.
---
--- This function is only meant to be used in a single render pass kind of scenario, if you need to render a model continuously, use a cached Global.ClientsideModel and provide it as a second argument.
---
--- Using this with a map model (game.GetWorld():Entity:GetModel()) crashes the game.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.Model)
---@param settings table Requires:
--- * string model - The model to draw
--- * Vector pos - The position to draw the model at
--- * Angle angle - The angles to draw the model at
---@param ent? CSEnt If provided, this entity will be reused instead of creating a new one with Global.ClientsideModel. Note that the ent's model, position and angles will be changed, and Entity:SetNoDraw will be set to true.
function render.Model(settings, ent) end

---[CLIENT] Sets a material to override a model's default material. Similar to Entity:SetMaterial except it uses an IMaterial argument and it can be used to change materials on models which are part of the world geometry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ModelMaterialOverride)
---@param material IMaterial The material override.
function render.ModelMaterialOverride(material) end

---[CLIENT AND MENU] Overrides the write behaviour of all next rendering operations towards the alpha channel of the current render target.
---
--- See also render.OverrideBlend.
---
--- Doing surface draw calls with alpha set to 0 is a no-op and will never have any effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.OverrideAlphaWriteEnable)
---@param enable boolean Enable or disable the override.
---@param shouldWrite boolean If the previous argument is true, sets whether the next rendering operations should write to the alpha channel or not. Has no effect if the previous argument is false.
function render.OverrideAlphaWriteEnable(enable, shouldWrite) end

---[CLIENT AND MENU] Overrides the internal graphical functions used to determine the final color and alpha of a rendered texture.
---
--- See also render.OverrideAlphaWriteEnable.
---
--- Doing surface draw calls with alpha set to 0 is a no-op and won't have an effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.OverrideBlend)
---@param enabled boolean true to enable, false to disable. No other arguments are required when disabling.
---@param srcBlend number The source color blend function Enums/BLEND. Determines how a rendered texture's final color should be calculated.
---@param destBlend number The destination color blend function Enums/BLEND.
---@param blendFunc number The blend mode used for drawing the color layer Enums/BLENDFUNC.
---@param srcBlendAlpha? number The source alpha blend function Enums/BLEND. Determines how a rendered texture's final alpha should be calculated.
---@param destBlendAlpha? number The destination alpha blend function Enums/BLEND.
---@param blendFuncAlpha? number The blend mode used for drawing the alpha layer Enums/BLENDFUNC.
function render.OverrideBlend(
	enabled,
	srcBlend,
	destBlend,
	blendFunc,
	srcBlendAlpha,
	destBlendAlpha,
	blendFuncAlpha
)
end

---[CLIENT AND MENU] Overrides the internal graphical functions used to determine the final color and alpha of a rendered texture.
---
--- See also render.OverrideAlphaWriteEnable.
---
--- Doing surface draw calls with alpha set to 0 is a no-op and will never have any effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.OverrideBlendFunc)
---@param enabled boolean true to enable, false to disable. No other arguments are required when disabling.
---@param srcBlend number The source color blend function Enums/BLEND. Determines how a rendered texture's final color should be calculated.
---@param destBlend number
---@param srcBlendAlpha? number The source alpha blend function Enums/BLEND. Determines how a rendered texture's final alpha should be calculated.
---@param destBlendAlpha? number
---@deprecated Use render.OverrideBlend instead.
function render.OverrideBlendFunc(enabled, srcBlend, destBlend, srcBlendAlpha, destBlendAlpha) end

---[CLIENT AND MENU] Overrides the write behaviour of all next rendering operations towards the color channel of the current render target.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.OverrideColorWriteEnable)
---@param enable boolean Enable or disable the override.
---@param shouldWrite boolean If the previous argument is true, sets whether the next rendering operations should write to the color channel or not. Has no effect if the previous argument is false.
function render.OverrideColorWriteEnable(enable, shouldWrite) end

---[CLIENT AND MENU] Overrides the write behaviour of all next rendering operations towards the depth buffer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.OverrideDepthEnable)
---@param enable boolean Enable or disable the override.
---@param shouldWrite boolean If the previous argument is true, sets whether the next rendering operations should write to the depth buffer or not. Has no effect if the previous argument is false.
function render.OverrideDepthEnable(enable, shouldWrite) end

---[CLIENT AND MENU] Perform stencil operations to every pixel on the screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PerformFullScreenStencilOperation)
function render.PerformFullScreenStencilOperation() end

---[CLIENT AND MENU] Removes the current active clipping plane from the clip plane stack.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PopCustomClipPlane)
function render.PopCustomClipPlane() end

---[CLIENT AND MENU] Pops (Removes) the texture filter most recently pushed (Added) onto the magnification texture filter stack.
---
--- 		This function should only be called *after* a magnification filter has been pushed via render.PushFilterMag
---
--- 		For more detailed information and a usage example, see render_min_mag_filters
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PopFilterMag)
function render.PopFilterMag() end

---[CLIENT AND MENU] Pops (Removes) the texture filter most recently pushed (Added) onto the minification texture filter stack.
---
--- 		This function should only be called *after* a minification filter has been pushed via render.PushFilterMin
---
--- 		For more detailed information and a usage example, see render_min_mag_filters
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PopFilterMin)
function render.PopFilterMin() end

---[CLIENT] Pops the current flashlight mode from the flashlight mode stack.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PopFlashlightMode)
function render.PopFlashlightMode() end

---[CLIENT] Pops the last render target and viewport from the RT stack and sets them as the current render target and viewport.
---
--- This is should be called to restore the previous render target and viewport after a call to render.PushRenderTarget.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PopRenderTarget)
function render.PopRenderTarget() end

---[CLIENT AND MENU] Pushes a new clipping plane of the clip plane stack and sets it as active.
---
--- A max of 2 clip planes are supported on Linux/POSIX, and 6 on Windows.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PushCustomClipPlane)
---@param normal Vector The normal of the clipping plane.
---@param distance number The distance of the plane from the world origin. You can use Vector:Dot between the normal and any point on the plane to find this.
function render.PushCustomClipPlane(normal, distance) end

---[CLIENT AND MENU] Pushes (Adds) a texture filter onto the magnification texture filter stack.
--- 		This will modify how textures are stretched to sizes larger than their native resolution for upcoming rendering and drawing operations.
--- 		For a version of this same function that modifies filtering for texture sizes smaller than their native resolution, see render.PushFilterMin
---
--- 		Always be sure to call render.PopFilterMag afterwards to avoid texture filtering problems.
---
--- 		For more detailed information and a usage example, see render_min_mag_filters
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PushFilterMag)
---@param texFilterType number The texture filter to use. For available options, see Enums/TEXFILTER
function render.PushFilterMag(texFilterType) end

---[CLIENT AND MENU] Pushes (Adds) a texture filter onto the minification texture filter stack.
--- 		This will modify how textures are compressed to a lower resolution than their native resolution for upcoming rendering and drawing operations.
--- 		For a version of this same function that modifies filtering for texture sizes larger than their native resolution, see render.PushFilterMag
---
--- 		Always be sure to call render.PopFilterMin afterwards to avoid texture filtering problems.
---
--- 		For more detailed information and a usage example, see render_min_mag_filters
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PushFilterMin)
---@param texFilterType number The texture filter to use. For available options, see Enums/TEXFILTER
function render.PushFilterMin(texFilterType) end

---[CLIENT] Enables the flashlight projection for the upcoming rendering.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PushFlashlightMode)
---@param enable? boolean Whether the flashlight mode should be enabled or disabled.
---@deprecated This will leave models lit under specific conditions. You should use render.RenderFlashlights which is meant as a direct replacement for this function.
function render.PushFlashlightMode(enable) end

---[CLIENT] Pushes the current render target and viewport to the RT stack then sets a new current render target and viewport. If the viewport is not specified, the dimensions of the render target are used instead.
---
--- This is similar to a call to render.SetRenderTarget and render.SetViewPort where the current render target and viewport have been saved beforehand, except the viewport isn't clipped to screen bounds.
---
--- See also render.PopRenderTarget.
---
--- If you want to render to the render target in 2d mode and it is not the same size as the screen, use cam.Start2D and cam.End2D.
--- If the render target is bigger than the screen, rendering done with the surface library will be clipped to the screen bounds unless you call Global.DisableClipping
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.PushRenderTarget)
---@param texture ITexture
--- 			The new render target to be used.
--- 			Note: This should be `nil` to render to the main game view.
---
---@param x? number X origin of the viewport.
---@param y? number Y origin of the viewport.
---@param w? number Width of the viewport.
---@param h? number Height of the viewport
function render.PushRenderTarget(texture, x, y, w, h) end

---[CLIENT] Reads the color of the specified pixel from the RenderTarget sent by render.CapturePixels
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ReadPixel)
---@param x number The x coordinate.
---@param y number The y coordinate.
---@return number # The red channel value.
---@return number # The green channel value.
---@return number # The blue channel value.
---@return number # The alpha channel value or no value if the render target has no alpha channel.
function render.ReadPixel(x, y) end

---[CLIENT] This applies the changes made to map lighting using engine.LightStyle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.RedownloadAllLightmaps)
---@param DoStaticProps? boolean When true, this will also apply lighting changes to static props. This is really slow on large maps.
---@param UpdateStaticLighting? boolean Forces all props to update their static lighting. Can be slow.
function render.RedownloadAllLightmaps(DoStaticProps, UpdateStaticLighting) end

---[CLIENT] Renders additive flashlights on an IMesh, a direct replacement for render.PushFlashlightMode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.RenderFlashlights)
---@param renderFunc function The function that renders the IMesh, or a model.
function render.RenderFlashlights(renderFunc) end

---[CLIENT] Renders the HUD on the screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.RenderHUD)
---@param x number X position for the HUD draw origin.
---@param y number Y position for the HUD draw origin.
---@param w number Width of the HUD draw.
---@param h number Height of the HUD draw.
function render.RenderHUD(x, y, w, h) end

---[CLIENT] Renders the scene with the specified viewData to the current active render target.
---
--- Static props and LODs are rendered improperly due to incorrectly perceived distance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.RenderView)
---@param view? table The view data to be used in the rendering. See Structures/ViewData. Any missing value is assumed to be that of the current view. Similarly, you can make a normal render by simply not passing this table at all.
function render.RenderView(view) end

---[CLIENT] Resets the model lighting to the specified color.
---
--- Calls render.SetModelLighting for every direction with given color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ResetModelLighting)
---@param r number The red part of the color, 0-1
---@param g number The green part of the color, 0-1
---@param b number The blue part of the color, 0-1
function render.ResetModelLighting(r, g, b) end

---[CLIENT] Resets the HDR tone multiplier to the specified value.
---
--- This will only work on HDR maps, and the value will automatically fade to what it was ( or whatever render.SetGoalToneMappingScale is ) if called only once.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.ResetToneMappingScale)
---@param scale number The value which should be used as multiplier.
function render.ResetToneMappingScale(scale) end

---[CLIENT] Sets the ambient lighting for any upcoming render operation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetAmbientLight)
---@param r number The red part of the color, 0-1.
---@param g number The green part of the color, 0-1.
---@param b number The blue part of the color, 0-1.
function render.SetAmbientLight(r, g, b) end

---[CLIENT] Sets the alpha blending for every upcoming render operation.
---
--- This does not affect non-model `render.Draw*` functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetBlend)
---@param blending number Blending value from `0-1`.
function render.SetBlend(blending) end

---[CLIENT] Sets the current drawing material to "color".
---
--- The material is defined as:
--- ```
---
---  "UnlitGeneric"
---  {
---  	"$basetexture" "color/white"
---  	"$model" 		1
---  	"$translucent" 	1
---  	"$vertexalpha" 	1
---  	"$vertexcolor" 	1
---  }
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetColorMaterial)
function render.SetColorMaterial() end

---[CLIENT] Sets the current drawing material to `color_ignorez`.
---
--- The material is defined as:
--- ```
---
---  "UnlitGeneric"
---  {
---  	"$basetexture" "color/white"
---   	"$model" 		1
---  	"$translucent" 	1
---  	"$vertexalpha" 	1
---  	"$vertexcolor" 	1
---  	"$ignorez"		1
---  }
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetColorMaterialIgnoreZ)
function render.SetColorMaterialIgnoreZ() end

---[CLIENT] Sets the color modulation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetColorModulation)
---@param r number The red channel multiplier normal ranging from 0-1.
---@param g number The green channel multiplier normal ranging from 0-1.
---@param b number The blue channel multiplier normal ranging from 0-1.
function render.SetColorModulation(r, g, b) end

---[CLIENT] If the fog mode is set to Enums/MATERIAL_FOG, the fog will only be rendered below the specified height.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetFogZ)
---@param fogZ number The fog Z.
function render.SetFogZ(fogZ) end

---[CLIENT] Sets the goal HDR tone mapping scale.
---
--- Use this in a rendering/think hook as it is reset every frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetGoalToneMappingScale)
---@param scale number The target scale.
function render.SetGoalToneMappingScale(scale) end

---[CLIENT] Sets lighting mode when rendering something.
---
--- **Do not forget to restore the default value** to avoid unexpected behavior, like the world and the HUD/UI being affected
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetLightingMode)
---@param Mode number Lighting render mode
---
--- Possible values are:
--- * 0 - Default
--- * 1 - Total fullbright, similar to `mat_fullbright 1` but excluding some weapon view models
--- * 2 - Increased brightness(?), models look fullbright
function render.SetLightingMode(Mode) end

---[CLIENT] Sets the lighting origin.
---
--- This does not work for prop_physics.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetLightingOrigin)
---@param lightingOrigin Vector The position from which the light should be "emitted".
function render.SetLightingOrigin(lightingOrigin) end

---[CLIENT] Sets the texture to be used as the lightmap in upcoming rendering operations. This is required when rendering meshes using a material with a lightmapped shader such as LightmappedGeneric.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetLightmapTexture)
---@param tex ITexture The texture to be used as the lightmap.
function render.SetLightmapTexture(tex) end

---[CLIENT] Sets up the local lighting for any upcoming render operation. Up to 4 local lights can be defined, with one of three different types (point, directional, spot).
---
--- Disables all local lights if called with no arguments.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetLocalModelLights)
---@param lights? table A table containing up to 4 tables for each light source that should be set up. Each of these tables should contain the properties of its associated light source, see Structures/LocalLight.
function render.SetLocalModelLights(lights) end

---[CLIENT] Sets the material to be used in any upcoming render operation using the render.
---
--- Not to be confused with surface.SetMaterial.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetMaterial)
---@param mat IMaterial The material to be used.
function render.SetMaterial(mat) end

---[CLIENT] Sets up the ambient lighting for any upcoming render operation. Ambient lighting can be seen as a cube enclosing the object to be drawn, each of its faces representing a directional light source that shines towards the object. Thus, there is a total of six different light sources that can be configured separately.
---
--- Light color components are not restricted to a specific range (i.e. 0-255), instead, higher values will result in a brighter light.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetModelLighting)
---@param lightDirection number The light source to edit, see Enums/BOX.
---@param red number The red component of the light color.
---@param green number The green component of the light color.
---@param blue number The blue component of the light color.
function render.SetModelLighting(lightDirection, red, green, blue) end

---[CLIENT] Sets the render target to the specified rt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetRenderTarget)
---@param texture ITexture The new render target to be used.
function render.SetRenderTarget(texture) end

---[CLIENT] Sets the render target with the specified index to the specified rt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetRenderTargetEx)
---@param rtIndex number The index of the rt to set.
---@param texture ITexture The new render target to be used.
function render.SetRenderTargetEx(rtIndex, texture) end

---[CLIENT AND MENU] Sets a scissoring rect which limits the drawing area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetScissorRect)
---@param startX number X start coordinate of the scissor rect.
---@param startY number Y start coordinate of the scissor rect.
---@param endX number X end coordinate of the scissor rect.
---@param endY number Y end coordinate of the scissor rect.
---@param enable boolean Enable or disable the scissor rect.
function render.SetScissorRect(startX, startY, endX, endY, enable) end

---[CLIENT] Sets the shadow color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetShadowColor)
---@param red number The red channel of the shadow color.
---@param green number The green channel of the shadow color.
---@param blue number The blue channel of the shadow color.
function render.SetShadowColor(red, green, blue) end

---[CLIENT] Sets the shadow projection direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetShadowDirection)
---@param shadowDirections Vector The new shadow direction.
function render.SetShadowDirection(shadowDirections) end

---[CLIENT] Sets the maximum shadow projection range.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetShadowDistance)
---@param shadowDistance number The new maximum shadow distance.
function render.SetShadowDistance(shadowDistance) end

---[CLIENT] Sets whether any future render operations will ignore shadow drawing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetShadowsDisabled)
---@param newState boolean
function render.SetShadowsDisabled(newState) end

---[CLIENT AND MENU] Sets the compare function of the stencil.
---
--- Pixels which fail the stencil comparison function are not written to the render target. The operation to be performed on the stencil buffer values for these pixels can be set using render.SetStencilFailOperation.
---
--- Pixels which pass the stencil comparison function are written to the render target unless they fail the depth buffer test (where applicable). The operation to perform on the stencil buffer values for these pixels can be set using render.SetStencilPassOperation and render.SetStencilZFailOperation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction)
---@param compareFunction number Compare function, see Enums/STENCILCOMPARISONFUNCTION, and Enums/STENCIL for short.
function render.SetStencilCompareFunction(compareFunction) end

---[CLIENT AND MENU] Sets whether stencil tests are carried out for each rendered pixel.
---
--- Only pixels passing the stencil test are written to the render target.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilEnable)
---@param newState boolean The new state.
function render.SetStencilEnable(newState) end

---[CLIENT AND MENU] Sets the operation to be performed on the stencil buffer values if the compare function was not successful.
--- Note that this takes place **before** depth testing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation)
---@param failOperation number Fail operation function, see Enums/STENCILOPERATION.
function render.SetStencilFailOperation(failOperation) end

---[CLIENT AND MENU] Sets the operation to be performed on the stencil buffer values if the compare function was successful.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation)
---@param passOperation number Pass operation function, see Enums/STENCILOPERATION.
function render.SetStencilPassOperation(passOperation) end

---[CLIENT AND MENU] Sets the reference value which will be used for all stencil operations. This is an unsigned integer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue)
---@param referenceValue number Reference value.
function render.SetStencilReferenceValue(referenceValue) end

---[CLIENT AND MENU] Sets the unsigned 8-bit test bitflag mask that will be bitwise ANDed with all values as they are read from the Stencil Buffer
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilTestMask)
---@param mask number The mask bitflag.
function render.SetStencilTestMask(mask) end

---[CLIENT AND MENU] Sets the unsigned 8-bit write bitflag mask that will be bitwise ANDed with any value that is written to the Stencil Buffer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilWriteMask)
---@param mask number The mask bitflag.
function render.SetStencilWriteMask(mask) end

---[CLIENT AND MENU] Sets the operation to be performed on the stencil buffer values if the stencil test is passed but the depth buffer test fails.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetStencilZFailOperation)
---@param zFailOperation number Z fail operation function, see Enums/STENCILOPERATION
function render.SetStencilZFailOperation(zFailOperation) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetToneMappingScaleLinear)
---@param vec Vector
function render.SetToneMappingScaleLinear(vec) end

---[CLIENT AND MENU] Changes the view port position and size. The values will be clamped to the game's screen resolution.
---
--- If you are looking to render something to a texture (render target), you should use render.PushRenderTarget.
---
--- This function will override values of Global.ScrW and Global.ScrH with the ones you set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetViewPort)
---@param x number X origin of the view port.
---@param y number Y origin of the view port.
---@param w number Width of the view port.
---@param h number Height of the view port.
function render.SetViewPort(x, y, w, h) end

---[CLIENT] Sets the internal parameter **INT_RENDERPARM_WRITE_DEPTH_TO_DESTALPHA**
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SetWriteDepthToDestAlpha)
---@param enable boolean
function render.SetWriteDepthToDestAlpha(enable) end

---[CLIENT] Swaps the frame buffers/cycles the frame. In other words, this updates the screen.
---
--- If you take a really long time during a single frame render, it is a good idea to use this and let the user know that the game isn't stuck.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.Spin)
function render.Spin() end

---[CLIENT] Begin drawing a multi-segment Beam.
---
--- 	For more detailed information, including usage examples, see the [Beams Rendering Reference](https://wiki.facepunch.com/gmod/Beam_Rendering)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.StartBeam)
---@param segmentCount number The number of Beam Segments that this multi-segment Beam will contain
function render.StartBeam(segmentCount) end

---[CLIENT AND MENU] Returns whether the player's hardware supports HDR. (High Dynamic Range) HDR can still be disabled by the `mat_hdr_level` console variable or just not be supported by the map.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SupportsHDR)
---@return boolean # `true` if the player's hardware supports HDR.
function render.SupportsHDR() end

---[CLIENT AND MENU] Returns if the current settings and the system allow the usage of pixel shaders 1.4.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SupportsPixelShaders_1_4)
---@return boolean # Whether Pixel Shaders 1.4 are supported or not.
function render.SupportsPixelShaders_1_4() end

---[CLIENT AND MENU] Returns if the current settings and the system allow the usage of pixel shaders 2.0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SupportsPixelShaders_2_0)
---@return boolean # Whether Pixel Shaders 2.0 are supported or not.
function render.SupportsPixelShaders_2_0() end

---[CLIENT AND MENU] Returns if the current settings and the system allow the usage of vertex shaders 2.0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SupportsVertexShaders_2_0)
---@return boolean # Whether Vertex Shaders 2.0 are supported or not.
function render.SupportsVertexShaders_2_0() end

---[CLIENT] Suppresses or enables any engine lighting for any upcoming render operation.
---
--- This does not affect IMeshes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.SuppressEngineLighting)
---@param suppressLighting boolean True to suppress false to enable.
function render.SuppressEngineLighting(suppressLighting) end

---[CLIENT] Enables HDR tone mapping which influences the brightness.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.TurnOnToneMapping)
function render.TurnOnToneMapping() end

---[CLIENT] Updates the texture returned by render.GetFullScreenDepthTexture.
---
--- Silently fails if render.SupportsPixelShaders_2_0 returns false.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.UpdateFullScreenDepthTexture)
function render.UpdateFullScreenDepthTexture() end

---[CLIENT] Updates the power of two texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.UpdatePowerOfTwoTexture)
---@return ITexture # The render.GetPowerOfTwoTexture.
function render.UpdatePowerOfTwoTexture() end

---[CLIENT] Pretty much alias of render.UpdatePowerOfTwoTexture but does not return the texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.UpdateRefractTexture)
function render.UpdateRefractTexture() end

---[CLIENT] Copies the entire screen to the screen effect texture, which can be acquired via render.GetScreenEffectTexture. This function is mainly intended to be used in GM:RenderScreenspaceEffects
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.UpdateScreenEffectTexture)
---@param textureIndex? number Texture index to update. Max index is 3, but engine only creates the first two for you.
function render.UpdateScreenEffectTexture(textureIndex) end

---[CLIENT] This function overrides all map materials for one frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/render.WorldMaterialOverride)
---@param mat? IMaterial
function render.WorldMaterialOverride(mat) end
