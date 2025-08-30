---@meta

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Adds simple Get/Set accessor functions on the specified table.
--- Can also force the value to be set to a number, bool or string.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---@param tab table The table to add the accessor functions to.
---@param key any The key of the table to be get/set.
---@param name string The name of the functions (will be prefixed with Get and Set).
---@param force? FORCE The type the setter should force to (uses Enums/FORCE).
function _G.AccessorFunc(tab, key, name, force) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Defines a global entity class variable with an automatic value. In order to prevent collisions with other [Enums/CLASS](https://wiki.facepunch.com/gmod/Enums/CLASS). You should prefix your variable with CLASS_ for consistency.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Add_NPC_Class)
---@param name string The name of the new enum/global variable.
function _G.Add_NPC_Class(name) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Adds the specified image path to the main menu background pool. Image can be png or jpeg.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AddBackgroundImage)
---@param path string Path to the image.
function _G.AddBackgroundImage(path) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) **INTERNAL**: Use [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add) instead.
--- Tells the engine to register a console command. If the command was ran, the engine calls [concommand.Run](https://wiki.facepunch.com/gmod/concommand.Run).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AddConsoleCommand)
---@param name string The name of the console command to add.
---@param helpText string The help text.
---@param flags FCVAR Concommand flags using Enums/FCVAR
function _G.AddConsoleCommand(name, helpText, flags) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Marks a Lua file to be sent to clients when they join the server. Doesn't do anything on the client - this means you can use it in a shared file without problems.
---
--- **WARNING**: If the file trying to be added is empty, an error will occur, and the file will not be sent to the client
---
--- The string cannot have whitespace.
---
--- **NOTE**: This function is not needed for scripts located in these paths because they are automatically sent to clients.
--- 	**lua/matproxy/**
--- 	**lua/postprocess/**
--- 	**lua/vgui/**
--- 	**lua/skins/**
--- 	**lua/autorun/**
--- 	**lua/autorun/client/**
---
--- 	You can add up to **8192** files. Each file can be up to **64KB** compressed (LZMA)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AddCSLuaFile)
---@param file? string The name/path to the Lua file that should be sent, **relative to the garrysmod/lua folder**. If no parameter is specified, it sends the current file.
---
--- The file path can be relative to the script it's ran from. For example, if your script is in `lua/myfolder/stuff.lua`, calling Global.AddCSLuaFile("otherstuff.lua") and Global.AddCSLuaFile("myfolder/otherstuff.lua") is the same thing.
---
--- Please make sure your file names are unique, the filesystem is shared across all addons, so a file named `lua/config.lua` in your addon may be overwritten by the same file in another addon.
function _G.AddCSLuaFile(file) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Loads the specified image from the `/cache` folder, used in combination with [steamworks.Download](https://wiki.facepunch.com/gmod/steamworks.Download). Most addons will provide a 512x512 png image.
---
--- **NOTE**: This works with any image file with the `.cache` file extension, even outside of the `/cache` folder.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AddonMaterial)
---@param name string The name of the file.
---@return IMaterial # The material, returns `nil` if the cached file is not an image.
function _G.AddonMaterial(name) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds the specified vector to the PVS which is currently building. This allows all objects in visleafs visible from that vector to be drawn.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AddOriginToPVS)
---@param position Vector The origin to add.
function _G.AddOriginToPVS(position) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) This function creates a Custom Category in the Spawnlist. Use [Global.GenerateSpawnlistFromPath](https://wiki.facepunch.com/gmod/Global.GenerateSpawnlistFromPath) if you want to create a category with the contents of a folder.
--- 	**WARNING**: Using this function before [SANDBOX:PopulateContent](https://wiki.facepunch.com/gmod/SANDBOX:PopulateContent) has been called will result in an error
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AddPropsOfParent)
---@param pnlContent Panel The SMContentPanel of the Node
---@param node Panel The Node
---@param parentid number The ParentID to use
---@param customProps table The Table with the Contents of the new Category
function _G.AddPropsOfParent(pnlContent, node, parentid, customProps) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) This function creates a World Tip, similar to the one shown when aiming at a Thruster where it shows you its force.
---
--- This function will make a World Tip that will only last 50 milliseconds (1/20th of a second), so you must call it continuously as long as you want the World Tip to be shown. It is common to call it inside a Think hook.
---
--- Contrary to what the function's name implies, it is impossible to create more than one World Tip at the same time. A new World Tip will overwrite the old one, so only use this function when you know nothing else will also be using it.
---
--- See [SANDBOX:PaintWorldTips](https://wiki.facepunch.com/gmod/SANDBOX:PaintWorldTips) for more information.
---
--- **NOTE**: This function is only available in Sandbox and its derivatives
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AddWorldTip)
---@param entindex? number **This argument is no longer used**; it has no effect on anything. You can use nil in this argument.
---@param text string The text for the world tip to display.
---@param dieTime? number **This argument is no longer used**; when you add a World Tip it will always last only 0.05 seconds. You can use nil in this argument.
---@param pos? Vector Where in the world you want the World Tip to be drawn. If you add a valid Entity in the next argument, this argument will have no effect on the actual World Tip.
---@param ent? Entity Which entity you want to associate with the World Tip. This argument is optional. If set to a valid entity, this will override the position set in `pos` with the Entity's position.
function _G.AddWorldTip(entindex, text, dieTime, pos, ent) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates an [Angle](https://wiki.facepunch.com/gmod/Angle) object, representing a [Euler Angle](https://en.wikipedia.org/wiki/Euler_angles) made up of pitch, yaw, and roll components.
---
--- **WARNING**: This function is relatively expensive, in terms of performance, in situations where it is being called multiple times every frame (Like a loop, for example.) This is due to the overhead associated with object creation and garbage collection.
--- 	Where possible, it is generally better to store an [Angle](https://wiki.facepunch.com/gmod/Angle) in a variable and re-use that variable rather than re-creating it repeatedly.
--- 	In cases where an empty [Angle](https://wiki.facepunch.com/gmod/Angle) is needed, the global variable `angle_zero` is the preferred solution instead of `Angle( 0, 0, 0 )`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Angle)
---@param pitch? number The pitch value of the angle, in degrees.
---@param yaw? number The yaw value of the angle, in degrees.
---@param roll? number The roll value of the angle, in degrees.
---@return Angle # The newly created Angle
function _G.Angle(pitch, yaw, roll) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates an [Angle](https://wiki.facepunch.com/gmod/Angle) object, representing a [Euler Angle](https://en.wikipedia.org/wiki/Euler_angles) made up of pitch, yaw, and roll components.
---
--- **WARNING**: This function is relatively expensive, in terms of performance, in situations where it is being called multiple times every frame (Like a loop, for example.) This is due to the overhead associated with object creation and garbage collection.
--- 	Where possible, it is generally better to store an [Angle](https://wiki.facepunch.com/gmod/Angle) in a variable and re-use that variable rather than re-creating it repeatedly.
--- 	In cases where an empty [Angle](https://wiki.facepunch.com/gmod/Angle) is needed, the global variable `angle_zero` is the preferred solution instead of `Angle( 0, 0, 0 )`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Angle)
---@param angle Angle Creates a new Angle that is a copy of the Angle passed in.
---@return Angle # The newly created Angle
function _G.Angle(angle) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates an [Angle](https://wiki.facepunch.com/gmod/Angle) object, representing a [Euler Angle](https://en.wikipedia.org/wiki/Euler_angles) made up of pitch, yaw, and roll components.
---
--- **WARNING**: This function is relatively expensive, in terms of performance, in situations where it is being called multiple times every frame (Like a loop, for example.) This is due to the overhead associated with object creation and garbage collection.
--- 	Where possible, it is generally better to store an [Angle](https://wiki.facepunch.com/gmod/Angle) in a variable and re-use that variable rather than re-creating it repeatedly.
--- 	In cases where an empty [Angle](https://wiki.facepunch.com/gmod/Angle) is needed, the global variable `angle_zero` is the preferred solution instead of `Angle( 0, 0, 0 )`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Angle)
---@param angleString string Attempts to parse the input string from the Global.print format of an Angle.
---
--- Returns an Angle with its pitch, yaw, and roll set to `0` if the string cannot be parsed.
---@return Angle # The newly created Angle
function _G.Angle(angleString) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an angle with a randomized pitch, yaw, and roll between min(inclusive), max(exclusive).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.AngleRand)
---@param min? number Min bound inclusive.
---@param max? number Max bound exclusive.
---@return Angle # The randomly generated angle.
function _G.AngleRand(min, max) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) If the result of the first argument is false or nil, an error is thrown with the second argument as the message.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.assert)
---@param expression any The expression to assert.
---@param errorMessage? string The error message to throw when assertion fails. This is only type-checked if the assertion fails.
---@param ...? any Any arguments past the error message will be returned by a successful assert.
---@return any # If successful, returns the first argument.
---@return any # If successful, returns the error message. This will be nil if the second argument wasn't specified.
---
--- Since the second argument is only type-checked if the assertion fails, this doesn't have to be a string.
---@return any ... # Returns any arguments past the error message.
function _G.assert(expression, errorMessage, ...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sends the specified Lua code to all connected clients and executes it.
--- **NOTE**: If you need to use this function more than once, consider using [net](https://wiki.facepunch.com/gmod/net) library.
--- 	Send net message and make the entire code you want to execute in [net.Receive](https://wiki.facepunch.com/gmod/net.Receive) on client.
--- 	If executed **clientside** it won't do anything.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.BroadcastLua)
---@param code string The code to be executed. Capped at length of 254 characters.
function _G.BroadcastLua(code) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Dumps the networked variables of all entities into one table and returns it.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.BuildNetworkedVarsTable)
---@return table # Format:
--- * key = Entity for NWVars or number (always 0) for global vars
--- * value = table formatted as:
---   * key = string var name
---   * value = any type var value
function _G.BuildNetworkedVarsTable() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to check if the current server the player is on can be added to favorites or not. Does not check if the server is ALREADY in the favorites.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CanAddServerToFavorites)
---@return boolean # Can add to favorites
function _G.CanAddServerToFavorites() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Aborts joining of the server you are currently joining.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CancelLoading)
function _G.CancelLoading() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Sets the active main menu background image to a random entry from the background images pool. Images are added with [Global.AddBackgroundImage](https://wiki.facepunch.com/gmod/Global.AddBackgroundImage).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ChangeBackground)
---@param currentgm string Apparently does nothing.
function _G.ChangeBackground(currentgm) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Automatically called by the engine when a panel is hovered over with the mouse
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ChangeTooltip)
---@param panel Panel Panel that has been hovered over
function _G.ChangeTooltip(panel) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Empties the pool of main menu background images.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ClearBackgroundImages)
function _G.ClearBackgroundImages() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Clears all Lua Errors with the given group id.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ClearLuaErrorGroup)
---@param group_id string group_id to remove. Will be "[addon-name]-0" or "Other-"
function _G.ClearLuaErrorGroup(group_id) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Removes the given Problem from the Problems table and refreshes the Problems panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ClearProblem)
---@param id string The Problem ID to remove
function _G.ClearProblem(id) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a non physical entity that only exists on the client. See also [ents.CreateClientProp](https://wiki.facepunch.com/gmod/ents.CreateClientProp) if physics is wanted.
---
--- Parented clientside models will become detached if the parent entity leaves the PVS. A workaround is available on the issue tracker page linked below.
---
--- Clientside entities are not garbage-collected, thus you must store a reference to the object (in a variable) and call [CSEnt:Remove](https://wiki.facepunch.com/gmod/CSEnt:Remove) manually when necessary.
---
--- Clientside models will occasionally delete themselves during high server lag.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ClientsideModel)
---@param model string The file path to the model.
---@param renderGroup? number The render group of the entity for the clientside leaf system, see Enums/RENDERGROUP.
---@return CSEnt|nil # Created client-side model (`C_BaseFlex`) or `nil` if creation of the entity failed for any reason.
function _G.ClientsideModel(model, renderGroup) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a fully clientside ragdoll.
---
--- **NOTE**: The ragdoll initially starts as hidden and with shadows disabled, see the example for how to enable it.
---
--- There's no need to call [Entity:Spawn](https://wiki.facepunch.com/gmod/Entity:Spawn) on this entity.
---
--- Clientside entities are not garbage-collected, thus you must store a reference to the object and call [CSEnt:Remove](https://wiki.facepunch.com/gmod/CSEnt:Remove) manually.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ClientsideRagdoll)
---@param model string The file path to the model.
---@param renderGroup? number The Enums/RENDERGROUP to assign.
---@return CSEnt # The newly created client-side only ragdoll. (`C_ClientRagdoll`)
function _G.ClientsideRagdoll(model, renderGroup) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a scene entity based on the scene name and the entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ClientsideScene)
---@param name string The name of the scene.
---@param targetEnt Entity The entity to play the scene on.
---@return CSEnt # C_SceneEntity
function _G.ClientsideScene(name, targetEnt) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Closes all Derma menus that have been passed to [Global.RegisterDermaMenuForClose](https://wiki.facepunch.com/gmod/Global.RegisterDermaMenuForClose) and calls [GM:CloseDermaMenus](https://wiki.facepunch.com/gmod/GM:CloseDermaMenus)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus)
function _G.CloseDermaMenus() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Executes the specified action on the garbage collector.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.collectgarbage)
---@param action? string The action to run.
---
--- Valid actions are `collect`, `stop`, `restart`, `count`, `step`, `setpause`, `setstepmul` and `isrunning`.
--- `isrunning` is only available on the x86-64 versions, because of the difference in the LuaJIT version. [See here](https://wiki.facepunch.com/gmod/jit.version)
---@param arg number The argument of the specified action, only applicable for `step`, `setpause` and `setstepmul`.
---@return any # If the action is count this is the number of kilobytes of memory used by Lua.
--- If the action is step this is true if a garbage collection cycle was finished.
---
--- If the action is setpause this is the previous value for the GC's pause.
--- If the action is setstepmul this is the previous value for the GC's step.
function _G.collectgarbage(action, arg) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a [Color](https://wiki.facepunch.com/gmod/Color).
--- 	**WARNING**: This function is relatively expensive when used in rendering hooks or in operations requiring very frequent calls (like loops for example) due to object creation and garbage collection. It is better to store the color in a variable or to use the [default colors](https://wiki.facepunch.com/gmod/Global_Variables#misc) available.
---
--- Here is a list of colors already cached by the game
---
--- Variable | Color (RGBA) |
--- -----|------------|
--- | color_white | Color(255, 255, 255, 255) |
--- | color_black | Color(0, 0, 255, 255) |
--- | color_transparent | Color(255, 255, 255, 0) |
---
--- 	**WARNING**: Under no circumstances should these variables be modified (by a Lerp or value modification). Some addons that use these values (e.g. color_white) will be affected by this change.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Color)
---@param r number An integer from `0-255` describing the red value of the color.
---@param g number An integer from `0-255` describing the green value of the color.
---@param b number An integer from `0-255` describing the blue value of the color.
---@param a? number An integer from `0-255` describing the alpha (transparency) of the color.(default 255)
---@return Color # The created Color.
function _G.Color(r, g, b, a) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a new [Color](https://wiki.facepunch.com/gmod/Color) with the RGB components of the given [Color](https://wiki.facepunch.com/gmod/Color) and the alpha value specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ColorAlpha)
---@param color table The Color from which to take RGB values. This color will not be modified.
---@param alpha number The new alpha value, a number between 0 and 255. Values above 255 will be clamped.
---@return table # The new Color with the modified alpha value
function _G.ColorAlpha(color, alpha) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a [Color](https://wiki.facepunch.com/gmod/Color) with randomized red, green, and blue components. If the alpha argument is true, alpha will also be randomized.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ColorRand)
---@param a? boolean Should alpha be randomized.
---@return table # The created Color.
function _G.ColorRand(a) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into HSL color space.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ColorToHSL)
---@param color table The Color.
---@return number # The hue in degrees `[0, 360]`.
---@return number # The saturation in the range `[0, 1]`.
---@return number # The lightness in the range `[0, 1]`.
function _G.ColorToHSL(color) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a [Color](https://wiki.facepunch.com/gmod/Color) into HSV color space.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ColorToHSV)
---@param color table The Color.
---@return number # The hue in degrees `[0, 360]`.
---@return number # The saturation in the range `[0, 1]`.
---@return number # The value in the range `[0, 1]`.
function _G.ColorToHSV(color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Attempts to compile the given file. If successful, returns a function that can be called to perform the actual execution of the script.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CompileFile)
---@param path string Path to the file, relative to the `garrysmod/lua/` directory.
---@param showError? boolean Decides whether or not a non-halting error should be thrown on compile failure.
---@return function # The function which executes the script.
function _G.CompileFile(path, showError) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) This function will compile the code argument as lua code and return a function that will execute that code.
---
--- Please note that this function will not automatically execute the given code after compiling it.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CompileString)
---@param code string The code to compile.
---@param identifier string An identifier in case an error is thrown. (The same identifier can be used multiple times)
---@param handleError? boolean If false this function will return an error string instead of throwing an error.
---@return function # A function that, when called, will execute the given code.
---
--- Returns the error string if there was a Lua error and third argument is false.
function _G.CompileString(code, identifier, handleError) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether a [ConVar](https://wiki.facepunch.com/gmod/ConVar) with the given name exists or not
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ConVarExists)
---@param name string Name of the ConVar.
---@return boolean # True if the ConVar exists, false otherwise.
function _G.ConVarExists(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Makes a clientside-only console variable
---
--- **NOTE**: This function is a wrapper of [Global.CreateConVar](https://wiki.facepunch.com/gmod/Global.CreateConVar), with the difference being that FCVAR_ARCHIVE and FCVAR_USERINFO are added automatically when **shouldsave** and **userinfo** are true, respectively.
---
--- Although this function is shared, it should only be used clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateClientConVar)
---@param name string Name of the ConVar to be created and able to be accessed.
---
--- This cannot be a name of existing console command or console variable. It will silently fail if it is.
---@param default string Default value of the ConVar.
---@param shouldsave? boolean Should the ConVar be saved across sessions in the cfg/client.vdf file.
---@param userinfo? boolean Should the ConVar and its containing data be sent to the server when it has changed. This makes the convar accessible from server using Player:GetInfoNum and similar functions.
---@param helptext? string Help text to display in the console.
---@param min? number If set, the convar cannot be changed to a number lower than this value.
---@param max? number If set, the convar cannot be changed to a number higher than this value.
---@return ConVar # Created convar.
function _G.CreateClientConVar(name, default, shouldsave, userinfo, helptext, min, max) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a ContextMenu.
--- 	**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateContextMenu)
function _G.CreateContextMenu() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a console variable ([ConVar](https://wiki.facepunch.com/gmod/ConVar)).
---
--- Generally these are used for settings, which can be stored automatically across sessions if desired. They are usually set via an accompanying user interface clientside, or listed somewhere for dedicated server usage, in which case they might be set via `server.cfg` on server start up.
---
--- 		**WARNING**: Do not use the FCVAR_NEVER_AS_STRING and FCVAR_REPLICATED flags together, as this can cause the console variable to have strange values on the client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateConVar)
---@param name string Name of the ConVar.
---
--- This cannot be a name of an engine console command or console variable. It will throw an error if it is. If it is the same name as another lua ConVar, it will return that ConVar object.
---@param value string Default value of the convar. Can also be a number.
---@param flags? FCVAR|number[] Flags of the convar, see Enums/FCVAR, either as bitflag or as table.
---@param helptext? string The help text to show in the console.
---@param min? number If set, the ConVar cannot be changed to a number lower than this value.
---@param max? number If set, the ConVar cannot be changed to a number higher than this value.
---@return ConVar # The convar created, or `nil` if convar could not be created. (such as when there's a console command with the same name)
---
--- If a ConVar already exists (including engine ones), it will simply return the already existing ConVar without modifying it in any way.
function _G.CreateConVar(name, value, flags, helptext, min, max) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a new material with the specified name and shader.
---
--- Materials created with this function can be used in [Entity:SetMaterial](https://wiki.facepunch.com/gmod/Entity:SetMaterial) and [Entity:SetSubMaterial](https://wiki.facepunch.com/gmod/Entity:SetSubMaterial) by prepending a `!` to their material name argument.
---
--- This will not create a new material if another material object with the same name already exists. All Materials created by this functions are cleaned up on map shutdown.
---
--- **NOTE**: This does not work with [patch materials](https://developer.valvesoftware.com/wiki/Patch).
---
--- .pngs must be loaded with [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) before being used with this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateMaterial)
---@param name string The material name. Must be unique.
---@param shaderName string The shader name. See Shaders.
---@param materialData table Key-value table that contains shader parameters and proxies.
---
--- * See: [List of Shader Parameters on Valve Developers Wiki](https://developer.valvesoftware.com/wiki/Category:List_of_Shader_Parameters) and each shader's page from .
---
--- Unlike [IMaterial:SetTexture](https://wiki.facepunch.com/gmod/IMaterial:SetTexture), this table will not accept [ITexture](https://wiki.facepunch.com/gmod/ITexture) values. Instead, use the texture's name (see [ITexture:GetName](https://wiki.facepunch.com/gmod/ITexture:GetName)).
---@return IMaterial # Created material
function _G.CreateMaterial(name, shaderName, materialData) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Creates a new Preset from the given JSON string.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateNewAddonPreset)
---@param data string A JSON string containing all necessary information.
--- 			JSON structue should be Structures/Preset
function _G.CreateNewAddonPreset(data) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new particle system. See also [Entity:CreateParticleEffect](https://wiki.facepunch.com/gmod/Entity:CreateParticleEffect), [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) and [Global.CreateParticleSystemNoEntity](https://wiki.facepunch.com/gmod/Global.CreateParticleSystemNoEntity).
---
--- **NOTE**: The particle effect must be precached with [Global.PrecacheParticleSystem](https://wiki.facepunch.com/gmod/Global.PrecacheParticleSystem) and the file its from must be added via [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) before it can be used!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem)
---@param ent Entity The entity to attach the control point to.
---@param effect string The name of the effect to create. It must be precached.
---@param partAttachment number See Enums/PATTACH.
---@param entAttachment? number The attachment ID on the entity to attach the particle system to
---@param offset? Vector The offset from the Entity:GetPos of the entity we are attaching this CP to.
---@return CNewParticleEffect # The created particle system.
function _G.CreateParticleSystem(ent, effect, partAttachment, entAttachment, offset) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new particle system, and sets control points 0 and 1 to given position, as well as optionally orientation of CP0 to the given angles. See also [Global.CreateParticleSystem](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem)
---
--- **NOTE**: The particle effect must be precached with [Global.PrecacheParticleSystem](https://wiki.facepunch.com/gmod/Global.PrecacheParticleSystem) and the file its from must be added via [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) before it can be used!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateParticleSystemNoEntity)
---@param effect string The name of the effect to create. It must be precached.
---@param pos Vector The position for the particle system.
---@param ang? Angle The orientation of the particle system.
---@return CNewParticleEffect # The created particle system.
function _G.CreateParticleSystemNoEntity(effect, pos, ang) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a new [PhysCollide](https://wiki.facepunch.com/gmod/PhysCollide) from the given bounds.
---
--- This fails to create planes or points - no components of the mins or maxs can be the same.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreatePhysCollideBox)
---@param mins Vector Min corner of the box. This is not automatically ordered with the maxs and must contain the smallest vector components. See Global.OrderVectors.
---@param maxs Vector Max corner of the box. This is not automatically ordered with the mins and must contain the largest vector components.
---@return PhysCollide # The new PhysCollide. This will be a NULL PhysCollide (PhysCollide:IsValid returns false) if given bad vectors or no more PhysCollides can be created in the physics engine.
function _G.CreatePhysCollideBox(mins, maxs) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates [PhysCollide](https://wiki.facepunch.com/gmod/PhysCollide) objects for every physics object the model has. The model must be precached with [util.PrecacheModel](https://wiki.facepunch.com/gmod/util.PrecacheModel) before being used with this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreatePhysCollidesFromModel)
---@param modelName string Model path to get the collision objects of.
---@return PhysCollide[] # Table of PhysCollide objects. The number of entries will match the model's physics object count. See also Entity:GetPhysicsObjectCount. Returns no value if the model doesn't exist, or has not been precached.
function _G.CreatePhysCollidesFromModel(modelName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a sound parented to the specified entity.
---
--- **NOTE**: You can only create one CSoundPatch per audio file, per entity at the same time.
---
--- **NOTE**: Valid sample rates: **11025 Hz, 22050 Hz and 44100 Hz**, otherwise you may see this kind of message:
---
--- `Unsupported 32-bit wave file your_sound.wav` and
--- `Invalid sample rate (48000) for sound 'your_sound.wav'`
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateSound)
---@param targetEnt Entity The target entity.
---@param soundName string The sound to play. (Sound path or a sound.Add) [Soundscript Characters](https://developer.valvesoftware.com/wiki/Soundscripts/en#Sound_Characters) are supported.
---@param filter? CRecipientFilter A CRecipientFilter of the players that will have this sound networked to them.
---
--- If not set, the default is a [CPASAttenuationFilter](https://developer.valvesoftware.com/wiki/CRecipientFilter#Derived_classes).
---
--- This argument only works serverside.
---@return CSoundPatch # The sound object. You should keep a reference to this object for as long as you wish the sound to play!
function _G.CreateSound(targetEnt, soundName, filter) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates and returns a new [DSprite](https://wiki.facepunch.com/gmod/DSprite) element with the supplied material.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CreateSprite)
---@param material IMaterial Material the sprite should draw.
---@return Panel # The new DSprite element.
function _G.CreateSprite(material) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the uptime of the server in seconds (to at least 4 decimal places)
---
--- This is a synchronised value and affected by various factors such as host_timescale (or [game.GetTimeScale](https://wiki.facepunch.com/gmod/game.GetTimeScale)) and the server being paused - either by `sv_pausable` or all players disconnecting.
---
--- You should use this function for timing in-game events but not for real-world events.
---
--- See also: [Global.RealTime](https://wiki.facepunch.com/gmod/Global.RealTime), [Global.SysTime](https://wiki.facepunch.com/gmod/Global.SysTime)
---
--- **NOTE**: This is internally defined as a float, and as such it will be affected by precision loss if your server uptime is more than 6 hours, which will cause jittery movement of players and props and inaccuracy of timers, it is highly encouraged to refresh or change the map when that happens (a server restart is not necessary).
---
--- This is **NOT** easy as it sounds to fix in the engine, so please refrain from posting issues about this
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.CurTime)
---@return number # Time synced with the game server.
function _G.CurTime() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an [CTakeDamageInfo](https://wiki.facepunch.com/gmod/CTakeDamageInfo) object.
---
--- This does not create a unique object, but instead returns a shared reference. That means you cannot use two or more of these objects at once.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DamageInfo)
---@return CTakeDamageInfo # The CTakeDamageInfo object.
function _G.DamageInfo() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes text to the right hand side of the screen, like the old error system. Messages disappear after a couple of seconds.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DebugInfo)
---@param slot number The location on the right hand screen to write the debug info to. Starts at 0, no upper limit
---@param info string The debugging information to be written to the screen
function _G.DebugInfo(slot, info) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Generates and provides a local variable `BaseClass` that can be used to call the original version of a class functions after modifying it.
---
--- This is a preprocessor keyword that is directly replaced with the following text:
--- ```lua
--- local BaseClass = baseclass.Get
--- ```
---
--- Because this is a simple preprocessor keyword and not a function, it will cause problems if not used properly
---
--- See [baseclass.Get](https://wiki.facepunch.com/gmod/baseclass.Get) for more information.
--- 	**WARNING**: The preprocessor is not smart enough to know when substitution doesn't make sense, such as: table keys and strings.
---
--- Running `print("DEFINE_BASECLASS")` is the same as `print("local BaseClass = baseclass.Get")`
---
--- For more information, including usage examples, see the [BaseClasses](https://wiki.facepunch.com/gmod/BaseClasses) reference page.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DEFINE_BASECLASS)
---@param value string Baseclass name
function _G.DEFINE_BASECLASS(value) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Deletes the given Preset.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DeleteAddonPreset)
---@param name string The name of the Preset to delete.
function _G.DeleteAddonPreset(name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Loads and registers the specified gamemode, setting the GM table's DerivedFrom field to the value provided, if the table exists. The DerivedFrom field is used post-gamemode-load as the "derived" parameter for [gamemode.Register](https://wiki.facepunch.com/gmod/gamemode.Register). See  [Gamemode_Creation#derivinggamemodes](https://wiki.facepunch.com/gmod/Gamemode_Creation#derivinggamemodes) for more information about deriving gamemodes.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DeriveGamemode)
---@param base string Gamemode name to derive from.
function _G.DeriveGamemode(base) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a new derma animation.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Derma_Anim)
---@param name string Name of the animation to create
---@param panel Panel Panel to run the animation on
---@param func fun(pnl: Panel, anim: table, delta: number, data: any) Function to call to process the animation
---
--- Function argument(s):
--- * Panel `pnl` - the panel passed to Derma_Anim
--- * table `anim` - the anim table
--- * number `delta` - the fraction of the progress through the animation
--- * any `data` - optional data passed to the run metatable method
---@return table # A lua metatable containing four methods:
--- * Run() - Should be called each frame you want the animation to be ran.
--- * Active() - Returns if the animation is currently active (has not finished and stop has not been called)
--- * Stop() - Halts the animation at its current progress.
--- * Start( Length, Data ) - Prepares the animation to be ran for Length seconds. Must be called once before calling Run(). The data parameter will be passed to the func function.
function _G.Derma_Anim(name, panel, func) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Draws background blur around the given panel.
--- 		**NOTE**: Calling this on the same [Panel](https://wiki.facepunch.com/gmod/Panel) multiple times makes the blur darker.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Derma_DrawBackgroundBlur)
---@param panel Panel Panel to draw the background blur around
---@param startTime number Time that the blur began being painted
function _G.Derma_DrawBackgroundBlur(panel, startTime) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates panel method that calls the supplied Derma skin hook via [derma.SkinHook](https://wiki.facepunch.com/gmod/derma.SkinHook)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Derma_Hook)
---@param panel Panel Panel to add the hook to
---@param functionName string Name of panel function to create
---@param hookName string Name of Derma skin hook to call within the function
---@param typeName string Type of element to call Derma skin hook for
function _G.Derma_Hook(panel, functionName, hookName, typeName) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Makes the panel (usually an input of sorts) respond to changes in console variables by adding next functions to the panel:
--- * [Panel:SetConVar](https://wiki.facepunch.com/gmod/Panel:SetConVar)
--- * [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged)
--- * [Panel:ConVarStringThink](https://wiki.facepunch.com/gmod/Panel:ConVarStringThink)
--- * [Panel:ConVarNumberThink](https://wiki.facepunch.com/gmod/Panel:ConVarNumberThink)
---
--- The console variable value is saved in the `m_strConVar` property of the panel.
---
--- The panel should call
--- [Panel:ConVarStringThink](https://wiki.facepunch.com/gmod/Panel:ConVarStringThink) or
--- [Panel:ConVarNumberThink](https://wiki.facepunch.com/gmod/Panel:ConVarNumberThink)
--- in its [PANEL:Think](https://wiki.facepunch.com/gmod/PANEL:Think) hook and should call [Panel:ConVarChanged](https://wiki.facepunch.com/gmod/Panel:ConVarChanged) when the panel's value has changed.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Derma_Install_Convar_Functions)
---@param target Panel The panel the functions should be added to.
function _G.Derma_Install_Convar_Functions(target) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a derma window to display information
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Derma_Message)
---@param Text string The text within the created panel.
---@param Title string The title of the created panel.
---@param Button string The text of the button to close the panel.
---@return Panel # The created DFrame
function _G.Derma_Message(Text, Title, Button) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Shows a message box in the middle of the screen, with up to 4 buttons they can press.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Derma_Query)
---@param text? string The message to display.
---@param title? string The title to give the message box.
---@param btn1text string The text to display on the first button.
---@param btn1func? function The function to run if the user clicks the first button.
---@param btn2text? string The text to display on the second button.
---@param btn2func? function The function to run if the user clicks the second button.
---@param btn3text? string The text to display on the third button
---@param btn3func? function The function to run if the user clicks the third button.
---@param btn4text? string The text to display on the fourth button
---@param btn4func? function The function to run if the user clicks the fourth button.
---@return Panel # The Panel object of the created window.
function _G.Derma_Query(text, title, btn1text, btn1func, btn2text, btn2func, btn3text, btn3func, btn4text, btn4func) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a derma window asking players to input a string.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Derma_StringRequest)
---@param title string The title of the created panel.
---@param subtitle string The text above the input box.
---@param default string The default text for the input box.
---@param confirm fun(text: string) The function to be called once the user has confirmed their input.
---
--- Function argument(s):
--- * string `text` - The text the player entered.
---@param cancel? fun(text: string) The function to be called once the user has cancelled their input.
---
--- Function argument(s):
--- * string `text` - The text the player entered.
---@param confirmText? string Allows you to override text of the "OK" button
---@param cancelText? string Allows you to override text of the "Cancel" button
---@return Panel # The created DFrame
function _G.Derma_StringRequest(title, subtitle, default, confirm, cancel, confirmText, cancelText) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a DMenu and closes any current menus.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DermaMenu)
---@param keepOpen? boolean If we should keep other DMenus open (`true`) or not (`false`).
---@param parent? Panel The panel to parent the created menu to.
---@return DMenu #The created DMenu.
function _G.DermaMenu(keepOpen, parent) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether rendering should be limited to being inside a panel or not. Needs to be used inside one of the [2d rendering hooks](https://wiki.facepunch.com/gmod/2d_rendering_hooks)
---
--- See also [Panel:NoClipping](https://wiki.facepunch.com/gmod/Panel:NoClipping).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DisableClipping)
---@param disable boolean Whether or not clipping should be disabled
---@return boolean # Whether the clipping was enabled or not before this function call
function _G.DisableClipping(disable) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Cancels current DOF post-process effect started with [Global.DOF_Start](https://wiki.facepunch.com/gmod/Global.DOF_Start)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DOF_Kill)
function _G.DOF_Kill() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Cancels any existing DOF post-process effects.
--- Begins the DOF post-process effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DOF_Start)
function _G.DOF_Start() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) A hacky method used to fix some bugs regarding DoF. What this basically does it force all `C_BaseAnimating` entities to have the translucent [rendergroup](https://wiki.facepunch.com/gmod/Enums/RENDERGROUP), even if they use opaque or two-pass models.
---
--- This is specifically to do with [GM:NeedsDepthPass](https://wiki.facepunch.com/gmod/GM:NeedsDepthPass)
---
--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DOFModeHack)
---@param enable boolean Enables or disables depth-of-field mode
function _G.DOFModeHack(enable) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Stops searching for new servers in the given category
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DoStopServers)
---@param category string The category to stop searching in. **Working Values: internet, favorite, history, lan**
function _G.DoStopServers(category) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Draws the currently active main menu background image and handles transitioning between background images.
---
--- This is called by default in the menu panel's Paint hook.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawBackground)
function _G.DrawBackground() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the bloom shader, which creates a glowing effect from bright objects.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawBloom)
---@param Darken number Determines how much to darken the effect. A lower number will make the glow come from lower light levels. A value of `1` will make the bloom effect unnoticeable. Negative values will make even pitch black areas glow.
---@param Multiply number Will affect how bright the glowing spots are. A value of `0` will make the bloom effect unnoticeable.
---@param SizeX number The size of the bloom effect along the horizontal axis.
---@param SizeY number The size of the bloom effect along the vertical axis.
---@param Passes number Determines how much to exaggerate the effect.
---@param ColorMultiply number Will multiply the colors of the glowing spots, making them more vivid.
---@param Red number How much red to multiply with the glowing color. Should be between `0` and `1`.
---@param Green number How much green to multiply with the glowing color. Should be between `0` and `1`.
---@param Blue number How much blue to multiply with the glowing color. Should be between `0` and `1`.
function _G.DrawBloom(Darken, Multiply, SizeX, SizeY, Passes, ColorMultiply, Red, Green, Blue) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the Bokeh Depth Of Field effect .
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawBokehDOF)
---@param intensity number Intensity of the effect.
---@param distance number **Not worldspace distance**. Value range is from `0` to `1`.
---@param focus number Focus. Recommended values are from 0 to 12.
function _G.DrawBokehDOF(intensity, distance, focus) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the Color Modify shader, which can be used to adjust colors on screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawColorModify)
---@param modifyParameters table Color modification parameters. See Shaders/g_colourmodify and the example below. Note that if you leave out a field, it will retain its last value which may have changed if another caller uses this function.
function _G.DrawColorModify(modifyParameters) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws a material overlay on the screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawMaterialOverlay)
---@param Material string This will be the material that is drawn onto the screen.
---@param RefractAmount number This will adjust how much the material will refract your screen.
function _G.DrawMaterialOverlay(Material, RefractAmount) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a motion blur effect by drawing your screen multiple times.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawMotionBlur)
---@param AddAlpha number How much alpha to change per frame.
---@param DrawAlpha number How much alpha the frames will have. A value of 0 will not render the motion blur effect.
---@param Delay number Determines the amount of time between frames to capture.
function _G.DrawMotionBlur(AddAlpha, DrawAlpha, Delay) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the sharpen shader, which creates more contrast.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawSharpen)
---@param Contrast number How much contrast to create.
---@param Distance number How large the contrast effect will be.
function _G.DrawSharpen(Contrast, Distance) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the sobel shader, which detects edges and draws a black border.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawSobel)
---@param Threshold number Determines the threshold of edges. A value of `0` will make your screen completely black.
function _G.DrawSobel(Threshold) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders the post-processing effect of beams of light originating from the map's sun. Utilises the `pp/sunbeams` material.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawSunbeams)
---@param darken number `$darken` property for sunbeams material.
---@param multiplier number `$multiply` property for sunbeams material.
---@param sunSize number `$sunsize` property for sunbeams material.
---@param sunX number `$sunx` property for sunbeams material.
---@param sunY number `$suny` property for sunbeams material.
function _G.DrawSunbeams(darken, multiplier, sunSize, sunX, sunY) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the texturize shader, which replaces each pixel on your screen with a different part of the texture depending on its brightness. See [g_texturize](https://wiki.facepunch.com/gmod/Shaders/g_texturize) for information on making the texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawTexturize)
---@param Scale number Scale of the texture. A smaller number creates a larger texture.
---@param BaseTexture number This will be the texture to use in the effect. Make sure you use Global.Material to get the texture number.
function _G.DrawTexturize(Scale, BaseTexture) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Draws the toy town shader, which blurs the top and bottom of your screen. This can make very large objects look like toys, hence the name.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DrawToyTown)
---@param Passes number An integer determining how many times to draw the effect. A higher number creates more blur.
---@param Height number The amount of screen which should be blurred on the top and bottom.
function _G.DrawToyTown(Passes, Height) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Drops the specified entity if it is being held by any player with Gravity Gun, Physics Gun or `+use` pickup.
---
--- See also [Player:DropObject](https://wiki.facepunch.com/gmod/Player:DropObject) and [Entity:ForcePlayerDrop](https://wiki.facepunch.com/gmod/Entity:ForcePlayerDrop).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DropEntityIfHeld)
---@param ent Entity The entity to drop.
---@deprecated You really should be using Entity:ForcePlayerDrop, which does the same thing.
function _G.DropEntityIfHeld(ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Calls all NetworkVarNotify functions of the given entity with the given new value, but doesn't change the real value.
--- internally uses [Entity:CallDTVarProxies](https://wiki.facepunch.com/gmod/Entity:CallDTVarProxies)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DTVar_ReceiveProxyGL)
---@param entity Entity The Entity to run the NetworkVarNotify functions from.
---@param Type string The NetworkVar Type.
--- * `String`
--- * `Bool`
--- * `Float`
--- * `Int` (32-bit signed integer)
--- * `Vector`
--- * `Angle`
--- * `Entity`
---@param index number The NetworkVar index.
---@param newValue any The new value.
function _G.DTVar_ReceiveProxyGL(entity, Type, index, newValue) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates or replaces a dynamic light with the given id.
---
--- **NOTE**: Only 32 dlights and 64 elights can be active at once.
---
--- **WARNING**: It is not safe to hold a reference to this object after creation since its data can be replaced by another dlight at any time.
---
--- The minlight parameter affects the world and entities differently.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DynamicLight)
---@param index number An unsigned Integer. Usually an Entity:EntIndex is used here.
---@param elight? boolean Allocates an elight instead of a dlight. Elights have a higher light limit and do not light the world (making the "noworld" parameter have no effect).
---@return table # A DynamicLight structured table. See Structures/DynamicLight
function _G.DynamicLight(index, elight) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Creates a dynamic Material from the given materialPath
--- **WARNING**: This function should never be used in a Rendering Hook because it creates a new dynamic material every time and can fill up your vram.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.DynamicMaterial)
---@param materialPath string The material with path. The path is relative to the `materials/` folder.
---@param flags? string Some bind of bits / byte.
--- 		What does this argument do / use. Currently working value: "0100010" --nocull smooth
---@return IMaterial # Generated material.
function _G.DynamicMaterial(materialPath, flags) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a [CEffectData](https://wiki.facepunch.com/gmod/CEffectData) object to be used with [util.Effect](https://wiki.facepunch.com/gmod/util.Effect).
---
--- This does not create a unique object, but instead returns a shared reference. That means you cannot use two or more of these objects at once.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.EffectData)
---@return CEffectData # The CEffectData object.
function _G.EffectData() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) An [eagerly evaluated](https://en.wikipedia.org/wiki/Eager_evaluation) [ternary operator](https://en.wikipedia.org/wiki/%3F:), or, in layman's terms, a compact "if then else" statement.
---
--- In most cases, you should just use Lua's ["pseudo" ternary operator](https://en.wikipedia.org/wiki/%3F:#Lua), like this:
---
--- ```
--- local myCondition = true
--- local consequent = "myCondition is true"
--- local alternative = "myCondition is false"
---
--- print(myCondition and consequent or alternative)
--- ```
---
--- In the above example, due to [short-circuit evaluation](https://en.wikipedia.org/wiki/Short-circuit_evaluation), `consequent` would be "skipped" and ignored (not evaluated) by Lua due to `myCondition` being `true`, and only `alternative` would be evaluated. However, when using `Either`, both `consequent` and `alternative` would be evaluated. A practical example of this can be found at the bottom of the page.
---
--- # Falsey values
---
--- If `consequent` is "falsey" (Lua considers both `false` and `nil` as false), this will not work. For example:
---
--- ```
--- local X = true
--- local Y = false
--- local Z = "myCondition is false"
---
--- print(X and Y or Z)
--- ```
---
--- This will actually print the value of `Z`.
---
--- In the above case, and other very rare cases, you may find `Either` useful.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Either)
---@param condition any The condition to check if true or false.
---@param truevar any If the condition isn't nil/false, returns this value.
---@param falsevar any If the condition is nil/false, returns this value.
---@return any # The result.
function _G.Either(condition, truevar, falsevar) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Plays a sentence from `scripts/sentences.txt`
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.EmitSentence)
---@param soundName string The sound to play
---@param position Vector The position to play at
---@param entity number The entity to emit the sound from. Must be Entity:EntIndex
---@param channel? number The sound channel, see Enums/CHAN.
---@param volume? number The volume of the sound, from 0 to 1
---@param soundLevel? number The sound level of the sound, see Enums/SNDLVL
---@param soundFlags? number The flags of the sound, see Enums/SND
---@param pitch? number The pitch of the sound, 0-255
function _G.EmitSentence(soundName, position, entity, channel, volume, soundLevel, soundFlags, pitch) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Emits the specified sound at the specified position. See also [Entity:EmitSound](https://wiki.facepunch.com/gmod/Entity:EmitSound) if you wish to play sounds on a specific entity.
---
--- **NOTE**: Valid 16 bit sample rates: **11025 Hz, 22050 Hz and 44100 Hz**, otherwise you may see this kind of message:
---
--- `Unsupported 32-bit wave file your_sound.wav` and
--- `Invalid sample rate (48000) for sound 'your_sound.wav'`
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.EmitSound)
---@param soundName string The sound to play
---
--- This should either be a sound script name (sound.Add) or a file path relative to the `sound/` folder. (Make note that it's not sound**s**)
---@param position Vector The position where the sound is meant to play, which is also used for a network filter (`CPASAttenuationFilter`) to decide which players will hear the sound.
---@param entity? number The entity to emit the sound from. Can be an Entity:EntIndex or one of the following:
--- * `0` - Plays sound on the world (position set to `0,0,0`)
--- * `-1` - Plays sound on the local player (on server acts as `0`)
--- * `-2` - Plays UI sound (position set to `0,0,0`, no spatial sound, on server acts as `0`)
---@param channel? CHAN The sound channel, see Enums/CHAN.
---@param volume? number The volume of the sound, from 0 to 1
---@param soundLevel? SNDLVL The sound level of the sound, see Enums/SNDLVL
---@param soundFlags? SND The flags of the sound, see Enums/SND
---@param pitch? number The pitch of the sound, 0-255
---@param dsp? number The DSP preset for this sound. [List of DSP presets](https://developer.valvesoftware.com/wiki/Dsp_presets)
---@param filter? CRecipientFilter If set serverside, the sound will only be networked to the clients in the filter.
function _G.EmitSound(soundName, position, entity, channel, volume, soundLevel, soundFlags, pitch, dsp, filter) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Removes the currently active tool tip from the screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.EndTooltip)
---@param panel Panel This is the panel that has a tool tip.
function _G.EndTooltip(panel) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the entity with the matching [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex).
---
--- Indices `1` through [game.MaxPlayers](https://wiki.facepunch.com/gmod/game.MaxPlayers)() are always reserved for players.
---
--- **NOTE**: In examples on this wiki, `Entity( 1 )` is used when a player entity is needed (see ). In singleplayer and listen servers, `Entity( 1 )` will always be the first player. In dedicated servers, however, `Entity( 1 )` won't always be a valid player if there is no one currently on the server.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Entity)
---@param entityIndex number The entity index.
---@return Entity # The entity if it exists, or `NULL` if it doesn't.
function _G.Entity(entityIndex) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Throws an error. This is currently an alias of [Global.ErrorNoHalt](https://wiki.facepunch.com/gmod/Global.ErrorNoHalt) despite it once throwing a halting error like [error](https://wiki.facepunch.com/gmod/Global.error(lowercase)) without the stack trace appended.
---
--- This function throws a non-halting error instead of a halting error.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Error)
---@param ... any Converts all arguments to strings and prints them with no spacing or line breaks.
function _G.Error(...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Throws a Lua error and breaks out of the current call stack.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.error(lowercase))
---@param message string The error message to throw.
---@param errorLevel? number The level to throw the error at.
function _G.error(message, errorLevel) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Throws a Lua error but does not break out of the current call stack.
--- This function will not print a stack trace like a normal error would.
--- Essentially similar if not equivalent to [Global.Msg](https://wiki.facepunch.com/gmod/Global.Msg).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ErrorNoHalt)
---@param ... any Converts all arguments to strings and prints them with no spacing.
function _G.ErrorNoHalt(...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Throws a Lua error but does not break out of the current call stack.
---
--- This function will print a stack trace like a normal error would.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ErrorNoHaltWithStack)
---@param ... any Converts all arguments to strings and prints them with no spacing.
function _G.ErrorNoHaltWithStack(...) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the angles of the current render context as calculated by [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView).
---
--- This function is only reliable inside rendering hooks.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.EyeAngles)
---@return Angle # The angle of the currently rendered scene.
function _G.EyeAngles() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the origin of the current render context as calculated by [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView).
---
--- This function is only reliable inside rendering hooks.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.EyePos)
---@return Vector # Camera position.
function _G.EyePos() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the normal vector of the current render context as calculated by [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView), similar to [Global.EyeAngles](https://wiki.facepunch.com/gmod/Global.EyeAngles).
---
--- This function is only reliable inside rendering hooks.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.EyeVector)
---@return Vector # View direction of the currently rendered scene.
function _G.EyeVector() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the meta table for the class with the matching name.
---
--- You can learn more about meta tables on the [Meta Tables](https://wiki.facepunch.com/gmod/Meta_Tables) page.
---
--- You can find a list of meta tables that can be retrieved with this function on [Enums/TYPE](https://wiki.facepunch.com/gmod/Enums/TYPE). The name in the description is the string to use with this function.
---
--- Custom meta tables should be registered via [Global.RegisterMetaTable](https://wiki.facepunch.com/gmod/Global.RegisterMetaTable).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.FindMetaTable)
---@param metaName string The object type to retrieve the meta table of.
---@return table|nil # The corresponding meta table or `nil` if it doesn't exist.
function _G.FindMetaTable(metaName) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the tool-tip text and tool-tip-panel (if any) of the given panel as well as itself
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.FindTooltip)
---@param panel Panel Panel to find tool-tip of
---@return string # tool-tip text
---@return Panel # tool-tip panel
---@return Panel # panel that the function was called with
function _G.FindTooltip(panel) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Refreshes all Addon Conflicts and Fires a Problem. Internally uses [Global.FireProblem](https://wiki.facepunch.com/gmod/Global.FireProblem)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.FireAddonConflicts)
function _G.FireAddonConflicts() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Creates a problem from the given definition.
---
--- **NOTE**: Existing problems with the same Id will be replaced / overridden.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.FireProblem)
---@param problem Problem The problem's definition.
function _G.FireProblem(problem) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: Internally uses [Global.FireProblem](https://wiki.facepunch.com/gmod/Global.FireProblem) to create / fire the Problem.
---
--- This function is called from the engine to notify the player about a problem in a more user friendly way compared to a console message.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.FireProblemFromEngine)
---@param id string The Problem ID.
---@param severity number The Problem severity.
---@param params string Additional Parameters.
function _G.FireProblemFromEngine(id, severity, params) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Formats the specified values into the string given. Same as [string.format](https://wiki.facepunch.com/gmod/string.format).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Format)
---@param format string The string to be formatted.
--- Follows this format: http://www.cplusplus.com/reference/cstdio/printf/
---@param ... any Values to be formatted into the string.
---@return string # The formatted string
function _G.Format(format, ...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the number of frames rendered since the game was launched.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.FrameNumber)
function _G.FrameNumber() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime)-based time in seconds it took to render the last frame.
---
--- This should be used for frame/tick based timing, such as movement prediction or animations.
---
--- For real-time-based frame time that isn't affected by `host_timescale`, use [Global.RealFrameTime](https://wiki.facepunch.com/gmod/Global.RealFrameTime). RealFrameTime is more suited for things like GUIs or HUDs.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.FrameTime)
---@return number # time (in seconds)
function _G.FrameTime() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Callback function for when the client has joined a server. This function shows the server's loading URL by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GameDetails)
---@param servername string Server's name.
---@param serverurl string Server's loading screen URL, or "" if the URL is not set.
---@param mapname string Server's current map's name.
---@param maxplayers number Max player count of server.
---@param steamid string The local player's Player:SteamID64.
---@param gamemode string Server's current gamemode's folder name.
function _G.GameDetails(servername, serverurl, mapname, maxplayers, steamid, gamemode) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the current floored dynamic memory usage of Lua in kilobytes.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.gcinfo)
---@return number # The current floored dynamic memory usage of Lua, in kilobytes.
---@deprecated This function was deprecated in Lua 5.1 and is removed in Lua 5.2. Use Global.collectgarbage( "count" ) instead.
function _G.gcinfo() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) This function adds all models from a specified folder to a custom Spawnlist category. Internally uses [Global.AddPropsOfParent](https://wiki.facepunch.com/gmod/Global.AddPropsOfParent)
--- 	**WARNING**: Using this function before [SANDBOX:PopulateContent](https://wiki.facepunch.com/gmod/SANDBOX:PopulateContent) has been called will result in an error
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GenerateSpawnlistFromPath)
---@param folder string the folder to search for models
---@param path string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@param name string The Spawnmenu Category name
---@param icon? string The Spawnmenu Category Icon to use
---@param appid number The AppID which is needed for the Content
---@deprecated This function is only available locally and cannot be used outside the gameprops.lua file.
function _G.GenerateSpawnlistFromPath(folder, path, name, icon, appid) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns if the game was started with either -noaddons or -noworkshop
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetAddonStatus)
---@return boolean # true if the game was started with -noaddons. (see Command_Line_Parameters)
---@return boolean # true if the game was started with -noworkshop. (see Command_Line_Parameters)
function _G.GetAddonStatus() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Gets miscellaneous information from Facepunches API.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetAPIManifest)
---@param callback fun(data: string) Callback to be called when the API request is done.
---
--- Function argument(s):
--- * string `data` - JSON encoded data, see util.JSONToTable.
---
---
--- Formatted output:
--- ```js
--- {
--- 	"ManifestVersion": 	number - Version of the manifest
--- 	"Date": 			string - Date the data was retrieved
---
--- 	// Contains all the blog posts, the things in the top right of the menu
--- 	"News": {
--- 		"Blogs": [
---
--- // Structure of blog posts
--- {
--- 	"Date": 		string - Date the post was created
--- 	"ShortName": 	string - Short name of the post, identifier of it on the blog website
--- 	"Title": 		string - Title of the post
--- 	"HeaderImage": 	string - Main image of the post, showed in the top right
--- 	"SummaryHtml": 	string - Summary of the blogpost, text thats shown to the user
--- 	"Url": 			string - URL to the post on the blog
--- 	"Tags": 		string - String of the posts tag
--- }
--- 		]
--- 	}
---
--- 	// Array of Facepunches Mods, Admins and Developers
--- 	"Administrators": [
--- 		{
--- "UserId": 		string - SteamID64 of the person
--- "Level": 		string - Level of the user (Administrator, Developer or Moderator)
--- 		}
--- 	]
---
--- 	// Unused and contains nothing useful
--- 	"Heroes": {}
---
--- 	"SentryUrl": 		string - Nothing
--- 	"DatabaseUrl" 		string - URL to the Facepunch API (/database/{action}/)
--- 	"FeedbackUrl" 		string - URL to the Facepunch API (/feedback/add/)
--- 	"ReportUrl" 		string - URL to the Facepunch API (/feedback/report/)
--- 	"LeaderboardUrl" 	string - URL to the Facepunch API (/leaderboard/{action}/)
--- 	"BenchmarkUrl" 		string - URL to the Facepunch API (/benchmark/add/)
--- 	"AccountUrl" 		string - URL to the Facepunch API (/account/{action}/)
---
--- 	"Servers": {
--- 		"Official": [] // Nothing
---
--- 		// List of blacklisted servers
--- 		"Banned": [
--- string 	- IP of the blacklisted server
--- 		]
--- 	}
--- }
--- ```
function _G.GetAPIManifest(callback) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the [ConVar](https://wiki.facepunch.com/gmod/ConVar) with the specified name.
---
--- **NOTE**: This function uses [Global.GetConVar_Internal](https://wiki.facepunch.com/gmod/Global.GetConVar_Internal) internally, but caches the result in Lua for quicker lookups.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetConVar)
---@param name string Name of the ConVar to get
---@return ConVar # The ConVar object, or nil if no such ConVar was found.
function _G.GetConVar(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- **WARNING**: This function is very slow and not recommended. See [Global.GetConVar](https://wiki.facepunch.com/gmod/Global.GetConVar) for an example on how to properly store the return of what you're using so you can avoid using this function as much as possible.
---
--- Gets the ConVar with the specified name. This function doesn't cache the convar.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetConVar_Internal)
---@param name string Name of the ConVar to get
---@return ConVar # The ConVar object
function _G.GetConVar_Internal(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the numeric value ConVar with the specified name.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetConVarNumber)
---@param name string Name of the ConVar to get.
---@return number # The ConVar's value.
---@deprecated Store the ConVar object retrieved with Global.GetConVar and call ConVar:GetInt or ConVar:GetFloat on it.
function _G.GetConVarNumber(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the string value ConVar with the specified name.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetConVarString)
---@param name string Name of the ConVar to get.
---@return string # The ConVar's value.
---@deprecated Store the ConVar object retrieved with Global.GetConVar and call ConVar:GetString on it.
function _G.GetConVarString(name) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns the default loading screen URL (asset://garrysmod/html/loading.html)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetDefaultLoadingHTML)
---@return string # Default loading url (asset://garrysmod/html/loading.html)
function _G.GetDefaultLoadingHTML() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Retrieves data about the demo with the specified filename. Similar to [Global.GetSaveFileDetails](https://wiki.facepunch.com/gmod/Global.GetSaveFileDetails).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetDemoFileDetails)
---@param filename string The file name of the demo.
---@return table # Demo data.
function _G.GetDemoFileDetails(filename) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns a table with the names of files needed from the server you are currently joining.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetDownloadables)
---@return string[] # table of file names
function _G.GetDownloadables() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the environment table of either the stack level or the function specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.getfenv)
---@param location? function The object to get the enviroment from. Can also be a number that specifies the function at that stack level: Level 1 is the function calling getfenv. Level 0 is the base Garry's Mod environment (_G).
---@return table # The environment.
function _G.getfenv(location) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an angle that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2Angle)
---@param index string The unique index to identify the global value with.
---@param default? Angle The value to return if the global value is not set.
---@return Angle # The global value, or default if the global is not set.
function _G.GetGlobal2Angle(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a boolean that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2Bool)
---@param index string The unique index to identify the global value with.
---@param default? boolean The value to return if the global value is not set.
---@return boolean # The global value, or the default if the global value is not set.
function _G.GetGlobal2Bool(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an entity that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2Entity)
---@param index string The unique index to identify the global value with.
---@param default? Entity The value to return if the global value is not set.
---@return Entity # The global value, or the default if the global value is not set.
function _G.GetGlobal2Entity(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a float that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2Float)
---@param index string The unique index to identify the global value with.
---@param default? number The value to return if the global value is not set.
---@return number # The global value, or the default if the global value is not set.
function _G.GetGlobal2Float(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an integer that is shared between the server and all clients.
---
--- **WARNING**: The integer has a 32 bit limit. Use [Global.GetGlobalInt](https://wiki.facepunch.com/gmod/Global.GetGlobalInt) for a higher limit
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2Int)
---@param index string The unique index to identify the global value with.
---@param default? number The value to return if the global value is not set.
---@return number # The global value, or the default if the global value is not set.
function _G.GetGlobal2Int(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a string that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2String)
---@param index string The unique index to identify the global value with.
---@param default? string The value to return if the global value is not set.
---@return string # The global value, or the default if the global value is not set.
function _G.GetGlobal2String(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a value that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2Var)
---@param index string The unique index to identify the global value with.
---@param default? any The value to return if the global value is not set.
---@return any # The global value, or the default if the global value is not set.
function _G.GetGlobal2Var(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a vector that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobal2Vector)
---@param Index string The unique index to identify the global value with.
---@param Default Vector The value to return if the global value is not set.
---@return Vector # The global value, or the default if the global value is not set.
function _G.GetGlobal2Vector(Index, Default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an angle that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalAngle)
---@param index string The unique index to identify the global value with.
---@param default Angle The value to return if the global value is not set.
---@return Angle # The global value, or default if the global is not set.
function _G.GetGlobalAngle(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a boolean that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalBool)
---@param index string The unique index to identify the global value with.
---@param default? boolean The value to return if the global value is not set.
---@return boolean # The global value, or the default if the global value is not set.
function _G.GetGlobalBool(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an entity that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalEntity)
---@param index string The unique index to identify the global value with.
---@param default? Entity The value to return if the global value is not set.
---@return Entity # The global value, or the default if the global value is not set.
function _G.GetGlobalEntity(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a float that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalFloat)
---@param index string The unique index to identify the global value with.
---@param default? number The value to return if the global value is not set.
---@return number # The global value, or the default if the global value is not set.
function _G.GetGlobalFloat(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an integer that is shared between the server and all clients.
---
--- This function will not round decimal values as it actually networks a float internally.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalInt)
---@param index string The unique index to identify the global value with.
---@param default? number The value to return if the global value is not set.
---@return number # The global value, or the default if the global value is not set.
function _G.GetGlobalInt(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a string that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalString)
---@param index string The unique index to identify the global value with.
---@param default? string The value to return if the global value is not set.
---@return string # The global value, or the default if the global value is not set.
function _G.GetGlobalString(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a value that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalVar)
---@param index string The unique index to identify the global value with.
---@param default? any The value to return if the global value is not set.
---@return any # The global value, or the default if the global value is not set.
function _G.GetGlobalVar(index, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a vector that is shared between the server and all clients.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetGlobalVector)
---@param Index string The unique index to identify the global value with.
---@param Default Vector The value to return if the global value is not set.
---@return Vector # The global value, or the default if the global value is not set.
function _G.GetGlobalVector(Index, Default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the name of the current server.
---
--- **NOTE**: GetHostName returns information from [ConVar](https://wiki.facepunch.com/gmod/ConVars_In_Garrysmod#cvarlistdump) hostname
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetHostName)
---@return string # The name of the server.
function _G.GetHostName() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the panel that is used as a wrapper for the HUD. If you want your panel to be hidden when the main menu is opened, parent it to this. Child panels will also have their controls disabled.
---
--- See also [vgui.GetWorldPanel](https://wiki.facepunch.com/gmod/vgui.GetWorldPanel)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetHUDPanel)
---@return Panel # The HUD panel
function _G.GetHUDPanel() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns the loading screen panel and creates it if it doesn't exist.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetLoadPanel)
---@return Panel # The loading screen panel
function _G.GetLoadPanel() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns the current status of the server join progress.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetLoadStatus)
---@return string # The current status
function _G.GetLoadStatus() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns a table with the names of all maps and categories that you have on your client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetMapList)
---@return table # Table of map names and categories.
function _G.GetMapList() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the metatable of an object. This function obeys the metatable's __metatable field, and will return that field if the metatable has it set.
---
--- Use [debug.getmetatable](https://wiki.facepunch.com/gmod/debug.getmetatable) if you want the true metatable of the object.
---
--- If you want to modify the metatable, check out [Global.FindMetaTable](https://wiki.facepunch.com/gmod/Global.FindMetaTable)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.getmetatable)
---@param object any The value to return the metatable of.
---@return any # The metatable of the value. This is not always a table.
function _G.getmetatable(object) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns the menu overlay panel, a container for panels like the error panel created in [GM:OnLuaError](https://wiki.facepunch.com/gmod/GM:OnLuaError).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetOverlayPanel)
---@return Panel # The overlay panel
function _G.GetOverlayPanel() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the PlayerList for the Currently Viewed Server. Internally uses [serverlist.PlayerList](https://wiki.facepunch.com/gmod/serverlist.PlayerList) to retrieve the PlayerList.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetPlayerList)
---@param serverip string The ServerIP to retrieve the PlayerList from.
function _G.GetPlayerList(serverip) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player whose movement commands are currently being processed. The player this returns can safely have [Player:GetCurrentCommand](https://wiki.facepunch.com/gmod/Player:GetCurrentCommand)() called on them. See [Prediction](https://wiki.facepunch.com/gmod/Prediction).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetPredictionPlayer)
---@return Player # The player currently being predicted, or NULL if no command processing is currently being done.
function _G.GetPredictionPlayer() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates or gets the rendertarget with the given name.
---
--- See [Global.GetRenderTargetEx](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx) for an advanced version of this function with more options.
---
--- This crashes when used on a cubemap texture.
--- **WARNING**: Rendertargets are not garbage-collected, which means they will remain in memory until you disconnect. So make sure to avoid creating new ones unecessarily and re-use as many of your existing rendertargets as possible to avoid filling up all your memory.
---
--- **WARNING**: Drawing rendertargets on themself can produce odd and unexpected results.
---
--- **NOTE**: Calling this function is equivalent to
--- ```lua
--- GetRenderTargetEx(name,
--- 	width, height,
--- 	RT_SIZE_NO_CHANGE,
--- 	MATERIAL_RT_DEPTH_SEPARATE,
--- 	bit.bor(2, 256),
--- 	0,
--- 	IMAGE_FORMAT_BGRA8888
--- )
--- ```
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetRenderTarget)
---@param name string The internal name of the render target.
---@param width number The width of the render target, must be power of 2. If not set to PO2, the size will be automatically converted to the nearest PO2 size.
---@param height number The height of the render target, must be power of 2. If not set to PO2, the size will be automatically converted to the nearest PO2 size.
---@return ITexture # The render target
function _G.GetRenderTarget(name, width, height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets (or creates if it does not exist) the rendertarget with the given name, this function allows to adjust the creation of a rendertarget more than [Global.GetRenderTarget](https://wiki.facepunch.com/gmod/Global.GetRenderTarget).
---
--- See also [render.PushRenderTarget](https://wiki.facepunch.com/gmod/render.PushRenderTarget) and [render.SetRenderTarget](https://wiki.facepunch.com/gmod/render.SetRenderTarget).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetRenderTargetEx)
---@param name string The internal name of the render target.
---
--- The name is treated like a path and gets its extension discarded."name.1" and "name.2" are considered the same name and will result in the same render target being reused.
---@param width number The width of the render target, must be power of 2.
---@param height number The height of the render target, must be power of 2.
---@param sizeMode RT_SIZE Bitflag that influences the sizing of the render target, see Enums/RT_SIZE.
---@param depthMode MATERIAL_RT_DEPTH Bitflag that determines the depth buffer usage of the render target Enums/MATERIAL_RT_DEPTH.
---
--- 	PNG's may not render to non MATERIAL_RT_DEPTH_NONE RenderTargets
---@param textureFlags TEXTUREFLAGS Bitflag that configures the texture, see Enums/TEXTUREFLAGS.
---
--- List of flags can also be found on the Valve's Developer Wiki:
--- https://developer.valvesoftware.com/wiki/Valve_Texture_Format
---@param rtFlags CREATERENDERTARGETFLAGS Flags that control the HDR behaviour of the render target, see Enums/CREATERENDERTARGETFLAGS.
---@param imageFormat number Image format, see Enums/IMAGE_FORMAT.
--- Some additional image formats are accepted, but don't have enums. See [VTF Enumerations.](https://developer.valvesoftware.com/wiki/Valve_Texture_Format#VTF_enumerations)
---@return ITexture # The new render target.
function _G.GetRenderTargetEx(name, width, height, sizeMode, depthMode, textureFlags, rtFlags, imageFormat) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Retrieves data about the save with the specified filename. Similar to [Global.GetDemoFileDetails](https://wiki.facepunch.com/gmod/Global.GetDemoFileDetails).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetSaveFileDetails)
---@param filename string The file name of the save.
---@return table # Save data.
function _G.GetSaveFileDetails(filename) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Starts Searching for Servers in the given Category. Can be stopped with [Global.DoStopServers](https://wiki.facepunch.com/gmod/Global.DoStopServers).
--- Internally uses [serverlist.Query](https://wiki.facepunch.com/gmod/serverlist.Query) to search for Servers.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetServers)
---@param category string The Category to start searching the Servers in. **Working Values: internet, favorite, history, lan**
---@param id number Some ID. can be a random number?
function _G.GetServers(category, id) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns if the client is timing out, and time since last ping from the server. Similar to the server side [Player:IsTimingOut](https://wiki.facepunch.com/gmod/Player:IsTimingOut).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetTimeoutInfo)
---@return boolean # Is timing out?
---@return number # Get time since last pinged received.
function _G.GetTimeoutInfo() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the entity the client is using to see from (such as the player itself, the camera, or another entity).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GetViewEntity)
---@return Entity # The view entity.
function _G.GetViewEntity() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Opens the given URL in a [HTML](https://wiki.facepunch.com/gmod/HTML) panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.GMOD_OpenURLNoOverlay)
---@param url string The url to open.
function _G.GMOD_OpenURLNoOverlay(url) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a hexadecimal representation of a color to [Color](https://wiki.facepunch.com/gmod/Color) object.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.HexToColor)
---@param hue string A hex formatted color. Accepted formats are:
--- * `#RRGGBB`
--- * `#RRGGBBAA` (Web color standard variation)
--- * `#RGB`
--- * `#RGBA`
---
--- `#` can be omitted.
---@return Color # The Color created from the hexadecimal color code.
function _G.HexToColor(hue) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a color from [HSL color space](https://en.wikipedia.org/wiki/HSL_and_HSV) into RGB color space and returns a [Color](https://wiki.facepunch.com/gmod/Color).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.HSLToColor)
---@param hue number The hue in degrees from 0-360.
---@param saturation number The saturation from 0-1.
---@param lightness number The lightness from 0-1.
---@return table # The Color created from the HSL color space.
function _G.HSLToColor(hue, saturation, lightness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a color from [HSV color space](https://en.wikipedia.org/wiki/HSL_and_HSV) into RGB color space and returns a [Color](https://wiki.facepunch.com/gmod/Color).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.HSVToColor)
---@param hue number The hue in degrees from 0-360.
---@param saturation number The saturation from 0-1.
---@param value number The value from 0-1.
---@return table # The Color created from the HSV color space.
function _G.HSVToColor(hue, saturation, value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Launches an asynchronous http request with the given parameters.
---
--- This cannot send or receive multiple headers with the same name.
--- **NOTE**: HTTP-requests that respond with a large body may return an `unsuccessful` error. Try using the [Range](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range) header to download the file in chunks.
---
--- **NOTE**: HTTP-requests to destinations on private networks (such as `192.168.0.1`, or `127.0.0.1`) won't work.
---
--- 	To enable HTTP-requests to destinations on private networks use [Command Line Parameters](https://wiki.facepunch.com/gmod/Command_Line_Parameters) `-allowlocalhttp`. (Dedicated servers only)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.HTTP)
---@param parameters HTTPRequest The request parameters. See Structures/HTTPRequest.
---@return boolean # `true` if a request is queued, `false` if a request could not be queued. (i.e. When not giving a `table` or the game is ran with `-disablehttp`)
function _G.HTTP(parameters) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a color from [HWB color space](https://en.wikipedia.org/wiki/HWB_color_model) (Hue-Whiteness-Blackness) into RGB color space and returns a [Color](https://wiki.facepunch.com/gmod/Color).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.HWBToColor)
---@param hue number The hue of the color in degrees from 0-360.
---@param whiteness number The whiteness of the color from 0-1.
---@param blackness number The blackness of the color from 0-1.
---@return Color # The Color created from the HWB color space.
function _G.HWBToColor(hue, whiteness, blackness) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Executes a Lua script.
---
--- This function will try to load local client file if `sv_allowcslua` is **1**.
---
--- **WARNING**: The file you are attempting to include **MUST NOT** be empty or the include will fail. Files over a certain size (64KB compressed) may fail clientside as well.
---
--- If the file you are including is clientside or shared, it **must** be [Global.AddCSLuaFile](https://wiki.facepunch.com/gmod/Global.AddCSLuaFile)'d or this function will error saying the file doesn't exist.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.include)
---@param fileName string The name of the script to be executed. The path must be either relative to the current file, or be an absolute path (relative to and excluding the **lua/** folder).
---
--- Addon files (.gma files) and dedicated servers clientside do not support relative parent folders (`..` notation).
---
--- Absolute paths for gamemode files must include `/gamemode/`.
---
--- **NOTE**: Please make sure your file names are unique, the filesystem is shared across all addons, so a file named `lua/config.lua` in your addon may be overwritten by the same file in another addon.
---@return any ... # Anything that the executed Lua script returns.
function _G.include(fileName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function works exactly the same as [Global.include](https://wiki.facepunch.com/gmod/Global.include) both clientside and serverside.
---
--- The only difference is that on the serverside it also calls [Global.AddCSLuaFile](https://wiki.facepunch.com/gmod/Global.AddCSLuaFile) on the filename, so that it gets sent to the client.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IncludeCS)
---@param filename string The filename of the Lua file you want to include.
---@return any ... # Anything that the executed Lua script returns.
---@deprecated To send the target file to the client simply call AddCSLuaFile() in the target file itself.
function _G.IncludeCS(filename) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a [Stateless Iterator](https://www.lua.org/pil/7.3.html) for a [Generic For Loops](https://www.lua.org/pil/4.3.5.html), to return ordered key-value pairs from a table.
---
--- This will only iterate through **numerical** keys, and these must also be **sequential**; starting at 1 with no gaps.
---
--- For unordered pairs, see [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs).
---
--- For pairs sorted by key in alphabetical order, see [Global.SortedPairs](https://wiki.facepunch.com/gmod/Global.SortedPairs).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ipairs)
---@param tab table The table to iterate over.
---@return function # The iterator function.
---@return table # The table being iterated over.
---@return number # The origin index **=0**.
function _G.ipairs(tab) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is an [Angle](https://wiki.facepunch.com/gmod/Angle).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.isangle)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is an Angle.
function _G.isangle(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is a [boolean](https://wiki.facepunch.com/gmod/boolean).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.isbool)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a boolean.
function _G.isbool(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the given object does or doesn't have a `metatable` of a color.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsColor)
---@param Object any The object to be tested
---@return boolean # Whether the given object is a color or not
function _G.IsColor(Object) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Determines whether or not the provided console command will be blocked if it's ran through Lua functions, such as [Global.RunConsoleCommand](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand) or [Player:ConCommand](https://wiki.facepunch.com/gmod/Player:ConCommand).
---
--- For more info on blocked console commands, check out [Blocked ConCommands](https://wiki.facepunch.com/gmod/Blocked_ConCommands).
--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsConCommandBlocked)
---@param name string The console command to test.
---@return boolean # Whether the command will be blocked.
function _G.IsConCommandBlocked(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the given NPC class name is an enemy. Returns `true` if the entity name is one of the following:
--- * `monster_alien_grunt`
--- * `monster_nihilanth`
--- * `monster_tentacle`
--- * `monster_alien_slave`
--- * `monster_bigmomma`
--- * `monster_bullchicken`
--- * `monster_gargantua`
--- * `monster_human_assassin`
--- * `monster_babycrab`
--- * `monster_human_grunt`
--- * `monster_cockroach`
--- * `monster_houndeye`
--- * `monster_zombie`
--- * `monster_headcrab`
--- * `monster_alien_controller`
--- * `monster_turret`
--- * `monster_miniturret`
--- * `monster_sentry`
--- * `npc_antlion`
--- * `npc_antlionguard`
--- * `npc_antlionguardian`
--- * `npc_barnacle`
--- * `npc_breen`
--- * `npc_clawscanner`
--- * `npc_combine_s`
--- * `npc_cscanner`
--- * `npc_fastzombie`
--- * `npc_fastzombie_torso`
--- * `npc_headcrab`
--- * `npc_headcrab_fast`
--- * `npc_headcrab_poison`
--- * `npc_hunter`
--- * `npc_metropolice`
--- * `npc_manhack`
--- * `npc_poisonzombie`
--- * `npc_strider`
--- * `npc_stalker`
--- * `npc_zombie`
--- * `npc_zombie_torso`
--- * `npc_zombine`
--- * `npc_combine_camera`
--- * `npc_turret_ceiling`
--- * `npc_combinedropship`
--- * `npc_combinegunship`
--- * `npc_helicopter`
--- * `npc_turret_floor`
--- * `npc_antlion_worker`
--- * `npc_headcrab_black`
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsEnemyEntityName)
---@param className string Class name of the entity to check.
---@return boolean # Is an enemy?
function _G.IsEnemyEntityName(className) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is an [Entity](https://wiki.facepunch.com/gmod/Entity).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsEntity)
---@param variable any The variable to check.
---@return boolean # True if the variable is an Entity.
function _G.isentity(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Identical to [Global.isentity](https://wiki.facepunch.com/gmod/Global.isentity).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsEntity(legacy))
---@deprecated Use the function Global.isentity instead.
function _G.IsEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns if this is the first time this hook was predicted.
---
--- This is useful for one-time logic in your SWEPs PrimaryAttack, SecondaryAttack and Reload and other  (to prevent those hooks from being called rapidly in succession). It's also useful in a Move hook for when the client predicts movement.
---
--- Visit [Prediction](https://wiki.facepunch.com/gmod/Prediction) for more information about this behavior.
---
--- **NOTE**: This is already used internally for [Entity:EmitSound](https://wiki.facepunch.com/gmod/Entity:EmitSound), [Weapon:SendWeaponAnim](https://wiki.facepunch.com/gmod/Weapon:SendWeaponAnim) and [Entity:FireBullets](https://wiki.facepunch.com/gmod/Entity:FireBullets), but NOT in  [util.Effect](https://wiki.facepunch.com/gmod/util.Effect).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsFirstTimePredicted)
---@return boolean # Whether or not this is the first time being predicted.
function _G.IsFirstTimePredicted() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the given NPC class name is a friend. Returns `true` if the entity name is one of the following:
--- * `monster_scientist`
--- * `monster_barney`
--- * `npc_alyx`
--- * `npc_barney`
--- * `npc_citizen`
--- * `npc_dog`
--- * `npc_eli`
--- * `npc_fisherman`
--- * `npc_gman`
--- * `npc_kleiner`
--- * `npc_magnusson`
--- * `npc_monk`
--- * `npc_mossman`
--- * `npc_odessa`
--- * `npc_vortigaunt`
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsFriendEntityName)
---@param className string Class name of the entity to check
---@return boolean # Is a friend
function _G.IsFriendEntityName(className) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is a [function](https://wiki.facepunch.com/gmod/function).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.isfunction)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a function.
function _G.isfunction(variable) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns true if the client is currently playing either a singleplayer or multiplayer game.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsInGame)
---@return boolean # True if we are in a game.
function _G.IsInGame() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns true when the loading panel is active.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsInLoading)
---@return boolean # True if loading panel is active.
function _G.IsInLoading() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the passed object is a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ismatrix)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a VMatrix.
function _G.ismatrix(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Checks whether or not a game is currently mounted. Uses data given by [engine.GetGames](https://wiki.facepunch.com/gmod/engine.GetGames).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsMounted)
---@param game string The game string/app ID to check.
---@return boolean # True if the game is mounted.
function _G.IsMounted(game) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is a [number](https://wiki.facepunch.com/gmod/number).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.isnumber)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a number.
function _G.isnumber(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is a [Panel](https://wiki.facepunch.com/gmod/Panel).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ispanel)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a Panel.
function _G.ispanel(variable) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Checks if the given server data is blacklisted or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsServerBlacklisted)
---@param address string Server ip. can end with *
---@param hostname string Server name
---@param description string description to check
---@param gm string Gamemode name
---@param map string Map name
---@return string # Returns the reason why the server is blacklisted or nil if the server is not blacklisted.
function _G.IsServerBlacklisted(address, hostname, description, gm, map) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is a [string](https://wiki.facepunch.com/gmod/string).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.isstring)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a string.
function _G.isstring(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is a [table](https://wiki.facepunch.com/gmod/table).
--- 	**NOTE**: Will return TRUE for variables of type [Color](https://wiki.facepunch.com/gmod/Color)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.istable)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a table.
function _G.istable(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether or not every element within a table is a valid entity
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsTableOfEntitiesValid)
---@param table table Table containing entities to check
---@return boolean # All entities valid
function _G.IsTableOfEntitiesValid(table) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether or not a model is useless by checking that the file path is that of a proper model.
---
--- If the string ".mdl" is not found in the model name, the function will return true.
---
--- The function will also return true if any of the following strings are found in the given model name:
--- * "_gesture"
--- * "_anim"
--- * "_gst"
--- * "_pst"
--- * "_shd"
--- * "_ss"
--- * "_posture"
--- * "_anm"
--- * "ghostanim"
--- * "_paths"
--- * "_shared"
--- * "anim_"
--- * "gestures_"
--- * "shared_ragdoll_"
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsUselessModel)
---@param modelName string The model name to be checked
---@return boolean # Whether or not the model is useless
function _G.IsUselessModel(modelName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether an object is valid or not. (Such as [entities](https://wiki.facepunch.com/gmod/Entity), [Panel](https://wiki.facepunch.com/gmod/Panel)s, custom [table](https://wiki.facepunch.com/gmod/table) objects and more).
---
--- Checks that an object is not [nil](https://wiki.facepunch.com/gmod/nil), has an `IsValid` method and if this method returns `true`. If the object has no `IsValid` method, it will return `false`.
---
--- **NOTE**: If you are sure that the object you are about to check is not `nil` and has the `IsValid` method, it would be more faster to call it directly rather than using `IsValid`.
---
--- **NOTE**: Due to vehicles being technically valid the moment they're spawned, also use [Vehicle:IsValidVehicle](https://wiki.facepunch.com/gmod/Vehicle:IsValidVehicle) to make sure they're fully initialized.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.IsValid)
---@param toBeValidated any The table or object to be validated.
---@return boolean # True if the object is valid.
function _G.IsValid(toBeValidated) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the passed object is a [Vector](https://wiki.facepunch.com/gmod/Vector).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.isvector)
---@param variable any The variable to perform the type check for.
---@return boolean # True if the variable is a Vector.
function _G.isvector(variable) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Joins the server with the specified IP.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.JoinServer)
---@param IP string The IP of the server to join
function _G.JoinServer(IP) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds javascript function 'language.Update' to an HTML panel as a method to call Lua's [language.GetPhrase](https://wiki.facepunch.com/gmod/language.GetPhrase) function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.JS_Language)
---@param htmlPanel Panel Panel to add javascript function 'language.Update' to.
function _G.JS_Language(htmlPanel) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds javascript function 'util.MotionSensorAvailable' to an HTML panel as a method to call Lua's [motionsensor.IsAvailable](https://wiki.facepunch.com/gmod/motionsensor.IsAvailable) function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.JS_Utility)
---@param htmlPanel Panel Panel to add javascript function 'util.MotionSensorAvailable' to.
function _G.JS_Utility(htmlPanel) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds workshop related javascript functions to an HTML panel, used by the "Dupes" and "Saves" tabs in the spawnmenu.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.JS_Workshop)
---@param htmlPanel Panel Panel to add javascript functions to.
function _G.JS_Workshop(htmlPanel) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Convenience function that creates a [DLabel](https://wiki.facepunch.com/gmod/DLabel), sets the text, and returns it
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Label)
---@param text string The string to set the label's text to
---@param parent? Panel Optional. The panel to parent the DLabel to
---@return Panel # The created DLabel
function _G.Label(text, parent) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Callback function for when the client's language changes. Called by the engine.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LanguageChanged)
---@param lang string The new language code.
function _G.LanguageChanged(lang) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs a linear interpolation from the start number to the end number.
---
--- This function provides a very efficient and easy way to smooth out movements.
---
--- See also [math.ease](https://wiki.facepunch.com/gmod/math.ease) for functions that allow to have non linear animations using linear interpolation.
---
--- **NOTE**: This function is not meant to be used with constant value in the first argument if you're dealing with animation! Use a value that changes over time. See example for **proper** usage of Lerp for animations.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Lerp)
---@param t number The fraction for finding the result. This number is clamped between 0 and 1. Shouldn't be a constant.
---@param from number The starting number. The result will be equal to this if delta is 0.
---@param to number The ending number. The result will be equal to this if delta is 1.
---@return number # The result of the linear interpolation, `from + (to - from) * t`.
function _G.Lerp(t, from, to) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns point between first and second angle using given fraction and linear interpolation
--- **NOTE**: This function is not meant to be used with constant value in the first argument, if you're dealing with animation! Use a value that changes over time
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LerpAngle)
---@param ratio number Ratio of progress through values
---@param angleStart Angle Angle to begin from
---@param angleEnd Angle Angle to end at
---@return Angle # angle
function _G.LerpAngle(ratio, angleStart, angleEnd) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Linear interpolation between two vectors. It is commonly used to smooth movement between two vectors
--- **NOTE**: This function is not meant to be used with constant value in the first argument, if you're dealing with animation! Use a value that changes over time
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LerpVector)
---@param fraction number Fraction ranging from 0 to 1
---@param from Vector The initial Vector
---@param to Vector The desired Vector
---@return Vector # The lerped vector.
function _G.LerpVector(fraction, from, to) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Loads all Addon Presets and updates the Preset list.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ListAddonPresets)
function _G.ListAddonPresets() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns the contents of `addonpresets.txt` located in the `garrysmod/settings` folder. By default, this file stores your addon presets as JSON.
---
--- You can use [Global.SaveAddonPresets](https://wiki.facepunch.com/gmod/Global.SaveAddonPresets) to modify this file.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LoadAddonPresets)
---@return string # The contents of the file.
function _G.LoadAddonPresets() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- This function is used to get the last map and category to which the map belongs from the cookie saved with [Global.SaveLastMap](https://wiki.facepunch.com/gmod/Global.SaveLastMap).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LoadLastMap)
function _G.LoadLastMap() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the News List
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LoadNewsList)
function _G.LoadNewsList() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Loads all preset settings for the [presets](https://wiki.facepunch.com/gmod/presets) and returns them in a table
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LoadPresets)
---@return table # Preset data
function _G.LoadPresets() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns a localisation for the given token, if none is found it will return the default (second) parameter.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Localize)
---@param localisationToken string The token to find a translation for.
---@param default string The default value to be returned if no translation was found.
---@return string # The localized string, 128 char limit.
---@deprecated Use language.GetPhrase instead.
function _G.Localize(localisationToken, default) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the player object of the current client.
---
--- **NOTE**: LocalPlayer() will return NULL until all entities have been initialized. See [GM:InitPostEntity](https://wiki.facepunch.com/gmod/GM:InitPostEntity).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LocalPlayer)
---@return Player # The player object representing the client.
function _G.LocalPlayer() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Translates the specified position and angle from the specified local coordinate system into worldspace coordinates.
---
--- If you're working with an entity's local vectors, use [Entity:LocalToWorld](https://wiki.facepunch.com/gmod/Entity:LocalToWorld) and/or [Entity:LocalToWorldAngles](https://wiki.facepunch.com/gmod/Entity:LocalToWorldAngles) instead.
---
--- See also: [Global.WorldToLocal](https://wiki.facepunch.com/gmod/Global.WorldToLocal), the reverse of this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.LocalToWorld)
---@param localPos Vector The position vector in the source coordinate system, that should be translated to world coordinates
---@param localAng Angle The angle in the source coordinate system, that should be converted to a world angle. If you don't need to convert an angle, you can supply an arbitrary valid angle (e.g. Global.Angle()).
---@param originPos Vector The origin point of the source coordinate system, in world coordinates
---@param originAngle Angle The angles of the source coordinate system, as a world angle
---@return Vector # The world position of the supplied local position.
---@return Angle # The world angles of the supplied local angle.
function _G.LocalToWorld(localPos, localAng, originPos, originAngle) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Either returns the material with the given name, or loads the material interpreting the first argument as the path.
---
--- ## .png, .jpg and other image formats
---
--- This function is capable to loading `.png` or `.jpg` images, generating a texture and material for them on the fly.
---
--- PNG, JPEG, GIF, and TGA files will work, but only if they have the `.png` or `.jpg` file extensions (even if the actual image format doesn't match the file extension)
---
--- Use [Global.AddonMaterial](https://wiki.facepunch.com/gmod/Global.AddonMaterial) for image files with the `.cache` file extension. (from [steamworks.Download](https://wiki.facepunch.com/gmod/steamworks.Download))
---
--- While images are no longer scaled to Power of 2 (sizes of 8, 16, 32, 64, 128, etc.) sizes since February 2019, it is still a good practice for things like icons, etc.
---
--- **WARNING**: Server-side, this function can consistently return an invalid material (with '__error') depending on the file type loaded.
---
--- **WARNING**: This function is very expensive when used in rendering hooks or in operations requiring very frequent calls. It is a good idea to cache the material in a variable (like in the examples).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Material)
---@param materialName string The material name or path relative to the `materials/` folder.
--- Paths outside the `materials/` folder like `data/MyImage.jpg` or `maps/thumb/gm_construct.png` will also work for when generating materials.
---
--- To retrieve a Lua material created with Global.CreateMaterial, just prepend a `!` to the material name.
---@param pngParameters? string A string containing space separated keywords which will be used to add material parameters.
---
--- See Material Parameters for more information.
---
--- This feature only works when importing `.png` or `.jpg` image files.
---@return IMaterial # Generated material.
---@return number # How long it took for the function to run.
function _G.Material(materialName, pngParameters) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) object, a 4x4 matrix.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Matrix)
---@param data? table Initial data to initialize the matrix with. Leave empty to initialize an identity matrix. See examples for usage.
---
--- Can be a VMatrix to copy its data.
---@return VMatrix # New matrix.
function _G.Matrix(data) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: Internally uses [steamworks.FileInfo](https://wiki.facepunch.com/gmod/steamworks.FileInfo) to fetch the data.
---
--- This function retrieves the Addon data and passes it onto JS(JavaScript)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.MenuGetAddonData)
---@param workshopItemID string The ID of Steam Workshop item.
function _G.MenuGetAddonData(workshopItemID) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a new static mesh object.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Mesh)
---@param mat? IMaterial The material the mesh is intended to be rendered with. It's merely a hint that tells that mesh what vertex format it should use.
---@return IMesh # The created object.
function _G.Mesh(mat) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Runs [util.PrecacheModel](https://wiki.facepunch.com/gmod/util.PrecacheModel) and returns the string.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Model)
---@param model string The model to precache.
---@return string # The same string entered as an argument.
function _G.Model(model) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a table with the specified module name and sets the function environment for said table.
---
--- Any passed loaders are called with the table as an argument. An example of this is [package.seeall](https://wiki.facepunch.com/gmod/package.seeall).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.module)
---@param name string The name of the module. This will be used to access the module table in the runtime environment.
---@param ... any Calls each function passed with the new table as an argument.
function _G.module(name, ...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes every given argument to the console. Limitations of [Global.print](https://wiki.facepunch.com/gmod/Global.print) apply.
---
--- Automatically attempts to convert each argument to a string. (See [Global.tostring](https://wiki.facepunch.com/gmod/Global.tostring))
---
--- Unlike [Global.print](https://wiki.facepunch.com/gmod/Global.print), arguments are not separated by anything. They are simply concatenated.
---
--- Additionally, a newline isn't added automatically to the end, so subsequent Msg or print operations will continue the same line of text in the console. See [Global.MsgN](https://wiki.facepunch.com/gmod/Global.MsgN) for a version that does add a newline.
---
--- The text is blue on the server, orange on the client, and green on the menu:
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Msg)
---@param ... any List of values to print.
function _G.Msg(...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Works exactly like [Global.Msg](https://wiki.facepunch.com/gmod/Global.Msg) except that, if called on the server, will print to all players consoles plus the server console. Limitations of [Global.print](https://wiki.facepunch.com/gmod/Global.print) apply.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.MsgAll)
---@param ... any List of values to print.
function _G.MsgAll(...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Just like [Global.Msg](https://wiki.facepunch.com/gmod/Global.Msg), except it can also print colored text, just like [chat.AddText](https://wiki.facepunch.com/gmod/chat.AddText).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.MsgC)
---@param ... any Values to print. If you put in a color, all text after that color will be printed in that color.
function _G.MsgC(...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Same as [Global.print](https://wiki.facepunch.com/gmod/Global.print), except it concatinates the arguments without inserting any whitespace in between them.
---
--- See also [Global.Msg](https://wiki.facepunch.com/gmod/Global.Msg), which doesn't add a newline (`"\n"`) at the end.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.MsgN)
---@param ... any List of values to print. They can be of any type and will be converted to strings with Global.tostring.
function _G.MsgN(...) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns named color defined in `resource/ClientScheme.res`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.NamedColor)
---@param name string Name of color
---@return table # A Color or nil
function _G.NamedColor(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Fails under certain conditions when called in coroutines
--- Creates a new [userdata](https://wiki.facepunch.com/gmod/userdata) object.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.newproxy)
---@param addMetatable? boolean If true, the created userdata will be given its own metatable.
---@return userdata # The newly created userdata.
function _G.newproxy(addMetatable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Fails under certain conditions when called in coroutines
--- Creates a new [userdata](https://wiki.facepunch.com/gmod/userdata) object.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.newproxy)
---@param userData userdata Creates a new userdata with the same metatable the userdata passed in had. The userdata passed in **must be** a userdata that has a metatable that was created from this function.
---@return userdata # The newly created userdata.
function _G.newproxy(userData) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the next key and value pair in a table.
---
--- **NOTE**: Table keys in Lua have no specific order, and will be returned in whatever order they exist in memory. This may not always be in ascending order or alphabetical order. If you need to iterate over an array in order, use [Global.ipairs](https://wiki.facepunch.com/gmod/Global.ipairs).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.next)
---@param tab table The table
---@param prevKey? any The previous key in the table.
---@return any # The next key for the table. If the previous key was nil, this will be the first key in the table. If the previous key was the last key in the table, this will be nil.
---@return any # The value associated with that key. If the previous key was the last key in the table, this will be nil.
function _G.next(tab, prevKey) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns the number of files needed from the server you are currently joining.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.NumDownloadables)
---@return number # The number of downloadables
function _G.NumDownloadables() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the amount of skins the specified model has.
---
--- See also [Entity:SkinCount](https://wiki.facepunch.com/gmod/Entity:SkinCount) if you have an entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.NumModelSkins)
---@param modelName string Model to return amount of skins of
---@return number # Amount of skins
function _G.NumModelSkins(modelName) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Called by the engine when a model has been loaded. Caches model information with the [sql](https://wiki.facepunch.com/gmod/sql).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.OnModelLoaded)
---@param modelName string Name of the model.
---@param numPostParams number Number of pose parameters the model has.
---@param numSeq number Number of sequences the model has.
---@param numAttachments number Number of attachments the model has.
---@param numBoneControllers number Number of bone controllers the model has.
---@param numSkins number Number of skins that the model has.
---@param size number Size of the model.
function _G.OnModelLoaded(modelName, numPostParams, numSeq, numAttachments, numBoneControllers, numSkins, size) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Opens a folder with the given name in the garrysmod folder using the operating system's file browser.
---
--- This does not work on OSX or Linux.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.OpenFolder)
---@param folder string The subdirectory to open in the garrysmod folder.
function _G.OpenFolder(folder) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Opens the Problems Panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.OpenProblemsPanel)
function _G.OpenProblemsPanel() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Modifies the given vectors so that all of vector2's axis are larger than vector1's by switching them around. Also known as ordering vectors.
---
--- **NOTE**: This function will irreversibly modify the given vectors
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.OrderVectors)
---@param vector1 Vector Bounding box min resultant
---@param vector2 Vector Bounding box max resultant
function _G.OrderVectors(vector1, vector2) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an iterator function([Global.next](https://wiki.facepunch.com/gmod/Global.next)) for a for loop that will return the values of the specified table in an arbitrary order.
---
--- * For alphabetical **key** order use [Global.SortedPairs](https://wiki.facepunch.com/gmod/Global.SortedPairs).
--- * For alphabetical **value** order use [Global.SortedPairsByValue](https://wiki.facepunch.com/gmod/Global.SortedPairsByValue).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.pairs)
---@param tab table The table to iterate over.
---@return function # The iterator (Global.next).
---@return table # The table being iterated over.
---@return any # **nil** (for the constructor).
function _G.pairs(tab) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Calls [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) and returns given string.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Particle)
---@param file string The particle file.
---@return string # The particle file.
function _G.Particle(file) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a particle effect. See also [Global.CreateParticleSystem](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem).
---
--- **NOTE**: The particle effect must be precached **serverside** with [Global.PrecacheParticleSystem](https://wiki.facepunch.com/gmod/Global.PrecacheParticleSystem) and the file its from must be added via [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) before it can be used!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ParticleEffect)
---@param particleName string The name of the particle effect.
---@param position Vector The start position of Control Point 0 for the particle system.
---@param angles Angle The orientation of Control Point 0 for the particle system.
---
--- You must provide the entity argument for the angles to take effect.
---@param parent? Entity If set, the particle will be parented to the entity.
function _G.ParticleEffect(particleName, position, angles, parent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a particle effect with specialized parameters. See also [Entity:CreateParticleEffect](https://wiki.facepunch.com/gmod/Entity:CreateParticleEffect) and [Global.CreateParticleSystem](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem).
---
--- **NOTE**: The particle effect must be precached **serverside** with [Global.PrecacheParticleSystem](https://wiki.facepunch.com/gmod/Global.PrecacheParticleSystem) and the file its from must be added via [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) before it can be used!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach)
---@param particleName string The name of the particle effect.
---@param attachType number Attachment type using Enums/PATTACH.
---@param entity Entity The entity to be used in the way specified by the attachType.
---@param attachmentID number The id of the attachment to be used in the way specified by the attachType.
function _G.ParticleEffectAttach(particleName, attachType, entity, attachmentID) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new [CLuaEmitter](https://wiki.facepunch.com/gmod/CLuaEmitter).
---
--- **NOTE**: Do not forget to delete the emitter with [CLuaEmitter:Finish](https://wiki.facepunch.com/gmod/CLuaEmitter:Finish) once you are done with it
---
--- **WARNING**: There is a limit of 4097 emitters that can be active at once, exceeding this limit will throw a non-halting error in console!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ParticleEmitter)
---@param position Vector The start position of the emitter.
---
--- This is only used to determine particle drawing order for translucent particles.
---@param use3D? boolean Whenever to render the particles in 2D or 3D mode. Supplying "true" will enable 3D (non-billboarded), otherwise it will default to 2D.
---@return CLuaEmitter # The new particle emitter.
function _G.ParticleEmitter(position, use3D) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Creates a path for the bot to follow using one of two types (`Follow` or `Chase`)
---
--- `Follow` is a general purpose path. Best used for static or infrequently updated locations. The path will only be updated once [PathFollower:Update](https://wiki.facepunch.com/gmod/PathFollower:Update) is called. This needs to be done manually (typically inside the bots `BehaveThread` coroutine.
---
--- `Chase` is a specifically optimized for chasing a moving entity. Paths of this type will use [PathFollower:Chase](https://wiki.facepunch.com/gmod/PathFollower:Chase)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Path)
---@param type string The type of the path to create, must be `"Follow"` or `"Chase"`
---@return PathFollower # The path
function _G.Path(type) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Calls a function and catches an error that can be thrown while the execution of the call.
---
--- This cannot stop errors from hooks called from the engine.
---
--- This does not stop [Global.Error](https://wiki.facepunch.com/gmod/Global.Error) and [Global.ErrorNoHalt](https://wiki.facepunch.com/gmod/Global.ErrorNoHalt) from sending error messages to the server (if called clientside) or calling the [GM:OnLuaError](https://wiki.facepunch.com/gmod/GM:OnLuaError) hook. The success boolean returned will always return true and thus you will not get the error message returned. [Global.error](https://wiki.facepunch.com/gmod/Global.error) does not exhibit these behaviours.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.pcall)
---@param func function Function to be executed and of which the errors should be caught of
---@param ... any Arguments to call the function with.
---@return boolean # If the function had no errors occur within it.
---@return any ... # If an error occurred, this will be a string containing the error message. Otherwise, this will be the return values of the function passed in.
function _G.pcall(func, ...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the player with the matching [Player:UserID](https://wiki.facepunch.com/gmod/Player:UserID).
---
--- For a function that returns a player based on their [Entity:EntIndex](https://wiki.facepunch.com/gmod/Entity:EntIndex), see [Global.Entity](https://wiki.facepunch.com/gmod/Global.Entity).
---
--- For a function that returns a player based on their connection ID, see [player.GetByID](https://wiki.facepunch.com/gmod/player.GetByID).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Player)
---@param playerIndex number The player index.
---@return Player # The retrieved player.
function _G.Player(playerIndex) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Moves the given model to the given position and calculates appropriate camera parameters for rendering the model to an icon.
---
--- The output table interacts nicely with [Panel:RebuildSpawnIconEx](https://wiki.facepunch.com/gmod/Panel:RebuildSpawnIconEx) with a few key renames.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.PositionSpawnIcon)
---@param model Entity Model that is being rendered to the spawn icon
---@param position Vector Position that the model is being rendered at
---@param noAngles boolean If true the function won't reset the angles to 0 for the model.
---@return table # Table of information of the view which can be used for rendering
function _G.PositionSpawnIcon(model, position, noAngles) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Precaches a particle system with the specified name. The particle system must come from a file that is loaded with [game.AddParticles](https://wiki.facepunch.com/gmod/game.AddParticles) beforehand.
---
--- When used on the server, it automatically precaches the particle on client.
---
--- **WARNING**: There is a limit of 4096 precached particles on the server. So only precache particles that are actually going to be used.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.PrecacheParticleSystem)
---@param particleSystemName string The name of the particle system.
function _G.PrecacheParticleSystem(particleSystemName) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Precaches a scene file.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.PrecacheScene)
---@param scene string Path to the scene file to precache.
function _G.PrecacheScene(scene) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Load and precache a custom sentence file.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.PrecacheSentenceFile)
---@param filename string The path to the custom sentences.txt.
function _G.PrecacheSentenceFile(filename) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Precache a sentence group in a sentences.txt definition file.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.PrecacheSentenceGroup)
---@param group string The group to precache.
function _G.PrecacheSentenceGroup(group) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Writes every given argument to the console.
--- Automatically attempts to convert each argument to a string. (See [Global.tostring](https://wiki.facepunch.com/gmod/Global.tostring))
---
--- Separates lines with a line break (`"\n"`)
---
--- Separates arguments with a tab character (`"\t"`).
---
--- Can only print up to `4096` characters at a time, and will stop at NULL character. (`"\0"`)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.print)
---@param ... any List of values to print.
function _G.print(...) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Displays a message in the chat, console, or center of screen of every player.
---
--- This uses the archaic user message system ([umsg](https://wiki.facepunch.com/gmod/umsg)) and hence is limited to 255 characters.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.PrintMessage)
---@param type number Which type of message should be sent to the players (see Enums/HUD)
---@param message string Message to be sent to the players
function _G.PrintMessage(type, message) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Recursively prints the contents of a table to the console.
---
--- The table keys will be sorted alphabetically or numerically when printed to the console.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.PrintTable)
---@param tableToPrint table The table to be printed
---@param indent? number Number of tabs to start indenting at. Increases by 2 when entering another table.
---@param done? table Internal argument, you shouldn't normally change this. Used to check if a nested table has already been printed so it doesn't get caught in a loop.
function _G.PrintTable(tableToPrint, indent, done) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new [ProjectedTexture](https://wiki.facepunch.com/gmod/ProjectedTexture).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ProjectedTexture)
---@return ProjectedTexture # Newly created projected texture.
function _G.ProjectedTexture() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Runs a function without stopping the whole script on error.
---
--- This function is similar to [Global.pcall](https://wiki.facepunch.com/gmod/Global.pcall) and [Global.xpcall](https://wiki.facepunch.com/gmod/Global.xpcall) except the errors are still printed and sent to the error handler (i.e. sent to server console if clientside and [GM:OnLuaError](https://wiki.facepunch.com/gmod/GM:OnLuaError) called).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ProtectedCall)
---@param func function Function to run
---@param ... any Arguments to call the function with.
---@return boolean # Whether the function executed successfully or not
function _G.ProtectedCall(func, ...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an iterator function that can be used to loop through a table in random order
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RandomPairs)
---@param table table Table to create iterator for
---@param descending? boolean Whether the iterator should iterate descending or not
---@return function # Iterator function
function _G.RandomPairs(table, descending) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Compares the two values without calling their __eq operator.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.rawequal)
---@param value1 any The first value to compare.
---@param value2 any The second value to compare.
---@return boolean # Whether or not the two values are equal.
function _G.rawequal(value1, value2) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets the value with the specified key from the table without calling the __index method.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.rawget)
---@param table table Table to get the value from.
---@param index any The index to get the value from.
---@return any # The value.
function _G.rawget(table, index) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the value with the specified key from the table without calling the __newindex method.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.rawset)
---@param table table Table to get the value from.
---@param index any The index to get the value from.
---@param value any The value to set for the specified key.
function _G.rawset(table, index, value) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the real frame-time which is unaffected by host_timescale. To be used for GUI effects (for example)
--- **NOTE**: The returned number is clamped between `0` and `0.1`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RealFrameTime)
---@return number # Real frame time
function _G.RealFrameTime() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the uptime of the game/server in seconds (to at least **4** decimal places). This value updates itself once every time the realm thinks. For servers, this is the server tickrate. For clients, its their current FPS.
---
--- **NOTE**: This is **not** synchronised or affected by the game.
---
--- This will be affected by precision loss if the uptime is more than 30+(?) days, and effectively cease to be functional after 50+(?) days.
---
--- Changing the map will **not** fix it like it does with [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime). A server restart is necessary.
---
--- You should use this function (or [Global.SysTime](https://wiki.facepunch.com/gmod/Global.SysTime)) for timing real-world events such as user interaction, but not for timing game events such as animations.
---
--- See also: [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime), [Global.SysTime](https://wiki.facepunch.com/gmod/Global.SysTime)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RealTime)
---@return number # Uptime of the game/server.
function _G.RealTime() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Creates a new [CRecipientFilter](https://wiki.facepunch.com/gmod/CRecipientFilter).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RecipientFilter)
---@param unreliable? boolean If set to true, makes the filter unreliable.
---
--- This means, when sending over the network in cases like Global.CreateSound (and its subsequent updates), the message is not guaranteed to reach all clients.
---@return CRecipientFilter # The new created recipient filter.
function _G.RecipientFilter(unreliable) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Adds a frame to the currently recording demo.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RecordDemoFrame)
function _G.RecordDemoFrame() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Refreshes all Addon Conflicts after 1 Second. Internally uses [Global.FireAddonConflicts](https://wiki.facepunch.com/gmod/Global.FireAddonConflicts)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RefreshAddonConflicts)
function _G.RefreshAddonConflicts() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Registers a Derma element to be closed the next time [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) is called
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RegisterDermaMenuForClose)
---@param menu Panel Menu to be registered for closure
function _G.RegisterDermaMenuForClose(menu) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Registers a given table as a metatable. It can then be accessed by other code/addons via [Global.FindMetaTable](https://wiki.facepunch.com/gmod/Global.FindMetaTable).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RegisterMetaTable)
---@param metaName string The new metatable name. Cannot override existing types.
---@param metaTable table The new metatable table. It will be given a `MetaID` and `MetaName` fields.
function _G.RegisterMetaTable(metaName, metaTable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Saves position of your cursor on screen. You can restore it by using [Global.RestoreCursorPosition](https://wiki.facepunch.com/gmod/Global.RestoreCursorPosition). This is used internally by the spawn menu/context menu
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RememberCursorPosition)
function _G.RememberCursorPosition() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does the removing of the tooltip panel. Called by [Global.EndTooltip](https://wiki.facepunch.com/gmod/Global.EndTooltip).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RemoveTooltip)
function _G.RemoveTooltip() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the angle that the clients view is being rendered at
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RenderAngles)
---@return Angle # Render Angles
function _G.RenderAngles() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders a Depth of Field effect
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RenderDoF)
---@param origin Vector Origin to render the effect at
---@param angle Angle Angle to render the effect at
---@param usableFocusPoint Vector Point to focus the effect at
---@param angleSize number Angle size of the effect
---@param radialSteps number Amount of radial steps to render the effect with
---@param passes number Amount of render passes
---@param spin boolean Whether to cycle the frame or not
---@param inView table Table of view data
---@param fov number FOV to render the effect with
function _G.RenderDoF(origin, angle, usableFocusPoint, angleSize, radialSteps, passes, spin, inView, fov) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders the stereoscopic post-process effect
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RenderStereoscopy)
---@param viewOrigin Vector Origin to render the effect at
---@param viewAngles Angle Angles to render the effect at
function _G.RenderStereoscopy(viewOrigin, viewAngles) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders the Super Depth of Field post-process effect
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RenderSuperDoF)
---@param viewOrigin Vector Origin to render the effect at
---@param viewAngles Angle Angles to render the effect at
---@param viewFOV number Field of View to render the effect at
function _G.RenderSuperDoF(viewOrigin, viewAngles, viewFOV) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: Called by [permissions.AskToConnect](https://wiki.facepunch.com/gmod/permissions.AskToConnect)
---
--- If the server has the permission "connect" granted, it will instantly connect you to the server.
--- If the permission is not granted it will, it opens a confirmation window to connect to the server.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RequestConnectToServer)
---@param serverip string The server ip to connect to
function _G.RequestConnectToServer(serverip) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Opens a confirmation window to open the url.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RequestOpenURL)
---@param url string The Website URL to open.
function _G.RequestOpenURL(url) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Opens a confirmation window to grant the requested permission.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RequestPermission)
---@param permission string The permission to ask
function _G.RequestPermission(permission) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) First tries to load a binary module with the given name, if unsuccessful, it tries to load a Lua module with the given name.
---
--- Running this function with [Global.pcall](https://wiki.facepunch.com/gmod/Global.pcall) or [Global.xpcall](https://wiki.facepunch.com/gmod/Global.xpcall) will still print an error that counts towards sv_kickerrornum.
--- **NOTE**: This function will try to load local client file if `sv_allowcslua` is set to `1`
---
--- **NOTE**: Binary modules can't be installed as part of an addon and have to be put directly into ``garrysmod/lua/bin/`` to be detected.
--- 	This is a safety measure, because modules can be malicious and harm the system.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.require)
---@param name string The name of the module to be loaded.
function _G.require(name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Restores position of your cursor on screen. You can save it by using [Global.RememberCursorPosition](https://wiki.facepunch.com/gmod/Global.RememberCursorPosition).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RestoreCursorPosition)
function _G.RestoreCursorPosition() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Executes the given console command with the parameters.
---
--- **NOTE**: Some commands/convars are blocked from being ran/changed using this function, usually to prevent harm/annoyance to clients. For a list of blocked commands, see [Blocked ConCommands](https://wiki.facepunch.com/gmod/Blocked_ConCommands).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand)
---@param command string The command to be executed.
---@param ... any The arguments. Note, that unlike Player:ConCommand, you must pass each argument as a new string, not separating them with a space.
function _G.RunConsoleCommand(command, ...) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Runs a menu command. Equivalent to [Global.RunConsoleCommand](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand)`( "gamemenucommand", command )` unless the command starts with the `"engine"` keyword in which case it is equivalent to [Global.RunConsoleCommand](https://wiki.facepunch.com/gmod/Global.RunConsoleCommand)`( command )`.
--- **WARNING**: Invoking engine commands no longer works, prints out `Not running engine cmd 'concommand'`
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RunGameUICommand)
---@param command string The menu command to run
---
--- Should be one of the following:
--- * `Disconnect` - Disconnects from the current server.
--- * `OpenBenchmarkDialog` - Opens the "Video Hardware Stress Test" dialog.
--- * `OpenChangeGameDialog` - Does not work in GMod.
--- * `OpenCreateMultiplayerGameDialog` - Opens the Source dialog for creating a listen server.
--- * `OpenCustomMapsDialog` - Does nothing.
--- * `OpenFriendsDialog` - Does nothing.
--- * `OpenGameMenu` - Does not work in GMod.
--- * `OpenLoadCommentaryDialog` - Opens the "Developer Commentary" selection dialog. Useless in GMod.
--- * `OpenLoadDemoDialog` - Does nothing.
--- * `OpenLoadGameDialog` - Opens the Source "Load Game" dialog.
--- * `OpenNewGameDialog` - Opens the "New Game" dialog. Useless in GMod.
--- * `OpenOptionsDialog` - Opens the options dialog.
--- * `OpenPlayerListDialog` - Opens the "Mute Players" dialog that shows all players connected to the server and allows to mute them.
--- * `OpenSaveGameDialog` - Opens the Source "Save Game" dialog.
--- * `OpenServerBrowser` - Opens the legacy server browser.
--- * `Quit` - Quits the game **without** confirmation (unlike other Source games).
--- * `QuitNoConfirm` - Quits the game without confirmation (like other Source games).
--- * `ResumeGame` - Closes the menu and returns to the game.
--- * `engine 'concommand'` - Runs a console command. Unlike Global.RunConsoleCommand It will ignore Blocked ConCommands
function _G.RunGameUICommand(command) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Evaluates and executes the given code, will throw an error on failure.
--- **NOTE**: Local variables are not passed to the given code.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RunString)
---@param code string The code to execute.
---@param identifier? string The name that should appear in any error messages caused by this code.
---@param handleError? boolean If false, this function will return a string containing any error messages instead of throwing an error.
---@return string # If handleError is false, the error message (if any).
function _G.RunString(code, identifier, handleError) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Alias of [Global.RunString](https://wiki.facepunch.com/gmod/Global.RunString).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.RunStringEx)
---@deprecated Use Global.RunString instead.
function _G.RunStringEx() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes the given entity unless it is a player or the world entity
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SafeRemoveEntity)
---@param ent Entity Entity to safely remove.
function _G.SafeRemoveEntity(ent) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes entity after delay using [Global.SafeRemoveEntity](https://wiki.facepunch.com/gmod/Global.SafeRemoveEntity)
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SafeRemoveEntityDelayed)
---@param entity Entity Entity to be removed
---@param delay number Delay for entity removal in seconds
function _G.SafeRemoveEntityDelayed(entity, delay) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Sets the content of `addonpresets.txt` located in the `garrysmod/settings` folder. By default, this file stores your addon presets as JSON.
---
--- You can use [Global.LoadAddonPresets](https://wiki.facepunch.com/gmod/Global.LoadAddonPresets) to retrieve the data in this file.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SaveAddonPresets)
---@param JSON string The new contents of the file.
function _G.SaveAddonPresets(JSON) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Hides the News List when set to true.
--- **NOTE**: If you call this don't forget to call [Global.LoadNewsList](https://wiki.facepunch.com/gmod/Global.LoadNewsList) to update the News List.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SaveHideNews)
---@param hide boolean true if it should hide the News.
function _G.SaveHideNews(hide) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This function is used to save the last map and category to which the map belongs as a .
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SaveLastMap)
---@param map string The name of the map.
---@param category string The name of the category to which this map belongs.
function _G.SaveLastMap(map, category) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Overwrites all presets with the supplied table. Used by the [presets](https://wiki.facepunch.com/gmod/presets) for preset saving
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SavePresets)
---@param presets table Presets to be saved
function _G.SavePresets(presets) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a number based on the `size` argument and the players' screen width. This is used to scale user interface (UI) elements to be consistently sized and positioned across all screen resolutions.
---
--- The width is scaled in relation to `640x480` resolution, and does **not** take into account non the aspect ratio. See example below for how to adjust or that.
---
--- This function can also be used for scaling font sizes.
---
--- See [Global.ScreenScaleH](https://wiki.facepunch.com/gmod/Global.ScreenScaleH) for a function that scales from height.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ScreenScale)
---@param size number The position or size you want to scale within 640 pixel wide screen.
---@return number # The scaled number based on the player's screen width.
function _G.ScreenScale(size) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a number based on the `size` argument and players' screen height. The height is scaled in relation to `640x480` resolution.  This function is primarily used for scaling font sizes.
---
--- See [Global.ScreenScale](https://wiki.facepunch.com/gmod/Global.ScreenScale) for a function that scales from width.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ScreenScaleH)
---@param size number The number you want to scale.
---@return number # The scaled number based on your screen's height.
function _G.ScreenScaleH(size) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the height of the game's window (in pixels).
--- **NOTE**: ScrH() returns the height from the current viewport, this can be changed via [render.SetViewPort](https://wiki.facepunch.com/gmod/render.SetViewPort), inside Render Targets and cam.Start contexts.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ScrH)
---@return number # The height of the game's window in pixels
function _G.ScrH() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the width of the game's window (in pixels).
--- **NOTE**: ScrW() returns the width from the current viewport, this can be changed via [render.SetViewPort](https://wiki.facepunch.com/gmod/render.SetViewPort), inside Render Targets and cam.Start contexts.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ScrW)
---@return number # The width of the game's window in pixels
function _G.ScrW() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Used to select single values from a vararg or get the count of values in it.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.select)
---@param parameter any Can be a number or string.
--- * If it's a string and starts with "#", the function will return the amount of values in the vararg (ignoring the rest of the string).
--- * If it's a positive number, the function will return all values starting from the given index.
--- * If the number is negative, it will return the amount specified from the end instead of the beginning. This mode will not be compiled by LuaJIT.
---@param ... any The vararg. These are the values from which you want to select.
---@return any # Returns a number or vararg, depending on the select method.
function _G.select(parameter, ...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Send a usermessage
---
---
--- **NOTE**: This does nothing clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SendUserMessage)
---@param name string The name of the usermessage
---@param recipients any Can be a CRecipientFilter, table or Player object.
---@param ... any Data to send in the usermessage
---@deprecated This uses the umsg internally, which has been deprecated. Use the net instead.
function _G.SendUserMessage(name, recipients, ...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns approximate duration of a sentence by name. See [Global.EmitSentence](https://wiki.facepunch.com/gmod/Global.EmitSentence).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SentenceDuration)
---@param name string The sentence name.
---@return number # The approximate duration.
function _G.SentenceDuration(name) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Prints `ServerLog: PARAM` without a newline, to the server log and console.
---
--- As of June 2022, if `sv_logecho` is set to `0` (defaults to `1`) the message will not print to console and will only be written to the server's log file.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ServerLog)
---@param parameter string The value to be printed to console.
function _G.ServerLog(parameter) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds the given string to the computers clipboard, which can then be pasted in or outside of GMod with Ctrl + V.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetClipboardText)
---@param text string The text to add to the clipboard.
function _G.SetClipboardText(text) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the environment for a function or a stack level. Can be used to sandbox code.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.setfenv)
---@param location function The function to set the environment for, or a number representing stack level.
---@param environment table Table to be used as the the environment.
---@return function # The function passed, otherwise nil.
function _G.setfenv(location, environment) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines an angle to be automatically networked to clients
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2Angle)
---@param index any Index to identify the global angle with
---@param angle Angle Angle to be networked
function _G.SetGlobal2Angle(index, angle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defined a boolean to be automatically networked to clients
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2Bool)
---@param index any Index to identify the global boolean with
---@param bool boolean Boolean to be networked
function _G.SetGlobal2Bool(index, bool) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines an entity to be automatically networked to clients
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2Entity)
---@param index any Index to identify the global entity with
---@param ent Entity Entity to be networked
function _G.SetGlobal2Entity(index, ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a floating point number to be automatically networked to clients
---
--- **WARNING**: This function has a floating point precision error. Use [Global.SetGlobalFloat](https://wiki.facepunch.com/gmod/Global.SetGlobalFloat) instead
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2Float)
---@param index any Index to identify the global float with
---@param float number Float to be networked
function _G.SetGlobal2Float(index, float) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets an integer that is shared between the server and all clients.
--- **WARNING**: The integer has a 32 bit limit. Use [Global.SetGlobalInt](https://wiki.facepunch.com/gmod/Global.SetGlobalInt) instead
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2Int)
---@param index string The unique index to identify the global value with.
---@param value number The value to set the global value to
function _G.SetGlobal2Int(index, value) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a string with a maximum of 511 characters to be automatically networked to clients
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2String)
---@param index any Index to identify the global string with
---@param string string String to be networked
function _G.SetGlobal2String(index, string) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a variable to be automatically networked to clients
--[[

| Allowed Types   |  
| --------------- |  
| Angle           |  
| Boolean         |  
| Entity          |  
| Float           |  
| Int             |  
| String          |  
| Vector          |  
**WARNING**: Trying to network a type that is not listed above will result in a nil value!

**NOTE**: Running this function clientside will only set it clientside for the client it is called on!
--]]
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2Var)
---@param index any Index to identify the global vector with
---@param value any Value to be networked
function _G.SetGlobal2Var(index, value) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a vector to be automatically networked to clients
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobal2Vector)
---@param index any Index to identify the global vector with
---@param vec Vector Vector to be networked
function _G.SetGlobal2Vector(index, vec) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines an angle to be automatically networked to clients
---
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2Angle](https://wiki.facepunch.com/gmod/Global.SetGlobal2Angle). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalAngle)
---@param index any Index to identify the global angle with
---@param angle Angle Angle to be networked
function _G.SetGlobalAngle(index, angle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defined a boolean to be automatically networked to clients
---
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2Bool](https://wiki.facepunch.com/gmod/Global.SetGlobal2Bool). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalBool)
---@param index any Index to identify the global boolean with
---@param bool boolean Boolean to be networked
function _G.SetGlobalBool(index, bool) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines an entity to be automatically networked to clients
---
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2Entity](https://wiki.facepunch.com/gmod/Global.SetGlobal2Entity). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalEntity)
---@param index any Index to identify the global entity with
---@param ent Entity Entity to be networked
function _G.SetGlobalEntity(index, ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a floating point number to be automatically networked to clients
---
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2Float](https://wiki.facepunch.com/gmod/Global.SetGlobal2Float). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalFloat)
---@param index any Index to identify the global float with
---@param float number Float to be networked
function _G.SetGlobalFloat(index, float) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets an integer that is shared between the server and all clients.
---
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2Int](https://wiki.facepunch.com/gmod/Global.SetGlobal2Int). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
--- This function will not round decimal values as it actually networks a 64 bit float internally.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalInt)
---@param index string The unique index to identify the global value with.
---@param value number The value to set the global value to
function _G.SetGlobalInt(index, value) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a string with a maximum of 199 characters to be automatically networked to clients
---
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2String](https://wiki.facepunch.com/gmod/Global.SetGlobal2String). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)
---
--- **NOTE**: If you want to have a higher characters limit use [Global.SetGlobal2String](https://wiki.facepunch.com/gmod/Global.SetGlobal2String)
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalString)
---@param index any Index to identify the global string with
---@param string string String to be networked
function _G.SetGlobalString(index, string) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a variable to be automatically networked to clients
--[[

| Allowed Types   |  
| --------------- |  
| Angle           |  
| Boolean         |  
| Entity          |  
| Float           |  
| Int             |  
| String          |  
| Vector          |  
**WARNING**: Trying to network a type that is not listed above will result in an error!  
There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2Var](https://wiki.facepunch.com/gmod/Global.SetGlobal2Var). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)

**NOTE**: Running this function clientside will only set it clientside for the client it is called on!
--]]
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalVar)
---@param index any Index to identify the global vector with
---@param value any Value to be networked
function _G.SetGlobalVar(index, value) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Defines a vector to be automatically networked to clients
--- **WARNING**: There's a 4095 slots Network limit. If you need more, consider using the [net](https://wiki.facepunch.com/gmod/net) library or [Global.SetGlobal2Vector](https://wiki.facepunch.com/gmod/Global.SetGlobal2Vector). You should also consider the fact that you have way too many variables. You can learn more about this limit here: [Networking_Usage](https://wiki.facepunch.com/gmod/Networking_Usage)
---
--- **NOTE**: Running this function clientside will only set it clientside for the client it is called on!
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetGlobalVector)
---@param index any Index to identify the global vector with
---@param vec Vector Vector to be networked
function _G.SetGlobalVector(index, vec) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets, changes or removes a table's metatable. Returns Tab (the first argument).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.setmetatable)
---@param Tab table The table who's metatable to change.
---@param Metatable table The metatable to assign.  If it's nil, the metatable will be removed.
---@return table # The first argument.
function _G.setmetatable(Tab, Metatable) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called by the engine to set which [constraint system](https://developer.valvesoftware.com/wiki/Phys_constraintsystem) the next created constraints should use.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SetPhysConstraintSystem)
---@param constraintSystem Entity Constraint system to use
function _G.SetPhysConstraintSystem(constraintSystem) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function can be used in a for loop instead of [Global.pairs](https://wiki.facepunch.com/gmod/Global.pairs). It sorts all **keys** alphabetically.
---
--- For sorting by specific **value member**, use [Global.SortedPairsByMemberValue](https://wiki.facepunch.com/gmod/Global.SortedPairsByMemberValue).
---
--- For sorting by **value**, use [Global.SortedPairsByValue](https://wiki.facepunch.com/gmod/Global.SortedPairsByValue).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SortedPairs)
---@param table table The table to sort
---@param desc? boolean Reverse the sorting order
---@return function # Iterator function
---@return table # The table being iterated over
function _G.SortedPairs(table, desc) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an iterator function that can be used to loop through a table in order of member values, when the values of the table are also tables and contain that member.
---
--- To sort by **value**, use [Global.SortedPairsByValue](https://wiki.facepunch.com/gmod/Global.SortedPairsByValue).
---
--- To sort by **keys**, use [Global.SortedPairs](https://wiki.facepunch.com/gmod/Global.SortedPairs).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SortedPairsByMemberValue)
---@param table table Table to create iterator for.
---@param memberKey any Key of the value member to sort by.
---@param descending? boolean Whether the iterator should iterate in descending order or not.
---@return function # Iterator function
---@return table # The table the iterator was created for.
function _G.SortedPairsByMemberValue(table, memberKey, descending) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an iterator function that can be used to loop through a table in order of its **values**.
---
--- To sort by specific **value member**, use [Global.SortedPairsByMemberValue](https://wiki.facepunch.com/gmod/Global.SortedPairsByMemberValue).
---
--- To sort by **keys**, use [Global.SortedPairs](https://wiki.facepunch.com/gmod/Global.SortedPairs).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SortedPairsByValue)
---@param table table Table to create iterator for
---@param descending? boolean Whether the iterator should iterate in descending order or not
---@return function # Iterator function
---@return table # The table which will be iterated over
function _G.SortedPairsByValue(table, descending) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Runs [util.PrecacheSound](https://wiki.facepunch.com/gmod/util.PrecacheSound) and returns the string.
---
--- [util.PrecacheSound](https://wiki.facepunch.com/gmod/util.PrecacheSound) does nothing and therefore so does this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Sound)
---@param soundPath string The soundpath to precache.
---@return string # The string passed as the first argument.
function _G.Sound(soundPath) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the approximate duration of the specified sound in seconds, for `.wav` and `.mp3` sounds.
--- 	This function only works on mp3 files if the file is encoded with constant bitrate.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SoundDuration)
---@param soundName string The sound file path.
---@return number # Sound duration in seconds.
function _G.SoundDuration(soundName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the input value in an escaped form so that it can safely be used inside of queries. The returned value is surrounded by quotes unless `noQuotes` is true. Alias of [sql.SQLStr](https://wiki.facepunch.com/gmod/sql.SQLStr).
---
--- **WARNING**: Do not use this function with external database engines such as `MySQL`. `MySQL` and `SQLite` use different escape sequences that are incompatible with each other! Escaping strings with inadequate functions is dangerous and will lead to SQL injection vulnerabilities.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SQLStr)
---@param input string String to be escaped
---@param noQuotes? boolean Set this as `true`, and the function will not wrap the input string in apostrophes.
---@return string # Escaped input
function _G.SQLStr(input, noQuotes) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a number based on the Size argument and your screen's width. Alias of [Global.ScreenScale](https://wiki.facepunch.com/gmod/Global.ScreenScale).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SScale)
---@param Size number The number you want to scale.
---@deprecated You should be using Global.ScreenScale instead.
function _G.SScale(Size) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the ordinal suffix of a given number.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.STNDRD)
---@param number number The number to find the ordinal suffix of.
---@return string # suffix
function _G.STNDRD(number) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Suppress any networking from the server to the specified player. This is automatically called by the engine before/after a player fires their weapon, reloads, or causes any other similar shared-predicted event to occur.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SuppressHostEvents)
---@param suppressPlayer Player The player to suppress any networking to.
function _G.SuppressHostEvents(suppressPlayer) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a highly accurate time in seconds since the start up, ideal for benchmarking. Unlike [Global.RealTime](https://wiki.facepunch.com/gmod/Global.RealTime), this value will be updated any time the function is called, allowing for sub-think precision.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.SysTime)
---@return number # Uptime of the server.
function _G.SysTime() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a TauntCamera object
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.TauntCamera)
---@return table # TauntCamera
function _G.TauntCamera() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Clears focus from any text entries player may have focused.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.TextEntryLoseFocus)
function _G.TextEntryLoseFocus() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a cosine value that fluctuates based on the current time
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.TimedCos)
---@param frequency number The frequency of fluctuation
---@param min number Minimum value
---@param max number Maximum value
---@param offset number Offset variable that doesn't affect the rate of change, but causes the returned value to be offset by time
---@return number # Cosine value
function _G.TimedCos(frequency, min, max, offset) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a sine value that fluctuates based on [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime). The value returned will be between the start value plus/minus the range value.
---
--- The range arguments don't work as intended. The existing (bugged) behavior is documented below.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.TimedSin)
---@param frequency number The frequency of fluctuation, in
---@param origin number The center value of the sine wave.
---@param max number This argument's distance from origin defines the size of the full range of the sine wave. For example, if origin is 3 and max is 5, then the full range of the sine wave is 5-3 = 2. 3 is the center point of the sine wave, so the sine wave will range between 2 and 4.
---@param offset number Offset variable that doesn't affect the rate of change, but causes the returned value to be offset by time
---@return number # Sine value
function _G.TimedSin(frequency, origin, max, offset) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to return an appropriate boolean for the given value
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.tobool)
---@param input any The object to be converted to a boolean
---@return boolean # * `false` for the boolean `false`.
--- * `false` for `"false"`.
--- * `false` for `"0"`.
--- * `false` for numeric `0`.
--- * `false` for `nil`.
--- * `true` otherwise.
function _G.tobool(input) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Toggles whether or not the named map is favorited in the new game list.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ToggleFavourite)
---@param map string Map to toggle favorite.
function _G.ToggleFavourite(map) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to convert the value to a number.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.tonumber)
---@param value any The value to convert. Can be a number or string.
---@param base? number The base used in the string. Can be any integer between 2 and 36, inclusive.
---@return number # The numeric representation of the value with the given base, or nil if the conversion failed.
function _G.tonumber(value, base) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to convert the value to a string. If the value is an object and its metatable has defined the __tostring metamethod, this will call that function.
---
--- [Global.print](https://wiki.facepunch.com/gmod/Global.print) also uses this functionality.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.tostring)
---@param value any The object to be converted to a string.
---@return string # The string representation of the value.
function _G.tostring(value) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns "Lua Cache File" if the given file name is in a certain string table, nothing otherwise.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.TranslateDownloadableName)
---@param filename string File name to test
---@return string # "Lua Cache File" if the given file name is in a certain string table, nothing otherwise.
function _G.TranslateDownloadableName(filename) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a string representing the name of the type of the passed object.
--- **WARNING**: This will return `table` if the input is [Global.Color](https://wiki.facepunch.com/gmod/Global.Color), consider using [Global.IsColor](https://wiki.facepunch.com/gmod/Global.IsColor) in that case.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.type)
---@param var any The object to get the type of.
---@return string # The name of the object's type.
function _G.type(var) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the associated type ID of the variable. Unlike [Global.type](https://wiki.facepunch.com/gmod/Global.type), this does not work with [no value](https://wiki.facepunch.com/gmod/no_value) - an argument must be provided.
---
--- **WARNING**: This will return `TYPE_TABLE` for [Color](https://wiki.facepunch.com/gmod/Color) objects.
---
--- All subclasses of [Entity](https://wiki.facepunch.com/gmod/Entity) will return `TYPE_ENTITY`.
---
--- This returns garbage for _LOADLIB objects.
--- This returns `TYPE_NIL` for [proto](https://wiki.facepunch.com/gmod/proto)s.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.TypeID)
---@param variable any The variable to get the type ID of.
---@return number # The type ID of the variable. See the Enums/TYPE.
function _G.TypeID(variable) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function takes a numeric indexed table and return all the members as a vararg. If specified, it will start at the given index and end at end index.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.unpack)
---@param tbl table The table to generate the vararg from.
---@param startIndex? number Which index to start from. Optional.
---@param endIndex? number Which index to end at. Optional, even if you set StartIndex.
---@return any ... # Output values
function _G.unpack(tbl, startIndex, endIndex) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the current asynchronous in-game time. This will not be synced with the players current clock allowing you to get [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) without interference from [Prediction](https://wiki.facepunch.com/gmod/Prediction).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UnPredictedCurTime)
---@return number # The asynchronous in-game time.
function _G.UnPredictedCurTime() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This function retrieves the values from [Global.GetAddonStatus](https://wiki.facepunch.com/gmod/Global.GetAddonStatus) and passes them to JS(JavaScript).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateAddonDisabledState)
function _G.UpdateAddonDisabledState() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This function is called by [Global.UpdateMapList](https://wiki.facepunch.com/gmod/Global.UpdateMapList) to pass the AddonMaps to JS to be used for the Search.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateAddonMapList)
function _G.UpdateAddonMapList() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the Gamelist.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateGames)
function _G.UpdateGames() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This function searches for all available languages and passes them to JS(JavaScript). JS then updates the Language list with the given languages.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateLanguages)
function _G.UpdateLanguages() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Runs JavaScript on the loading screen panel ([Global.GetLoadPanel](https://wiki.facepunch.com/gmod/Global.GetLoadPanel)).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateLoadPanel)
---@param javascript string JavaScript to run on the loading panel.
function _G.UpdateLoadPanel(javascript) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: Called from JS when starting a new game
---
--- This function updates the Map List
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateMapList)
function _G.UpdateMapList() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: Called from JS when starting a new game
---
--- Updates the Server Settings when called.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateServerSettings)
function _G.UpdateServerSettings() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Updates the Addons list.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UpdateSubscribedAddons)
function _G.UpdateSubscribedAddons() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function is an alias of [Global.IsUselessModel](https://wiki.facepunch.com/gmod/Global.IsUselessModel).
---
--- Returns whether or not a model is useless by checking that the file path is that of a proper model.
---
--- If the string ".mdl" is not found in the model name, the function will return true.
---
--- The function will also return true if any of the following strings are found in the given model name:
--- * "_gesture"
--- * "_anim"
--- * "_gst"
--- * "_pst"
--- * "_shd"
--- * "_ss"
--- * "_posture"
--- * "_anm"
--- * "ghostanim"
--- * "_paths"
--- * "_shared"
--- * "anim_"
--- * "gestures_"
--- * "shared_ragdoll_"
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.UTIL_IsUselessModel)
---@param modelName string The model name to be checked
---@return boolean # Whether or not the model is useless
---@deprecated You should use Global.IsUselessModel instead.
function _G.UTIL_IsUselessModel(modelName) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns if a panel is safe to use.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.ValidPanel)
---@param panel Panel The panel to validate.
---@deprecated You should use Global.IsValid instead
function _G.ValidPanel(panel) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a [Vector](https://wiki.facepunch.com/gmod/Vector) object.
--- 		**WARNING**: Creating Vectors is relatively expensive when used in often running hooks or in operations requiring very frequent calls (like loops for example) due to object creation and garbage collection. It is better to store the vector in a variable or to use the [default vectors](https://wiki.facepunch.com/gmod/Global_Variables#misc) available. See [Vector:Add](https://wiki.facepunch.com/gmod/Vector:Add).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Vector)
---@param x? number The x component of the vector.
---@param y? number The y component of the vector.
---@param z? number The z component of the vector.
---@return Vector # The created vector object.
function _G.Vector(x, y, z) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a [Vector](https://wiki.facepunch.com/gmod/Vector) object.
--- 		**WARNING**: Creating Vectors is relatively expensive when used in often running hooks or in operations requiring very frequent calls (like loops for example) due to object creation and garbage collection. It is better to store the vector in a variable or to use the [default vectors](https://wiki.facepunch.com/gmod/Global_Variables#misc) available. See [Vector:Add](https://wiki.facepunch.com/gmod/Vector:Add).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Vector)
---@param vector Vector Creates a new Vector that is a copy of the given Vector.
---@return Vector # The created vector object.
function _G.Vector(vector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a [Vector](https://wiki.facepunch.com/gmod/Vector) object.
--- 		**WARNING**: Creating Vectors is relatively expensive when used in often running hooks or in operations requiring very frequent calls (like loops for example) due to object creation and garbage collection. It is better to store the vector in a variable or to use the [default vectors](https://wiki.facepunch.com/gmod/Global_Variables#misc) available. See [Vector:Add](https://wiki.facepunch.com/gmod/Vector:Add).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.Vector)
---@param vectorString string Attempts to parse the input string from the Global.print format of an Vector.
---
--- Returns a Vector with its `x`, `y`, and `z` set to `0` if the string cannot be parsed.
---@return Vector # The created vector object.
function _G.Vector(vectorString) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a random vector whose components are each between min(inclusive), max(exclusive).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.VectorRand)
---@param min? number Min bound inclusive.
---@param max? number Max bound exclusive.
---@return Vector # The random direction vector.
function _G.VectorRand(min, max) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Identical to [Global.SysTime](https://wiki.facepunch.com/gmod/Global.SysTime).
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.VGUIFrameTime)
---@deprecated Use the function Global.SysTime instead.
function _G.VGUIFrameTime() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates and returns a [DShape](https://wiki.facepunch.com/gmod/DShape) rectangle GUI element with the given dimensions.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.VGUIRect)
---@param x number X position of the created element
---@param y number Y position of the created element
---@param w number Width of the created element
---@param h number Height of the created element
---@return Panel # DShape element
function _G.VGUIRect(x, y, w, h) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: Used by the **vgui_visualizelayout** convar
---
--- Briefly displays layout details of the given panel on-screen
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.VisualizeLayout)
---@param panel Panel Panel to display layout details of
function _G.VisualizeLayout(panel) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Returns a new WorkshopFileBase element
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.WorkshopFileBase)
---@param namespace string Namespace for the file base
---@param requiredTags table Tags required for a Workshop submission to be interacted with by the filebase
---@return table # WorkshopFileBase element
function _G.WorkshopFileBase(namespace, requiredTags) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Translates the specified position and angle into the specified coordinate system.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.WorldToLocal)
---@param position Vector The position that should be translated from the current to the new system.
---@param angle Angle The angles that should be translated from the current to the new system.
---@param newSystemOrigin Vector The origin of the system to translate to.
---@param newSystemAngles Angle The angles of the system to translate to.
---@return Vector # Local position
---@return Angle # Local angles
function _G.WorldToLocal(position, angle, newSystemOrigin, newSystemAngles) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Attempts to call the first function. If the execution succeeds, this returns `true` followed by the returns of the function. If execution fails, this returns `false` and the second function is called with the error message.
---
--- Unlike in [Global.pcall](https://wiki.facepunch.com/gmod/Global.pcall), the stack is not unwound and can therefore be used for stack analyses with the [debug](https://wiki.facepunch.com/gmod/debug).
---
--- This cannot stop errors from hooks called from the engine.
---
--- This does not stop [Global.Error](https://wiki.facepunch.com/gmod/Global.Error) and [Global.ErrorNoHalt](https://wiki.facepunch.com/gmod/Global.ErrorNoHalt) (As well as [Global.include](https://wiki.facepunch.com/gmod/Global.include)) from sending error messages to the server (if called clientside) or calling the [GM:OnLuaError](https://wiki.facepunch.com/gmod/GM:OnLuaError) hook. The success boolean returned will always return true and thus you will not get the error message returned. [Global.error](https://wiki.facepunch.com/gmod/Global.error) does not exhibit these behaviours.
---
---[View wiki](https://wiki.facepunch.com/gmod/Global.xpcall)
---@param func function The function to call initially.
---@param errorCallback function The function to be called if execution of the first fails; the error message is passed as a string.
---
--- You cannot throw an Global.error() from this callback: it will have no effect (not even stopping the callback).
---@param ... any Arguments to pass to the initial function.
---@return boolean # Status of the execution; `true` for success, `false` for failure.
---@return any ... # The returns of the first function if execution succeeded, otherwise the **first** return value of the error callback.
function _G.xpcall(func, errorCallback, ...) end
