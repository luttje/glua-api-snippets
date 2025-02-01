---@meta

--- The hook library allows you to add hooks called by the game engine, allowing multiple scripts to modify game function.
hook = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Registers a function (or "callback") with the [Hook](https://wiki.facepunch.com/gmod/Hook) system so that it will be called automatically whenever a specific event (or "hook") occurs.
---
---[View wiki](https://wiki.facepunch.com/gmod/hook.Add)
---@param eventName string The event to hook on to. This can be any GM_Hooks hook, gameevent after using gameevent.Listen, or custom hook run with hook.Call or hook.Run.
---@param identifier any The unique identifier, usually a string. This can be used elsewhere in the code to replace or remove the hook. The identifier **should** be unique so that you do not accidentally override some other mods hook, unless that's what you are trying to do.
---
--- 			The identifier can be either a string, or a table/object with an IsValid function defined such as an Entity or Panel. numbers and booleans, for example, are not allowed.
---
--- 			If the identifier is a table/object, it will be inserted in front of the other arguments in the callback and the hook will be called as long as it's valid. However, if IsValid( identifier ) returns false when **any** eventName hook is called, the hook will be removed.
---@param func function The function to be called, arguments given to it depend on the identifier used.
---
--- 				Returning any value besides nil from the hook's function will stop other hooks of the same event down the loop from being executed. Only return a value when absolutely necessary and when you know what you are doing.
---
--- 				It WILL break other addons.
function hook.Add(eventName, identifier, func) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Calls all hooks associated with the given event until one returns something other than `nil`, and then returns that data.
---
--- In almost all cases, you should use [hook.Run](https://wiki.facepunch.com/gmod/hook.Run) instead - it calls hook.Call internally but supplies the gamemode table by itself, making your code neater.
---
---[View wiki](https://wiki.facepunch.com/gmod/hook.Call)
---@param eventName string The event to call hooks for.
---@param gamemodeTable? table If the gamemode is specified, the gamemode hook within will be called, otherwise not.
---@param ...? any The arguments to be passed to the hooks.
---@return any ... # Return data from called hooks. Limited to **6** return values.
function hook.Call(eventName, gamemodeTable, ...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a list of all the hooks registered with [hook.Add](https://wiki.facepunch.com/gmod/hook.Add).
---
---[View wiki](https://wiki.facepunch.com/gmod/hook.GetTable)
---@return table # A table of tables. See below for output example.
function hook.GetTable() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes the hook with the supplied identifier from the given event.
---
---[View wiki](https://wiki.facepunch.com/gmod/hook.Remove)
---@param eventName string The event name.
---@param identifier any The unique identifier of the hook to remove, usually a string.
function hook.Remove(eventName, identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Calls all hooks associated with the given event **until** one returns something other than `nil` and then returns that data. If no hook returns any data, it will try to call the `GAMEMODE:`; alternative, if one exists.
---
--- This function internally calls [hook.Call](https://wiki.facepunch.com/gmod/hook.Call).
---
--- See also: [gamemode.Call](https://wiki.facepunch.com/gmod/gamemode.Call) - same as this, but does not call hooks if the gamemode hasn't defined the function.
---
---[View wiki](https://wiki.facepunch.com/gmod/hook.Run)
---@param eventName string The event to call hooks for.
---@param ... any The arguments to be passed to the hooks.
---@return any ... # Return data from called hooks. Limited to **6** return values.
function hook.Run(eventName, ...) end
