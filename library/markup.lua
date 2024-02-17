---@meta

--- The markup library only contains a single function to create a MarkupObject.
markup = {}

---[CLIENT AND MENU] A convenience function that converts a Color into its markup ready string representation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/markup.Color)
---@param col Color The Color to convert.
---@return string # The markup color, for example `255,255,255`.
function markup.Color(col) end

---[CLIENT AND MENU] Converts a string to its escaped, markup-safe equivalent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/markup.Escape)
---@param text string The string to sanitize.
---@return string # The parsed markup object ready to be drawn.
function markup.Escape(text) end

---[CLIENT AND MENU] Parses markup into a MarkupObject. Currently, this only supports fonts and colors as demonstrated in the example.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/markup.Parse)
---@param markup string The markup to be parsed.
---@param maxWidth? number The max width of the output
---@return MarkupObject # The parsed markup object ready to be drawn via MarkupObject:Draw.
function markup.Parse(markup, maxWidth) end
