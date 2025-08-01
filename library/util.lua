---@meta

--- This is the list of utility functions.
util = {}

--- `util.worldpicker` is for picking an entity in the world while [GUI](https://wiki.facepunch.com/gmod/gui) is open.
util.worldpicker = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds the specified string to a string table, which will cache it and network it to all clients automatically.
--- Whenever you want to create a net message with [net.Start](https://wiki.facepunch.com/gmod/net.Start), you must add the name of that message as a networked string via this function.
---
--- If the passed string already exists, nothing will happen and the ID of the existing item will be returned.
---
--- **NOTE**: Each unique network name needs to be pooled once - do not put this function call into any other functions if you're using a constant string. Preferable place for this function is in a serverside lua file, or in a shared file with the [net.Receive](https://wiki.facepunch.com/gmod/net.Receive) function.
---
--- The string table used for this function does not interfere with the engine string tables and has 4095 slots.
--- This limit is shared among all entities, SetNW* and SetGlobal* functions. If you exceed the limit, you cannot create new variables, and you will get the following warning:
--- ```lua
--- Warning:  Table networkstring is full, can't add [key]
--- ```
--- **WARNING**: Existing variables will still get updated without the warning. You can check the limit by counting up until [util.NetworkIDToString](https://wiki.facepunch.com/gmod/util.NetworkIDToString) returns nil
---
---[View wiki](https://wiki.facepunch.com/gmod/util.AddNetworkString)
---@param str string Adds the specified string to the string table.
---@return number # The id of the string that was added to the string table.
--- Same as calling util.NetworkStringToID.
function util.AddNetworkString(str) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Function used to calculate aim vector from 2D screen position. It is used in SuperDOF calculate Distance.
---
--- Essentially a generic version of [gui.ScreenToVector](https://wiki.facepunch.com/gmod/gui.ScreenToVector).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.AimVector)
---@param ViewAngles Angle View angles
---@param ViewFOV number View Field of View
---@param x number Mouse X position
---@param y number Mouse Y position
---@param scrWidth number Screen width
---@param scrHeight number Screen height
---@return Vector # Calculated aim vector
function util.AimVector(ViewAngles, ViewFOV, x, y, scrWidth, scrHeight) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Decodes the specified string from base64.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Base64Decode)
---@param str string String to decode.
---@return string # The raw bytes of the decoded string.
function util.Base64Decode(str) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Encodes the specified string to base64.
---
--- **NOTE**: Unless disabled with the `inline` argument, the Base64 returned is compliant to the RFC 2045 standard. **This means it will have a line break after every 76th character.**
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Base64Encode)
---@param str string String to encode.
---@param inline? boolean `true` to disable RFC 2045 compliance (newline every 76th character)
---@return string # Base 64 encoded string.
function util.Base64Encode(str, inline) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Applies explosion damage to all entities in the specified radius. Performs block checking.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.BlastDamage)
---@param inflictor Entity The entity that caused the damage.
---@param attacker Entity The entity that attacked.
---@param damageOrigin Vector The center of the explosion
---@param damageRadius number The radius in which entities will be damaged.
---@param damage number The amount of damage to be applied.
function util.BlastDamage(inflictor, attacker, damageOrigin, damageRadius, damage) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Applies spherical damage based on damage info to all entities in the specified radius.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.BlastDamageInfo)
---@param dmg CTakeDamageInfo The information about the damage
---@param damageOrigin Vector Center of the spherical damage
---@param damageRadius number The radius in which entities will be damaged.
function util.BlastDamageInfo(dmg, damageOrigin, damageRadius) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Compresses the given string using the [LZMA](https://en.wikipedia.org/wiki/LZMA) algorithm.
---
--- Use with [net.WriteData](https://wiki.facepunch.com/gmod/net.WriteData) and [net.ReadData](https://wiki.facepunch.com/gmod/net.ReadData) for networking and  [util.Decompress](https://wiki.facepunch.com/gmod/util.Decompress) to decompress the data.
---
--- **NOTE**: The output of this function will have the uncompressed size of the data prepended to it as an 8-byte little-endian integer. [Source](https://github.com/garrynewman/bootil/blob/beb4cec8ad29533965491b767b177dc549e62d23/src/Bootil/Utility/CompressionLZMA.cpp#L56-L63)
---
--- You may therefore experience issues using the output of this function **_outside of Garry's Mod_**. If you need to do this, you will need to manually strip the first 8 bytes from the compressed output, or use third-party tools such as [gmod-lzma](https://github.com/WilliamVenner/gmod-lzma-rs) to decompress the output instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Compress)
---@param str string String to compress.
---@return string # The compressed string, or an empty string if the input string was zero length ("").
function util.Compress(str) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Generates the [CRC Checksum](https://en.wikipedia.org/wiki/Cyclic_redundancy_check) of the specified string.
---
--- **WARNING**: This is NOT a hashing function. It is a checksum, typically used for error detection/data corruption detection. It is possible for this function to generate "collisions", where two different strings will produce the same CRC. If you need a hashing function, use [util.SHA256](https://wiki.facepunch.com/gmod/util.SHA256).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.CRC)
---@param stringToChecksum string The string to calculate the checksum of.
---@return string # The unsigned 32 bit checksum.
function util.CRC(stringToChecksum) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the current date formatted like '2012-10-31 18-00-00'
---
---[View wiki](https://wiki.facepunch.com/gmod/util.DateStamp)
---@return string # date
function util.DateStamp() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a trace and paints a decal to the surface hit.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Decal)
---@param name string The name of the decal to paint.
---@param start Vector The start of the trace.
---@param _end Vector The end of the trace.
---@param filter? Entity If set, the decal will not be able to be placed on given entity. Can also be a table of entities.
function util.Decal(name, start, _end, filter) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Performs a trace and paints a decal to the surface hit.
---
--- **NOTE**: This function has trouble spanning across multiple brushes on the map.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.DecalEx)
---@param material IMaterial The name of the decal to paint. Can be retrieved with util.DecalMaterial.
---@param ent Entity The entity to apply the decal to
---@param position Vector The position of the decal.
---@param normal Vector The direction of the decal.
---@param color table The color of the decal. Uses the Color.
---
--- This only works when used on a brush model and only if the decal material has set `$vertexcolor` to `1`.
---@param w number The width scale of the decal.
---@param h number The height scale of the decal.
function util.DecalEx(material, ent, position, normal, color, w, h) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the full material path by the decal name. Used with [util.DecalEx](https://wiki.facepunch.com/gmod/util.DecalEx).
---
--- If decal specifies multiple materials, a random one will be chosen.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.DecalMaterial)
---@param decalName string Name of the decal.
---@return string # Material path of the decal.
function util.DecalMaterial(decalName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Decompresses the given string using [LZMA](https://en.wikipedia.org/wiki/LZMA) algorithm. Used to decompress strings previously compressed with [util.Compress](https://wiki.facepunch.com/gmod/util.Compress).
---
--- **NOTE**: This function expects the compressed input data to have the uncompressed size of the data prepended to it as an 8-byte little-endian integer. [Source](https://github.com/garrynewman/bootil/blob/beb4cec8ad29533965491b767b177dc549e62d23/src/Bootil/Utility/CompressionLZMA.cpp#L101)
---
--- If your compressed input data was compressed by [util.Compress](https://wiki.facepunch.com/gmod/util.Compress), you don't need to worry about this - the uncompressed size of the data is already prepended to its output.
---
--- However, if your compressed data was produced using standard tools **_outside of Garry's Mod_**, you will need to manually prepend the length of the uncompressed data to its compressed form as an 8-byte little endian integer.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Decompress)
---@param compressedString string The compressed string to decompress.
---@param maxSize? number The maximum size of uncompressed data in bytes, if greater it fails.
---@return string|nil # The original, decompressed string or `nil` on failure or invalid input. Also returns empty string if the input string was zero length ("").
function util.Decompress(compressedString, maxSize) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the distance between a line and a point in 3d space.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.DistanceToLine)
---@param lineStart Vector Start of the line.
---@param lineEnd Vector End of the line.
---@param pointPos Vector The position of the point.
---@return number # Distance from line.
---@return Vector # Nearest point on line.
---@return number # Distance along line from start.
function util.DistanceToLine(lineStart, lineEnd, pointPos) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates an effect with the specified data.
---
--- For Orange Box `.pcf` particles, see [Global.ParticleEffect](https://wiki.facepunch.com/gmod/Global.ParticleEffect), [Global.ParticleEffectAttach](https://wiki.facepunch.com/gmod/Global.ParticleEffectAttach) and  [Global.CreateParticleSystem](https://wiki.facepunch.com/gmod/Global.CreateParticleSystem).
---
--- 	**NOTE**: When dispatching an effect from the server, some values may be clamped for networking optimizations. Visit the Set accessors on [CEffectData](https://wiki.facepunch.com/gmod/CEffectData) to see which ones are affected.
---
--- You will need to couple this function with [Global.IsFirstTimePredicted](https://wiki.facepunch.com/gmod/Global.IsFirstTimePredicted) if you want to use it in a [predicted hook](https://wiki.facepunch.com/gmod/Prediction).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Effect)
---@param effectName string The name of the effect to create.
---
--- You can find a list of Default_Effects. You can create your own, [example effects can be found here](https://github.com/Facepunch/garrysmod/tree/master/garrysmod/gamemodes/sandbox/entities/effects) and [here](https://github.com/Facepunch/garrysmod/tree/master/garrysmod/gamemodes/base/entities/effects).
---@param effectData CEffectData The effect data describing the effect.
---@param allowOverride? boolean Whether Lua-defined effects should override engine-defined effects with the same name for this/single function call.
---@param ignorePredictionOrRecipientFilter? boolean|CRecipientFilter Can either be a boolean to ignore the prediction filter or a CRecipientFilter.
---
--- Set this to true if you wish to call this function in multiplayer from server.
function util.Effect(effectName, effectData, allowOverride, ignorePredictionOrRecipientFilter) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Filters given text using Steam's filtering system. The function will obey local client's Steam settings for chat filtering:
---
--- **NOTE**: In some cases, especially in a chatbox, messages from some players may return an empty string if the context argument used for filtering is `TEXT_FILTER_CHAT` and [if the local player has blocked the sender of the message on Steam](https://github.com/Facepunch/garrysmod-issues/issues/5161#issuecomment-1035153941).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.FilterText)
---@param str string String to filter.
---@param context? number Filtering context. See Enums/TEXT_FILTER.
---@param player? Player Used to determine if the text should be filtered according to local user's Steam chat filtering settings.
---@return string # The filtered text based on given settings.
function util.FilterText(str, context, player) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Converts the full path of the given file to a relative path.
--- You can use [util.RelativePathToFull_Menu](https://wiki.facepunch.com/gmod/util.RelativePathToFull_Menu) to convert the relative path back to the full path.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.FullPathToRelative_Menu)
---@param fullPath string The **full** path to a file.
---@param fsPath? string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return string # The relative path to the given file.
function util.FullPathToRelative_Menu(fullPath, fsPath) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the ID of a custom model activity. This is useful for models that define custom ones.
---
--- See [util.GetActivityNameByID](https://wiki.facepunch.com/gmod/util.GetActivityNameByID) for a function that does the opposite.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetActivityIDByName)
---@param string string The name of an activity, as defined in the model's `.qc` at compile time.
---@return number # The ID of the activity. See also Enums/ACT.
function util.GetActivityIDByName(string) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a name for given activity ID. This is useful for models that define custom activities.
---
--- See [util.GetActivityIDByName](https://wiki.facepunch.com/gmod/util.GetActivityIDByName) for a function that does the opposite.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetActivityNameByID)
---@param id number The ID of an activity from some hook. See also Enums/ACT.
---@return string # The associated name with given activity ID.
function util.GetActivityNameByID(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the ID of a custom model animation event. This is useful for models that define custom animation events.
---
--- See [util.GetAnimEventNameByID](https://wiki.facepunch.com/gmod/util.GetAnimEventNameByID) for a function that does the opposite.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetAnimEventIDByName)
---@param string string The name of an model animation event, as defined in the model's `.qc` at compile time.
---@return number # The ID of an animation event, typically for usage with ENTITY:HandleAnimEvent.
function util.GetAnimEventIDByName(string) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a name for given automatically generated numerical animation event ID. This is useful for models that define custom animation events.
---
--- See [util.GetAnimEventIDByName](https://wiki.facepunch.com/gmod/util.GetAnimEventIDByName) for a function that does the opposite.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetAnimEventNameByID)
---@param id number The ID of an animation event, typically from ENTITY:HandleAnimEvent.
---@return string # The associated name with given event ID.
function util.GetAnimEventNameByID(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a table containing the info about the model. The model will be loaded and cached if it was not previously.
---
--- **NOTE**: This function will silently fail if used on models with following strings in them:
--- * _shared
--- * _anims
--- * _gestures
--- * _anim
--- * _postures
--- * _gst
--- * _pst
--- * _shd
--- * _ss
--- * _anm
--- * _include
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetModelInfo)
---@param mdl string The model path to retrieve information about.
---@return ModelInfo # The model info. See Structures/ModelInfo for details.
function util.GetModelInfo(mdl) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Retrieves vertex, triangle, and bone data for the visual meshes of a given model.
---
--- **NOTE**: This does not work on brush models (Models with names in the format `*number`)
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetModelMeshes)
---@param model string The full path to the model to get the visual meshes of.
---@param lod? number Which of the model's Level of Detail (LOD) models to retrieve.
---
--- `0` is the best quality with higher numbers progressively lowering the quality.
---@param bodygroupMask? number The combination of bodygroups to retrieve meshes for.
---
--- For more information, see Entity:SetBodyGroups
---@return table # A sequential table of Structures/ModelMeshData
---
--- Each index in this table corresponds to a mesh within the model passed as an argument to this function.
---@return table # A sequential table of Structures/BoneBindPose
---
--- This tables indices are bone IDs for the Structures/BoneBindPose stored at each index.
function util.GetModelMeshes(model, lod, bodygroupMask) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Gets persistent data of an offline player using their SteamID.
---
--- See also [Player:GetPData](https://wiki.facepunch.com/gmod/Player:GetPData) for a more convenient version of this function for online players, [util.RemovePData](https://wiki.facepunch.com/gmod/util.RemovePData) and
---  [util.SetPData](https://wiki.facepunch.com/gmod/util.SetPData) for the other accompanying functions.
---
--- **NOTE**: This function internally uses [util.SteamIDTo64](https://wiki.facepunch.com/gmod/util.SteamIDTo64), it previously utilized [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) which can cause collisions (two or more players sharing the same PData entry). This function now only uses the old method as a fallback if the name isn't found.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetPData)
---@param steamID string SteamID of the player, in the `STEAM_0:0:0` format. See Player:SteamID.
---@param name string Variable name to get the value of
---@param default string The default value, in case there's nothing stored
---@return string # The stored value
function util.GetPData(steamID, name, default) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new PixVis handle. See [util.PixelVisible](https://wiki.facepunch.com/gmod/util.PixelVisible).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetPixelVisibleHandle)
---@return pixelvis_handle_t # PixVis
function util.GetPixelVisibleHandle() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Utility function to quickly generate a trace table that starts at the players view position, and ends `32768` units along a specified direction.
---
--- For usage with [util.TraceLine](https://wiki.facepunch.com/gmod/util.TraceLine) and similar functions.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetPlayerTrace)
---@param ply Player The player the trace should be based on
---@param dir? Vector The direction of the trace. By default falls back to the direction the player is looking in.
---@return Trace # The trace data. See Structures/Trace
function util.GetPlayerTrace(ply, dir) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets information about the sun position and obstruction or nil if there is no sun.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetSunInfo)
---@return table # The sun info. See Structures/SunInfo
function util.GetSunInfo() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns data of a [surface property](https://developer.valvesoftware.com/wiki/Material_surface_properties) at given ID. New surface properties can be added via [physenv.AddSurfaceData](https://wiki.facepunch.com/gmod/physenv.AddSurfaceData).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetSurfaceData)
---@param id number Surface property ID. You can get it from Structures/TraceResult or using util.GetSurfaceIndex.
---@return SurfacePropertyData # The data or no value if there is no valid surface property at given index.
function util.GetSurfaceData(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the matching surface property index for the given surface property name.
---
--- See also [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) and [util.GetSurfacePropName](https://wiki.facepunch.com/gmod/util.GetSurfacePropName) for opposite function.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetSurfaceIndex)
---@param surfaceName string The name of the surface.
---@return number # The surface property index, or -1 if name doesn't correspond to a valid surface property.
function util.GetSurfaceIndex(surfaceName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the name of a surface property at given ID.
---
--- See also [util.GetSurfaceData](https://wiki.facepunch.com/gmod/util.GetSurfaceData) and [util.GetSurfaceIndex](https://wiki.facepunch.com/gmod/util.GetSurfaceIndex) for opposite function.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetSurfacePropName)
---@param id number Surface property ID. You can get it from Structures/TraceResult.
---@return string # The name or an empty string if there is no valid surface property at given index.
function util.GetSurfacePropName(id) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns a table of all SteamIDs that have a usergroup.
---
--- **NOTE**: This returns the original usergroups table, changes done to this table are not retroactive and will only affect newly connected users
---
--- **NOTE**: This returns only groups that are registered in the **settings/users.txt** file of your server.
---
--- In order to get the usergroup of a connected player, please use [Player:GetUserGroup](https://wiki.facepunch.com/gmod/Player:GetUserGroup) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.GetUserGroups)
---@return table # A table of users where the key is the SteamID of the user and the value is a table with 2 fields:
--- * string name - Player Steam name
--- * string group - Player usergroup name
function util.GetUserGroups() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a Ray-OBB (Orientated Bounding Box) intersection and returns position, normal and the fraction if there was an intersection.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IntersectRayWithOBB)
---@param rayStart Vector Origin or start position of the ray.
---@param rayDelta Vector The ray vector itself, the ray end point relative to the start point. Can be implemented as `direction * distance`
---
--- Note that in this implementation, the ray is not infinite - it's only a segment.
---@param boxOrigin Vector The center of the box.
---@param boxAngles Angle The angle of the box.
---@param boxMins Vector The min position of the box.
---@param boxMaxs Vector The max position of the box.
---@return Vector # Hit position, nil if not hit.
---@return Vector # Normal/direction vector, nil if not hit.
---@return number # Fraction of trace used, nil if not hit.
function util.IntersectRayWithOBB(rayStart, rayDelta, boxOrigin, boxAngles, boxMins, boxMaxs) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a [ray-plane intersection](https://en.wikipedia.org/wiki/Line%E2%80%93plane_intersection) and returns the hit position or nil.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IntersectRayWithPlane)
---@param rayOrigin Vector Origin/start position of the ray.
---@param rayDirection Vector The direction of the ray.
---@param planePosition Vector Any position of the plane.
---@param planeNormal Vector The normal vector of the plane.
---@return Vector # The position of intersection, nil if not hit.
function util.IntersectRayWithPlane(rayOrigin, rayDirection, planePosition, planeNormal) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a ray-sphere intersection and returns the intersection positions or nil.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IntersectRayWithSphere)
---@param rayOrigin Vector Origin/start position of the ray.
---@param rayDelta Vector The end position of the ray relative to the start position. Equivalent of `direction * distance`.
---@param spherePosition Vector Any position of the sphere.
---@param sphereRadius number The radius of the sphere.
---@return number # The first intersection position along the ray, or `nil` if there is no intersection.
---@return number # The second intersection position along the ray, or `nil` if there is no intersection.
function util.IntersectRayWithSphere(rayOrigin, rayDelta, spherePosition, sphereRadius) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether a binary module is installed and is resolvable by [Global.require](https://wiki.facepunch.com/gmod/Global.require).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsBinaryModuleInstalled)
---@param name string Name of the binary module, exactly the same as you would enter it as the argument to Global.require.
---@return boolean # Whether the binary module is installed and Global.require can resolve it.
function util.IsBinaryModuleInstalled(name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a box-sphere intersection and returns whether there was an intersection or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsBoxIntersectingSphere)
---@param boxMin Vector The minimum extents of the Axis-Aligned box.
---@param boxMax Vector The maximum extents of the Axis-Aligned box.
---@param shpere2Position Vector Any position of the sphere.
---@param sphere2Radius number The radius of the sphere.
---@return boolean # `true` if there is an intersection, `false` otherwise.
function util.IsBoxIntersectingSphere(boxMin, boxMax, shpere2Position, sphere2Radius) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Checks if a certain position is within the world bounds.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsInWorld)
---@param position Vector Position to check.
---@return boolean # Whether the vector is in world.
function util.IsInWorld(position) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the model is loaded in the game.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsModelLoaded)
---@param modelName string Name/Path of the model to check.
---@return boolean # Returns true if the model is loaded in the game; otherwise false.
function util.IsModelLoaded(modelName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs OBB on OBB intersection test.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsOBBIntersectingOBB)
---@param box1Origin Vector The center of the first box.
---@param box1Angles Angle The angles of the first box.
---@param box1Mins Vector The min position of the first box.
---@param box1Maxs Vector The max position of the first box.
---@param box2Origin Vector The center of the second box.
---@param box2Angles Angle The angles of the second box.
---@param box2Mins Vector The min position of the second box.
---@param box2Maxs Vector The max position of the second box.
---@param tolerance number Tolerance for error. Leave at 0 if unsure.
---@return boolean # Whether there is an intersection.
function util.IsOBBIntersectingOBB(
	box1Origin,
	box1Angles,
	box1Mins,
	box1Maxs,
	box2Origin,
	box2Angles,
	box2Mins,
	box2Maxs,
	tolerance
)
end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether a point is within a cone or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsPointInCone)
---@param point Vector The position of the point to test.
---@param coneOrigin Vector The position of the cone tip.
---@param coneAxis Vector The direction of the cone.
---@param coneSine number The sine of the cone's angle.
---@param coneLength number Length of the cone's axis.
---@return boolean # `true` if the point is within the cone, `false` otherwise.
function util.IsPointInCone(point, coneOrigin, coneAxis, coneSine, coneLength) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a ray-ray intersection and returns whether there was an intersection or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsRayIntersectingRay)
---@param ray1Start Vector Start position of the first ray.
---@param ray1End Vector End position of the first ray.
---@param ray2Start Vector Start position of the second ray.
---@param ray2End Vector End position of the second ray.
---@return boolean # `true` if there is an intersection, `false` otherwise.
---@return number # Distance from start of ray 1 to the intersection, if there was one.
---@return number # Distance from start of ray 2 to the intersection, if there was one.
function util.IsRayIntersectingRay(ray1Start, ray1End, ray2Start, ray2End) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Check whether the skybox is visible from the point specified.
---
--- **NOTE**: This will always return true in fullbright maps.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsSkyboxVisibleFromPoint)
---@param position Vector The position to check the skybox visibility from.
---@return boolean # Whether the skybox is visible from the position.
function util.IsSkyboxVisibleFromPoint(position) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whether a sphere is intersecting a cone or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsSphereIntersectingCone)
---@param sphereCenter Vector The center position of the sphere to test.
---@param sphereRadius number The radius of the sphere to test.
---@param coneOrigin Vector The position of the cone tip.
---@param coneAxis Vector The direction of the cone.
---@param coneSine number The math.sin of the cone's angle.
---@param coneCosine number The math.cos of the cone's angle.
---@return boolean # `true` if the sphere intersects the cone, `false` otherwise.
function util.IsSphereIntersectingCone(sphereCenter, sphereRadius, coneOrigin, coneAxis, coneSine, coneCosine) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a sphere-sphere intersection and returns whether there was an intersection or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsSphereIntersectingSphere)
---@param sphere1Position Vector Any position of the first sphere.
---@param sphere1Radius number The radius of the first sphere.
---@param sphere2Position Vector Any position of the second sphere.
---@param sphere2Radius number The radius of the second sphere.
---@return boolean # `true` if there is an intersection, `false` otherwise.
function util.IsSphereIntersectingSphere(sphere1Position, sphere1Radius, sphere2Position, sphere2Radius) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the specified model is valid.
---
---
--- A model is considered invalid in following cases:
--- * Starts with a space or **maps**
--- * Doesn't start with **models**
--- * Contains any of the following:
---   * `_gestures`
---   * `_animations`
---   * `_postures`
---   * `_gst`
---   * `_pst`
---   * `_shd`
---   * `_ss`
---   * `_anm`
---   * `.bsp`
---   * `cs_fix`
--- * If the model isn't precached on the server, AND if the model file doesn't exist on disk
--- * If precache failed
--- * Model is the error model
---
--- Running this function will also precache the model.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsValidModel)
---@param modelName string Name/Path of the model to check.
---@return boolean # Whether the model is valid or not. Returns false clientside if the model is not precached by the server.
function util.IsValidModel(modelName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Checks if given numbered physics object of given entity is valid or not. Most useful for ragdolls.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsValidPhysicsObject)
---@param ent Entity The entity
---@param physobj number Number of the physics object to test
---@return boolean # true is valid, false otherwise
function util.IsValidPhysicsObject(ent, physobj) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the specified prop is valid.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsValidProp)
---@param modelName string Name/Path of the model to check.
---@return boolean # Returns true if the specified prop is valid; otherwise false.
function util.IsValidProp(modelName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the specified model name points to a valid ragdoll.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.IsValidRagdoll)
---@param ragdollName string Name/Path of the ragdoll model to check.
---@return boolean # Returns true if the specified model name points to a valid ragdoll; otherwise false.
function util.IsValidRagdoll(ragdollName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a JSON string to a Lua table.
---
--- See [util.TableToJSON](https://wiki.facepunch.com/gmod/util.TableToJSON) for the opposite function.
---
--- Colors will not have the color metatable.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.JSONToTable)
---@param json string The JSON string to convert.
---@param ignoreLimits? boolean ignore the depth and breadth limits, **use at your own risk!**.
--- If this is false, there is a limit of 15,000 keys total.
---@param ignoreConversions? boolean ignore string to number conversions for table keys.
---
--- 	if this is false, keys are converted to numbers wherever possible. This means using [Player:SteamID64](https://wiki.facepunch.com/gmod/Player:SteamID64) as keys won't work.
---@return table|nil # The table containing converted information. Returns `nil` on failure.
function util.JSONToTable(json, ignoreLimits, ignoreConversions) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a Valve KeyValue string (typically from [util.TableToKeyValues](https://wiki.facepunch.com/gmod/util.TableToKeyValues)) to a Lua table.
---
--- **NOTE**: Due to how [table](https://wiki.facepunch.com/gmod/table)s work in Lua, keys will not repeat within a table. See [util.KeyValuesToTablePreserveOrder](https://wiki.facepunch.com/gmod/util.KeyValuesToTablePreserveOrder) for alternative.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.KeyValuesToTable)
---@param keyValues string The KeyValue string to convert.
---@param usesEscapeSequences? boolean If set to true, will replace `\t`, `\n`, `\"` and `\\` in the input text with their escaped variants
---@param preserveKeyCase? boolean Whether we should preserve key case (may fail) or not (always lowercase)
---@return table # The converted table
function util.KeyValuesToTable(keyValues, usesEscapeSequences, preserveKeyCase) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Similar to [util.KeyValuesToTable](https://wiki.facepunch.com/gmod/util.KeyValuesToTable) but it also preserves order of keys.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.KeyValuesToTablePreserveOrder)
---@param keyvals string The key value string
---@param usesEscapeSequences? boolean If set to true, will replace `\t`, `\n`, `\"` and `\\` in the input text with their escaped variants
---@param preserveKeyCase? boolean Whether we should preserve key case (may fail) or not (always lowercase)
---@return table # The output table
function util.KeyValuesToTablePreserveOrder(keyvals, usesEscapeSequences, preserveKeyCase) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a vector in world coordinates based on an entity and local coordinates
---
---[View wiki](https://wiki.facepunch.com/gmod/util.LocalToWorld)
---@param ent Entity The entity lpos is local to
---@param lpos Vector Coordinates local to the ent
---@param bonenum number The bonenumber of the ent lpos is local to
---@return Vector # wpos
function util.LocalToWorld(ent, lpos, bonenum) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Generates the [MD5 hash](https://en.wikipedia.org/wiki/MD5) of the specified string.
--- **WARNING**: MD5 is considered cryptographically broken and is known to be vulnerable to a variety of attacks including duplicate return values. If security or duplicate returns is a concern, use [util.SHA256](https://wiki.facepunch.com/gmod/util.SHA256).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.MD5)
---@param stringToHash string The string to calculate the MD5 hash of.
---@return string # The MD5 hash of the string in hexadecimal form.
function util.MD5(stringToHash) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the networked string associated with the given ID from the string table.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.NetworkIDToString)
---@param stringTableID number ID to get the associated string from.
---@return string # The networked string, or nil if it wasn't found.
function util.NetworkIDToString(stringTableID) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the networked ID associated with the given string from the string table.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.NetworkStringToID)
---@param networkString string String to get the associated networked ID from.
---@return number # The networked ID of the string, or 0 if it hasn't been networked with util.AddNetworkString.
function util.NetworkStringToID(networkString) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Formats a float by stripping off extra `0's` and `.'s`.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.NiceFloat)
---@param float number The float to format.
---@return string # Formatted float.
function util.NiceFloat(float) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a tracer effect with the given parameters.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.ParticleTracer)
---@param name string The name of the tracer effect.
---@param startPos Vector The start position of the tracer.
---@param endPos Vector The end position of the tracer.
---@param doWhiz boolean Play the hit miss(whiz) sound.
function util.ParticleTracer(name, startPos, endPos, doWhiz) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a tracer effect with the given parameters.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.ParticleTracerEx)
---@param name string The name of the tracer effect.
---@param startPos Vector The start position of the tracer.
---@param endPos Vector The end position of the tracer.
---@param doWhiz boolean Play the hit miss(whiz) sound.
---@param entityIndex number Entity index of the emitting entity.
---@param attachmentIndex number Attachment index to be used as origin.
function util.ParticleTracerEx(name, startPos, endPos, doWhiz, entityIndex, attachmentIndex) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the visibility of a square that is always pointed at the camera in the world-space.
---
--- This is typically used for in-game sprites or "billboards". ([render.DrawSprite](https://wiki.facepunch.com/gmod/render.DrawSprite))
---
---[View wiki](https://wiki.facepunch.com/gmod/util.PixelVisible)
---@param position Vector The center of the visibility test.
---@param size number The size of the square to check for visibility.
---@param PixVis pixelvis_handle_t The PixVis handle created with util.GetPixelVisibleHandle.
--- 		Don't use the same handle twice per tick or it will give unpredictable results.
---@return number # Visibility percentage, in range of `[0-1]`. `0` when none of the area is visible, `0.5` when half the area is visible, `1` when all of it is visible, etc.
function util.PixelVisible(position, size, PixVis) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the contents of the position specified.
--- **NOTE**: This function will sample only the world environments. It can be used to check if [Entity:GetPos](https://wiki.facepunch.com/gmod/Entity:GetPos) is underwater for example unlike [Entity:WaterLevel](https://wiki.facepunch.com/gmod/Entity:WaterLevel) which works for players only.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.PointContents)
---@param position Vector Position to get the contents sample from.
---@return CONTENTS # Contents bitflag, see Enums/CONTENTS
function util.PointContents(position) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Precaches a model for later use. Model is cached after being loaded once.
--- 	**WARNING**: Modelprecache is limited to 8192 unique models. When it reaches the limit the game will crash.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.PrecacheModel)
---@param modelName string The model to precache.
function util.PrecacheModel(modelName) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Precaches a sound for later use. Sound is cached after being loaded once.
--- **NOTE**: Soundcache is limited to 16384 unique sounds on the server.
---
--- Broken on purpose because hitting the limit above causes the server to shutdown
--- Ultimately does nothing on client, and only works with sound scripts, not direct paths.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.PrecacheSound)
---@param soundName string The sound to precache.
function util.PrecacheSound(soundName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs a trace with the given origin, direction, and filter.
--- **NOTE**: This function will throw an error in the menu realm because it internally uses util.TraceLine which doesn't exist in the menu realm and thus error.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.QuickTrace)
---@param origin Vector The origin of the trace.
---@param dir Vector The direction of the trace times the distance of the trace. This is added to the origin to determine the endpos.
---@param filter? Entity|Entity[]|string[]|function Entity which should be ignored by the trace. Can also be a table of entities or a function - see Structures/Trace.
---@return TraceResult # Trace result. See Structures/TraceResult.
function util.QuickTrace(origin, dir, filter) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Converts the relative path of a given file to the full path on disk.
--- You can use [util.FullPathToRelative_Menu](https://wiki.facepunch.com/gmod/util.FullPathToRelative_Menu) to convert the full path back to the relative path.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.RelativePathToFull_Menu)
---@param filePath string The relative path of a file, for example: `addons/[Name].gma`
---@param mountPath? string The path to look for the files and directories in. See File_Search_Paths for a list of valid paths.
---@return string # The full path to the file.
function util.RelativePathToFull_Menu(filePath, mountPath) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns which Workshop addon the given file belongs to.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.RelativePathToGMA_Menu)
---@param filePath string The relative path to a file, such as `materials/myMaterial.vmt`.
---@return table # The info about owner addon. Will return nil if the file doesn't belong to an addon. Table Structure:
--- ```lua
--- Author	=	[Addon Author]
--- File	=	[Steam folder]\workshop\content\4000\[Addon ID]/[GMA Name].gma
--- ID	=	[Addon ID]
--- Title	=	[Addon Title]
--- ```
function util.RelativePathToGMA_Menu(filePath) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Removes world decals at given position, in given radius. Does not remove decals on models!
---
---[View wiki](https://wiki.facepunch.com/gmod/util.RemoveDecalsAt)
---@param pos Vector The position at which to remove decals.
---@param distance number Radius of the sphere to remove decals in.
---@param limit? number If set to above 0, only remove this many decals.
---@param permanent? boolean Whether to remove map-spawned decals (`true`), or only gameplay-spawned decals
---  such as bullet holes or anything placed by util.Decal and similar(`false`)
---@return number # How many decals were removed.
function util.RemoveDecalsAt(pos, distance, limit, permanent) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes persistent data of an offline player using their SteamID.
---
--- See also [Player:RemovePData](https://wiki.facepunch.com/gmod/Player:RemovePData) for a more convenient version of this function for online players, [util.SetPData](https://wiki.facepunch.com/gmod/util.SetPData) and
---  [util.GetPData](https://wiki.facepunch.com/gmod/util.GetPData) for the other accompanying functions.
---
--- **NOTE**: This function internally uses [util.SteamIDTo64](https://wiki.facepunch.com/gmod/util.SteamIDTo64), it previously utilized [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) which can cause collisions (two or more players sharing the same PData entry). This function now tries to remove both old and new entries.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.RemovePData)
---@param steamID string SteamID of the player to remove data of, in the `STEAM_0:0:0` format. See Player:SteamID.
---@param name string Variable name to remove
function util.RemovePData(steamID, name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Makes the screen shake.
---
--- **NOTE**: The screen shake effect is rendered by modifying the view origin on the client. If you override the view origin in [GM:CalcView](https://wiki.facepunch.com/gmod/GM:CalcView) you may not be able to see the shake effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.ScreenShake)
---@param pos Vector The origin of the effect.
---
--- Used serverside only, to determine which clients the event should be networked to.
---@param amplitude number The strength of the effect. How far away from its origin the camera will move while shaking.
---@param frequency number How many times per second to change the direction of the camera wobble. 40 is generally enough; values higher are hardly distinguishable.
---@param duration number The duration of the effect in seconds.
---@param radius number The range from the origin within which views will be affected, in Hammer units.
---
--- This is used when networking the event to clients only.
---@param airshake? boolean Whether players in the air should also be affected.
---
--- Used serverside only to determine which clients to send the event to.
---@param filter? CRecipientFilter If set, will only network the screen shake event to players present in the filter.
function util.ScreenShake(pos, amplitude, frequency, duration, radius, airshake, filter) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets persistent data for offline player using their SteamID.
---
--- See also [Player:SetPData](https://wiki.facepunch.com/gmod/Player:SetPData) for a more convenient version of this function for online players, [util.RemovePData](https://wiki.facepunch.com/gmod/util.RemovePData) and
---  [util.GetPData](https://wiki.facepunch.com/gmod/util.GetPData) for the other accompanying functions.
--- **NOTE**: This function internally uses [util.SteamIDTo64](https://wiki.facepunch.com/gmod/util.SteamIDTo64), it previously utilized [Player:UniqueID](https://wiki.facepunch.com/gmod/Player:UniqueID) which could have caused collisions (two or more players sharing the same PData entry).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.SetPData)
---@param steamID string SteamID of the player, in the `STEAM_0:0:0` format. See Player:SteamID.
---@param name string Variable name to store the value in.
---@param value any The value to store.
function util.SetPData(steamID, name, value) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Generates the [SHA-1 hash](https://en.wikipedia.org/wiki/SHA-1) of the specified string.
--- **WARNING**: SHA-1 is considered cryptographically broken and is known to be vulnerable to a variety of attacks. If security is a concern, use [util.SHA256](https://wiki.facepunch.com/gmod/util.SHA256).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.SHA1)
---@param stringToHash string The string to calculate the SHA-1 hash of.
---@return string # The SHA-1 hash of the string in hexadecimal form.
function util.SHA1(stringToHash) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Generates the [SHA-256 hash](https://en.wikipedia.org/wiki/SHA-2) of the specified string. This is unique and will never return the same hash for a different string unlike [util.CRC](https://wiki.facepunch.com/gmod/util.CRC) or [util.MD5](https://wiki.facepunch.com/gmod/util.MD5) which are both vulnerable to duplicate returns.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.SHA256)
---@param stringToHash string The string to calculate the SHA-256 hash of.
---@return string # The SHA-256 hash of the string in hexadecimal form.
function util.SHA256(stringToHash) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Generates a random float value that should be the same on client and server.
---
--- **NOTE**: This function is best used in a [predicted hook](https://wiki.facepunch.com/gmod/prediction)
---
---[View wiki](https://wiki.facepunch.com/gmod/util.SharedRandom)
---@param uniqueName string The seed for the random value
---@param min number The minimum value of the random range
---@param max number The maximum value of the random range
---@param additionalSeed? number The additional seed
---@return number # The random float value
function util.SharedRandom(uniqueName, min, max, additionalSeed) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds a trail to the specified entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.SpriteTrail)
---@param ent Entity Entity to attach trail to
---@param attachmentID number Attachment ID of the entities model to attach trail to. If you are not sure, set this to 0
---@param color table Color of the trail, use Global.Color
---@param additive boolean Should the trail be additive or not
---@param startWidth number Start width of the trail
---@param endWidth number End width of the trail
---@param lifetime number How long it takes to transition from startWidth to endWidth
---@param textureRes number The resolution of trails texture. A good value can be calculated using this formula: 1 / ( startWidth + endWidth ) * 0.5
---@param texture string Path to the texture to use as a trail.
---@return Entity # Entity of created trail ([env_spritetrail](https://developer.valvesoftware.com/wiki/Env_spritetrail))
function util.SpriteTrail(ent, attachmentID, color, additive, startWidth, endWidth, lifetime, textureRes, texture) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a new [Stack](https://wiki.facepunch.com/gmod/Stack) object.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Stack)
---@return Stack # A brand new stack object.
function util.Stack() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Given a [64bit SteamID](https://wiki.facepunch.com/gmod/Player:SteamID64) will return a [STEAM_0:0:0](https://wiki.facepunch.com/gmod/Player:SteamID) style Steam ID.
---
--- **NOTE**: This operation induces data loss. Not all fields of a [64bit SteamID](https://developer.valvesoftware.com/wiki/SteamID) can be represented using the `STEAM_0:0:0` format, specifically the "account type" and "account instance" fields.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.SteamIDFrom64)
---@param id string The 64 bit Steam ID
---@return string # String Player:SteamID style Steam ID representation.
function util.SteamIDFrom64(id) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Converts a [STEAM_0:0:0](https://wiki.facepunch.com/gmod/Player:SteamID) style SteamID to a [64bit SteamID](https://wiki.facepunch.com/gmod/Player:SteamID64).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.SteamIDTo64)
---@param id string The Player:SteamID format SteamID
---@return string # Player:SteamID64 or 0 (as a string) on fail
function util.SteamIDTo64(id) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a string to the specified type.
---
--- This can be useful when dealing with ConVars.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.StringToType)
---@param str string The string to convert
---@param typename string The type to attempt to convert the string to. This can be `vector`, `angle`, `float`, `int`, `bool`, or `string` (case insensitive).
---@return any # The result of the conversion, or nil if a bad type is specified.
function util.StringToType(str, typename) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a table to a JSON string.
---
--- See [util.JSONToTable](https://wiki.facepunch.com/gmod/util.JSONToTable) for the opposite function.
---
--- **WARNING**: All keys are strings in the JSON format, so all keys of other types will be converted to strings!
--- This can lead to loss of data where a number key could be converted into an already existing string key! (for example in a table like this: `{["5"] = "ok", [5] = "BBB"}`)
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TableToJSON)
---@param table table Table to convert.
---@param prettyPrint? boolean Format and indent the JSON.
---@return string # A JSON formatted string containing the serialized data
function util.TableToJSON(table, prettyPrint) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts the given table into a Valve key value string.
---
--- Use [util.KeyValuesToTable](https://wiki.facepunch.com/gmod/util.KeyValuesToTable) to perform the opposite transformation.
---
--- You should consider using [util.TableToJSON](https://wiki.facepunch.com/gmod/util.TableToJSON) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TableToKeyValues)
---@param table table The table to convert.
---@param rootKey? string The root key name for the output KV table.
---@return string # The output.
function util.TableToKeyValues(table, rootKey) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a timer object. The returned timer will be already started with given duration.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.Timer)
---@param duration? number How long you want the timer to be. `Elapsed()` will return true only after this much time has passed.
---@return table # A timer object. It has the following methods:
--- * `Reset()` - Resets and stops the timer.
--- * `Start( duration = 0 )` - (Re)starts the timer with given duration
--- * `Started()` - Returns `true` if the timer has been started. It will continue to return true even after the duration has passed.
--- * `Elapsed()` - Returns `true` if the timer duration has elapsed since its creation or the call to `Start()`
--- * `GetElaspedTime()` - Returns amount of time since timer started.
function util.Timer(duration) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the time since this function has been last called
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TimerCycle)
---@return number # Time since this function has been last called in ms
function util.TimerCycle() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts string or a number to a bool, if possible. Alias of [Global.tobool](https://wiki.facepunch.com/gmod/Global.tobool).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.tobool)
---@param input any A string or a number to convert.
---@return boolean # False if the input is equal to the string or boolean "false", if the input is equal to the string or number "0", or if the input is nil. Returns true otherwise.
---@deprecated You should use Global.tobool instead.
function util.tobool(input) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Runs a trace using the entity's collisionmodel between two points. This does not take the entity's angles into account and will trace its unrotated collisionmodel.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TraceEntity)
---@param tracedata Trace Trace data. See Structures/Trace
---@param ent Entity The entity to use
---@return TraceResult # Trace result. See Structures/TraceResult
function util.TraceEntity(tracedata, ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Identical to [util.TraceHull](https://wiki.facepunch.com/gmod/util.TraceHull) but uses an entity's [Axis-Aligned Bounding Box (AABB)](https://en.wikipedia.org/wiki/Minimum_bounding_box) for `mins`/`maxs` inputs. (These 2 keys will be ignored in the provided table)
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TraceEntityHull)
---@param tracedata HullTrace Trace data. See Structures/HullTrace
---@param ent Entity The entity to use mins/maxs of for the hull trace.
---@return TraceResult # Trace result. See Structures/TraceResult
function util.TraceEntityHull(tracedata, ent) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs an AABB hull (axis-aligned bounding box, aka not rotated) trace with the given trace data.
---
--- This trace type cannot hit hitboxes.
---
--- See [util.TraceLine](https://wiki.facepunch.com/gmod/util.TraceLine) for a simple line ("ray") trace.
---
--- **NOTE**: This function may not always give desired results clientside due to certain physics mechanisms not existing on the client. Use it serverside for accurate results.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TraceHull)
---@param TraceData HullTrace The trace data to use. See Structures/HullTrace
---@return TraceResult # Trace result. See Structures/TraceResult
function util.TraceHull(TraceData) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs an infinitely thin, invisible ray trace (or "trace") in a line based on the input and returns a table that contains information about what, if anything, the trace line hit or intersected.
---
--- Traces intersect with the physics meshes of [solid](https://wiki.facepunch.com/gmod/enums/SOLID), [server-side](https://wiki.facepunch.com/gmod/States), [entities](https://wiki.facepunch.com/gmod/Entity) (including the [game world](https://wiki.facepunch.com/gmod/game.GetWorld)) but cannot detect client-side only entities unless [hitclientonly](https://wiki.facepunch.com/gmod/Structures/Trace#hitclientonly) is set to true.
---
--- See [ents.FindAlongRay](https://wiki.facepunch.com/gmod/ents.FindAlongRay) if you wish for the trace to not stop on first intersection.
--- See [util.TraceHull](https://wiki.facepunch.com/gmod/util.TraceHull) for a "box" type trace.
---
--- Traces do not differentiate between the inside and the outside faces of physics meshes. Because of this, if a trace starts within a solid physics mesh it will hit the inside faces of the physics mesh and may return unexpected values as a result.
---
--- You can use `r_visualizetraces` set to `1` (requires `sv_cheats` set to `1`) to visualize traces in real time for debugging purposes.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TraceLine)
---@param traceConfig Trace A table of data that configures the trace. See Structures/Trace for available options.
---@return TraceResult # A table of information detailing where and what the trace line intersected, or `nil` if the trace is being done before the GM:InitPostEntity hook.
---
--- For the table's format and available options see the Structures/TraceResult page.
function util.TraceLine(traceConfig) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Converts a type to a (nice, but still parsable) string
---
---[View wiki](https://wiki.facepunch.com/gmod/util.TypeToString)
---@param input any What to convert
---@return string # Converted string
function util.TypeToString(input) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns if the user is currently picking an entity.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.worldpicker.Active)
---@return boolean # Is world picking
function util.worldpicker.Active() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Finishes the world picking. This is called when a user presses their mouse after calling [util.worldpicker.Start](https://wiki.facepunch.com/gmod/util.worldpicker.Start).
---
---[View wiki](https://wiki.facepunch.com/gmod/util.worldpicker.Finish)
---@param tr table Structures/TraceResult from the mouse press
function util.worldpicker.Finish(tr) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Starts picking an entity in the world. This will suppress the next mouse click, and instead use it as a direction in the trace sent to the callback.
---
---[View wiki](https://wiki.facepunch.com/gmod/util.worldpicker.Start)
---@param callback fun(tr: table) Function to call after an entity choice has been made.
---
--- Function argument(s):
--- * table `tr` - Structures/TraceResult from the mouse press. `tr.Entity` will return the entity clicked
function util.worldpicker.Start(callback) end
