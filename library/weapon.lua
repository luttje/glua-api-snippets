---@meta

--- This is a list of all methods only available for weapons. It is also possible to call Entity functions on weapons.
---
--- A list of available methods has been expanded in your navigation bar.
---@class Weapon : Entity
local Weapon = {}

---
--- Default weapon methods, that are available for use in SWEPs. These hooks **will not work** on non-scripted weapons, such as the Half-Life 2 weapons.
---
--- You can find all available SWEP fields here: Structures/SWEP
---
---@class WEAPON : Weapon
WEAPON = {}

---[SERVER] Called when another entity fires an event to this entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:AcceptInput)
---@param inputName string The name of the input that was triggered.
---@param activator Entity The initial cause for the input getting triggered.
---@param called Entity The entity that directly trigger the input.
---@param data string The data passed.
---@return boolean # Should we suppress the default action for this input?
function WEAPON:AcceptInput(inputName, activator, called, data) end

---[CLIENT] Allows you to adjust the mouse sensitivity. This hook only works if you haven't overridden GM:AdjustMouseSensitivity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:AdjustMouseSensitivity)
---@return number # Sensitivity scale
function WEAPON:AdjustMouseSensitivity() end

---[SHARED] Returns whether the weapon allows to being switched from when a better ( Weapon:GetWeight ) weapon is being picked up.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:AllowsAutoSwitchFrom)
---@return boolean # Whether the weapon allows to being switched from.
function Weapon:AllowsAutoSwitchFrom() end

---[SHARED] Returns whether the weapon allows to being switched to when a better ( Weapon:GetWeight ) weapon is being picked up.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:AllowsAutoSwitchTo)
---@return boolean # Whether the weapon allows to being switched to.
function Weapon:AllowsAutoSwitchTo() end

---[SHARED] Returns how much of primary ammo the player has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Ammo1)
---@return number # The amount of primary ammo player has
function WEAPON:Ammo1() end

---[SHARED] Returns how much of secondary ammo the player has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Ammo2)
---@return number # The amount of secondary ammo player has
function WEAPON:Ammo2() end

---[CLIENT] Allows you to adjust player view while this weapon in use.
---
--- This hook is called from the default implementation of GM:CalcView which is [here](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/base/gamemode/cl_init.lua#L387-L395). Therefore, it will not be called if any other hook added to `CalcView` returns any value, or if the current gamemode overrides the default hook and does not call the SWEP function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:CalcView)
---@param ply Player The owner of weapon
---@param pos Vector Current position of players view
---@param ang Angle Current angles of players view
---@param fov number Current FOV of players view
---@return Vector # New position of players view
---@return Angle # New angle of players view
---@return number # New FOV of players view
function WEAPON:CalcView(ply, pos, ang, fov) end

---[CLIENT] Allows overriding the position and angle of the viewmodel. This hook only works if you haven't overridden GM:CalcViewModelView.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:CalcViewModelView)
---@param ViewModel Entity The viewmodel entity
---@param OldEyePos Vector Original position (before viewmodel bobbing and swaying)
---@param OldEyeAng Angle Original angle (before viewmodel bobbing and swaying)
---@param EyePos Vector Current position
---@param EyeAng Angle Current angle
---@return Vector # New position
---@return Angle # New angle
function WEAPON:CalcViewModelView(ViewModel, OldEyePos, OldEyeAng, EyePos, EyeAng) end

---[SHARED] Calls a SWEP function on client.
---
--- This uses the usermessage internally, because of that, the combined length of the arguments of this function may not exceed 254 bytes/characters or the function will cease to function!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:CallOnClient)
---@param functionName string Name of function to call. If you want to call SWEP:MyFunc() on client, you type in "MyFunc"
---@param arguments? string Arguments for the function, separated by spaces.
--- Only the second argument is passed as argument and must be a string
function Weapon:CallOnClient(functionName, arguments) end

---[SERVER] Called when a Citizen NPC is looking around to a (better) weapon to pickup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:CanBePickedUpByNPCs)
---@return boolean # Return true to allow this weapon to be picked up by NPCs.
function WEAPON:CanBePickedUpByNPCs() end

---[SHARED] Helper function for checking for no ammo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:CanPrimaryAttack)
---@return boolean # Can use primary attack
function WEAPON:CanPrimaryAttack() end

---[SHARED] Helper function for checking for no ammo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:CanSecondaryAttack)
---@return boolean # Can use secondary attack
function WEAPON:CanSecondaryAttack() end

---[SHARED] Returns how much primary ammo is in the magazine.
--- 	This is not shared between clients and will instead return the maximum primary clip size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:Clip1)
---@return number # The amount of primary ammo in the magazine.
function Weapon:Clip1() end

---[SHARED] Returns how much secondary ammo is in the magazine.
--- 	This is not shared between clients and will instead return the maximum secondary clip size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:Clip2)
---@return number # The amount of secondary ammo in the magazine.
function Weapon:Clip2() end

---[CLIENT] Allows you to use any numbers you want for the ammo display on the HUD.
---
--- Can be useful for weapons that don't use standard ammo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:CustomAmmoDisplay)
---@return table # The new ammo display settings. A table with 4 possible keys: * boolean Draw - Whether to draw the ammo display or not * number PrimaryClip - Amount of primary ammo in the clip * number PrimaryAmmo - Amount of primary ammo in the reserves * number SecondaryAmmo - Amount of secondary ammo. It is shown like alt-fire for SMG1 and AR2 are shown.  There is **no** SecondaryClip!
function WEAPON:CustomAmmoDisplay() end

---[SHARED] Forces the weapon to reload while playing given animation.
---
--- 		This will stop the Weapon:Think function from getting called while the weapon is reloading!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:DefaultReload)
---@param act number Sequence to use as reload animation. Uses the Enums/ACT.
---@return boolean # Did reloading actually take place
function Weapon:DefaultReload(act) end

---[SHARED] Called when player has just switched to this weapon.
---
--- Due to this hook being predicted, it is not called clientside in singleplayer at all, and in multiplayer it will not be called clientside if the weapon is switched with Player:SelectWeapon or the "use" console command, however it will be called clientside with the default weapon selection menu and when using CUserCmd:SelectWeapon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Deploy)
---@return boolean # Return true to allow switching away from this weapon using `lastinv` command
function WEAPON:Deploy() end

---[CLIENT] Called when the crosshair is about to get drawn, and allows you to override it.
---
--- This function will **not** be called if `SWEP.DrawCrosshair` is set to false or if player is affected by Player:CrosshairDisable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:DoDrawCrosshair)
---@param x number X coordinate of the crosshair.
---@param y number Y coordinate of the crosshair.
---@return boolean # Return true to override the default crosshair.
function WEAPON:DoDrawCrosshair(x, y) end

---[SHARED] Called so the weapon can override the impact effects it makes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:DoImpactEffect)
---@param tr table A Structures/TraceResult from player's eyes to the impact point
---@param damageType number The damage type of bullet. See Enums/DMG
---@return boolean # Return true to not do the default thing - which is to call `UTIL_ImpactTrace` in C++
function WEAPON:DoImpactEffect(tr, damageType) end

---[CLIENT] This hook allows you to draw on screen while this weapon is in use.
---
--- If you want to draw a custom crosshair, consider using WEAPON:DoDrawCrosshair instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:DrawHUD)
function WEAPON:DrawHUD() end

---[CLIENT] This hook allows you to draw on screen while this weapon is in use. This hook is called **before** WEAPON:DrawHUD and is equivalent of GM:HUDPaintBackground.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:DrawHUDBackground)
function WEAPON:DrawHUDBackground() end

---[CLIENT] This hook draws the selection icon in the weapon selection menu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:DrawWeaponSelection)
---@param x number X coordinate of the selection panel
---@param y number Y coordinate of the selection panel
---@param width number Width of the selection panel
---@param height number Height of the selection panel
---@param alpha number Alpha value of the selection panel
function WEAPON:DrawWeaponSelection(x, y, width, height, alpha) end

---[CLIENT] Called when we are about to draw the world model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:DrawWorldModel)
---@param flags number The Enums/STUDIO flags for this render operation.
function WEAPON:DrawWorldModel(flags) end

---[CLIENT] Called when we are about to draw the translucent world model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:DrawWorldModelTranslucent)
---@param flags number The Enums/STUDIO flags for this render operation.
function WEAPON:DrawWorldModelTranslucent(flags) end

---[SERVER] Called when a player or NPC has picked the weapon up.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Equip)
---@param NewOwner Entity The one who picked the weapon up. Can be Player or NPC.
function WEAPON:Equip(NewOwner) end

---[SERVER] The player has picked up the weapon and has taken the ammo from it.
--- The weapon will be removed immidiately after this call.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:EquipAmmo)
---@param ply Player The player who picked up the weapon
function WEAPON:EquipAmmo(ply) end

---[SHARED] Called before firing animation events, such as muzzle flashes or shell ejections.
---
--- This will only be called serverside for 3000-range events, and clientside for 5000-range  and other events.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:FireAnimationEvent)
---@param pos Vector Position of the effect.
---@param ang Angle Angle of the effect.
---@param event number The event ID of happened even. See [this page](http://developer.valvesoftware.com/wiki/Animation_Events).
---@param options string Name or options of the event.
---@param source Entity The source entity. This will be a viewmodel on the client and the weapon itself on the server
---@return boolean # Return true to disable the effect.
function WEAPON:FireAnimationEvent(pos, ang, event, options, source) end

---[CLIENT] This hook allows you to freeze players screen.
--- Player will still be able to move or shoot
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:FreezeMovement)
---@return boolean # Return true to freeze moving the view
function WEAPON:FreezeMovement() end

---[SHARED] Returns the sequence enumeration number that the weapon is playing.
---
--- This can return inconsistent results between the server and client.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetActivity)
---@return number # Current activity, see Enums/ACT. Returns 0 if the weapon doesn't have active sequence.
function Weapon:GetActivity() end

---[SERVER] This hook is for NPCs, you return what they should try to do with it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:GetCapabilities)
---@return number # A number defining what NPC should do with the weapon. Use the Enums/CAP.
function WEAPON:GetCapabilities() end

---[SHARED] Returns the weapon deploy speed, as set by Weapon:SetDeploySpeed. If not previously set, the value will be polled from the `sv_defaultdeployspeed` ConVar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetDeploySpeed)
---@return number # The value to set deploy speed to.
function Weapon:GetDeploySpeed() end

---[SHARED] Returns the hold type of the weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetHoldType)
---@return string # The hold type of the weapon. You can find a list of default hold types Hold_Types.
function Weapon:GetHoldType() end

---[SHARED] Returns maximum primary clip size
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetMaxClip1)
---@return number # Maximum primary clip size
function Weapon:GetMaxClip1() end

---[SHARED] Returns maximum secondary clip size
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetMaxClip2)
---@return number # Maximum secondary clip size
function Weapon:GetMaxClip2() end

---[SHARED] Gets the next time the weapon can primary fire. ( Can call WEAPON:PrimaryAttack )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetNextPrimaryFire)
---@return number # The time, relative to Global.CurTime
function Weapon:GetNextPrimaryFire() end

---[SHARED] Gets the next time the weapon can secondary fire. ( Can call WEAPON:SecondaryAttack )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetNextSecondaryFire)
---@return number # The time, relative to Global.CurTime
function Weapon:GetNextSecondaryFire() end

---[SERVER] Called when the weapon is used by NPCs to determine how accurate the bullets fired should be.
---
--- The inaccuracy is simulated by changing the NPC:GetAimVector based on the value returned from this hook.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:GetNPCBulletSpread)
---@param proficiency number How proficient the NPC is with this gun. See Enums/WEAPON_PROFICIENCY
---@return number # An amount of degrees the bullets should deviate from the NPC's NPC:GetAimVector. Default is 15.
function WEAPON:GetNPCBulletSpread(proficiency) end

---[SERVER] Called when the weapon is used by NPCs to tell the NPC how to use this weapon. Controls how long the NPC can or should shoot continuously.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:GetNPCBurstSettings)
---@return number # Minimum amount of bullets per burst. Default is 1.
---@return number # Maximum amount of bullets per burst. Default is 1.
---@return number # Delay between each shot, aka firerate. Default is 1.
function WEAPON:GetNPCBurstSettings() end

---[SERVER] Called when the weapon is used by NPCs to tell the NPC how to use this weapon. Controls amount of time the NPC can rest (not shoot) between bursts.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:GetNPCRestTimes)
---@return number # Minimum amount of time the NPC can rest (not shoot) between bursts in seconds. Default is `0.3` seconds.
---@return number # Maximum amount of time the NPC can rest (not shoot) between bursts in seconds. Default is `0.66` seconds.
function WEAPON:GetNPCRestTimes() end

---[SHARED] Gets the primary ammo type of the given weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetPrimaryAmmoType)
---@return number # The ammo type ID, or -1 if not found.
function Weapon:GetPrimaryAmmoType() end

---[SHARED] Returns the non-internal name of the weapon, that should be for displaying.
---
--- If that returns an untranslated message (#HL2_XX), use language.GetPhrase to see the "nice" name.
--- If SWEP.PrintName is not set in the Weapon or the Weapon Base then "<MISSING SWEP PRINT NAME>" will be returned.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetPrintName)
---@return string # The "nice" name of the weapon.
function Weapon:GetPrintName() end

---[SHARED] Gets the ammo type of the given weapons secondary fire.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetSecondaryAmmoType)
---@return number # The secondary ammo type ID, or -1 if not found.
function Weapon:GetSecondaryAmmoType() end

---[SHARED] Returns the slot of the weapon.
--- 	The slot numbers start from 0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetSlot)
---@return number # The slot of the weapon.
function Weapon:GetSlot() end

---[SHARED] Returns slot position of the weapon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetSlotPos)
---@return number # The slot position of the weapon
function Weapon:GetSlotPos() end

---[CLIENT] Allows you to override where the tracer effect comes from. ( Visual bullets )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:GetTracerOrigin)
---@return Vector # The new position to start tracer effect from
function WEAPON:GetTracerOrigin() end

---[CLIENT] This hook allows you to adjust view model position and angles.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:GetViewModelPosition)
---@param EyePos Vector Current position
---@param EyeAng Angle Current angle
---@return Vector # New position
---@return Angle # New angle
function WEAPON:GetViewModelPosition(EyePos, EyeAng) end

---[SHARED] Returns the view model of the weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetWeaponViewModel)
---@return string # The view model of the weapon.
function Weapon:GetWeaponViewModel() end

---[SHARED] Returns the world model of the weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetWeaponWorldModel)
---@return string # The world model of the weapon.
function Weapon:GetWeaponWorldModel() end

---[SHARED] Returns the "weight" of the weapon, which is used when deciding which Weapon is better by the engine.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:GetWeight)
---@return number # The weapon "weight".
function Weapon:GetWeight() end

---[SHARED] Returns whether the weapon has ammo left or not. It will return false when there's no ammo left in the magazine **and** when there's no reserve ammo left.
---
--- This will return true for weapons like crowbar, gravity gun, etc.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:HasAmmo)
---@return boolean # Whether the weapon has ammo or not.
function Weapon:HasAmmo() end

---[SHARED] Called when weapon tries to holster.
---
--- This will only be called serverside when using Player:SelectWeapon as that function immediately switches the weapon out of prediction.
---
--- This is called twice for every holster clientside, one in Prediction and one not.
---
--- Before WEAPON:OnRemove is called, this function is only called serverside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Holster)
---@param weapon Entity The weapon we are trying switch to.
---@return boolean # Return true to allow weapon to holster.  This will not have an effect if weapon was switched away from using Player:SetActiveWeapon
function WEAPON:Holster(weapon) end

---[CLIENT] This hook determines which parts of the HUD to draw.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:HUDShouldDraw)
---@param element string The HUD element in question
---@return boolean # Return false to hide this HUD element
function WEAPON:HUDShouldDraw(element) end

---[SHARED] Called when the weapon entity is created.
---
--- Entity:GetOwner will return NULL at this point because the weapon is not equpped by a player or NPC yet. Use WEAPON:Equip or WEAPON:Deploy if you need the owner to be valid.
---
--- This is not called serverside after a quicksave.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Initialize)
function WEAPON:Initialize() end

---[CLIENT] Returns whenever the weapon is carried by the local player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:IsCarriedByLocalPlayer)
---@return boolean # Is the weapon is carried by the local player or not
function Weapon:IsCarriedByLocalPlayer() end

---[SHARED] Checks if the weapon is a SWEP or a built-in weapon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:IsScripted)
---@return boolean # Returns true if weapon is scripted ( SWEP ), false if not ( A built-in HL2/HL:S weapon )
function Weapon:IsScripted() end

---[SHARED] Returns whether the weapon is visible. The term visibility is not exactly what gets checked here, first it checks if the owner is a player, then checks if the active view model has EF_NODRAW flag NOT set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:IsWeaponVisible)
---@return boolean # Is visible or not
function Weapon:IsWeaponVisible() end

---[SERVER] Called when the engine sets a value for this scripted weapon.
---
--- See GM:EntityKeyValue for a hook that works for all entities.
---
---
--- See ENTITY:KeyValue for an  hook that works for scripted entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:KeyValue)
---@param key string The key that was affected.
---@param value string The new value.
---@return boolean # Return true to suppress this KeyValue or return false or nothing to apply this key value.
function WEAPON:KeyValue(key, value) end

---[SHARED] Returns the time since this weapon last fired a bullet with Entity:FireBullets in seconds. It is not networked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:LastShootTime)
---@return number # The time in seconds when the last bullet was fired.
function Weapon:LastShootTime() end

---[SERVER] Called when weapon is dropped by Player:DropWeapon.
---
--- See also WEAPON:OwnerChanged.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:OnDrop)
function WEAPON:OnDrop() end

---[SHARED] Called whenever the weapons Lua script is reloaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:OnReloaded)
function WEAPON:OnReloaded() end

---[SHARED] Called when the swep is about to be removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:OnRemove)
function WEAPON:OnRemove() end

---[SHARED] Called when the weapon entity is reloaded from a Source Engine save (not the Sandbox saves or dupes) or on a changelevel (for example Half-Life 2 campaign level transitions).
---
--- For the duplicator callbacks, see ENTITY:OnDuplicated.
---
--- See also saverestore for relevant functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:OnRestore)
function WEAPON:OnRestore() end

---[SHARED] Called when weapon is dropped or picked up by a new player. This can be called clientside for all players on the server if the weapon has no owner and is picked up.
---
--- See also WEAPON:OnDrop.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:OwnerChanged)
function WEAPON:OwnerChanged() end

---[CLIENT] Called after the view model has been drawn while the weapon in use. This hook is called from the default implementation of GM:PostDrawViewModel, and as such, will not occur if it has been overridden.
---
--- WEAPON:ViewModelDrawn is an alternative hook which is always called before GM:PostDrawViewModel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:PostDrawViewModel)
---@param vm Entity This is the view model entity after it is drawn
---@param weapon Weapon This is the weapon that is from the view model (same as self)
---@param ply Player The owner of the view model
function WEAPON:PostDrawViewModel(vm, weapon, ply) end

---[CLIENT] Allows you to modify viewmodel while the weapon in use before it is drawn. This hook only works if you haven't overridden GM:PreDrawViewModel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:PreDrawViewModel)
---@param vm Entity This is the view model entity before it is drawn.
---@param weapon Weapon This is the weapon that is from the view model.
---@param ply Player The the owner of the view model.
function WEAPON:PreDrawViewModel(vm, weapon, ply) end

---[SHARED] Called when primary attack button ( +attack ) is pressed.
---
--- When in singleplayer, this function is only called in the server realm. When in multiplayer, the hook will be called on both the server and the client in order to allow for Prediction.
---
--- You can force the hook to always be called on client like this:
---
--- ```
--- if ( game.SinglePlayer() ) then self:CallOnClient( "PrimaryAttack" ) end
--- ```
---
---
--- Note that due to prediction, in multiplayer SWEP:PrimaryAttack is called multiple times per one "shot" with the gun. To work around that, use Global.IsFirstTimePredicted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:PrimaryAttack)
function WEAPON:PrimaryAttack() end

---[CLIENT] A convenience function that draws the weapon info box, used in WEAPON:DrawWeaponSelection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:PrintWeaponInfo)
---@param x number The x co-ordinate of box position
---@param y number The y co-ordinate of box position
---@param alpha number Alpha value for the box
function WEAPON:PrintWeaponInfo(x, y, alpha) end

---[SHARED] Called when the reload key ( +reload ) is pressed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Reload)
function WEAPON:Reload() end

---[CLIENT] Called every frame just before GM:RenderScene.
---
--- Used by the Tool Gun to render view model screens (TOOL:DrawToolScreen).
---
---
--- Materials rendered in this hook require $ignorez parameter to draw properly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:RenderScreen)
function WEAPON:RenderScreen() end

---[SHARED] Called when secondary attack button ( +attack2 ) is pressed.
---
--- For issues with this hook being called rapidly on the client side, see the global function Global.IsFirstTimePredicted.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:SecondaryAttack)
function WEAPON:SecondaryAttack() end

---[SHARED] Forces weapon to play activity/animation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SendWeaponAnim)
---@param act number Activity to play. See the Enums/ACT (specifically ACT_VM_).
function Weapon:SendWeaponAnim(act) end

---[SHARED] Sets the activity the weapon is playing.
---
--- See also Weapon:GetActivity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SetActivity)
---@param act number The new activity to set, see Enums/ACT.
function Weapon:SetActivity(act) end

---[SHARED] Lets you change the number of bullets in the given weapons primary clip.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SetClip1)
---@param ammo number The amount of bullets the clip should contain
function Weapon:SetClip1(ammo) end

---[SHARED] Lets you change the number of bullets in the given weapons secondary clip.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SetClip2)
---@param ammo number The amount of bullets the clip should contain
function Weapon:SetClip2(ammo) end

---[SHARED] Sets the weapon deploy speed. This value needs to match on client and server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:SetDeploySpeed)
---@param speed number The value to set deploy speed to. Values less than `1` will slow down the animations. Minimum value is `0.1`.
function Weapon:SetDeploySpeed(speed) end

---[SHARED] Sets the hold type of the weapon. This function also calls WEAPON:SetWeaponHoldType and properly networks it to all clients.
---
--- This only works on scripted weapons.
---
--- Using this function on weapons held by bots will not network holdtype changes to clients if the world model is set to an empty string (SWEP.WorldModel = "").
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SetHoldType)
---@param name string Name of the hold type. You can find all default hold types Hold_Types
function Weapon:SetHoldType(name) end

---[SHARED] Sets the time since this weapon last fired in seconds. Used in conjunction with Weapon:LastShootTime
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SetLastShootTime)
---@param time? number The time in seconds when the last time the weapon was fired.
function Weapon:SetLastShootTime(time) end

---[SHARED] Sets when the weapon can fire again. Time should be based on Global.CurTime.
---
--- The standard HL2 Pistol (`weapon_pistol`) bypasses this function due to an [internal implementation](https://github.com/ValveSoftware/source-sdk-2013/blob/master/mp/src/game/server/hl2/weapon_pistol.cpp#L313-L317).
--- This will fire extra bullets if the time is set to less than Global.CurTime.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SetNextPrimaryFire)
---@param time number Time when player should be able to use primary fire again
function Weapon:SetNextPrimaryFire(time) end

---[SHARED] Sets when the weapon can alt-fire again. Time should be based on Global.CurTime.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Weapon:SetNextSecondaryFire)
---@param time number Time when player should be able to use secondary fire again
function Weapon:SetNextSecondaryFire(time) end

---[SHARED] Called when the SWEP should set up its Networking_Entities.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:SetupDataTables)
function WEAPON:SetupDataTables() end

---[SHARED] Sets the hold type of the weapon. This must be called on **both** the server and the client to work properly.
---
--- **NOTE:** You should avoid calling this function and call Weapon:SetHoldType now.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:SetWeaponHoldType)
---@param name string Name of the hold type. You can find all default hold types Hold_Types
function WEAPON:SetWeaponHoldType(name) end

---[SHARED] A convenient function to shoot bullets.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:ShootBullet)
---@param damage number The damage of the bullet
---@param num_bullets number Amount of bullets to shoot
---@param aimcone number Spread of bullets
---@param ammo_type? string Ammo type of the bullets
---@param force? number Force of the bullets
---@param tracer? number Show a tracer on every x bullets
function WEAPON:ShootBullet(damage, num_bullets, aimcone, ammo_type, force, tracer) end

---[SHARED] A convenience function to create shoot effects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:ShootEffects)
function WEAPON:ShootEffects() end

---[CLIENT] Called to determine if the view model should be drawn or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:ShouldDrawViewModel)
---@return boolean # Return true to draw the view model, false otherwise.
function WEAPON:ShouldDrawViewModel() end

---[SERVER] Should this weapon be dropped when its owner dies?
---
--- This only works if the player has Player:ShouldDropWeapon set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:ShouldDropOnDie)
---@return boolean # Return true to drop the weapon, false otherwise. Default ( if you don't return anything ) is false.
function WEAPON:ShouldDropOnDie() end

---[SHARED] A convenience function to remove primary ammo from clip.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:TakePrimaryAmmo)
---@param amount number Amount of primary ammo to remove
function WEAPON:TakePrimaryAmmo(amount) end

---[SHARED] A convenience function to remove secondary ammo from clip.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:TakeSecondaryAmmo)
---@param amount number How much of secondary ammo to remove
function WEAPON:TakeSecondaryAmmo(amount) end

---[SHARED] Called when the swep thinks.
---
--- This hook won't be called during the deploy animation and when using Weapon:DefaultReload.
---
--- Works only in players hands. Doesn't work in NPCs hands.
--- Despite being a predicted hook, this hook is called clientside in single player, however it will not be recognized as a predicted hook to Player:GetCurrentCommand.
---
--- This hook will be called before Player movement is processed on the client, and after on the server.
---
--- This will not be run during deploy animations after a serverside-only deploy. This usually happens after picking up and dropping an object with +use.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:Think)
function WEAPON:Think() end

---[SHARED] Translate a player's Activity into a weapon's activity, depending on how you want the player to be holding the weapon.
---
--- For example, ACT_MP_RUN becomes ACT_HL2MP_RUN_PISTOL.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:TranslateActivity)
---@param act number The activity to translate
---@return number # The translated activity
function WEAPON:TranslateActivity(act) end

---[SHARED] Allows to change players field of view while player holds the weapon.
---
--- This hook must be defined shared and return same value on both to properly affect Area Portals.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:TranslateFOV)
---@param fov number The current/default FOV.
---@return number # The target FOV.
function WEAPON:TranslateFOV(fov) end

---[CLIENT] Called straight after the view model has been drawn. This is called before GM:PostDrawViewModel and WEAPON:PostDrawViewModel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/WEAPON:ViewModelDrawn)
---@param ViewModel Entity Players view model
function WEAPON:ViewModelDrawn(ViewModel) end
