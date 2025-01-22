---@meta

--- The debugoverlay library is mainly useful for 3D debugging, it can be used to draw shapes on the screen for debug purposes.
---
--- **NOTE**: These functions will not do anything unless the **developer** console variable is set to non 0.
debugoverlay = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays an axis indicator at the specified position.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Axis)
---@param origin Vector Position origin
---@param ang Angle Angle of the axis
---@param size number Size of the axis
---@param lifetime? number Number of seconds to appear
---@param ignoreZ? boolean If true, will draw on top of everything; ignoring the Z buffer
function debugoverlay.Axis(origin, ang, size, lifetime, ignoreZ) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays a solid coloured box at the specified position.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Box)
---@param origin Vector Position origin
---@param mins Vector Minimum bounds of the box
---@param maxs Vector Maximum bounds of the box
---@param lifetime? number Number of seconds to appear
---@param color? table The color of the box. Uses the Color
function debugoverlay.Box(origin, mins, maxs, lifetime, color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays a solid colored rotated box at the specified position.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.BoxAngles)
---@param pos Vector World position
---@param mins Vector The mins of the box (lowest corner)
---@param maxs Vector The maxs of the box (highest corner)
---@param ang Angle The angle to draw the box at
---@param lifetime? number Amount of seconds to show the box
---@param color? table The color of the box. Uses the Color
function debugoverlay.BoxAngles(pos, mins, maxs, ang, lifetime, color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a coloured cross at the specified position for the specified time.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Cross)
---@param position Vector Position origin
---@param size number Size of the cross
---@param lifetime? number Number of seconds the cross will appear for
---@param color? table The color of the cross. Uses the Color
---@param ignoreZ? boolean If true, will draw on top of everything; ignoring the Z buffer
function debugoverlay.Cross(position, size, lifetime, color, ignoreZ) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays 2D text at the specified coordinates.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.EntityTextAtPosition)
---@param pos Vector The position in 3D to display the text.
---@param line number Line of text, will offset text on the to display the new line unobstructed
---@param text string The text to display
---@param lifetime? number Number of seconds to appear
---@param color? table The color of the box. Uses the Color
function debugoverlay.EntityTextAtPosition(pos, line, text, lifetime, color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Draws a 3D grid of limited size in given position.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Grid)
---@param position Vector
function debugoverlay.Grid(position) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays a coloured line at the specified position.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Line)
---@param pos1 Vector First position of the line
---@param pos2 Vector Second position of the line
---@param lifetime? number Number of seconds to appear
---@param color? table The color of the line. Uses the Color
---@param ignoreZ? boolean If true, will draw on top of everything; ignoring the Z buffer
function debugoverlay.Line(pos1, pos2, lifetime, color, ignoreZ) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays text triangle at the specified coordinates.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.ScreenText)
---@param x number The position of the text, from 0 ( left ) to 1 ( right ).
---@param y number The position of the text, from 0 ( top ) to 1 ( bottom ).
---@param text string The text to display
---@param lifetime? number Number of seconds to appear
---@param color? table The color of the box. Uses the Color
function debugoverlay.ScreenText(x, y, text, lifetime, color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays a coloured sphere at the specified position.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Sphere)
---@param origin Vector Position origin
---@param size number Size of the sphere
---@param lifetime? number Number of seconds to appear
---@param color? table The color of the sphere. Uses the Color
---@param ignoreZ? boolean If true, will draw on top of everything; ignoring the Z buffer
function debugoverlay.Sphere(origin, size, lifetime, color, ignoreZ) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays "swept" box, two boxes connected with lines by their vertices.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.SweptBox)
---@param vStart Vector The start position of the box.
---@param vEnd Vector The end position of the box.
---@param vMins Vector The "minimum" edge of the box.
---@param vMaxs Vector The "maximum" edge of the box.
---@param ang Angle
---@param lifetime? number Number of seconds to appear
---@param color? table The color of the box. Uses the Color
function debugoverlay.SweptBox(vStart, vEnd, vMins, vMaxs, ang, lifetime, color) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays text at the specified position.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Text)
---@param origin Vector Position origin
---@param text string String message to display
---@param lifetime? number Number of seconds to appear
---@param viewCheck? boolean Clip text that is obscured
function debugoverlay.Text(origin, text, lifetime, viewCheck) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Displays a colored triangle at the specified coordinates.
---
--- **NOTE**: This function will silently fail if the `developer` [ConVar](https://wiki.facepunch.com/gmod/ConVar) is set to `0`.
--- It is not networked to clients, except for the [listen server host](https://wiki.facepunch.com/gmod/Player:IsListenServerHost).
--- It will not work when the game is paused.
---
---[View wiki](https://wiki.facepunch.com/gmod/debugoverlay.Triangle)
---@param pos1 Vector First point of the triangle
---@param pos2 Vector Second point of the triangle
---@param pos3 Vector Third point of the triangle
---@param lifetime? number Number of seconds to appear
---@param color? table The color of the box. Uses the Color
---@param ignoreZ? boolean If true, will draw on top of everything; ignoring the Z buffer
function debugoverlay.Triangle(pos1, pos2, pos3, lifetime, color, ignoreZ) end
