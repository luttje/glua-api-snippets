---@meta

usermessage = {}

---[SHARED] Returns a table of every usermessage hook
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/usermessage.GetTable)
---@return table #hooks
function usermessage.GetTable() end

---[SHARED] Sets a hook for the specified to be called when a usermessage with the specified name arrives.
---
--- Usermessages have a limit of only 256 bytes!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/usermessage.Hook)
---@param name string The message name to hook to.
---@param callback function The function to be called if the specified message was received.
--- * bf_read msg
--- * vararg preArgs
---@param ...? ... Arguments that are passed to the callback function when the hook is called.
---@deprecated You should be using net instead
function usermessage.Hook(name, callback, ...) end

---[SHARED] Called by the engine when a usermessage arrives, this method calls the hook function specified by usermessage.Hook if any.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/usermessage.IncomingMessage)
---@param name string The message name.
---@param msg bf_read The message.
function usermessage.IncomingMessage(name, msg) end
