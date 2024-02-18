---@meta

--- The input library allows you to gather information about the clients input devices (mouse & keyboard), such as the cursor position and whether a key is pressed or not.
input = {}

---[CLIENT AND MENU] Returns the last key captured by key trapping.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.CheckKeyTrapping)
---@return number # The key, see Enums/KEY
function input.CheckKeyTrapping() end

---[CLIENT AND MENU] Returns the digital value of an analog stick on the current (set up via convars) controller.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.GetAnalogValue)
---@param axis number The analog axis to poll. See Enums/ANALOG.
---@return number # The digital value.  A joystick axis returns `-32768` when it's pushed completely up/completely left, & returns `32767` when it's pushed completely down/completely right.  A mouse wheel starts @ `0` & increases by `1` for every unit of scroll up/decreases by `1` for every unit of scroll down.  A mouse axis is `0` when the arrow is @ the top or left of the screen; When the arrow is @ the bottom right of the screen, the mouse y axis is the height of the screen & the mouse x axis is the width of the screen (in pixels). Note that in game, the “arrow” stays near the middle of the screen.  Trigger axis always return `0` (verify).
function input.GetAnalogValue(axis) end

---[CLIENT AND MENU] Returns the cursor's position on the screen.
--- On macOS, the cursor isn't locked on the middle of the screen which causes a significant offset of the positions returned by this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.GetCursorPos)
---@return number # The cursors position on the X axis.
---@return number # The cursors position on the Y axis.
function input.GetCursorPos() end

---[CLIENT AND MENU] Gets the button code from a button name. This is opposite of input.GetKeyName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.GetKeyCode)
---@param button string The internal button name, such as E or SHIFT.
---@return number # The button code, see Enums/BUTTON_CODE.
function input.GetKeyCode(button) end

---[CLIENT AND MENU] Gets the button name from a numeric button code. The name needs to be translated with language.GetPhrase before being displayed.
---
--- Despite the name of the function, this also works for the full range of keys in Enums/BUTTON_CODE.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.GetKeyName)
---@param button number The button, see Enums/BUTTON_CODE.
---@return string # Button name.
function input.GetKeyName(button) end

---[CLIENT AND MENU] Gets whether the specified button code is down.
---
--- Unlike input.IsKeyDown this can also detect joystick presses from Enums/JOYSTICK
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.IsButtonDown)
---@param button number The button, valid values are in the range of Enums/BUTTON_CODE.
---@return boolean # Is the button down
function input.IsButtonDown(button) end

---[CLIENT AND MENU] Returns whether a control key is being pressed
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.IsControlDown)
---@return boolean # Is Ctrl key down or not
function input.IsControlDown() end

---[CLIENT AND MENU] Gets whether a key is down.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.IsKeyDown)
---@param key number The key, see Enums/KEY.
---@return boolean # Is the key down
function input.IsKeyDown(key) end

---[CLIENT AND MENU] Returns whether key trapping is activate and the next key press will be captured.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.IsKeyTrapping)
---@return boolean # Whether key trapping active or not
function input.IsKeyTrapping() end

---[CLIENT AND MENU] Gets whether a mouse button is down
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.IsMouseDown)
---@param mouseKey number The key, see Enums/MOUSE
---@return boolean # Is the key down
function input.IsMouseDown(mouseKey) end

---[CLIENT AND MENU] Gets whether a shift key is being pressed
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.IsShiftDown)
---@return boolean # isDown
function input.IsShiftDown() end

---[CLIENT AND MENU] Returns the client's bound key for the specified console command. If the player has multiple keys bound to a single command, there is no defined behavior of which key will be returned.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.LookupBinding)
---@param binding string The binding name
---@param exact? boolean True if the binding should match exactly
---@return string # The first key found with that binding or no value if no key with given binding was found.  See also input.GetKeyCode.
function input.LookupBinding(binding, exact) end

---[CLIENT AND MENU] Returns the bind string that the given key is bound to.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.LookupKeyBinding)
---@param key number Key from Enums/BUTTON_CODE
---@return string # The bind string of the given key.
function input.LookupKeyBinding(key) end

---[CLIENT] Switches to the provided weapon on the next CUserCmd generation/CreateMove call. Direct binding to [CInput::MakeWeaponSelection](https://github.com/LestaD/SourceEngine2007/blob/43a5c90a5ada1e69ca044595383be67f40b33c61/se2007/game/client/in_main.cpp#L929-L932).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.SelectWeapon)
---@param weapon Weapon The weapon entity to switch to.
function input.SelectWeapon(weapon) end

---[CLIENT AND MENU] Sets the cursor's position on the screen, relative to the topleft corner of the window
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.SetCursorPos)
---@param mouseX number X coordinate for mouse position
---@param mouseY number Y coordinate for mouse position
function input.SetCursorPos(mouseX, mouseY) end

---[CLIENT AND MENU] Begins waiting for a key to be pressed so we can save it for input.CheckKeyTrapping. Used by the DBinder.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.StartKeyTrapping)
function input.StartKeyTrapping() end

---[CLIENT AND MENU] Translates a console command alias, basically reverse of the `alias` console command.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.TranslateAlias)
---@param command string The alias to lookup.
---@return string # The command(s) this alias will execute if ran, or nil if the alias doesn't exist.
function input.TranslateAlias(command) end

---[CLIENT AND MENU] Returns whether a key was initially pressed in the same frame this function was called.
---
--- This function only works in Move hooks, and will detect key presses even in main menu or when a typing in a text field.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.WasKeyPressed)
---@param key number The key, see Enums/KEY.
---@return boolean # True if the key was initially pressed the same frame that this function was called, false otherwise.
function input.WasKeyPressed(key) end

---[CLIENT AND MENU] Returns whether a key was released in the same frame this function was called.
---
--- This function only works in Move hooks, and will detect key releases even in main menu or when a typing in a text field.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.WasKeyReleased)
---@param key number The key, see Enums/KEY.
---@return boolean # True if the key was released the same frame that this function was called, false otherwise.
function input.WasKeyReleased(key) end

---[CLIENT AND MENU] Returns whether the key is being held down or not.
---
--- This function only works in Move hooks, and will detect key events even in main menu or when a typing in a text field.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.WasKeyTyped)
---@param key number The key to test, see Enums/KEY
---@return boolean # Whether the key is being held down or not.
function input.WasKeyTyped(key) end

---[CLIENT AND MENU] Returns whether a mouse key was double pressed in the same frame this function was called.
---
---
--- If this function returns true, input.WasMousePressed will return false.
---
--- This function only works in Move hooks, and will detect mouse events even in main menu or when a typing in a text field.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.WasMouseDoublePressed)
---@param button number The mouse button to test, see Enums/MOUSE
---@return boolean # Whether the mouse key was double pressed or not.
function input.WasMouseDoublePressed(button) end

---[CLIENT AND MENU] Returns whether a mouse key was initially pressed in the same frame this function was called.
---
---
--- If input.WasMouseDoublePressed returns true, this function will return false.
---
--- This function only works in Move hooks, and will detect mouse events even in main menu or when a typing in a text field.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.WasMousePressed)
---@param key number The key, see Enums/MOUSE
---@return boolean # True if the mouse key was initially pressed the same frame that this function was called, false otherwise.
function input.WasMousePressed(key) end

---[CLIENT AND MENU] Returns whether a mouse key was released in the same frame this function was called.
---
--- This function only works in Move hooks, and will detect mouse events even in main menu or when a typing in a text field.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/input.WasMouseReleased)
---@param key number The key to test, see Enums/MOUSE
---@return boolean # True if the mouse key was released the same frame that this function was called, false otherwise.
function input.WasMouseReleased(key) end
