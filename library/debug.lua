---@meta

--- The debug library is intended to help you debug your scripts, however it also has several other powerful uses. Some builtin debug function were removed in GMod due to security reasons
debug = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) **NOTE**: This only works on the source dedicated server.
---
--- Enters an interactive mode with the user, running each string that the user enters. Using simple commands and other debug facilities, the user can inspect global and local variables, change their values, evaluate expressions, and so on. A line containing only the word cont finishes this function, so that the caller continues its execution.
---
--- * Commands for debug.debug are not lexically nested within any function, and so have no direct access to local variables.
--- * To exit this interactive mode, you can press Ctrl + Z then Enter OR type the word 'cont' on a single line and press enter.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.debug)
function debug.debug() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the environment of the passed object. This can be set with [debug.setfenv](https://wiki.facepunch.com/gmod/debug.setfenv)
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.getfenv)
---@param object table Object to get environment of
---@return table # Environment
function debug.getfenv(object) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the current hook settings of the passed thread. The thread argument can be omitted. This is completely different to gamemode hooks. More information on hooks can be found at http://www.lua.org/pil/23.2.html. This function will simply return the function, mask, and count of the last called [debug.sethook](https://wiki.facepunch.com/gmod/debug.sethook).
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.gethook)
---@param thread? thread Which thread to retrieve it's hook from, doesn't seem to actually work.
---@return function # Hook function.
---@return string # Hook mask. This is reversed of the debug.sethook mask ("clr" would be "rlc").
---@return number # Hook count.
function debug.gethook(thread) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns debug information about a function.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.getinfo)
---@param funcOrStackLevel function Takes either a function or a number representing the stack level as an argument. Stack level 0 always corresponds to the debug.getinfo call, 1 would be the function calling debug.getinfo in most cases, and so on.
---
--- Returns useful information about that function in a table.
---@param fields? string A string whose characters specify the information to be retrieved.
---
--- * `f` - Populates the func field.
--- * `l` - Populates the currentline field.
--- * `L` - Populates the activelines field.
--- * `n` - Populates the name and namewhat fields - only works if stack level is passed rather than function pointer.
--- * `S` - Populates the location fields (lastlinedefined, linedefined, short_src, source and what).
--- * `u` - Populates the argument and upvalue fields (isvararg, nparams, nups).
--- * `>` - Causes this function to use the last argument to get the data from
---@param _function function|nil Function to use. (Only used by the `>` field)
---@return table # A table as a Structures/DebugInfo containing information about the function you passed. Can return nil if the stack level didn't point to a valid stack frame.
function debug.getinfo(funcOrStackLevel, fields, _function) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the name and value of a local variable indexed from the level.
--- 	**WARNING**: When a function has a tailcall return, you cannot access the locals of this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.getlocal)
---@param thread? thread The thread
---@param level number The level above the thread.
--- * 0 = the function that was called (most always this function)'s arguments
--- * 1 = the thread that had called this function.
--- * 2 = the thread that had called the function that started the thread that called this function.
---
--- A function defined in Lua can also be passed as the level. The index will specify the parameter's name to be returned (a parameter will have a value of nil).
---@param index number The variable's index you want to get.
--- * 1 = the first local defined in the thread
--- * 2 = the second local defined in the thread
--- * etc...
---@return string # The name of the variable.
---
--- Sometimes this will be `(*temporary)` if the local variable had no name.
---
--- Variables with names starting with **(** are **internal variables**.
---@return any # The value of the local variable.
function debug.getlocal(thread, level, index) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the metatable of an object. This function ignores the metatable's __metatable field.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.getmetatable)
---@param object any The object to retrieve the metatable from.
---@return table # The metatable of the given object.
function debug.getmetatable(object) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the internal Lua registry table.
---
--- The Lua registry is used by the engine and binary modules to create references to Lua values. The registry contains every global ran and used in the Lua environment. Avoid creating entries into the registry with a number as the key, as they are reserved for the reference system.
---
--- **WARNING**: Improper editing of the registry can result in unintended side effects, including crashing the game.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.getregistry)
---@return table # The Lua registry
---@deprecated This function **will** return an empty table.   	If you get an error because of this see the example below for a workaround
function debug.getregistry() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Used for getting variable values in an index from the passed function. This does nothing for C functions.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.getupvalue)
---@param func function Function to get the upvalue indexed from.
---@param index number The index in the upvalue array. The max number of entries can be found in debug.getinfo's "Structures/DebugInfo" key.
---@return string # Name of the upvalue. Will be nil if the index was out of range (< 1 or > debug.getinfo.nups), or the function was defined in C.
---@return any # Value of the upvalue.
function debug.getupvalue(func, index) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the environment of the passed object.
---
--- Unlike [Global.setfenv](https://wiki.facepunch.com/gmod/Global.setfenv), this also works on **any** userdata, allowing you to save data stored to it which can be accessed using [debug.getfenv](https://wiki.facepunch.com/gmod/debug.getfenv).
--- Userdata seem to intentionally support this & setting/changing it does not affect anything (though unused by gmod / Entities and such don't this)
--- This can be useful when trying to store data on a [IGModAudioChannel](https://wiki.facepunch.com/gmod/IGModAudioChannel), [Vector](https://wiki.facepunch.com/gmod/Vector), [Angle](https://wiki.facepunch.com/gmod/Angle) or any other that doesn't already allow you to store data on it.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.setfenv)
---@param object any Object to set environment of. Valid types: userdata, thread, function.
---@param env table Environment to set
---@return table # The object
function debug.setfenv(object, env) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the given function as a Lua hook. This is completely different to gamemode hooks. The thread argument can be completely omitted and calling this function with no arguments will remove the current hook. This is used by default for infinite loop detection. More information on hooks can be found at http://www.lua.org/pil/23.2.html and https://www.gammon.com.au/scripts/doc.php?lua=debug.sethook
---
--- Hooks are not always ran when code that has been compiled by LuaJIT's JIT compiler is being executed, this is due to Intermediate Representation internally storing constantly running bytecode for performance reasons.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.sethook)
---@param thread thread Thread to set the hook on. This argument can be omited
---@param hook function Function for the hook to call. First argument in this function will be the mask event that called the hook as a full string (not as 'c' but instead as 'call').
---@param mask string The hook's mask. Can be one or more of the following events:
--- * c - Triggers the hook on each function call made from Lua.
--- * r - Triggers the hook on each function return made from Lua.
--- * l - Triggers the hook on each line compiled of code.
---@param count number How often to call the hook (in instructions). 0 for every instruction. Can be omitted.
function debug.sethook(thread, hook, mask, count) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function was removed due to security concerns.
---
--- Sets a local variable's value.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.setlocal)
---@param thread? thread The thread
---@param level number The level above the thread.
--- 0 is the function that was called (most always this function)'s arguments
---
--- 1 is the thread that had called this function.
---
--- 2 is the thread that had called the function that started the thread that called this function.
---@param index number The variable's index you want to get.
---
--- 1 = the first local defined in the thread
---
--- 2 = the second local defined in the thread
---@param value? any The value to set the local to
---@return string # The name of the local variable if the local at the index exists, otherwise nil is returned.
function debug.setlocal(thread, level, index, value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the object's metatable. Unlike [Global.setmetatable](https://wiki.facepunch.com/gmod/Global.setmetatable), this function works regardless of whether the first object passed is a valid table or not; this function even works on primitive datatypes such as numbers, functions, and even nil.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.setmetatable)
---@param object any Object to set the metatable for.
---@param metatable table The metatable to set for the object.
--- If this argument is nil, then the object's metatable is removed.
---@return boolean # true if the object's metatable was set successfully.
function debug.setmetatable(object, metatable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function was removed due to security concerns.
---
--- Sets the variable indexed from func
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.setupvalue)
---@param func function The function to index the upvalue from
---@param index number The index from func
---@param val? any The value to set the upvalue to.
---@return string # Returns nil if there is no upvalue with the given index, otherwise it returns the upvalue's name.
function debug.setupvalue(func, index, val) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Prints out the lua function call stack to the console.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.Trace)
function debug.Trace() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a full execution stack trace.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.traceback)
---@param thread? thread Thread (ie. error object from xpcall error handler) to build traceback for. If this argument is not set to a proper thread it will act as the next argument.
---@param message? string Appended at the beginning of the traceback.
---@param level? number Which level to start the traceback.
---@return string # A dump of the execution stack.
function debug.traceback(thread, message, level) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function was removed due to security concerns.
---
--- Returns an unique identifier for the upvalue indexed from func
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.upvalueid)
---@param func function The function to index the upvalue from
---@param index number The index from func
---@return number # A unique identifier
function debug.upvalueid(func, index) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function was removed due to security concerns.
---
--- Make the n1-th upvalue of the Lua closure f1 refer to the n2-th upvalue of the Lua closure f2.
---
---[View wiki](https://wiki.facepunch.com/gmod/debug.upvaluejoin)
---@param f1 function
---@param n1 number
---@param f2 function
---@param n2 number
function debug.upvaluejoin(f1, n1, f2, n2) end
