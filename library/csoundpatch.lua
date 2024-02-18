---@meta

--- CSoundPatch class.
---
--- Created with Global.CreateSound
---@class CSoundPatch
local CSoundPatch = {}

---[SHARED] Adjust the pitch, alias the speed at which the sound is being played.
---
--- This invokes the GM:EntityEmitSound.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:ChangePitch)
---@param pitch number The pitch can range from 0-255. Where 100 is the original pitch.
---@param deltaTime? number The time to fade from previous to the new pitch.
function CSoundPatch:ChangePitch(pitch, deltaTime) end

---[SHARED] Adjusts the volume of the sound played.
--- Appears to only work while the sound is being played.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:ChangeVolume)
---@param volume number The volume ranges from 0 to 1.
---@param deltaTime? number Time to fade the volume from previous to new value from.
function CSoundPatch:ChangeVolume(volume, deltaTime) end

---[SHARED] Fades out the volume of the sound from the current volume to 0 in the given amount of seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:FadeOut)
---@param seconds number Fade time.
function CSoundPatch:FadeOut(seconds) end

---[SHARED] Returns the DSP ( Digital Signal Processor ) effect for the sound.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:GetDSP)
---@return number # The DSP effects of the sound List of DSP's are Pick from the [here](https://developer.valvesoftware.com/wiki/Dsp_presets).
function CSoundPatch:GetDSP() end

---[SHARED] Returns the current pitch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:GetPitch)
---@return number # The current pitch, can range from 0-255.
function CSoundPatch:GetPitch() end

---[SHARED] Returns the current sound level.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:GetSoundLevel)
---@return number # The current sound level, see Enums/SNDLVL.
function CSoundPatch:GetSoundLevel() end

---[SHARED] Returns the current volume.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:GetVolume)
---@return number # The current volume, ranging from 0 to 1.
function CSoundPatch:GetVolume() end

---[SHARED] Returns whenever the sound is being played.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:IsPlaying)
---@return boolean # Is playing or not
function CSoundPatch:IsPlaying() end

---[SHARED] Starts to play the sound. This will reset the sound's volume and pitch to their default values. See CSoundPatch:PlayEx
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:Play)
function CSoundPatch:Play() end

---[SHARED] Same as CSoundPatch:Play but with 2 extra arguments allowing to set volume and pitch directly.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:PlayEx)
---@param volume number The volume ranges from 0 to 1.
---@param pitch number The pitch can range from 0-255.
function CSoundPatch:PlayEx(volume, pitch) end

---[SHARED] Sets the DSP (Digital Signal Processor) effect for the sound. Similar to Player:SetDSP but for individual sounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:SetDSP)
---@param dsp number The DSP effect to set.
--- Pick from the [list of DSP's](https://developer.valvesoftware.com/wiki/Dsp_presets)
function CSoundPatch:SetDSP(dsp) end

---[SHARED] Sets the sound level in decibel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:SetSoundLevel)
---@param level number The sound level in decibel. See Enums/SNDLVL
function CSoundPatch:SetSoundLevel(level) end

---[SHARED] Stops the sound from being played.
---
--- This will not work if the entity attached to this sound patch (specified by Global.CreateSound) is invalid.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSoundPatch:Stop)
function CSoundPatch:Stop() end
