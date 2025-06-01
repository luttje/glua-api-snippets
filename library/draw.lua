---@meta

--- The draw library's purpose is to simplify the usage of the [surface](https://wiki.facepunch.com/gmod/surface) library.
draw = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simple draw text at position, but this will expand newlines and tabs.
---
--- See also [MarkupObject](https://wiki.facepunch.com/gmod/MarkupObject) for limited width and markup support.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.DrawText)
---@param text string Text to be drawn.
---@param font? string Name of font to draw the text in. See surface.CreateFont to create your own, or Default Fonts for a list of default fonts.
---@param x? number The X Coordinate.
---@param y? number The Y Coordinate.
---@param color? table Color to draw the text in. Uses the Color.
---@param xAlign? number Where to align the text horizontally. Uses the Enums/TEXT_ALIGN.
function draw.DrawText(text, font, x, y, color, xAlign) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the height of the specified font in pixels. This is equivalent to the height of the character `W`. See [surface.GetTextSize](https://wiki.facepunch.com/gmod/surface.GetTextSize).
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.GetFontHeight)
---@param font string Name of the font to get the height of.
---@return number # The font height
function draw.GetFontHeight(font) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets drawing texture to a default white texture (vgui/white) via [surface.SetMaterial](https://wiki.facepunch.com/gmod/surface.SetMaterial). Useful for resetting the drawing texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.NoTexture)
function draw.NoTexture() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a rounded rectangle.
---
--- **NOTE**: This function actually draws rectangles with 'gui/cornerX' textures applied to it's rounded corners. It means that this function will fail (or will be drawn not as expected) with any vertex operations, such as model matrices like [cam.Start3D2D](https://wiki.facepunch.com/gmod/cam.Start3D2D) (corners would be pixelated) or stencil operations. Consider using [surface.DrawPoly](https://wiki.facepunch.com/gmod/surface.DrawPoly) or [mesh](https://wiki.facepunch.com/gmod/mesh) library
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.RoundedBox)
---@param cornerRadius number Radius of the rounded corners, works best with a multiple of 2.
---
--- For values 0 or below, surface.DrawRect will be used instead for performance.
---@param x number The x coordinate of the top left of the rectangle.
---@param y number The y coordinate of the top left of the rectangle.
---@param width number The width of the rectangle.
---@param height number The height of the rectangle.
---@param color table The color to fill the rectangle with. Uses the Color.
function draw.RoundedBox(cornerRadius, x, y, width, height, color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a rounded rectangle. This function also lets you specify which corners are drawn rounded.
---
--- **NOTE**: This function actually draws rectangles with 'gui/cornerX' textures applied to it's rounded corners. It means that this function will fail (or will be drawn not as expected) with any vertex operations, such as model matrices like [cam.Start3D2D](https://wiki.facepunch.com/gmod/cam.Start3D2D) (corners would be pixelated) or stencil operations. Consider using [surface.DrawPoly](https://wiki.facepunch.com/gmod/surface.DrawPoly) or [mesh](https://wiki.facepunch.com/gmod/mesh) library
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.RoundedBoxEx)
---@param cornerRadius number Radius of the rounded corners, works best with a power of 2 number.
---@param x number The x coordinate of the top left of the rectangle.
---@param y number The y coordinate of the top left of the rectangle.
---@param width number The width of the rectangle.
---@param height number The height of the rectangle.
---@param color table The color to fill the rectangle with. Uses the Color.
---@param roundTopLeft? boolean Whether the top left corner should be rounded.
---@param roundTopRight? boolean Whether the top right corner should be rounded.
---@param roundBottomLeft? boolean Whether the bottom left corner should be rounded.
---@param roundBottomRight? boolean Whether the bottom right corner should be rounded.
function draw.RoundedBoxEx(
	cornerRadius,
	x,
	y,
	width,
	height,
	color,
	roundTopLeft,
	roundTopRight,
	roundBottomLeft,
	roundBottomRight
)
end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws text on the screen.
--- **NOTE**: This function does not handle newlines properly. See [draw.DrawText](https://wiki.facepunch.com/gmod/draw.DrawText) for a function that does.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.SimpleText)
---@param text string The text to be drawn.
---@param font? string The font. See surface.CreateFont to create your own, or see Default Fonts for a list of default fonts.
---@param x? number The X Coordinate.
---@param y? number The Y Coordinate.
---@param color? table The color of the text. Uses the Color.
---@param xAlign? number The alignment of the X coordinate using Enums/TEXT_ALIGN.
---@param yAlign? number The alignment of the Y coordinate using Enums/TEXT_ALIGN.
---@return number # The width of the text. Same value as if you were calling surface.GetTextSize.
---@return number # The height of the text. Same value as if you were calling surface.GetTextSize.
function draw.SimpleText(text, font, x, y, color, xAlign, yAlign) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a simple line of text that is outlined.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.SimpleTextOutlined)
---@param Text string The text to draw.
---@param font? string The font name to draw with. See surface.CreateFont to create your own, or Default_Fonts for a list of default fonts.
---@param x? number The X Coordinate.
---@param y? number The Y Coordinate.
---@param color? table The color of the text. Uses the Color.
---@param xAlign? number The alignment of the X Coordinate using Enums/TEXT_ALIGN.
---@param yAlign? number The alignment of the Y Coordinate using Enums/TEXT_ALIGN.
---@param outlinewidth number Width of the outline.
---@param outlinecolor? table Color of the outline. Uses the Color.
---@return number # The width of the text. Same value as if you were calling surface.GetTextSize.
---@return number # The height of the text. Same value as if you were calling surface.GetTextSize.
function draw.SimpleTextOutlined(Text, font, x, y, color, xAlign, yAlign, outlinewidth, outlinecolor) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Works like [draw.SimpleText](https://wiki.facepunch.com/gmod/draw.SimpleText) but uses a table structure instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.Text)
---@param textdata table The text properties. See the Structures/TextData
---@return number # Width of drawn text
---@return number # Height of drawn text
function draw.Text(textdata) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Works like [draw.Text](https://wiki.facepunch.com/gmod/draw.Text), but draws the text with a shadow.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.TextShadow)
---@param textdata table The text properties. See Structures/TextData
---@param distance number How far away the shadow appears.
---@param alpha? number How visible the shadow is (0-255).
---@return number # The width of drawn text.
---@return number # The height of drawn text.
function draw.TextShadow(textdata, distance, alpha) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a texture with a table structure.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.TexturedQuad)
---@param texturedata table The texture properties. See Structures/TextureData.
function draw.TexturedQuad(texturedata) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws a rounded box with text in it.
---
---[View wiki](https://wiki.facepunch.com/gmod/draw.WordBox)
---@param bordersize number Size of border, should be multiple of 2. Ideally this will be 8 or 16.
---@param x number The X Coordinate.
---@param y number The Y Coordinate.
---@param text string Text to draw.
---@param font string Font to draw in. See surface.CreateFont to create your own, or Default_Fonts for a list of default fonts.
---@param boxcolor table The box color. Uses the Color.
---@param textcolor table The text color. Uses the Color.
---@param xalign? number The alignment of the X coordinate using Enums/TEXT_ALIGN.
---@param yalign? number The alignment of the Y coordinate using Enums/TEXT_ALIGN.
---@return number # The width of the word box.
---@return number # The height of the word box.
function draw.WordBox(bordersize, x, y, text, font, boxcolor, textcolor, xalign, yalign) end
