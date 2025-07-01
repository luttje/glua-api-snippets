---@meta

--- The engine library provides functions to access various features in the game's engine, most are related to the demo and save systems.
engine = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns non paused [Global.FrameTime](https://wiki.facepunch.com/gmod/Global.FrameTime).
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.AbsoluteFrameTime)
---@return number # Frame time.
function engine.AbsoluteFrameTime() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the name of the currently running gamemode.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.ActiveGamemode)
---@return string # The active gamemode's name. This is the name of the gamemode's folder.
function engine.ActiveGamemode() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Closes the server and completely exits.
---
--- To enable this function for use on your server, add `-allowquit` to your commandline, which will make this function run `quit keep_players` when executed, this also does not forcibly disconnect players.
---
--- This is also available when running in server test mode (launch option `-systemtest`). Server test mode is used internally at Facepunch as part of the build process to make sure that the dedicated servers aren't crashing on startup.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.CloseServer)
function engine.CloseServer() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a list of addons the player have subscribed to on the workshop.
---
--- This list will also include "Floating" .gma addons that are mounted by the game, but not the folder addons.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetAddons)
---@return table # A table of tables containing 8 keys (downloaded, models, title, file, mounted, wsid, size, updated).
function engine.GetAddons() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) When starting playing a demo, [engine.GetDemoPlaybackTick](https://wiki.facepunch.com/gmod/engine.GetDemoPlaybackTick) will be reset and its old value will be added to this functions return value.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetDemoPlaybackStartTick)
---@return number #
function engine.GetDemoPlaybackStartTick() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Current tick of currently loaded demo.
---
--- If not playing a demo, it will return amount of ticks since last demo playback.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetDemoPlaybackTick)
---@return number # The amount of ticks of currently loaded demo.
function engine.GetDemoPlaybackTick() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns time scale of demo playback.
---
--- If not during demo playback, returns 1.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetDemoPlaybackTimeScale)
---@return number # The time scale of demo playback, value of demo_timescale console variable.
function engine.GetDemoPlaybackTimeScale() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns total amount of ticks of currently loaded demo.
---
--- If not playing a demo, returns 0 or the value of last played demo.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetDemoPlaybackTotalTicks)
---@return number # Total amount of ticks of currently loaded demo.
function engine.GetDemoPlaybackTotalTicks() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a table containing info for all installed gamemodes
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetGamemodes)
---@return table # gamemodes
function engine.GetGamemodes() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an array of tables corresponding to all games from which Garry's Mod supports mounting content.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetGames)
---@return table # A table of tables containing all mountable games
function engine.GetGames() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the UGC (demos, saves and dupes) the player have subscribed to on the workshop.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.GetUserContent)
---@return table # Returns a table with 5 keys (title, type, tags, wsid, timeadded)
---@deprecated Used internally for in-game menus, may be merged in the future into engine.GetAddons.
function engine.GetUserContent() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns true if we're currently playing a demo.
---
--- You will notice that there's no server-side version of this. That's because there is no server when playing a demo. Demos are both recorded and played back purely clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.IsPlayingDemo)
---@return boolean # Whether the game is currently playing a demo or not.
function engine.IsPlayingDemo() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns true if the game is currently recording a demo file (.dem) using gm_demo
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.IsRecordingDemo)
---@return boolean # Whether the game is currently recording a demo or not.
function engine.IsRecordingDemo() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) This is a direct binding to the function `engine->LightStyle`. This function allows you to change the default light style of the map - so you can make lighting lighter or darker. You’ll need to call [render.RedownloadAllLightmaps](https://wiki.facepunch.com/gmod/render.RedownloadAllLightmaps) clientside to refresh the lightmaps to this new color.
---
--- Calling this function with arguments 0 and "a" will cause dynamic lights such as those produced by the Light tool to stop working.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.LightStyle)
---@param lightstyle number The lightstyle to edit. 0 to 63. If you want to edit map lighting, you want to set this to 0.
---@param pattern string The pattern to change the lightstyle to. `a` is the darkest, `z` is the brightest. You can use stuff like "abcxyz" to make flashing patterns. The normal brightness for a map is `m`. Values over `z` are allowed, `~` for instance.
function engine.LightStyle(lightstyle, pattern) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Loads a duplication from the local filesystem.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.OpenDupe)
---@param dupeName string Name of the file. e.g, `engine.OpenDupe("dupes/8b809dd7a1a9a375e75be01cdc12e61f.dupe")`
---@return table # A table with a simple field:
--- * string `data` - Compressed dupe data. Use util.JSONToTable to make it into a format useable by the duplicator tool.
function engine.OpenDupe(dupeName) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns an estimate of the server's performance. Equivalent to calling [Global.FrameTime](https://wiki.facepunch.com/gmod/Global.FrameTime) from the server, according to source code.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.ServerFrameTime)
---@return number # Frame time.
---@return number # Server framerate [standard deviation](https://en.wikipedia.org/wiki/Standard_deviation).
function engine.ServerFrameTime() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Sets the mounting options for mountable content.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.SetMounted)
---@param depotID string The depot id of the game to mount.
---@param doMount boolean The mount state, true to mount, false to unmount
function engine.SetMounted(depotID, doMount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the number of ticks since the game server started.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.TickCount)
---@return number # Number of ticks since the game server started.
function engine.TickCount() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the time interval between each game tick in seconds.
---
--- This function is useful for making animations (usually serverside, such as doors rotating) and similar things to be independent of the tickrate in hooks that run at the tick rate, such as [GM:Tick](https://wiki.facepunch.com/gmod/GM:Tick).
---
--- Clientside you'd want to use [Global.FrameTime](https://wiki.facepunch.com/gmod/Global.FrameTime) for this purpose in hooks that run every frame.
---
--- The default tickrate is `66.6666`, aka `16` milliseconds interval between each game tick.
--- The tickrate can be adjusted via the `-tickrate` [command line option](https://wiki.facepunch.com/gmod/Command_Line_Parameters).
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.TickInterval)
---@return number # Number of seconds between each gametick.
function engine.TickInterval() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns video recording settings set by [video.Record](https://wiki.facepunch.com/gmod/video.Record). Used by Demo-To-Video feature.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.VideoSettings)
---@return table # The video recording settings, see Structures/VideoData.
function engine.VideoSettings() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: Do not use.
---
--- Saves a duplication as a file.
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.WriteDupe)
---@param dupe string Dupe table, encoded by util.TableToJSON and compressed by util.Compress
---@param jpeg string The dupe icon, created by render.Capture
function engine.WriteDupe(dupe, jpeg) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: Do not use.
---
--- Stores savedata into the game (can be loaded using the LoadGame menu)
---
---[View wiki](https://wiki.facepunch.com/gmod/engine.WriteSave)
---@param saveData string Data generated by gmsave.SaveMap.
---@param name string Name the save will have.
function engine.WriteSave(saveData, name) end
