---@meta

--- CSoundPatch class.
---
--- Created with [Global.CreateSound](https://wiki.facepunch.com/gmod/Global.CreateSound)
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch)
---@class CSoundPatch
local CSoundPatch = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adjust the pitch, alias the speed at which the sound is being played.
---
--- This invokes the [GM:EntityEmitSound](https://wiki.facepunch.com/gmod/GM:EntityEmitSound).
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:ChangePitch)
---@param pitch number The pitch can range from 0-255. Where 100 is the original pitch.
---@param deltaTime? number The time to fade from previous to the new pitch.
function CSoundPatch:ChangePitch(pitch, deltaTime) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adjusts the volume of the sound played.
--- Appears to only work while the sound is being played.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:ChangeVolume)
---@param volume number The volume ranges from 0 to 1.
---@param deltaTime? number Time to fade the volume from previous to new value from.
function CSoundPatch:ChangeVolume(volume, deltaTime) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Fades out the volume of the sound from the current volume to 0 in the given amount of seconds.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:FadeOut)
---@param seconds number Fade time.
function CSoundPatch:FadeOut(seconds) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the DSP (Digital Signal Processor) effect ID for the sound.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:GetDSP)
---@return number # The numerical ID for the DSP effect currently enabled on the sound.
---
--- For a list of the available IDs and their meaning, see DSP_Presets.
function CSoundPatch:GetDSP() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the current pitch.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:GetPitch)
---@return number # The current pitch, can range from 0-255.
function CSoundPatch:GetPitch() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the current sound level.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:GetSoundLevel)
---@return number # The current sound level, see Enums/SNDLVL.
function CSoundPatch:GetSoundLevel() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the current volume.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:GetVolume)
---@return number # The current volume, ranging from 0 to 1.
function CSoundPatch:GetVolume() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns whenever the sound is being played.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:IsPlaying)
---@return boolean # Is playing or not
function CSoundPatch:IsPlaying() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Starts to play the sound. This will reset the sound's volume and pitch to their default values. See [CSoundPatch:PlayEx](https://wiki.facepunch.com/gmod/CSoundPatch:PlayEx)
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:Play)
function CSoundPatch:Play() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Same as [CSoundPatch:Play](https://wiki.facepunch.com/gmod/CSoundPatch:Play) but with 2 extra arguments allowing to set volume and pitch directly.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:PlayEx)
---@param volume number The volume ranges from 0 to 1.
---@param pitch number The pitch can range from 0-255.
function CSoundPatch:PlayEx(volume, pitch) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the DSP (Digital Signal Processor) effect for the sound.
---
--- Similar to [Player:SetDSP](https://wiki.facepunch.com/gmod/Player:SetDSP) but for individual sounds.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:SetDSP)
---@param dspEffectId number The numerical ID for the DSP effect to be enabled on the sound.
---
--- For a list of the available IDs and their meaning, see DSP_Presets.
function CSoundPatch:SetDSP(dspEffectId) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the sound level in decibel.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:SetSoundLevel)
---@param level number The sound level in decibel. See Enums/SNDLVL
function CSoundPatch:SetSoundLevel(level) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Stops the sound from being played.
---
--- This will not work if the entity attached to this sound patch (specified by [Global.CreateSound](https://wiki.facepunch.com/gmod/Global.CreateSound)) is invalid.
---
---[View wiki](https://wiki.facepunch.com/gmod/CSoundPatch:Stop)
function CSoundPatch:Stop() end
