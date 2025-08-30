---@meta

--- The render library is a powerful set of functions that let you control how the world and its contents are rendered. It can also be used to draw some 3D clientside effects such as beams, boxes and spheres.
render = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a Beam Segment to the Beam started by [render.StartBeam](https://wiki.facepunch.com/gmod/render.StartBeam).
---
--- For more detailed information on Beams, as well as usage examples, see the [Beams Render Reference](https://wiki.facepunch.com/gmod/render_beams)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.AddBeam)
---@param startPos Vector Beam start position.
---@param width number The width of the beam.
---@param textureEnd number The end coordinate of the texture used.
---@param color table The color to be used. Uses the Color.
function render.AddBeam(startPos, width, textureEnd, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Blurs the render target ( or a given texture )
---
--- **WARNING**: Calling this on a RenderTarget created with TEXTUREFLAGS_POINTSAMPLE will result in strange visual glitching.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.BlurRenderTarget)
---@param rendertarget ITexture The texture to blur
---@param blurx number Horizontal amount of blur
---@param blury number Vertical amount of blur
---@param passes number Amount of passes to go through
function render.BlurRenderTarget(rendertarget, blurx, blury, passes) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) This function overrides the brush material for next render operations. It can be used with [Entity:DrawModel](https://wiki.facepunch.com/gmod/Entity:DrawModel).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.BrushMaterialOverride)
---@param mat? IMaterial
function render.BrushMaterialOverride(mat) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Captures a part of the current render target and returns the data as a binary string in the given format.
---
--- Since the pixel buffer clears itself every frame, this will return a black screen outside of render hooks. To capture the user's final view, use [GM:PostRender](https://wiki.facepunch.com/gmod/GM:PostRender). This will not capture the Steam overlay or third-party injections (such as the Discord overlay, Overwolf, and advanced cheats) on the user's screen.
---
--- In PNG mode, this function can produce unexpected result where foreground is rendered as transparent.
--- This is caused by [render.SetWriteDepthToDestAlpha](https://wiki.facepunch.com/gmod/render.SetWriteDepthToDestAlpha) set to `true` when doing most of render operations, including rendering in `_rt_fullframefb`. If you want to capture render target's content as PNG image only for output quality, set [Structures/RenderCaptureData](https://wiki.facepunch.com/gmod/Structures/RenderCaptureData)'s `alpha` to `false` when capturing render targets with [render.SetWriteDepthToDestAlpha](https://wiki.facepunch.com/gmod/render.SetWriteDepthToDestAlpha) set to `true`.
---
--- **WARNING**: This function will return nil if escape menu is open
---
---[View wiki](https://wiki.facepunch.com/gmod/render.Capture)
---@param captureData table Parameters of the capture. See Structures/RenderCaptureData.
---@return string # binaryData
function render.Capture(captureData) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Dumps the current render target and allows the pixels to be accessed by [render.ReadPixel](https://wiki.facepunch.com/gmod/render.ReadPixel).
---
--- Capturing outside a render hook will return 0 0 0 255
---
---[View wiki](https://wiki.facepunch.com/gmod/render.CapturePixels)
function render.CapturePixels() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Clears the current render target and the specified buffers.
---
--- This sets the alpha incorrectly for [surface](https://wiki.facepunch.com/gmod/surface) draw calls for render targets.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.Clear)
---@param r number Red component to clear to.
---@param g number Green component to clear to.
---@param b number Blue component to clear to.
---@param a number Alpha component to clear to.
---@param clearDepth? boolean Clear the depth.
---@param clearStencil? boolean Clear the stencil.
function render.Clear(r, g, b, a, clearDepth, clearStencil) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Tests every pixel of the active [Render Target](https://wiki.facepunch.com/gmod/render_rendertargets) against the current Stencil configuration and sets the Color Channel values and, optionally, the Depth Buffer values for every pixel that passes.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
--- **NOTE**: This function does **not** clear the Stencil Buffer on its own.
--- 	If you would like to clear the Stencil Buffer, you can use [render.ClearStencil](https://wiki.facepunch.com/gmod/render.ClearStencil)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ClearBuffersObeyStencil)
---@param red number The red Color Channel value for each pixel that is cleared.
--- Must be an integer value in the range 0-255 (`byte`)
---@param green number The green Color Channel value for each pixel that is cleared.
--- Must be an integer value in the range 0-255 (`byte`)
---@param blue number The blue Color Channel value for each pixel that is cleared.
--- Must be an integer value in the range 0-255 (`byte`)
---@param alpha number The alpha (translucency) Color Channel value for each pixel that is cleared.
--- Must be an integer value in the range 0-255 (`byte`)
---@param clearDepth boolean If true, reset the Depth Buffer values.
function render.ClearBuffersObeyStencil(red, green, blue, alpha, clearDepth) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Resets the depth buffer.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ClearDepth)
---@param clearStencil? boolean Whether to also clear the stencil buffer.
function render.ClearDepth(clearStencil) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Clears a render target
---
--- It uses [render.Clear](https://wiki.facepunch.com/gmod/render.Clear) then [render.SetRenderTarget](https://wiki.facepunch.com/gmod/render.SetRenderTarget) on the modified render target.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ClearRenderTarget)
---@param texture ITexture
---@param color table The color, see Color
function render.ClearRenderTarget(texture, color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the Stencil Buffer value to `0` for all pixels in the currently active [Render Target](https://wiki.facepunch.com/gmod/render_rendertargets).
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ClearStencil)
function render.ClearStencil() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the Stencil Buffer value for every pixel in a given rectangle to a given value.
---
--- This is **not** affected by [render.SetStencilWriteMask](https://wiki.facepunch.com/gmod/render.SetStencilWriteMask)
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ClearStencilBufferRectangle)
---@param startX number The X coordinate of the top left corner of the rectangle to be cleared.
---@param startY number The Y coordinate of the top left corner of the rectangle to be cleared.
---@param endX number The X coordinate of the bottom right corner of the rectangle to be cleared.
--- **Note:** Unlike some other rectangle-based functions, this is **not** the width of the rectangle.
---@param endY number The Y coordinate of the bottom right corner of the rectangle to be cleared.
--- **Note:** Unlike some other rectangle-based functions, this is **not** the height of the rectangle.
---@param stencilBufferValue number The Stencil Buffer value that all pixels within the rectangle will be set to.
function render.ClearStencilBufferRectangle(startX, startY, endX, endY, stencilBufferValue) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Calculates the lighting caused by dynamic lights for the specified surface.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ComputeDynamicLighting)
---@param position Vector The position to sample from.
---@param normal Vector The normal of the surface.
---@return Vector # A vector representing the light at that point.
function render.ComputeDynamicLighting(position, normal) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Calculates the light color of a certain surface.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ComputeLighting)
---@param position Vector The position of the surface to get the light from.
---@param normal Vector The normal of the surface to get the light from.
---@return Vector # A vector representing the light at that point.
function render.ComputeLighting(position, normal) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Calculates diameter of a 3D sphere on a 2D screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ComputePixelDiameterOfSphere)
---@param point Vector The position of the sphere in 3D space.
---@param radius number The radius of the sphere in 3D space.
---@return number # The diameter of the sphere in 2D screen space.
function render.ComputePixelDiameterOfSphere(point, radius) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Copies the currently active Render Target to the specified texture.
--- 		**WARNING**: This does not copy the Depth buffer, no method for that is known at this moment so a common workaround is to store the source texture somewhere else, perform your drawing operations, save the result somewhere else and reapply the source texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.CopyRenderTargetToTexture)
---@param Target ITexture The texture to copy to
function render.CopyRenderTargetToTexture(Target) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Copies the contents of one texture to another. Only works with rendertargets.
--- 		**WARNING**: This does not copy the Depth buffer, no method for that is known at this moment so a common workaround is to store the source texture somewhere else, perform your drawing operations, save the result somewhere else and reapply the source texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.CopyTexture)
---@param texture_from ITexture
---@param texture_to ITexture
function render.CopyTexture(texture_from, texture_to) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the cull mode. The culling mode defines how back faces are culled when rendering geometry.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.CullMode)
---@param cullMode number Cullmode, see Enums/MATERIAL_CULLMODE
function render.CullMode(cullMode) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Set's the depth range of the upcoming render.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DepthRange)
---@param depthmin number The minimum depth of the upcoming render. `0.0` = render normally; `1.0` = render nothing.
---@param depthmax number The maximum depth of the upcoming render. `0.0` = render everything (through walls); `1.0` = render normally.
function render.DepthRange(depthmin, depthmax) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a single-segment Beam made out of a textured, billboarded quad stretching between two points.
---
--- For more detailed information, including usage examples, see the [Beams Render Reference](https://wiki.facepunch.com/gmod/render_beams)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawBeam)
---@param startPos Vector The Beam's start position.
---@param endPos Vector The Beam's end position.
---@param width number The width of the Beam.
---@param textureStart number The starting coordinate of the Beam's texture.
---@param textureEnd number The end coordinate of the Beam's texture.
---@param color? Color What Color to tint the Beam.
function render.DrawBeam(startPos, endPos, width, textureStart, textureEnd, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a box in 3D space.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawBox)
---@param position Vector Origin of the box.
---@param angles Angle Orientation of the box.
---@param mins Vector Start position of the box, relative to origin.
---@param maxs Vector End position of the box, relative to origin.
---@param color? table The color of the box. Uses the Color.
function render.DrawBox(position, angles, mins, maxs, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a line in 3D space.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawLine)
---@param startPos Vector Line start position in world coordinates.
---@param endPos Vector Line end position in world coordinates.
---@param color? table The color to be used. Uses the Color.
---@param writeZ? boolean Whether or not to consider the Z buffer. If false, the line will be drawn over everything currently drawn, if true, the line will be drawn with depth considered, as if it were a regular object in 3D space.
---
--- Enabling this option will cause the line to ignore the color's alpha.
function render.DrawLine(startPos, endPos, color, writeZ) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws 2 connected triangles. Expects material to be set by [render.SetMaterial](https://wiki.facepunch.com/gmod/render.SetMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawQuad)
---@param vert1 Vector First vertex.
---@param vert2 Vector The second vertex.
---@param vert3 Vector The third vertex.
---@param vert4 Vector The fourth vertex.
---@param color? table The color of the quad. See Global.Color
function render.DrawQuad(vert1, vert2, vert3, vert4, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a quad. Expects material to be set by [render.SetMaterial](https://wiki.facepunch.com/gmod/render.SetMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawQuadEasy)
---@param position Vector Origin of the sprite.
---@param normal Vector The face direction of the quad.
---@param width number The width of the quad.
---@param height number The height of the quad.
---@param color table The color of the quad. Uses the Color.
---@param rotation? number The rotation of the quad counter-clockwise in degrees around the normal axis. In other words, the quad will always face the same way but this will rotate its corners.
function render.DrawQuadEasy(position, normal, width, height, color, rotation) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the current material set by [render.SetMaterial](https://wiki.facepunch.com/gmod/render.SetMaterial) to the whole screen. The color cannot be customized.
---
--- See also [render.DrawScreenQuadEx](https://wiki.facepunch.com/gmod/render.DrawScreenQuadEx).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawScreenQuad)
---@param applyPoster? boolean If set to true, when rendering a poster the quad will be properly drawn in parts in the poster. This is used internally by some Post Processing effects. Certain special textures (frame buffer like textures) do not need this adjustment.
function render.DrawScreenQuad(applyPoster) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the current material set by [render.SetMaterial](https://wiki.facepunch.com/gmod/render.SetMaterial) to the area specified. Color cannot be customized.
---
--- See also [render.DrawScreenQuad](https://wiki.facepunch.com/gmod/render.DrawScreenQuad).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawScreenQuadEx)
---@param startX number X start position of the rect.
---@param startY number Y start position of the rect.
---@param width number Width of the rect.
---@param height number Height of the rect.
function render.DrawScreenQuadEx(startX, startY, width, height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a sphere in 3D space. The material previously set with [render.SetMaterial](https://wiki.facepunch.com/gmod/render.SetMaterial) will be applied the sphere's surface.
---
--- See also [render.DrawWireframeSphere](https://wiki.facepunch.com/gmod/render.DrawWireframeSphere) for a wireframe equivalent.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawSphere)
---@param position Vector Position of the sphere.
---@param radius number Radius of the sphere. Negative radius will make the sphere render inwards rather than outwards.
---@param longitudeSteps number The number of longitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
---@param latitudeSteps number The number of latitude steps. This controls the quality of the sphere. Higher quality will lower performance significantly. 50 is a good number to start with.
---@param color? table The color of the sphere. Uses the Color.
function render.DrawSphere(position, radius, longitudeSteps, latitudeSteps, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a sprite in 3D space.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawSprite)
---@param position Vector Position of the sprite.
---@param width number Width of the sprite.
---@param height number Height of the sprite.
---@param color? table Color of the sprite. Uses the Color.
function render.DrawSprite(position, width, height, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a texture over the whole screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawTextureToScreen)
---@param tex ITexture The texture to draw
function render.DrawTextureToScreen(tex) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a textured rectangle.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawTextureToScreenRect)
---@param tex ITexture The texture to draw
---@param x number The x coordinate of the rectangle to draw.
---@param y number The y coordinate of the rectangle to draw.
---@param width number The width of the rectangle to draw.
---@param height number The height of the rectangle to draw.
function render.DrawTextureToScreenRect(tex, x, y, width, height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a wireframe box in 3D space.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawWireframeBox)
---@param position Vector Position of the box.
---@param angle Angle Angles of the box.
---@param mins Vector The lowest corner of the box.
---@param maxs Vector The highest corner of the box.
---@param color? table The color of the box. Uses the Color.
---@param writeZ? boolean Sets whenever to write to the zBuffer.
function render.DrawWireframeBox(position, angle, mins, maxs, color, writeZ) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a wireframe sphere in 3d space.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.DrawWireframeSphere)
---@param position Vector Position of the sphere.
---@param radius number The size of the sphere.
---@param longitudeSteps number The amount of longitude steps.
--- The larger this number is, the smoother the sphere is.
---@param latitudeSteps number The amount of latitude steps.
--- The larger this number is, the smoother the sphere is.
---@param color? table The color of the wireframe. Uses the Color.
---@param writeZ? boolean Whether or not to consider the Z buffer. If false, the wireframe will be drawn over everything currently drawn. If true, it will be drawn with depth considered, as if it were a regular object in 3D space.
function render.DrawWireframeSphere(position, radius, longitudeSteps, latitudeSteps, color, writeZ) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the status of the clip renderer, returning previous state.
---
--- **WARNING**: To prevent unintended rendering behavior of other mods/the game, you must reset the clipping state to its previous value.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.EnableClipping)
---@param state boolean New clipping state.
---@return boolean # Previous clipping state.
function render.EnableClipping(state) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Ends the beam mesh of a beam started with [render.StartBeam](https://wiki.facepunch.com/gmod/render.StartBeam).
---
--- For more detailed information on Beams, as well as usage examples, see the [Beams Render Reference](https://wiki.facepunch.com/gmod/render_beams)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.EndBeam)
function render.EndBeam() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the color of the fog.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.FogColor)
---@param red number Red channel of the fog color, 0 - 255.
---@param green number Green channel of the fog color, 0 - 255.
---@param blue number Blue channel of the fog color, 0 - 255.
function render.FogColor(red, green, blue) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the at which the fog reaches its max density.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.FogEnd)
---@param distance number The distance at which the fog reaches its max density.
---
--- If used in [GM:SetupSkyboxFog](https://wiki.facepunch.com/gmod/GM:SetupSkyboxFog), this value **must** be scaled by the first argument of the hook
function render.FogEnd(distance) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the maximum density of the fog.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.FogMaxDensity)
---@param maxDensity number The maximum density of the fog, 0-1.
function render.FogMaxDensity(maxDensity) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the mode of fog.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.FogMode)
---@param fogMode MATERIAL_FOG Fog mode, see Enums/MATERIAL_FOG.
function render.FogMode(fogMode) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the distance at which the fog starts showing up.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.FogStart)
---@param fogStart number The distance at which the fog starts showing up.
--- If used in [GM:SetupSkyboxFog](https://wiki.facepunch.com/gmod/GM:SetupSkyboxFog), this value **must** be scaled by the first argument of the hook
function render.FogStart(fogStart) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the ambient color of the map.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetAmbientLightColor)
---@return Vector # color
function render.GetAmbientLightColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current alpha blending.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetBlend)
---@return number # Current alpha blending in range 0 to 1.
function render.GetBlend() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: You can use [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx) if you need to create a Render Target
---
--- Returns the Render Target texture that is used internally for the [Bloom](https://wiki.facepunch.com/gmod/Global.DrawBloom) [Post Processing](https://wiki.facepunch.com/gmod/Post-Processing_Materials) effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetBloomTex0)
---@return ITexture # The render target texture named `s_pBloomTex0`.
function render.GetBloomTex0() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: You probably want to just use a custom render target. See [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx).
---
--- Returns the Render Target texture used internally for the [Blur](https://wiki.facepunch.com/gmod/render.BlurRenderTarget) [Post Processing](https://wiki.facepunch.com/gmod/Post-Processing_Materials) effect.
---
--- Despite its name, this function is not used for the [Bloom](https://wiki.facepunch.com/gmod/Global.DrawBloom) effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetBloomTex1)
---@return ITexture # The render target texture named `s_pBloomTex1`.
function render.GetBloomTex1() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current color modulation values as normals.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetColorModulation)
---@return number # r
---@return number # g
---@return number # b
function render.GetColorModulation() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the maximum available directX version.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetDXLevel)
---@return number # dxLevel
function render.GetDXLevel() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current fog color.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetFogColor)
---@return number # Red part of the color.
---@return number # Green part of the color
---@return number # Blue part of the color
function render.GetFogColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the fog start and end distance.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetFogDistances)
---@return number # Fog start distance set by render.FogStart
---@return number # For end distance set by render.FogEnd
---@return number # Fog Z distance set by render.SetFogZ
function render.GetFogDistances() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the fog mode.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetFogMode)
---@return number # Fog mode, see Enums/MATERIAL_FOG
function render.GetFogMode() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the full screen depth texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetFullScreenDepthTexture)
---@return ITexture # The `_rt_FullFrameDepth` texture.
function render.GetFullScreenDepthTexture() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether HDR is currently enabled or not. This takes into account hardware support, current map and current client settings.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetHDREnabled)
---@return boolean # `true` if the player currently has HDR enabled.
function render.GetHDREnabled() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets the light exposure on the specified position.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetLightColor)
---@param position Vector The position of the surface to get the light from.
---@return Vector # lightColor
function render.GetLightColor(position) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: You probably want to just use a custom render target. See [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx).
---
--- Returns the first render target texture that is used internally for Motion Blur and Frame Blend post processing effects.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetMoBlurTex0)
---@return ITexture # The render target named `s_pMoBlurTex0`.
function render.GetMoBlurTex0() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: You probably want to just use a custom render target. See [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx).
---
--- Returns the second render target texture that is used internally for Motion Blur and Frame Blend post processing effects.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetMoBlurTex1)
---@return ITexture # The render target named `s_pMoBlurTex1`.
function render.GetMoBlurTex1() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: You probably want to just use a custom render target. See [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx).
---
--- Returns the first render target texture that was used internally for Morph post processing effect
---
--- The post processing effect was removed from the base game at some point during development of Garry's Mod 13, but can still be found as a community mod: https://steamcommunity.com/sharedfiles/filedetails/?id=501088470
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetMorphTex0)
---@return ITexture # The render target texture named `s_pMorphTexture0`.
function render.GetMorphTex0() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: You probably want to just use a custom render target. See [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx).
---
--- Returns the second render target texture that was used internally for Morph post processing effect.
---
--- See [render.GetMorphTex0](https://wiki.facepunch.com/gmod/render.GetMorphTex0) for more information..
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetMorphTex1)
---@return ITexture # The render target texture named `s_pMorphTexture1`.
function render.GetMorphTex1() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the Power Of Two Frame Buffer texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetPowerOfTwoTexture)
---@return ITexture # The power of two texture, which is `_rt_PowerOfTwoFB` by default.
function render.GetPowerOfTwoTexture() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Alias of [render.GetPowerOfTwoTexture](https://wiki.facepunch.com/gmod/render.GetPowerOfTwoTexture).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetRefractTexture)
---@return ITexture # The render.GetPowerOfTwoTexture.
---@deprecated Alias of render.GetPowerOfTwoTexture.
function render.GetRefractTexture() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the currently active render target.
---
--- Instead of saving the current render target using this function and restoring to it later, it is generally better practice to use [render.PushRenderTarget](https://wiki.facepunch.com/gmod/render.PushRenderTarget) and [render.PopRenderTarget](https://wiki.facepunch.com/gmod/render.PopRenderTarget).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetRenderTarget)
---@return ITexture # The currently active Render Target
function render.GetRenderTarget() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the `_rt_ResolvedFullFrameDepth` texture for SSAO depth. It will only be updated if [GM:NeedsDepthPass](https://wiki.facepunch.com/gmod/GM:NeedsDepthPass) returns true.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetResolvedFullFrameDepth)
---@return ITexture # The depth texture.
function render.GetResolvedFullFrameDepth() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Obtain an [ITexture](https://wiki.facepunch.com/gmod/ITexture) of the screen. You must call [render.UpdateScreenEffectTexture](https://wiki.facepunch.com/gmod/render.UpdateScreenEffectTexture) in order to update this texture with the currently rendered scene.
---
--- This texture is mainly used within [GM:RenderScreenspaceEffects](https://wiki.facepunch.com/gmod/GM:RenderScreenspaceEffects)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetScreenEffectTexture)
---@param textureIndex? number Max index is 3, but engine only creates the first two for you.
---@return ITexture # The requested texture.
function render.GetScreenEffectTexture(textureIndex) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the first quarter sized frame buffer texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetSmallTex0)
---@return ITexture # The render target texture named `_rt_SmallFB0`.
function render.GetSmallTex0() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the second quarter sized frame buffer texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetSmallTex1)
---@return ITexture # The render target texture named `_rt_SmallFB1`.
function render.GetSmallTex1() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a floating point texture (RGBA16161616F format) the same resolution as the screen.
---
--- **NOTE**: The [gmodscreenspace](https://wiki.facepunch.com/gmod/gmodscreenspace) doesn't behave as expected when drawing a floating-point texture to an integer texture (e.g. the default render target). Use an UnlitGeneric material instead
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetSuperFPTex)
---@return ITexture # Render target named `__rt_SuperTexture1`
function render.GetSuperFPTex() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) See [render.GetSuperFPTex](https://wiki.facepunch.com/gmod/render.GetSuperFPTex)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetSuperFPTex2)
---@return ITexture # Render target named `__rt_SuperTexture2`.
function render.GetSuperFPTex2() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Performs a render trace and returns the color of the surface hit, this uses a low res version of the texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetSurfaceColor)
---@param startPos Vector The start position to trace from.
---@param endPos Vector The end position of the trace.
---@return Vector # color
function render.GetSurfaceColor(startPos, endPos) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a vector representing linear tone mapping scale.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetToneMappingScaleLinear)
---@return Vector # The vector representing linear tone mapping scale.
function render.GetToneMappingScaleLinear() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the current view setup.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.GetViewSetup)
---@param noPlayer? boolean If `true`, returns the `view->GetViewSetup`, if `false` - returns `view->GetPlayerViewSetup`
---@return table # Current current view setup. See Structures/ViewSetup
function render.GetViewSetup(noPlayer) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the render material override for all next calls of [Entity:DrawModel](https://wiki.facepunch.com/gmod/Entity:DrawModel). Also overrides [render.MaterialOverrideByIndex](https://wiki.facepunch.com/gmod/render.MaterialOverrideByIndex).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.MaterialOverride)
---@param material? IMaterial|nil The material to use as override, use `nil` to disable.
function render.MaterialOverride(material) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Similar to [render.MaterialOverride](https://wiki.facepunch.com/gmod/render.MaterialOverride), but overrides the materials per index. Similar to [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial)
---
--- [render.MaterialOverride](https://wiki.facepunch.com/gmod/render.MaterialOverride) overrides effects of this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.MaterialOverrideByIndex)
---@param index? number The index of the material to override, in range of 0 to 31. `nil` will reset all overrides.
---@param material? IMaterial The material to override with, `nil` will reset the override for given index.
function render.MaterialOverrideByIndex(index, material) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the maximum texture height the renderer can handle.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.MaxTextureHeight)
---@return number # maxTextureHeight
function render.MaxTextureHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the maximum texture width the renderer can handle.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.MaxTextureWidth)
---@return number # maxTextureWidth
function render.MaxTextureWidth() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel), renders it at the specified pos/ang, and removes it. Can also be given an existing [CSEnt](https://wiki.facepunch.com/gmod/CSEnt) to reuse instead.
---
--- **NOTE**: This function is only meant to be used in a single render pass kind of scenario, if you need to render a model continuously, use a cached [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel) and provide it as a second argument.
---
--- Using this with a map model ([game.GetWorld](https://wiki.facepunch.com/gmod/game.GetWorld)():[GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel)()) crashes the game.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.Model)
---@param settings table Requires:
--- * string model - The model to draw
--- * Vector pos - The position to draw the model at
--- * Angle angle - The angles to draw the model at
---@param ent? CSEnt If provided, this entity will be reused instead of creating a new one with Global.ClientsideModel. Note that the ent's model, position and angles will be changed, and Entity:SetNoDraw will be set to true.
function render.Model(settings, ent) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Forces all future draw operations to use a specific [IMaterial](https://wiki.facepunch.com/gmod/IMaterial).
---
--- Because this is independent of a specific [Entity](https://wiki.facepunch.com/gmod/Entity), it can be used to change materials on static models that are part of maps.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ModelMaterialOverride)
---@param material IMaterial The IMaterial that will be used for all upcoming draw operations, or `nil` to stop overriding.
function render.ModelMaterialOverride(material) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Overrides the write behaviour of all next rendering operations towards the alpha channel of the current render target.
---
--- See also [render.OverrideBlend](https://wiki.facepunch.com/gmod/render.OverrideBlend).
---
--- **NOTE**: Doing [surface](https://wiki.facepunch.com/gmod/surface) draw calls with alpha set to 0 is a no-op and will never have any effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.OverrideAlphaWriteEnable)
---@param enable boolean Enable or disable the override.
---@param shouldWrite? boolean If the previous argument is true, sets whether the next rendering operations should write to the alpha channel or not. Has no effect if the previous argument is false.
function render.OverrideAlphaWriteEnable(enable, shouldWrite) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Overrides the way that the final color and alpha is calculated for each pixel affected by upcoming draw operations.
---
--- When a draw operation is performed, the rendering system examines each pixel that is affected by the draw operation and determines its new color by combining (or "Blending") the pixel's current color (Called the "Destination" or "Dst" color) with the new color produced by the draw operation (Called the "Source" or "Src" color.)
---
--- This function allows you to control the way that those two colors (The Source and Destination) are combined to produce the final pixel color.
---
--- It's important to know that while [Colors](https://wiki.facepunch.com/gmod/Global.Color) use values in the range `(0-255)`, the color and alpha values used here are normalized to the range `(0-1)` so that they can be multiplied together to produce a value that is still in the range `(0-1)`.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.OverrideBlend)
---@param enabled boolean Set to `true` to enable Blend Overrides.
---@param sourceMultiplier BLEND This determines which value each affected pixel's **Source color and alpha** will be multiplied by before they are sent to the Blending Function.
--- One of the Enums/BLEND enums.
---@param destinationMultiplier BLEND This determines which value each affected pixel's **Destination color and alpha** will be multiplied by before they are sent to the Blending Function.
--- One of the Enums/BLEND enums.
---@param blendingFunction BLENDFUNC After the Source and Destination color and alpha have been multiplied against their corresponding multipliers, they are passed to the Blending Function which combines them into the final color and alpha for the pixel.
--- One of the Enums/BLENDFUNC enums.
function render.OverrideBlend(enabled, sourceMultiplier, destinationMultiplier, blendingFunction) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Overrides the way that the final color and alpha is calculated for each pixel affected by upcoming draw operations.
---
--- When a draw operation is performed, the rendering system examines each pixel that is affected by the draw operation and determines its new color by combining (or "Blending") the pixel's current color (Called the "Destination" or "Dst" color) with the new color produced by the draw operation (Called the "Source" or "Src" color.)
---
--- This function allows you to control the way that those two colors (The Source and Destination) are combined to produce the final pixel color.
---
--- It's important to know that while [Colors](https://wiki.facepunch.com/gmod/Global.Color) use values in the range `(0-255)`, the color and alpha values used here are normalized to the range `(0-1)` so that they can be multiplied together to produce a value that is still in the range `(0-1)`.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.OverrideBlend)
---@param enabled boolean Set to `true` to enable Blend Overrides.
---@param sourceColorMultiplier BLEND This determines which value each affected pixel's **Source color** will be multiplied by before they are sent to the Color Blending Function.
--- One of the Enums/BLEND enums.
---@param destinationColorMultiplier BLEND This determines which value each affected pixel's **Destination color** will be multiplied by before they are sent to the Color Blending Function.
--- One of the Enums/BLEND enums.
---@param colorBlendingFunction BLENDFUNC After the Source and Destination colors have been multiplied against their corresponding multipliers, they are passed to the Color Blending Function which combines them into the final color and alpha for the pixel.
--- One of the Enums/BLENDFUNC enums.
---@param sourceAlphaMultiplier? BLEND This determines which value each affected pixel's **Source alpha** will be multiplied by before they are sent to the Alpha Blending Function.
--- One of the Enums/BLEND enums.
---@param destinationAlphaMultiplier? BLEND This determines which value each affected pixel's **Destination alpha** will be multiplied by before they are sent to the Alpha Blending Function.
--- One of the Enums/BLEND enums.
---@param alphaBlendingFunction? BLENDFUNC After the Source and Destination alphas have been multiplied against their corresponding multipliers, they are passed to the Alpha Blending Function which combines them into the final alpha for the pixel.
function render.OverrideBlend(
	enabled,
	sourceColorMultiplier,
	destinationColorMultiplier,
	colorBlendingFunction,
	sourceAlphaMultiplier,
	destinationAlphaMultiplier,
	alphaBlendingFunction
)
end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Overrides the way that the final color and alpha is calculated for each pixel affected by upcoming draw operations.
---
--- When a draw operation is performed, the rendering system examines each pixel that is affected by the draw operation and determines its new color by combining (or "Blending") the pixel's current color (Called the "Destination" or "Dst" color) with the new color produced by the draw operation (Called the "Source" or "Src" color.)
---
--- This function allows you to control the way that those two colors (The Source and Destination) are combined to produce the final pixel color.
---
--- It's important to know that while [Colors](https://wiki.facepunch.com/gmod/Global.Color) use values in the range `(0-255)`, the color and alpha values used here are normalized to the range `(0-1)` so that they can be multiplied together to produce a value that is still in the range `(0-1)`.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.OverrideBlend)
---@param enabled boolean Set to `false` to disable blend overrides.
function render.OverrideBlend(enabled) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Overrides the internal graphical functions used to determine the final color and alpha of a rendered texture.
---
--- See also [render.OverrideAlphaWriteEnable](https://wiki.facepunch.com/gmod/render.OverrideAlphaWriteEnable).
---
--- **NOTE**: Doing [surface](https://wiki.facepunch.com/gmod/surface) draw calls with alpha set to 0 is a no-op and will never have any effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.OverrideBlendFunc)
---@param enabled boolean true to enable, false to disable. No other arguments are required when disabling.
---@param srcBlend number The source color blend function Enums/BLEND. Determines how a rendered texture's final color should be calculated.
---@param destBlend number
---@param srcBlendAlpha? number The source alpha blend function Enums/BLEND. Determines how a rendered texture's final alpha should be calculated.
---@param destBlendAlpha? number
---@deprecated Use render.OverrideBlend instead.
function render.OverrideBlendFunc(enabled, srcBlend, destBlend, srcBlendAlpha, destBlendAlpha) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Overrides the write behaviour of all next rendering operations towards the color channel of the current render target.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.OverrideColorWriteEnable)
---@param enable boolean Enable or disable the override.
---@param shouldWrite boolean If the previous argument is true, sets whether the next rendering operations should write to the color channel or not. Has no effect if the previous argument is false.
function render.OverrideColorWriteEnable(enable, shouldWrite) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Overrides the write behaviour of all next rendering operations towards the depth buffer.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.OverrideDepthEnable)
---@param enable boolean Enable or disable the override.
---@param shouldWrite boolean If the previous argument is true, sets whether the next rendering operations should write to the depth buffer or not. Has no effect if the previous argument is false.
function render.OverrideDepthEnable(enable, shouldWrite) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Performs a Stencil operation on every pixel in the active [Render Target](https://wiki.facepunch.com/gmod/render_rendertargets) without performing a draw operation.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PerformFullScreenStencilOperation)
function render.PerformFullScreenStencilOperation() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Removes the current active clipping plane from the clip plane stack.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PopCustomClipPlane)
function render.PopCustomClipPlane() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Pops (Removes) the texture filter most recently pushed (Added) onto the magnification texture filter stack.
---
--- This function should only be called *after* a magnification filter has been pushed via [render.PushFilterMag()](https://wiki.facepunch.com/gmod/render.PushFilterMag)
---
--- For more detailed information and a usage example, see [the texture minification and magnification render reference.](https://wiki.facepunch.com/gmod/render_min_mag_filters)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PopFilterMag)
function render.PopFilterMag() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Pops (Removes) the texture filter most recently pushed (Added) onto the minification texture filter stack.
---
--- This function should only be called *after* a minification filter has been pushed via [render.PushFilterMin()](https://wiki.facepunch.com/gmod/render.PushFilterMin)
---
--- For more detailed information and a usage example, see [the texture minification and magnification render reference.](https://wiki.facepunch.com/gmod/render_min_mag_filters)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PopFilterMin)
function render.PopFilterMin() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Pops the current flashlight mode from the flashlight mode stack.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PopFlashlightMode)
function render.PopFlashlightMode() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Pops the last render target and viewport from the RT stack and sets them as the current render target and viewport.
---
--- This is should be called to restore the previous render target and viewport after a call to [render.PushRenderTarget](https://wiki.facepunch.com/gmod/render.PushRenderTarget).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PopRenderTarget)
function render.PopRenderTarget() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Pushes a new clipping plane of the clip plane stack and sets it as active.
---
--- A max of 2 clip planes are supported on Linux/POSIX, and 6 on Windows.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PushCustomClipPlane)
---@param normal Vector The normal of the clipping plane.
---@param distance number The distance of the plane from the world origin. You can use Vector:Dot between the normal and any point on the plane to find this.
function render.PushCustomClipPlane(normal, distance) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Pushes (Adds) a texture filter onto the magnification texture filter stack.
--- This will modify how textures are stretched to sizes larger than their native resolution for upcoming rendering and drawing operations.
--- For a version of this same function that modifies filtering for texture sizes smaller than their native resolution, see [render.PushFilterMin()](https://wiki.facepunch.com/gmod/render.PushFilterMin)
---
--- Always be sure to call [render.PopFilterMag()](https://wiki.facepunch.com/gmod/render.PopFilterMag) afterwards to avoid texture filtering problems.
---
--- For more detailed information and a usage example, see [the texture minification and magnification render reference.](https://wiki.facepunch.com/gmod/render_min_mag_filters)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PushFilterMag)
---@param texFilterType number The texture filter to use. For available options, see Enums/TEXFILTER
function render.PushFilterMag(texFilterType) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Pushes (Adds) a texture filter onto the minification texture filter stack.
--- This will modify how textures are compressed to a lower resolution than their native resolution for upcoming rendering and drawing operations.
--- For a version of this same function that modifies filtering for texture sizes larger than their native resolution, see [render.PushFilterMag()](https://wiki.facepunch.com/gmod/render.PushFilterMag)
---
--- Always be sure to call [render.PopFilterMin()](https://wiki.facepunch.com/gmod/render.PopFilterMin) afterwards to avoid texture filtering problems.
---
--- For more detailed information and a usage example, see [the texture minification and magnification render reference.](https://wiki.facepunch.com/gmod/render_min_mag_filters)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PushFilterMin)
---@param texFilterType number The texture filter to use. For available options, see Enums/TEXFILTER
function render.PushFilterMin(texFilterType) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Enables the flashlight projection for the upcoming rendering.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PushFlashlightMode)
---@param enable? boolean Whether the flashlight mode should be enabled or disabled.
---@deprecated This will leave models lit under specific conditions. You should use render.RenderFlashlights which is meant as a direct replacement for this function.
function render.PushFlashlightMode(enable) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Pushes the current render target and viewport to the RT stack then sets a new current render target and viewport. If the viewport is not specified, the dimensions of the render target are used instead.
---
--- This is similar to a call to [render.SetRenderTarget](https://wiki.facepunch.com/gmod/render.SetRenderTarget) and [render.SetViewPort](https://wiki.facepunch.com/gmod/render.SetViewPort) where the current render target and viewport have been saved beforehand, except the viewport isn't clipped to screen bounds.
---
--- See also [render.PopRenderTarget](https://wiki.facepunch.com/gmod/render.PopRenderTarget).
---
--- **NOTE**: If you want to render to the render target in 2d mode and it is not the same size as the screen, use [cam.Start2D](https://wiki.facepunch.com/gmod/cam.Start2D) and [cam.End2D](https://wiki.facepunch.com/gmod/cam.End2D).
---
--- **NOTE**: If the render target is bigger than the screen, rendering done with the surface library will be clipped to the screen bounds unless you call [Global.DisableClipping](https://wiki.facepunch.com/gmod/Global.DisableClipping)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.PushRenderTarget)
---@param texture? ITexture The new render target to be used.
--- Can be set to `nil` to push the main game frame buffer.
---@param x? number X origin of the viewport.
---@param y? number Y origin of the viewport.
---@param w? number Width of the viewport.
---@param h? number Height of the viewport
function render.PushRenderTarget(texture, x, y, w, h) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Reads the color of the specified pixel from the RenderTarget sent by [render.CapturePixels](https://wiki.facepunch.com/gmod/render.CapturePixels)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ReadPixel)
---@param x number The x coordinate.
---@param y number The y coordinate.
---@return number # The red channel value.
---@return number # The green channel value.
---@return number # The blue channel value.
---@return number # The alpha channel value or no value if the render target has no alpha channel.
function render.ReadPixel(x, y) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) This applies the changes made to map lighting using [engine.LightStyle](https://wiki.facepunch.com/gmod/engine.LightStyle).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.RedownloadAllLightmaps)
---@param DoStaticProps? boolean When true, this will also apply lighting changes to static props. This is really slow on large maps.
---@param UpdateStaticLighting? boolean Forces all props to update their static lighting. Can be slow.
function render.RedownloadAllLightmaps(DoStaticProps, UpdateStaticLighting) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders additive flashlights on an [IMesh](https://wiki.facepunch.com/gmod/IMesh), a direct replacement for [render.PushFlashlightMode](https://wiki.facepunch.com/gmod/render.PushFlashlightMode).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.RenderFlashlights)
---@param renderFunc function The function that renders the IMesh, or a model.
function render.RenderFlashlights(renderFunc) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders the HUD on the screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.RenderHUD)
---@param x number X position for the HUD draw origin.
---@param y number Y position for the HUD draw origin.
---@param w number Width of the HUD draw.
---@param h number Height of the HUD draw.
function render.RenderHUD(x, y, w, h) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders the scene with the specified viewData to the current active render target.
---
--- Static props and LODs are rendered improperly due to incorrectly perceived distance.
--- Using render.RenderView on a RenderTarget texture in a 3d context like SWEP:PostDrawViewModel() while drawing the RenderTarget texture causes screen flickers
---
---[View wiki](https://wiki.facepunch.com/gmod/render.RenderView)
---@param view? table The view data to be used in the rendering. See Structures/ViewData. Any missing value is assumed to be that of the current view. Similarly, you can make a normal render by simply not passing this table at all.
function render.RenderView(view) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Resets the model lighting to the specified color.
---
--- Calls [render.SetModelLighting](https://wiki.facepunch.com/gmod/render.SetModelLighting) for every direction with given color.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ResetModelLighting)
---@param r number The red part of the color, 0-1
---@param g number The green part of the color, 0-1
---@param b number The blue part of the color, 0-1
function render.ResetModelLighting(r, g, b) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Resets the HDR tone multiplier to the specified value.
---
--- This will only work on HDR maps, and the value will automatically fade to what it was ( or whatever [render.SetGoalToneMappingScale](https://wiki.facepunch.com/gmod/render.SetGoalToneMappingScale) is ) if called only once.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.ResetToneMappingScale)
---@param scale number The value which should be used as multiplier.
function render.ResetToneMappingScale(scale) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the ambient lighting for any upcoming render operation.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetAmbientLight)
---@param r number The red part of the color, 0-1.
---@param g number The green part of the color, 0-1.
---@param b number The blue part of the color, 0-1.
function render.SetAmbientLight(r, g, b) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the alpha blending (or transparency) for upcoming render operations.
---
--- See [render.SetColorModulation](https://wiki.facepunch.com/gmod/render.SetColorModulation) for the function to affect RGB color channels.
---
--- By itself, this will cause visible overlapping on parts of a model that are in front of other parts of the same model.
--- For a solution to this, see the examples below.
---
--- This does not affect non-model `render.Draw*` functions.
--- **NOTE**: If a material has the [$alphatest](https://developer.valvesoftware.com/wiki/$alphatest) flag enabled then this function might not behave as expected because alpha will be binary, this has a default cutoff of `0.7`.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetBlend)
---@param blending number The alpha (transparency) for upcoming draw operations.
--- A value in the range `(0-1)` where `0` is fully transparent, `0.5` is 50% visible, and `1` is fully opaque.
function render.SetBlend(blending) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the current drawing material to "color".
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
---[View wiki](https://wiki.facepunch.com/gmod/render.SetColorMaterial)
function render.SetColorMaterial() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the current drawing material to `color_ignorez`.
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
---[View wiki](https://wiki.facepunch.com/gmod/render.SetColorMaterialIgnoreZ)
function render.SetColorMaterialIgnoreZ() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the color modulation for upcoming render operations, such as rendering models.
---
--- The values can exceed 1 for stronger effect.
---
--- See [render.SetBlend](https://wiki.facepunch.com/gmod/render.SetBlend) for the function to affect alpha channel.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetColorModulation)
---@param r number The red channel multiplier normal ranging from 0-1.
---@param g number The green channel multiplier normal ranging from 0-1.
---@param b number The blue channel multiplier normal ranging from 0-1.
function render.SetColorModulation(r, g, b) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) If the [fog mode](https://wiki.facepunch.com/gmod/render.FogMode) is set to [MATERIAL_FOG_LINEAR_BELOW_FOG_Z](https://wiki.facepunch.com/gmod/Enums/MATERIAL_FOG), the fog will only be rendered below the specified height.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetFogZ)
---@param fogZ number The fog Z.
function render.SetFogZ(fogZ) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the goal HDR tone mapping scale.
---
--- Use this in a rendering/think hook as it is reset every frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetGoalToneMappingScale)
---@param scale number The target scale.
function render.SetGoalToneMappingScale(scale) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets lighting mode when rendering something.
---
--- **NOTE**: **Do not forget to restore the default value** to avoid unexpected behavior, like the world and the HUD/UI being affected
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetLightingMode)
---@param Mode number Lighting render mode
---
--- Possible values are:
--- * 0 - Default
--- * 1 - Total fullbright, similar to `mat_fullbright 1` but excluding some weapon view models
--- * 2 - Increased brightness(?), models look fullbright
function render.SetLightingMode(Mode) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets lighting origin for the current model.
---
--- This does not work for prop_physics.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetLightingOrigin)
---@param lightingOrigin Vector The position which will be used to calculate lighting for the current model.
function render.SetLightingOrigin(lightingOrigin) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the texture to be used as the lightmap in upcoming rendering operations. This is required when rendering meshes using a material with a lightmapped shader such as LightmappedGeneric.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetLightmapTexture)
---@param tex ITexture The texture to be used as the lightmap.
function render.SetLightmapTexture(tex) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets up the local lighting for any upcoming render operation. Up to 4 local lights can be defined, with one of three different types (point, directional, spot).
---
--- Disables all local lights if called with no arguments.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetLocalModelLights)
---@param lights? table A table containing up to 4 tables for each light source that should be set up. Each of these tables should contain the properties of its associated light source, see Structures/LocalLight.
function render.SetLocalModelLights(lights) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the material to be used in any upcoming render operation using the [render](https://wiki.facepunch.com/gmod/render).
---
--- Not to be confused with [surface.SetMaterial](https://wiki.facepunch.com/gmod/surface.SetMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetMaterial)
---@param mat IMaterial The material to be used.
function render.SetMaterial(mat) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets up the ambient lighting for any upcoming render operation. Ambient lighting can be seen as a cube enclosing the object to be drawn, each of its faces representing a directional light source that shines towards the object. Thus, there is a total of six different light sources that can be configured separately.
---
--- Light color components are not restricted to a specific range (i.e. 0-255), instead, higher values will result in a brighter light.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetModelLighting)
---@param lightDirection BOX The light source to edit, see Enums/BOX.
---@param red number The red component of the light color.
---@param green number The green component of the light color.
---@param blue number The blue component of the light color.
function render.SetModelLighting(lightDirection, red, green, blue) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the render target to the specified rt.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetRenderTarget)
---@param texture ITexture The new render target to be used.
function render.SetRenderTarget(texture) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the render target with the specified index to the specified rt.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetRenderTargetEx)
---@param rtIndex number The index of the rt to set.
---@param texture ITexture The new render target to be used.
function render.SetRenderTargetEx(rtIndex, texture) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets a scissoring rectangle which limits the drawing area. (otherwise known as clipping)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetScissorRect)
---@param startX number X start coordinate of the scissor rectangle in screen-space coordinates.
---@param startY number Y start coordinate of the scissor rectangle in screen-space coordinates.
---@param endX number X end coordinate of the scissor rectangle in screen-space coordinates.
---@param endY number Y end coordinate of the scissor rectangle in screen-space coordinates.
---@param enable boolean Enable or disable the scissor rect.
function render.SetScissorRect(startX, startY, endX, endY, enable) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the shadow color.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetShadowColor)
---@param red number The red channel of the shadow color.
---@param green number The green channel of the shadow color.
---@param blue number The blue channel of the shadow color.
function render.SetShadowColor(red, green, blue) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the shadow projection direction.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetShadowDirection)
---@param shadowDirections Vector The new shadow direction.
function render.SetShadowDirection(shadowDirections) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the maximum shadow projection range.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetShadowDistance)
---@param shadowDistance number The new maximum shadow distance.
function render.SetShadowDistance(shadowDistance) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets whether any future render operations will ignore shadow drawing.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetShadowsDisabled)
---@param newState boolean
function render.SetShadowsDisabled(newState) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the Compare Function that all pixels affected by a draw operation will have their Stencil Buffer value tested against.
---
--- When not set to a static value like NEVER or ALWAYS, the Stencil Buffer value corresponding to each affected pixel will be compared against the current [Reference Value](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue).
---
--- Pixels that **Pass** the Compare Function check move on to the Depth Test, which determines if the draw operation will ultimately be allowed to overwrite the pixel's Color Channel, Stencil Buffer, and Depth Buffer values.
---
--- Pixels that **Fail** the Compare Function check have the [Fail Operation](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation) performed on their Stencil Buffer value and do **not** have any of their Render Target layers modified by the draw operation.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction)
---@param compareFunction STENCILCOMPARISONFUNCTION The Compare Function that each affected pixel's Stencil Buffer value will be evaluated against during a draw operation.
function render.SetStencilCompareFunction(compareFunction) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Enables or disables the Stencil system for future draw operations.
---
--- While enabled, all pixels affected by draw operations will have their corresponding values in the active [Render Target's](https://wiki.facepunch.com/gmod/render_rendertargets) Stencil Buffer compared against the current [Reference Value](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue) and their current Depth Buffer value compared against the depth of the corresponding pixel from the draw operation.
--- Depending on the outcomes of these comparisons, one of either the [Pass](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation), [Fail](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation), or [Z-Fail](https://wiki.facepunch.com/gmod/render.SetStencilZFailOperation) operations is performed on the pixel's Stencil Buffer value.
--- A pixel will only be updated in the active [Render Target](https://wiki.facepunch.com/gmod/render_rendertargets) if the [Pass Operation](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation) is performed.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
--- **NOTE**: The Stencil system's configuration does **not** reset automatically.
--- To prevent unexpected behavior, always manually ensure that the Stencil system is configured appropriately for your use-case after enabling it.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilEnable)
---@param newState boolean The new state.
function render.SetStencilEnable(newState) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the [Stencil Operation](https://wiki.facepunch.com/gmod/Enums/STENCILOPERATION) that will be performed on the Stencil Buffer values of pixels affected by draw operations if the [Compare Function](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction) did **not** [Pass](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation) the pixel.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation)
---@param failOperation STENCILOPERATION The Stencil Operation to be performed if the Compare Function does not Pass a pixel.
function render.SetStencilFailOperation(failOperation) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the [Stencil Operation](https://wiki.facepunch.com/gmod/Enums/STENCILOPERATION) that will be performed on the Stencil Buffer values of pixels affected by draw operations if the [Compare Function](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction) Passes the pixel.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation)
---@param passOperation STENCILOPERATION The Stencil Operation to be performed if the Compare Function Passes a pixel.
function render.SetStencilPassOperation(passOperation) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the Stencil system's Reference Value which is compared against each pixel's corresponding Stencil Buffer value in the [Compare Function](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction) and can be used to modify the Stencil Buffer value of those same pixels in the [Pass](https://wiki.facepunch.com/gmod/render.SetStencilPassOperation), [Fail](https://wiki.facepunch.com/gmod/render.SetStencilFailOperation), and [Z Fail](https://wiki.facepunch.com/gmod/render.SetStencilZFailOperation) operations.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilReferenceValue)
---@param referenceValue number The value that the Compare function and the pass, fail, and z-fail operations will use.
--- This is an 8-bit (`byte`) unsigned integer value in the range [`0-255`]
function render.SetStencilReferenceValue(referenceValue) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the unsigned 8-bit (`byte`) bitflag mask that will be bitwise ANDed with all values as they are read (tested) from the Stencil Buffer
---
--- This can be considered a "niche" Stencil function as it is not required for many Stencil use-cases.
---
--- This is a companion function to [render.SetStencilWriteMask](https://wiki.facepunch.com/gmod/render.SetStencilWriteMask) which modifies Stencil Buffer values as they are written.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilTestMask)
---@param bitMask number The 8-bit (`byte`) mask
--- Set to `255` to make no change to read Stencil Buffer values.
function render.SetStencilTestMask(bitMask) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the unsigned 8-bit (`byte`) bitflag mask that will be bitwise ANDed with all values as they are written to the Stencil Buffer
---
--- This can be considered a "niche" Stencil function as it is not required for many Stencil use-cases.
---
--- This is a companion function to [render.SetStencilTestMask](https://wiki.facepunch.com/gmod/render.SetStencilTestMask) which modifies Stencil Buffer values as they are read.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilWriteMask)
---@param bitMask number The 8-bit (`byte`) mask
--- Set to `255` to make no change to written Stencil Buffer values.
function render.SetStencilWriteMask(bitMask) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the [Stencil Operation](https://wiki.facepunch.com/gmod/Enums/STENCILOPERATION) that will be performed on the Stencil Buffer values of pixels affected by draw operations if the [Compare Function](https://wiki.facepunch.com/gmod/render.SetStencilCompareFunction) Passed a given pixel, but it did **not** Pass the Depth Test.
---
--- For more detailed information on the Stencil system, including usage examples, see the [Stencils Render Reference](https://wiki.facepunch.com/gmod/render_stencils) page
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetStencilZFailOperation)
---@param zFailOperation STENCILOPERATION The Stencil Operation to be performed if the Compare Function Passes a pixel, but the pixel fails the Depth Test.
function render.SetStencilZFailOperation(zFailOperation) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the tone mapping scale for upcoming rendering operations.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetToneMappingScaleLinear)
---@param scales Vector The tonemapping scales.
--- * X - Output scale
--- * Y - Lightmap scale
--- * Z - Reflection map scale
function render.SetToneMappingScaleLinear(scales) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Changes the view port position and size. The values will be clamped to the game's screen resolution.
---
--- If you are looking to render something to a texture (render target), you should use [render.PushRenderTarget](https://wiki.facepunch.com/gmod/render.PushRenderTarget).
---
--- **NOTE**: This function will override values of [Global.ScrW](https://wiki.facepunch.com/gmod/Global.ScrW) and [Global.ScrH](https://wiki.facepunch.com/gmod/Global.ScrH) with the ones you set.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetViewPort)
---@param x number X origin of the view port.
---@param y number Y origin of the view port.
---@param w number Width of the view port.
---@param h number Height of the view port.
function render.SetViewPort(x, y, w, h) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the internal parameter **INT_RENDERPARM_WRITE_DEPTH_TO_DESTALPHA**
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SetWriteDepthToDestAlpha)
---@param enable boolean
function render.SetWriteDepthToDestAlpha(enable) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Swaps the frame buffers/cycles the frame. In other words, this updates the screen.
---
--- If you take a really long time during a single frame render, it is a good idea to use this and let the user know that the game isn't stuck.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.Spin)
function render.Spin() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Begin drawing a multi-segment Beam.
---
--- 		For more detailed information on Beams, as well as usage examples, see the [Beams Render Reference](https://wiki.facepunch.com/gmod/render_beams)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.StartBeam)
---@param segmentCount number The number of Beam Segments that this multi-segment Beam will contain
function render.StartBeam(segmentCount) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the player's hardware supports HDR. (High Dynamic Range) HDR can still be disabled by the `mat_hdr_level` console variable or just not be supported by the map.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SupportsHDR)
---@return boolean # `true` if the player's hardware supports HDR.
function render.SupportsHDR() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns if the current settings and the system allow the usage of pixel shaders 1.4.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SupportsPixelShaders_1_4)
---@return boolean # Whether Pixel Shaders 1.4 are supported or not.
function render.SupportsPixelShaders_1_4() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns if the current settings and the system allow the usage of pixel shaders 2.0.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SupportsPixelShaders_2_0)
---@return boolean # Whether Pixel Shaders 2.0 are supported or not.
function render.SupportsPixelShaders_2_0() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns if the current settings and the system allow the usage of vertex shaders 2.0.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SupportsVertexShaders_2_0)
---@return boolean # Whether Vertex Shaders 2.0 are supported or not.
function render.SupportsVertexShaders_2_0() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Suppresses or enables any engine lighting for any upcoming render operation.
---
--- This does not affect [IMesh](https://wiki.facepunch.com/gmod/IMesh)es.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.SuppressEngineLighting)
---@param suppressLighting boolean True to suppress false to enable.
function render.SuppressEngineLighting(suppressLighting) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Enables HDR tone mapping which influences the brightness.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.TurnOnToneMapping)
function render.TurnOnToneMapping() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Updates the texture returned by [render.GetFullScreenDepthTexture](https://wiki.facepunch.com/gmod/render.GetFullScreenDepthTexture).
---
--- Silently fails if [render.SupportsPixelShaders_2_0](https://wiki.facepunch.com/gmod/render.SupportsPixelShaders_2_0) returns false.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.UpdateFullScreenDepthTexture)
function render.UpdateFullScreenDepthTexture() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Updates the power of two texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.UpdatePowerOfTwoTexture)
---@return ITexture # The render.GetPowerOfTwoTexture.
function render.UpdatePowerOfTwoTexture() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Pretty much alias of [render.UpdatePowerOfTwoTexture](https://wiki.facepunch.com/gmod/render.UpdatePowerOfTwoTexture) but does not return the texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.UpdateRefractTexture)
function render.UpdateRefractTexture() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Copies the entire screen to the screen effect texture, which can be acquired via [render.GetScreenEffectTexture](https://wiki.facepunch.com/gmod/render.GetScreenEffectTexture). This function is mainly intended to be used in [GM:RenderScreenspaceEffects](https://wiki.facepunch.com/gmod/GM:RenderScreenspaceEffects)
---
---[View wiki](https://wiki.facepunch.com/gmod/render.UpdateScreenEffectTexture)
---@param textureIndex? number Texture index to update. Max index is 3, but engine only creates the first two for you.
function render.UpdateScreenEffectTexture(textureIndex) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) This function overrides all map materials for one frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/render.WorldMaterialOverride)
---@param mat? IMaterial
function render.WorldMaterialOverride(mat) end
