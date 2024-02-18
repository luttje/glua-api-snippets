---@meta

--- The draw library's purpose is to simplify the usage of the surface library.
draw = {}

---[CLIENT AND MENU] Simple draw text at position, but this will expand newlines and tabs.
---
---
---
--- See also MarkupObject for limited width and markup support.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.DrawText)
---@param text string Text to be drawn.
---@param font? string Name of font to draw the text in. See surface.CreateFont to create your own, or Default Fonts for a list of default fonts.
---@param x? number The X Coordinate.
---@param y? number The Y Coordinate.
---@param color? table Color to draw the text in. Uses the Color.
---@param xAlign? number Where to align the text horizontally. Uses the Enums/TEXT_ALIGN.
function draw.DrawText(text, font, x, y, color, xAlign) end

---[CLIENT AND MENU] Returns the height of the specified font in pixels. This is equivalent to the height of the character `W`. See surface.GetTextSize.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.GetFontHeight)
---@param font string Name of the font to get the height of.
---@return number # The font height
function draw.GetFontHeight(font) end

---[CLIENT AND MENU] Sets drawing texture to a default white texture (vgui/white) via surface.SetMaterial. Useful for resetting the drawing texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.NoTexture)
function draw.NoTexture() end

---[CLIENT AND MENU] Draws a rounded rectangle.
--- If you do not define a cornerRadius, surface.DrawRect will be used instead for performance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.RoundedBox)
---@param cornerRadius number Radius of the rounded corners, works best with a multiple of 2.
---@param x number The x coordinate of the top left of the rectangle.
---@param y number The y coordinate of the top left of the rectangle.
---@param width number The width of the rectangle.
---@param height number The height of the rectangle.
---@param color table The color to fill the rectangle with. Uses the Color.
function draw.RoundedBox(cornerRadius, x, y, width, height, color) end

---[CLIENT AND MENU] Draws a rounded rectangle. This function also lets you specify which corners are drawn rounded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.RoundedBoxEx)
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

---[CLIENT AND MENU] Draws text on the screen.
--- This function does not handle newlines properly. See draw.DrawText for a function that does.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.SimpleText)
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

---[CLIENT AND MENU] Creates a simple line of text that is outlined.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.SimpleTextOutlined)
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

---[CLIENT AND MENU] Works like draw.SimpleText but uses a table structure instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.Text)
---@param textdata table The text properties. See the Structures/TextData
---@return number # Width of drawn text
---@return number # Height of drawn text
function draw.Text(textdata) end

---[CLIENT AND MENU] Works like draw.Text, but draws the text as a shadow.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.TextShadow)
---@param textdata table The text properties. See Structures/TextData
---@param distance number How far away the shadow appears.
---@param alpha? number How visible the shadow is (0-255).
---@return number # The width of drawn text.
---@return number # The height of drawn text.
function draw.TextShadow(textdata, distance, alpha) end

---[CLIENT AND MENU] Draws a texture with a table structure.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.TexturedQuad)
---@param texturedata table The texture properties. See Structures/TextureData.
function draw.TexturedQuad(texturedata) end

---[CLIENT AND MENU] Draws a rounded box with text in it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/draw.WordBox)
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
