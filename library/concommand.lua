---@meta

--- The concommand library is used to create console commands which can be used to network (basic) information & events between the client and the server.
concommand = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a console command that runs a function in lua with optional autocompletion function and help text.
---
--- **WARNING**: Clients can still run commands created only on the server. Always check permissions in the callback
---
--- This will fail if the concommand was previously removed with [concommand.Remove](https://wiki.facepunch.com/gmod/concommand.Remove) in a different realm (creating a command on the client that was removed from the server and vice-versa).
---
---[View wiki](https://wiki.facepunch.com/gmod/concommand.Add)
---@param name string The command name to be used in console.
---
--- This cannot be a name of existing console command or console variable. It will silently fail if it is.
---@param callback fun(ply: Player, cmd: string, args: table, argStr: string) The function to run when the concommand is executed.
---
---
--- Function argument(s):
--- * Player `ply` - The player that ran the concommand. NULL entity if command was entered with the dedicated server console.
--- * string `cmd` - The concommand string (if one callback is used for several concommands).
--- * table `args` - A table of all string arguments.
--- * string `argStr` - The arguments as a string.
---@param autoComplete? fun(cmd: string, argStr: string, args: table):(tbl: table) The function to call which should return a table of options for autocompletion. (Console_Command_Auto-completion)
---
--- This only properly works on the client since it is **not** networked.
---
--- Function argument(s):
--- * string `cmd` - The concommand this autocompletion is for.
--- * string `argStr` - The arguments typed so far.
--- * table `args` - A table of all string arguments.
---
--- Function return value(s):
--- * table `tbl` - A table containing the autocomplete options to display.
---@param helpText? string The text to display should a user run 'help cmdName'.
---@param flags? FCVAR|number[] Console command modifier flags. Either a bitflag, or a table of enums. See Enums/FCVAR.
function concommand.Add(name, callback, autoComplete, helpText, flags) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used by the engine to call the autocomplete function for a console command, and retrieve returned options.
---
---[View wiki](https://wiki.facepunch.com/gmod/concommand.AutoComplete)
---@param command string Name of command
---@param arguments string Arguments given to the command
---@return table # Possibilities for auto-completion. This is the return value of the auto-complete callback.
function concommand.AutoComplete(command, arguments) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the tables of all console command callbacks, and autocomplete functions, that were added to the game with [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add).
---
---[View wiki](https://wiki.facepunch.com/gmod/concommand.GetTable)
---@return table<string,function> # Table of command callback functions.
---@return table<string,function> # Table of command autocomplete functions.
function concommand.GetTable() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes a console command.
---
--- [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add) will fail if the concommand was previously removed with this function in a different realm (creating a command on the client that was removed from the server and vice-versa).
---
---[View wiki](https://wiki.facepunch.com/gmod/concommand.Remove)
---@param name string The name of the command to be removed.
function concommand.Remove(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) **INTERNAL**: You might be looking for [Global.RunConsoleCommand](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand) or [Player:ConCommand](https://wiki.facepunch.com/gmod/Player:ConCommand).
---
--- Used by the engine to run a console command's callback function. This will only be called for commands that were added with [Global.AddConsoleCommand](https://wiki.facepunch.com/gmod/Global.AddConsoleCommand), which [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add) calls internally. An error is sent to the player's console if no callback is found.
---
--- This will still be called for concommands removed with [concommand.Remove](https://wiki.facepunch.com/gmod/concommand.Remove) but will return false. This will not be called for concommands added by the engine, only those made from Lua.
---
---[View wiki](https://wiki.facepunch.com/gmod/concommand.Run)
---@param ply Player Player to run concommand on
---@param cmd string Command name
---@param args any Command arguments.
--- Can be table or string
---@param argumentString string string of all arguments sent to the command
---@return boolean # `true` if the console command with the given name exists, and `false` if it doesn't.
function concommand.Run(ply, cmd, args, argumentString) end
