---@meta

--- Used primarily for adding new soundscript entries.
sound = {}

---[SHARED] Creates a sound script. It can also override sounds, which seems to only work when set on the server.
---
--- You can find a list of common sound scripts that are shipped with the game by default here: Common Sounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.Add)
---@param soundData table The sounds properties. See Structures/SoundData
function sound.Add(soundData) end

---[SHARED] Overrides sounds defined inside of a txt file; typically used for adding map-specific sounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.AddSoundOverrides)
---@param filepath string Path to the script file to load.
function sound.AddSoundOverrides(filepath) end

---[SERVER] Emits a sound hint to the game elements to react to, for example to repel or attract antlions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.EmitHint)
---@param hint number The hint to emit. See Enums/SOUND
---@param pos Vector The position to emit the hint at
---@param volume number The volume or radius of the hint
---@param duration number The duration of the hint in seconds
---@param owner? Entity
function sound.EmitHint(hint, pos, volume, duration, owner) end

---[CLIENT] Creates a sound from a function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.Generate)
---@param indentifier string An unique identified for the sound.
---
--- 			You cannot override already existing ones.
---
---@param samplerate number The sample rate of the sound. Must be `11025`, `22050` or `44100`.
---@param length number The length in seconds of the sound to generate.
---@param callback fun(sample: integer): number A function which will be called to generate every sample on the sound. This function gets the current sample number passed as the first argument. The return value must be between `-1.0` and `1.0`. Other values will wrap back to the -1 to 1 range and basically clip. There are **65535** possible quantifiable values between -1 and 1.
function sound.Generate(indentifier, samplerate, length, callback) end

---[SERVER] Returns the most dangerous/closest sound hint based on given location and types of sounds to sense.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.GetLoudestSoundHint)
---@param types number The types of sounds to choose from. See Enums/SOUND.
---@param pos Vector The position to sense sounds at.
---@return table # A table with Structures/SoundHintData structure or `nil` if no sound hints are nearby.
function sound.GetLoudestSoundHint(types, pos) end

---[SHARED] Returns properties of the soundscript.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.GetProperties)
---@param name string The name of the sound script
---@return table # The properties of the soundscript. See Structures/SoundData
function sound.GetProperties(name) end

---[SHARED] Returns a list of all registered sound scripts.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.GetTable)
---@return table # The list/array of all registered sound scripts ( No other information is provided )
function sound.GetTable() end

---[SHARED] Plays a sound from the specified position in the world.
--- If you want to play a sound without a position, such as a UI sound, use surface.PlaySound instead.
---
--- This function is similar to Global.EmitSound, but with less options.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.Play)
---@param snd string The sound to play. This should either be a sound script name (sound.Add) or a file path relative to the `sound/` folder. (Make note that it's not sound**s**)
---
---@param pos Vector Where the sound should play.
---@param level? number Sound level in decibels. 75 is normal. Ranges from 20 to 180, where 180 is super loud. This affects how far away the sound will be heard.
---@param pitch? number The sound pitch. Range is from 0 to 255. 100 is normal pitch.
---@param volume? number Output volume of the sound in range 0 to 1.
---@param dsp? number The DSP preset for this sound. [List of DSP presets](https://developer.valvesoftware.com/wiki/Dsp_presets)
function sound.Play(snd, pos, level, pitch, volume, dsp) end

---[CLIENT] Plays a file from GMod directory. You can find a list of all error codes [here](http://www.un4seen.com/doc/#bass/BASS_ErrorGetCode.html)
---
--- For external file/stream playback, see sound.PlayURL.
---
--- This fails for looping .wav files in 3D mode.
---
--- This fails with unicode file names.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.PlayFile)
---@param path string The path to the file to play.
---
--- Unlike other sound functions and structures, the path is relative to `garrysmod/` instead of `garrysmod/sound/`
---@param flags string Flags for the sound. Can be one or more of following, separated by a space (" "):
--- * 3d - Makes the sound 3D, so you can set its position
--- * mono - Forces the sound to have only one channel
--- * noplay - Forces the sound not to play as soon as this function is called
--- * noblock - Disables streaming in blocks. It is more resource-intensive, but it is required for IGModAudioChannel:SetTime.
---
---
---
---
--- If you don't want to use any of the above, you can just leave it as "".
---@param callback function Callback function that is called as soon as the the stream is loaded. It has next arguments:
--- * IGModAudioChannel soundchannel - The sound channel. Will be nil if an error occured.
--- * number errorID - ID of an error if an error has occured. Will be nil, otherwise.
--- * string errorName - Name of an error if an error has occured. Will be nil, otherwise.
function sound.PlayFile(path, flags, callback) end

---[CLIENT] Allows you to play external sound files, as well as online radio streams.
--- You can find a list of all error codes [here](http://www.un4seen.com/doc/#bass/BASS_ErrorGetCode.html)
---
--- For offline file playback, see sound.PlayFile.
---
--- Due to a bug with [BASS](http://www.un4seen.com/), AAC codec streams cannot be played in 3D mode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sound.PlayURL)
---@param url string The URL of the sound to play
---@param flags string Flags for the sound. Can be one or more of following, separated by a space (`" "`):
--- * 3d - Makes the sound 3D, so you can set its position
--- * mono - Forces the sound to have only one channel
--- * noplay - Forces the sound not to play as soon as this function is called
--- * noblock - Disables streaming in blocks. It is more resource-intensive, but it is required for IGModAudioChannel:SetTime.
---
---
---
---
--- If you don't want to use any of the above, you can just leave it as `""`.
---@param callback fun(soundchannel: IGModAudioChannel, errorID: number, errorName: string) Callback function that is called as soon as the the stream is loaded. It has the following arguments:
--- * IGModAudioChannel soundchannel - The sound channel
--- * number errorID - ID of an error, if an error has occured
--- * string errorName - Name of an error, if an error has occured
function sound.PlayURL(url, flags, callback) end
