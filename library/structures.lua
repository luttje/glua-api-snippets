---@meta

---@class AmmoData
---@field dmgtype number Damage type using Enums/DMG.  Related function is game.GetAmmoDamageType.
---@field force number The force of the ammo.  Related function is game.GetAmmoForce.
---@field maxsplash number The maximum water splash size.
---@field minsplash number The minimum water splash size.
---@field name string Name of the ammo.  Related functions are game.GetAmmoName and game.GetAmmoID.
---@field npcdmg number The damage dealt to NPCs.  Related function is game.GetAmmoNPCDamage.  Can also be a string pointing to a convar. The value will automatically update with the convar's. 
---@field plydmg number The damage dealt to players.  Related function is game.GetAmmoPlayerDamage.  Can also be a string pointing to a convar. The value will automatically update with the convar's.
---@field tracer number Tracer type using Enums/TRACER.
---@field maxcarry number Maximum amount of ammo of this type the player should be able to carry in reserve. `-2` makes this ammo type infinite.  Related function is game.GetAmmoMax.  Can also be a string pointing to a convar. The value will automatically update with the convar's. `gmod_maxammo` convar will override this value if set to above 0, **which it is by default**.
---@field flags number Flags for the ammo type using Enums/AMMO.
local AmmoData = {}

---@class AngPos
---@field Ang Angle Angle object
---@field Pos Vector Vector object
local AngPos = {}

---@class AnimationData
---@field StartTime number The system time value returned by Global.SysTime when the animation starts/will start.
---@field EndTime number The system time value returned by Global.SysTime when the animation ends/will end.
---@field Ease number The ease in/out level of the animation.
---@field OnEnd function The callback function that will be called upon completion of the animation. The arguments passed to it are: * table animData - This structure. * Panel tgtPanel - The panel the animation was run on.
---@field Think function The `think` function called every frame that will animate the panel object. This varies based on the animation. You can create a custom function for this if you aren't using the stock panel methods. The arguments passed to it are: * table animData - This structure. * Panel tgtPanel - The panel the animation is being run on. * number fraction - The progress fraction of the animation, between 0 and 1. The change rate of this number will not be linear if you are easing.
---@field Pos Vector The target position, or target translation of the panel object. Used by Panel:MoveTo and Panel:MoveBy respectively.
---@field StartPos Vector The position of the panel object when the animation started. Used by Panel:MoveTo and Panel:MoveBy.
---@field SizeX boolean Whether to resize the panel horizontally or not. Only used by Panel:SizeTo.
---@field SizeY boolean Whether to resize the panel vertically or not. Only used by Panel:SizeTo.
---@field Size Vector The target size of the panel object. Only used by Panel:SizeTo.
---@field StartSize Vector The size of the panel object when the animation started. Only used by Panel:SizeTo.
---@field Color table The target colour of the panel object. Only used by Panel:ColorTo.
---@field StartColor table The colour of the panel object when the animation started. Only used by Panel:ColorTo.
---@field Alpha number The target alpha (0-255) of the panel object. Only used by Panel:AlphaTo.
---@field StartAlpha number The alpha (0-255) of the panel object when the animation started. Only used by Panel:AlphaTo.
---@field Speed number The speed to use for transitions when using linear interpolation (Lerp) animations. Only used by Panel:LerpPositions.
---@field UseGravity boolean Whether or not to use easing to make the panel 'jump' at its target, slowing as it approaches. Only used by Panel:LerpPositions.
local AnimationData = {}

---@class AttachmentData
---@field id number Index of the attachment.
---@field name string Name of the attachment.
local AttachmentData = {}

---@class BodyGroupData
---@field id number Index of the body group.
---@field name string Name of the body group.
---@field num number Amount of subgroups.
---@field submodels table A zero-indexed table that is of length _num_ with values being the name of the smd mesh file of the respective body group value.
local BodyGroupData = {}

---@class BoneManipulationData
---@field s Vector The entity's scale manipulation of the bone
---@field a Angle The entity's angle manipulation of the bone
---@field p Vector The entity's position manipulation of the given bone
local BoneManipulationData = {}

---@class Bullet
---@field Attacker Entity The entity that should be reported as attacker eg. a player  By default this would be set to the entity Entity:FireBullets is called on.
---@field Callback function Function to be called **after** the bullet was fired but **before** the damage is applied (the callback is called even if no damage is applied). The arguments are: * Entity attacker * table tr - See Structures/TraceResult * CTakeDamageInfo dmgInfo
---@field Damage number The damage dealt by the bullet.  If set to `0`, it means the damage should be calculated from the ammo type's ConVars if  the ammo type has `AMMO_INTERPRET_PLRDAMAGE_AS_DAMAGE_TO_PLAYER` flag set.   See Structures/AmmoData. 
---@field Force number The force of the bullets
---@field Distance number Maximum distance the bullet can travel
---@field HullSize number The hull size of the bullet
---@field Num number The amount of bullets to fire
---@field Tracer number Show tracer for every x bullets
---@field AmmoType string The ammunition name
---@field TracerName string The tracer name. You can find a list of default effects Effects.
---@field Dir Vector The fire direction
---@field Spread Vector The spread, only x and y are needed
---@field Src Vector The position to fire the bullets from
---@field IgnoreEntity Entity The entity that the bullet will ignore when it will be shot.
local Bullet = {}

---@class CamData
---@field origin Vector The camera's position
---@field angles Angle The camera's angles
---@field fov number The camera's FOV
---@field znear number Distance to near clipping plane
---@field zfar number Distance to far clipping plane
---@field drawviewer boolean Set true to draw local players player model.
---@field ortho table If set, enables orthographic mode. The table has following arguments: * number left * number right * number top * number bottom  Each describes where their border starts, (`left`+`right`) and (`top`+`bottom`) should equal `0` to center on the view position. 
local CamData = {}

---@class CollisionData
---@field HitPos Vector The collision position
---@field HitEntity Entity The other collision entity
---@field OurOldVelocity Vector The entity's velocity before the collision
---@field HitObject PhysObj Other entity's physics object
---@field DeltaTime number Time since the last collision with the `HitEntity`
---@field TheirOldVelocity Vector Speed of the other entity before the collision
---@field Speed number The speed of the entity before the collision
---@field HitNormal Vector Normal of the surface that hit the other entity
---@field PhysObject PhysObj Entity's physics object
---@field OurSurfaceProps number Surface Property ID of `this` entity
---@field TheirSurfaceProps number Surface Property ID of the entity we collided with
---@field HitSpeed Vector The speed at which the impact happened
---@field OurNewVelocity Vector Our new velocity after the impact
---@field TheirNewVelocity Vector The new velocity after the impact of the entity we collided with
---@field OurOldAngularVelocity Vector Old angular velocity of this entity
---@field TheirOldAngularVelocity Vector Old angular velocity of the entity we collided with
local CollisionData = {}

---@class Color
---@field r number The red channel
---@field g number The green channel
---@field b number The blue channel
---@field a number The alpha channel
local Color = {}

---@class CreationMenus
---@field Function function The function used to generate the content of the tab.
---@field Icon string The icon material that will accompany the title of the tab.
---@field Order number The order in which a tab will be displayed relative to the other tabs.
---@field Tooltip string The tooltip to be shown with the tab.
local CreationMenus = {}

---@class DateData
---@field day number Day of the month
---@field hour number Hour
---@field isdst boolean Daylight saving enabled
---@field min number Minute
---@field month number Month January: 1, December: 12
---@field sec number Second
---@field wday number Day of the week Sunday: 1, Saturday: 7
---@field yday number Day of the year
---@field year number Year
local DateData = {}

---@class DebugInfo
---@field func function Reference to the function that was passed in. If a stack level was specified, this will be the function at that stack level. 0 = debug.getinfo, 1 = function that called debug.getinfo, etc.  **Option: f**
---@field linedefined number The line where the function definiton starts (where "function" is located).  **Option: S**
---@field lastlinedefined number The line the function definition ended (where "end" is located).  **Option: S**
---@field source string The path to the file where the passed function is defined prepended by an @ (ex. "@lua/autorun/mytestfile.lua"). This will be the Global.CompileString or Global.RunString identifier if the function wasn't defined in a file, also prepended by an @.  **Option: S**
---@field short_src string The shortened name of the source (without the @). May be truncated if the source path is long.  **Option: S**
---@field what string The language used. Either "Lua" or "C".  **Option: S**
---@field currentline number The current line. This will be -1 if the code is not executed from a file.  **Option: l** (lowercase L)
---@field name string The function name. This will be nil if the name cannot be found. Only works if stack level is passed rather than function pointer.  **Option: n**
---@field namewhat string The function "type". This will be "global", "local", "method", "field". Can also be an empty string if the function name could not be found. Only works if stack level is passed rather than function pointer.  **Option: n**
---@field isvararg boolean Whether the function is variadic (has a `...` argument).  **Option: u**
---@field nparams number The number of arguments the function uses excluding varargs.  **Option: u**
---@field nups number Upvalue count. Max index that can be used with debug.getupvalue. C functions can have upvalues but they cannot be accessed from Lua.  **Option: u**
---@field activelines table A table of all the active lines in the function - that is, lines with code that actually does something (not blank lines or lines with comments only).  The table keys will be line numbers, and their values will all be true. Lines that are inactive are simply not included in the table - they have the value nil.  It doesn't check for activeline in subfunctions.  **Option: L**
local DebugInfo = {}

---@class DynamicLight
---@field brightness number The brightness of the light.
---@field decay number Fade out speed. Here's a formula for calculating Decay for your light: 1000 / fadeOutTimeInSeconds. For example setting decay to 1000 would fade out the light in 1 second, 2000 - 0.5 seconds.
---@field dietime number Time after which light will be removed.  This is relative to Global.CurTime. If you put in a value that is less than or equal to Global.CurTime, the light will not behave properly.  Note, that it does not affect fading out. Light will be removed regardless of it being fully faded out or not.
---@field dir Vector The light direction. Used with **InnerAngle** and **OuterAngle**.
---@field innerangle number The closer this is to zero, the smoother the light will be. Requires **Dir** and **OuterAngle** to be set.
---@field outerangle number The angle of the Dynamic Light. Requires **Dir** to be set.
---@field key number Makes the light brighter and flicker? Changing the value does not seem to affect anything.
---@field minlight number Minimum light
---@field noworld boolean Don't light the world. Has no effect for elights since they never light the world.
---@field nomodel boolean Don't light models
---@field pos Vector Position of the light
---@field size number Radius of the light
---@field style number Flicker style, see [this page](https://developer.valvesoftware.com/wiki/Light_dynamic#Appearances) for examples.
---@field b number The blue part of the color
---@field g number The green part of the color
---@field r number The red part of the color
local DynamicLight = {}

---@class EmitSoundInfo
---@field SoundName string The file path of the played sound.  Sounds prefixed with ) tell the sound engine that it is a spatial sound; this allows the sound to emit from a specific location within the world.  Sounds prefixed with ^ tell the sound engine that it is a distance based sound. The left channel of the .wav is the 'near' sound that will play when the sound originates close to you, and the right channel is the 'far' sound that will play when the sound originates far from you.
---@field OriginalSoundName string The original file path or soundscript name.  Even if the SoundName value is changed, the OriginalSoundName value will remain the same.  Sounds may be returned as soundscripts (for example, "Weapon_357.Single") instead of the sound's file path. You can use sound.GetProperties to retrieve the actual file path.
---@field SoundTime number The time at which the sound should be played.  If equal to 0 or CurTime(), the sound is played immediately. If greater than CurTime(), the sound is played with a delay. If less than CurTime(), part of the sound is skipped.
---@field DSP number The DSP (digital signal processing) preset applied to the sound.  There are approximately 134 different presets defined by the Source engine between 0 and 133. These presets represent different types of 'rooms' or environments.  [List of DSP's](https://developer.valvesoftware.com/wiki/Dsp_presets)
---@field SoundLevel number The sound's attenuation, a number between 0 (low) and 511 (high)  This determines how fast the sound drops away. A higher value means the sound can be heard farther away.  See Enums/SNDLVL.
---@field Pitch number The pitch of the played sound, a number between 0 (low) and 255 (high), where 100 is the sound's original pitch.
---@field Flags number The bit flags of the played sound. See Enums/SND for available options.
---@field Channel number The sound's channel. See Enums/CHAN for available options.
---@field Volume number The volume of the played sound, return as a decimal number between 0 (low) and 1 (high).
---@field Entity Entity The entity that played the sound.
---@field Pos Vector The origin of the played sound.
local EmitSoundInfo = {}

---@class ENT
---@field Base string The base entity to derive from. This **must** be a valid Lua entity
---@field Type string Type of the entity. This **must be one of these:** * **anim** * **brush** * **point** * **ai** * **nextbot** * **filter**  See Scripted Entities for a more detailed explanation of what each one is.
---@field ClassName string Entity class name of the entity (File or folder name of your entity). **This is set automatically `after` the entity file is loaded.**
---@field Folder string The folder from where the entity was loaded. This should always be "entity/ent_myentity", regardless whether your entity is stored as a file, or multiple files in a folder. **This is set automatically `before` the entity file is loaded.**
---@field AutomaticFrameAdvance boolean Set this to true if your entity has animations. You should also apply changes to the ENTITY:Think function from the example on that page.
---@field Category string (Clientside) Spawnmenu category to put the entity into
---@field Spawnable boolean Whether this entity should be displayed and is spawnable in the spawn menu
---@field Editable boolean Whether the entity supports Editing. See Editable Entities for more info.
---@field AdminOnly boolean Whether or not only admins can spawn the entity from their spawn menu
---@field PrintName string (Clientside) Nice name of the entity to appear in the spawn menu
---@field Author string (Clientside) The author of the entity
---@field Contact string (Clientside) The contacts of the entity creator
---@field Purpose string (Clientside) The purpose of the entity creation
---@field Instructions string (Clientside) How to use your entity
---@field RenderGroup number (Clientside) The entity's render group, see Enums/RENDERGROUP.
---@field DisableDuplicator boolean (Serverside) Disable the ability for players to duplicate this entity.
---@field ScriptedEntityType string (Clientside) Sets the spawnmenu content icon type for the entity, used by spawnmenu in the Sandbox-derived gamemodes. See spawnmenu.AddContentType for more information.
---@field DoNotDuplicate boolean (Serverside) If set, the entity will not be duplicated via the built-in duplicator system.
---@field IconOverride string (Clientside) If set, overrides the icon path to be displayed in the Spawnmenu for this entity.
local ENT = {}

---@class EntityCopyData
---@field Name string The entity's name, see Entity:GetName.
---@field Class string The entity's class name, see Entity:GetClass.
---@field Pos Vector The entity's position, relative to the duplication origin point.
---@field Angle Angle The entity's angle, relative to the duplication angle.
---@field DT table The entity's Network Vars, see ENTITY:SetupDataTables and Networking Entities.
---@field Model string The entity's model, see Entity:GetModel.
---@field ModelScale number The entity's model scale, see Entity:GetModelScale. This will only be present if the model scale isn't 1.
---@field Skin number The entity's active skin, see Entity:GetSkin.
---@field ColGroup number The entity's collision group, see Entity:GetCollisionGroup. Uses the Enums/COLLISION_GROUP.
---@field Mins Vector The entity's collision bound minimums, see Entity:GetCollisionBounds.
---@field Maxs Vector The entity's collision bound maximums, see Entity:GetCollisionBounds.
---@field PhysicsObjects table Data about the entity's PhysObjs, see Entity:GetPhysicsObjectNum. The key is the physics object index (starts from 0), and the value is a Structures/PhysicsObjectSave. Unlike other tables in this structure, if there are no physics objects for this entity this will be an empty table.
---@field FlexScale number The entity's Flex Scale, see Entity:GetFlexScale.
---@field Flex table Each flex bone's flex weight, see Entity:GetFlexWeight. The key is the flex's index and the value is the weight. Only flexes with a non-default (nonzero) weight are listed, and if none exist, this field will be nil.
---@field BodyG table The entity's body groups, see Entity:GetBodygroup. The key is the bodygroup ID and the value is the assigned bodygroup number. Only body groups with a non-default (> 0) value are listed, and if none exist, this field will be nil.
---@field BoneManip table Bone manipulation data, see Entity:HasBoneManipulations. The key is the bone index and the value is a Structures/BoneManipulationData. Only bones that have been manipulated with non-default values are listed, and if none exist, this field will be nil.
---@field MapCreationID number The entity's MapCreationID, only exists for entities that were created by the map. See Entity:MapCreationID.
---@field WorkshopID number Deprecated, always 0. See Entity:GetWorkshopID.
local EntityCopyData = {}

---@class FontData
---@field font string The font source. Custom font files are stored in resource/fonts/.  The length is limited to 31 characters maximum.  This must be the actual 'nice' font, not a file name. (Finding the Font Name)  This also cannot be an already registered font, i.e. you cannot base your font from any of the Default_Fonts
---@field extended boolean Allow the font to display glyphs that are outside of the Latin-1 range. Unicode code points above 0xFFFF are not supported.
---@field size number The font height in pixels  `Range:` 4 - 255
---@field weight number The font boldness
---@field blursize number The strength of the font blurring  `Range:` 0 - 80
---@field scanlines number The "scanline" interval Must be > 1 to work. This setting is per blursize per font - so if you create a font using "Arial" without scanlines, you cannot create an Arial font using scanlines with the same blursize
---@field antialias boolean Smooth the font
---@field underline boolean Add an underline to the font
---@field italic boolean Make the font italic
---@field strikeout boolean Add a strike through
---@field symbol boolean Enables the use of symbolic fonts such as Webdings
---@field rotary boolean Seems to add a line in the middle of each letter
---@field shadow boolean Add shadow casting to the font
---@field additive boolean Additive rendering
---@field outline boolean Add a black outline to the font.  This does not work well with antialias, and only allows black 1-pixel outlines. It may be preferable to not use this parameter, and instead use draw.SimpleTextOutlined when drawing text that you want outlined.
local FontData = {}

---@class GM
---@field Name string The fancy name of your gamemode.
---@field Author string The name/contact info of the gamemode author.
---@field Email string The contact email associated with the gamemode.
---@field Website string The website associated with the gamemode.
---@field FolderName string The name of the gamemode folder, automatically set.
---@field Folder string The name of the gamemode folder prepended with "gamemodes/" (such as "gamemodes/sandbox"), automatically set.
---@field TeamBased boolean Set this to true if your gamemode is team-based. Used to enable/disable the base gamemode team system.
---@field IsSandboxDerived boolean True if the gamemode is derived from sandbox.
---@field ThisClass string The name of the gamemode folder prepended with "gamemode_" (such as "gamemode_sandbox"), automatically set.
---@field BaseClass table The table of the base gamemode to derive from, set automatically by Global.DeriveGamemode.  It is recommended to use Global.DEFINE_BASECLASS when referencing the gamemode's BaseClass to prevent unintended behavior  Global.DeriveGamemode modifies the main gamemode's BaseClass, which is shared with parent gamemodes. Because of this, in parent gamemodes the BaseClass can be incorrect, so for instance you need to use `self.BaseClass.BaseClass` in the 1st parent instead
local GM = {}

---@class HTTPRequest
---@field failed function Function to be called on failure. Arguments are * string reason 		
---@field success function Function to be called on success. Arguments are * number code * string body * table headers 		
---@field method string Request method, case insensitive. Possible values are: * GET * POST * HEAD * PUT * DELETE * PATCH * OPTIONS 		
---@field url string The target url
---@field parameters table KeyValue table for parameters. This is only applicable to the following request methods: * GET * POST * HEAD 		
---@field headers table KeyValue table for headers
---@field body string Body string for POST data. If set, will override parameters
---@field type string Content type for body.
---@field timeout number The timeout for the connection.
local HTTPRequest = {}

---@class HullTrace
---@field start Vector The start position of the trace
---@field endpos Vector The end position of the trace
---@field maxs Vector The 3D vector local to the start/endpos with the highest values. This will represent the corner with the upper bounds of the box.
---@field mins Vector The 3D vector local to the start/endpos with the lowest (often negative) values. This will represent the corner with the lower bounds of the box.
---@field filter Entity Things the trace should not hit. Can also be a table of entities or a function with one argument:   * Entity ent - The entity that the trace hit  Using a function here is super slow. Try to avoid it.
---@field mask number The trace mask Enums/MASK. This determines what the trace should hit and what it shouldn't hit.
---@field collisiongroup number The collision group Enums/COLLISION_GROUP. This determines what the trace should hit in regards to the entity's collision group.
---@field ignoreworld boolean Should the trace ignore world or not.
---@field output table If set, the trace result will be written to the supplied table instead of returning a new table
local HullTrace = {}

---@class LocalLight
---@field type number The type of the light source, see Enums/MATERIAL_LIGHT.
---@field color Vector The color of the light source (x is red, y is green, z is blue). Values are not restricted to a specific range, higher values will result in a brighter light.
---@field pos Vector The origin of the light in world coordinates.
---@field dir Vector The direction of the light. Only required for directional and spot lights.
---@field range number The maximum range of the light source. Does not actually control light attenuation. Usually left at 0 for infinite range.
---@field angularFalloff number Angular falloff exponent for spot lights. Higher values result in a sharper transition between the inner cone and the outer cone.
---@field innerAngle number The inner cone angle for spot lights, in degrees. No angular falloff will occur inside that cone.
---@field outerAngle number The outer cone angle for spot lights, in degrees.
---@field fiftyPercentDistance number The distance at which the light will fade to 50% of its brightness.
---@field zeroPercentDistance number The distance at which the light will completely fade out.
---@field quadraticFalloff number The quadratic term of the light falloff. This will only be used if fiftyPercentDistance and zeroPercentDistance are not supplied, and allows finer control over light attenuation.
---@field linearFalloff number The linear term of the light falloff. This will only be used if fiftyPercentDistance and zeroPercentDistance are not supplied, and allows finer control over light attenuation.
---@field constantFalloff number The constant term of the light falloff. This will only be used if fiftyPercentDistance and zeroPercentDistance are not supplied, and allows finer control over light attenuation.
local LocalLight = {}

---@class MatProxyData
---@field name string The name of the material proxy
---@field init function The function used to get variables from the ".vmt". Called once per each ".vmt". Arguments are: * table self * string materialName * table values
---@field bind function The function used to apply the proxy. This is called every frame while any materials with this proxy are used in world. Arguments are: * table self * string materialName * Entity ent
local MatProxyData = {}

---@class MeshVertex
---@field color table The vertex color. Uses the Color.
---@field normal Vector The triangles normal required to calculate lighting(optional).
---@field tangent Vector The triangles tangent. Not used by the VertexLitGeneric shader.
---@field binormal Vector The triangles binormal. Not used by the VertexLitGeneric shader.
---@field pos Vector The vertex position.
---@field u number The u texture scale.
---@field v number The v texture scale.
---@field userdata table A table of four numbers. This is used by most shaders in Source to hold tangent information of the vertex ( tangentX, tangentY, tangentZ, tangentHandedness ).
local MeshVertex = {}

---@class OperatingParams
---@field RPM number The current RPM of the vehicle
---@field gear number The current gear of the vehicle, starting from 0
---@field isTorqueBoosting boolean Is the vehicle boosting?
---@field speed number The current speed, in inches per second
---@field steeringAngle number Steering angle
---@field wheelsInContact number Wheels on ground
local OperatingParams = {}

---@class PathSegment
---@field area CNavArea The navmesh area this segment occupies.
---@field curvature number How much of a curve should the bot execute when navigating this segment. 0 = none, 1 = 180°
---@field distanceFromStart number Distance of this segment from the start of the path.
---@field forward Vector The direction of travel to reach the end of this segment from the start, represented as a normalised vector.
---@field how number The direction of travel to reach the end of this segment from the start, represented as a cardinal direction integer 0 to 3, or 9 for vertical movement.
---@field ladder CNavLadder The navmesh ladder this segment occupies, if any.
---@field length number Length of this segment.
---@field m_portalCenter Vector 
---@field m_portalHalfWidth number 
---@field pos Vector The position of the end of this segment.
---@field type number The movement type of this segment, indicating how bots are expected to move along this segment. * 0 is ground movement * 1 is falling down * 2 is climbing up or jumping * 3 is jumping over a gap * 4 is climbing a ladder up (unused) * 5 is climbing a ladder down (unused)
local PathSegment = {}

---@class PhysEnvPerformanceSettings
---@field LookAheadTimeObjectsVsObject number Maximum amount of seconds to precalculate collisions with objects.
---@field LookAheadTimeObjectsVsWorld number Maximum amount of seconds to precalculate collisions with world.
---@field MaxAngularVelocity number Maximum rotation velocity.
---@field MaxCollisionChecksPerTimestep number Maximum collision checks per tick.
---@field MaxCollisionsPerObjectPerTimestep number Maximum collision per object per tick.
---@field MaxFrictionMass number Maximum mass of an object to be affected by friction.
---@field MaxVelocity number Maximum speed of an object.
---@field MinFrictionMass number Minimum mass of an object to be affected by friction.
local PhysEnvPerformanceSettings = {}

---@class PhysicsObjectSave
---@field Pos Vector The entity's world position made local with Global.WorldToLocal
---@field Angle Angle The entity's world angles made local with Global.WorldToLocal
---@field Frozen boolean Whether the entity is moveable. Equal to (`not` PhysObj:IsMoveable)
---@field NoGrav boolean Whether the entity's gravity is affected by gravity or not. PhysObj:IsGravityEnabled
---@field Sleep boolean Whether the entity is dormant or not. PhysObj:IsAsleep
local PhysicsObjectSave = {}

---@class PhysProperties
---@field GravityToggle boolean Enables or disables gravity for the entity
---@field Material string Sets the physics material for the entity
local PhysProperties = {}

---@class PLAYER
---@field DisplayName string The 'nice' name of the player class for display in User Interface and such.
---@field WalkSpeed number How fast to move when not running
---@field RunSpeed number How fast to move when running/sprinting
---@field SlowWalkSpeed number How fast to move when slow walking, which is activated via the +WALK keybind.
---@field CrouchedWalkSpeed number Multiply walk speed by this when crouching
---@field DuckSpeed number How fast to go from not ducking, to ducking
---@field UnDuckSpeed number How fast to go from ducking, to not ducking
---@field JumpPower number How powerful a jump should be
---@field CanUseFlashlight boolean Can the player use the flashlight
---@field MaxHealth number Max health we can have
---@field MaxArmor number Max armor the player can have
---@field StartHealth number How much health we start with
---@field StartArmor number How much armour we start with
---@field DropWeaponOnDie boolean Do we drop our weapon when we die
---@field TeammateNoCollide boolean Do we collide with teammates or run straight through them
---@field AvoidPlayers boolean Automatically swerves around other players
---@field UseVMHands boolean Uses viewmodel hands
local PLAYER = {}

---@class PolygonVertex
---@field x number The x coordinate of the vertex.
---@field y number The y coordinate of the vertex.
---@field u number The u texture coordinate of the vertex. `Can be left blank.`
---@field v number The v texture coordinate of the vertex. `Can be left blank.`
local PolygonVertex = {}

---@class Preset
---@field enabled table A Table containing all enabled addons.
---@field disabled table A Table containing all disabled addons.
---@field name string The name of the Preset.
---@field newAction string What to do with addons not in the preset. Can be **enable** **disable** or nothing.
local Preset = {}

---@class Problem
---@field id string The Problem ID.
---@field text string The Text to Display.
---@field severity number  The Problem severity.
---@field type string The Problem Type. Possible values are: * config * hardware * addons 		
---@field fix function a Function that fixes the Problem.
local Problem = {}

---@class PropertyAdd
---@field Type string Can be set to "toggle" to make this property a toggle property.
---@field MenuLabel string Label to show on opened menu
---@field MenuIcon string Icon to show on opened menu for this item. Optional for simple properties and unused for toggle properties.
---@field structureFieldOrder number Where in the list should the property be positioned, relative to other properties.  For reference, here are the default properties and their Order values:  Property |  Order | ---------|-------| | Bone Manipulate | 500 | | Bodygroups | 600 | | Skin | 601 | | Keep Upright | 900 | | Ignite/Extinguish | 999 | | Remove | 1000 | | Gravity | 1001 | | Drive | 1100 | | Collision | 1500 | | Statue | 1501 | | NPC Biggify/Smallify | 1799, 1800 | | Motion Control (Kinect) | 2500 | | Editable_Entities | 90001 | 
---@field PrependSpacer boolean Whether to add a spacer before this property. This should generally be true for the first property in a group of properties.
---@field Filter function Used **clientside** to decide whether this property should be shown for an entity. Gets these arguments: * table self - the property table * Entity ent - the entity the player clicked * Global.LocalPlayer player - the localplayer  Return true if the property should be shown for this entity. It's good practice to call SANDBOX:CanProperty in this hook via gamemode.Call or hook.Run. 
---@field Checked function  Required for toggle properties (clientside). Must return a boolean value to either check or uncheck the toggle property. * table self - the property table * Entity ent - the entity the player clicked * table tr - the player's eye trace 
---@field Action function  Called **clientside** when the property is clicked with these arguments: * table self - the property table * Entity ent - the entity the player clicked * table tr - the player's eye trace  When appropriate, within this function you can call self:MsgStart(), write data with the net 'Write' functions, and finish with self:MsgEnd(). This will activate the 'Receive' function on the server. In most cases, you will want to send the entity to the server, as it's not done by default. 
---@field Receive function  Called **serverside** if the client sends a message in the 'Action' function (see above). * table self - the property table * number len - the net message length, although this includes the property identifier used internally (the name of the property) * Player ply - the player who clicked the property  You can read data received from the client with the net 'Read' functions. It's good practice to check SANDBOX:CanProperty here via gamemode.Call or hook.Run. 
---@field MenuOpen function  Called **clientside** when the property option has been created in the right-click menu. This is not called for toggle properties! * table self - the property table * DMenuOption option - the menu option * Entity ent - the entity the player right-clicked * table tr - the player's eye trace 
---@field OnCreate function  Same as MenuOpen, but also called for toggle properties and has different arguments. This is called immediately after MenuOpen, but nothing happens in between so you should only ever use one or the other. * table self - the property table * DMenu menu - the property menu * DMenuOption option - the menu option 
local PropertyAdd = {}

---@class RenderCamData
---@field x number The x position of the view port
---@field y number The y position of the view port
---@field w number The width of the view port
---@field h number The height of the view port
---@field type string The type of cam. Valid types are: * "2D" - No additional arguments are required * "3D" - Only origin and angles are needed, all other parameters are optional.
---@field origin Vector The position to render from
---@field angles Angle The angles to render from
---@field fov number The field of view
---@field aspect number The aspect ratio of the view port (Note that this is NOT set to w/h by default)
---@field zfar number The distance to the far clipping plane
---@field znear number The distance to the near clipping plane
---@field subrect boolean Set to true if this is to draw into a subrect of the larger screen.
---@field bloomtone boolean m_bDoBloomAndToneMapping
---@field offcenter table A table having these keys: ( all floats ) * left * right * bottom * top
---@field ortho table If set, makes the view/camera orthogonal. A table having these keys: ( all floats ) * left * right * bottom * top
local RenderCamData = {}

---@class RenderCaptureData
---@field format string Format of the capture. Valid formats are: * `jpeg` or `jpg` * `png`
---@field x number X coordinate of the capture origin
---@field y number Y coordinate of the capture origin
---@field w number Width of the capture
---@field h number Height of the capture
---@field quality number The quality of the capture. Affects jpeg only.
---@field alpha boolean Set to false to capture an image with alpha channel set to fully opaque. Affects png only.
local RenderCaptureData = {}

---@class SequenceInfo
---@field label string Name of the sequence.
---@field activityname string Name of the activity this sequence is attached to.
---@field activity number The activity ID associated with this sequence. See Enums/ACT.
---@field actweight number How likely this sequence is to be picked when playing an activity its attached to. -1 means this is the only sequence for that activity. (needs validation)
---@field flags number The looping and other flags of this sequence.
---@field numevents number Number of animation events this sequence has.
---@field numblends number 
---@field bbmin number Mins part of the bounding box for this sequence
---@field bbmax number Maxs part of the bounding box for this sequence
---@field fadeintime number ideal cross fade in time (0.2 default)
---@field fadeouttime number ideal cross fade out time (0.2 default)
---@field localentrynode number transition node at entry
---@field localexitnode number transition node at exit
---@field nodeflags number Transition rules
---@field lastframe number Frame that should generate EndOFSequence
---@field nextseq number If non 0, the next sequence for auto advancing sequences
---@field pose number 
---@field cycleposeindex number If non 0, index of pose parameter to be used as cycle index. This means that the sequence playback will be controlled by a pose parameter.
---@field anims table A 1-based array of all animationIDs associated with this sequence. For use with Entity:GetAnimInfo.
local SequenceInfo = {}

---@class ServerQueryData
---@field GameDir string The game directory to get the servers for
---@field Type string Type of servers to retrieve. Valid values are `internet`, `favorite`, `history` and `lan`
---@field AppID number Steam application ID to get the servers for
---@field Callback function Called when a new server is found and queried. Arguments:        number ping - Latency to the server.         string name - Name of the server         string desc - "Nice" gamemode name         string map - Current map         number players - Total player number ( bot + human )         number maxplayers - Maximum reported amount of players         number botplayers - Amount of bots on the server         boolean pass - Whether this server has password or not         number lastplayed - Time when you last played on this server, as UNIX timestamp or 0         string address - IP Address of the server         string gamemode - Gamemode folder name         number workshopid - Gamemode Steam Workshop ID         boolean isanon - Is the server signed into an anonymous account?         string version - Version number, same format as jit.version_num         string localization - Two digit country code, `us` if nil         string gmcategory - Category of the gamemode, ex. `pvp`, `pve`, `rp` or `roleplay`         Return false to stop the query.     
---@field CallbackFailed function        Called if the query has failed, called with the servers IP Address     
---@field Finished function Called when the query is finished. No arguments
local ServerQueryData = {}

---@class SoundData
---@field channel number The sound channel to play in. See Enums/CHAN
---@field name string The name of the sound.
---@field pitchstart number The initial pitch. 	Deprecated, use pitch. 
---@field pitchend number The pitch end. Deprecated, use pitch. 
---@field level number The soundlevel of the sound in dB. See Enums/SNDLVL.
---@field sound string The sound file to be used in this sound effect. Can be a table of sound files. Relative to "sound" directory (must be in a subfolder, so sound/test.wav will not work).
---@field volume number The volume of the sound as a decimal between `0` and `1`. Can be a table of two numbers, a minimum and a maximum value.  **Warning:** Volume of `0` will act as volume of `1`
---@field pitch number The pitch of the sound. Can be a table of two numbers, a minimum and a maximum value.
local SoundData = {}

---@class SoundHintData
---@field origin Vector Origin of the sound hint
---@field owner Entity Owner of the sound hint, if any (emitting entity, like a thumper)
---@field target Entity Target of the sound hint, if any
---@field volume number Volume of the sound hint
---@field type number Enums/SOUND
---@field expiration number Global.CurTime based expiration date
---@field expires boolean Does this sound hint expire?
---@field channel number Enums/CHAN
local SoundHintData = {}

---@class SunInfo
---@field direction Vector The suns direction relative to 0,0,0
---@field obstruction number Indicates how obstructed the sun is, 1 not visible, 0 fully visible
local SunInfo = {}

---@class SurfacePropertyData
---@field name string The name of the surface property, identical to util.GetSurfacePropName.
---@field hardnessFactor number How hard a surface is. If this is greater than or equal to another surfaces's hardThreshold, a hard impact sound will be used.
---@field hardThreshold number Hardness threshold for impact sounds. HitSurface.hardnessFactor >= InflictorSurface.hardThreshold - hard impact sound (depends on hardVelocityThreshold's value), HitSurface.hardnessFactor < InflictorSurface.hardThreshold - soft impact sound (always).
---@field hardVelocityThreshold number Velocity threshold for impact sounds. impactSpeed >= HitSurface.hardVelocityThreshold - hard impact sound (depends on hardThreshold's value), impactSpeed < HitSurface.hardVelocityThreshold - soft impact sound (always).
---@field reflectivity number Amount of sound reflected from the surface represented as a number 0.0 - 1.0. 0 - no reflection, 1 - fully reflected.
---@field roughnessFactor number How rough a surface is. If this is greater than or equal to another surfaces's roughThreshold, a rough scrape sound will be used.
---@field roughThreshold number Roughness threshold for friction sounds. HitSurface.roughnessFactor >= InflictorSurface.roughThreshold - rough friction sound, HitSurface.roughnessFactor < InflictorSurface.roughThreshold - soft friction sound.
---@field climbable number Indicates whether or not the surface is a ladder. Used to detect whether a player is on a ladder. 0 - false, > 0 - true.
---@field jumpFactor number Scalar multiplier for player jump height - or more accurately, applied z-axis velocity on a surface. For example, 1 - normal jump, 2 - twice as high, and 0.5 - half as high.
---@field material number The surface material. See Enums/MAT.
---@field maxSpeedFactor number Scalar multiplier for player speed. Achieves this by multiplying CMoveData:SetMaxSpeed in GM:Move.
---@field dampening number This is the physical drag on an object when in contact with this surface (0 - x, 0 none to x a lot).
---@field density number Material density in kg / m^3 (water is 1000). If a surface's density is < 1000, it will float in water. This is used to calculate the total mass of an object.
---@field elasticity number Collision elasticity - used to compute coefficient of restitution represented as a number 0.0 - 1.0. 0.01 is soft, 1.0 is hard.
---@field friction number Physical friction used to slow entities touching the surface represented as a number 0.0 - 1.0. 0.01 is slick, 1.0 is completely rough.
---@field thickness number Material thickness. If this is 0, the material is not volumetrically solid, and thus the object mass will be calculated as "volume * 0.0254^3 * density" where 0.0254 is meters per inch. If non-zero, the mass will be "surfacearea * thickness * 0.0254^3 * density".
---@field breakSound string Sound to play when a prop or func_breakable is broken.
---@field bulletImpactSound string Bullet impact sound with this surface.
---@field impactHardSound string Physical impact sound when hitting surfaces hard.
---@field impactSoftSound string Physical impact sound when hitting surfaces softly.
---@field rollingSound string Unused sound.
---@field scrapeRoughSound string Friction sound when roughly scraping against an entity.
---@field scrapeSmoothSound string Friction sound when smoothly scraping against an entity.
---@field stepLeftSound string Footstep sound for left foot.
---@field stepRightSound string Footstep sound for right foot.
---@field strainSound string Unused sound.
local SurfacePropertyData = {}

---@class SWEP
---@field ClassName string Entity class name of the SWEP (file or folder name of your SWEP). This is             set automatically
---@field Category string The spawn menu category that this weapon             resides in.
---@field Spawnable boolean Whether or not this weapon can be obtained through the             spawn menu.         
---@field AdminOnly boolean If spawnable, this variable determines whether only             administrators can use the button in the spawn menu.
---@field PrintName string The name of the SWEP displayed in the spawn menu.
---@field Base string The weapon's base script, relative to `lua/weapons`.
---@field m_WeaponDeploySpeed number The deploy speed multiplier. This does not change the             internal deployment speed.
---@field Owner Entity              Deprecated, use Entity:GetOwner() instead.         
---@field Author string The SWEP's author.
---@field Contact string The contact information regarding the SWEP's author.
---@field Purpose string The purpose of the SWEP.
---@field Instructions string The instructions regarding the SWEP's usage.
---@field ViewModel string The client-side, relative path to the SWEP's view model.
---@field ViewModelFlip boolean Used primarily for Counter Strike: Source view models, this variable is used to flip them back to normal.
---@field ViewModelFlip1 boolean Behaves similarly to `ViewModelFlip`, but for the second view model.
---@field ViewModelFlip2 boolean Behaves similarly to `ViewModelFlip`, but for the third view model.
---@field ViewModelFOV number The field of view percieved whilst wielding this `SWEP`.
---@field WorldModel string The server-side, relative path to the SWEP's world model.
---@field AutoSwitchFrom boolean Whether this weapon can be autoswitched             away from when the player runs out of ammo in this weapon or picks up another weapon or ammo
---@field AutoSwitchTo boolean Whether this weapon can be autoswitched to             when the player runs out of ammo in their current weapon or they pick this weapon up
---@field Weight number Determines the priority of the weapon when             autoswitching. The weapon being autoswitched from will attempt to switch to a weapon with the same weight             that has ammo, but if none exists, it will prioritise higher weight weapons.
---@field BobScale number The scale of the viewmodel bob (viewmodel movement             from left to right when walking around)
---@field SwayScale number The scale of the viewmodel sway (viewmodel             position lerp when looking around).
---@field BounceWeaponIcon boolean Should the weapon icon bounce in weapon             selection?
---@field DrawWeaponInfoBox boolean Should draw the weapon selection info             box, containing SWEP.Instructions, etc.
---@field DrawAmmo boolean Should we draw the default HL2 ammo counter?         
---@field DrawCrosshair boolean Should we draw the default crosshair?         
---@field RenderGroup number The SWEP render group, see             Enums/RENDERGROUP         
---@field Slot number Slot in the weapon selection menu, starts with `0`
---@field SlotPos number Position in the slot, should be in the range `0-128`
---@field SpeechBubbleLid number (Clientside)             Internal variable for drawing the info box in weapon selection
---@field WepSelectIcon number Path to             an texture. Override this in your SWEP to set the icon in the weapon selection. This must be the texture ID,             see surface.GetTextureID. Alternatively you can render custom weapon selection via WEAPON:DrawWeaponSelection.									    		
---@field CSMuzzleFlashes boolean Should we use Counter-Strike muzzle             flashes upon firing? This is required for DoD:S or CS:S view models to fix their muzzle flashes.
---@field CSMuzzleX boolean Use the X shape muzzle flash instead of the             default Counter-Strike muzzle flash. Requires CSMuzzleFlashes to be set to true
---@field Primary table Primary attack settings. The table contains these fields:              * string Ammo - Ammo type ("Pistol", "SMG1" etc)             * number ClipSize - The maximum amount of bullets one clip can hold. Setting it to `-1` means             weapon uses no clips, like a grenade or a rocket launch.             * number DefaultClip - Default ammo in the clip, making it higher than ClipSize will give             player additional ammo on spawn             * boolean Automatic - If true makes the weapon shoot automatically as long as the player has             primary attack button held down
---@field Secondary table Secondary attack settings, has same fields as Primary attack settings
---@field UseHands boolean Makes the player models hands bonemerged onto             the view model              The gamemode and view models **must** support this feature for it to work!                 You can find more information here: Using_Viewmodel_Hands                      
---@field Folder string The folder from where the weapon was loaded. This should always be             "weapons/weapon_myweapon", regardless whether your SWEP is stored as a file, or multiple files in a folder.             It is set automatically on load
---@field AccurateCrosshair boolean Makes the default SWEP crosshair be             positioned in 3D space where your aim actually is (like on Jeep), instead of simply sitting in the middle of             the screen at all times
---@field DisableDuplicator boolean Disable the ability for players to duplicate this             SWEP
---@field ScriptedEntityType string Sets the spawnmenu content icon type             for the entity, used by spawnmenu in the Sandbox-derived gamemodes.             See spawnmenu.AddContentType for more information.
---@field m_bPlayPickupSound boolean If set to false, the weapon will not play the             weapon pick up sound when picked up.
---@field IconOverride string (Clientside)If set,             overrides the icon path to be displayed in the Spawnmenu for this entity.
local SWEP = {}

---@class TeamData
---@field Color table Color of the team
---@field Joinable boolean Whether the team is joinable or not.
---@field Name string Name of the team
---@field Score number Score of the team
local TeamData = {}

---@class TextData
---@field text string Text to be drawn.
---@field font string The font to draw with. List of default fonts can be found Default_Fonts.
---@field pos table This holds the X and Y coordinates. Key value 1 is x, key value 2 is y.
---@field xalign number The alignment of the X position. See Enums/TEXT_ALIGN
---@field yalign number The alignment of the Y position. See Enums/TEXT_ALIGN
---@field color table The text color
local TextData = {}

---@class TextureData
---@field texture number surface.GetTextureID number of the texture to be drawn.
---@field x number The x Coordinate.
---@field y number The y Coordinate.
---@field w number The width of the texture.
---@field h number The height of the texture.
---@field color table The texture color. See Color.
local TextureData = {}

---@class TOOL
---@field AddToMenu boolean If set to false, the tool won't be added to the tool menu and players will have to access it by other means.
---@field Category string The tool menu category under which the tool should be listed.
---@field Command string The console command to execute upon being selected in the Q menu.
---@field Name string The name of the tool in the Q menu. Common practice is to set this to "#tool.[lua filename].name" to match the name displayed in the tool information box.
---@field ClientConVar table A key-value ( convar name-default value ) table containing the client-side convars to create. All convars will be prefixed with the filename of the tool. You can later use Tool:GetClientNumber or Tool:GetClientInfo to retrieve these values.
---@field ServerConVar table Same as above, but created server-side instead.
---@field ClientConVars table A key-value ( string name - ConVar object ) table containing the cached convar objected created from `ClientConVar`.
---@field ServerConVars table Same as above, but server-side (`ServerConVar`) instead.
---@field BuildCPanel function The function that is called to build the context menu for your tool. It has one argument, namely the context menu's base panel to which all of your custom panels are going to be parented to.  While it might sound like a hook, it isn't - you won't receive a `self` argument inside the function. See TOOL.BuildCPanel.
---@field Information table Allows you to override the tool usage information shown when the tool is equipped. See Tool Information Display for more information.
---@field Mode string Class name of the tool. (name of the .lua file)  This is set automatically.
---@field Tab string The tool tab (spawnmenu.AddToolTab) to add this tool to. (The internal name, first argument)
---@field LeftClickAutomatic boolean When enabled the game tries to run the left mouse click as soon as possible
---@field RightClickAutomatic boolean When enabled the game tries to run the right mouse click as soon as possible
local TOOL = {}

---@class ToScreenData
---@field x number The x coordinate on the players screen
---@field y number The y coordinate on the players screen
---@field visible boolean The coordinate is not behind the player. **This does not mean the coordinate is on the screen.** When this is false, it means that the coordinate would not be on the screen even if the player had a full 180 degree FOV.
local ToScreenData = {}

---@class Trace
---@field start Vector The start position of the trace
---@field endpos Vector The end position of the trace
---@field filter Entity Things the trace should not hit. Can also be a table of entities or a function with one argument:   * Entity ent - The entity that the trace hit  Return true in the function to hit the entity, false to skip it.  Using a function here is super slow - try to avoid it.
---@field mask number The trace mask Enums/MASK. This determines what the trace should hit and what it shouldn't hit. A mask is a combination of Enums/CONTENTS - you can use these for more advanced masks.
---@field collisiongroup number The collision group Enums/COLLISION_GROUP. This determines what the trace should hit in regards to the entity's collision group.
---@field ignoreworld boolean Should the trace ignore world or not
---@field output table If set, the trace result will be written to the supplied table instead of returning a new table
local Trace = {}

---@class TraceResult
---@field Entity Entity The entity hit by the trace.
---@field Fraction number This indicates the how much of your trace length was used from 0-1 (resultLength/originalLength).
---@field FractionLeftSolid number Given the trace started in a solid enviroment, this will return at what distance the trace left the solid from 0-1. Doesn't work if the trace hit a non-worldspawn entity.
---@field Hit boolean Indicates whether the trace hit something.
---@field HitBox number The ID of the hitbox hit by the trace.
---@field HitGroup number Enums/HITGROUP describing what hitgroup the trace hit (not the same as HitBox).
---@field HitNoDraw boolean Indicates whenever the trace hit a no-draw brush.
---@field HitNonWorld boolean Indicates whenever the trace did not hit the world.
---@field HitNormal Vector The direction of the surface that was hit as a normal vector (vector with Vector:Length of 1).
---@field HitPos Vector The position the trace stopped. This will be the provided endpos if the trace hit nothing.
---@field HitSky boolean Indicates whenever the trace hit the sky.
---@field HitTexture string The surface material (not texture) of whatever the trace hit. Will be `**displacement**` if the trace hit a displacement, and `**studio**` if it hit a prop.
---@field HitWorld boolean Indicates whenever the trace hit the world.
---@field MatType number Enums/MAT of the material hit by the trace.
---@field Normal Vector The direction of the trace as a normal vector (vector with Vector:Length of 1).  Equivalent to: `( traceRes.HitPos - traceRes.StartPos ):Normalize()` 
---@field PhysicsBone number The PhysObj ID that was hit.  Used for Entity:GetPhysicsObjectNum.
---@field StartPos Vector The origin of the trace. Will match the provided startpos.
---@field SurfaceProps number ID of hit surface property from `scripts/surfaceproperties.txt`. You can get the name using util.GetSurfacePropName.  Used for CEffectData:SetSurfaceProp.
---@field StartSolid boolean Indicates whenever the trace started in a solid enviroment.
---@field AllSolid boolean True if the entire trace is inside a solid.
---@field SurfaceFlags number The surface flags of the hit surface. See Enums/SURF.
---@field DispFlags number The displacement flags of the hit surface. See Enums/DISPSURF.
---@field Contents number The contents of the hit surface. See Enums/CONTENTS.
local TraceResult = {}

---@class UGCFileInfo
---@field id number The Workshop item ID
---@field title string The title of the Workshop item
---@field description string The description of the Workshop item
---@field fileid number The internal File ID of the workshop item, if any
---@field previewid number The internal File ID of the workshop item preview, if any
---@field previewurl string A URL to the preview image of the workshop item
---@field owner number The SteamID64 of the original uploader of the addon
---@field created number Unix timestamp of when the item was created
---@field updated number Unix timestamp of when the file was last updated
---@field banned boolean Whether the file is banned or not
---@field tags string Comma (,) separated list of tags, may be truncated to some length
---@field size number File size of the workshop item contents
---@field previewsize number Filesize of the preview file
---@field installed boolean If the addon is subscribed, this value represents whether it is installed on the client and its files are accessible, false otherwise.
---@field disabled boolean If the addon is subscribed, this value represents whether it is disabled on the client, false otherwise.
---@field children table A list of child Workshop Items for this item.  For collections this will be sub-collections, for workshop items this will be the items they depend on.
---@field ownername string We advise against using this. It may be changed or removed in a future update.  The "nice" name of the Uploader, or "Unnammed Player" if we failed to get the data for some reason.  Do not use this field as it will most likely not be updated in time. Use steamworks.RequestPlayerInfo instead.
---@field error number If this key is set, no other data will be present in the response.  Values above 0 represent Steam Error codes, values below 0 mean the following: * -1 means Failed to create query * -2 means Failed to send query * -3 means Received 0 or more than 1 result * -4 means Failed to get item data from the response * -5 means Workshop item ID in the response is invalid * -6 means Workshop item ID in response is mismatching the requested file ID
local UGCFileInfo = {}

---@class Undo
---@field Owner Player The player responsible who owns the undo
---@field Name string The name of the text to report to the player
---@field Entities table A table of entities to be removed by the undo
---@field Functions table A table of {function_to_call, func_arg2, func_arg3}
---@field CustomUndoText string A custom undo text to show the client
---@field NiceName string A "nice" name of the undo, which will be used for the UI
local Undo = {}

---@class VehicleParams
---@field wheelsPerAxle number Wheels per axle
---@field axleCount number Number of axles
---@field axles table A table of Structures/VehicleParamsAxle tables.
---@field body table See Structures/VehicleParamsBody
---@field engine table See Structures/VehicleParamsEngine
---@field steering table See Structures/VehicleParamsSteering
local VehicleParams = {}

---@class VehicleParamsAxle
---@field brakeFactor number 
---@field offset Vector 
---@field raytraceCenterOffset Vector 
---@field raytraceOffset Vector 
---@field suspension_maxBodyForce number 
---@field suspension_springConstant number 
---@field suspension_springDamping number 
---@field suspension_springDampingCompression number 
---@field suspension_stabilizerConstant number 
---@field torqueFactor number 
---@field wheelOffset Vector 
---@field wheels_brakeMaterialIndex number Material index of braking material of the wheels. Upon braking, the wheels will be set to this material.
---@field wheels_damping number 
---@field wheels_frictionScale number 
---@field wheels_inertia number 
---@field wheels_mass number Mass of each wheel.
---@field wheels_materialIndex number Material index of the wheels by default.
---@field wheels_radius number Radius of the wheels.
---@field wheels_rotdamping number 
---@field wheels_skidMaterialIndex number Material index of skid material of the wheels. Upon skidding ( pressing Space and sliding the vehicle ), the wheels will be set to this material.
---@field wheels_springAdditionalLength number 
local VehicleParamsAxle = {}

---@class VehicleParamsBody
---@field addGravity number Additional gravity to be applied to the vehicle
---@field counterTorqueFactor number 
---@field keepUprightTorque number 
---@field massCenterOverride Vector Mass center override
---@field massOverride number Mass override
---@field maxAngularVelocity number Maximum angular velocity
---@field tiltForce number 
---@field tiltForceHeight number 
local VehicleParamsBody = {}

---@class VehicleParamsEngine
---@field autobrakeSpeedFactor number 
---@field autobrakeSpeedGain number 
---@field axleRatio number This acts as the final ratio of the gearbox.  It's like a master coefficient of the gearbox.
---@field boostDelay number Amount of seconds between being able to use the boost ( by pressing Shift key by default )
---@field boostDuration number Duration of the boost in seconds
---@field boostForce number 
---@field boostMaxSpeed number Maximum speed while boosting  The Vehicle:SetVehicleParams function takes this in **miles per hour**, but Vehicle:GetVehicleParams returns this in **hammer units per second**!  In this case HU = inches, so 1 MPH is 17.6 HU/s.
---@field gearCount number Amount of gears this vehicle has.
---@field gearRatio table A table of numbers, of gear rations.  Table length is equal to "gearCount" member of this table.
---@field horsepower number The HP amount of the vehicle  This value is used to calculate the effectively applied torque, along with ratios and `maxRPM`.
---@field isAutoTransmission boolean If `true`, the gearbox shifts gears, if `false` the gearbox stays stuck to the 1st gear (gear number 0).
---@field maxRPM number Maximum RPM of the vehicle.  Despite this being a maximum value, the vehicle can exceed it.  Attempts to exceed the max RPM will force the active gear ratio to be that of the 1st gear, which will provide even more torque. This is the opposite of a rev limiter. This value is only used for the calculation of the effectively applied torque.
---@field maxRevSpeed number Maximum reverse speed of the vehicle  The Vehicle:SetVehicleParams function takes this in **miles per hour**, but Vehicle:GetVehicleParams returns this in **hammer units per second**!  In this case HU = inches, so 1 MPH is 17.6 HU/s.
---@field maxSpeed number Maximum forward going speed of the vehicle without boosting  The Vehicle:SetVehicleParams function takes this in **miles per hour**, but Vehicle:GetVehicleParams returns this in **hammer units per second**!  In this case HU = inches, so 1 MPH is 17.6 HU/s.
---@field shiftDownRPM number Amount of RPM to automatically shift one gear down
---@field shiftUpRPM number Amount of RPM to automatically shift one gear up
---@field throttleTime number 
---@field torqueBoost boolean 
local VehicleParamsEngine = {}

---@class VehicleParamsSteering
---@field boostSteeringRateFactor number 
---@field boostSteeringRestRateFactor number 
---@field brakeSteeringRateFactor number 
---@field degreesBoost number The maximum angle at which the vehicle can turn while boosting
---@field degreesFast number The maximum angle at which the vehicle can turn while moving at max speed and not boosting
---@field degreesSlow number The maximum angle at which the vehicle can turn while moving slowest
---@field dustCloud boolean Disabled in Garry's Mod. In Half-Life 2: Episode 2 this dictates whether the vehicle should leave wheel dust effects when driving around
---@field isSkidAllowed boolean Whether the vehicle is allowed to skid/drift
---@field powerSlideAccel number In Hammer Units
---@field speedFast number 
---@field speedSlow number 
---@field steeringExponent number 
---@field steeringRateFast number 
---@field steeringRateSlow number 
---@field steeringRestRateFast number 
---@field steeringRestRateSlow number 
---@field throttleSteeringRestRateFactor number 
---@field turnThrottleReduceFast number 
---@field turnThrottleReduceSlow number 
local VehicleParamsSteering = {}

---@class VehicleTable
---@field Author string 
---@field Model string 
---@field Class string 
---@field Category string 
---@field Information string 
---@field Name string 
---@field KeyValues table  	Do any other values belong in the KeyValues table? 
local VehicleTable = {}

---@class VideoData
---@field container string The video container format.  Valid options are: `webm`, `ogg`
---@field video string The video codec.  Valid options are: `vp8`, `theora`
---@field audio string The audio codec.  Valid options are: `vorbis`
---@field quality number The video quality
---@field bitrate number The record bitrate
---@field fps number Frames per second
---@field lockfps boolean Lock the frame count per second
---@field name string The file name for the video
---@field width number The videos width
---@field height number The videos height
local VideoData = {}

---@class ViewData
---@field origin Vector The view's original position
---@field angles Angle The view's angles
---@field aspect number Default width divided by height. Has a deprecated alias `aspectratio`.
---@field x number The x position of the viewport to render in
---@field y number The y position of the viewport to render in
---@field w number The width of the viewport to render in
---@field h number The height of the viewport to render in
---@field drawhud boolean Draw the HUD and call the hud painting related hooks
---@field drawmonitors boolean Draw monitors
---@field drawviewmodel boolean The weapon's viewmodel
---@field viewmodelfov number The viewmodel's FOV
---@field fov number The main view's FOV
---@field ortho table If set, renders the view orthogonally. A table with these keys: * left * right * top * bottom
---@field ortholeft number Coordinate for the left clipping plane. Requires `ortho` to be set to `true`.  **Deprecated**: Use `ortho` table instead!
---@field orthoright number Coordinate for the right clipping plane. Requires `ortho` to be set to `true`.  **Deprecated**: Use `ortho` table instead!
---@field orthotop number Coordinate for the top clipping plane. Requires `ortho` to be set to `true`.  **Deprecated**: Use `ortho` table instead!
---@field orthobottom number Coordinate for the bottom clipping plane. Requires `ortho` to be set to `true`.  **Deprecated**: Use `ortho` table instead!
---@field znear number The distance of the view's origin to the near clipping plane
---@field zfar number The distance of the view's origin to the far clipping plane
---@field znearviewmodel number The distance of the view's origin to the near clipping plane for the viewmodel
---@field zfarviewmodel number The distance of the view's origin to the far clipping plane for the viewmodel
---@field dopostprocess boolean  Currently works identically to the "bloomtone" option (it also overrides it if you set this to false).
---@field bloomtone boolean Disables default engine bloom and pauses the "brightness changes" on HDR maps.
---@field offcenter table This allows you to "zoom in" on a part of the screen - for example, the top-left quarter of the screen. This is similar to how [poster splits the screen](https://garry.blog/poster-screenshots/) into separate renders.  It's a table with 4 keys, controlling what portion of the screen to draw: * left - where the left edge starts. Natural value is 0. * right - where the right edge ends. Natural value is equal to w (the width of the viewport). * top - where the `bottom` edge starts. Natural value is 0. * bottom - where the `top` edge ends. Natural value is equal to h (the height of the viewport).  Note that top and bottom are reversed.  Values outside the viewport are allowed, but not recommended - instead you should increase the view FOV.
local ViewData = {}

---@class ViewSetup
---@field origin Vector The view's origin/position
---@field angles Angle The view's angles
---@field aspect number Width divided by height
---@field x number The x position of the viewport
---@field y number The y position of the viewport
---@field width number The width of the viewport
---@field height number The height of the viewport
---@field fov number The main view's FOV, adjusted for aspect ratio.
---@field fov_unscaled number The main view's FOV as the user setting.
---@field fovviewmodel number The viewmodel's FOV, adjusted for aspect ratio.
---@field fovviewmodel_unscaled number The viewmodel's FOV as the user setting.
---@field ortho table If the current view is orthogonal, a table with these keys: * left * right * top * bottom  Will not be present if view is not orthagonal.
---@field znear number The distance of the view's origin to the near clipping plane
---@field zfar number The distance of the view's origin to the far clipping plane
---@field znearviewmodel number The distance of the view's origin to the near clipping plane for the viewmodel
---@field zfarviewmodel number The distance of the view's origin to the far clipping plane for the viewmodel
---@field bloomtone boolean Whether default engine bloom and tonemapping are enabled at this instant for this view.
---@field subrect boolean Whether `m_bRenderToSubrectOfLargerScreen` if set for this view.
---@field offcenter table  It's a table with 4 keys, controlling what portion of the screen to draw: * left - where the left edge starts. Natural value is 0. * right - where the right edge ends. Natural value is equal to w (the width of the viewport). * top - where the `bottom` edge starts. Natural value is 0. * bottom - where the `top` edge ends. Natural value is equal to h (the height of the viewport).  Note that top and bottom are reversed.  This will not be present if offscreen rendering is not enabled for this view.  See Structures/ViewData for more info. 
local ViewSetup = {}

