---@meta

--- The numpad module allows you to execute functions on a key press or release.
numpad = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Activates numpad key owned by the player
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.Activate)
---@param ply Player The player whose numpad should be simulated
---@param key number The key to press, see Enums/KEY
---@param isButton? boolean Should this keypress pretend to be a from a `gmod_button`? (causes numpad.FromButton to return `true`)
function numpad.Activate(ply, key, isButton) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Deactivates numpad key owned by the player
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.Deactivate)
---@param ply Player The player whose numpad should be simulated
---@param key number The key to press, corresponding to Enums/KEY
---@param isButton? boolean Should this keypress pretend to be a from a `gmod_button`? (causes numpad.FromButton to return `true`)
function numpad.Deactivate(ply, key, isButton) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns true during a function added with [numpad.Register](https://wiki.facepunch.com/gmod/numpad.Register) when the third argument to [numpad.Activate](https://wiki.facepunch.com/gmod/numpad.Activate) is true.
---
--- This is caused when a numpad function is triggered by a button SENT being used.
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.FromButton)
---@return boolean # wasButton
function numpad.FromButton() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Calls a function registered with [numpad.Register](https://wiki.facepunch.com/gmod/numpad.Register) when a player presses specified key.
---
--- See for key released action: [numpad.OnUp](https://wiki.facepunch.com/gmod/numpad.OnUp)
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.OnDown)
---@param ply Player The player whose numpad should be watched
---@param key number The key, corresponding to Enums/KEY
---@param name string The name of the function to run, corresponding with the one used in numpad.Register
---@param ... any Arguments to pass to the function passed to numpad.Register.
---@return number # The impulse ID
function numpad.OnDown(ply, key, name, ...) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Calls a function registered with [numpad.Register](https://wiki.facepunch.com/gmod/numpad.Register) when a player releases specified key.
---
--- See for key pressed action: [numpad.OnDown](https://wiki.facepunch.com/gmod/numpad.OnDown)
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.OnUp)
---@param ply Player The player whose numpad should be watched
---@param key number The key, corresponding to Enums/KEY
---@param name string The name of the function to run, corresponding with the one used in numpad.Register
---@param ... any Arguments to pass to the function passed to numpad.Register.
---@return number # The impulse ID
function numpad.OnUp(ply, key, name, ...) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Registers a numpad library action for use with [numpad.OnDown](https://wiki.facepunch.com/gmod/numpad.OnDown) and [numpad.OnUp](https://wiki.facepunch.com/gmod/numpad.OnUp)
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.Register)
---@param id string The unique id of your action.
---@param func fun(ply: Player, ...: any):(data: boolean?) The function to be executed.
---
--- Function argument(s):
--- * Player `ply` - The player who pressed the button
--- * vararg `data` - The 4th and all subsequent arguments passed from numpad.OnDown and/or numpad.OnUp.
---
--- Function return value(s):
--- * boolean `data` - Returning `false` in this function will remove the listener which triggered this function
---
--- (example: return `false` if one of your varargs is an entity which is no longer valid)
function numpad.Register(id, func) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Removes a function added by either [numpad.OnUp](https://wiki.facepunch.com/gmod/numpad.OnUp) or [numpad.OnDown](https://wiki.facepunch.com/gmod/numpad.OnDown)
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.Remove)
---@param ID number The impulse ID returned by numpad.OnUp or numpad.OnDown
function numpad.Remove(ID) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Either runs [numpad.Activate](https://wiki.facepunch.com/gmod/numpad.Activate) or [numpad.Deactivate](https://wiki.facepunch.com/gmod/numpad.Deactivate) depending on the key's current state
---
---[View wiki](https://wiki.facepunch.com/gmod/numpad.Toggle)
---@param ply Player The player whose numpad should be simulated
---@param key number The key to press, corresponding to Enums/KEY
function numpad.Toggle(ply, key) end
