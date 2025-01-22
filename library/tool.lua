---@meta

--- A list of functions available inside a Sandbox Toolgun tool.
---
--- You can find the hooks [here](https://wiki.facepunch.com/gmod/TOOL_Hooks), and members [here](https://wiki.facepunch.com/gmod/Structures/TOOL).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool)
---@class Tool
local Tool = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called when the tool's control panel needs to be rebuilt.
---
--- **WARNING**: Due to historical reasons, this hook does not provide the tool object as `self`! See examples.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL.BuildCPanel)
---@param cpanel Panel The DForm control panel to add settings to.
function TOOL:BuildCPanel(cpanel) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether the tool is allowed to be used or not. This function ignores the [SANDBOX:CanTool](https://wiki.facepunch.com/gmod/SANDBOX:CanTool) hook.
---
--- By default this will always return true clientside and uses `TOOL.AllowedCVar`which is a [ConVar](https://wiki.facepunch.com/gmod/ConVar) object pointing to  `toolmode_allow_*toolname*` convar on the server.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:Allowed)
---@return boolean # Returns true if the tool is allowed.
function Tool:Allowed() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Builds a list of all ConVars set via the ClientConVar variable on the [Structures/TOOL](https://wiki.facepunch.com/gmod/Structures/TOOL) and their default values. This is used for the preset system.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:BuildConVarList)
---@return table # A list of all convars and their default values.
function Tool:BuildConVarList() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is called automatically for most toolgun actions so you shouldn't need to use it.
---
--- Checks all added objects to see if they're still valid, if not, clears the list of objects.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:CheckObjects)
function Tool:CheckObjects() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Clears all objects previously set with [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:ClearObjects)
function Tool:ClearObjects() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is called automatically for all tools.
---
--- Initializes the tool object
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:Create)
---@return Tool # The created tool object.
function Tool:Create() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is called automatically for all tools.
---
--- Creates clientside ConVars based on the ClientConVar table specified in the tool structure. Also creates the 'toolmode_allow_X' ConVar.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:CreateConVars)
function Tool:CreateConVars() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when [WEAPON:Deploy](https://wiki.facepunch.com/gmod/WEAPON:Deploy) of the toolgun is called.
---
--- This is also called when switching from another tool on the server.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:Deploy)
---@return boolean # Return true to allow switching away from the toolgun using lastinv command
function TOOL:Deploy() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called when [WEAPON:DrawHUD](https://wiki.facepunch.com/gmod/WEAPON:DrawHUD) of the toolgun is called, only when the user has this tool selected.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:DrawHUD)
function TOOL:DrawHUD() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called after the default tool screen has been drawn from [WEAPON:RenderScreen](https://wiki.facepunch.com/gmod/WEAPON:RenderScreen).
---
--- **NOTE**: If this method exists on the TOOL object table, the default scrolling text will not be drawn
---
--- **NOTE**: Materials rendered in this hook require $ignorez parameter to draw properly.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:DrawToolScreen)
---@param width number The width of the tool's screen in pixels.
---@param height number The height of the tool's screen in pixels.
function TOOL:DrawToolScreen(width, height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Called when [WEAPON:Think](https://wiki.facepunch.com/gmod/WEAPON:Think) of the toolgun is called, only when the user has this tool selected.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:FreezeMovement)
---@return boolean # Return true to freeze the player
function TOOL:FreezeMovement() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves a physics bone number previously stored using [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetBone)
---@param id number The id of the object which was set in Tool:SetObject.
---@return number # Associated physics bone with given id.
function Tool:GetBone(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Attempts to grab a clientside tool [ConVar](https://wiki.facepunch.com/gmod/ConVar) value as a [boolean](https://wiki.facepunch.com/gmod/boolean).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetClientBool)
---@param name string Name of the ConVar to retrieve. The function will automatically add the `mytoolfilename_` part to it.
---@param default? boolean The default value to return in case the lookup fails.
---@return number # The value of the requested ConVar. It will be true if the value if the convar is not 0, just like ConVar:GetBool
function Tool:GetClientBool(name, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Attempts to grab a clientside tool [ConVar](https://wiki.facepunch.com/gmod/ConVar) as a [string](https://wiki.facepunch.com/gmod/string).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetClientInfo)
---@param name string Name of the convar to retrieve. The function will automatically add the `mytoolfilename_` part to it.
---@return string # The value of the requested ConVar.
function Tool:GetClientInfo(name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Attempts to grab a clientside tool [ConVar](https://wiki.facepunch.com/gmod/ConVar)'s value as a [number](https://wiki.facepunch.com/gmod/number).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetClientNumber)
---@param name string Name of the convar to retrieve. The function will automatically add the `mytoolfilename_` part to it.
---@param default? number The default value to return in case the lookup fails.
---@return number # The value of the requested ConVar.
function Tool:GetClientNumber(name, default) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves an Entity previously stored using [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetEnt)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Entity # Associated Entity with given id.
function Tool:GetEnt(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a language key based on this tool's name and the current stage it is on.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetHelpText)
---@return string # The returned language key, for example `"#tool.weld.1"`
function Tool:GetHelpText() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves an local vector previously stored using [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject).
--- See also [Tool:GetPos](https://wiki.facepunch.com/gmod/Tool:GetPos).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetLocalPos)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Vector # Associated local vector with given id.
function Tool:GetLocalPos(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the name of the current tool mode.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetMode)
---@return string # The current tool mode.
function Tool:GetMode() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves an normal vector previously stored using [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetNormal)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Vector # Associated normal vector with given id.
function Tool:GetNormal(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the current operation of the tool set by [Tool:SetOperation](https://wiki.facepunch.com/gmod/Tool:SetOperation).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetOperation)
---@return number # The current operation the tool is at.
function Tool:GetOperation() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the owner of this tool.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetOwner)
---@return Player # Player using the tool
function Tool:GetOwner() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves an [PhysObj](https://wiki.facepunch.com/gmod/PhysObj) previously stored using [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject).
--- See also [Tool:GetEnt](https://wiki.facepunch.com/gmod/Tool:GetEnt).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetPhys)
---@param id number The id of the object which was set in Tool:SetObject.
---@return PhysObj # Associated PhysObj with given id. If it wasn't specified, returns current PhysObj of associated Entity.
function Tool:GetPhys(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves an vector previously stored using [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject). See also [Tool:GetLocalPos](https://wiki.facepunch.com/gmod/Tool:GetLocalPos).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetPos)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Vector # Associated vector with given id. The vector is converted from Tool:GetLocalPos.
function Tool:GetPos(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Attempts to grab a serverside tool [ConVar](https://wiki.facepunch.com/gmod/ConVar).
--- This will not do anything on client, despite the function being defined shared.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetServerInfo)
---@param name string Name of the convar to retrieve. The function will automatically add the "mytoolfilename_" part to it.
---@return string # The value of the requested ConVar.
function Tool:GetServerInfo(name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the current stage of the tool set by [Tool:SetStage](https://wiki.facepunch.com/gmod/Tool:SetStage).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetStage)
---@return number # The current stage of the current operation the tool is at.
function Tool:GetStage() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the Tool Gun (`gmod_tool`) Scripted [Weapon](https://wiki.facepunch.com/gmod/Weapon).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetSWEP)
---@return Weapon # The tool gun weapon. (`gmod_tool`)
---@deprecated Use Tool:GetWeapon instead.
function Tool:GetSWEP() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the Tool Gun (`gmod_tool`) Scripted [Weapon](https://wiki.facepunch.com/gmod/Weapon).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:GetWeapon)
---@return Weapon # The tool gun weapon. (`gmod_tool`)
function Tool:GetWeapon() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when [WEAPON:Holster](https://wiki.facepunch.com/gmod/WEAPON:Holster) of the toolgun is called, when switching between different toolguns.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:Holster)
function TOOL:Holster() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when the user left clicks with the tool.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:LeftClick)
---@param tr table A trace from user's eyes to wherever they aim at. See Structures/TraceResult
---@return boolean # Return `true` to draw the tool gun beam and play fire animations, `false` otherwise.
function TOOL:LeftClick(tr) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Initializes the ghost entity with the given model. Removes any old ghost entity if called multiple times.
---
--- The ghost is a regular prop_physics entity in singleplayer games, and a clientside prop in multiplayer games.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:MakeGhostEntity)
---@param model string The model of the new ghost entity
---@param pos Vector Position to initialize the ghost entity at, usually not needed since this is updated in Tool:UpdateGhostEntity.
---@param angle Angle Angle to initialize the ghost entity at, usually not needed since this is updated in Tool:UpdateGhostEntity.
function Tool:MakeGhostEntity(model, pos, angle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the amount of stored objects ( [Entity](https://wiki.facepunch.com/gmod/Entity)s ) the tool has.
--- Are TOOLs limited to 4 entities?
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:NumObjects)
---@return number # The amount of stored objects, or Tool:GetStage clientide.
function Tool:NumObjects() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Automatically forces the tool's control panel to be rebuilt.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:RebuildControlPanel)
---@param ... any Any arguments given to this function will be added to TOOL.BuildCPanel's arguments.
function Tool:RebuildControlPanel(...) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Removes any ghost entity created for this tool.
---
--- This is called automatically at various points, including when changing tools, holstering the toolgun, therefore it is a very good idea to implement this callback in your custom tool to cleanup any custom ghost entities.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:ReleaseGhostEntity)
function Tool:ReleaseGhostEntity() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when the user presses the reload key with the tool out.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:Reload)
---@param tr table A trace from user's eyes to wherever they aim at. See Structures/TraceResult
---@return boolean # Return `true` to draw the tool gun beam and play fire animations, `false` otherwise
function TOOL:Reload(tr) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when the user right clicks with the tool.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:RightClick)
---@param tr table A trace from user's eyes to wherever they aim at. See Structures/TraceResult
---@return boolean # Return `true` to draw the tool gun beam and play fire animations, `false` otherwise
function TOOL:RightClick(tr) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Stores an [Entity](https://wiki.facepunch.com/gmod/Entity) for later use in the tool.
---
--- The stored values can be retrieved by [Tool:GetEnt](https://wiki.facepunch.com/gmod/Tool:GetEnt), [Tool:GetPos](https://wiki.facepunch.com/gmod/Tool:GetPos), [Tool:GetLocalPos](https://wiki.facepunch.com/gmod/Tool:GetLocalPos), [Tool:GetPhys](https://wiki.facepunch.com/gmod/Tool:GetPhys), [Tool:GetBone](https://wiki.facepunch.com/gmod/Tool:GetBone) and [Tool:GetNormal](https://wiki.facepunch.com/gmod/Tool:GetNormal)
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:SetObject)
---@param id number The id of the object to store.
---@param ent Entity The entity to store.
---@param pos Vector The position to store.
--- this position is in **global space** and is internally converted to **local space** relative to the object, so when you retrieve it later it will be corrected to the object's new position
---@param phys PhysObj The physics object to store.
---@param bone number The hit bone to store.
---@param normal Vector The hit normal to store.
function Tool:SetObject(id, ent, pos, phys, bone, normal) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the current operation of the tool. Does nothing clientside. See also [Tool:SetStage](https://wiki.facepunch.com/gmod/Tool:SetStage).
---
--- Operations and stages work as follows:
--- * Operation 1
--- * * Stage 1
--- * * Stage 2
--- * * Stage 3
--- * Operation 2
--- * * Stage 1
--- * * Stage 2
--- * * Stage ...
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:SetOperation)
---@param operation number The new operation ID to set.
function Tool:SetOperation(operation) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the current stage of the tool. Does nothing clientside.
---
--- See also [Tool:SetOperation](https://wiki.facepunch.com/gmod/Tool:SetOperation).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:SetStage)
---@param stage number The new stage to set.
function Tool:SetStage(stage) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Initializes the ghost entity based on the supplied entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:StartGhostEntity)
---@param ent Entity The entity to copy ghost parameters off
function Tool:StartGhostEntity(ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Called when [WEAPON:Think](https://wiki.facepunch.com/gmod/WEAPON:Think) of the toolgun is called. This only happens when the tool gun is currently equipped/selected by the player and the selected tool is this tool.
---
---[View wiki](https://wiki.facepunch.com/gmod/TOOL:Think)
function TOOL:Think() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: Called on deploy automatically
---
--- Sets the tool's stage to how many stored objects the tool has.
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:UpdateData)
function Tool:UpdateData() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Updates the position and orientation of the ghost entity based on where the toolgun owner is looking along with data from object with id 1 set by [Tool:SetObject](https://wiki.facepunch.com/gmod/Tool:SetObject).
---
--- This should be called in the tool's [TOOL:Think](https://wiki.facepunch.com/gmod/TOOL:Think) hook.
---
--- This command is only used for tools that move props, such as easy weld, axis and motor. If you want to update a ghost like the thruster tool does it for example, check its [source code](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/entities/weapons/gmod_tool/stools/thruster.lua#L179).
---
---[View wiki](https://wiki.facepunch.com/gmod/Tool:UpdateGhostEntity)
function Tool:UpdateGhostEntity() end
