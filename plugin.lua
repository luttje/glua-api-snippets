-- LuaLS plugin for Garry's Mod Lua API specific features

local guide = require "parser.guide"
local helper = require "plugins.astHelper"


local scriptedScopes = {
	{ global = "ENT",    folder = "entities" },
	{ global = "SWEP",   folder = "weapons" },
	{ global = "EFFECT", folder = "effects" }
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
	local global = GetScopedClass(uri)
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
