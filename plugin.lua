-- LuaLS plugin for Garry's Mod Lua API specific features

local guide = require "parser.guide"
local helper = require "plugins.astHelper"


local scriptedScopes = {
	{ global = "ENT",    folder = "entities" },
	{ global = "SWEP",   folder = "weapons" },
	{ global = "EFFECT", folder = "effects" },
	{ global = "TOOL",   folder = "weapons/gmod_tool/stools" }
}

---@param uri string
---@return string?, string?
local function GetScopedClass(uri)
	for _, scope in ipairs(scriptedScopes) do
		-- gamemode based uri:
		-- .../gamemodes/my_gamemode/entities/entities/ent_class_name/any.lua
		-- .../gamemodes/my_gamemode/entities/entities/ent_class_name.lua
		local class = uri:match("/entities/" .. scope.folder .. "/([^/]+)/?[^/]*%.lua$")
		if not class then
			-- addon or root based uri:
			-- .../addons/my_addon/lua/entities/ent_class_name/any.lua
			-- .../addons/my_addon/lua/entities/ent_class_name.lua
			class = uri:match("/lua/" .. scope.folder .. "/([^/]+)/?[^/]*%.lua$")
		end
		if class then
			---@cast class string
			return scope.global, class
		end
	end
end


-- Typed definitions of functions that create a scripted class by name, e.g. `ents.Create("ent_class_name")`.
-- For matching names LuaLS picks these over the library definitions, so they return the scripted class.
local entsCreate = [[
---@param class "{class}"
---@return {class}
---@diagnostic disable-next-line: duplicate-set-field, missing-return
function ents.Create(class) end
]]

local entsCreateClientside = [[
---@param class "{class}"
---@return {class}
---@diagnostic disable-next-line: duplicate-set-field, missing-return
function ents.CreateClientside(class) end
]]

local playerGive = [[
do
	---@class Player
	local Player

	---@param weaponClassName "{class}"
	---@param bNoAmmo? boolean
	---@return {class}
	---@diagnostic disable-next-line: duplicate-set-field, missing-return
	function Player:Give(weaponClassName, bNoAmmo) end
end
]]

local scopedCreators = {
	ENT  = { entsCreate, entsCreateClientside },
	SWEP = { entsCreate, playerGive },
}

local vguiCreate = [[
---@param classname "{name}"
---@param parent? Panel
---@param name? string
---@return {class}
---@diagnostic disable-next-line: duplicate-set-field, missing-return
function vgui.Create(classname, parent, name) end
]]

---@param template string
---@param values table<string, string>
---@return string
local function FillTemplate(template, values)
	return (template:gsub("{(%w+)}", values))
end


---@class panelRegistration
---@field name string
---@field var string
---@field base string
---@field position integer

-- Finds panels registered with a literal name, e.g. `vgui.Register("MyPanel", PANEL, "DFrame")`.
---@param text string
---@return panelRegistration[]
local function FindPanelRegistrations(text)
	local panels = {}

	local function add(position, name, var, argsEnd)
		panels[#panels+1] = {
			name = name,
			var = var,
			base = text:match("^%s*,%s*[\"']([%w_%.]+)[\"']", argsEnd) or "Panel",
			position = position,
		}
	end

	for position, _, name, var, argsEnd in text:gmatch("()vgui%.Register%s*%(%s*([\"'])([%w_%.]+)%2%s*,%s*([%a_][%w_]*)()") do
		add(position, name, var, argsEnd)
	end

	for position, _, name, _, var, argsEnd in text:gmatch("()derma%.DefineControl%s*%(%s*([\"'])([%w_%.]+)%2%s*,%s*([\"']).-%4%s*,%s*([%a_][%w_]*)()") do
		add(position, name, var, argsEnd)
	end

	return panels
end

-- Finds the last `local var = ` declared before `position`, at the start of a line.
---@param text string
---@param var string
---@param position integer
---@return integer?
local function FindLocalDeclaration(text, var, position)
	local declaration
	-- Prefixed with a newline to also match the first line, so offsets are one too high
	for start in ("\n" .. text):gmatch("\n[ \t]*()local%s+" .. var .. "%s*=") do
		if start - 1 > position then
			break
		end
		declaration = start - 1
	end
	return declaration
end

-- Finds a `---@class` the user wrote in the doc comment directly above `position`.
---@param text string
---@param position integer
---@return string?
local function FindAnnotatedClass(text, position)
	local class
	for line in text:sub(1, position - 1):gmatch("([^\n]*)\n") do
		if line:match("^%s*%-%-%-") then
			class = class or line:match("@class%s+([%w_%.]+)")
		else
			class = nil
		end
	end
	return class
end


-- Inserted after `AccessorFunc(tab, key, "Name", force)`, in the same scope as the call.
local accessorFunc = [[

---@return {type}
---@diagnostic disable-next-line: missing-return
function {tab}:Get{name}() end

---@param value {type}
function {tab}:Set{name}(value) end]]

local forcedTypes = {
	FORCE_STRING = "string",
	FORCE_NUMBER = "number",
	FORCE_BOOL = "boolean",
	FORCE_ANGLE = "Angle",
	FORCE_COLOR = "Color",
	FORCE_VECTOR = "Vector",
}

---@param text string
---@return diff[]
local function GetAccessorFuncDiffs(text)
	local diffs = {}

	for tab, _, name, argsEnd in text:gmatch("AccessorFunc%s*%(%s*([%a_][%w_%.]*)%s*,[^,]-,%s*([\"'])([%w_]+)%2%s*()") do
		local force, finish = text:match("^,%s*([%w_]*)%s*%)()", argsEnd)
		finish = finish or text:match("^%)()", argsEnd)

		if finish then
			diffs[#diffs+1] = {
				start = finish,
				finish = finish - 1,
				text = FillTemplate(accessorFunc, { tab = tab, name = name, type = forcedTypes[force] or "any" }),
			}
		end
	end

	return diffs
end


---@class diff
---@field start integer # The number of bytes at the beginning of the replacement
---@field finish integer # The number of bytes at the end of the replacement
---@field text string # What to replace

---@param uri string # The uri of file
---@param text string # The content of file
---@return diff[]?
function OnSetText(uri, text)
	---@type diff[]
	local diffs = {}

	-- This should be the first diff, so that when the start positions match, it doesn't break the entire file.
	-- TODO: Do real line insert if its possible, instead of text patching.
	-- Detect "scripted" scope by folder and localize its global table to @class annotation.
	local global, class = GetScopedClass(uri)
	if global then
		diffs[#diffs+1] = {
			start = 1,
			finish = 0,
			text = "local " .. global .. "\n\n"
		}
	end

	-- Replace preprocessor keyword DEFINE_BASECLASS. The preprocessor is not smart enough, so this is text patching.
	for start, finish in text:gmatch("()DEFINE_BASECLASS()") do
		diffs[#diffs+1] = {
			---@cast start integer
			start = start,
			finish = finish - 1,
			text = "local BaseClass = baseclass.Get",
		}
	end

	for _, diff in ipairs(GetAccessorFuncDiffs(text)) do
		diffs[#diffs+1] = diff
	end

	-- Typed creator functions, appended to the end of the file
	local appended = {}

	for _, template in ipairs(global and scopedCreators[global] or {}) do
		appended[#appended+1] = FillTemplate(template, { class = class })
	end

	for _, panel in ipairs(FindPanelRegistrations(text)) do
		local declaration = FindLocalDeclaration(text, panel.var, panel.position)
		if declaration then
			local class = FindAnnotatedClass(text, declaration)
			if not class then
				class = panel.name
				diffs[#diffs+1] = {
					start = declaration,
					finish = declaration - 1,
					text = ("---@class %s : %s\n"):format(panel.name, panel.base),
				}
			end
			appended[#appended+1] = FillTemplate(vguiCreate, { name = panel.name, class = class })
		end
	end

	if #appended > 0 and #text > 0 then
		diffs[#diffs+1] = {
			start = #text + 1,
			finish = #text,
			text = "\n\n" .. table.concat(appended, "\n"),
		}
	end

	if #diffs == 0 then
		return nil
	end

	return diffs
end


local dtTypes = {
	String = "string",
	Bool = "boolean",
	Float = "number",
	Int = "integer",
	Vector = "Vector",
	Angle = "Angle",
	Entity = "Entity"
}

---@param ast parser.object
---@param classNode parser.object
---@param source parser.object
---@param group table
---@param isElement boolean
---@return boolean?
local function BindNetworkVar(ast, classNode, source, group, isElement)
	local args = guide.getParams(source)
	if not args or #args < (isElement and 4 or 3) then
		return
	end

	-- TODO: How to check argSelf "luadoc type" instead of double "node type"?
	local argSelf = args[1]
	local targetSelf = guide.getSelfNode(argSelf)
	if not targetSelf then
		return
	end
	if targetSelf.node ~= classNode then
		-- auto generated function self after colon
		targetSelf = guide.getSelfNode(targetSelf)
		if not targetSelf or targetSelf.node ~= classNode then
			return
		end
	end

	local argType = args[2]
	local argSlot = args[3]
	local argName = args[isElement and 5 or 4]
	---@cast argName +?

	-- TODO: How to check argName "luadoc type" instead of "node type"?
	if isElement then
		local argElement = args[4]
		if argSlot.type == "string" and argElement.type == "string" then
			argName = argElement
		end
	else
		if argSlot.type == "string" and (not argName or argName.type == "table") then
			argName = argSlot
		end
	end
	if not (argType.type == "string" and argName and argName.type == "string") then
		return
	end

	local dtType = isElement and "number" or dtTypes[argType[1]]
	local name = argName[1] ---@cast name string
	if not dtType then
		return
	end

	local ok = helper.addDoc(ast, classNode, "field", ("Set%s fun(self: Entity, value: %s)"):format(name, dtType), group)
	if not ok then
		return false
	end
	ok = helper.addDoc(ast, classNode, "field", ("Get%s fun(self: Entity): %s"):format(name, dtType), group)
	if not ok then
		return false
	end
end

---@param uri string # The uri of file
---@param ast parser.object # The file ast
---@return parser.object? ast
function OnTransformAst(uri, ast)
	-- Detect "scripted" scope by folder and localize its global table to @class annotation.
	local global, class = GetScopedClass(uri)
	if not global then
		return
	end

	local classNode = ast[1]
	if not (classNode and classNode.type == "local" and guide.getKeyName(classNode) == global) then
		return
	end

	local group = {}
	local ok = helper.addClassDoc(ast, classNode, class .. ": " .. global, group)
	if not ok then
		return
	end

	ok = guide.eachSourceType(ast, "call", function (source)
		local targetMethod = source.node
		local targetName = guide.getKeyName(targetMethod)
		if targetName ~= "NetworkVar" and targetName ~= "NetworkVarElement" then
			return
		end
		if guide.getKeyName(source.parent.parent) ~= "SetupDataTables" then
			return
		end
		-- TODO: How to check call self "luadoc type" instead of "node type"?
		local targetSelf = targetMethod.node and guide.getSelfNode(targetMethod.node)
		if not targetSelf or targetSelf.node ~= classNode then
			return
		end
		return BindNetworkVar(ast, classNode, source, group, targetName == "NetworkVarElement")
	end)
	if ok == false then
		return
	end

	return ast
end
