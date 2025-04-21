---@meta

--- Used primarily for adding new soundscript entries.
sound = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a sound script. It can also override sounds, which seems to only work when set on the server.
---
--- You can find a list of common sound scripts that are shipped with the game by default here: [Common Sounds](https://wiki.facepunch.com/gmod/Common_Sounds).
---
--- A list of sound scripts can be retrieved with [sound.GetTable](https://wiki.facepunch.com/gmod/sound.GetTable).
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.Add)
---@param soundData SoundData The sounds properties. See Structures/SoundData
function sound.Add(soundData) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Overrides sounds defined inside of a txt file; typically used for adding map-specific sounds.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.AddSoundOverrides)
---@param filepath string Path to the script file to load.
function sound.AddSoundOverrides(filepath) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Emits a sound hint to the game elements to react to, for example to repel or attract antlions.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.EmitHint)
---@param hint number The hint to emit. This can be a bit flag. See Enums/SOUND
---@param pos Vector The position to emit the hint at
---@param volume number The volume or radius of the hint
---@param duration number The duration of the hint in seconds
---@param owner? Entity If set, the sound hint will be ignored/deleted when the given entity is destroyed.
function sound.EmitHint(hint, pos, volume, duration, owner) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a sound from a function.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.Generate)
---@param identifier string A unique identifier for the sound.
---
--- 			You cannot override already existing ones.
---@param samplerate number The sample rate of the sound. Must be `11025`, `22050` or `44100`.
---@param length number The length in seconds of the sound to generate.
---@param callbackOrData fun(sampleIndex: number):(sampleValue: number)|table A function which will be called to generate every sample on the sound.
---
---
---
--- Function argument(s):
--- * number `sampleIndex` - The current sample number.
---
--- Function return value(s):
--- * number `sampleValue` - The return value must be between `-1.0` and `1.0`.
--- Other values will wrap back to the -1 to 1 range and basically clip.
--- There are **65535** possible quantifiable values between `-1` and `1`.
---
--- 		This argument can also be given a table of samples, where values must range from `-1` to `1`.
--- 		This argument can also be a string of raw 16bit binary data, (each sample is unsigned short).
---@param loopStart? number Sample ID of the loop start. If given, the sound will be looping and will restart playing at given position after reaching its end.
function sound.Generate(identifier, samplerate, length, callbackOrData, loopStart) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the most dangerous/closest sound hint based on given location and types of sounds to sense.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.GetLoudestSoundHint)
---@param types number The types of sounds to choose from. See Enums/SOUND.
---@param pos Vector The position to sense sounds at.
---@return table # A table with Structures/SoundHintData structure or `nil` if no sound hints are nearby.
function sound.GetLoudestSoundHint(types, pos) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns properties of the soundscript.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.GetProperties)
---@param name string The name of the sound script
---@return SoundData # The properties of the soundscript. See Structures/SoundData
function sound.GetProperties(name) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a list of all registered sound scripts.
---
--- New ones can be registered using [sound.Add](https://wiki.facepunch.com/gmod/sound.Add), and detailed information about each one can be retrieved via [sound.GetProperties](https://wiki.facepunch.com/gmod/sound.GetProperties).
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.GetTable)
---@return string[] # The list/array of all registered sound scripts ( No other information is provided )
function sound.GetTable() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Plays a sound from the specified position in the world.
--- If you want to play a sound without a position, such as a UI sound, use [surface.PlaySound](https://wiki.facepunch.com/gmod/surface.PlaySound) instead.
---
--- This function is similar to [Global.EmitSound](https://wiki.facepunch.com/gmod/Global.EmitSound), but with less options.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.Play)
---@param snd string The sound to play. This should either be a sound script name (sound.Add) or a file path relative to the `sound/` folder. (Make note that it's not sound**s**)
---@param pos Vector Where the sound should play.
---@param level? number Sound level in decibels. 75 is normal. Ranges from 20 to 180, where 180 is super loud. This affects how far away the sound will be heard, see Enums/SNDLVL.
---@param pitch? number The sound pitch. Range is from 0 to 255. 100 is normal pitch.
---@param volume? number Output volume of the sound in range 0 to 1.
---@param dsp? number The DSP preset for this sound. [List of DSP presets](https://developer.valvesoftware.com/wiki/Dsp_presets)
function sound.Play(snd, pos, level, pitch, volume, dsp) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Plays a file from GMod directory. You can find a list of all error codes [here](http://www.un4seen.com/doc/#bass/BASS_ErrorGetCode.html)
---
--- For external file/stream playback, see [sound.PlayURL](https://wiki.facepunch.com/gmod/sound.PlayURL).
---
--- This fails for looping .wav files in 3D mode.
---
--- This fails with unicode file names.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.PlayFile)
---@param path string The path to the file to play.
---
--- Unlike other sound functions and structures, the path is relative to `garrysmod/` instead of `garrysmod/sound/`
---@param flags string Flags for the sound. Can be one or more of following, separated by a space (" "):
--- * 3d - Makes the sound 3D, so you can set its position
--- * mono - Forces the sound to have only one channel
--- * noplay - Forces the sound not to play as soon as this function is called
--- * noblock - Disables streaming in blocks. It is more resource-intensive, but it is required for IGModAudioChannel:SetTime.
---
--- If you don't want to use any of the above, you can just leave it as "".
---@param callback fun(channel: IGModAudioChannel, errorID: number, errorName: string) Callback function that is called as soon as the the stream is loaded.
---
--- Function argument(s):
--- * IGModAudioChannel `channel` - The sound channel. Will be nil if an error occurred.
--- * number `errorID` - ID of an error if an error has occurred. Will be nil, otherwise.
--- * string `errorName` - Name of an error if an error has occurred. Will be nil, otherwise.
function sound.PlayFile(path, flags, callback) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Allows you to play external sound files, as well as online radio streams.
--- You can find a list of all error codes [here](http://www.un4seen.com/doc/#bass/BASS_ErrorGetCode.html)
---
--- For offline file playback, see [sound.PlayFile](https://wiki.facepunch.com/gmod/sound.PlayFile).
---
--- Due to a bug with [BASS](http://www.un4seen.com/), AAC codec streams cannot be played in 3D mode.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.PlayURL)
---@param url string The URL of the sound to play
---@param flags string Flags for the sound. Can be one or more of following, separated by a space (`" "`):
--- * 3d - Makes the sound 3D, so you can set its position
--- * mono - Forces the sound to have only one channel
--- * noplay - Forces the sound not to play as soon as this function is called
--- * noblock - Disables streaming in blocks. It is more resource-intensive, but it is required for IGModAudioChannel:SetTime.
---
--- If you don't want to use any of the above, you can just leave it as `""`.
---@param callback fun(channel: IGModAudioChannel, errorID: number, errorName: string) Callback function that is called as soon as the the stream is loaded.
---
--- Function argument(s):
--- * IGModAudioChannel `channel` - The sound channel. Will be nil if an error occurred.
--- * number `errorID` - ID of an error if an error has occurred. Will be nil, otherwise.
--- * string `errorName` - Name of an error if an error has occurred. Will be nil, otherwise.
function sound.PlayURL(url, flags, callback) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the gender of a specific actor (model). This is a system from [base Half-Life 2](https://developer.valvesoftware.com/wiki/Global_actors) - `global_actors.txt`.
---
--- This will affect what voice lines `npc_citizen` will use when they have the given model set.
---
--- It is not limited to `npc_citizens` - any sound played on any entity with given model can have gender specific sounds playing, including soundscripts, by including `$gender` token in the sound file path.
---
--- **WARNING**: Internally the gender is stored by model file name only (i.e. `models/alyx.mdl` would be stored as `alyx`), not the full path! Be aware of potential collisions.
---
---[View wiki](https://wiki.facepunch.com/gmod/sound.SetActorGender)
---@param modelPath string Path to the model file to set the gender of.
---@param gender string Gender to set. Only 2 options are permitted: `female` and `male`. Any other option will be ignored.
function sound.SetActorGender(modelPath, gender) end
