---@meta

---
--- Table structure that describes a Source Engine ammo type.
---
---
--- See game.AddAmmoType and game.GetAmmoData.
---
---@class AmmoData
local AmmoData = {}

---Damage type using Enums/DMG. Related function is game.GetAmmoDamageType.
---@type number
AmmoData.dmgtype = DMG_BULLET

---The force of the ammo. Related function is game.GetAmmoForce.
---@type number
AmmoData.force = 1000

---The maximum water splash size.
---@type number
AmmoData.maxsplash = 0

---The minimum water splash size.
---@type number
AmmoData.minsplash = 0

---Name of the ammo. Related functions are game.GetAmmoName and game.GetAmmoID.
---@type string
AmmoData.name = nil

---The damage dealt to NPCs. Related function is game.GetAmmoNPCDamage. Can also be a string pointing to a convar. The value will automatically update with the convar's.
---@type number
AmmoData.npcdmg = 10

---The damage dealt to players. Related function is game.GetAmmoPlayerDamage. Can also be a string pointing to a convar. The value will automatically update with the convar's.
---@type number
AmmoData.plydmg = 10

---Tracer type using Enums/TRACER.
---@type number
AmmoData.tracer = TRACER_NONE

---Maximum amount of ammo of this type the player should be able to carry in reserve. `-2` makes this ammo type infinite. Related function is game.GetAmmoMax. Can also be a string pointing to a convar. The value will automatically update with the convar's. `gmod_maxammo` convar will override this value if set to above 0, **which it is by default**.
---@type number
AmmoData.maxcarry = 9999

---Flags for the ammo type using Enums/AMMO.
---@type number
AmmoData.flags = 0

--- Table used by various functions, such as Entity:GetAttachment.
---@class AngPos
local AngPos = {}

---Angle object
---@type Angle
AngPos.Ang = nil

---Vector object
---@type Vector
AngPos.Pos = nil

---The bone ID the attachment point is parented to.
---@type number
AngPos.Bone = nil

--- Table used by panel animation methods, primarily Panel:AnimationThinkInternal, and returned by Panel:NewAnimation.
---@class AnimationData
local AnimationData = {}

---The system time value returned by Global.SysTime when the animation starts/will start.
---@type number
AnimationData.StartTime = nil

---The system time value returned by Global.SysTime when the animation ends/will end.
---@type number
AnimationData.EndTime = nil

---The ease in/out level of the animation.
---@type number
AnimationData.Ease = -1

---The callback function that will be called upon completion of the animation. The arguments passed to it are: * table animData - This structure. * Panel tgtPanel - The panel the animation was run on.
---@type function
AnimationData.OnEnd = nil

---The `think` function called every frame that will animate the panel object. This varies based on the animation. You can create a custom function for this if you aren't using the stock panel methods. The arguments passed to it are: * table animData - This structure. * Panel tgtPanel - The panel the animation is being run on. * number fraction - The progress fraction of the animation, between 0 and 1. The change rate of this number will not be linear if you are easing.
---@type function
AnimationData.Think = nil

---The target position, or target translation of the panel object. Used by Panel:MoveTo and Panel:MoveBy respectively.
---@type Vector
AnimationData.Pos = nil

---The position of the panel object when the animation started. Used by Panel:MoveTo and Panel:MoveBy.
---@type Vector
AnimationData.StartPos = nil

---Whether to resize the panel horizontally or not. Only used by Panel:SizeTo.
---@type boolean
AnimationData.SizeX = nil

---Whether to resize the panel vertically or not. Only used by Panel:SizeTo.
---@type boolean
AnimationData.SizeY = nil

---The target size of the panel object. Only used by Panel:SizeTo.
---@type Vector
AnimationData.Size = Vector(0, 0, 0)

---The size of the panel object when the animation started. Only used by Panel:SizeTo.
---@type Vector
AnimationData.StartSize = nil

---The target colour of the panel object. Only used by Panel:ColorTo.
---@type table
AnimationData.Color = nil

---The colour of the panel object when the animation started. Only used by Panel:ColorTo.
---@type table
AnimationData.StartColor = nil

---The target alpha (0-255) of the panel object. Only used by Panel:AlphaTo.
---@type number
AnimationData.Alpha = nil

---The alpha (0-255) of the panel object when the animation started. Only used by Panel:AlphaTo.
---@type number
AnimationData.StartAlpha = nil

---The speed to use for transitions when using linear interpolation (Lerp) animations. Only used by Panel:LerpPositions.
---@type number
AnimationData.Speed = nil

---Whether or not to use easing to make the panel 'jump' at its target, slowing as it approaches. Only used by Panel:LerpPositions.
---@type boolean
AnimationData.UseGravity = nil

--- Table returned by Entity:GetAttachments.
---@class AttachmentData
local AttachmentData = {}

---Index of the attachment.
---@type number
AttachmentData.id = nil

---Name of the attachment.
---@type string
AttachmentData.name = nil

--- Table returned by Entity:GetBodyGroups.
---@class BodyGroupData
local BodyGroupData = {}

---Index of the body group.
---@type number
BodyGroupData.id = nil

---Name of the body group.
---@type string
BodyGroupData.name = nil

---Amount of subgroups.
---@type number
BodyGroupData.num = nil

---A zero-indexed table that is of length _num_ with values being the name of the smd mesh file of the respective body group value.
---@type table
BodyGroupData.submodels = nil

---
--- Structure used for storing/restoring bone manipulations.
--- Data is stored from Entity:GetManipulateBoneScale, Entity:GetManipulateBoneAngles, and Entity:GetManipulateBonePosition.
--- Data is restored using Entity:ManipulateBoneScale, Entity:ManipulateBoneAngles, and Entity:ManipulateBonePosition.
---
--- The function duplicator.DoBoneManipulator and Structures/EntityCopyData use a table
--- containing a BoneManipulationData structure for each bone (that has manipulations applied) with the bone ID as the struct index in the table.
---
--- Fields **s**, **a**, and **p** are set if they don't equal **Vector( 1, 1, 1 )**, **Angle( 0, 0, 0 )**, and **Vector( 0, 0, 0 )** respectively.
---
---@class BoneManipulationData
local BoneManipulationData = {}

---The entity's scale manipulation of the bone
---@type Vector
BoneManipulationData.s = Vectornil

---The entity's angle manipulation of the bone
---@type Angle
BoneManipulationData.a = nil

---The entity's position manipulation of the given bone
---@type Vector
BoneManipulationData.p = Vectornil

--- Tables used for bullets see Entity:FireBullets and GM:EntityFireBullets.
---@class Bullet
local Bullet = {}

---The entity that should be reported as attacker eg. a player By default this would be set to the entity Entity:FireBullets is called on.
---@type Entity
Bullet.Attacker = self

---Function to be called **after** the bullet was fired but **before** the damage is applied (the callback is called even if no damage is applied). The arguments are: * Entity attacker * table tr - See Structures/TraceResult * CTakeDamageInfo dmgInfo The return value can be a table with following keys: * boolean effects - `false` to not do any of the effects. * boolean damage - `false` to not do any damage.
---@type function
Bullet.Callback = nil

---The damage dealt by the bullet. If set to `0`, it means the damage should be calculated from the ammo type's ConVars if the ammo type has `AMMO_INTERPRET_PLRDAMAGE_AS_DAMAGE_TO_PLAYER` flag set. See Structures/AmmoData.
---@type number
Bullet.Damage = 1

---The force of the bullets
---@type number
Bullet.Force = 1

---Maximum distance the bullet can travel
---@type number
Bullet.Distance = 56756

---The hull size of the bullet
---@type number
Bullet.HullSize = 0

---The amount of bullets to fire
---@type number
Bullet.Num = 1

---Show tracer for every x bullets
---@type number
Bullet.Tracer = 1

---The ammunition name
---@type string
Bullet.AmmoType = "<empty string>"

---The tracer name. You can find a list of default effects Default_Effects.
---@type string
Bullet.TracerName = "nil"

---The fire direction
---@type Vector
Bullet.Dir = VectorVector(0, 0, 0)

---The spread, only x and y are needed
---@type Vector
Bullet.Spread = VectorVector(0, 0, 0)

---The position to fire the bullets from
---@type Vector
Bullet.Src = VectorVector(0, 0, 0)

---The entity that the bullet will ignore when it will be shot.
---@type Entity
Bullet.IgnoreEntity = NULL

--- Table structure used GM:CalcView and GM:CalcVehicleView hook.
---@class CamData
local CamData = {}

---The camera's position
---@type Vector
CamData.origin = nil

---The camera's angles
---@type Angle
CamData.angles = nil

---The camera's FOV
---@type number
CamData.fov = nil

---Distance to near clipping plane
---@type number
CamData.znear = nil

---Distance to far clipping plane
---@type number
CamData.zfar = nil

---Set true to draw local players player model.
---@type boolean
CamData.drawviewer = false

---If set, enables orthographic mode. The table has following arguments: * number left * number right * number top * number bottom Each describes where their border starts, (`left`+`right`) and (`top`+`bottom`) should equal `0` to center on the view position.
---@type table
CamData.ortho = nil

---
--- Passed as argument of ENTITY:PhysicsCollide, EFFECT:PhysicsCollide and used with Entity:AddCallback.
---
--- Sometimes, the value of `Speed` can be different from getting the length calculated from `OurOldVelocity`, even though they should be the same, or close to same. It's recommended to do `OurOldVelocity:Length()` instead.
---
--- ```
--- function ENT:PhysicsCollide( colData, collider )
---     -- you may get two completely different values, and the second one should be more accurate.
---     print(colData.Speed)
---     print(colData.OurOldVelocity:Length())
--- end
--- ```
---
---
---@class CollisionData
local CollisionData = {}

---The collision position
---@type Vector
CollisionData.HitPos = nil

---The other collision entity
---@type Entity
CollisionData.HitEntity = nil

---The entity's velocity before the collision
---@type Vector
CollisionData.OurOldVelocity = nil

---Other entity's physics object
---@type PhysObj
CollisionData.HitObject = nil

---Time since the last collision with the `HitEntity`
---@type number
CollisionData.DeltaTime = nil

---Speed of the other entity before the collision
---@type Vector
CollisionData.TheirOldVelocity = nil

---The speed of the entity before the collision
---@type number
CollisionData.Speed = nil

---Normal of the surface that hit the other entity
---@type Vector
CollisionData.HitNormal = nil

---Entity's physics object
---@type PhysObj
CollisionData.PhysObject = nil

---Surface Property ID of `this` entity
---@type number
CollisionData.OurSurfaceProps = nil

---Surface Property ID of the entity we collided with
---@type number
CollisionData.TheirSurfaceProps = nil

---The speed at which the impact happened
---@type Vector
CollisionData.HitSpeed = nil

---Our new velocity after the impact
---@type Vector
CollisionData.OurNewVelocity = nil

---The new velocity after the impact of the entity we collided with
---@type Vector
CollisionData.TheirNewVelocity = nil

---Old angular velocity of this entity
---@type Vector
CollisionData.OurOldAngularVelocity = nil

---Old angular velocity of the entity we collided with
---@type Vector
CollisionData.TheirOldAngularVelocity = nil

---The red channel
---@type number
Color.r = nil

---The green channel
---@type number
Color.g = nil

---The blue channel
---@type number
Color.b = nil

---The alpha channel
---@type number
Color.a = nil

--- Table that maintains information on the creation menu tabs. Each key of the table represents the name of the tab. See spawnmenu.AddCreationTab and spawnmenu.GetCreationTabs.
---@class CreationMenus
local CreationMenus = {}

---The function used to generate the content of the tab.
---@type function
CreationMenus.Function = nil

---The icon material that will accompany the title of the tab.
---@type string
CreationMenus.Icon = nil

---The order in which a tab will be displayed relative to the other tabs.
---@type number
CreationMenus.Order = nil

---The tooltip to be shown with the tab.
---@type string
CreationMenus.Tooltip = nil

--- Table returned by os.date and used by os.time.
---@class DateData
local DateData = {}

---Day of the month
---@type number
DateData.day = nil

---Hour
---@type number
DateData.hour = nil

---Daylight saving enabled
---@type boolean
DateData.isdst = nil

---Minute
---@type number
DateData.min = nil

---Month January: 1, December: 12
---@type number
DateData.month = nil

---Second
---@type number
DateData.sec = nil

---Day of the week Sunday: 1, Saturday: 7
---@type number
DateData.wday = nil

---Day of the year
---@type number
DateData.yday = nil

---Year
---@type number
DateData.year = nil

---
--- Table returned by debug.getinfo.
---
--- If a filter is applied to debug.getinfo, some members may not exist!
---
--- For functions defined in C/C++, the following members will always have the given values:
--- * what = "C"
--- * source = "[C]"
--- * nparams = 0
--- * isvararg = true
--- * namewhat = ""
--- * short_src = "[C]"
--- * linedefined = -1
--- * currentline = -1
--- * lastlinedefined = -1
---
---@class DebugInfo
local DebugInfo = {}

---Reference to the function that was passed in. If a stack level was specified, this will be the function at that stack level. 0 = debug.getinfo, 1 = function that called debug.getinfo, etc. **Option: f**
---@type function
DebugInfo.func = nil

---The line where the function definiton starts (where "function" is located). **Option: S**
---@type number
DebugInfo.linedefined = nil

---The line the function definition ended (where "end" is located). **Option: S**
---@type number
DebugInfo.lastlinedefined = nil

---The path to the file where the passed function is defined prepended by an @ (ex. "@lua/autorun/mytestfile.lua"). This will be the Global.CompileString or Global.RunString identifier if the function wasn't defined in a file, also prepended by an @. **Option: S**
---@type string
DebugInfo.source = nil

---The shortened name of the source (without the @). May be truncated if the source path is long. **Option: S**
---@type string
DebugInfo.short_src = nil

---The language used. Either "Lua" or "C". **Option: S**
---@type string
DebugInfo.what = nil

---The current line. This will be -1 if the code is not executed from a file. **Option: l** (lowercase L)
---@type number
DebugInfo.currentline = nil

---The function name. This will be nil if the name cannot be found. Only works if stack level is passed rather than function pointer. **Option: n**
---@type string
DebugInfo.name = nil

---The function "type". This will be "global", "local", "method", "field". Can also be an empty string if the function name could not be found. Only works if stack level is passed rather than function pointer. **Option: n**
---@type string
DebugInfo.namewhat = nil

---Whether the function is variadic (has a `...` argument). **Option: u**
---@type boolean
DebugInfo.isvararg = nil

---The number of arguments the function uses excluding varargs. **Option: u**
---@type number
DebugInfo.nparams = nil

---Upvalue count. Max index that can be used with debug.getupvalue. C functions can have upvalues but they cannot be accessed from Lua. **Option: u**
---@type number
DebugInfo.nups = nil

---A table of all the active lines in the function - that is, lines with code that actually does something (not blank lines or lines with comments only). The table keys will be line numbers, and their values will all be true. Lines that are inactive are simply not included in the table - they have the value nil. It doesn't check for activeline in subfunctions. **Option: L**
---@type table
DebugInfo.activelines = nil

---
--- Structure for Global.DynamicLight.
--- All members are case insensitive.
---
--- This is an actual class named **dlight_t**, not a table.
---
---@class DynamicLight
local DynamicLight = {}

---The brightness of the light.
---@type number
DynamicLight.brightness = nil

---Fade out speed. Here's a formula for calculating Decay for your light: 1000 / fadeOutTimeInSeconds. For example setting decay to 1000 would fade out the light in 1 second, 2000 - 0.5 seconds.
---@type number
DynamicLight.decay = nil

---Time after which light will be removed. This is relative to Global.CurTime. If you put in a value that is less than or equal to Global.CurTime, the light will not behave properly. Note, that it does not affect fading out. Light will be removed regardless of it being fully faded out or not.
---@type number
DynamicLight.dietime = nil

---The light direction. Used with **InnerAngle** and **OuterAngle**.
---@type Vector
DynamicLight.dir = VectorVector(0, 0, 0)

---The closer this is to zero, the smoother the light will be. Requires **Dir** and **OuterAngle** to be set.
---@type number
DynamicLight.innerangle = 0

---The angle of the Dynamic Light. Requires **Dir** to be set.
---@type number
DynamicLight.outerangle = 0

---Makes the light brighter and flicker? Changing the value does not seem to affect anything.
---@type number
DynamicLight.key = nil

---Minimum light
---@type number
DynamicLight.minlight = 0

---Don't light the world. Has no effect for elights since they never light the world.
---@type boolean
DynamicLight.noworld = false

---Don't light models
---@type boolean
DynamicLight.nomodel = false

---Position of the light
---@type Vector
DynamicLight.pos = nil

---Radius of the light
---@type number
DynamicLight.size = nil

---Flicker style, see [this page](https://developer.valvesoftware.com/wiki/Light_dynamic#Appearances) for examples.
---@type number
DynamicLight.style = nil

---The blue part of the color
---@type number
DynamicLight.b = nil

---The green part of the color
---@type number
DynamicLight.g = nil

---The red part of the color
---@type number
DynamicLight.r = nil

--- Passed as argument of GM:EntityEmitSound.
---@class EmitSoundInfo
local EmitSoundInfo = {}

---The file path of the played sound. Sounds prefixed with ) tell the sound engine that it is a spatial sound; this allows the sound to emit from a specific location within the world. Sounds prefixed with ^ tell the sound engine that it is a distance based sound. The left channel of the .wav is the 'near' sound that will play when the sound originates close to you, and the right channel is the 'far' sound that will play when the sound originates far from you.
---@type string
EmitSoundInfo.SoundName = nil

---The original file path or soundscript name. Even if the SoundName value is changed, the OriginalSoundName value will remain the same. Sounds may be returned as soundscripts (for example, "Weapon_357.Single") instead of the sound's file path. You can use sound.GetProperties to retrieve the actual file path.
---@type string
EmitSoundInfo.OriginalSoundName = nil

---The time at which the sound should be played. If equal to 0 or CurTime(), the sound is played immediately. If greater than CurTime(), the sound is played with a delay. If less than CurTime(), part of the sound is skipped.
---@type number
EmitSoundInfo.SoundTime = 0

---The DSP (digital signal processing) preset applied to the sound. There are approximately 134 different presets defined by the Source engine between 0 and 133. These presets represent different types of 'rooms' or environments. [List of DSP's](https://developer.valvesoftware.com/wiki/Dsp_presets)
---@type number
EmitSoundInfo.DSP = 0

---The sound's attenuation, a number between 0 (low) and 511 (high) This determines how fast the sound drops away. A higher value means the sound can be heard farther away. See Enums/SNDLVL.
---@type number
EmitSoundInfo.SoundLevel = 75

---The pitch of the played sound, a number between 0 (low) and 255 (high), where 100 is the sound's original pitch.
---@type number
EmitSoundInfo.Pitch = 100

---The bit flags of the played sound. See Enums/SND for available options.
---@type number
EmitSoundInfo.Flags = 0

---The sound's channel. See Enums/CHAN for available options.
---@type number
EmitSoundInfo.Channel = nil

---The volume of the played sound, return as a decimal number between 0 (low) and 1 (high).
---@type number
EmitSoundInfo.Volume = nil

---The entity that played the sound.
---@type Entity
EmitSoundInfo.Entity = nil

---The origin of the played sound.
---@type Vector
EmitSoundInfo.Pos = nil

---@class ENT : Entity
ENT = {}

---The base entity to derive from. This **must** be a valid Lua entity
---@type string
ENT.Base = nil

---Type of the entity. This **must** be one of these: * **anim** * **brush** * **point** * **ai** * **nextbot** * **filter** See Scripted Entities for a more detailed explanation of what each one is.
---@type string
ENT.Type = nil

---The class name of the entity (File or folder name of your entity). **This is set automatically _after_ the entity file is loaded.**
---@type string
ENT.ClassName = nil

---If set, overrides the classname of the SWEP.
---@type string
ENT.ClassNameOverride = nil

---The folder from where the entity was loaded. This should always be "entity/ent_myentity", regardless whether your entity is stored as a file, or multiple files in a folder. **This is set automatically _before_ the entity file is loaded.**
---@type string
ENT.Folder = nil

---Set this to true if your entity has animations. You should also apply changes to the ENTITY:Think function from the example on that page.
---@type boolean
ENT.AutomaticFrameAdvance = false

---Spawnmenu category to put the entity into
---@type string
ENT.Category = "Other"

---Whether this entity should be displayed and is spawnable in the spawn menu
---@type boolean
ENT.Spawnable = false

---Whether the entity supports Editing. See Editable Entities for more info.
---@type boolean
ENT.Editable = false

---Whether or not only admins can spawn the entity from their spawn menu
---@type boolean
ENT.AdminOnly = false

---Nice name of the entity to appear in the spawn menu
---@type string
ENT.PrintName = nil

---The author of the entity
---@type string
ENT.Author = nil

---The contacts of the entity creator
---@type string
ENT.Contact = nil

---The purpose of the entity creation
---@type string
ENT.Purpose = nil

--- How to use your entity
---@type string
ENT.Instructions = nil

---The entity's render group, see Enums/RENDERGROUP. If unset, the engine will decide the render group based on the entity's model.
---@type number
ENT.RenderGroup = nil

---Disable the ability for players to duplicate this entity.
---@type boolean
ENT.DisableDuplicator = false

---Sets the spawnmenu content icon type for the entity, used by spawnmenu in the Sandbox-derived gamemodes. See spawnmenu.AddContentType for more information.
---@type string
ENT.ScriptedEntityType = nil

---If set, the entity will not be duplicated via the built-in duplicator system.
---@type boolean
ENT.DoNotDuplicate = false

---If set, overrides the icon path to be displayed in the Spawnmenu for this entity.
---@type string
ENT.IconOverride = "materials/entities/<ClassName>.png"

---If set, the entity forbid physgun interaction.
---@type boolean
ENT.PhysgunDisabled = false

---
--- Data structure used by the duplicator to store and load entity data.
---
--- It is created by duplicator.CopyEntTable and can be loaded by duplicator.CreateEntityFromTable.
---
--- It also shows up in several other contexts:
--- * duplicator.RegisterEntityClass
--- * ENTITY:OnEntityCopyTableFinish
--- * ENTITY:OnDuplicated
---
--- In addition to all fields listed here, any field saved on the entity will be saved as-is to this table. For example, if you set `ent.FavoriteFood = "Steak"` before duplicating it, this structure will also contain the field `FavoriteFood` with the value `"Steak"`.
---
---@class EntityCopyData
local EntityCopyData = {}

---The entity's name, see Entity:GetName.
---@type string
EntityCopyData.Name = nil

---The entity's class name, see Entity:GetClass.
---@type string
EntityCopyData.Class = nil

---The entity's position, relative to the duplication origin point.
---@type Vector
EntityCopyData.Pos = nil

---The entity's angle, relative to the duplication angle.
---@type Angle
EntityCopyData.Angle = nil

---The entity's Network Vars, see ENTITY:SetupDataTables and Networking Entities.
---@type table
EntityCopyData.DT = nil

---The entity's model, see Entity:GetModel.
---@type string
EntityCopyData.Model = nil

---The entity's model scale, see Entity:GetModelScale. This will only be present if the model scale isn't 1.
---@type number
EntityCopyData.ModelScale = nil

---The entity's active skin, see Entity:GetSkin.
---@type number
EntityCopyData.Skin = nil

---The entity's collision group, see Entity:GetCollisionGroup. Uses the Enums/COLLISION_GROUP.
---@type number
EntityCopyData.ColGroup = nil

---The entity's collision bound minimums, see Entity:GetCollisionBounds.
---@type Vector
EntityCopyData.Mins = nil

---The entity's collision bound maximums, see Entity:GetCollisionBounds.
---@type Vector
EntityCopyData.Maxs = nil

---Data about the entity's PhysObjs, see Entity:GetPhysicsObjectNum. The key is the physics object index (starts from 0), and the value is a Structures/PhysicsObjectSave. Unlike other tables in this structure, if there are no physics objects for this entity this will be an empty table.
---@type table
EntityCopyData.PhysicsObjects = nil

---The entity's Flex Scale, see Entity:GetFlexScale.
---@type number
EntityCopyData.FlexScale = nil

---Each flex bone's flex weight, see Entity:GetFlexWeight. The key is the flex's index and the value is the weight. Only flexes with a non-default (nonzero) weight are listed, and if none exist, this field will be nil.
---@type table
EntityCopyData.Flex = nil

---The entity's body groups, see Entity:GetBodygroup. The key is the bodygroup ID and the value is the assigned bodygroup number. Only body groups with a non-default (> 0) value are listed, and if none exist, this field will be nil.
---@type table
EntityCopyData.BodyG = nil

---Bone manipulation data, see Entity:HasBoneManipulations. The key is the bone index and the value is a Structures/BoneManipulationData. Only bones that have been manipulated with non-default values are listed, and if none exist, this field will be nil.
---@type table
EntityCopyData.BoneManip = nil

---The entity's MapCreationID, only exists for entities that were created by the map. See Entity:MapCreationID.
---@type number
EntityCopyData.MapCreationID = nil

---Deprecated, always 0. See Entity:GetWorkshopID.
---@type number
EntityCopyData.WorkshopID = nil

--- Used for surface.CreateFont.
---@class FontData
local FontData = {}

---The font source. Custom font files are stored in resource/fonts/. The length is limited to 31 characters maximum. This must be the actual 'nice' font, not a file name. (Finding the Font Name) This also cannot be an already registered font, i.e. you cannot base your font from any of the Default_Fonts
---@type string
FontData.font = "Arial"

---Allow the font to display glyphs that are outside of the Latin-1 range. Unicode code points above 0xFFFF are not supported.
---@type boolean
FontData.extended = false

---The font height in pixels `Range:` 4 - 255
---@type number
FontData.size = 13

---The font boldness
---@type number
FontData.weight = 500

---The strength of the font blurring `Range:` 0 - 80
---@type number
FontData.blursize = 0

---The "scanline" interval Must be > 1 to work. This setting is per blursize per font - so if you create a font using "Arial" without scanlines, you cannot create an Arial font using scanlines with the same blursize
---@type number
FontData.scanlines = 0

---Smooth the font
---@type boolean
FontData.antialias = true

---Add an underline to the font
---@type boolean
FontData.underline = false

---Make the font italic
---@type boolean
FontData.italic = false

---Add a strike through
---@type boolean
FontData.strikeout = false

---Enables the use of symbolic fonts such as Webdings
---@type boolean
FontData.symbol = false

---Seems to add a line in the middle of each letter
---@type boolean
FontData.rotary = false

---Add shadow casting to the font
---@type boolean
FontData.shadow = false

---Additive rendering
---@type boolean
FontData.additive = false

---Add a black outline to the font. This does not work well with antialias, and only allows black 1-pixel outlines. It may be preferable to not use this parameter, and instead use draw.SimpleTextOutlined when drawing text that you want outlined.
---@type boolean
FontData.outline = false

---The fancy name of your gamemode.
---@type string
GM.Name = nil

---The name/contact info of the gamemode author.
---@type string
GM.Author = nil

---The contact email associated with the gamemode.
---@type string
GM.Email = nil

---The website associated with the gamemode.
---@type string
GM.Website = nil

---The name of the gamemode folder, automatically set.
---@type string
GM.FolderName = nil

---The name of the gamemode folder prepended with "gamemodes/" (such as "gamemodes/sandbox"), automatically set.
---@type string
GM.Folder = nil

---Set this to true if your gamemode is team-based. Used to enable/disable the base gamemode team system.
---@type boolean
GM.TeamBased = nil

---True if the gamemode is derived from sandbox.
---@type boolean
GM.IsSandboxDerived = nil

---The name of the gamemode folder prepended with "gamemode_" (such as "gamemode_sandbox"), automatically set.
---@type string
GM.ThisClass = nil

---The table of the base gamemode to derive from, set automatically by Global.DeriveGamemode. It is recommended to use Global.DEFINE_BASECLASS when referencing the gamemode's BaseClass to prevent unintended behavior Global.DeriveGamemode modifies the main gamemode's BaseClass, which is shared with parent gamemodes. Because of this, in parent gamemodes the BaseClass can be incorrect, so for instance you need to use `self.BaseClass.BaseClass` in the 1st parent instead
---@type table
GM.BaseClass = nil

--- Table used by Global.HTTP function.
---@class HTTPRequest
local HTTPRequest = {}

---Function to be called on failure. Arguments are * string reason
---@type function
HTTPRequest.failed = nil

---Function to be called on success. Arguments are * number code * string body * table headers
---@type function
HTTPRequest.success = nil

---Request method, case insensitive. Possible values are: * GET * POST * HEAD * PUT * DELETE * PATCH * OPTIONS
---@type string
HTTPRequest.method = nil

---The target url
---@type string
HTTPRequest.url = nil

---KeyValue table for parameters. This is only applicable to the following request methods: * GET * POST * HEAD
---@type table
HTTPRequest.parameters = nil

---KeyValue table for headers
---@type table
HTTPRequest.headers = nil

---Body string for POST data. If set, will override parameters
---@type string
HTTPRequest.body = nil

---Content type for body.
---@type string
HTTPRequest.type = "text/plain; charset=utf-8"

---The timeout for the connection.
---@type number
HTTPRequest.timeout = 60

--- Table used by util.TraceHull.
---@class HullTrace
local HullTrace = {}

---The start position of the trace
---@type Vector
HullTrace.start = nil

---The end position of the trace
---@type Vector
HullTrace.endpos = nil

---The 3D vector local to the start/endpos with the highest values. This will represent the corner with the upper bounds of the box.
---@type Vector
HullTrace.maxs = nil

---The 3D vector local to the start/endpos with the lowest (often negative) values. This will represent the corner with the lower bounds of the box.
---@type Vector
HullTrace.mins = nil

---Things the trace should not hit. Can also be a table of entities or a function with one argument: * Entity ent - The entity that the trace hit Using a function here is super slow. Try to avoid it.
---@type Entity
HullTrace.filter = {}

---The trace mask Enums/MASK. This determines what the trace should hit and what it shouldn't hit.
---@type number
HullTrace.mask = MASK_SOLID

---The collision group Enums/COLLISION_GROUP. This determines what the trace should hit in regards to the entity's collision group.
---@type number
HullTrace.collisiongroup = COLLISION_GROUP_NONE

---Should the trace ignore world or not.
---@type boolean
HullTrace.ignoreworld = false

---If set, the trace result will be written to the supplied table instead of returning a new table
---@type table
HullTrace.output = nil

--- Table structure used for render.SetLocalModelLights.
---@class LocalLight
local LocalLight = {}

---The type of the light source, see Enums/MATERIAL_LIGHT.
---@type number
LocalLight.type = MATERIAL_LIGHT_POINT

---The color of the light source (x is red, y is green, z is blue). Values are not restricted to a specific range, higher values will result in a brighter light.
---@type Vector
LocalLight.color = Vectorvector_origin

---The origin of the light in world coordinates.
---@type Vector
LocalLight.pos = Vectorvector_origin

---The direction of the light. Only required for directional and spot lights.
---@type Vector
LocalLight.dir = Vectorvector_origin

---The maximum range of the light source. Does not actually control light attenuation. Usually left at 0 for infinite range.
---@type number
LocalLight.range = 0

---Angular falloff exponent for spot lights. Higher values result in a sharper transition between the inner cone and the outer cone.
---@type number
LocalLight.angularFalloff = 5

---The inner cone angle for spot lights, in degrees. No angular falloff will occur inside that cone.
---@type number
LocalLight.innerAngle = 45

---The outer cone angle for spot lights, in degrees.
---@type number
LocalLight.outerAngle = 45

---The distance at which the light will fade to 50% of its brightness.
---@type number
LocalLight.fiftyPercentDistance = nil

---The distance at which the light will completely fade out.
---@type number
LocalLight.zeroPercentDistance = nil

---The quadratic term of the light falloff. This will only be used if fiftyPercentDistance and zeroPercentDistance are not supplied, and allows finer control over light attenuation.
---@type number
LocalLight.quadraticFalloff = 0

---The linear term of the light falloff. This will only be used if fiftyPercentDistance and zeroPercentDistance are not supplied, and allows finer control over light attenuation.
---@type number
LocalLight.linearFalloff = 0

---The constant term of the light falloff. This will only be used if fiftyPercentDistance and zeroPercentDistance are not supplied, and allows finer control over light attenuation.
---@type number
LocalLight.constantFalloff = 1

--- Table structure used by matproxy.Add.
---@class MatProxyData
local MatProxyData = {}

---The name of the material proxy
---@type string
MatProxyData.name = nil

---The function used to get variables from the ".vmt". Called once per each ".vmt". Arguments are: * table self * string materialName * table values
---@type function
MatProxyData.init = nil

---The function used to apply the proxy. This is called every frame while any materials with this proxy are used in world. Arguments are: * table self * string materialName * Entity ent
---@type function
MatProxyData.bind = nil

--- Table structure representing a mesh vertex used by various functions, such as IMesh:BuildFromTriangles and Entity:PhysicsFromMesh and returned by functions such as util.GetModelMeshes and  PhysObj:GetMesh.
---@class MeshVertex
local MeshVertex = {}

---The vertex color. Uses the Color.
---@type table
MeshVertex.color = nil

---The triangles normal required to calculate lighting (Optional).
---@type Vector
MeshVertex.normal = nil

---The triangles tangent. Not used by the `VertexLitGeneric` shader.
---@type Vector
MeshVertex.tangent = nil

---The triangles binormal. Not used by the `VertexLitGeneric` shader.
---@type Vector
MeshVertex.binormal = nil

---The vertex position.
---@type Vector
MeshVertex.pos = nil

---The U texture coordinate.
---@type number
MeshVertex.u = nil

---The V texture coordinate.
---@type number
MeshVertex.v = nil

---The secondary U texture coordinate. Only works when passed to IMesh:BuildFromTriangles, Useful for `LightmappedGeneric` shader.
---@type number
MeshVertex.u1 = nil

---The secondary V texture coordinate. Only works when passed to IMesh:BuildFromTriangles.
---@type number
MeshVertex.v1 = nil

---A table of four numbers. This is used by most shaders in Source to hold tangent information of the vertex ( tangentX, tangentY, tangentZ, tangentHandedness ).
---@type table
MeshVertex.userdata = nil

---
--- Information about the NPC data structure, used to define spawnable NPCs for the Sandbox gamemode.
---
--- Example usage:
--- ```
--- list.Set( "NPC", "npc_tf2_ghost", {
--- 	Name = "Example NPC",
--- 	Class = "npc_tf2_ghost",
--- 	Category = "Nextbot"
--- } )
--- ```
---
---@class NPCData
local NPCData = {}

---The nice name of the NPC for UI display.
---@type string
NPCData.Name = nil

---Class name of the entity to spawn.
---@type string
NPCData.Class = nil

---Spawnmenu category to put the NPCinto.
---@type string
NPCData.Category = "Other"

---A list of weapons this NPC is typically meant to use. One will be picked on spawn at random, unless overwritten by the player.
---@type table
NPCData.Weapons = {}

---Key-value pairs to apply to the NPC on spawn. See Entity:SetKeyValue.
---@type table
NPCData.KeyValues = {}

---Model override for this NPC.
---@type string
NPCData.Model = "nil"

---Additional spawnflags for this NPC. See Entity:GetSpawnFlags. Ignored if `TotalSpawnFlags` key is present.
---@type number
NPCData.SpawnFlags = 0

---Total spawnflags override for this NPC.
---@type number
NPCData.TotalSpawnFlags = nil

---If set to `true`, this NPC can only be spawned on the ceiling. Stacks with `OnFloor`.
---@type boolean
NPCData.OnCeiling = false

---If set to `true`, this NPC can only be spawned on the floor. Stacks with `OnCeiling`.
---@type boolean
NPCData.OnFloor = false

---Offset, in Hammer units, away from the surface where the player is looking at for the NPC spawn position.
---@type number
NPCData.Offset = 0

---Material override for this NPC. See Entity:SetMaterial.
---@type string
NPCData.Material = nil

---Skin override for the NPC. See Entity:SetSkin.
---@type number
NPCData.Skin = nil

---If set to `true`, do not try to teleport the NPC to the ground.
---@type boolean
NPCData.NoDrop = false

---Used to add additional rotation the NPC post spawn. Usually all NPCs would be facing the player on spawn. Value of `Angle( 0, 180, 0 )` would make the NPC face away from the player.
---@type Angle
NPCData.Rotate = Angle(0, 0, 0)

---Health override for this NPC. Also sets Entity:SetMaxHealth.
---@type number
NPCData.Health = nil

---If set, a function to be called when the NPC is pasted using the duplicator library.
---@type function
NPCData.OnDuplicated = nil

--- The structure used by Vehicle:GetOperatingParams.
---@class OperatingParams
local OperatingParams = {}

---The current RPM of the vehicle
---@type number
OperatingParams.RPM = nil

---The current gear of the vehicle, starting from 0
---@type number
OperatingParams.gear = nil

---Is the vehicle boosting?
---@type boolean
OperatingParams.isTorqueBoosting = nil

---The current speed, in inches per second
---@type number
OperatingParams.speed = nil

---Steering angle
---@type number
OperatingParams.steeringAngle = nil

---Wheels on ground
---@type number
OperatingParams.wheelsInContact = nil

--- Structure represents a path segment, returned by PathFollower:GetCurrentGoal, PathFollower:FirstSegment and PathFollower:LastSegment.
---@class PathSegment
local PathSegment = {}

---The navmesh area this segment occupies.
---@type CNavArea
PathSegment.area = nil

---How much of a curve should the bot execute when navigating this segment. 0 = none, 1 = 180°
---@type number
PathSegment.curvature = nil

---Distance of this segment from the start of the path.
---@type number
PathSegment.distanceFromStart = nil

---The direction of travel to reach the end of this segment from the start, represented as a normalised vector.
---@type Vector
PathSegment.forward = nil

---The direction of travel to reach the end of this segment from the start, represented as a cardinal direction integer 0 to 3, or 9 for vertical movement.
---@type number
PathSegment.how = nil

---The navmesh ladder this segment occupies, if any.
---@type CNavLadder
PathSegment.ladder = nil

---Length of this segment.
---@type number
PathSegment.length = nil

---
---@type Vector
PathSegment.m_portalCenter = nil

---
---@type number
PathSegment.m_portalHalfWidth = nil

---The position of the end of this segment.
---@type Vector
PathSegment.pos = nil

---The movement type of this segment, indicating how bots are expected to move along this segment. * 0 is ground movement * 1 is falling down * 2 is climbing up or jumping * 3 is jumping over a gap * 4 is climbing a ladder up (unused) * 5 is climbing a ladder down (unused)
---@type number
PathSegment.type = nil

--- Table used by physenv.SetPerformanceSettings and physenv.GetPerformanceSettings.
---@class PhysEnvPerformanceSettings
local PhysEnvPerformanceSettings = {}

---Maximum amount of seconds to precalculate collisions with objects.
---@type number
PhysEnvPerformanceSettings.LookAheadTimeObjectsVsObject = nil

---Maximum amount of seconds to precalculate collisions with world.
---@type number
PhysEnvPerformanceSettings.LookAheadTimeObjectsVsWorld = nil

---Maximum rotation velocity.
---@type number
PhysEnvPerformanceSettings.MaxAngularVelocity = nil

---Maximum collision checks per tick.
---@type number
PhysEnvPerformanceSettings.MaxCollisionChecksPerTimestep = nil

---Maximum collision per object per tick.
---@type number
PhysEnvPerformanceSettings.MaxCollisionsPerObjectPerTimestep = nil

---Maximum mass of an object to be affected by friction.
---@type number
PhysEnvPerformanceSettings.MaxFrictionMass = nil

---Maximum speed of an object.
---@type number
PhysEnvPerformanceSettings.MaxVelocity = nil

---Minimum mass of an object to be affected by friction.
---@type number
PhysEnvPerformanceSettings.MinFrictionMass = nil

---
--- Structure used in storing/restoring physics object attributes.
--- duplicator.GenericDuplicatorFunction and duplicator.DoGenericPhysics use a table of **PhysicsObjectSave**s with the struct's index in the table being the physics object ID.
---
--- Pos and Angle are set by the following:
---
--- ```
--- Pos, Angle = WorldToLocal(phys:GetPos(), phys:GetAngle(), Vector( 0, 0, 0 ), Angle( 0, 0, 0 ))
--- ```
---
---
---@class PhysicsObjectSave
local PhysicsObjectSave = {}

---The entity's world position made local with Global.WorldToLocal
---@type Vector
PhysicsObjectSave.Pos = nil

---The entity's world angles made local with Global.WorldToLocal
---@type Angle
PhysicsObjectSave.Angle = nil

---Whether the entity is moveable. Equal to (`not` PhysObj:IsMoveable)
---@type boolean
PhysicsObjectSave.Frozen = nil

---Whether the entity's gravity is affected by gravity or not. PhysObj:IsGravityEnabled
---@type boolean
PhysicsObjectSave.NoGrav = nil

---Whether the entity is dormant or not. PhysObj:IsAsleep
---@type boolean
PhysicsObjectSave.Sleep = nil

--- Structure used by construct.SetPhysProp.
---@class PhysProperties
local PhysProperties = {}

---Enables or disables gravity for the entity
---@type boolean
PhysProperties.GravityToggle = nil

---Sets the physics material for the entity
---@type string
PhysProperties.Material = "nil"

---The 'nice' name of the player class for display in User Interface and such.
---@type string
PLAYER.DisplayName = nil

---How fast to move when not running
---@type number
PLAYER.WalkSpeed = 400

---How fast to move when running/sprinting
---@type number
PLAYER.RunSpeed = 600

---How fast to move when slow walking, which is activated via the +WALK keybind.
---@type number
PLAYER.SlowWalkSpeed = 200

---Multiply walk speed by this when crouching
---@type number
PLAYER.CrouchedWalkSpeed = 0.3

---How fast to go from not ducking, to ducking
---@type number
PLAYER.DuckSpeed = 0.3

---How fast to go from ducking, to not ducking
---@type number
PLAYER.UnDuckSpeed = 0.3

---How powerful a jump should be
---@type number
PLAYER.JumpPower = 200

---Can the player use the flashlight
---@type boolean
PLAYER.CanUseFlashlight = true

---Max health we can have
---@type number
PLAYER.MaxHealth = 100

---Max armor the player can have
---@type number
PLAYER.MaxArmor = 0

---How much health we start with
---@type number
PLAYER.StartHealth = 100

---How much armour we start with
---@type number
PLAYER.StartArmor = 0

---Do we drop our weapon when we die
---@type boolean
PLAYER.DropWeaponOnDie = false

---Do we collide with teammates or run straight through them
---@type boolean
PLAYER.TeammateNoCollide = true

---Automatically swerves around other players
---@type boolean
PLAYER.AvoidPlayers = true

---Uses viewmodel hands
---@type boolean
PLAYER.UseVMHands = true

---
--- A structure containing vertex information for use with surface.DrawPoly.
---
--- UV coordinates describe which part of a given texture should be drawn at a vertex - your graphics card's interpolator will fill in space between vertices. UV coords range from `0-1`, with `0` being top/left and `1` being bottom/right. If you're using a texture these are mandatory.
---
--- You must pass a table of tables with this structure to the function. **You need to pass at least 3 points.**
---
--- Your points must be defined in a **clockwise order.** Otherwise, your shape will not render properly.
---
---@class PolygonVertex
local PolygonVertex = {}

---The x coordinate of the vertex.
---@type number
PolygonVertex.x = nil

---The y coordinate of the vertex.
---@type number
PolygonVertex.y = nil

---The u texture coordinate of the vertex. `Can be left blank.`
---@type number
PolygonVertex.u = nil

---The v texture coordinate of the vertex. `Can be left blank.`
---@type number
PolygonVertex.v = nil

--- The structure used by Global.CreateNewAddonPreset.
---@class Preset
local Preset = {}

---A Table containing all enabled addons.
---@type table
Preset.enabled = nil

---A Table containing all disabled addons.
---@type table
Preset.disabled = nil

---The name of the Preset.
---@type string
Preset.name = nil

---What to do with addons not in the preset. Can be `enable`, `disable` or nothing.
---@type string
Preset.newAction = nil

--- Table used by Global.FireProblem function.
---@class Problem
local Problem = {}

---The Problem ID.
---@type string
Problem.id = nil

---The Text to Display.
---@type string
Problem.text = nil

--- The Problem severity.
---@type number
Problem.severity = nil

---The Problem Type. Possible values are: * config * hardware * addons
---@type string
Problem.type = nil

---a Function that fixes the Problem.
---@type function
Problem.fix = nil

--- Structure used for properties.Add.
---@class PropertyAdd
local PropertyAdd = {}

---Can be set to "toggle" to make this property a toggle property.
---@type string
PropertyAdd.Type = "simple"

---Label to show on opened menu
---@type string
PropertyAdd.MenuLabel = nil

---Icon to show on opened menu for this item. Optional for simple properties and unused for toggle properties.
---@type string
PropertyAdd.MenuIcon = nil

---Where in the list should the property be positioned, relative to other properties. For reference, here are the default properties and their Order values: Property | Order | ---------|-------| | Bone Manipulate | 500 | | Bodygroups | 600 | | Skin | 601 | | Keep Upright | 900 | | Ignite/Extinguish | 999 | | Remove | 1000 | | Gravity | 1001 | | Drive | 1100 | | Collision | 1500 | | Statue | 1501 | | NPC Biggify/Smallify | 1799, 1800 | | Motion Control (Kinect) | 2500 | | Editable_Entities | 90001 |
---@type number
PropertyAdd.structureFieldOrder = nil

---Whether to add a spacer before this property. This should generally be true for the first property in a group of properties.
---@type boolean
PropertyAdd.PrependSpacer = false

---Used **clientside** to decide whether this property should be shown for an entity. Gets these arguments: * table self - the property table * Entity ent - the entity the player clicked * Global.LocalPlayer player - the localplayer Return true if the property should be shown for this entity. It's good practice to call SANDBOX:CanProperty in this hook via gamemode.Call or hook.Run.
---@type function
PropertyAdd.Filter = nil

--- Required for toggle properties (clientside). Must return a boolean value to either check or uncheck the toggle property. * table self - the property table * Entity ent - the entity the player clicked * table tr - the player's eye trace
---@type function
PropertyAdd.Checked = nil

--- Called **clientside** when the property is clicked with these arguments: * table self - the property table * Entity ent - the entity the player clicked * table tr - the player's eye trace When appropriate, within this function you can call self:MsgStart(), write data with the net 'Write' functions, and finish with self:MsgEnd(). This will activate the 'Receive' function on the server. In most cases, you will want to send the entity to the server, as it's not done by default.
---@type function
PropertyAdd.Action = nil

--- Called **serverside** if the client sends a message in the 'Action' function (see above). * table self - the property table * number len - the net message length, although this includes the property identifier used internally (the name of the property) * Player ply - the player who clicked the property You can read data received from the client with the net 'Read' functions. It's good practice to check SANDBOX:CanProperty here via gamemode.Call or hook.Run.
---@type function
PropertyAdd.Receive = nil

--- Called **clientside** when the property option has been created in the right-click menu. This is not called for toggle properties! * table self - the property table * DMenuOption option - the menu option * Entity ent - the entity the player right-clicked * table tr - the player's eye trace
---@type function
PropertyAdd.MenuOpen = nil

--- Same as MenuOpen, but also called for toggle properties and has different arguments. This is called immediately after MenuOpen, but nothing happens in between so you should only ever use one or the other. * table self - the property table * DMenu menu - the property menu * DMenuOption option - the menu option
---@type function
PropertyAdd.OnCreate = nil

---
--- Used for cam.Start.
---
--- Unless stated otherwise, the default values for all these keys would be inherited from the engine's current `CViewSetup` and do not have static representations.
---
---@class RenderCamData
local RenderCamData = {}

---The x position of the view port
---@type number
RenderCamData.x = nil

---The y position of the view port
---@type number
RenderCamData.y = nil

---The width of the view port
---@type number
RenderCamData.w = nil

---The height of the view port
---@type number
RenderCamData.h = nil

---The type of cam. Valid types are: * "2D" - No additional arguments are required * "3D" - Only origin and angles are needed, all other parameters are optional.
---@type string
RenderCamData.type = "3D"

---The position to render from
---@type Vector
RenderCamData.origin = nil

---The angles to render from
---@type Angle
RenderCamData.angles = nil

---The field of view
---@type number
RenderCamData.fov = nil

---The aspect ratio of the view port (Note that this is NOT set to w/h by default)
---@type number
RenderCamData.aspect = nil

---The distance to the far clipping plane
---@type number
RenderCamData.zfar = nil

---The distance to the near clipping plane
---@type number
RenderCamData.znear = nil

---Set to true if this is to draw into a subrect of the larger screen.
---@type boolean
RenderCamData.subrect = false

---m_bDoBloomAndToneMapping
---@type boolean
RenderCamData.bloomtone = false

---A table having these keys: ( all floats ) * left * right * bottom * top
---@type table
RenderCamData.offcenter = nil

---If set, makes the view/camera orthogonal. A table having these keys: ( all floats ) * left * right * bottom * top
---@type table
RenderCamData.ortho = nil

--- Used for render.Capture.
---@class RenderCaptureData
local RenderCaptureData = {}

---Format of the capture. Valid formats are: * `jpeg` or `jpg` * `png`
---@type string
RenderCaptureData.format = nil

---X coordinate of the capture origin
---@type number
RenderCaptureData.x = nil

---Y coordinate of the capture origin
---@type number
RenderCaptureData.y = nil

---Width of the capture
---@type number
RenderCaptureData.w = nil

---Height of the capture
---@type number
RenderCaptureData.h = nil

---The quality of the capture. Affects jpeg only.
---@type number
RenderCaptureData.quality = nil

---Set to false to capture an image with alpha channel set to fully opaque. Affects png only.
---@type boolean
RenderCaptureData.alpha = true

--- Used by Entity:GetSequenceInfo.
---@class SequenceInfo
local SequenceInfo = {}

---Name of the sequence.
---@type string
SequenceInfo.label = nil

---Name of the activity this sequence is attached to.
---@type string
SequenceInfo.activityname = nil

---The activity ID associated with this sequence. See Enums/ACT.
---@type number
SequenceInfo.activity = nil

---How likely this sequence is to be picked when playing an activity its attached to. -1 means this is the only sequence for that activity. (needs validation)
---@type number
SequenceInfo.actweight = nil

---The looping and other flags of this sequence.
---@type number
SequenceInfo.flags = nil

---Number of animation events this sequence has.
---@type number
SequenceInfo.numevents = nil

---
---@type number
SequenceInfo.numblends = nil

---Mins part of the bounding box for this sequence
---@type number
SequenceInfo.bbmin = nil

---Maxs part of the bounding box for this sequence
---@type number
SequenceInfo.bbmax = nil

---ideal cross fade in time (0.2 default)
---@type number
SequenceInfo.fadeintime = nil

---ideal cross fade out time (0.2 default)
---@type number
SequenceInfo.fadeouttime = nil

---transition node at entry
---@type number
SequenceInfo.localentrynode = nil

---transition node at exit
---@type number
SequenceInfo.localexitnode = nil

---Transition rules
---@type number
SequenceInfo.nodeflags = nil

---Frame that should generate EndOFSequence
---@type number
SequenceInfo.lastframe = nil

---If non 0, the next sequence for auto advancing sequences
---@type number
SequenceInfo.nextseq = nil

---
---@type number
SequenceInfo.pose = nil

---If non 0, index of pose parameter to be used as cycle index. This means that the sequence playback will be controlled by a pose parameter.
---@type number
SequenceInfo.cycleposeindex = nil

---A 1-based array of all animationIDs associated with this sequence. For use with Entity:GetAnimInfo.
---@type table
SequenceInfo.anims = nil

--- Used for serverlist.Query.
---@class ServerQueryData
local ServerQueryData = {}

---The game directory to get the servers for
---@type string
ServerQueryData.GameDir = "garrysmod"

---Type of servers to retrieve. Valid values are `internet`, `favorite`, `history` and `lan`
---@type string
ServerQueryData.Type = nil

---Steam application ID to get the servers for
---@type number
ServerQueryData.AppID = 4000

---Called when a new server is found and queried. Arguments: number ping - Latency to the server. string name - Name of the server string desc - "Nice" gamemode name string map - Current map number players - Total player number ( bot + human ) number maxplayers - Maximum reported amount of players number botplayers - Amount of bots on the server boolean pass - Whether this server has password or not number lastplayed - Time when you last played on this server, as UNIX timestamp or 0 string address - IP Address of the server string gamemode - Gamemode folder name number workshopid - Gamemode Steam Workshop ID boolean isanon - Is the server signed into an anonymous account? string version - Version number, same format as jit.version_num string localization - Two digit country code, `us` if nil string gmcategory - Category of the gamemode, ex. `pvp`, `pve`, `rp` or `roleplay` Return false to stop the query.
---@type function
ServerQueryData.Callback = nil

--- Called if the query has failed, called with the servers IP Address
---@type function
ServerQueryData.CallbackFailed = nil

---Called when the query is finished. No arguments
---@type function
ServerQueryData.Finished = nil

--- Table used in sound.Add and sound.GetProperties.
---@class SoundData
local SoundData = {}

---Path to the sound file to be used in this sound effect, relative to `sound/` directory (so exclude the `sound/` part). Can be a table of sound files, in which case the sound will be chosen randomly every time from the provided list. Each sound path can be prepended with a special character for special effects. You can learn more about this [here](https://developer.valvesoftware.com/wiki/Soundscripts#Sound_Characters).
---@type string
SoundData.sound = nil

---The name of the soundscript, to be referenced by in functions such as Entity:EmitSound.
---@type string
SoundData.name = nil

---The sound channel to play in. See Enums/CHAN
---@type number
SoundData.channel = nil

---The soundlevel of the sound in dB. See Enums/SNDLVL. This will affect how far the sound can be heard.
---@type number
SoundData.level = nil

---The volume of the sound as a decimal between `0` and `1`. Can be a table of two numbers, a minimum and a maximum value. **Warning:** Volume of `0` will act as volume of `1`
---@type number
SoundData.volume = 1.0

---The pitch of the sound. Can be a table of two numbers, a minimum and a maximum value.
---@type number
SoundData.pitch = 100

---The initial pitch. Deprecated, use pitch.
---@type number
SoundData.pitchstart = nil

---The pitch end. Deprecated, use pitch.
---@type number
SoundData.pitchend = nil

--- Table describing a sound hint, used by NPC:GetBestSoundHint and sound.GetLoudestSoundHint.
---@class SoundHintData
local SoundHintData = {}

---Origin of the sound hint
---@type Vector
SoundHintData.origin = nil

---Owner of the sound hint, if any (emitting entity, like a thumper)
---@type Entity
SoundHintData.owner = nil

---Target of the sound hint, if any
---@type Entity
SoundHintData.target = nil

---Volume of the sound hint
---@type number
SoundHintData.volume = nil

---Enums/SOUND
---@type number
SoundHintData.type = nil

---Global.CurTime based expiration date
---@type number
SoundHintData.expiration = nil

---Does this sound hint expire?
---@type boolean
SoundHintData.expires = nil

---Enums/CHAN
---@type number
SoundHintData.channel = nil

--- Returned by util.GetSunInfo.
---@class SunInfo
local SunInfo = {}

---The suns direction relative to 0,0,0
---@type Vector
SunInfo.direction = nil

---Indicates how obstructed the sun is, 1 not visible, 0 fully visible
---@type number
SunInfo.obstruction = nil

--- Table returned by util.GetSurfaceData.
---@class SurfacePropertyData
local SurfacePropertyData = {}

---The name of the surface property, identical to util.GetSurfacePropName.
---@type string
SurfacePropertyData.name = nil

---How hard a surface is. If this is greater than or equal to another surfaces's hardThreshold, a hard impact sound will be used.
---@type number
SurfacePropertyData.hardnessFactor = nil

---Hardness threshold for impact sounds. HitSurface.hardnessFactor >= InflictorSurface.hardThreshold - hard impact sound (depends on hardVelocityThreshold's value), HitSurface.hardnessFactor < InflictorSurface.hardThreshold - soft impact sound (always).
---@type number
SurfacePropertyData.hardThreshold = nil

---Velocity threshold for impact sounds. impactSpeed >= HitSurface.hardVelocityThreshold - hard impact sound (depends on hardThreshold's value), impactSpeed < HitSurface.hardVelocityThreshold - soft impact sound (always).
---@type number
SurfacePropertyData.hardVelocityThreshold = nil

---Amount of sound reflected from the surface represented as a number 0.0 - 1.0. 0 - no reflection, 1 - fully reflected.
---@type number
SurfacePropertyData.reflectivity = nil

---How rough a surface is. If this is greater than or equal to another surfaces's roughThreshold, a rough scrape sound will be used.
---@type number
SurfacePropertyData.roughnessFactor = nil

---Roughness threshold for friction sounds. HitSurface.roughnessFactor >= InflictorSurface.roughThreshold - rough friction sound, HitSurface.roughnessFactor < InflictorSurface.roughThreshold - soft friction sound.
---@type number
SurfacePropertyData.roughThreshold = nil

---Indicates whether or not the surface is a ladder. Used to detect whether a player is on a ladder. 0 - false, > 0 - true.
---@type number
SurfacePropertyData.climbable = nil

---Scalar multiplier for player jump height - or more accurately, applied z-axis velocity on a surface. For example, 1 - normal jump, 2 - twice as high, and 0.5 - half as high.
---@type number
SurfacePropertyData.jumpFactor = nil

---The surface material. See Enums/MAT.
---@type number
SurfacePropertyData.material = nil

---Scalar multiplier for player speed. Achieves this by multiplying CMoveData:SetMaxSpeed in GM:Move.
---@type number
SurfacePropertyData.maxSpeedFactor = nil

---This is the physical drag on an object when in contact with this surface (0 - x, 0 none to x a lot).
---@type number
SurfacePropertyData.dampening = nil

---Material density in kg / m^3 (water is 1000). If a surface's density is < 1000, it will float in water. This is used to calculate the total mass of an object.
---@type number
SurfacePropertyData.density = nil

---Collision elasticity - used to compute coefficient of restitution represented as a number 0.0 - 1.0. 0.01 is soft, 1.0 is hard.
---@type number
SurfacePropertyData.elasticity = nil

---Physical friction used to slow entities touching the surface represented as a number 0.0 - 1.0. 0.01 is slick, 1.0 is completely rough.
---@type number
SurfacePropertyData.friction = nil

---Material thickness. If this is 0, the material is not volumetrically solid, and thus the object mass will be calculated as "volume * 0.0254^3 * density" where 0.0254 is meters per inch. If non-zero, the mass will be "surfacearea * thickness * 0.0254^3 * density".
---@type number
SurfacePropertyData.thickness = nil

---Sound to play when a prop or func_breakable is broken.
---@type string
SurfacePropertyData.breakSound = nil

---Bullet impact sound with this surface.
---@type string
SurfacePropertyData.bulletImpactSound = nil

---Physical impact sound when hitting surfaces hard.
---@type string
SurfacePropertyData.impactHardSound = nil

---Physical impact sound when hitting surfaces softly.
---@type string
SurfacePropertyData.impactSoftSound = nil

---Unused sound.
---@type string
SurfacePropertyData.rollingSound = nil

---Friction sound when roughly scraping against an entity.
---@type string
SurfacePropertyData.scrapeRoughSound = nil

---Friction sound when smoothly scraping against an entity.
---@type string
SurfacePropertyData.scrapeSmoothSound = nil

---Footstep sound for left foot.
---@type string
SurfacePropertyData.stepLeftSound = nil

---Footstep sound for right foot.
---@type string
SurfacePropertyData.stepRightSound = nil

---Unused sound.
---@type string
SurfacePropertyData.strainSound = nil

---@class SWEP : WEAPON
SWEP = {}

---Entity class name of the SWEP (file or folder name of your SWEP). This is set automatically
---@type string
SWEP.ClassName = nil

---If set, overrides the classname of the SWEP.
---@type string
SWEP.ClassNameOverride = nil

---The spawn menu category that this weapon resides in.
---@type string
SWEP.Category = "Other"

---Whether or not this weapon can be obtained through the spawn menu.
---@type boolean
SWEP.Spawnable = false

---If spawnable, this variable determines whether only administrators can use the button in the spawn menu.
---@type boolean
SWEP.AdminOnly = false

---The name of the SWEP displayed in the spawn menu.
---@type string
SWEP.PrintName = "Scripted Weapon"

---The weapon's base script, relative to `lua/weapons`.
---@type string
SWEP.Base = "weapon_base"

---The deploy speed multiplier. This does not change the internal deployment speed.
---@type number
SWEP.m_WeaponDeploySpeed = 1

--- Deprecated, use Entity:GetOwner() instead.
---@type Entity
SWEP.Owner = nil

---The SWEP's author.
---@type string
SWEP.Author = nil

---The contact information regarding the SWEP's author.
---@type string
SWEP.Contact = nil

---The purpose of the SWEP.
---@type string
SWEP.Purpose = nil

---The instructions regarding the SWEP's usage.
---@type string
SWEP.Instructions = nil

---Relative path to the SWEP's view model.
---@type string
SWEP.ViewModel = "models/weapons/v_pistol.mdl"

---Used primarily for Counter Strike: Source view models, this variable is used to flip them back to normal.
---@type boolean
SWEP.ViewModelFlip = false

---Behaves similarly to `ViewModelFlip`, but for the second view model.
---@type boolean
SWEP.ViewModelFlip1 = false

---Behaves similarly to `ViewModelFlip`, but for the third view model.
---@type boolean
SWEP.ViewModelFlip2 = false

---The field of view percieved whilst wielding this `SWEP`.
---@type number
SWEP.ViewModelFOV = 62

---Relative path to the SWEP's world model.
---@type string
SWEP.WorldModel = "models/weapons/w_357.mdl"

---Whether this weapon can be autoswitched away from when the player runs out of ammo in this weapon or picks up another weapon or ammo
---@type boolean
SWEP.AutoSwitchFrom = true

---Whether this weapon can be autoswitched to when the player runs out of ammo in their current weapon or they pick this weapon up
---@type boolean
SWEP.AutoSwitchTo = true

---Determines the priority of the weapon when autoswitching. The weapon being autoswitched from will attempt to switch to a weapon with the same weight that has ammo, but if none exists, it will prioritise higher weight weapons.
---@type number
SWEP.Weight = 5

---The scale of the viewmodel bob (viewmodel movement from left to right when walking around)
---@type number
SWEP.BobScale = 1

---The scale of the viewmodel sway (viewmodel position lerp when looking around).
---@type number
SWEP.SwayScale = 1

---Should the weapon icon bounce in weapon selection?
---@type boolean
SWEP.BounceWeaponIcon = true

---Should draw the weapon selection info box, containing SWEP.Instructions, etc.
---@type boolean
SWEP.DrawWeaponInfoBox = true

---Should we draw the default HL2 ammo counter?
---@type boolean
SWEP.DrawAmmo = true

---Should we draw the default crosshair?
---@type boolean
SWEP.DrawCrosshair = true

---The SWEP render group, see Enums/RENDERGROUP. If unset, the engine will decide the render group based on the SWEPs world model.
---@type number
SWEP.RenderGroup = nil

---Slot in the weapon selection menu, starts with `0`
---@type number
SWEP.Slot = 0

---Position in the slot, should be in the range `0-128`
---@type number
SWEP.SlotPos = 10

---Internal variable for drawing the info box in weapon selection
---@type number
SWEP.SpeechBubbleLid = surface.GetTextureID("gui/speech_lid")

---Path to an texture. Override this in your SWEP to set the icon in the weapon selection. This must be the texture ID, see surface.GetTextureID. Alternatively you can render custom weapon selection via WEAPON:DrawWeaponSelection.
---@type number
SWEP.WepSelectIcon = surface.GetTextureID("weapons/swep")

---Should we use Counter-Strike muzzle flashes upon firing? This is required for DoD:S or CS:S view models to fix their muzzle flashes.
---@type boolean
SWEP.CSMuzzleFlashes = false

---Use the X shape muzzle flash instead of the default Counter-Strike muzzle flash. Requires Structures/SWEP#CSMuzzleFlashes to be set to true.
---@type boolean
SWEP.CSMuzzleX = false

---Primary attack settings. The table contains these fields: * string `Ammo` - Ammo type (`Pistol`, `SMG1`, etc.) See game.AddAmmoType. * number `ClipSize` - The maximum amount of bullets one clip can hold. Setting it to `-1` means weapon uses no clips, like a grenade or a rocket launch. * number `DefaultClip` - Default ammo in the clip, making it higher than ClipSize will give player additional ammo on spawn * boolean `Automatic` - If true makes the weapon shoot automatically as long as the player has primary attack button held down
---@type table
SWEP.Primary = nil

---Secondary attack settings, has same fields as Primary attack settings
---@type table
SWEP.Secondary = nil

---Makes the player models hands bonemerged onto the view model The gamemode and view models **must** support this feature for it to work! You can find more information here: Using_Viewmodel_Hands
---@type boolean
SWEP.UseHands = false

---The folder from where the weapon was loaded. This should always be "weapons/weapon_myweapon", regardless whether your SWEP is stored as a file, or multiple files in a folder. It is set automatically on load
---@type string
SWEP.Folder = nil

---Makes the default SWEP crosshair be positioned in 3D space where your aim actually is (like on Jeep), instead of simply sitting in the middle of the screen at all times
---@type boolean
SWEP.AccurateCrosshair = false

---Disable the ability for players to duplicate this SWEP
---@type boolean
SWEP.DisableDuplicator = false

---Sets the spawnmenu content icon type for the entity, used by spawnmenu in the Sandbox-derived gamemodes. See spawnmenu.AddContentType for more information.
---@type string
SWEP.ScriptedEntityType = "weapon"

---If set to false, the weapon will not play the weapon pick up sound when picked up.
---@type boolean
SWEP.m_bPlayPickupSound = true

---If set, overrides the icon path to be displayed in the Spawnmenu for this entity.
---@type string
SWEP.IconOverride = "materials/entities/<ClassName>.png"

--- Table is one element from team.GetAllTeams.
---@class TeamData
local TeamData = {}

---Color of the team
---@type table
TeamData.Color = nil

---Whether the team is joinable or not.
---@type boolean
TeamData.Joinable = nil

---Name of the team
---@type string
TeamData.Name = nil

---Score of the team
---@type number
TeamData.Score = nil

--- Used for draw.Text.
---@class TextData
local TextData = {}

---Text to be drawn.
---@type string
TextData.text = nil

---The font to draw with. List of default fonts can be found Default_Fonts.
---@type string
TextData.font = "DermaDefault"

---This holds the X and Y coordinates. Key value 1 is x, key value 2 is y.
---@type table
TextData.pos = nil

---The alignment of the X position. See Enums/TEXT_ALIGN
---@type number
TextData.xalign = TEXT_ALIGN_LEFT

---The alignment of the Y position. See Enums/TEXT_ALIGN
---@type number
TextData.yalign = TEXT_ALIGN_TOP

---The text color
---@type table
TextData.color = color_white

--- Used for draw.TexturedQuad.
---@class TextureData
local TextureData = {}

---surface.GetTextureID number of the texture to be drawn.
---@type number
TextureData.texture = nil

---The x Coordinate.
---@type number
TextureData.x = nil

---The y Coordinate.
---@type number
TextureData.y = nil

---The width of the texture.
---@type number
TextureData.w = nil

---The height of the texture.
---@type number
TextureData.h = nil

---The texture color. See Color.
---@type table
TextureData.color = color_white

---
--- The **TOOL** table is used in Sandbox tool creation. You can find a list of callbacks on the  page and a list of methods on the  page. Do note that some of the fields below have no effect on server-side operations.
---
--- The tool information box drawn on the HUD while your tool is selected has 2 values that are set by language.Add.
--- * `tool.[tool mode].name` - The tool name (Note this is NOT the same as TOOL.Name)
--- * `tool.[tool mode].desc` - The tool description
---
--- Ensure that all tool file names are entirely lowercase.  Including capital letters can lead to unintended behavior.
---
---@class TOOL
TOOL = {}

---If set to false, the tool won't be added to the tool menu and players will have to access it by other means.
---@type boolean
TOOL.AddToMenu = true

---The tool menu category under which the tool should be listed.
---@type string
TOOL.Category = "New Category"

---The console command to execute upon being selected in the Q menu.
---@type string
TOOL.Command = "gmod_toolmode [tool]"

---The name of the tool in the Q menu. Common practice is to set this to "#tool.[lua filename].name" to match the name displayed in the tool information box.
---@type string
TOOL.Name = "#[tool mode]"

---A key-value ( convar name-default value ) table containing the client-side convars to create. All convars will be prefixed with the filename of the tool. You can later use Tool:GetClientNumber or Tool:GetClientInfo to retrieve these values.
---@type table
TOOL.ClientConVar = nil

---Same as above, but created server-side instead.
---@type table
TOOL.ServerConVar = nil

---A key-value ( string name - ConVar object ) table containing the cached convar objected created from `ClientConVar`.
---@type table
TOOL.ClientConVars = nil

---Same as above, but server-side (`ServerConVar`) instead.
---@type table
TOOL.ServerConVars = nil

---The function that is called to build the context menu for your tool. It has one argument, namely the context menu's base panel to which all of your custom panels are going to be parented to. While it might sound like a hook, it isn't - you won't receive a `self` argument inside the function. See TOOL.BuildCPanel.
---@type function
TOOL.BuildCPanel = nil

---Allows you to override the tool usage information shown when the tool is equipped. See Tool Information Display for more information.
---@type table
TOOL.Information = nil

---Class name of the tool. (name of the .lua file) This is set automatically.
---@type string
TOOL.Mode = nil

---The tool tab (spawnmenu.AddToolTab) to add this tool to. (The internal name, first argument)
---@type string
TOOL.Tab = nil

---When enabled the game tries to run the left mouse click as soon as possible
---@type boolean
TOOL.LeftClickAutomatic = false

---When enabled the game tries to run the right mouse click as soon as possible
---@type boolean
TOOL.RightClickAutomatic = false

--- Table returned by Vector:ToScreen.
---@class ToScreenData
local ToScreenData = {}

---The x coordinate on the players screen
---@type number
ToScreenData.x = nil

---The y coordinate on the players screen
---@type number
ToScreenData.y = nil

---The coordinate is not behind the player. **This does not mean the coordinate is on the screen.** When this is false, it means that the coordinate would not be on the screen even if the player had a full 180 degree FOV.
---@type boolean
ToScreenData.visible = nil

--- Table structure used for util.TraceLine.
---@class Trace
local Trace = {}

---The start position of the trace
---@type Vector
Trace.start = VectorVector(0, 0, 0)

---The end position of the trace
---@type Vector
Trace.endpos = VectorVector(0, 0, 0)

---Things the trace should not hit. Can also be a table of entities or a function with one argument: * Entity ent - The entity that the trace hit Return true in the function to hit the entity, false to skip it. Using a function here is super slow - try to avoid it.
---@type Entity
Trace.filter = {}

---The trace mask Enums/MASK. This determines what the trace should hit and what it shouldn't hit. A mask is a combination of Enums/CONTENTS - you can use these for more advanced masks.
---@type number
Trace.mask = MASK_SOLID

---The collision group Enums/COLLISION_GROUP. This determines what the trace should hit in regards to the entity's collision group.
---@type number
Trace.collisiongroup = COLLISION_GROUP_NONE

---Should the trace ignore world or not
---@type boolean
Trace.ignoreworld = false

---If set, the trace result will be written to the supplied table instead of returning a new table
---@type table
Trace.output = nil

--- Table structure used as trace result. Default values are when the trace hits nothing.
---@class TraceResult
local TraceResult = {}

---The entity hit by the trace.
---@type Entity
TraceResult.Entity = NULL

---This indicates the how much of your trace length was used from 0-1 (resultLength/originalLength).
---@type number
TraceResult.Fraction = 1

---Given the trace started in a solid enviroment, this will return at what distance the trace left the solid from 0-1. Doesn't work if the trace hit a non-worldspawn entity.
---@type number
TraceResult.FractionLeftSolid = 0

---Indicates whether the trace hit something.
---@type boolean
TraceResult.Hit = false

---The ID of the hitbox hit by the trace.
---@type number
TraceResult.HitBox = 0

---Enums/HITGROUP describing what hitgroup the trace hit (not the same as HitBox).
---@type number
TraceResult.HitGroup = 0

---Indicates whenever the trace hit a no-draw brush.
---@type boolean
TraceResult.HitNoDraw = false

---Indicates whenever the trace did not hit the world.
---@type boolean
TraceResult.HitNonWorld = false

---The direction of the surface that was hit as a normal vector (vector with Vector:Length of 1).
---@type Vector
TraceResult.HitNormal = VectorGlobal.Vector(0, 0, 0)

---The position the trace stopped. This will be the provided endpos if the trace hit nothing.
---@type Vector
TraceResult.HitPos = nil

---Indicates whenever the trace hit the sky.
---@type boolean
TraceResult.HitSky = false

---The surface material (not texture) of whatever the trace hit. Will be `**displacement**` if the trace hit a displacement, and `**studio**` if it hit a prop.
---@type string
TraceResult.HitTexture = "** empty **"

---Indicates whenever the trace hit the world.
---@type boolean
TraceResult.HitWorld = false

---Enums/MAT of the material hit by the trace.
---@type number
TraceResult.MatType = 0

---The direction of the trace as a normal vector (vector with Vector:Length of 1). Equivalent to: `( traceRes.HitPos - traceRes.StartPos ):Normalize()`
---@type Vector
TraceResult.Normal = nil

---The PhysObj ID that was hit. Used for Entity:GetPhysicsObjectNum.
---@type number
TraceResult.PhysicsBone = 0

---The origin of the trace. Will match the provided startpos.
---@type Vector
TraceResult.StartPos = nil

---ID of hit surface property from `scripts/surfaceproperties.txt`. You can get the name using util.GetSurfacePropName. Used for CEffectData:SetSurfaceProp.
---@type number
TraceResult.SurfaceProps = 0

---Indicates whenever the trace started in a solid enviroment.
---@type boolean
TraceResult.StartSolid = false

---True if the entire trace is inside a solid.
---@type boolean
TraceResult.AllSolid = false

---The surface flags of the hit surface. See Enums/SURF.
---@type number
TraceResult.SurfaceFlags = 0

---The displacement flags of the hit surface. See Enums/DISPSURF.
---@type number
TraceResult.DispFlags = 0

---The contents of the hit surface. See Enums/CONTENTS.
---@type number
TraceResult.Contents = nil

--- Table structure used by steamworks.FileInfo.
---@class UGCFileInfo
local UGCFileInfo = {}

---The Workshop item ID
---@type number
UGCFileInfo.id = nil

---The title of the Workshop item
---@type string
UGCFileInfo.title = nil

---The description of the Workshop item
---@type string
UGCFileInfo.description = nil

---The internal File ID of the workshop item, if any
---@type number
UGCFileInfo.fileid = nil

---The internal File ID of the workshop item preview, if any
---@type number
UGCFileInfo.previewid = nil

---A URL to the preview image of the workshop item
---@type string
UGCFileInfo.previewurl = nil

---The SteamID64 of the original uploader of the addon
---@type number
UGCFileInfo.owner = nil

---Unix timestamp of when the item was created
---@type number
UGCFileInfo.created = nil

---Unix timestamp of when the file was last updated
---@type number
UGCFileInfo.updated = nil

---Whether the file is banned or not
---@type boolean
UGCFileInfo.banned = nil

---Comma (,) separated list of tags, may be truncated to some length
---@type string
UGCFileInfo.tags = nil

---File size of the workshop item contents
---@type number
UGCFileInfo.size = nil

---Filesize of the preview file
---@type number
UGCFileInfo.previewsize = nil

---If the addon is subscribed, this value represents whether it is installed on the client and its files are accessible, false otherwise.
---@type boolean
UGCFileInfo.installed = nil

---If the addon is subscribed, this value represents whether it is disabled on the client, false otherwise.
---@type boolean
UGCFileInfo.disabled = nil

---A list of child Workshop Items for this item. For collections this will be sub-collections, for workshop items this will be the items they depend on.
---@type table
UGCFileInfo.children = nil

---We advise against using this. It may be changed or removed in a future update. The "nice" name of the Uploader, or "Unnammed Player" if we failed to get the data for some reason. Do not use this field as it will most likely not be updated in time. Use steamworks.RequestPlayerInfo instead.
---@type string
UGCFileInfo.ownername = nil

---If this key is set, no other data will be present in the response. Values above 0 represent Steam Error codes, values below 0 mean the following: * -1 means Failed to create query * -2 means Failed to send query * -3 means Received 0 or more than 1 result * -4 means Failed to get item data from the response * -5 means Workshop item ID in the response is invalid * -6 means Workshop item ID in response is mismatching the requested file ID
---@type number
UGCFileInfo.error = nil

---Number of "up" votes for this item.
---@type number
UGCFileInfo.up = nil

---Number of "down" votes for this item.
---@type number
UGCFileInfo.down = nil

---Number of total votes (up and down) for this item. This is NOT `up - down`.
---@type number
UGCFileInfo.total = nil

---The up down vote ratio for this item, i.e. `1` is when every vote is `up`, `0.5` is when half of the total votes are the up votes, etc.
---@type number
UGCFileInfo.score = nil

--- Table structure used by undo.Do_Undo and GM:CanUndo.
---@class Undo
local Undo = {}

---The player responsible who owns the undo
---@type Player
Undo.Owner = nil

---The name of the text to report to the player
---@type string
Undo.Name = nil

---A table of entities to be removed by the undo
---@type table
Undo.Entities = nil

---A table of {function_to_call, func_arg2, func_arg3}
---@type table
Undo.Functions = nil

---A custom undo text to show the client
---@type string
Undo.CustomUndoText = nil

---A "nice" name of the undo, which will be used for the UI
---@type string
Undo.NiceName = nil

--- The structure used by Vehicle:SetVehicleParams and Vehicle:GetVehicleParams.
---@class VehicleParams
local VehicleParams = {}

---Wheels per axle
---@type number
VehicleParams.wheelsPerAxle = nil

---Number of axles
---@type number
VehicleParams.axleCount = nil

---A table of Structures/VehicleParamsAxle tables.
---@type table
VehicleParams.axles = nil

---See Structures/VehicleParamsBody
---@type table
VehicleParams.body = nil

---See Structures/VehicleParamsEngine
---@type table
VehicleParams.engine = nil

---See Structures/VehicleParamsSteering
---@type table
VehicleParams.steering = nil

--- The structure used by Structures/VehicleParams.
---@class VehicleParamsAxle
local VehicleParamsAxle = {}

---
---@type number
VehicleParamsAxle.brakeFactor = nil

---
---@type Vector
VehicleParamsAxle.offset = nil

---
---@type Vector
VehicleParamsAxle.raytraceCenterOffset = nil

---
---@type Vector
VehicleParamsAxle.raytraceOffset = nil

---
---@type number
VehicleParamsAxle.suspension_maxBodyForce = nil

---
---@type number
VehicleParamsAxle.suspension_springConstant = nil

---
---@type number
VehicleParamsAxle.suspension_springDamping = nil

---
---@type number
VehicleParamsAxle.suspension_springDampingCompression = nil

---
---@type number
VehicleParamsAxle.suspension_stabilizerConstant = nil

---
---@type number
VehicleParamsAxle.torqueFactor = nil

---
---@type Vector
VehicleParamsAxle.wheelOffset = nil

---Material index of braking material of the wheels. Upon braking, the wheels will be set to this material.
---@type number
VehicleParamsAxle.wheels_brakeMaterialIndex = nil

---
---@type number
VehicleParamsAxle.wheels_damping = nil

---
---@type number
VehicleParamsAxle.wheels_frictionScale = nil

---
---@type number
VehicleParamsAxle.wheels_inertia = nil

---Mass of each wheel.
---@type number
VehicleParamsAxle.wheels_mass = nil

---Material index of the wheels by default.
---@type number
VehicleParamsAxle.wheels_materialIndex = nil

---Radius of the wheels.
---@type number
VehicleParamsAxle.wheels_radius = nil

---
---@type number
VehicleParamsAxle.wheels_rotdamping = nil

---Material index of skid material of the wheels. Upon skidding ( pressing Space and sliding the vehicle ), the wheels will be set to this material.
---@type number
VehicleParamsAxle.wheels_skidMaterialIndex = nil

---
---@type number
VehicleParamsAxle.wheels_springAdditionalLength = nil

--- The structure used by Structures/VehicleParams.
---@class VehicleParamsBody
local VehicleParamsBody = {}

---Additional gravity to be applied to the vehicle
---@type number
VehicleParamsBody.addGravity = nil

---
---@type number
VehicleParamsBody.counterTorqueFactor = nil

---
---@type number
VehicleParamsBody.keepUprightTorque = nil

---Mass center override
---@type Vector
VehicleParamsBody.massCenterOverride = nil

---Mass override
---@type number
VehicleParamsBody.massOverride = nil

---Maximum angular velocity
---@type number
VehicleParamsBody.maxAngularVelocity = nil

---
---@type number
VehicleParamsBody.tiltForce = nil

---
---@type number
VehicleParamsBody.tiltForceHeight = nil

--- The structure used by Structures/VehicleParams.
---@class VehicleParamsEngine
local VehicleParamsEngine = {}

---
---@type number
VehicleParamsEngine.autobrakeSpeedFactor = nil

---
---@type number
VehicleParamsEngine.autobrakeSpeedGain = nil

---This acts as the final ratio of the gearbox. It's like a master coefficient of the gearbox.
---@type number
VehicleParamsEngine.axleRatio = nil

---Amount of seconds between being able to use the boost ( by pressing Shift key by default )
---@type number
VehicleParamsEngine.boostDelay = nil

---Duration of the boost in seconds
---@type number
VehicleParamsEngine.boostDuration = nil

---
---@type number
VehicleParamsEngine.boostForce = nil

---Maximum speed while boosting The Vehicle:SetVehicleParams function takes this in **miles per hour**, but Vehicle:GetVehicleParams returns this in **hammer units per second**! In this case HU = inches, so 1 MPH is 17.6 HU/s.
---@type number
VehicleParamsEngine.boostMaxSpeed = nil

---Amount of gears this vehicle has.
---@type number
VehicleParamsEngine.gearCount = nil

---A table of numbers, of gear rations. Table length is equal to "gearCount" member of this table.
---@type table
VehicleParamsEngine.gearRatio = nil

---The HP amount of the vehicle This value is used to calculate the effectively applied torque, along with ratios and `maxRPM`.
---@type number
VehicleParamsEngine.horsepower = nil

---If `true`, the gearbox shifts gears, if `false` the gearbox stays stuck to the 1st gear (gear number 0).
---@type boolean
VehicleParamsEngine.isAutoTransmission = nil

---Maximum RPM of the vehicle. Despite this being a maximum value, the vehicle can exceed it. Attempts to exceed the max RPM will force the active gear ratio to be that of the 1st gear, which will provide even more torque. This is the opposite of a rev limiter. This value is only used for the calculation of the effectively applied torque.
---@type number
VehicleParamsEngine.maxRPM = nil

---Maximum reverse speed of the vehicle The Vehicle:SetVehicleParams function takes this in **miles per hour**, but Vehicle:GetVehicleParams returns this in **hammer units per second**! In this case HU = inches, so 1 MPH is 17.6 HU/s.
---@type number
VehicleParamsEngine.maxRevSpeed = nil

---Maximum forward going speed of the vehicle without boosting The Vehicle:SetVehicleParams function takes this in **miles per hour**, but Vehicle:GetVehicleParams returns this in **hammer units per second**! In this case HU = inches, so 1 MPH is 17.6 HU/s.
---@type number
VehicleParamsEngine.maxSpeed = nil

---Amount of RPM to automatically shift one gear down
---@type number
VehicleParamsEngine.shiftDownRPM = nil

---Amount of RPM to automatically shift one gear up
---@type number
VehicleParamsEngine.shiftUpRPM = nil

---
---@type number
VehicleParamsEngine.throttleTime = nil

---
---@type boolean
VehicleParamsEngine.torqueBoost = nil

--- The structure used by Structures/VehicleParams.
---@class VehicleParamsSteering
local VehicleParamsSteering = {}

---
---@type number
VehicleParamsSteering.boostSteeringRateFactor = nil

---
---@type number
VehicleParamsSteering.boostSteeringRestRateFactor = nil

---
---@type number
VehicleParamsSteering.brakeSteeringRateFactor = nil

---The maximum angle at which the vehicle can turn while boosting
---@type number
VehicleParamsSteering.degreesBoost = nil

---The maximum angle at which the vehicle can turn while moving at max speed and not boosting
---@type number
VehicleParamsSteering.degreesFast = nil

---The maximum angle at which the vehicle can turn while moving slowest
---@type number
VehicleParamsSteering.degreesSlow = nil

---Disabled in Garry's Mod. In Half-Life 2: Episode 2 this dictates whether the vehicle should leave wheel dust effects when driving around
---@type boolean
VehicleParamsSteering.dustCloud = nil

---Whether the vehicle is allowed to skid/drift
---@type boolean
VehicleParamsSteering.isSkidAllowed = nil

---In Hammer Units
---@type number
VehicleParamsSteering.powerSlideAccel = nil

---
---@type number
VehicleParamsSteering.speedFast = nil

---
---@type number
VehicleParamsSteering.speedSlow = nil

---
---@type number
VehicleParamsSteering.steeringExponent = nil

---
---@type number
VehicleParamsSteering.steeringRateFast = nil

---
---@type number
VehicleParamsSteering.steeringRateSlow = nil

---
---@type number
VehicleParamsSteering.steeringRestRateFast = nil

---
---@type number
VehicleParamsSteering.steeringRestRateSlow = nil

---
---@type number
VehicleParamsSteering.throttleSteeringRestRateFactor = nil

---
---@type number
VehicleParamsSteering.turnThrottleReduceFast = nil

---
---@type number
VehicleParamsSteering.turnThrottleReduceSlow = nil

---
--- Table structure passed to SANDBOX:PlayerSpawnVehicle, describing a spawnable Vehicle in Sandbox gamemode.
---
--- Example usage in defined a custom spawnable vehicle:
--- ```
--- list.Set( "Vehicles", "Jeep", {
--- 	-- Required information
--- 	Name = "Jeep",
--- 	Model = "models/buggy.mdl",
--- 	Class = "prop_vehicle_jeep_old",
--- 	Category = "Half-Life 2",
---
--- 	-- Optional information
--- 	Author = "VALVe",
--- 	Information = "The regular old jeep",
---
--- 	KeyValues = {
--- 		vehiclescript = "scripts/vehicles/jeep_test.txt"
--- 	}
--- } )
--- ```
---
---@class VehicleTable
local VehicleTable = {}

---Entity class name for this vehicle.
---@type string
VehicleTable.Class = nil

---Nice name for this vehicle, for UI purposes.
---@type string
VehicleTable.Name = nil

---Model of the vehicle.
---@type string
VehicleTable.Model = nil

---A list of key-value pairs to apply to the vehicle entity. Possible valid keys that can be set are: * `vehiclescript` * `limitview` * `vehiclelocked` * `cargovisible` * `enablegun`
---@type table
VehicleTable.KeyValues = nil

---Offset away the surface player is looking at to spawn at.
---@type number
VehicleTable.Offset = nil

---Set these members on the spawned vehicle's table (Entity:GetTable) to given values.
---@type table
VehicleTable.Members = nil

---Author of the vehicle, for UI purposes.
---@type string
VehicleTable.Author = nil

---Category of this vehicle, for UI purposes.
---@type string
VehicleTable.Category = "Other"

---A small description of the vehicle, for UI purposes.
---@type string
VehicleTable.Information = nil

--- Table structure used by video.Record.
---@class VideoData
local VideoData = {}

---The video container format. Valid options are: `webm`, `ogg`
---@type string
VideoData.container = nil

---The video codec. Valid options are: `vp8`, `theora`
---@type string
VideoData.video = nil

---The audio codec. Valid options are: `vorbis`
---@type string
VideoData.audio = nil

---The video quality
---@type number
VideoData.quality = nil

---The record bitrate
---@type number
VideoData.bitrate = nil

---Frames per second
---@type number
VideoData.fps = nil

---Lock the frame count per second
---@type boolean
VideoData.lockfps = nil

---The file name for the video
---@type string
VideoData.name = nil

---The videos width
---@type number
VideoData.width = nil

---The videos height
---@type number
VideoData.height = nil

---
--- Table structure used for render.RenderView.
---
--- Unless stated otherwise, the default values for all these keys would be inherited from the engine's CViewSetup and do not have static representations.
---
---@class ViewData
local ViewData = {}

---The view's original position
---@type Vector
ViewData.origin = nil

---The view's angles
---@type Angle
ViewData.angles = nil

---Default width divided by height. Has a deprecated alias `aspectratio`.
---@type number
ViewData.aspect = nil

---The x position of the viewport to render in
---@type number
ViewData.x = nil

---The y position of the viewport to render in
---@type number
ViewData.y = nil

---The width of the viewport to render in
---@type number
ViewData.w = nil

---The height of the viewport to render in
---@type number
ViewData.h = nil

---Draw the HUD and call the hud painting related hooks
---@type boolean
ViewData.drawhud = false

---Draw monitors
---@type boolean
ViewData.drawmonitors = false

---The weapon's viewmodel
---@type boolean
ViewData.drawviewmodel = true

---The viewmodel's FOV
---@type number
ViewData.viewmodelfov = nil

---The main view's FOV
---@type number
ViewData.fov = nil

---If set, renders the view orthogonally. A table with these keys: * left * right * top * bottom
---@type table
ViewData.ortho = nil

---Coordinate for the left clipping plane. Requires `ortho` to be set to `true`. **Deprecated**: Use `ortho` table instead!
---@type number
ViewData.ortholeft = nil

---Coordinate for the right clipping plane. Requires `ortho` to be set to `true`. **Deprecated**: Use `ortho` table instead!
---@type number
ViewData.orthoright = nil

---Coordinate for the top clipping plane. Requires `ortho` to be set to `true`. **Deprecated**: Use `ortho` table instead!
---@type number
ViewData.orthotop = nil

---Coordinate for the bottom clipping plane. Requires `ortho` to be set to `true`. **Deprecated**: Use `ortho` table instead!
---@type number
ViewData.orthobottom = nil

---The distance of the view's origin to the near clipping plane
---@type number
ViewData.znear = nil

---The distance of the view's origin to the far clipping plane
---@type number
ViewData.zfar = nil

---The distance of the view's origin to the near clipping plane for the viewmodel
---@type number
ViewData.znearviewmodel = nil

---The distance of the view's origin to the far clipping plane for the viewmodel
---@type number
ViewData.zfarviewmodel = nil

--- Currently works identically to the "bloomtone" option (it also overrides it if you set this to false).
---@type boolean
ViewData.dopostprocess = false

---Disables default engine bloom and pauses the "brightness changes" on HDR maps.
---@type boolean
ViewData.bloomtone = true

---This is identifying which logical part of the scene an entity is being redered in, see Enums/VIEW.
---@type number
ViewData.viewid = 0

---This allows you to "zoom in" on a part of the screen - for example, the top-left quarter of the screen. This is similar to how [poster splits the screen](https://garry.blog/poster-screenshots/) into separate renders. It's a table with 4 keys, controlling what portion of the screen to draw: * left - where the left edge starts. Natural value is 0. * right - where the right edge ends. Natural value is equal to w (the width of the viewport). * top - where the `bottom` edge starts. Natural value is 0. * bottom - where the `top` edge ends. Natural value is equal to h (the height of the viewport). Note that top and bottom are reversed. Values outside the viewport are allowed, but not recommended - instead you should increase the view FOV.
---@type table
ViewData.offcenter = nil

---
--- Table structure used for render.GetViewSetup.
---
---@class ViewSetup
local ViewSetup = {}

---The view's origin/position
---@type Vector
ViewSetup.origin = nil

---The view's angles
---@type Angle
ViewSetup.angles = nil

---Width divided by height
---@type number
ViewSetup.aspect = nil

---The x position of the viewport
---@type number
ViewSetup.x = nil

---The y position of the viewport
---@type number
ViewSetup.y = nil

---The width of the viewport
---@type number
ViewSetup.width = nil

---The height of the viewport
---@type number
ViewSetup.height = nil

---The main view's FOV, adjusted for aspect ratio.
---@type number
ViewSetup.fov = nil

---The main view's FOV as the user setting.
---@type number
ViewSetup.fov_unscaled = nil

---The viewmodel's FOV, adjusted for aspect ratio.
---@type number
ViewSetup.fovviewmodel = nil

---The viewmodel's FOV as the user setting.
---@type number
ViewSetup.fovviewmodel_unscaled = nil

---If the current view is orthogonal, a table with these keys: * left * right * top * bottom Will not be present if view is not orthagonal.
---@type table
ViewSetup.ortho = nil

---The distance of the view's origin to the near clipping plane
---@type number
ViewSetup.znear = nil

---The distance of the view's origin to the far clipping plane
---@type number
ViewSetup.zfar = nil

---The distance of the view's origin to the near clipping plane for the viewmodel
---@type number
ViewSetup.znearviewmodel = nil

---The distance of the view's origin to the far clipping plane for the viewmodel
---@type number
ViewSetup.zfarviewmodel = nil

---Whether default engine bloom and tonemapping are enabled at this instant for this view.
---@type boolean
ViewSetup.bloomtone = nil

---Whether `m_bRenderToSubrectOfLargerScreen` if set for this view.
---@type boolean
ViewSetup.subrect = nil

--- It's a table with 4 keys, controlling what portion of the screen to draw: * left - where the left edge starts. Natural value is 0. * right - where the right edge ends. Natural value is equal to w (the width of the viewport). * top - where the `bottom` edge starts. Natural value is 0. * bottom - where the `top` edge ends. Natural value is equal to h (the height of the viewport). Note that top and bottom are reversed. This will not be present if offscreen rendering is not enabled for this view. See Structures/ViewData for more info.
---@type table
ViewSetup.offcenter = nil
