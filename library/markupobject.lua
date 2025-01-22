---@meta

--- Object containing parsed markup for later rendering. Created by [markup.Parse](https://wiki.facepunch.com/gmod/markup.Parse).
---
---[View wiki](https://wiki.facepunch.com/gmod/MarkupObject)
---@class MarkupObject
local MarkupObject = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws the computed markupobject to the screen. See [markup.Parse](https://wiki.facepunch.com/gmod/markup.Parse).
---
---[View wiki](https://wiki.facepunch.com/gmod/MarkupObject:Draw)
---@param xOffset number The X coordinate on the screen.
---@param yOffset number The Y coordinate on the screen.
---@param xAlign? number The alignment of the x coordinate within the text using Enums/TEXT_ALIGN
---@param yAlign? number The alignment of the y coordinate within the text using Enums/TEXT_ALIGN
---@param alphaoverride? number Sets the alpha of all drawn objects to this value.
---@param textAlign? number The alignment of the text horizontally using Enums/TEXT_ALIGN
function MarkupObject:Draw(xOffset, yOffset, xAlign, yAlign, alphaoverride, textAlign) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets computed the height of the markupobject.
---
---[View wiki](https://wiki.facepunch.com/gmod/MarkupObject:GetHeight)
---@return number # The computed height.
function MarkupObject:GetHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets maximum width for this markup object as defined in [markup.Parse](https://wiki.facepunch.com/gmod/markup.Parse).
---
---[View wiki](https://wiki.facepunch.com/gmod/MarkupObject:GetMaxWidth)
---@return number # The max width.
function MarkupObject:GetMaxWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets computed the width of the markupobject.
---
---[View wiki](https://wiki.facepunch.com/gmod/MarkupObject:GetWidth)
---@return number # The computed width.
function MarkupObject:GetWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets computed the width and height of the markupobject.
---
---[View wiki](https://wiki.facepunch.com/gmod/MarkupObject:Size)
---@return number # The computed width.
---@return number # The computed height.
function MarkupObject:Size() end
