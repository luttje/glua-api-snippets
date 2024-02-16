---@meta

--- The language library is used for translation.
language = {}

---[CLIENT AND MENU] Adds a language item. Language placeholders preceded with "#" are replaced with full text in Garry's Mod once registered with this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/language.Add)
---@param placeholder string The key for this phrase, without the preceding "#".
---@param fulltext string The phrase that should be displayed whenever this key is used.
function language.Add(placeholder, fulltext) end

---[CLIENT AND MENU] Retrieves the translated version of inputted string. Useful for concentrating multiple translated strings.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/language.GetPhrase)
---@param phrase string The phrase to translate
---@return string # The translated phrase, or the input string if no translation was found. There is a limit of 4000 bytes for the returned string.
function language.GetPhrase(phrase) end
