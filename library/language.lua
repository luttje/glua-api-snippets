---@meta

--- The language library is used for translation.
language = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a language item. Language placeholders preceded with "#" are replaced with full text in Garry's Mod once registered with this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/language.Add)
---@param placeholder string The key for this phrase, without the preceding "#".
---@param fulltext string The phrase that should be displayed whenever this key is used.
function language.Add(placeholder, fulltext) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Retrieves the translated version of inputted string. Useful for concentrating multiple translated strings.
---
---[View wiki](https://wiki.facepunch.com/gmod/language.GetPhrase)
---@param phrase string The phrase to translate
---@return string # The translated phrase, or the input string if no translation was found. There is a limit of 4000 bytes for the returned string.
function language.GetPhrase(phrase) end
