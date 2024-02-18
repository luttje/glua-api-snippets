---@meta

--- Object containing parsed markup for later rendering. Created by markup.Parse.
---@class MarkupObject
local MarkupObject = {}

---[CLIENT AND MENU] Draws the computed markupobject to the screen. See markup.Parse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MarkupObject:Draw)
---@param xOffset number The X coordinate on the screen.
---@param yOffset number The Y coordinate on the screen.
---@param xAlign? number The alignment of the x coordinate within the text using Enums/TEXT_ALIGN
---@param yAlign? number The alignment of the y coordinate within the text using Enums/TEXT_ALIGN
---@param alphaoverride? number Sets the alpha of all drawn objects to this value.
---@param textAlign? number The alignment of the text horizontally using Enums/TEXT_ALIGN
function MarkupObject:Draw(xOffset, yOffset, xAlign, yAlign, alphaoverride, textAlign) end

---[CLIENT AND MENU] Gets computed the height of the markupobject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MarkupObject:GetHeight)
---@return number # The computed height.
function MarkupObject:GetHeight() end

---[CLIENT AND MENU] Gets maximum width for this markup object as defined in markup.Parse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MarkupObject:GetMaxWidth)
---@return number # The max width.
function MarkupObject:GetMaxWidth() end

---[CLIENT AND MENU] Gets computed the width of the markupobject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MarkupObject:GetWidth)
---@return number # The computed width.
function MarkupObject:GetWidth() end

---[CLIENT AND MENU] Gets computed the width and height of the markupobject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/MarkupObject:Size)
---@return number # The computed width.
---@return number # The computed height.
function MarkupObject:Size() end
