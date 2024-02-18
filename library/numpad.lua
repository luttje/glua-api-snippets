---@meta

--- The numpad module allows you to execute functions on a key press or release.
numpad = {}

---[SERVER] Activates numpad key owned by the player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.Activate)
---@param ply Player The player whose numpad should be simulated
---@param key number The key to press, see Enums/KEY
---@param isButton? boolean Should this keypress pretend to be a from a `gmod_button`? (causes numpad.FromButton to return `true`)
function numpad.Activate(ply, key, isButton) end

---[SERVER] Deactivates numpad key owned by the player
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.Deactivate)
---@param ply Player The player whose numpad should be simulated
---@param key number The key to press, corresponding to Enums/KEY
---@param isButton? boolean Should this keypress pretend to be a from a `gmod_button`? (causes numpad.FromButton to return `true`)
function numpad.Deactivate(ply, key, isButton) end

---[SERVER] Returns true during a function added with numpad.Register when the third argument to numpad.Activate is true.
---
--- This is caused when a numpad function is triggered by a button SENT being used.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.FromButton)
---@return boolean # wasButton
function numpad.FromButton() end

---[SERVER] Calls a function registered with numpad.Register when a player presses specified key.
---
--- See for key released action: numpad.OnUp
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.OnDown)
---@param ply Player The player whose numpad should be watched
---@param key number The key, corresponding to Enums/KEY
---@param name string The name of the function to run, corresponding with the one used in numpad.Register
---@param ... any Arguments to pass to the function passed to numpad.Register.
---@return number # The impulse ID
function numpad.OnDown(ply, key, name, ...) end

---[SERVER] Calls a function registered with numpad.Register when a player releases specified key.
---
--- See for key pressed action: numpad.OnDown
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.OnUp)
---@param ply Player The player whose numpad should be watched
---@param key number The key, corresponding to Enums/KEY
---@param name string The name of the function to run, corresponding with the one used in numpad.Register
---@param ... any Arguments to pass to the function passed to numpad.Register.
---@return number # The impulse ID
function numpad.OnUp(ply, key, name, ...) end

---[SERVER] Registers a numpad library action for use with numpad.OnDown and numpad.OnUp
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.Register)
---@param id string The unique id of your action.
---@param func function The function to be executed.
---
--- Arguments are:
---
--- Player ply - The player who pressed the button
---
--- vararg ... - The 4th and all subsequent arguments passed from numpad.OnDown and/or numpad.OnUp
---
--- Returning **false** in this function will remove the listener which triggered this function (example: return false if one of your varargs is an entity which is no longer valid)
function numpad.Register(id, func) end

---[SERVER] Removes a function added by either numpad.OnUp or numpad.OnDown
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.Remove)
---@param ID number The impulse ID returned by numpad.OnUp or numpad.OnDown
function numpad.Remove(ID) end

---[SERVER] Either runs numpad.Activate or numpad.Deactivate depending on the key's current state
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/numpad.Toggle)
---@param ply Player The player whose numpad should be simulated
---@param key number The key to press, corresponding to Enums/KEY
function numpad.Toggle(ply, key) end
