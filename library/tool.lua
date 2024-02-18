---@meta

--- A list of functions available inside a Sandbox Toolgun tool.
---
--- You can find the hooks TOOL_Hooks, and members Structures/TOOL.
---@class Tool
local Tool = {}

---[CLIENT] Called when the tool's control panel needs to be rebuilt.
---
--- Due to historical reasons, this hook does not provide the tool object as `self`! See examples.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL.BuildCPanel)
---@param cpanel Panel The DForm control panel to add settings to.
function TOOL:BuildCPanel(cpanel) end

---[SHARED] Returns whether the tool is allowed to be used or not. This function ignores the SANDBOX:CanTool hook.
---
--- By default this will always return true clientside and uses `TOOL.AllowedCVar`which is a ConVar object pointing to  `toolmode_allow_*toolname*` convar on the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:Allowed)
---@return boolean # Returns true if the tool is allowed.
function Tool:Allowed() end

---[SHARED] Builds a list of all ConVars set via the ClientConVar variable on the Structures/TOOL and their default values. This is used for the preset system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:BuildConVarList)
---@return table # A list of all convars and their default values.
function Tool:BuildConVarList() end

---[SHARED] This is called automatically for most toolgun actions so you shouldn't need to use it.
---
--- Checks all added objects to see if they're still valid, if not, clears the list of objects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:CheckObjects)
function Tool:CheckObjects() end

---[SHARED] Clears all objects previously set with Tool:SetObject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:ClearObjects)
function Tool:ClearObjects() end

---[SHARED] This is called automatically for all tools.
--- Initializes the tool object
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:Create)
---@return Tool # The created tool object.
function Tool:Create() end

---[SHARED] This is called automatically for all tools.
---
--- Creates clientside ConVars based on the ClientConVar table specified in the tool structure. Also creates the 'toolmode_allow_X' ConVar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:CreateConVars)
function Tool:CreateConVars() end

---[SHARED] Called when WEAPON:Deploy of the toolgun is called.
---
--- This is also called when switching from another tool on the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:Deploy)
---@return boolean # Return true to allow switching away from the toolgun using lastinv command
function TOOL:Deploy() end

---[CLIENT] Called when WEAPON:DrawHUD of the toolgun is called, only when the user has this tool selected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:DrawHUD)
function TOOL:DrawHUD() end

---[CLIENT] Called after the default tool screen has been drawn from WEAPON:RenderScreen.
---
--- If this method exists on the TOOL object table, the default scrolling text will not be drawn
--- Materials rendered in this hook require $ignorez parameter to draw properly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:DrawToolScreen)
---@param width number The width of the tool's screen in pixels.
---@param height number The height of the tool's screen in pixels.
function TOOL:DrawToolScreen(width, height) end

---[CLIENT] Called when WEAPON:Think of the toolgun is called, only when the user has this tool selected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:FreezeMovement)
---@return boolean # Return true to freeze the player
function TOOL:FreezeMovement() end

---[SHARED] Retrieves a physics bone number previously stored using Tool:SetObject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetBone)
---@param id number The id of the object which was set in Tool:SetObject.
---@return number # Associated physics bone with given id.
function Tool:GetBone(id) end

---[SHARED] Attempts to grab a clientside tool ConVar value as a boolean.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetClientBool)
---@param name string Name of the ConVar to retrieve. The function will automatically add the `mytoolfilename_` part to it.
---@param default? boolean The default value to return in case the lookup fails.
---@return number # The value of the requested ConVar. It will be true if the value if the convar is not 0, just like ConVar:GetBool
function Tool:GetClientBool(name, default) end

---[SHARED] Attempts to grab a clientside tool ConVar as a string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetClientInfo)
---@param name string Name of the convar to retrieve. The function will automatically add the `mytoolfilename_` part to it.
---@return string # The value of the requested ConVar.
function Tool:GetClientInfo(name) end

---[SHARED] Attempts to grab a clientside tool ConVar's value as a number.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetClientNumber)
---@param name string Name of the convar to retrieve. The function will automatically add the `mytoolfilename_` part to it.
---@param default? number The default value to return in case the lookup fails.
---@return number # The value of the requested ConVar.
function Tool:GetClientNumber(name, default) end

---[SHARED] Retrieves an Entity previously stored using Tool:SetObject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetEnt)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Entity # Associated Entity with given id.
function Tool:GetEnt(id) end

---[SHARED] Returns a language key based on this tool's name and the current stage it is on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetHelpText)
---@return string # The returned language key, for example `"#tool.weld.1"`
function Tool:GetHelpText() end

---[SHARED] Retrieves an local vector previously stored using Tool:SetObject.
--- See also Tool:GetPos.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetLocalPos)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Vector # Associated local vector with given id.
function Tool:GetLocalPos(id) end

---[SHARED] Returns the name of the current tool mode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetMode)
---@return string # The current tool mode.
function Tool:GetMode() end

---[SHARED] Retrieves an normal vector previously stored using Tool:SetObject.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetNormal)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Vector # Associated normal vector with given id.
function Tool:GetNormal(id) end

---[SHARED] Returns the current operation of the tool set by Tool:SetOperation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetOperation)
---@return number # The current operation the tool is at.
function Tool:GetOperation() end

---[SHARED] Returns the owner of this tool.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetOwner)
---@return Entity # Player using the tool
function Tool:GetOwner() end

---[SHARED] Retrieves an PhysObj previously stored using Tool:SetObject.
--- See also Tool:GetEnt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetPhys)
---@param id number The id of the object which was set in Tool:SetObject.
---@return PhysObj # Associated PhysObj with given id. If it wasn't specified, returns current PhysObj of associated Entity.
function Tool:GetPhys(id) end

---[SHARED] Retrieves an vector previously stored using Tool:SetObject. See also Tool:GetLocalPos.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetPos)
---@param id number The id of the object which was set in Tool:SetObject.
---@return Vector # Associated vector with given id. The vector is converted from Tool:GetLocalPos.
function Tool:GetPos(id) end

---[SHARED] Attempts to grab a serverside tool ConVar.
--- This will not do anything on client, despite the function being defined shared.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetServerInfo)
---@param name string Name of the convar to retrieve. The function will automatically add the "mytoolfilename_" part to it.
---@return string # The value of the requested ConVar.
function Tool:GetServerInfo(name) end

---[SHARED] Returns the current stage of the tool set by Tool:SetStage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetStage)
---@return number # The current stage of the current operation the tool is at.
function Tool:GetStage() end

---[SHARED] Returns the Tool Gun (`gmod_tool`) Scripted Weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetSWEP)
---@return Weapon # The tool gun weapon. (`gmod_tool`)
---@deprecated Use Tool:GetWeapon instead.
function Tool:GetSWEP() end

---[SHARED] Returns the Tool Gun (`gmod_tool`) Scripted Weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:GetWeapon)
---@return Weapon # The tool gun weapon. (`gmod_tool`)
function Tool:GetWeapon() end

---[SHARED] Called when WEAPON:Holster of the toolgun is called, as well as serverside when switching between different toolguns.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:Holster)
function TOOL:Holster() end

---[SHARED] Called when the user left clicks with the tool.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:LeftClick)
---@param tr table A trace from user's eyes to wherever they aim at. See Structures/TraceResult
---@return boolean # Return `true` to draw the tool gun beam and play fire animations, `false` otherwise.
function TOOL:LeftClick(tr) end

---[SHARED] Initializes the ghost entity with the given model. Removes any old ghost entity if called multiple times.
---
--- The ghost is a regular prop_physics entity in singleplayer games, and a clientside prop in multiplayer games.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:MakeGhostEntity)
---@param model string The model of the new ghost entity
---@param pos Vector Position to initialize the ghost entity at, usually not needed since this is updated in Tool:UpdateGhostEntity.
---@param angle Angle Angle to initialize the ghost entity at, usually not needed since this is updated in Tool:UpdateGhostEntity.
function Tool:MakeGhostEntity(model, pos, angle) end

---[SHARED] Returns the amount of stored objects ( Entitys ) the tool has.
--- Are TOOLs limited to 4 entities?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:NumObjects)
---@return number # The amount of stored objects, or Tool:GetStage clientide.
function Tool:NumObjects() end

---[CLIENT] Automatically forces the tool's control panel to be rebuilt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:RebuildControlPanel)
---@param ... any Any arguments given to this function will be added to TOOL.BuildCPanel's arguments.
function Tool:RebuildControlPanel(...) end

---[SHARED] Removes any ghost entity created for this tool.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:ReleaseGhostEntity)
function Tool:ReleaseGhostEntity() end

---[SHARED] Called when the user presses the reload key with the tool out.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:Reload)
---@param tr table A trace from user's eyes to wherever they aim at. See Structures/TraceResult
---@return boolean # Return `true` to draw the tool gun beam and play fire animations, `false` otherwise
function TOOL:Reload(tr) end

---[SHARED] Called when the user right clicks with the tool.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:RightClick)
---@param tr table A trace from user's eyes to wherever they aim at. See Structures/TraceResult
---@return boolean # Return `true` to draw the tool gun beam and play fire animations, `false` otherwise
function TOOL:RightClick(tr) end

---[SHARED] Stores an Entity for later use in the tool.
---
--- The stored values can be retrieved by Tool:GetEnt, Tool:GetPos, Tool:GetLocalPos, Tool:GetPhys, Tool:GetBone and Tool:GetNormal
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:SetObject)
---@param id number The id of the object to store.
---@param ent Entity The entity to store.
---@param pos Vector The position to store.
--- this position is in **global space** and is internally converted to **local space** relative to the object, so when you retrieve it later it will be corrected to the object's new position
---@param phys PhysObj The physics object to store.
---@param bone number The hit bone to store.
---@param normal Vector The hit normal to store.
function Tool:SetObject(id, ent, pos, phys, bone, normal) end

---[SHARED] Sets the current operation of the tool. Does nothing clientside. See also Tool:SetStage.
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
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:SetOperation)
---@param operation number The new operation ID to set.
function Tool:SetOperation(operation) end

---[SHARED] Sets the current stage of the tool. Does nothing clientside.
---
--- See also Tool:SetOperation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:SetStage)
---@param stage number The new stage to set.
function Tool:SetStage(stage) end

---[SHARED] Initializes the ghost entity based on the supplied entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:StartGhostEntity)
---@param ent Entity The entity to copy ghost parameters off
function Tool:StartGhostEntity(ent) end

---[SHARED] Called when WEAPON:Think of the toolgun is called. This only happens when the tool gun is currently equipped/selected by the player and the selected tool is this tool.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/TOOL:Think)
function TOOL:Think() end

---[SHARED] Called on deploy automatically
---
--- Sets the tool's stage to how many stored objects the tool has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:UpdateData)
function Tool:UpdateData() end

---[SHARED] Updates the position and orientation of the ghost entity based on where the toolgun owner is looking along with data from object with id 1 set by Tool:SetObject.
---
--- This should be called in the tool's TOOL:Think hook.
---
--- This command is only used for tools that move props, such as easy weld, axis and motor. If you want to update a ghost like the thruster tool does it for example, check its [source code](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/entities/weapons/gmod_tool/stools/thruster.lua#L179).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Tool:UpdateGhostEntity)
function Tool:UpdateGhostEntity() end
