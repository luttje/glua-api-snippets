---@meta

--- The usermessage library is used to receive user messages from the server on the client.
---
--- **WARNING**: Usermessages have a limit of only 256 bytes!
---@deprecated You should be using the net instead
usermessage = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table of every usermessage hook
---
---[View wiki](https://wiki.facepunch.com/gmod/usermessage.GetTable)
---@return table # User message hooks
---@deprecated You should be using net instead
function usermessage.GetTable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets a hook for the specified to be called when a usermessage with the specified name arrives.
---
--- **WARNING**: Usermessages have a limit of only 256 bytes!
---
---[View wiki](https://wiki.facepunch.com/gmod/usermessage.Hook)
---@param name string The message name to hook to.
---@param callback fun(msg: bf_read, ...: any) The function to be called if the specified message was received.
---
--- Function argument(s):
--- * bf_read `msg` - The object to read your custom data from.
--- * vararg `preArgs` -
---@param ...? any Arguments that are passed to the callback function when the hook is called.
---@deprecated You should be using net instead
function usermessage.Hook(name, callback, ...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by the engine when a usermessage arrives, this method calls the hook function specified by [usermessage.Hook](https://wiki.facepunch.com/gmod/usermessage.Hook) if any.
---
---[View wiki](https://wiki.facepunch.com/gmod/usermessage.IncomingMessage)
---@param name string The message name.
---@param msg bf_read The message.
function usermessage.IncomingMessage(name, msg) end
