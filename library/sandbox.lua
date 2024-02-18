---@meta

--- This function or feature is only available in the Sandbox gamemode and its Global.DeriveGamemode.
---
--- This is a list of hooks that are only available in Sandbox or Sandbox derived gamemodes.
---
--- Easiest way to tell if a gamemode is Sandbox derived is to check if this variable exists:
---
--- ```
--- -- Replace GAMEMODE with GM if you are in gamemode files.
--- if ( GAMEMODE.IsSandboxDerived ) then
--- 	-- Do stuff
--- end
--- ```
---
---@class SANDBOX : GM
SANDBOX = {}

---[CLIENT] This hook is used to add default categories to spawnmenu tool tabs.
---
--- Do not override or hook this function, use SANDBOX:AddToolMenuCategories!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:AddGamemodeToolMenuCategories)
function SANDBOX:AddGamemodeToolMenuCategories() end

---[CLIENT] This hook is used to add default tool tabs to spawnmenu.
---
--- Do not override or hook this function, use SANDBOX:AddToolMenuTabs!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:AddGamemodeToolMenuTabs)
function SANDBOX:AddGamemodeToolMenuTabs() end

---[CLIENT] This hook is used to add new categories to spawnmenu tool tabs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:AddToolMenuCategories)
function SANDBOX:AddToolMenuCategories() end

---[CLIENT] This hook is used to add new tool tabs to spawnmenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:AddToolMenuTabs)
function SANDBOX:AddToolMenuTabs() end

---[SHARED] Called when a player attempts to "arm" a duplication with the Duplicator tool. Return false to prevent the player from sending data to server, and to ignore data if it was somehow sent anyway.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:CanArmDupe)
---@param ply Player The player who attempted to arm a dupe.
---@return boolean # Can the player arm a dupe or not.
function SANDBOX:CanArmDupe(ply) end

---[SHARED] Called when a player attempts to drive a prop via Prop Drive
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:CanDrive)
---@param ply Player The player who attempted to use Prop Drive.
---@param ent Entity The entity the player is attempting to drive
---@return boolean # Return true to allow driving, false to disallow
function SANDBOX:CanDrive(ply, ent) end

---[SHARED] Called when a player attempts to fire their tool gun. Return true to specifically allow the attempt, false to block it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:CanTool)
---@param ply Player The player who attempted to use their toolgun.
---@param tr table A trace from the players eye to where in the world their crosshair/cursor is pointing. See Structures/TraceResult
---@param toolname string The tool mode the player currently has selected.
---@param tool table The tool mode table the player currently has selected.
---@param button number The tool button pressed.
---@return boolean # Can use toolgun or not.
function SANDBOX:CanTool(ply, tr, toolname, tool, button) end

---[CLIENT] Called when player selects an item on the spawnmenu sidebar at the left.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:ContentSidebarSelection)
---@param parent Panel The panel that holds spawnicons and the sidebar of spawnmenu
---@param node Panel The item player selected
function SANDBOX:ContentSidebarSelection(parent, node) end

---[CLIENT] Called when the context menu is supposedly closed.
---
--- This is simply an alias of GM:OnContextMenuClose.
---
--- This hook **will** be called even if the Sandbox's context menu doesn't actually exist, i.e. SANDBOX:ContextMenuEnabled blocked its creation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:ContextMenuClosed)
function SANDBOX:ContextMenuClosed() end

---[CLIENT] Called when the context menu is created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:ContextMenuCreated)
---@param g_ContextMenu Panel The created context menu panel
function SANDBOX:ContextMenuCreated(g_ContextMenu) end

---[CLIENT] Allows to prevent the creation of the context menu. If the context menu is already created, this will have no effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:ContextMenuEnabled)
---@return boolean # Return `false` to prevent the context menu from being created.
function SANDBOX:ContextMenuEnabled() end

---[CLIENT] Called when the context menu is trying to be opened.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:ContextMenuOpen)
---@return boolean # Return `false` to block the opening.
function SANDBOX:ContextMenuOpen() end

---[CLIENT] Called when the context menu is supposedly opened.
---
--- This is simply an alias of GM:OnContextMenuOpen but will **not** be called if SANDBOX:ContextMenuOpen prevents the context menu from opening.
---
--- This hook **will** be called even if the context menu doesn't actually exist, i.e. SANDBOX:ContextMenuEnabled blocked its creation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:ContextMenuOpened)
function SANDBOX:ContextMenuOpened() end

---[CLIENT] Called to poll if active tool settings should appear in the context menu. Please note that this is only called on initial opening of the context menu, not every frame the context menu is in use.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:ContextMenuShowTool)
---@return boolean # Return `false` to prevent active tool settings from displaying in the context menu.
function SANDBOX:ContextMenuShowTool() end

---[CLIENT] Called when the Client reverts spawnlist changes
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:OnRevertSpawnlist)
function SANDBOX:OnRevertSpawnlist() end

---[CLIENT] Called when a player saves his changes made to the spawnmenu
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:OnSaveSpawnlist)
function SANDBOX:OnSaveSpawnlist() end

---[CLIENT] This hook is called when the player edits a category in the Spawnmenu
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:OpenToolbox)
function SANDBOX:OpenToolbox() end

---[CLIENT] Called from GM:HUDPaint; does nothing by default.
---
--- This cannot be used with hook.Add
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PaintNotes)
function SANDBOX:PaintNotes() end

---[CLIENT] Called from GM:HUDPaint to draw world tips. By default, enabling cl_drawworldtooltips will stop world tips from being drawn here.
--- See Global.AddWorldTip for more information.
---
--- This cannot be used with hook.Add
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PaintWorldTips)
function SANDBOX:PaintWorldTips() end

---[SERVER] Called when persistent props are loaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PersistenceLoad)
---@param name string Save from which to load.
function SANDBOX:PersistenceLoad(name) end

---[SERVER] Called when persistent props are saved.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PersistenceSave)
---@param name string Where to save. By default is convar "sbox_persist".
function SANDBOX:PersistenceSave(name) end

---[SERVER] Called when a player attempts to give themselves a weapon from the Q menu. ( Left mouse clicks on an icon )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerGiveSWEP)
---@param ply Player The player who attempted to give themselves a weapon.
---@param weapon string Class name of the weapon the player tried to give themselves.
---@param swep table The swep table of this weapon, see Structures/SWEP
---@return boolean # Can the SWEP be given to the player
function SANDBOX:PlayerGiveSWEP(ply, weapon, swep) end

---[SERVER] Called after the player spawned an effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnedEffect)
---@param ply Player The player that spawned the effect
---@param model string The model of spawned effect
---@param ent Entity The spawned effect itself
function SANDBOX:PlayerSpawnedEffect(ply, model, ent) end

---[SERVER] Called after the player spawned an NPC.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnedNPC)
---@param ply Player The player that spawned the NPC
---@param ent Entity The spawned NPC itself
function SANDBOX:PlayerSpawnedNPC(ply, ent) end

---[SERVER] Called when a player has successfully spawned a prop from the Q menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnedProp)
---@param ply Player The player who spawned a prop.
---@param model string Path to the model of the prop the player is attempting to spawn.
---@param entity Entity The entity that was spawned.
function SANDBOX:PlayerSpawnedProp(ply, model, entity) end

---[SERVER] Called after the player spawned a ragdoll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnedRagdoll)
---@param ply Player The player that spawned the ragdoll
---@param model string The ragdoll model that player wants to spawn
---@param ent Entity The spawned ragdoll itself
function SANDBOX:PlayerSpawnedRagdoll(ply, model, ent) end

---[SERVER] Called after the player has spawned a scripted entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnedSENT)
---@param ply Player The player that spawned the SENT
---@param ent Entity The spawned SENT
function SANDBOX:PlayerSpawnedSENT(ply, ent) end

---[SERVER] Called after the player has spawned a scripted weapon from the spawnmenu with a middle mouse click.
---
--- For left mouse click spawns, see SANDBOX:PlayerGiveSWEP.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnedSWEP)
---@param ply Player The player that spawned the SWEP
---@param ent Entity The SWEP itself
function SANDBOX:PlayerSpawnedSWEP(ply, ent) end

---[SERVER] Called after the player spawned a vehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnedVehicle)
---@param ply Player The player that spawned the vehicle
---@param ent Entity The vehicle itself
function SANDBOX:PlayerSpawnedVehicle(ply, ent) end

---[SERVER] Called to ask if player allowed to spawn a particular effect or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnEffect)
---@param ply Player The player that wants to spawn an effect
---@param model string The effect model that player wants to spawn
---@return boolean # Return false to disallow spawning that effect
function SANDBOX:PlayerSpawnEffect(ply, model) end

---[SERVER] Called to ask if player allowed to spawn a particular NPC or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnNPC)
---@param ply Player The player that wants to spawn that NPC
---@param npc_type string The npc type that player is trying to spawn
---@param weapon string The weapon of that NPC
---@return boolean # Return false to disallow spawning that NPC
function SANDBOX:PlayerSpawnNPC(ply, npc_type, weapon) end

---[SERVER] Called to ask whether player is allowed to spawn a given model. This includes props, effects, and ragdolls and is called before the respective PlayerSpawn* hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnObject)
---@param ply Player The player in question
---@param model string Model path
---@param skin number Skin number
---@return boolean # Return false to disallow the player to spawn the given model.
function SANDBOX:PlayerSpawnObject(ply, model, skin) end

---[SERVER] Called when a player attempts to spawn a prop from the Q menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnProp)
---@param ply Player The player who attempted to spawn a prop.
---@param model string Path to the model of the prop the player is attempting to spawn.
---@return boolean # Should the player be able to spawn the prop or not.
function SANDBOX:PlayerSpawnProp(ply, model) end

---[SERVER] Called when a player attempts to spawn a ragdoll from the Q menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnRagdoll)
---@param ply Player The player who attempted to spawn a ragdoll.
---@param model string Path to the model of the ragdoll the player is attempting to spawn.
---@return boolean # Should the player be able to spawn the ragdoll or not.
function SANDBOX:PlayerSpawnRagdoll(ply, model) end

---[SERVER] Called when a player attempts to spawn an Entity from the Q menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnSENT)
---@param ply Player The player who attempted to spawn the entity.
---@param class string Class name of the entity the player tried to spawn.
---@return boolean # Should the player be able to spawn the entity or not.
function SANDBOX:PlayerSpawnSENT(ply, class) end

---[SERVER] Called when a player attempts to spawn a weapon from the Q menu. ( Mouse wheel clicks on an icon )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnSWEP)
---@param ply Player The player who attempted to spawn a weapon.
---@param weapon string Class name of the weapon the player tried to spawn.
---@param swep table Information about the weapon the player is trying to spawn, see Structures/SWEP
---@return boolean # Can the SWEP be spawned
function SANDBOX:PlayerSpawnSWEP(ply, weapon, swep) end

---[SERVER] Called to ask if player allowed to spawn a particular vehicle or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PlayerSpawnVehicle)
---@param ply Player The player that wants to spawn that vehicle
---@param model string The vehicle model that player wants to spawn
---@param name string Vehicle name
---@param table table Table of that vehicle, containing info about it See Structures/VehicleTable.
---@return boolean # Return false to disallow spawning that vehicle
function SANDBOX:PlayerSpawnVehicle(ply, model, name, table) end

---[CLIENT] Called by the spawnmenu when the content tab is generated
--- 	Creating an error in this Hook will result in a completely broken Content Tab
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PopulateContent)
---@param pnlContent Panel The SpawnmenuContentPanel
---@param tree Panel The ContentNavBar tree from the SpawnmenuContentPanel
---@param node Panel The old Spawnlists
function SANDBOX:PopulateContent(pnlContent, tree, node) end

---[CLIENT] Called by the spawnmenu when the Entities tab is generated
--- 	Creating an error in this Hook will result in a completely broken Entites Tab
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PopulateEntities)
---@param pnlContent Panel The SpawnmenuContentPanel
---@param tree Panel The ContentNavBar tree from the SpawnmenuContentPanel
---@param node Panel The old Spawnlists
function SANDBOX:PopulateEntities(pnlContent, tree, node) end

---[CLIENT] Called by the spawnmenu when the NPCs tab is generated
--- 	Creating an error in this Hook will result in a completely broken NPCs Tab
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PopulateNPCs)
---@param pnlContent Panel The SpawnmenuContentPanel
---@param tree Panel The ContentNavBar tree from the SpawnmenuContentPanel
---@param node Panel The old Spawnlists
function SANDBOX:PopulateNPCs(pnlContent, tree, node) end

---[CLIENT] This hook makes the engine load the spawnlist text files.
--- It calls spawnmenu.PopulateFromEngineTextFiles by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PopulatePropMenu)
function SANDBOX:PopulatePropMenu() end

---[CLIENT] Add the TOOL to the tool menu. You want to call spawnmenu.AddToolMenuOption in this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PopulateToolMenu)
function SANDBOX:PopulateToolMenu() end

---[CLIENT] Called by the spawnmenu when the Vehicles tab is generated
--- 	Creating an error in this Hook will result in a completely broken vehicles Tab
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PopulateVehicles)
---@param pnlContent Panel The SpawnmenuContentPanel
---@param tree Panel The ContentNavBar tree from the SpawnmenuContentPanel
---@param node Panel The old Spawnlists
function SANDBOX:PopulateVehicles(pnlContent, tree, node) end

---[CLIENT] Called by the spawnmenu when the Weapons tab is generated
--- 	Creating an error in this Hook will result in a completely broken Weapons Tab
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PopulateWeapons)
---@param pnlContent Panel The SpawnmenuContentPanel
---@param tree Panel The ContentNavBar tree from the SpawnmenuContentPanel
---@param node Panel The old Spawnlists
function SANDBOX:PopulateWeapons(pnlContent, tree, node) end

---[CLIENT] Called right after the Lua Loaded tool menus are reloaded. This is a good place to set up any ControlPanels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PostReloadToolsMenu)
function SANDBOX:PostReloadToolsMenu() end

---[SHARED] Called just before registering a Sandbox scripted tool.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PreRegisterTOOL)
---@param tool table The TOOL table to be registered. See Structures/TOOL.
---@param class string The class name to be assigned.
---@return boolean # Return `false` to prevent the TOOL from being registered.
function SANDBOX:PreRegisterTOOL(tool, class) end

---[CLIENT] Called right before the Lua Loaded tool menus are reloaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:PreReloadToolsMenu)
function SANDBOX:PreReloadToolsMenu() end

---[CLIENT] Called when changes were made to the spawnmenu like creating a new category.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:SpawnlistContentChanged)
function SANDBOX:SpawnlistContentChanged() end

---[CLIENT] Called when there's one or more items selected in the spawnmenu by the player, to open the multi selection right click menu (DMenu)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:SpawnlistOpenGenericMenu)
---@param canvas Panel The canvas that has the selection. (SANDBOX:SpawnlistOpenGenericMenu)
function SANDBOX:SpawnlistOpenGenericMenu(canvas) end

---[CLIENT] If false is returned then the spawn menu is never created. This saves load times if your mod doesn't actually use the spawn menu for any reason.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:SpawnMenuEnabled)
---@return boolean # Whether to create spawnmenu or not.
function SANDBOX:SpawnMenuEnabled() end

---[CLIENT] Called when spawnmenu is trying to be opened.
---
--- Hiding the spawnmenu will not stop people from being able to use the various console commands to spawn in items, etc. See GM:PlayerSpawn* hooks for blocking actual spawning.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:SpawnMenuOpen)
---@return boolean # Return false to dissallow opening the spawnmenu
function SANDBOX:SpawnMenuOpen() end

---[CLIENT] Called when the spawnmenu is opened.
---
--- This is an alias of GM:OnSpawnMenuOpen but will **not** be called if SANDBOX:SpawnMenuOpen prevents the spawnmenu from opening.
---
--- This hook **will** be called even if the spawnmenu doesn't actually exist, i.e. SANDBOX:SpawnMenuEnabled blocked its creation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/SANDBOX:SpawnMenuOpened)
function SANDBOX:SpawnMenuOpened() end
