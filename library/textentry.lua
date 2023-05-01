---@meta

---@class TextEntry
local TextEntry = {}

---[CLIENT] Called from engine whenever a valid character is typed while the text entry is focused.
---
--- Used internally for functionality of DTextEntry
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TextEntry:OnKeyCodeTyped)
---@param keyCode number They key code of the key pressed, see Enums/KEY.
---@return boolean Whether you've handled the key press. Returning true prevents the default text entry behavior from occurring.
function TextEntry:OnKeyCodeTyped(keyCode) end
