---@meta

--- The gui library is similar to the [input](https://wiki.facepunch.com/gmod/input) but features functions that are more focused on the mouse's interaction with GUI panels.
gui = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Opens the game menu overlay.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.ActivateGameUI)
function gui.ActivateGameUI() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Pushes text to the closed caption box.
--- **WARNING**: The function will not work, if the console command variable `closecaption` is set to 0.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.AddCaption)
---@param captionStream string The caption to emit. See [Closed Captions](https://developer.valvesoftware.com/wiki/Closed_Captions) for more info.
---
--- Note the ability to add special commands to captions, such as `` to mark the caption as a sound effect caption, which would be hidden if `cc_subtitles` is set to 1. (To only show dialogue subtitles)
---@param duration number How long the caption should stay for
---@param fromPlayer? boolean Is this caption coming from the player?
---
--- This is used to give different colors to the caption to differentiate, for example, whether the SMG is fired by the player or an NPC.
function gui.AddCaption(captionStream, duration, fromPlayer) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Enables the mouse cursor without restricting player movement, like using Sandbox's context menu. See [vgui.CursorVisible](https://wiki.facepunch.com/gmod/vgui.CursorVisible) for a function to see if the cursor is visible or not.
---
--- **NOTE**: Some [CUserCmd](https://wiki.facepunch.com/gmod/CUserCmd) functions will return incorrect values when this function is active because [the user input is getting overtaken by the vgui system](https://github.com/Facepunch/garrysmod-issues/issues/982#issuecomment-505671531).
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.EnableScreenClicker)
---@param enabled boolean Whether the cursor should be enabled or not. (true = enable, false = disable)
function gui.EnableScreenClicker(enabled) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Hides the game menu overlay.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.HideGameUI)
---@deprecated Will be disabled in a future patch. Use GM:OnPauseMenuShow instead.
function gui.HideGameUI() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a mouse move with the given deltas.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalCursorMoved)
---@param deltaX number The movement delta on the x axis.
---@param deltaY number The movement delta on the y axis.
function gui.InternalCursorMoved(deltaX, deltaY) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a key press for the given key.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalKeyCodePressed)
---@param key number The key, see Enums/KEY.
function gui.InternalKeyCodePressed(key) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a key release for the given key.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalKeyCodeReleased)
---@param key number The key, see Enums/KEY.
function gui.InternalKeyCodeReleased(key) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a key type typing to the specified key.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalKeyCodeTyped)
---@param key number The key, see Enums/KEY.
function gui.InternalKeyCodeTyped(key) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates an ASCII symbol writing.
--- Use to write text in the chat or in VGUI.
--- Doesn't work while the main menu is open!
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalKeyTyped)
---@param code number ASCII code of symbol, see [this chart](https://files.facepunch.com/wiki/files/ab571/8dc389806d65b98.gif).
function gui.InternalKeyTyped(code) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a double mouse key press for the given mouse key.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalMouseDoublePressed)
---@param key number The key, see Enums/MOUSE.
function gui.InternalMouseDoublePressed(key) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a mouse key press for the given mouse key.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalMousePressed)
---@param key number The key, see Enums/MOUSE.
function gui.InternalMousePressed(key) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a mouse key release for the given mouse key.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalMouseReleased)
---@param key number The key, see Enums/MOUSE.
function gui.InternalMouseReleased(key) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Simulates a mouse wheel scroll with the given delta.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.InternalMouseWheeled)
---@param delta number The amount of scrolling to simulate.
function gui.InternalMouseWheeled(delta) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the console is visible or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.IsConsoleVisible)
---@return boolean # Whether the console is visible or not.
function gui.IsConsoleVisible() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the game menu overlay ( main menu ) is open or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.IsGameUIVisible)
---@return boolean # Whether the game menu overlay ( main menu ) is open or not
function gui.IsGameUIVisible() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the cursor's position on the screen, or 0, 0 if cursor is not visible.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.MousePos)
---@return number # mouseX
---@return number # mouseY
---@deprecated Use input.GetCursorPos instead.
function gui.MousePos() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns x component of the mouse position.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.MouseX)
---@return number # mouseX
function gui.MouseX() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns y component of the mouse position.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.MouseY)
---@return number # mouseY
function gui.MouseY() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Opens specified URL in the steam overlay browser.
---
--- **NOTE**: When called clientside, user will be asked for confirmation before the website will open.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.OpenURL)
---@param url string URL to open, it has to start with either `http://` or `https://`.
function gui.OpenURL(url) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Converts the specified screen position to a **direction** vector local to the player's view. A related function is [Vector:ToScreen](https://wiki.facepunch.com/gmod/Vector:ToScreen), which translates a 3D position to a screen coordinate.
---
--- [util.AimVector](https://wiki.facepunch.com/gmod/util.AimVector) is a more generic version of this, using a custom view instead of the player's current view.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.ScreenToVector)
---@param x number X coordinate on the screen.
---@param y number Y coordinate on the screen.
---@return Vector # Direction
function gui.ScreenToVector(x, y) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the cursor's position on the screen, relative to the topleft corner of the window
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.SetMousePos)
---@param mouseX number The X coordinate to move the cursor to.
---@param mouseY number The Y coordinate to move the cursor to.
---@deprecated Use input.SetCursorPos instead.
function gui.SetMousePos(mouseX, mouseY) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Shows console in the game UI.
---
---[View wiki](https://wiki.facepunch.com/gmod/gui.ShowConsole)
function gui.ShowConsole() end
