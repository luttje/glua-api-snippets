---@meta

--- Hooks that are available for all gamemodes based on base gamemode.
---
--- 	See also: Structures/GM.
---
---@class GM
GM = {}

---[SERVER] Called when a map I/O event occurs.
---
--- See also Entity:Fire and Entity:Input for functions to fire Inputs on entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:AcceptInput)
---@param ent Entity Entity that receives the input
---@param input string The input name. Is not guaranteed to be a valid input on the entity.
---@param activator Entity Activator of the input
---@param caller Entity Caller of the input
---@param value any Data provided with the input. Will be either a string, a number, a boolean or a nil.
---@return boolean # Return true to prevent this input from being processed. Do not return otherwise.
function GM:AcceptInput(ent, input, activator, caller, value) end

---[CLIENT] Adds a death notice entry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:AddDeathNotice)
---@param attacker string The name of the attacker
---@param attackerTeam number The team of the attacker
---@param inflictor string Class name of the entity inflicting the damage
---@param victim string Name of the victim
---@param victimTeam number Team of the victim
function GM:AddDeathNotice(attacker, attackerTeam, inflictor, victim, victimTeam) end

---[CLIENT] Allows you to adjust the mouse sensitivity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:AdjustMouseSensitivity)
---@param defaultSensitivity number The old sensitivity
---
--- In general it will be 0, which is equivalent to a sensitivity of 1.
---@return number # A fraction of the normal sensitivity (0.5 would be half as sensitive).  Return -1 to not override and prevent subsequent hooks and WEAPON:AdjustMouseSensitivity from running.   Return nil to not override and allow subsequent hooks and WEAPON:AdjustMouseSensitivity to run.
function GM:AdjustMouseSensitivity(defaultSensitivity) end

---[SERVER] Called when a player tries to pick up something using the "use" key, return to override.
---
--- This hook will not be called if `sv_playerpickupallowed` is set to 0.
---
--- See GM:GravGunPickupAllowed for the Gravity Gun pickup variant.
--- See GM:PhysgunPickup for the Physics Gun pickup variant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:AllowPlayerPickup)
---@param ply Player The player trying to pick up something.
---@param ent Entity The Entity the player attempted to pick up.
---@return boolean # Allow the player to pick up the entity or not.
function GM:AllowPlayerPickup(ply, ent) end

---[SHARED] This hook is used to calculate animations for a player.
---
--- This hook must return the same values at the same time on both, client **and** server. On client for players to see the animations, on server for hit detection to work properly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CalcMainActivity)
---@param ply Player The player to apply the animation.
---@param vel Vector The velocity of the player.
---@return number # Enums/ACT for the activity the player should use. A nil return will be treated as ACT_INVALID.
---@return number # Sequence for the player to use. This takes precedence over the activity (the activity is still used for layering). Return -1 or nil to let the activity determine the sequence.
function GM:CalcMainActivity(ply, vel) end

---[CLIENT] Called from GM:CalcView when player is in driving a vehicle.
---
--- This hook may not be called in gamemodes that override GM:CalcView.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CalcVehicleView)
---@param veh Vehicle The vehicle the player is driving
---@param ply Player The vehicle driver
---@param view table The view data containing players FOV, view position and angles, see Structures/CamData
---@return table # The modified view table containing new values, see Structures/CamData
function GM:CalcVehicleView(veh, ply, view) end

---[CLIENT] Allows override of the default view.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CalcView)
---@param ply Player The local player.
---@param origin Vector The player's view position.
---@param angles Angle The player's view angles.
---@param fov number Field of view.
---@param znear number Distance to near clipping plane.
---@param zfar number Distance to far clipping plane.
---@return table # View data table. See Structures/CamData
function GM:CalcView(ply, origin, angles, fov, znear, zfar) end

---[CLIENT] Allows overriding the position and angle of the viewmodel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CalcViewModelView)
---@param wep Weapon The weapon entity
---@param vm Entity The viewmodel entity
---@param oldPos Vector Original position (before viewmodel bobbing and swaying)
---@param oldAng Angle Original angle (before viewmodel bobbing and swaying)
---@param pos Vector Current position
---@param ang Angle Current angle
---@return Vector # New position
---@return Angle # New angle
function GM:CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang) end

---[SERVER] Called whenever a players tries to create an undo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanCreateUndo)
---@param ply Player The player who tried to create something.
---@param undo table The undo table as a Structures/Undo.
---@return boolean # Return false to disallow creation of the undo.
function GM:CanCreateUndo(ply, undo) end

---[SERVER] Called when a variable is edited on an Entity (called by `Edit Properties...` menu), to determine if the edit should be permitted.
---
--- See Editable_Entities for more details about the system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanEditVariable)
---@param ent Entity The entity being edited.
---@param ply Player The player doing the editing.
---@param key string The name of the variable.
---@param val string The new value, as a string which will later be converted to its appropriate type.
---@param editor table The edit table defined in Entity:NetworkVar.
---@return boolean # Return true to allow editing.
function GM:CanEditVariable(ent, ply, key, val, editor) end

---[SERVER] Determines if the player can exit the vehicle on their own. Player:ExitVehicle will bypass this hook.
---
--- See GM:CanPlayerEnterVehicle for the opposite hook.
--- See also GM:PlayerLeaveVehicle for a hook that will be called whenever a player exits any vehicle for any reason.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanExitVehicle)
---@param veh Vehicle The vehicle entity
---@param ply Player The player
---@return boolean # True if the player can exit the vehicle.
function GM:CanExitVehicle(veh, ply) end

---[SERVER] Determines whether or not a given player player can enter the given vehicle. Player:EnterVehicle will still call this hook.
---
--- Called just before GM:PlayerEnteredVehicle. See also GM:CanExitVehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanPlayerEnterVehicle)
---@param player Player The player that wants to enter a vehicle.
---@param vehicle Vehicle The vehicle in question.
---@param role number The seat number.
---@return boolean # `false` if the player is not allowed to enter the vehicle.
function GM:CanPlayerEnterVehicle(player, vehicle, role) end

---[SERVER] Determines if the player can kill themselves using the concommands `kill` or `explode`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanPlayerSuicide)
---@param player Player The player
---@return boolean # True if they can suicide.
function GM:CanPlayerSuicide(player) end

---[SERVER] Determines if the player can unfreeze the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanPlayerUnfreeze)
---@param player Player The player
---@param entity Entity The entity
---@param phys PhysObj The physics object of the entity
---@return boolean # True if they can unfreeze.
function GM:CanPlayerUnfreeze(player, entity, phys) end

---[SHARED] Controls if a property can be used or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanProperty)
---@param ply Player Player, that tried to use the property
---@param property string Class of the property that is tried to use, for example - bonemanipulate
---
--- This is not guaranteed to be the internal property name used in properties.Add!
---@param ent Entity The entity, on which property is tried to be used on
---@return boolean # Return false to disallow using that property
function GM:CanProperty(ply, property, ent) end

---[SERVER] Called whenever a players tries to undo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CanUndo)
---@param ply Player The player who tried to undo something.
---@param undo table The undo table as a Structures/Undo.
---@return boolean # Return false to disallow the undo.
function GM:CanUndo(ply, undo) end

---[MENU] Called each frame to record demos to video using IVideoWriter.
---
--- This hook is called every frame regardless of whether or not a demo is being recorded
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CaptureVideo)
function GM:CaptureVideo() end

---[CLIENT] Called when a message is printed to the chat box. Note, that this isn't working with player messages even though there are arguments for it.
---
--- For player messages see GM:PlayerSay and GM:OnPlayerChat
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ChatText)
---@param index number The index of the player.
---@param name string The name of the player.
---@param text string The text that is being sent.
---@param type string Chat filter type. Possible values are:
--- * `joinleave` - Player join and leave messages
--- * `namechange` - Player name change messages
--- * `servermsg` - Server messages such as convar changes
--- * `teamchange` - Team changes?
--- * `chat` - (Obsolete?) Player chat? Seems to trigger when server console uses the `say` command
--- * `none` - A fallback value
---@return boolean # Return true to suppress the chat message.
function GM:ChatText(index, name, text, type) end

---[CLIENT] Called whenever the content of the user's chat input box is changed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ChatTextChanged)
---@param text string The new contents of the input box
function GM:ChatTextChanged(text) end

---[SERVER] Called when a non local player connects to allow the Lua system to check the password.
---
--- The default behaviour in the base gamemodes emulates what would normally happen. If sv_password is set and its value matches the password passed in by the client - then they are allowed to join. If it isn't set it lets them in too.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CheckPassword)
---@param steamID64 string The 64bit Steam ID of the joining player, use util.SteamIDFrom64 to convert it to a `STEAM_0:` one.
---@param ipAddress string The IP of the connecting client
---@param svPassword string The current value of sv_password (the password set by the server)
---@param clPassword string The password provided by the client
---@param name string The name of the joining player
---@return boolean # If the hook returns false then the player is disconnected
---@return string # If returning false in the first argument, then this should be the disconnect message. This will default to `#GameUI_ServerRejectBadPassword`, which is `Bad Password.` translated to the client's language.
function GM:CheckPassword(steamID64, ipAddress, svPassword, clPassword, name) end

---[SHARED] Called when a player's sign on state changes.
--- You cannot get a valid player object from the userID at any point during this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ClientSignOnStateChanged)
---@param userID number The userID of the player whose sign on state has changed.
---@param oldState number The previous sign on state. See Enums/SIGNONSTATE enums.
---@param newState number The new/current sign on state. See Enums/SIGNONSTATE enums.
function GM:ClientSignOnStateChanged(userID, oldState, newState) end

---[CLIENT AND MENU] Called when derma menus are closed with Global.CloseDermaMenus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CloseDermaMenus)
function GM:CloseDermaMenus() end

---[CLIENT] Called whenever an entity becomes a clientside ragdoll.
---
--- See GM:CreateEntityRagdoll for serverside ragdolls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CreateClientsideRagdoll)
---@param entity Entity The Entity that created the ragdoll
---@param ragdoll Entity The ragdoll being created.
function GM:CreateClientsideRagdoll(entity, ragdoll) end

---[SERVER] Called when a serverside ragdoll of an entity has been created.
---
--- See GM:CreateClientsideRagdoll for clientside ragdolls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CreateEntityRagdoll)
---@param owner Entity Entity that owns the ragdoll
---@param ragdoll Entity The ragdoll entity
function GM:CreateEntityRagdoll(owner, ragdoll) end

---[CLIENT] Allows you to change the players movements before they're sent to the server.
---
--- See Game Movement for an explanation on the move system.
---
--- Due to this hook being clientside only, it could be overridden by the user allowing them to completely skip your logic, it is recommended to use GM:StartCommand in a shared file instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CreateMove)
---@param cmd CUserCmd The User Command data
---@return boolean # Return true to: * Disable Sandbox C menu "screen clicking" * Disable Teammate nocollide (verification required) * Prevent calling of C_BaseHLPlayer::CreateMove & subsequently C_BasePlayer::CreateMove
function GM:CreateMove(cmd) end

---[SHARED] Teams are created within this hook using team.SetUp.
---
--- This hook is called before GM:PreGamemodeLoaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:CreateTeams)
function GM:CreateTeams() end

---[SHARED] Called upon an animation event, this is the ideal place to call player animation functions such as Player:AddVCDSequenceToGestureSlot, Player:AnimRestartGesture and so on.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:DoAnimationEvent)
---@param ply Player Player who is being animated
---@param event number Animation event. See Enums/PLAYERANIMEVENT
---@param data? number The data for the event. This is interpreted as an Enums/ACT by `PLAYERANIMEVENT_CUSTOM` and `PLAYERANIMEVENT_CUSTOM_GESTURE`, or a sequence by `PLAYERANIMEVENT_CUSTOM_SEQUENCE`.
---@return number # The translated activity to send to the weapon. See Enums/ACT. Return `ACT_INVALID` if you don't want to send an activity.
function GM:DoAnimationEvent(ply, event, data) end

---[SERVER] Handles the player's death.
---
--- This hook is **not** called if the player is killed by Player:KillSilent. See GM:PlayerSilentDeath for that.
---
--- * GM:PlayerDeath is called after this hook
--- * GM:PostPlayerDeath is called after that
---
--- Player:Alive will return false in this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:DoPlayerDeath)
---@param ply Player The player
---@param attacker Entity The entity that killed the player
---@param dmg CTakeDamageInfo Damage info
function GM:DoPlayerDeath(ply, attacker, dmg) end

---[CLIENT] This hook is called every frame to draw all of the current death notices.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:DrawDeathNotice)
---@param x number X position to draw death notices as a ratio
---@param y number Y position to draw death notices as a ratio
function GM:DrawDeathNotice(x, y) end

---[CLIENT] Called every frame before drawing the in-game monitors ( Breencast, in-game TVs, etc ), but doesn't seem to be doing anything, trying to render 2D or 3D elements fail.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:DrawMonitors)
function GM:DrawMonitors() end

---[CLIENT AND MENU] Called after all other 2D draw hooks are called. Draws over all VGUI Panels and HUDs.
---
--- Unlike GM:HUDPaint, this hook is called with the game paused and while the Camera SWEP is equipped.
---
--- Only gets called when `r_drawvgui` is enabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:DrawOverlay)
function GM:DrawOverlay() end

---[CLIENT] Allows you to override physgun effects rendering.
---
--- This is still called when `physgun_drawbeams` is set to `0`, because this hook is also capable of overriding physgun sprite effects, while the convar does not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:DrawPhysgunBeam)
---@param ply Player Physgun owner
---@param physgun Weapon The physgun
---@param enabled boolean Is the beam enabled
---@param target Entity Entity we are grabbing. This will be NULL if nothing is being held
---@param physBone number ID of the physics bone (PhysObj) we are grabbing at. Use Entity:TranslatePhysBoneToBone to translate to an actual bone.
---@param hitPos Vector Beam hit position relative to the physics bone (PhysObj) we are grabbing.
---@return boolean # Return false to hide default effects
function GM:DrawPhysgunBeam(ply, physgun, enabled, target, physBone, hitPos) end

---[SHARED] Called right before an entity stops driving. Overriding this hook will cause it to not call drive.End and the player will not stop driving.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:EndEntityDriving)
---@param ent Entity The entity being driven
---@param ply Player The player driving the entity
function GM:EndEntityDriving(ent, ply) end

---[SHARED] Called whenever a sound has been played. This will not be called clientside if the server played the sound without the client also calling Entity:EmitSound.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:EntityEmitSound)
---@param data table Information about the played sound. Changes done to this table can be applied by returning `true` from this hook.
---
--- See Structures/EmitSoundInfo.
---@return boolean #  * Return `true` to apply all changes done to the data table. * Return `false` to prevent the sound from playing. * Return `nil` or nothing to play the sound without altering it.
function GM:EntityEmitSound(data) end

---[SHARED] Called every time a bullet is fired from an entity.
---
--- This hook is called directly from Entity:FireBullets. Due to this, you cannot call Entity:FireBullets inside this hook or an infinite loop will occur crashing the game.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:EntityFireBullets)
---@param entity Entity The entity that fired the bullet
---@param data table The bullet data. See Structures/Bullet.
---@return boolean #  * Return `true` to apply all changes done to the bullet table. * Return `false` to suppress the bullet.
function GM:EntityFireBullets(entity, data) end

---[SHARED] Called when a key-value pair is set on an entity, either by the engine (for example when map spawns) or Entity:SetKeyValue.
---
--- See ENTITY:KeyValue for a hook that works for scripted entities.
---
---
--- See WEAPON:KeyValue for a hook that works for scripted weapons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:EntityKeyValue)
---@param ent Entity Entity that the keyvalue is being set on
---@param key string Key of the key/value pair
---@param value string Value of the key/value pair
---@return string # If set, the value of the key-value pair will be overridden by this string.
function GM:EntityKeyValue(ent, key, value) end

---[SHARED] Called when an NW2Var is changed.
--- If a NW2Var is set on an entity that is based on a Lua Entity could result in the NW2Var being mixed up with other ones and being updated multiple times.
--- This hook is fired before the client value is actually changed. Calling the GetNW2 function for the specified variable name within this hook will return the old value, not the current/updated one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:EntityNetworkedVarChanged)
---@param ent Entity The owner entity of changed NW2Var
---@param name string The name if changed NW2Var
---@param oldval any The old value of the NW2Var
---@param newval any The new value of the NW2Var
function GM:EntityNetworkedVarChanged(ent, name, oldval, newval) end

---[SHARED] Called right before removal of an entity.
--- 		This hook is called clientside during full updates due to how networking works in the Source Engine.
---
--- This can happen when the client briefly loses connection to the server, and can be simulated via `cl_fullupdate` for testing purposes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:EntityRemoved)
---@param ent Entity Entity being removed
---@param fullUpdate boolean Whether the removal is happening due to a full update clientside.
---
--- The entity may or **may not** be recreated immediately after, depending on whether it is in the local player's [PVS](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community"). (See Entity:IsDormant)
function GM:EntityRemoved(ent, fullUpdate) end

---[SERVER] Called when an entity takes damage. You can modify all parts of the damage info in this hook.
---
--- Applying damage from this hook to the entity taking damage will lead to infinite loop/crash.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:EntityTakeDamage)
---@param target Entity The entity taking damage
---@param dmg CTakeDamageInfo Damage info
---@return boolean # Return true to completely block the damage event
function GM:EntityTakeDamage(target, dmg) end

---[SHARED] This hook polls the entity the player use action should be applied to.
---
--- The default behavior of this hook is in [CBasePlayer::FindUseEntity](https://github.com/ValveSoftware/source-sdk-2013/blob/0d8dceea4310fde5706b3ce1c70609d72a38efdf/mp/src/game/shared/baseplayer_shared.cpp#L1068-L1270). Despite CBasePlayer::FindUseEntity being defined shared, it is only called serverside in practice, so this hook will be only called serverside, as well. It is possible for modules to call it clientside, so the Lua code should still be treated as shared.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:FindUseEntity)
---@param ply Player The player who initiated the use action.
---@param defaultEnt Entity The entity that was chosen by the engine.
---@return Entity # The entity to use instead of default entity
function GM:FindUseEntity(ply, defaultEnt) end

---[CLIENT] Runs when user cancels/finishes typing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:FinishChat)
function GM:FinishChat() end

---[SHARED] Called after GM:Move, applies all the changes from the CMoveData to the player.
---
--- See Game Movement for an explanation on the move system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:FinishMove)
---@param ply Player Player
---@param mv CMoveData Movement data
---@return boolean # Return true to suppress default engine behavior, i.e. declare that you have already moved the player according to the move data in a custom way.
function GM:FinishMove(ply, mv) end

---[CLIENT] Called to allow override of the default Derma skin for all panels.
---
--- This hook is only called on Lua start up, changing its value (or adding new hooks) after it has been already called will not have any effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ForceDermaSkin)
---@return string # A **case sensitive** Derma skin name to be used as default, registered previously via derma.DefineSkin.   Returning nothing, nil or invalid name will make it fallback to the "Default" skin.
function GM:ForceDermaSkin() end

---[SHARED AND MENU] Called when game content has been changed, for example an addon or a mountable game was (un)mounted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GameContentChanged)
function GM:GameContentChanged() end

---[SERVER] An internal function used to get an untranslated string to show in the kill feed as the entity's name. See GM:SendDeathNotice
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GetDeathNoticeEntityName)
---@param ent Entity The entity to get a name of.
---@return string # The untranslated name for given NPC. The translation/localization would happen on the client.
function GM:GetDeathNoticeEntityName(ent) end

---[SERVER] Called when a player takes damage from falling, allows to override the damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GetFallDamage)
---@param ply Player The player
---@param speed number The fall speed
---@return number # New fall damage
function GM:GetFallDamage(ply, speed) end

---[SHARED] Called when the game(server) needs to update the text shown in the server browser as the gamemode.
---
--- This hook (and the `sv_gamename_override` command) may not work on some popular gamemodes like DarkRP or Trouble Terrorist Town. This is not a bug, it's just how it works. See [here](https://github.com/Facepunch/garrysmod-issues/issues/4637#issuecomment-677884989) for more information.
---
--- Also, it **only** works on dedicated servers and is called at regular intervals (about one second) **even** if the server has no players and the hibernation function is enabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GetGameDescription)
---@return string # The text to be shown in the server browser as the gamemode.
function GM:GetGameDescription() end

---[CLIENT] Allows you to modify the Source Engine's motion blur shaders.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GetMotionBlurValues)
---@param horizontal number The amount of horizontal blur.
---@param vertical number The amount of vertical  blur.
---@param forward number The amount of forward/radial blur.
---@param rotational number The amount of rotational blur.
---@return number # New amount of horizontal blur.
---@return number # New amount of vertical blur.
---@return number # New amount of forward/radial blur.
---@return number # New amount of rotational blur.
function GM:GetMotionBlurValues(horizontal, vertical, forward, rotational) end

---[SERVER] Called to determine preferred carry angles for the entity. It works for both, +use pickup and gravity gun pickup.
---
--- Due to nature of the gravity gun coding in multiplayer, this hook **MAY** seem to not work ( but rest assured it does ), due to clientside prediction not knowing the carry angles. The +use pickup doesn't present this issue as it doesn't predict the player carrying the object clientside ( as you may notice by the prop lagging behind in multiplayer )
---
--- This hook can **not** override preferred carry angles of props such as the sawblade and the harpoon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GetPreferredCarryAngles)
---@param ent Entity The entity to generate carry angles for
---@param ply Player The player who is holding the object
---@return Angle # The preferred carry angles for the entity.
function GM:GetPreferredCarryAngles(ent, ply) end

---[CLIENT] Returns the color for the given entity's team. This is used in chat and deathnotice text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GetTeamColor)
---@param ent Entity Entity
---@return table # Team Global.Color
function GM:GetTeamColor(ent) end

---[CLIENT] Returns the team color for the given team index.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GetTeamNumColor)
---@param team number Team index
---@return table # Team Global.Color
function GM:GetTeamNumColor(team) end

---[SHARED] Override this hook to disable/change ear-grabbing in your gamemode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GrabEarAnimation)
---@param ply Player Player
function GM:GrabEarAnimation(ply) end

---[SERVER] Called when an entity is released by a gravity gun.
---
--- See GM:PhysgunDrop for the Physics Gun drop variant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GravGunOnDropped)
---@param ply Player Player who is wielding the gravity gun
---@param ent Entity The entity that has been dropped
function GM:GravGunOnDropped(ply, ent) end

---[SERVER] Called when an entity is picked up by a gravity gun.
---
--- See GM:OnPlayerPhysicsPickup for the player `+use` pickup variant.
--- See GM:OnPhysgunPickup for the Physics Gun pickup variant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GravGunOnPickedUp)
---@param ply Player The player wielding the gravity gun
---@param ent Entity The entity that has been picked up by the gravity gun
function GM:GravGunOnPickedUp(ply, ent) end

---[SERVER] Called every tick to poll whether a player is allowed to pick up an entity with the gravity gun or not.
---
--- See GM:AllowPlayerPickup for the +USE pickup variant.
--- See GM:PhysgunPickup for the Physics Gun pickup variant.
---
--- Calls ENTITY:GravGunPickupAllowed on the entity being hovered every frame in Sandbox-derived gamemodes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GravGunPickupAllowed)
---@param ply Player The player wielding the gravity gun
---@param ent Entity The entity the player is attempting to pick up
---@return boolean # Return true to allow entity pick up
function GM:GravGunPickupAllowed(ply, ent) end

---[SHARED] Called when an entity is about to be punted with the gravity gun (primary fire).
---
--- By default this function makes ENTITY:GravGunPunt work in Sandbox derived gamemodes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GravGunPunt)
---@param ply Player The player wielding the gravity gun
---@param ent Entity The entity the player is attempting to punt
---@return boolean # Return true to allow and false to disallow.
function GM:GravGunPunt(ply, ent) end

---[CLIENT] Called when the mouse has been double clicked on any panel derived from CGModBase, such as the panel used by gui.EnableScreenClicker and the panel used by Panel:ParentToHUD.
---
--- By default this hook calls GM:GUIMousePressed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GUIMouseDoublePressed)
---@param mouseCode number The code of the mouse button pressed, see Enums/MOUSE
---@param aimVector Vector A normalized vector pointing in the direction the client has clicked
function GM:GUIMouseDoublePressed(mouseCode, aimVector) end

---[CLIENT] Called whenever a players presses a mouse key on the context menu in Sandbox or on any panel derived from CGModBase, such as the panel used by gui.EnableScreenClicker and the panel used by Panel:ParentToHUD.
---
--- See GM:VGUIMousePressed for a hook that is called on all VGUI elements.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GUIMousePressed)
---@param mouseCode number The key that the player pressed using Enums/MOUSE.
---@param aimVector Vector A normalized direction vector local to the camera. Internally, this is  gui.ScreenToVector( gui.MousePos() ).
function GM:GUIMousePressed(mouseCode, aimVector) end

---[CLIENT] Called whenever a players releases a mouse key on the context menu in Sandbox or on any panel derived from CGModBase, such as the panel used by gui.EnableScreenClicker and the panel used by Panel:ParentToHUD.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:GUIMouseReleased)
---@param mouseCode number The key the player released, see Enums/MOUSE
---@param aimVector Vector A normalized direction vector local to the camera. Internally this is  gui.ScreenToVector( gui.MousePos() ).
function GM:GUIMouseReleased(mouseCode, aimVector) end

---[SERVER] Called to handle player armor reduction, when player receives damage.
---
--- Clarify hook order with other damage hooks.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerArmorReduction)
---@param ply Player The player that took damage.
---@param dmginfo CTakeDamageInfo The taken damage.
function GM:HandlePlayerArmorReduction(ply, dmginfo) end

---[SHARED] Allows to override player driving animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerDriving)
---@param ply Player Player to process
---@return boolean # Return true if we've changed/set the animation, false otherwise
function GM:HandlePlayerDriving(ply) end

---[SHARED] Allows to override player crouch animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerDucking)
---@param ply Player The player
---@param velocity number Players velocity
---@return boolean # Return true if we've changed/set the animation, false otherwise
function GM:HandlePlayerDucking(ply, velocity) end

---[SHARED] Called every frame by the player model animation system. Allows to override player jumping animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerJumping)
---@param ply Player The player
---@param velocity number Players velocity
---@return boolean # Return true if we've changed/set the animation, false otherwise
function GM:HandlePlayerJumping(ply, velocity) end

---[SHARED] Called every frame by the player model animation system. Allows to override player landing animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerLanding)
---@param ply Player The player
---@param velocity number Players velocity
---@param onGround boolean Was the player on ground?
---@return boolean # Return true if we've changed/set the animation, false otherwise
function GM:HandlePlayerLanding(ply, velocity, onGround) end

---[SHARED] Allows to override player noclip animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerNoClipping)
---@param ply Player The player
---@param velocity number Players velocity
---@return boolean # Return true if we've changed/set the animation, false otherwise
function GM:HandlePlayerNoClipping(ply, velocity) end

---[SHARED] Allows to override player swimming animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerSwimming)
---@param ply Player The player
---@param velocity number Players velocity
---@return boolean # Return true if we've changed/set the animation, false otherwise
function GM:HandlePlayerSwimming(ply, velocity) end

---[SHARED] Allows to override player flying ( in mid-air, not noclipping ) animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HandlePlayerVaulting)
---@param ply Player The player
---@param velocity number Players velocity
---@return boolean # Return true if we've changed/set the animation, false otherwise
function GM:HandlePlayerVaulting(ply, velocity) end

---[CLIENT] Hides the team selection panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HideTeam)
function GM:HideTeam() end

---[CLIENT] Called when the client has picked up ammo. Override to disable default HUD notification.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDAmmoPickedUp)
---@param itemName string Name of the item (ammo) picked up
---@param amount number Amount of the item (ammo) picked up
function GM:HUDAmmoPickedUp(itemName, amount) end

---[CLIENT] Renders the HUD pick-up history. Override to hide default or draw your own HUD.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDDrawPickupHistory)
function GM:HUDDrawPickupHistory() end

---[CLIENT] Called every frame to render the scoreboard.
---
---
--- It is recommended to use Derma and VGUI for this job instead of this hook. Called right after GM:HUDPaint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDDrawScoreBoard)
function GM:HUDDrawScoreBoard() end

---[CLIENT] Called from GM:HUDPaint to draw player info when you hover over a player with your crosshair or mouse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDDrawTargetID)
---@return boolean # Should the player info be drawn.
function GM:HUDDrawTargetID() end

---[CLIENT] Called when an item has been picked up. Override to disable the default HUD notification.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDItemPickedUp)
---@param itemName string Name of the picked up item
function GM:HUDItemPickedUp(itemName) end

---[CLIENT] Called whenever the HUD should be drawn.
---
--- Called right before GM:HUDDrawScoreBoard and after GM:HUDPaintBackground.
---
--- Not called when the Camera SWEP is equipped, or when the main menu is visible. GM:PostDrawHUD does not have this behavior.
---
--- See also GM:DrawOverlay.
---
--- Gets called only when r_drawvgui and GM:HUDShouldDraw are enabled and the game is not paused
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDPaint)
function GM:HUDPaint() end

---[CLIENT] Called before GM:HUDPaint when the HUD background is being drawn.
---
--- Just like GM:HUDPaint, this hook will not be called when the main menu is visible. GM:PostDrawHUD does not have this behavior.
---
--- Things rendered in this hook will **always** appear behind things rendered in GM:HUDPaint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDPaintBackground)
function GM:HUDPaintBackground() end

---[CLIENT] Called when the Gamemode is about to draw a given element on the client's HUD (heads-up display).
---
--- This hook is called HUNDREDS of times per second (more than 5 times per frame on average). You shouldn't be performing any computationally intensive operations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDShouldDraw)
---@param name string The name of the HUD element. You can find a full list of HUD elements for this hook HUD_Element_List.
---@return boolean # Return false to prevent the given element from being drawn on the client's screen.
function GM:HUDShouldDraw(name) end

---[CLIENT] Called when a weapon has been picked up. Override to disable the default HUD notification.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:HUDWeaponPickedUp)
---@param weapon Weapon The picked up weapon
function GM:HUDWeaponPickedUp(weapon) end

---[SHARED] Called after the gamemode loads and starts.
---
--- No entities would be present at the time this hook is called, please see GM:InitPostEntity for a one time fire hook after all map entities have been initialized.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:Initialize)
function GM:Initialize() end

---[SHARED] Called after all the entities are initialized. Starting from this hook Global.LocalPlayer will return valid object.
---
--- At this point the client only knows about the entities that are within the spawnpoints' [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community"). For instance, if the server sends an entity that is not within this PVS, the client will receive it as NULL entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:InitPostEntity)
function GM:InitPostEntity() end

---[CLIENT] Allows you to modify the supplied User Command with mouse input. This could be used to make moving the mouse do funky things to view angles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:InputMouseApply)
---@param cmd CUserCmd User command.
---@param x number The amount of mouse movement across the X axis this frame.
---@param y number The amount of mouse movement across the Y axis this frame.
---@param ang Angle The current view angle.
---@return boolean # Return true if we modified something.
function GM:InputMouseApply(cmd, x, y, ang) end

---[SERVER] Check if a player can spawn at a certain spawnpoint.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:IsSpawnpointSuitable)
---@param ply Player The player who is spawned
---@param spawnpoint Entity The spawnpoint entity (on the map).
---@param makeSuitable boolean If this is true, it'll kill any players blocking the spawnpoint.
---@return boolean # Return true to indicate that the spawnpoint is suitable (Allow for the player to spawn here), false to prevent spawning.
function GM:IsSpawnpointSuitable(ply, spawnpoint, makeSuitable) end

---[SHARED] Called whenever a player pressed a key included within the IN keys.
---
--- For a more general purpose function that handles all kinds of input, see GM:PlayerButtonDown.
---
--- Due to this being a predicted hook, Global.ParticleEffects created only serverside from this hook will not be networked to the client, so make sure to do that on both realms.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:KeyPress)
---@param ply Player The player pressing the key. If running client-side, this will always be Global.LocalPlayer.
---@param key number The key that the player pressed using Enums/IN.
function GM:KeyPress(ply, key) end

---[SHARED] Runs when a IN key was released by a player.
---
--- For a more general purpose function that handles all kinds of input, see GM:PlayerButtonUp.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:KeyRelease)
---@param ply Player The player releasing the key. If running client-side, this will always be Global.LocalPlayer.
---@param key number The key that the player released using Enums/IN.
function GM:KeyRelease(ply, key) end

---[SERVER] Called from `gm_load` when the game should load a map.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:LoadGModSave)
---@param data string Compressed save data
---@param map string The name of the map the save was created on
---@param timestamp number The time the save was created on. Will always be 0.
function GM:LoadGModSave(data, map, timestamp) end

---[MENU] Called while an addon from the Steam workshop is downloading. Used by default to update details on the fancy workshop download panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:LoadGModSaveFailed)
---@return string # Failure Reason.
---@return string # the workshop ID of the missing map (if found). Can be an empty string
function GM:LoadGModSaveFailed() end

---[MENU] Called when `menu.lua` has finished loading.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:MenuStart)
function GM:MenuStart() end

---[SHARED] Override this gamemode function to disable mouth movement when talking on voice chat.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:MouthMoveAnimation)
---@param ply Player Player in question
function GM:MouthMoveAnimation(ply) end

---[SHARED] The Move hook is called for you to manipulate the player's MoveData.
---
--- You shouldn't adjust the player's position in any way in the move hook. This is because due to prediction errors, the netcode might run the move hook multiple times as packets arrive late. Therefore you should only adjust the movedata construct in this hook.
---
--- Generally you shouldn't have to use this hook - if you want to make a custom move type you should look at the drive system.
---
--- This hook is called after GM:PlayerTick.
---
--- See Game Movement for an explanation on the move system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:Move)
---@param ply Player Player
---@param mv CMoveData Movement information
---@return boolean # Return true to suppress default engine action.
function GM:Move(ply, mv) end

---[CLIENT] Returning true in this hook will cause it to render depth buffers defined with render.GetResolvedFullFrameDepth.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:NeedsDepthPass)
---@return boolean # Render depth buffer
function GM:NeedsDepthPass() end

---[CLIENT] Called when an entity has been created over the network.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:NetworkEntityCreated)
---@param ent Entity Created entity
function GM:NetworkEntityCreated(ent) end

---[SERVER] Called when a player's SteamID has been validated by Steam.
---
--- See also GM:PlayerAuthed.
---
--- This hook doesn't work intentionally in singleplayer [because the SteamID is not validated](https://github.com/Facepunch/garrysmod-issues/issues/4906#issuecomment-819337130).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:NetworkIDValidated)
---@param name string Player name
---@param steamID string Player SteamID
function GM:NetworkIDValidated(name, steamID) end

---[CLIENT] Called whenever this entity changes its transmission state for this Global.LocalPlayer, such as exiting or re entering the [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community").
---
---
--- 	This is the best place to handle the reset of Entity:SetPredictable, as this would be usually called when the player lags and requests a full packet update.
---
--- 	When the entity stops transmitting, Entity:IsDormant will only return true **after** this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:NotifyShouldTransmit)
---@param entity Entity The entity that changed its transmission state.
---@param shouldtransmit boolean `True` if we started transmitting to this client and `false` if we stopped.
function GM:NotifyShouldTransmit(entity, shouldtransmit) end

---[CLIENT] Called when a player has achieved an achievement. You can get the name and other information from an achievement ID with the achievements library.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnAchievementAchieved)
---@param ply Player The player that earned the achievement
---@param achievement number The index of the achievement
function GM:OnAchievementAchieved(ply, achievement) end

---[CLIENT] Called when the local player presses TAB while having their chatbox opened.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnChatTab)
---@param text string The currently typed into chatbox text
---@return string # What should be placed into the chatbox instead of what currently is when player presses tab
function GM:OnChatTab(text) end

---[CLIENT] Called when the player cleans up something.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnCleanup)
---@param name string The name of the cleanup type
---@return boolean # Return false to suppress the cleanup notification.
function GM:OnCleanup(name) end

---[CLIENT] Called when a caption has been emitted to the closed caption box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnCloseCaptionEmit)
---@param soundScript string The name of the soundscript, or `customLuaToken` if it's from gui.AddCaption
---@param duration number How long the caption should stay for
---@param fromPlayer boolean Is this caption coming from the player?
---@param fullText string The caption. Can be nil if its token is not registered
---@return boolean # Return `true` to prevent the caption from appearing
function GM:OnCloseCaptionEmit(soundScript, duration, fromPlayer, fullText) end

---[CLIENT] Called when the context menu keybind (+menu_context) is released, which by default is C.
---
--- This hook will not run if input.IsKeyTrapping returns true.
---
--- See also GM:OnContextMenuOpen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnContextMenuClose)
function GM:OnContextMenuClose() end

---[CLIENT] Called when the context menu keybind (`+menu_context`) is pressed, which by default is C.
---
--- See also GM:OnContextMenuClose.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnContextMenuOpen)
function GM:OnContextMenuOpen() end

---[SHARED] Called when the crazy physics detection detects an entity with Crazy Physics.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnCrazyPhysics)
---@param ent Entity The entity that was detected as crazy
---@param physobj PhysObj The physics object that is going crazy
function GM:OnCrazyPhysics(ent, physobj) end

---[SERVER] Called when a player has been hurt by an explosion. Override to disable default sound effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnDamagedByExplosion)
---@param ply Player Player who has been hurt
---@param dmginfo CTakeDamageInfo Damage info from explsion
function GM:OnDamagedByExplosion(ply, dmginfo) end

---[SHARED] Called as soon as the entity is created. Very little of the entity's properties will be initialized at this stage. (keyvalues, classname, flags, anything), especially on the serverside.
---
--- Some entities on initial map spawn are passed through this hook, and then removed in the same frame. This is used by the engine to precache things like models and sounds, so always check their validity with Global.IsValid.
---
--- Removing the created entity during this event can lead to unexpected problems. Use timer.Simple( 0, .... ) to safely remove the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnEntityCreated)
---@param entity Entity The entity
function GM:OnEntityCreated(entity) end

---[SERVER] Called when the Entity:WaterLevel of an entity is changed.
--- 	This hook can be considered a physics callback, so changing collision rules (Entity:SetSolidFlags) in it may lead to a crash!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnEntityWaterLevelChanged)
---@param entity Entity The entity.
---@param old number Previous water level.
---@param new number The new water level.
function GM:OnEntityWaterLevelChanged(entity, old, new) end

---[SHARED] Called when the gamemode is loaded.
---
--- Global.LocalPlayer() returns NULL at the time this is run.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnGamemodeLoaded)
function GM:OnGamemodeLoaded() end

---[SHARED AND MENU] Called when a Lua error occurs.
--- On the States, this hook will only account for server-side errors, not client-side ones.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnLuaError)
---@param error string The error that occurred.
---@param realm string Where the Lua error took place, "client", or "server"
---@param stack table The Lua error stack trace
---@param name string Title of the addon that is creating the Lua errors.
---@param id number Steam Workshop ID of the addon creating Lua errors, if it is an addon.
function GM:OnLuaError(error, realm, stack, name, id) end

---[MENU] Called when a Addon Conflict occurs, only works in the Menu realm.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnNotifyAddonConflict)
---@param addon1 string The first Addon
---@param addon2 string The second Addon
---@param fileName string The File the Conflict occurred in.
function GM:OnNotifyAddonConflict(addon1, addon2, fileName) end

---[SERVER] Called whenever an NPC is killed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnNPCKilled)
---@param npc NPC The killed NPC
---@param attacker Entity The NPCs attacker, the entity that gets the kill credit, for example a player or an NPC.
---@param inflictor Entity Death inflictor. The entity that did the killing. Not necessarily a weapon.
function GM:OnNPCKilled(npc, attacker, inflictor) end

---[MENU] Called when a permission gets Granted or Revoked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPermissionsChanged)
function GM:OnPermissionsChanged() end

---[SERVER] Called when a player freezes an entity with the physgun.
---
--- This is not called for players or NPCs being held with the physgun.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPhysgunFreeze)
---@param weapon Entity The weapon that was used to freeze the entity.
---@param physobj PhysObj Physics object of the entity.
---@param ent Entity The target entity.
---@param ply Player The player who tried to freeze the entity.
function GM:OnPhysgunFreeze(weapon, physobj, ent, ply) end

---[SERVER] Called to when a player has successfully picked up an entity with their Physics Gun.
---
--- Not to be confused with GM:PhysgunPickup which is called multiple times to ask if the player should be able to pick up an entity.
---
---
--- See GM:GravGunOnPickedUp for the Gravity Gun pickup variant.
--- See GM:OnPlayerPhysicsPickup for the player `+use` pickup variant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPhysgunPickup)
---@param ply Player The player that has picked up something using the physics gun.
---@param ent Entity The entity that was picked up.
function GM:OnPhysgunPickup(ply, ent) end

---[SERVER] Called when a player reloads with the physgun. Override this to disable default unfreezing behavior.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPhysgunReload)
---@param physgun Weapon The physgun in question
---@param ply Player The player wielding the physgun
---@return boolean # Whether the player can reload with the physgun or not
function GM:OnPhysgunReload(physgun, ply) end

---[SERVER] Called when a player has changed team using GM:PlayerJoinTeam.
---
--- This hook will not work with hook.Add and it is only called manually from GM:PlayerJoinTeam by the base gamemode
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPlayerChangedTeam)
---@param ply Player Player who has changed team
---@param oldTeam number Index of the team the player was originally in
---@param newTeam number Index of the team the player has changed to
---@deprecated Use GM:PlayerChangedTeam instead, which works for every Player:SetTeam call.
function GM:OnPlayerChangedTeam(ply, oldTeam, newTeam) end

---[CLIENT] Called whenever a player sends a chat message. For the serverside equivalent, see GM:PlayerSay.
--- The text input of this hook depends on GM:PlayerSay. If it is suppressed on the server, it will be suppressed on the client. This also means, that a message surpressed with this hook will be still visible to other clients.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPlayerChat)
---@param ply Player The player
---@param text string The message's text
---@param teamChat boolean Is the player typing in team chat?
---@param isDead boolean Is the player dead?
---@return boolean # Should the message be suppressed?
function GM:OnPlayerChat(ply, text, teamChat, isDead) end

---[SHARED] Called when a player makes contact with the ground after a jump or a fall.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPlayerHitGround)
---@param player Entity Player
---@param inWater boolean Did the player land in water?
---@param onFloater boolean Did the player land on an object floating in the water?
---@param speed number The speed at which the player hit the ground
---@return boolean # Return true to suppress default action
function GM:OnPlayerHitGround(player, inWater, onFloater, speed) end

---[SHARED] Called when a player jumps.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPlayerJump)
---@param player Entity Player
---@param speed number The velocity/impulse of the jump
function GM:OnPlayerJump(player, speed) end

---[SERVER] Called when a player +use drops an entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPlayerPhysicsDrop)
---@param ply Player The player that dropped the object
---@param ent Entity The object that was dropped.
---@param thrown boolean Whether the object was throw or simply let go of.
function GM:OnPlayerPhysicsDrop(ply, ent, thrown) end

---[SERVER] Called when a player +use pickups up an entity. This will be called after the entity passes though GM:AllowPlayerPickup.
---
--- See GM:GravGunOnPickedUp for the Gravity Gun pickup variant.
--- See GM:OnPhysgunPickup for the Physics Gun pickup variant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnPlayerPhysicsPickup)
---@param ply Player The player that picked up the object
---@param ent Entity The object that was picked up.
function GM:OnPlayerPhysicsPickup(ply, ent) end

---[SHARED] Called when gamemode has been reloaded by auto refresh.
---
--- It seems that this event can be triggered more than once for a single refresh event.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnReloaded)
function GM:OnReloaded() end

---[CLIENT] Called when the player's screen resolution of the game changes.
---
--- Global.ScrW and Global.ScrH will return the new values when this hook is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnScreenSizeChanged)
---@param oldWidth number The previous width of the game's window.
---@param oldHeight number The previous height of the game's window.
---@param newWidth number The new/current width of the game's window.
---@param newHeight number The new/current height of the game's window.
function GM:OnScreenSizeChanged(oldWidth, oldHeight, newWidth, newHeight) end

---[CLIENT] Called when a player releases the `+menu` bind on their keyboard, which is bound to Q by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnSpawnMenuClose)
function GM:OnSpawnMenuClose() end

---[CLIENT] Called when a player presses the `+menu` bind on their keyboard, which is bound to Q by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnSpawnMenuOpen)
function GM:OnSpawnMenuOpen() end

---[CLIENT] Called when a DTextEntry gets focus.
---
--- This hook is run from DTextEntry:OnGetFocus and PANEL:OnMousePressed of DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnTextEntryGetFocus)
---@param panel Panel The panel that got focus
function GM:OnTextEntryGetFocus(panel) end

---[CLIENT] Called when a DTextEntry loses focus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnTextEntryLoseFocus)
---@param panel Panel The panel that lost focus
function GM:OnTextEntryLoseFocus(panel) end

---[CLIENT] Called when the player undoes something.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnUndo)
---@param name string The name of the undo action
---@param customText string The custom text for the undo, set by undo.SetCustomUndoText
---@return boolean # Return false to suppress the undo notification.
function GM:OnUndo(name, customText) end

---[SHARED] Called when the player changes their weapon to another one - and their viewmodel model changes.
---
--- This is not always called clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:OnViewModelChanged)
---@param viewmodel Entity The viewmodel that is changing
---@param oldModel string The old model
---@param newModel string The new model
function GM:OnViewModelChanged(viewmodel, oldModel, newModel) end

---[SHARED] Called when a player drops an entity with the Physgun.
---
--- See GM:GravGunOnDropped for the Gravity Gun drop variant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PhysgunDrop)
---@param ply Player The player who dropped an entitiy
---@param ent Entity The dropped entity
function GM:PhysgunDrop(ply, ent) end

---[SHARED] Called to determine if a player should be able to pick up an entity with the Physics Gun.
---
--- See GM:OnPhysgunPickup for a hook which is called when a player has successfully picked up an entity.
---
--- See GM:GravGunPickupAllowed for the Gravity Gun pickup variant.
--- See GM:AllowPlayerPickup for the +USE pickup variant.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PhysgunPickup)
---@param player Player The player that is picking up using the Physics Gun.
---@param entity Entity The entity that is being picked up.
---@return boolean # Returns whether the player can pick up the entity or not.
function GM:PhysgunPickup(player, entity) end

---[SHARED] Called after player's reserve ammo count changes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerAmmoChanged)
---@param ply Player The player whose ammo is being affected.
---@param ammoID number The ammo type ID.
---@param oldCount number The old ammo count.
---@param newCount number The new ammo count.
function GM:PlayerAmmoChanged(ply, ammoID, oldCount, newCount) end

---[SERVER] Called after the player is authenticated by Steam. This hook will also be called in singleplayer. See also GM:NetworkIDValidated
---
--- Global.CurTime returns 0 in this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerAuthed)
---@param ply Player The player
---@param steamid string The player's SteamID
---@param uniqueid string The player's UniqueID
function GM:PlayerAuthed(ply, steamid, uniqueid) end

---[CLIENT] Runs when a bind has been pressed. Allows to block commands.
---
--- By using the "alias" console command, this hook can be effectively circumvented. To prevent this use input.TranslateAlias.
---
--- To stop the user from using `+attack`, `+left` and any other movement commands of the sort, please look into using GM:StartCommand instead.
---
--- The third argument will always be true.
---
--- This does not run for function keys binds (F1-F12).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerBindPress)
---@param ply Player The player who used the command; this will always be equal to Global.LocalPlayer.
---@param bind string The bind command.
---@param pressed boolean If the bind was activated or deactivated.
---@param code number The button code. See Enums/BUTTON_CODE Enums.
---@return boolean # Return `true` to prevent the bind.
function GM:PlayerBindPress(ply, bind, pressed, code) end

---[SHARED] Called when a player presses a button.
---
--- This will not be called if player has a panel opened with keyboard input enabled, use PANEL:OnKeyCodePressed instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerButtonDown)
---@param ply Player Player who pressed the button
---@param button number The button, see Enums/BUTTON_CODE
function GM:PlayerButtonDown(ply, button) end

---[SHARED] Called when a player releases a button.
---
--- This will not be called if player has a panel opened with keyboard input enabled, use PANEL:OnKeyCodeReleased instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerButtonUp)
---@param ply Player Player who released the button
---@param button number The button, see Enums/BUTTON_CODE
function GM:PlayerButtonUp(ply, button) end

---[SERVER] Decides whether a player can hear another player using voice chat.
---
--- This hook is called **several** times a tick, so ensure your code is efficient.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerCanHearPlayersVoice)
---@param listener Player The listening player.
---@param talker Player The talking player.
---@return boolean # Return `true` if the listener should hear the talker, `false` if they shouldn't.
---@return boolean # 3D sound. If set to `true`, will fade out the sound the further away listener is from the  talker, the voice will also be in stereo, and not mono.
function GM:PlayerCanHearPlayersVoice(listener, talker) end

---[SERVER] Returns whether or not a player is allowed to join a team
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerCanJoinTeam)
---@param ply Player Player attempting to switch teams
---@param team number Index of the team
---@return boolean # Allowed to switch
function GM:PlayerCanJoinTeam(ply, team) end

---[SERVER] Returns whether or not a player is allowed to pick an item up. (ammo, health, armor)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerCanPickupItem)
---@param ply Player Player attempting to pick up
---@param item Entity The item the player is attempting to pick up
---@return boolean # Allow pick up
function GM:PlayerCanPickupItem(ply, item) end

---[SERVER] Returns whether or not a player is allowed to pick up a weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerCanPickupWeapon)
---@param ply Player The player attempting to pick up the weapon.
---@param weapon Weapon The weapon entity in question.
---@return boolean # Allowed pick up or not.
function GM:PlayerCanPickupWeapon(ply, weapon) end

---[SERVER] Returns whether or not the player can see the other player's chat.
--- The **speaker** parameter does not have to be a valid Player object which happens when console messages are displayed for example.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerCanSeePlayersChat)
---@param text string The chat text
---@param teamOnly boolean If the message is team-only
---@param listener Player The player receiving the message
---@param speaker Player The player sending the message.
---@return boolean # Can see other player's chat
function GM:PlayerCanSeePlayersChat(text, teamOnly, listener, speaker) end

---[SERVER] Called when a player has changed team using Player:SetTeam.
--- 	Avoid calling Player:SetTeam in this hook as it may cause an infinite loop!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerChangedTeam)
---@param ply Player Player whose team has changed.
---@param oldTeam number Index of the team the player was originally in. See team.GetName and the team library.
---@param newTeam number Index of the team the player has changed to.
function GM:PlayerChangedTeam(ply, oldTeam, newTeam) end

---[SHARED] Called whenever a player is about to spawn something to see if they hit a limit for whatever they are spawning.
--- 	This hook will not be called in singleplayer, as singleplayer does not have limits.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerCheckLimit)
---@param ply Player The player who is trying to spawn something.
---@param limitName string The limit's name.
---@param current number The amount of whatever player is trying to spawn that the player already has spawned.
---@param defaultMax number The default maximum count, as dictated by the `sbox_max` convar on the server. This is the amount that will be used if nothing is returned from this hook.
---@return boolean # Return `false` to indicate the limit was hit, or nothing otherwise
function GM:PlayerCheckLimit(ply, limitName, current, defaultMax) end

---[CLIENT] Called whenever a player's class is changed on the server-side with player_manager.SetPlayerClass.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerClassChanged)
---@param ply Player The player whose class has been changed.
---@param newID number The network ID of the player class's name string, or `0` if we are clearing a player class from the player.
---
--- Pass this into util.NetworkIDToString to retrieve the proper name of the player class.
function GM:PlayerClassChanged(ply, newID) end

---[SHARED] Executes when a player connects to the server. Called before the player has been assigned a Player:UserID and entity. See the Game_Events for a version of this hook called after the player entity has been created.
---
--- This is only called clientside for listen server hosts.
--- This is not called clientside for the local player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerConnect)
---@param name string The player's name.
---@param ip string The player's IP address. Will be "none" for bots.
---
--- This argument will only be passed serverside.
function GM:PlayerConnect(name, ip) end

---[SERVER] Called when a player is killed by Player:Kill or any other normal means.
---
--- This hook is **not** called if the player is killed by Player:KillSilent. See GM:PlayerSilentDeath for that.
---
--- * GM:DoPlayerDeath is called **before** this hook.
--- * GM:PostPlayerDeath is called **after** this hook.
---
--- See Player:LastHitGroup if you need to get the last hit hitgroup of the player.
---
--- Player:Alive will return false in this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerDeath)
---@param victim Player The player who died
---@param inflictor Entity Item used to kill the victim
---@param attacker Entity Player or entity that killed the victim
function GM:PlayerDeath(victim, inflictor, attacker) end

---[SERVER] Returns whether or not the default death sound should be muted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerDeathSound)
---@param ply Player The player
---@return boolean # Mute death sound
function GM:PlayerDeathSound(ply) end

---[SERVER] Called every think while the player is dead. The return value will determine if the player respawns.
---
--- Overwriting this function will prevent players from respawning by pressing space or clicking.
---
--- This hook is not called for players with the Enums/FL flag applied.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerDeathThink)
---@param ply Player The player affected in the hook.
---@return boolean # Return a non-nil value to prevent respawn.
function GM:PlayerDeathThink(ply) end

---[SERVER] Called when a player leaves the server. See the gameevent/player_disconnect for a shared version of this hook.
--- Player:SteamID, Player:SteamID64, and the like can return nil here.
---
--- This is not called in single-player or listen servers for the host.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerDisconnected)
---@param ply Player the player
function GM:PlayerDisconnected(ply) end

---[SHARED] Called to update the player's animation during a drive.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerDriveAnimate)
---@param ply Player The driving player
function GM:PlayerDriveAnimate(ply) end

---[SERVER] Called when a weapon is dropped by a player via Player:DropWeapon.
---
--- Also called when a weapon is removed from a player via Player:StripWeapon.
---
--- See also GM:WeaponEquip for a hook when a player picks up a weapon.
---
--- The weapon's Entity:GetOwner will be NULL at the time this hook is called.
---
---
--- WEAPON:OnDrop will be called before this hook is.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerDroppedWeapon)
---@param owner Player The player who owned this weapon before it was dropped
---@param wep Weapon The weapon that was dropped
function GM:PlayerDroppedWeapon(owner, wep) end

---[CLIENT] Called when player stops using voice chat.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerEndVoice)
---@param ply Player Player who stopped talking
function GM:PlayerEndVoice(ply) end

---[SERVER] Called when a player enters a vehicle.
---
--- Called just after GM:CanPlayerEnterVehicle.
---
--- See also GM:PlayerLeaveVehicle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerEnteredVehicle)
---@param ply Player Player who entered vehicle.
---@param veh Vehicle Vehicle the player entered.
---@param role number The seat number.
function GM:PlayerEnteredVehicle(ply, veh, role) end

---[CLIENT] Called before firing clientside animation events on a player model.
---
--- See GM:PlayerHandleAnimEvent for the serverside version.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerFireAnimationEvent)
---@param ply Player The player who has triggered the event.
---@param pos Vector Position of the effect
---@param ang Angle Angle of the effect
---@param event number The event ID of happened even. See [this page](http://developer.valvesoftware.com/wiki/Animation_Events).
---@param name string Name of the event
---@return boolean # Return true to disable the effect
function GM:PlayerFireAnimationEvent(ply, pos, ang, event, name) end

---[SHARED] Called whenever a player steps. Return true to mute the normal sound.
--- 		This hook is called on all clients.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerFootstep)
---@param ply Player The stepping player
---@param pos Vector The position of the step
---@param foot number Foot that is stepped. 0 for left, 1 for right
---@param sound string Sound that is going to play
---@param volume number Volume of the footstep
---@param filter CRecipientFilter The Recipient filter of players who can hear the footstep
---@return boolean # Prevent default step sound
function GM:PlayerFootstep(ply, pos, foot, sound, volume, filter) end

---[SERVER] Called when a player freezes an object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerFrozeObject)
---@param ply Player Player who has frozen an object
---@param ent Entity The frozen object
---@param physobj PhysObj The frozen physics object of the frozen entity ( For ragdolls )
function GM:PlayerFrozeObject(ply, ent, physobj) end

---[SERVER] Called before firing serverside animation events on the player models.
---
--- See GM:PlayerFireAnimationEvent for the clientside version.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerHandleAnimEvent)
---@param ply Player The player who has triggered the event.
---@param event number The event ID of happened even. See [this page](http://developer.valvesoftware.com/wiki/Animation_Events).
---@param eventTime number The absolute time this event occurred using Global.CurTime.
---@param cycle number The frame this event occurred as a number between 0 and 1.
---@param type number Event type. See [the Source SDK](https://github.com/ValveSoftware/source-sdk-2013/blob/master/mp/src/game/shared/eventlist.h#L14-L23).
---@param options string Name or options of this event.
function GM:PlayerHandleAnimEvent(ply, event, eventTime, cycle, type, options) end

---[SERVER] Called when a player gets hurt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerHurt)
---@param victim Player Victim
---@param attacker Entity Attacker Entity
---@param healthRemaining number Remaining Health
---@param damageTaken number Damage Taken
function GM:PlayerHurt(victim, attacker, healthRemaining, damageTaken) end

---[SERVER] Called when the player spawns for the first time.
---
--- See GM:PlayerSpawn for a hook called every player spawn.
---
--- This hook is called before the player has fully loaded, when the player is still in seeing the `Starting Lua` screen. For example, trying to use the Entity:GetModel function will return the default model (`models/player.mdl`).
---
--- Due to the above note, sending net messages to the spawned player in this hook are highly unreliable, and they most likely won't be received (more information here: https://github.com/Facepunch/garrysmod-requests/issues/718).
---
--- If you look for a highly reliable way to send early net messages to a player on connection, consider using [player_activate](gameevent/player_activate) or [OnRequestFullUpdate](gameevent/OnRequestFullUpdate) game events.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerInitialSpawn)
---@param player Player The player who spawned.
---@param transition boolean If `true`, the player just spawned from a map transition.
function GM:PlayerInitialSpawn(player, transition) end

---[SERVER] Makes the player join a specified team. This is a convenience function that calls Player:SetTeam and runs the GM:OnPlayerChangedTeam hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerJoinTeam)
---@param ply Player Player to force
---@param team number The team to put player into
function GM:PlayerJoinTeam(ply, team) end

---[SERVER] Called when a player leaves a vehicle for any reason, including Player:ExitVehicle.
---
--- See GM:PlayerEnteredVehicle for the opposite hook.
---
--- For vehicles with exit animations, this will be called **at the end** of the animation, **not at the start**!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerLeaveVehicle)
---@param ply Player Player who left a vehicle.
---@param veh Vehicle Vehicle the player left.
function GM:PlayerLeaveVehicle(ply, veh) end

---[SERVER] Called to give players the default set of weapons.
---
---
--- This function may not work in your custom gamemode if you have overridden your GM:PlayerSpawn and you do not use self.BaseClass.PlayerSpawn or hook.Call.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerLoadout)
---@param ply Player Player to give weapons to.
function GM:PlayerLoadout(ply) end

---[SHARED] Called when a player tries to switch noclip mode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerNoClip)
---@param ply Player The person who entered/exited noclip
---@param desiredState boolean Represents the noclip state (on/off) the user will enter if this hook allows them to.
---@return boolean # Return false to disallow the switch.
function GM:PlayerNoClip(ply, desiredState) end

---[SHARED] Called after the player's think.
--- 		On the client side, it is only called for the local player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerPostThink)
---@param ply Player The player
function GM:PlayerPostThink(ply) end

---[SERVER] Request a player to join the team. This function will check if the team is available to join or not.
---
--- This hook is called when the player runs "changeteam" in the console.
---
--- To prevent the player from changing teams, see GM:PlayerCanJoinTeam
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerRequestTeam)
---@param ply Player The player to try to put into a team
---@param team number Team to put the player into if the checks succeeded
function GM:PlayerRequestTeam(ply, team) end

---[SERVER] Called when a player dispatched a chat message. For the clientside equivalent, see GM:OnPlayerChat.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSay)
---@param sender Player The player which sent the message.
---@param text string The message's content.
---@param teamChat boolean Return false when the message is for everyone, true when the message is for the sender's team.
---@return string # What to show instead of original text. Set to `""` to stop the message from displaying.
function GM:PlayerSay(sender, text, teamChat) end

---[SERVER] Called to determine a spawn point for a player to spawn at.
--- 		The spawn point entity will also impact the player's eye angle. For example, if the entity is upside down, the player's view will be as well.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSelectSpawn)
---@param ply Player The player who needs a spawn point
---@param transition boolean If true, the player just spawned from a map transition (`trigger_changelevel`). You probably want to not return an entity for that case to not override player's position.
---@return Entity # The spawn point entity to spawn the player at
function GM:PlayerSelectSpawn(ply, transition) end

---[SERVER] Find a team spawn point entity for this player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSelectTeamSpawn)
---@param team number Players team
---@param ply Player The player
---@return Entity # The entity to use as a spawn point.
function GM:PlayerSelectTeamSpawn(team, ply) end

---[SERVER] Called whenever view model hands needs setting a model. By default this calls PLAYER:GetHandsModel and if that fails, sets the hands model according to his player model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSetHandsModel)
---@param ply Player The player whose hands needs a model set
---@param ent Entity The hands to set model of
function GM:PlayerSetHandsModel(ply, ent) end

---[SERVER] Called whenever a player spawns and must choose a model. A good place to assign a model to a player.
--- This function may not work in your custom gamemode if you have overridden your GM:PlayerSpawn and you do not use self.BaseClass.PlayerSpawn or hook.Call.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSetModel)
---@param ply Player The player being chosen
function GM:PlayerSetModel(ply) end

---[SERVER] Returns true if the player should take damage from the given attacker.
---
--- Applying damage from this hook to the player taking damage will lead to infinite loop/crash.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerShouldTakeDamage)
---@param ply Player The player
---@param attacker Entity The attacker
---@return boolean # Allow damage
function GM:PlayerShouldTakeDamage(ply, attacker) end

---[SERVER] Allows to suppress player taunts.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerShouldTaunt)
---@param ply Player Player who tried to taunt
---@param act number Act ID of the taunt player tries to do, see Enums/ACT
---@return boolean # Return false to disallow player taunting
function GM:PlayerShouldTaunt(ply, act) end

---[SERVER] Called when the player is killed by Player:KillSilent.
---
--- The player is already considered dead when this hook is called.
---
--- * See GM:PlayerDeath for a hook which handles all other death causes.
--- * GM:PostPlayerDeath is called **after** this hook.
---
--- Player:Alive will return true in this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSilentDeath)
---@param ply Player The player who was killed
function GM:PlayerSilentDeath(ply) end

---[SERVER] Called whenever a player spawns, including respawns.
---
--- See GM:PlayerInitialSpawn for a hook called only the first time a player spawns.
---
--- See the gameevent/player_spawn for a shared version of this hook.
---
--- By default, in "base" derived gamemodes, this hook will also call GM:PlayerLoadout and GM:PlayerSetModel, which may override your Entity:SetModel and Player:Give calls. Consider using the other hooks or a 0-second timer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSpawn)
---@param player Player The player who spawned.
---@param transition boolean If true, the player just spawned from a map transition. You probably want to not touch player's weapons or positiom if this is set to `true`.
function GM:PlayerSpawn(player, transition) end

---[SERVER] Called to spawn the player as a spectator.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSpawnAsSpectator)
---@param ply Player The player to spawn as a spectator
function GM:PlayerSpawnAsSpectator(ply) end

---[SERVER] Determines if the player can spray using the `impulse 201` console command.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSpray)
---@param sprayer Player The player.
---@return boolean # Return `false` to allow spraying, return `true` to prevent spraying.
function GM:PlayerSpray(sprayer) end

---[SERVER] Called when player starts taunting.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerStartTaunt)
---@param ply Player The player who is taunting
---@param act number The sequence ID of the taunt
---@param length number Length of the taunt
function GM:PlayerStartTaunt(ply, act, length) end

---[CLIENT] Called when a player starts using voice chat.
--- Set mp_show_voice_icons to 0, if you want disable icons above player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerStartVoice)
---@param ply Player Player who started using voice chat.
---@return boolean # Set true to hide player's `CHudVoiceStatus`.
function GM:PlayerStartVoice(ply) end

---[SHARED] Allows you to override the time between footsteps.
--- 		This hook is called on all clients.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerStepSoundTime)
---@param ply Player Player who is walking
---@param type number The type of footsteps, see Enums/STEPSOUNDTIME
---@param walking boolean Is the player walking or not ( +walk? )
---@return number # Time between footsteps, in ms
function GM:PlayerStepSoundTime(ply, type, walking) end

---[SERVER] Called whenever a player attempts to either turn on or off their flashlight, returning false will deny the change.
--- Also gets called when using Player:Flashlight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSwitchFlashlight)
---@param ply Player The player who attempts to change their flashlight state.
---@param enabled boolean The new state the player requested, true for on, false for off.
---@return boolean # Can toggle the flashlight or not
function GM:PlayerSwitchFlashlight(ply, enabled) end

---[SHARED] Called when a player attempts to switch their weapon.
---
--- Primary usage of this hook is to prevent/allow weapon switching, **not** to detect weapon switching. It will not be called for Player:SetActiveWeapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerSwitchWeapon)
---@param player Player The player switching weapons.
---@param oldWeapon Weapon The previous weapon. Will be `NULL` if the previous weapon was removed or the player is switching from nothing.
---@param newWeapon Weapon The weapon the player switched to. Will be `NULL` if the player is switching to nothing.
---
--- This can be `NULL` on the client if the weapon hasn't been created over the network yet.
---@return boolean # Return `true` to prevent weapon switch.
function GM:PlayerSwitchWeapon(player, oldWeapon, newWeapon) end

---[SHARED] The Move hook is called for you to manipulate the player's CMoveData. This hook is called moments before GM:Move and GM:PlayerNoClip.
---
--- This hook will not run when inside a vehicle. GM:VehicleMove will be called instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerTick)
---@param player Player The player
---@param mv CMoveData The current movedata for the player.
function GM:PlayerTick(player, mv) end

---[SHARED] Called when a player has been hit by a trace and damaged (such as from a bullet). Returning true overrides the damage handling and prevents GM:ScalePlayerDamage from being called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerTraceAttack)
---@param ply Player The player that has been hit
---@param dmginfo CTakeDamageInfo The damage info of the bullet
---@param dir Vector Normalized vector direction of the bullet's path
---@param trace table The trace of the bullet's path, see Structures/TraceResult
---@return boolean # Override engine handling
function GM:PlayerTraceAttack(ply, dmginfo, dir, trace) end

---[SERVER] Called when a player unfreezes an object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerUnfrozeObject)
---@param ply Player Player who has unfrozen an object
---@param ent Entity The unfrozen object
---@param physobj PhysObj The frozen physics object of the unfrozen entity ( For ragdolls )
function GM:PlayerUnfrozeObject(ply, ent, physobj) end

---[SERVER] Triggered when the player presses use on an object. Continuously runs until USE is released but will not activate other Entities until the USE key is released; dependent on activation type of the Entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerUse)
---@param ply Player The player pressing the "use" key.
---@param ent Entity The entity which the player is looking at / activating USE on.
---@return boolean # Return `false` if the player is not allowed to USE the entity.  Do not return `true` if using a hook, otherwise other mods may not get a chance to block a player's use.
function GM:PlayerUse(ply, ent) end

---[CLIENT] Called when it's time to populate the context menu menu bar at the top.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PopulateMenuBar)
---@param menubar Panel The DMenuBar itself.
function GM:PopulateMenuBar(menubar) end

---[SHARED] Called right after the map has cleaned up (usually because game.CleanUpMap was called)
---
--- See also GM:PreCleanupMap.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostCleanupMap)
function GM:PostCleanupMap() end

---[CLIENT] Called right after the 2D skybox has been drawn - allowing you to draw over it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDraw2DSkyBox)
function GM:PostDraw2DSkyBox() end

---[CLIENT] Called after rendering effects. This is where halos are drawn. Called just before GM:PreDrawHUD.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDrawEffects)
function GM:PostDrawEffects() end

---[CLIENT] Called after GM:PreDrawHUD,  GM:HUDPaintBackground and GM:HUDPaint but before  GM:DrawOverlay.
---
--- Unlike GM:HUDPaint(GM:HUDPaintBackground) hooks, this will still be called when the main menu is visible. And so will be GM:PreDrawHUD
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDrawHUD)
function GM:PostDrawHUD() end

---[CLIENT] Called after drawing opaque entities.
---
--- See also GM:PostDrawTranslucentRenderables and GM:PreDrawOpaqueRenderables.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDrawOpaqueRenderables)
---@param bDrawingDepth boolean Whether the current draw is writing depth.
---@param bDrawingSkybox boolean Whether the current draw is drawing the 3D or 2D skybox.
---
--- In case of 2D skyboxes it is possible for this hook to always be called with this parameter set to `true`.
---@param isDraw3DSkybox boolean Whether the current draw is drawing the 3D.
function GM:PostDrawOpaqueRenderables(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox) end

---[CLIENT] Called after the player hands are drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDrawPlayerHands)
---@param hands Entity This is the gmod_hands entity.
---@param vm Entity This is the view model entity.
---@param ply Player The the owner of the view model.
---@param weapon Weapon This is the weapon that is from the view model.
function GM:PostDrawPlayerHands(hands, vm, ply, weapon) end

---[CLIENT] Called after drawing the 3D skybox. This will not be called if skybox rendering was prevented via the GM:PreDrawSkyBox hook.
---
--- See also GM:PostDraw2DSkyBox.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDrawSkyBox)
function GM:PostDrawSkyBox() end

---[CLIENT] Called after all translucent entities are drawn.
---
--- See also GM:PostDrawOpaqueRenderables and  GM:PreDrawTranslucentRenderables.
---
---
---
--- This is still called when r_drawentities or r_drawopaquerenderables is disabled.
--- This is not called when r_drawtranslucentworld is disabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDrawTranslucentRenderables)
---@param bDrawingDepth boolean Whether the current call is writing depth.
---@param bDrawingSkybox boolean Whether the current draw is drawing the 3D or 2D skybox.
---
--- In case of 2D skyboxes it is possible for this hook to always be called with this parameter set to `true`.
---@param isDraw3DSkybox boolean Whether the current draw is drawing the 3D.
function GM:PostDrawTranslucentRenderables(bDrawingDepth, bDrawingSkybox, isDraw3DSkybox) end

---[CLIENT] Called after view model is drawn.
---
---
---
--- The 3D rendering context in this event is different from the main view. Every render operation will only be accurate with the view model entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostDrawViewModel)
---@param viewmodel Entity Players view model
---@param player Player The owner of the weapon/view model
---@param weapon Weapon The weapon the player is currently holding
function GM:PostDrawViewModel(viewmodel, player, weapon) end

---[SHARED] Called every time a bullet pellet is fired from an entity.
---
--- This hook is called directly from Entity:FireBullets. Due to this, you cannot call Entity:FireBullets inside this hook or an infinite loop will occur crashing the game.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostEntityFireBullets)
---@param entity Entity The entity that fired the bullet
---@param data table The bullet data. Contains the following keys:
--- * table **Trace** - The bullet pellet trace result. See Structures/TraceResult
---
--- From Structures/Bullet:
--- * `AmmoType`, `Tracer`, `Damage`, `Force`, `Attacker`, `TracerName`.
---
---@return boolean # Return `false` to suppress the bullet.
function GM:PostEntityFireBullets(entity, data) end

---[SERVER] Called when an entity receives a damage event, after passing damage filters, etc.
---
--- Applying damage from this hook to the entity taking damage will lead to infinite loop/crash.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostEntityTakeDamage)
---@param ent Entity The entity that took the damage.
---@param dmg CTakeDamageInfo
---@param took boolean Whether the entity actually took the damage. (For example, shooting a Strider will generate this event, but it won't take bullet damage).
function GM:PostEntityTakeDamage(ent, dmg, took) end

---[SHARED] Called after the gamemode has loaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostGamemodeLoaded)
function GM:PostGamemodeLoaded() end

---[SERVER] Called right after GM:DoPlayerDeath, GM:PlayerDeath and GM:PlayerSilentDeath.
---
--- This hook will be called for all deaths, including Player:KillSilent
---
--- Player:Alive will return false in this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostPlayerDeath)
---@param ply Player The player
function GM:PostPlayerDeath(ply) end

---[CLIENT] Called after a player in your [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") was drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostPlayerDraw)
---@param ply Player The player that was drawn.
---@param flags number The Enums/STUDIO flags for this render operation.
function GM:PostPlayerDraw(ply, flags) end

---[CLIENT] Allows you to suppress post processing effect drawing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostProcessPermitted)
---@param ppeffect string The classname of Post Processing effect
---@return boolean # Return true/false depending on whether this post process should be allowed
function GM:PostProcessPermitted(ppeffect) end

---[CLIENT] Called after the frame has been rendered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostRender)
function GM:PostRender() end

---[CLIENT] Called after the VGUI has been drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostRenderVGUI)
function GM:PostRenderVGUI() end

---[SERVER] Called just after performing an undo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PostUndo)
---@param undo table The undo table. See Structures/Undo struct.
---@param count number The amount of props/actions undone. This will be `0` for undos that are skipped in cases where for example the entity that is meant to be undone is already deleted.
function GM:PostUndo(undo, count) end

---[SHARED] Called right before the map cleans up (usually because game.CleanUpMap was called)
---
--- See also GM:PostCleanupMap.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreCleanupMap)
function GM:PreCleanupMap() end

---[CLIENT] Called just after GM:PreDrawViewModel and can technically be considered "PostDrawAllViewModels".
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawEffects)
function GM:PreDrawEffects() end

---[CLIENT] Called before rendering the halos. This is the place to call halo.Add. This hook is actually running inside of GM:PostDrawEffects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawHalos)
function GM:PreDrawHalos() end

---[CLIENT] Called just after GM:PostDrawEffects. Drawing anything in it seems to work incorrectly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawHUD)
function GM:PreDrawHUD() end

---[CLIENT] Called before all opaque entities are drawn.
---
--- See also GM:PreDrawTranslucentRenderables and  GM:PostDrawOpaqueRenderables.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawOpaqueRenderables)
---@param isDrawingDepth boolean Whether the current draw is writing depth.
---@param isDrawSkybox boolean Whether the current draw is drawing the 3D or 2D skybox.
---
--- In case of 2D skyboxes it is possible for this hook to always be called with this parameter set to `true`.
---@param isDraw3DSkybox boolean Whether the current draw is drawing the 3D.
---@return boolean # Return true to prevent opaque renderables from drawing.
function GM:PreDrawOpaqueRenderables(isDrawingDepth, isDrawSkybox, isDraw3DSkybox) end

---[CLIENT] Called before the player hands are drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawPlayerHands)
---@param hands Entity This is the gmod_hands entity before it is drawn.
---@param vm Entity This is the view model entity before it is drawn.
---@param ply Player The the owner of the view model.
---@param weapon Weapon This is the weapon that is from the view model.
---@return boolean # Return true to prevent the viewmodel hands from rendering
function GM:PreDrawPlayerHands(hands, vm, ply, weapon) end

---[CLIENT] Called before the 3D sky box is drawn. This will not be called for maps with no 3D skybox, or when the 3d skybox is disabled. (`r_3dsky 0`)
---
--- See also GM:PostDrawSkyBox
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawSkyBox)
---@return boolean # Return true to disable skybox drawing (both 2D and 3D skybox)
function GM:PreDrawSkyBox() end

---[CLIENT] Called before all the translucent entities are drawn.
---
--- See also GM:PreDrawOpaqueRenderables and  GM:PostDrawTranslucentRenderables.
---
---
---
--- This is still called when r_drawentities or r_drawopaquerenderables is disabled.
--- This is not called when r_drawtranslucentworld is disabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawTranslucentRenderables)
---@param isDrawingDepth boolean Whether the current draw is writing depth.
---@param isDrawSkybox boolean Whether the current draw is drawing the 3D or 2D skybox.
---
--- In case of 2D skyboxes it is possible for this hook to always be called with this parameter set to `true`.
---@param isDraw3DSkybox boolean Whether the current draw is drawing the 3D.
---@return boolean # Return true to prevent translucent renderables from drawing.
function GM:PreDrawTranslucentRenderables(isDrawingDepth, isDrawSkybox, isDraw3DSkybox) end

---[CLIENT] Called before the view model has been drawn. This hook by default also calls this on weapons, so you can use WEAPON:PreDrawViewModel.
---
--- You can use GM:PreDrawEffects as a "PostDrawViewModel" hook as it is called just after the view model(s) are drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawViewModel)
---@param vm Entity This is the view model entity before it is drawn. On server-side, this entity is the predicted view model.
---@param ply Player The owner of the view model.
---@param weapon Weapon This is the weapon that is from the view model.
---@return boolean # Return true to prevent the default view model rendering. This also affects GM:PostDrawViewModel.
function GM:PreDrawViewModel(vm, ply, weapon) end

---[CLIENT] Called before view models and entities with `RENDERGROUP_VIEWMODEL` are drawn.
---
--- You can use GM:PreDrawEffects as a `PostDrawViewModel` hook as it is called just after the view model(s) are drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreDrawViewModels)
function GM:PreDrawViewModels() end

---[SHARED] Called before the gamemode is loaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreGamemodeLoaded)
function GM:PreGamemodeLoaded() end

---[CLIENT] Called before the player is drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PrePlayerDraw)
---@param player Player The player that is about to be drawn.
---@param flags number The Enums/STUDIO flags for this render operation.
---@return boolean # Prevent default player rendering. Return `true` to hide the player.
function GM:PrePlayerDraw(player, flags) end

---[SHARED] Called by scripted_ents.Register.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreRegisterSENT)
---@param ent table The entity table to be registered.
---@param class string The class name to be assigned.
---@return boolean # Return `false` to prevent the entity from being registered. Returning any other value has no effect.
function GM:PreRegisterSENT(ent, class) end

---[SHARED] Called when a Scripted Weapon (SWEP) is about to be registered, allowing addons to alter the weapon's SWEP table with custom data for later usage. Called internally from weapons.Register.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreRegisterSWEP)
---@param swep table The SWEP table to be registered.
---@param class string The class name to be assigned.
---@return boolean # Return `false` to prevent the weapon from being registered. Returning any other value has no effect.
function GM:PreRegisterSWEP(swep, class) end

---[CLIENT] Called before the renderer is about to start rendering the next frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreRender)
---@return boolean # Return true to prevent all rendering. This can make the whole game stop rendering anything.
function GM:PreRender() end

---[SERVER] Called just before performing an undo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreUndo)
---@param undo table The undo table. See Structures/Undo struct.
function GM:PreUndo(undo) end

---[CLIENT] This will prevent IN_ATTACK from sending to server when player tries to shoot from C menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PreventScreenClicks)
---@return boolean # Return true to prevent screen clicks.
function GM:PreventScreenClicks() end

---[SHARED] Called when a prop has been destroyed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PropBreak)
---@param attacker Player The person who broke the prop. This can be a NULL entity for cases where the prop was not broken by a player.
---@param prop Entity The entity that has been broken by the attacker.
function GM:PropBreak(attacker, prop) end

---[CLIENT] Render the scene. Used by the `Stereoscopy` post-processing effect.
---
--- Materials rendered in this hook require `$ignorez` parameter to draw properly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:RenderScene)
---@param origin Vector View origin
---@param angles Angle View angles
---@param fov number View FOV
---@return boolean # Return `true` to override drawing the scene.
function GM:RenderScene(origin, angles, fov) end

---[CLIENT] Used to render post processing effects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:RenderScreenspaceEffects)
function GM:RenderScreenspaceEffects() end

---[SHARED] Called when the game is reloaded from a Source Engine save system ( not the Sandbox saves or dupes ).
---
--- See GM:Saved for a hook that is called when such a save file is created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:Restored)
function GM:Restored() end

---[SHARED] Called when the game is saved using the Source Engine save system (not the Sandbox saves or dupes).
---
--- See GM:Restored for a hook that is called when such a save file is loaded.
---
--- See also the saverestore for relevant functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:Saved)
function GM:Saved() end

---[SERVER] Called when an NPC takes damage.
---
--- This hook is called only when a specific hit group of the NPC is hit. In cases where the hitgroup doesn't matter, you should use GM:EntityTakeDamage instead!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ScaleNPCDamage)
---@param npc NPC The NPC that takes damage
---@param hitgroup number The hitgroup (hitbox) enum where the NPC took damage. See Enums/HITGROUP
---@param dmginfo CTakeDamageInfo Damage info
function GM:ScaleNPCDamage(npc, hitgroup, dmginfo) end

---[SHARED] This hook allows you to change how much damage a player receives when one takes damage to a specific body part.
---
--- This is called only for bullet damage a player receives, you should use GM:EntityTakeDamage instead if you need to detect **ALL** damage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ScalePlayerDamage)
---@param ply Player The player taking damage.
---@param hitgroup number The hitgroup where the player took damage. See Enums/HITGROUP
---@param dmginfo CTakeDamageInfo The damage info.
---@return boolean # Return true to prevent damage that this hook is called for, stop blood particle effects and blood decals.  It is possible to return true only on client ( This will work **only in multiplayer** ) to stop the effects but still take damage.
function GM:ScalePlayerDamage(ply, hitgroup, dmginfo) end

---[CLIENT] Called when player released the scoreboard button (TAB by default).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ScoreboardHide)
function GM:ScoreboardHide() end

---[CLIENT] Called when player presses the scoreboard button (TAB by default).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ScoreboardShow)
---@return boolean # Return true to prevent default scoreboard from showing.
function GM:ScoreboardShow() end

---[SERVER] An internal function used to send a death notice event to all clients.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SendDeathNotice)
---@param attacker Entity The entity that caused the death.
---@param inflictor Entity The attacker's weapon or the attacker itself if no weapon was equipped.
---@param victim Entity The entity that died.
---@param flags number Death notice flags. 1 = Friendly victim (to the player), 2 = friendly attacker (to the player)
function GM:SendDeathNotice(attacker, inflictor, victim, flags) end

---[SHARED] Sets player run and sprint speeds.
---
--- This is not a hook. Treat this as a utility function to set the player's speed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SetPlayerSpeed)
---@param ply Player The player to set the speed of.
---@param walkSpeed number The walk speed.
---@param runSpeed number The run speed.
function GM:SetPlayerSpeed(ply, walkSpeed, runSpeed) end

---[SHARED] SetupMove is called before the engine process movements. This allows us to override the players movement.
---
--- See Game Movement for an explanation on the move system.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SetupMove)
---@param ply Player The player whose movement we are about to process
---@param mv CMoveData The move data to override/use
---@param cmd CUserCmd The command data
function GM:SetupMove(ply, mv, cmd) end

---[SERVER] Allows you to add extra positions to the player's [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community"). This is the place to call Global.AddOriginToPVS.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SetupPlayerVisibility)
---@param ply Player The player
---@param viewEntity Entity Players Player:GetViewEntity
function GM:SetupPlayerVisibility(ply, viewEntity) end

---[CLIENT] Allows you to use render.Fog* functions to manipulate skybox fog.
--- 		This will not be called for maps with no 3D skybox, or when the 3d skybox is disabled. (`r_3dsky 0`)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SetupSkyboxFog)
---@param scale number The scale of 3D skybox
---@return boolean # Return true to tell the engine that fog is set up
function GM:SetupSkyboxFog(scale) end

---[CLIENT] Allows you to use render.Fog* functions to manipulate world fog.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SetupWorldFog)
---@return boolean # Return true to tell the engine that fog is set up
function GM:SetupWorldFog() end

---[SHARED] Called to decide whether a pair of entities should collide with each other. This is only called if Entity:SetCustomCollisionCheck was used on one or both entities.
---
--- Where applicable, consider using constraint.NoCollide or a [logic_collision_pair](https://developer.valvesoftware.com/wiki/Logic_collision_pair) entity instead - they are considerably easier to use and may be more appropriate in some situations.
---
--- This hook **must** return the same value consistently for the same pair of entities. If an entity changed in such a way that its collision rules change, you **must** call Entity:CollisionRulesChanged on that entity immediately - **not in this hook and not in physics callbacks.**
---
--- The default Entity:CollisionRulesChanged has been found to be ineffective in preventing issues in this hook, a more reliable alternative can be found in the examples below. As long as you religiously follow the rules set by the examples this hook will work reliably without breaking, even a small mistake will break physics.
---
--- This hook can cause all physics to break under certain conditions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ShouldCollide)
---@param ent1 Entity The first entity in the collision poll.
---@param ent2 Entity The second entity in the collision poll.
---@return boolean # Whether the entities should collide.
function GM:ShouldCollide(ent1, ent2) end

---[CLIENT] Called to determine if the Global.LocalPlayer should be drawn.
---
--- If you're using this hook to draw a player for a GM:CalcView hook, then you may want to consider using the `drawviewer` variable you can use in your Structures/CamData table instead.
---
---
--- This hook has an internal cache that is reset at the start of every frame. This will prevent this hook from running in certain cases. This cache is reset in cam.Start and in a future update in render.RenderView when rendering extra views.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ShouldDrawLocalPlayer)
---@param ply Player The player.
---@return boolean # `true` to draw the player, `false` to hide.
function GM:ShouldDrawLocalPlayer(ply) end

---[SERVER] Called when a player executes `gm_showhelp` console command. (Default bind is F1)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ShowHelp)
---@param ply Player Player who executed the command
function GM:ShowHelp(ply) end

---[SHARED] Called when a player executes `gm_showspare1` console command ( Default bind is F3 ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ShowSpare1)
---@param ply Player Player who executed the command (or `nil` client-side).
function GM:ShowSpare1(ply) end

---[SHARED] Called when a player executes `gm_showspare2` console command ( Default bind is F4 ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ShowSpare2)
---@param ply Player Player who executed the command (or `nil` client-side).
function GM:ShowSpare2(ply) end

---[SERVER] Called when a player executes `gm_showteam` console command. ( Default bind is F2 )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ShowTeam)
---@param ply Player Player who executed the command
function GM:ShowTeam(ply) end

---[SHARED] Called whenever the Lua environment is about to be shut down, for example on map change, or when the server is going to shut down.
--- Player:SteamID, Player:SteamID64, and the like will return nil for the listen host here but work fine for other players.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:ShutDown)
function GM:ShutDown() end

---[CLIENT] Called when spawn icon is generated.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SpawniconGenerated)
---@param lastmodel string File path of previously generated model.
---@param imagename string File path of the generated icon.
---@param modelsleft number Amount of models left to generate.
function GM:SpawniconGenerated(lastmodel, imagename, modelsleft) end

---[CLIENT] Called when the Spawnmenu is Created.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:SpawnMenuCreated)
function GM:SpawnMenuCreated() end

---[CLIENT] Runs when the user tries to open the chat box.
---
--- Returning true won't stop the chatbox from taking VGUI focus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:StartChat)
---@param isTeamChat boolean Whether the message was sent through team chat.
---@return boolean # Return true to hide the default chat box.
function GM:StartChat(isTeamChat) end

---[SHARED] Allows you to change the players inputs before they are processed by the server. This function is also called for bots, making it the best solution to control them.
---
--- This is basically a shared version of GM:CreateMove.
---
---
--- This hook is predicted, but not by usual means, it is called when a CUserCmd is generated on the client, and on the server when it is received, so it is necessary for this hook to be called clientside even on singleplayer
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:StartCommand)
---@param ply Player The player
---@param ucmd CUserCmd The usercommand
function GM:StartCommand(ply, ucmd) end

---[SHARED] Called right before an entity starts driving. Overriding this hook will cause it to not call drive.Start and the player will not begin driving the entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:StartEntityDriving)
---@param ent Entity The entity that is going to be driven
---@param ply Player The player that is going to drive the entity
function GM:StartEntityDriving(ent, ply) end

---[MENU] Called when you start a new game via the menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:StartGame)
function GM:StartGame() end

---[SHARED AND MENU] Called every frame. This will be the same as GM:Tick on the server when there is no lag, but will only be called once every processed server frame during lag.
---
--- See GM:Tick for a hook that runs every tick on both the client and server.
---
--- On server, this hook **WILL NOT** run if the server is empty, unless you set the ConVar `sv_hibernate_think` to `1`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:Think)
function GM:Think() end

---[SHARED] Called every server tick. Serverside, this is similar to GM:Think.
---
--- This hook **WILL NOT** run if the server is empty, unless you set the ConVar `sv_hibernate_think` to 1
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:Tick)
function GM:Tick() end

---[SHARED] Isn't call when CalcMainActivity return a valid override sequence id
--- 		Allows you to translate player activities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:TranslateActivity)
---@param ply Player The player
---@param act number The activity. See Enums/ACT
---@return number # The new, translated activity
function GM:TranslateActivity(ply, act) end

---[SHARED] Animation updates (pose params etc) should be done here.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:UpdateAnimation)
---@param ply Player The player to update the animation info for.
---@param velocity Vector The player's velocity.
---@param maxSeqGroundSpeed number Speed of the animation - used for playback rate scaling.
function GM:UpdateAnimation(ply, velocity, maxSeqGroundSpeed) end

---[SERVER] Called when a variable is edited on an Entity (called by Edit Properties... menu). See Editable Entities for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:VariableEdited)
---@param ent Entity The entity being edited
---@param ply Player The player doing the editing
---@param key string The name of the variable
---@param val string The new value, as a string which will later be converted to its appropriate type
---@param editor table The edit table defined in Entity:NetworkVar
function GM:VariableEdited(ent, ply, key, val, editor) end

---[SHARED] Called when you are driving a vehicle. This hook works just like GM:Move.
---
--- This hook is called before GM:Move and will be called when GM:PlayerTick is not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:VehicleMove)
---@param ply Player Player who is driving the vehicle
---@param veh Vehicle The vehicle being driven
---@param mv CMoveData Move data
function GM:VehicleMove(ply, veh, mv) end

---[CLIENT] Called when user clicks on a VGUI panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:VGUIMousePressAllowed)
---@param button number The button that was pressed, see Enums/MOUSE
---@return boolean # Return true if the mouse click should be ignored or not.
function GM:VGUIMousePressAllowed(button) end

---[CLIENT] Called when a mouse button is pressed on a VGUI element or menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:VGUIMousePressed)
---@param pnl Panel Panel that currently has focus.
---@param mouseCode number The key that the player pressed using Enums/MOUSE.
function GM:VGUIMousePressed(pnl, mouseCode) end

---[SERVER] Called as a weapon entity is picked up by a player.
---
--- See also GM:PlayerDroppedWeapon.
---
--- At the time when this hook is called Entity:GetOwner will return `NULL`. The owner is set on the next frame.
--- This will not be called when picking up a weapon you already have as the weapon will be removed and WEAPON:EquipAmmo will be called instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WeaponEquip)
---@param weapon Weapon The equipped weapon.
---@param owner Player The player that is picking up the weapon.
function GM:WeaponEquip(weapon, owner) end

---[MENU] Called when an addon from the Steam workshop finishes downloading. Used by default to update details on the workshop downloading panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopDownloadedFile)
---@param id number Workshop ID of addon.
---@param title string Name of addon.
function GM:WorkshopDownloadedFile(id, title) end

---[MENU] Called when an addon from the Steam workshop begins downloading. Used by default to place details on the workshop downloading panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopDownloadFile)
---@param id number Workshop ID of addon.
---@param imageID number ID of addon's preview image.
---
---
---
--- For example, for **Extended Spawnmenu** addon, the image URL is
---
--- ```
--- http://cloud-4.steamusercontent.com/ugc/702859018846106764/9E7E1946296240314751192DA0AD15B6567FF92D/
--- ```
---
--- So, the value of this argument would be **702859018846106764**.
---@param title string Name of addon.
---@param size number File size of addon in bytes.
function GM:WorkshopDownloadFile(id, imageID, title, size) end

---[MENU] Called while an addon from the Steam workshop is downloading. Used by default to update details on the fancy workshop download panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopDownloadProgress)
---@param id number Workshop ID of addon.
---@param imageID number ID of addon's preview image.
---
---
---
--- For example, for **Extended Spawnmenu** addon, the image URL is
---
--- ```
--- http://cloud-4.steamusercontent.com/ugc/702859018846106764/9E7E1946296240314751192DA0AD15B6567FF92D/
--- ```
---
--- So, the value of this argument would be **702859018846106764**.
---@param title string Name of addon.
---@param downloaded number Current bytes of addon downloaded.
---@param expected number Expected file size of addon in bytes.
function GM:WorkshopDownloadProgress(id, imageID, title, downloaded, expected) end

---[MENU] Called after GM:WorkshopStart.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopDownloadTotals)
---@param remain number Remaining addons to download
---@param total number Total addons needing to be downloaded
function GM:WorkshopDownloadTotals(remain, total) end

---[MENU] Called when downloading content from Steam workshop ends. Used by default to hide fancy workshop downloading panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopEnd)
function GM:WorkshopEnd() end

---[MENU] Called while an addon from the Steam workshop is extracting. Used by default to update details on the fancy workshop download panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopExtractProgress)
---@param id number Workshop ID of addon.
---@param ImageID number ID of addon's preview image.
---
---
---
--- For example, for **Extended Spawnmenu** addon, the image URL is
---
--- ```
--- http://cloud-4.steamusercontent.com/ugc/702859018846106764/9E7E1946296240314751192DA0AD15B6567FF92D/
--- ```
---
--- So, the value of this argument would be **702859018846106764**.
---@param title string Name of addon.
---@param percent number Current bytes of addon extracted.
function GM:WorkshopExtractProgress(id, ImageID, title, percent) end

---[MENU] Called when downloading content from Steam workshop begins. Used by default to show fancy workshop downloading panel.
---
--- The order of Workshop hooks is this:
--- * WorkshopStart
--- * WorkshopDownloadTotals
--- * * These are called for each new item:
--- * WorkshopDownloadFile
--- * WorkshopDownloadProgress - This is called until the file is finished
--- * WorkshopDownloadedFile
--- * WorkshopEnd (this ones called once)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopStart)
function GM:WorkshopStart() end

---[MENU] Called when UGC subscription status changes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopSubscriptionsChanged)
function GM:WorkshopSubscriptionsChanged() end

---[MENU] Called when a Workshop Message is received?. Currently, it seems like the message will be **#ugc.mounting** every time.
--- 		When does this exactly get called?. If an addon is subscribed, unsubscribed, error occurs or on any event?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopSubscriptionsMessage)
---@param message string The Message from the Workshop. Will be a phrase that needs to be translated.
function GM:WorkshopSubscriptionsMessage(message) end

---[MENU] Called by the engine when the game initially fetches subscriptions to be displayed on the bottom of the main menu screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:WorkshopSubscriptionsProgress)
---@param num number Amount of subscribed addons that have info retrieved.
---@param max number Total amount of subscribed addons that need their info retrieved.
function GM:WorkshopSubscriptionsProgress(num, max) end
