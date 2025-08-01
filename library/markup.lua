---@meta

--- The markup library only contains a single function to create a [MarkupObject](https://wiki.facepunch.com/gmod/MarkupObject).
markup = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) A convenience function that converts a [Color](https://wiki.facepunch.com/gmod/Color) into its markup ready string representation.
---
---[View wiki](https://wiki.facepunch.com/gmod/markup.Color)
---@param col Color The Color to convert.
---@return string # The markup color, for example `255,255,255`.
function markup.Color(col) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Converts a string to its escaped, markup-safe equivalent.
---
---[View wiki](https://wiki.facepunch.com/gmod/markup.Escape)
---@param text string The string to sanitize.
---@return string # The parsed markup object ready to be drawn.
function markup.Escape(text) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Parses markup into a [MarkupObject](https://wiki.facepunch.com/gmod/MarkupObject). Currently, this only supports fonts and colors as demonstrated in the example.
--- 	**WARNING**: This function is very slow! Always cache its result
---
---[View wiki](https://wiki.facepunch.com/gmod/markup.Parse)
---@param markup string The markup to be parsed.
---@param maxWidth? number The max width of the output
---@return MarkupObject # The parsed markup object ready to be drawn via MarkupObject:Draw.
function markup.Parse(markup, maxWidth) end
