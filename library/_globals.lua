---@meta

--- Source: https://wiki.facepunch.com/gmod/Global_Variables

--[[
  Global Tables
--]]

---@type GM
GAMEMODE = nil

--- Contains a list of all modules loaded from /modules/.
---@type table<string, any>
_MODULES = nil

--[[
  Global Non Constants
--]]

---@type boolean
---This is true whenever the current script is executed on the client. ( client and menu states ) See States. Always present.
CLIENT = nil

---@type boolean
---This is true whenever the current script is executed on the client state. See States.
CLIENT_DLL = nil

---@type boolean
---This is true whenever the current script is executed on the server state. See States. Always present.
SERVER = nil

---@type boolean
---This is true whenever the current script is executed on the server state.
GAME_DLL = nil

---@type boolean
---This is true when the script is being executed in the menu state. See States.
MENU_DLL = nil

---@type string
---Contains the name of the current active gamemode.
GAMEMODE_NAME = nil

---@type any
---Represents a non existent entity.
NULL = nil

---@type string
---Contains the version number of GMod. Example: "201211"
VERSION = nil

---@type string
---Contains a nicely formatted version of GMod. Example: "2020.12.11"
VERSIONSTR = nil

---@type string
---Contains the current networking version. Menu state only. Example: "2023.06.28"
NETVERSIONSTR = nil

---@type string
---The branch the game is running on. This will be "unknown" on main branch.
BRANCH = nil

---@type string
---Current Lua version. This contains "Lua 5.1" in GMod at the moment.
_VERSION = nil

---@type ENT
---The active env_skypaint entity. [(View Source)](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/base/entities/entities/env_skypaint.lua#L131)
g_SkyPaint = nil

---@type PANEL
---Base panel used for context menus. [(View Source)](https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/contextmenu.lua#L143)
g_ContextMenu = nil

---@type PANEL
---Base panel for displaying incoming/outgoing voice messages. [(View Source)](https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/gamemode/cl_voice.lua#L135)
g_VoicePanelList = nil

---@type PANEL
---Base panel for the spawn menu. [(View Source)](https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/spawnmenu.lua#L207)
g_SpawnMenu = nil

---@type PANEL
---Main menu of Gmod. Only available in the menu state. [(View Source)](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/menu/mainmenu.lua#L481)
pnlMainMenu = nil

--[[
  Global Constants
--]]

---@type Vector
---A vector with all values set to 0.
vector_origin = Vector(0, 0, 0)

---@type Vector
---A vector with the z value set to 1.
vector_up = Vector(0, 0, 1)

---@type Angle
---An Angle with all values set to 0.
angle_zero = Angle(0, 0, 0)

---@type Color
---A color with all values set to 255.
color_white = Color(255, 255, 255, 255)

---@type Color
---A color with all values set to 0 except alpha which is set to 255.
color_black = Color(0, 0, 0, 255)

---@type Color
---A color with only the alpha value set to 0.
color_transparent = Color(255, 255, 255, 0)
