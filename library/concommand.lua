---@meta

--- The concommand library is used to create console commands which can be used to network (basic) information & events between the client and the server.
concommand = {}

---[SHARED AND MENU] Creates a console command that runs a function in lua with optional autocompletion function and help text.
---
--- This will fail if the concommand was previously removed with concommand.Remove in a different realm (creating a command on the client that was removed from the server and vice-versa).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/concommand.Add)
---@param name string The command name to be used in console.
---
--- This cannot be a name of existing console command or console variable. It will silently fail if it is.
---@param callback fun(ply: Player, cmd: string, args: table, argStr: string) The function to run when the concommand is executed. Arguments passed are:
--- * Player ply - The player that ran the concommand. NULL entity if command was entered with the dedicated server console.
--- * string cmd - The concommand string (if one callback is used for several concommands).
--- * table args - A table of all string arguments.
--- * string argStr - The arguments as a string.
---@param autoComplete? fun(cmd: string, args: string): string[]? The function to call which should return a table of options for autocompletion. (Console_Command_Auto-completion)
--- This only properly works on the client since it is **not** networked. Arguments passed are:
--- * string cmd - The concommand this autocompletion is for.
--- * string args - The arguments typed so far.
---@param helpText? string The text to display should a user run 'help cmdName'.
---@param flags? number Concommand modifier flags. See Enums/FCVAR.
function concommand.Add(name, callback, autoComplete, helpText, flags) end

---[SHARED AND MENU] Used by the engine to call the autocomplete function for a console command, and retrieve returned options.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/concommand.AutoComplete)
---@param command string Name of command
---@param arguments string Arguments given to the command
---@return table # Possibilities for auto-completion. This is the return value of the auto-complete callback.
function concommand.AutoComplete(command, arguments) end

---[SHARED AND MENU] Returns the tables of all console command callbacks, and autocomplete functions, that were added to the game with concommand.Add.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/concommand.GetTable)
---@return table # Table of command callback functions.
---@return table # Table of command autocomplete functions.
function concommand.GetTable() end

---[SHARED AND MENU] Removes a console command.
---
--- concommand.Add will fail if the concommand was previously removed with this function in a different realm (creating a command on the client that was removed from the server and vice-versa).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/concommand.Remove)
---@param name string The name of the command to be removed.
function concommand.Remove(name) end

---[SHARED AND MENU] You might be looking for Global.RunConsoleCommand or Player:ConCommand.
---
--- Used by the engine to run a console command's callback function. This will only be called for commands that were added with Global.AddConsoleCommand, which concommand.Add calls internally. An error is sent to the player's chat if no callback is found.
---
--- This will still be called for concommands removed with concommand.Remove but will return false.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/concommand.Run)
---@param ply Player Player to run concommand on
---@param cmd string Command name
---@param args any Command arguments.
--- Can be table or string
---@param argumentString string string of all arguments sent to the command
---@return boolean # `true` if the console command with the given name exists, and `false` if it doesn't.
function concommand.Run(ply, cmd, args, argumentString) end
