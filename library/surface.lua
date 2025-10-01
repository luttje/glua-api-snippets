---@meta

--- The surface library allows you to draw text and shapes on the screen. Primarily used for making HUDs & custom GUI panels.
surface = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a new font.
---
--- To prevent the font from displaying incorrectly when using the `outline` setting, set `antialias` to false. This will ensure the text properly fills out the entire outline.
---
--- Be sure to check the [List of Default Fonts](https://wiki.facepunch.com/gmod/Default_Fonts) first! Those fonts can be used without using this function.
---
--- See Also: [Finding the Font Name](https://wiki.facepunch.com/gmod/Finding_the_Font_Name).
---
--- **WARNING**: Due to the static nature of fonts, do **NOT** create the font more than once. You should only be creating them once, it is recommended to create them at the top of your script. Do not use this function within [GM:HUDPaint](https://wiki.facepunch.com/gmod/GM:HUDPaint) or any other hook!
---
--- Define fonts that you will actually use, as fonts are very taxing on performance and will cause crashes! Do not create fonts for every size.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.CreateFont)
---@param fontName string The new font name.
---@param fontData FontData The font properties. See the Structures/FontData.
function surface.CreateFont(fontName, fontData) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Enables or disables the clipping used by the VGUI that limits the drawing operations to a panels bounds.
---
--- Identical to [Global.DisableClipping](https://wiki.facepunch.com/gmod/Global.DisableClipping). See also [Panel:NoClipping](https://wiki.facepunch.com/gmod/Panel:NoClipping).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DisableClipping)
---@param disable boolean True to disable, false to enable the clipping
---@return boolean # Whether the clipping was enabled or not before this function call
---@deprecated Alias of Global.DisableClipping so use that instead.
function surface.DisableClipping(disable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a hollow circle, made of lines. For a filled circle, see examples for [surface.DrawPoly](https://wiki.facepunch.com/gmod/surface.DrawPoly).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawCircle)
---@param originX number The center x integer coordinate.
---@param originY number The center y integer coordinate.
---@param radius number The radius of the circle.
---@param r number The red value of the color to draw the circle with, or a Color.
---@param g number The green value of the color to draw the circle with. Unused if a Color was given.
---@param b number The blue value of the color to draw the circle with. Unused if a Color was given.
---@param a? number The alpha value of the color to draw the circle with. Unused if a Color was given.
function surface.DrawCircle(originX, originY, radius, r, g, b, a) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a line from one point to another.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawLine)
---@param startX number The start x float coordinate.
---@param startY number The start y float coordinate.
---@param endX number The end x float coordinate.
---@param endY number The end y float coordinate.
function surface.DrawLine(startX, startY, endX, endY) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a hollow box with a given border width.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawOutlinedRect)
---@param x number The start x integer coordinate.
---@param y number The start y integer coordinate.
---@param w number The integer width.
---@param h number The integer height.
---@param thickness? number The thickness of the outlined box border.
function surface.DrawOutlinedRect(x, y, w, h, thickness) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a textured polygon (secretly a triangle fan) with a maximum of 4096 vertices.
--- Only works properly with convex polygons. You may try to render concave polygons, but there is no guarantee that things wont get messed up.
---
--- Unlike most surface library functions, non-integer coordinates are not rounded.
---
--- **WARNING**: You must reset the drawing color and texture before calling the function to ensure consistent results. See examples below.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawPoly)
---@param vertices table A table containing integer vertices. See the Structures/PolygonVertex.
---
--- **The vertices must be in clockwise order.**
function surface.DrawPoly(vertices) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a solid rectangle on the screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawRect)
---@param x number The X integer co-ordinate.
---@param y number The Y integer co-ordinate.
---@param width number The integer width of the rectangle.
---@param height number The integer height of the rectangle.
function surface.DrawRect(x, y, width, height) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draw the specified text on the screen, using the previously set [position](https://wiki.facepunch.com/gmod/surface.SetTextPos), [font](https://wiki.facepunch.com/gmod/surface.SetFont) and [color](https://wiki.facepunch.com/gmod/surface.SetTextColor). This function does **not** handle newlines.
---
--- This function moves the [text position](https://wiki.facepunch.com/gmod/surface.SetTextPos) by the length of the drawn text - this can be used to change text properties (such as font or color) without having to manually recalculate the text position. See example #2 for example use of this behavior.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawText)
---@param text string The text to be rendered.
---@param forceAdditive? boolean `true` to force text to render additive, `false` to force not additive, `nil` to use font's value.
---
--- When additive rendering is enabled, the rendered text pixels will be added to the existing screen pixels, rather than replacing them outright. This means black text will be invisible, and drawing on a pure white background will be impossible.
function surface.DrawText(text, forceAdditive) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draw a textured rectangle with the given position and dimensions on the screen, using the current active texture set with [surface.SetMaterial](https://wiki.facepunch.com/gmod/surface.SetMaterial). It is also affected by [surface.SetDrawColor](https://wiki.facepunch.com/gmod/surface.SetDrawColor).
---
--- See also [render.SetMaterial](https://wiki.facepunch.com/gmod/render.SetMaterial) and [render.DrawScreenQuadEx](https://wiki.facepunch.com/gmod/render.DrawScreenQuadEx).
--- See also [surface.DrawTexturedRectUV](https://wiki.facepunch.com/gmod/surface.DrawTexturedRectUV) and [surface.DrawTexturedRectRotated](https://wiki.facepunch.com/gmod/surface.DrawTexturedRectRotated).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawTexturedRect)
---@param x number The X integer co-ordinate.
---@param y number The Y integer co-ordinate.
---@param width number The integer width of the rectangle.
---@param height number The integer height of the rectangle.
function surface.DrawTexturedRect(x, y, width, height) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draw a textured rotated rectangle with the given position and dimensions and angle on the screen, using the current active texture.
---
--- See also [surface.DrawTexturedRectUV](https://wiki.facepunch.com/gmod/surface.DrawTexturedRectUV) and [surface.DrawTexturedRect](https://wiki.facepunch.com/gmod/surface.DrawTexturedRect).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawTexturedRectRotated)
---@param x number The X integer co-ordinate, representing the center of the rectangle.
---@param y number The Y integer co-ordinate, representing the center of the rectangle.
---@param width number The integer width of the rectangle.
---@param height number The integer height of the rectangle.
---@param rotation number The rotation of the rectangle, in degrees.
function surface.DrawTexturedRectRotated(x, y, width, height, rotation) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a textured rectangle with a repeated or partial texture.
---
--- `u` and `v` refer to texture coordinates.
--- * (u, v) = (0, 0) is the top left
--- * (u, v) = (1, 0) is the top right
--- * (u, v) = (1, 1) is the bottom right
--- * (u, v) = (0, 1) is the bottom left
---
--- Using a start point of (1, 0) and an end point to (0, 1), you can draw an image flipped horizontally, same goes with other directions. Going above 1 will tile the texture. Negative values are allowed as well.
---
--- Here's a helper image:
---
--- See also [surface.DrawTexturedRect](https://wiki.facepunch.com/gmod/surface.DrawTexturedRect) and [surface.DrawTexturedRectRotated](https://wiki.facepunch.com/gmod/surface.DrawTexturedRectRotated).
---
--- **NOTE**: If you are using a .png image, you need supply the "noclamp" flag as second parameter for [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) if you intend to use tiling.
---
--- **NOTE**: If you find that `surface.DrawTexturedRectUV` is getting your texture coordinates (u0, v0), (u1, v1) wrong and you're rendering with a material created with [Global.CreateMaterial](https://wiki.facepunch.com/gmod/Global.CreateMaterial), try adjusting them with the following code:
---
--- ```
--- local du = 0.5 / 32 -- half pixel anticorrection
--- local dv = 0.5 / 32 -- half pixel anticorrection
--- local u0, v0 = (u0 - du) / (1 - 2 * du), (v0 - dv) / (1 - 2 * dv)
--- local u1, v1 = (u1 - du) / (1 - 2 * du), (v1 - dv) / (1 - 2 * dv)
--- ```
---
--- **Explanation:**
--- `surface.DrawTexturedRectUV` tries to correct the texture coordinates by half a pixel (something to do with sampling) and computes the correction using `IMaterial::GetMappingWidth()`/`GetMappingHeight()`. If the material was created without a `$basetexture`, then `GetMappingWidth()`/`GetMappingHeight()` uses the width and height of the error material (which is 32x32).
---
--- The UV offsets might require (sub-)pixel correction for accurate tiling results.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.DrawTexturedRectUV)
---@param x number The X integer coordinate.
---@param y number The Y integer coordinate.
---@param width number The integer width of the rectangle.
---@param height number The integer height of the rectangle.
---@param startU number The U texture mapping of the rectangle origin.
---@param startV number The V texture mapping of the rectangle origin.
---@param endU number The U texture mapping of the rectangle end.
---@param endV number The V texture mapping of the rectangle end.
function surface.DrawTexturedRectUV(x, y, width, height, startU, startV, endU, endV) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the current alpha multiplier affecting drawing operations. This is set by [surface.SetAlphaMultiplier](https://wiki.facepunch.com/gmod/surface.SetAlphaMultiplier) or by the game engine in certain other cases.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetAlphaMultiplier)
---@return number # The multiplier ranging from 0 to 1.
function surface.GetAlphaMultiplier() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the current color affecting draw operations.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetDrawColor)
---@return table # The color that drawing operations will use as a Color.
function surface.GetDrawColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the [HUD icon](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/scripts/hud_textures.txt) TextureID of a texture with the specified name.
---
--- You probably want to use [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) and [surface.SetMaterial](https://wiki.facepunch.com/gmod/surface.SetMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetHUDTexture)
---@param name string The name of the texture.
---@return number # The texture ID, for use with surface.SetTexture.
function surface.GetHUDTexture(name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Retrieves the position and [ScissorRect](https://wiki.facepunch.com/gmod/render.SetScissorRect) information for the [Panel](https://wiki.facepunch.com/gmod/Panel) that is currently being drawn.
---
--- When using the [surface](https://wiki.facepunch.com/gmod/surface) library (and, by extension, the [draw](https://wiki.facepunch.com/gmod/draw) library) inside of the [PANEL:Paint](https://wiki.facepunch.com/gmod/PANEL:Paint) function, the origin (The on-screen position of `(0,0)`) is automatically shifted to the top-left corner of the panel to make it easier to draw the panel's contents.  Additionally, [render.SetScissorRect](https://wiki.facepunch.com/gmod/render.SetScissorRect) is used to clip (or "mask") all drawn content to within the boundaries of the panel.  This function returns the information used by the [surface](https://wiki.facepunch.com/gmod/surface) library about the current panel's origin and [ScissorRect](https://wiki.facepunch.com/gmod/render.SetScissorRect).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetPanelPaintState)
---@return table # A table containing the position and render.SetScissorRect boundaries for the Panel currently being drawn.
---
--- For the table's format and available options see the Structures/PanelPaintState page.
function surface.GetPanelPaintState() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the current color affecting text draw operations.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetTextColor)
---@return table # The color that text drawing operations will use as a Color.
function surface.GetTextColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the X and Y co-ordinate that has been set with [surface.SetTextPos](https://wiki.facepunch.com/gmod/surface.SetTextPos) or changed by [surface.DrawText](https://wiki.facepunch.com/gmod/surface.DrawText).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetTextPos)
---@return number # The X integer co-ordinate.
---@return number # The Y integer co-ordinate.
function surface.GetTextPos() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the width and height (in pixels) of the given text with the font that has been set with [surface.SetFont](https://wiki.facepunch.com/gmod/surface.SetFont).
---
--- Does not take into account new lines, the returned height is for the entire font (as specified by the font), not maximum of individual characters.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetTextSize)
---@param text string The string to check the size of.
---@return number # Width of the provided text.
---@return number # Height of the provided text.
function surface.GetTextSize(text) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the texture id of the material with the given name/path, for use with [surface.SetTexture](https://wiki.facepunch.com/gmod/surface.SetTexture).
---
--- Opposite version of this function is [surface.GetTextureNameByID](https://wiki.facepunch.com/gmod/surface.GetTextureNameByID).
---
--- **NOTE**: This function will not work with .png or .jpg images. For that, see [Global.Material](https://wiki.facepunch.com/gmod/Global.Material). You will probably want to use it regardless.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetTextureID)
---@param nameOrPath string Name or path of the texture. The path must be to a `.vmt` file (a material), not to `.vtf` (a texture)!
---@return number # The texture ID
function surface.GetTextureID(nameOrPath) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns name/path of texture by ID. Opposite version of this function is [surface.GetTextureID](https://wiki.facepunch.com/gmod/surface.GetTextureID).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetTextureNameByID)
---@param id number ID of texture.
---@return string # Returns name/path of texture.
function surface.GetTextureNameByID(id) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the size of the texture with the associated texture ID.
---
--- For `.png/.jpg` textures loaded with [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) you can use the `$realheight` and `$realwidth` material parameters ([IMaterial:GetInt](https://wiki.facepunch.com/gmod/IMaterial:GetInt)) to get the size of the image.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.GetTextureSize)
---@param textureID number The texture ID, returned by surface.GetTextureID.
---@return number # The texture width.
---@return number # The texture height.
function surface.GetTextureSize(textureID) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Play a sound file directly on the client (such as UI sounds, etc).
---
--- **NOTE**: Valid sample rates: **11025 Hz, 22050 Hz and 44100 Hz**, otherwise you may see this kind of message:
---
--- `Unsupported 32-bit wave file your_sound.wav` and
--- `Invalid sample rate (48000) for sound 'your_sound.wav'`
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.PlaySound)
---@param soundfile string The path to the sound file.
---
--- This should either be a sound script name (sound.Add) or a file path relative to the `sound/` folder. (Make note that it's not sound**s**)
function surface.PlaySound(soundfile) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the height of the current client's screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.ScreenHeight)
---@return number # screenHeight
---@deprecated You should use Global.ScrH instead.
function surface.ScreenHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the width of the current client's screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.ScreenWidth)
---@return number # screenWidth
---@deprecated You should use Global.ScrW instead.
function surface.ScreenWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the alpha multiplier that will influence all upcoming drawing operations.
--- See also [render.SetBlend](https://wiki.facepunch.com/gmod/render.SetBlend).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetAlphaMultiplier)
---@param multiplier number The multiplier ranging from 0 to 1.
function surface.SetAlphaMultiplier(multiplier) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set the color of any future shapes to be drawn, can be set by either using R, G, B, A as separate values or by a [Color](https://wiki.facepunch.com/gmod/Color).
---
--- **NOTE**: The alpha value may not work properly if you're using a material without `$vertexalpha`.
---
--- **NOTE**: Due to post processing and gamma correction the color you set with this function may appear differently when rendered. This problem does not occur on materials drawn with [surface.DrawTexturedRect](https://wiki.facepunch.com/gmod/surface.DrawTexturedRect).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetDrawColor)
---@param r number The red value of color.
---@param g number The green value of color.
---@param b number The blue value of color.
---@param a? number The alpha value of color.
function surface.SetDrawColor(r, g, b, a) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set the color of any future shapes to be drawn, can be set by either using R, G, B, A as separate values or by a [Color](https://wiki.facepunch.com/gmod/Color).
---
--- **NOTE**: The alpha value may not work properly if you're using a material without `$vertexalpha`.
---
--- **NOTE**: Due to post processing and gamma correction the color you set with this function may appear differently when rendered. This problem does not occur on materials drawn with [surface.DrawTexturedRect](https://wiki.facepunch.com/gmod/surface.DrawTexturedRect).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetDrawColor)
---@param color table A Color object/table to read the color from. This is slower than providing four numbers. You could use Color:Unpack to address this. You should also cache your color objects if you wish to use them, for performance reasons.
function surface.SetDrawColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set the current font to be used for text operations later.
---
--- The fonts must first be created with [surface.CreateFont](https://wiki.facepunch.com/gmod/surface.CreateFont) or be one of the [Default Fonts](https://wiki.facepunch.com/gmod/Default_Fonts).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetFont)
---@param fontName string The name of the font to use.
function surface.SetFont(fontName) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the material to be used in all upcoming draw operations using the surface library.
---
--- Not to be confused with [render.SetMaterial](https://wiki.facepunch.com/gmod/render.SetMaterial).
---
--- If you need to unset the texture, use the [draw.NoTexture](https://wiki.facepunch.com/gmod/draw.NoTexture) convenience function.
---
--- **WARNING**: [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) function calls are expensive to be done inside this function or inside rendering context, you should be caching the results of [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) calls
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetMaterial)
---@param material IMaterial The material to be used.
---
--- When using [render.PushRenderTarget](https://wiki.facepunch.com/gmod/render.PushRenderTarget) or [render.SetRenderTarget](https://wiki.facepunch.com/gmod/render.SetRenderTarget), the material should have the `$ignorez` flag set to make it visible. If the material is not used in 3D rendering, it is probably safe to add it with this code:
--- ```lua
--- material:SetInt( "$flags", bit.bor( material:GetInt( "$flags" ), 32768 ) )
--- ```
---
--- If using [Global.Material](https://wiki.facepunch.com/gmod/Global.Material), simply use the `ignorez` parameter.
function surface.SetMaterial(material) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set the color of any future text to be drawn, can be set by either using R, G, B, A as separate numbers or by providing a [Color](https://wiki.facepunch.com/gmod/Color).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetTextColor)
---@param r number The red value of color.
---@param g number The green value of color
---@param b number The blue value of color
---@param a? number The alpha value of color
function surface.SetTextColor(r, g, b, a) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set the color of any future text to be drawn, can be set by either using R, G, B, A as separate numbers or by providing a [Color](https://wiki.facepunch.com/gmod/Color).
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetTextColor)
---@param color table A Color object/table to read the color from. This is slower than providing four numbers. You could use Color:Unpack to address this. You should also cache your color objects if you wish to use them, for performance reasons.
function surface.SetTextColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Set the top-left position to draw any future text at.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetTextPos)
---@param x number The X integer co-ordinate.
---@param y number The Y integer co-ordinate.
function surface.SetTextPos(x, y) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the texture to be used in all upcoming draw operations using the surface library.
---
--- This is a legacy method, and should probably not be used, see [surface.SetMaterial](https://wiki.facepunch.com/gmod/surface.SetMaterial) and [IMaterial](https://wiki.facepunch.com/gmod/IMaterial) for a better alternative.
---
---[View wiki](https://wiki.facepunch.com/gmod/surface.SetTexture)
---@param textureID number The ID of the texture to draw with returned by surface.GetTextureID.
function surface.SetTexture(textureID) end
