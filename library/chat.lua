---@meta

chat = {}

---[CLIENT] Adds text to the local player's chat box (which only they can read).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/chat.AddText)
---@param ... ... The arguments. Arguments can be:
--- * table - Color. Will set the color for all following strings until the next Color argument.
--- * string - Text to be added to the chat box.
--- * Player - Adds the name of the player in the player's team color to the chat box.
--- * any - Any other type, such as Entity will be converted to string and added as text.
function chat.AddText(...) end

---[CLIENT] Closes the chat window.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/chat.Close)
function chat.Close() end

---[CLIENT] Returns the chatbox position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/chat.GetChatBoxPos)
---@return number, number number - The X coordinate of the chatbox's position.
---@return number, number number - The Y coordinate of the chatbox's position.
function chat.GetChatBoxPos() end

---[CLIENT] Returns the chatbox size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/chat.GetChatBoxSize)
---@return number, number number - The width of the chatbox.
---@return number, number number - The height of the chatbox.
function chat.GetChatBoxSize() end

---[CLIENT] Opens the chat window.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/chat.Open)
---@param mode number If equals 1, opens public chat, otherwise opens team chat
function chat.Open(mode) end

---[CLIENT] Plays the chat "tick" sound.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/chat.PlaySound)
function chat.PlaySound() end
