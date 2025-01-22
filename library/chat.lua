---@meta

--- The chat library's purpose is to interface with the default chatbox.
chat = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds text to the local player's chat box (which only they can read).
---
---[View wiki](https://wiki.facepunch.com/gmod/chat.AddText)
---@param ... any The arguments. Arguments can be:
--- * table - Color. Will set the color for all following strings until the next Color argument.
--- * string - Text to be added to the chat box.
--- * Player - Adds the name of the player in the player's team color to the chat box.
--- * any - Any other type, such as Entity will be converted to string and added as text.
function chat.AddText(...) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Closes the chat window.
---
---[View wiki](https://wiki.facepunch.com/gmod/chat.Close)
function chat.Close() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the chatbox position.
---
---[View wiki](https://wiki.facepunch.com/gmod/chat.GetChatBoxPos)
---@return number # The X coordinate of the chatbox's position.
---@return number # The Y coordinate of the chatbox's position.
function chat.GetChatBoxPos() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the chatbox size.
---
---[View wiki](https://wiki.facepunch.com/gmod/chat.GetChatBoxSize)
---@return number # The width of the chatbox.
---@return number # The height of the chatbox.
function chat.GetChatBoxSize() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Opens the chat window.
---
---[View wiki](https://wiki.facepunch.com/gmod/chat.Open)
---@param mode number If equals 1, opens public chat, otherwise opens team chat
function chat.Open(mode) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Plays the chat "tick" sound.
---
---[View wiki](https://wiki.facepunch.com/gmod/chat.PlaySound)
function chat.PlaySound() end
