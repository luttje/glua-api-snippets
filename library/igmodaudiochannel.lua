---@meta

--- A sound channel returned by a callback of sound.PlayURL and sound.PlayFile.
---@class IGModAudioChannel
local IGModAudioChannel = {}

---[CLIENT] Enables or disables looping of audio channel, requires noblock flag.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:EnableLooping)
---@param enable boolean Enable or disable looping of this audio channel.
function IGModAudioChannel:EnableLooping(enable) end

---[CLIENT] Computes the [DFT (discrete Fourier transform)](https://en.wikipedia.org/wiki/Discrete_Fourier_transform) of the sound channel.
---
--- The size parameter specifies the number of consecutive audio samples to use as the input to the DFT and is restricted to a power of two. A [Hann window](https://en.wikipedia.org/wiki/Hann_function) is applied to the input data.
---
--- The computed DFT has the same number of frequency bins as the number of samples. Only half of this DFT is returned, since [the DFT magnitudes are symmetric for real input data](https://en.wikipedia.org/wiki/Discrete_Fourier_transform#The_real-input_DFT). The magnitudes of the DFT (values from 0 to 1) are used to fill the output table, starting at index 1.
---
--- **Visualization protip:** For a size N DFT, bin k (1-indexed) corresponds to a frequency of (k - 1) / N * sampleRate.
---
--- **Visualization protip:** Sound energy is proportional to the square of the magnitudes. Adding magnitudes together makes no sense physically, but adding energies does.
---
--- **Visualization protip:** The human ear works on a logarithmic amplitude scale. You can convert to [decibels](https://en.wikipedia.org/wiki/Decibel) by taking 20 * math.log10 of frequency magnitudes, or 10 * math.log10 of energy. The decibel values will range from -infinity to 0.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:FFT)
---@param tbl table The table to output the DFT magnitudes (numbers between 0 and 1) into. Indices start from 1.
---@param size number The number of samples to use. See Enums/FFT
---@return number # The number of frequency bins that have been filled in the output table.
function IGModAudioChannel:FFT(tbl, size) end

---[CLIENT] Returns 3D cone of the sound channel. See IGModAudioChannel:Set3DCone.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Get3DCone)
---@return number # The angle of the inside projection cone in degrees.
---@return number # The angle of the outside projection cone in degrees.
---@return number # The delta-volume outside the outer projection cone.
function IGModAudioChannel:Get3DCone() end

---[CLIENT] Returns if the sound channel is currently in 3D mode or not. This value will be affected by IGModAudioChannel:Set3DEnabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Get3DEnabled)
---@return boolean # Is currently 3D or not.
function IGModAudioChannel:Get3DEnabled() end

---[CLIENT] Returns 3D fade distances of a sound channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Get3DFadeDistance)
---@return number # The minimum distance. The channel's volume is at maximum when the listener is within this distance
---@return number # The maximum distance. The channel's volume stops decreasing when the listener is beyond this distance
function IGModAudioChannel:Get3DFadeDistance() end

---[CLIENT] Returns the average bit rate of the sound channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetAverageBitRate)
---@return number # The average bit rate of the sound channel.
function IGModAudioChannel:GetAverageBitRate() end

---[CLIENT] Retrieves the number of bits per sample of the sound channel.
---
--- Doesn't work for mp3 and ogg files.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetBitsPerSample)
---@return number # Number of bits per sample, or 0 if unknown.
function IGModAudioChannel:GetBitsPerSample() end

---[CLIENT] Returns the buffered time of the sound channel in seconds, for online streaming sound channels. (sound.PlayURL)
---
--- For offline channels this will be equivalent to IGModAudioChannel:GetLength.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetBufferedTime)
---@return number # The current buffered time of the stream, in seconds.
function IGModAudioChannel:GetBufferedTime() end

---[CLIENT] Returns the filename for the sound channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetFileName)
---@return string # The file name. This will not be always what you have put into the sound.PlayURL as first argument.
function IGModAudioChannel:GetFileName() end

---[CLIENT] Returns the length of sound played by the sound channel in seconds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetLength)
---@return number # The length of the sound. This value seems to be less then 0 for continuous radio streams.
function IGModAudioChannel:GetLength() end

---[CLIENT] Returns the right and left levels of sound played by the sound channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetLevel)
---@return number # The left sound level. The value is between 0 and 1.
---@return number # The right sound level. The value is between 0 and 1.
function IGModAudioChannel:GetLevel() end

---[CLIENT] Gets the relative volume of the left and right channels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetPan)
---@return number # Relative volume between the left and right channels. `-1` means only in left channel, `0` is center and `1` is only in the right channel. `0` by default.
function IGModAudioChannel:GetPan() end

---[CLIENT] Returns the playback rate of the sound channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetPlaybackRate)
---@return number # The current playback rate of the sound channel
function IGModAudioChannel:GetPlaybackRate() end

---[CLIENT] Returns position of the sound channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetPos)
---@return Vector # The position of the sound channel, previously set by IGModAudioChannel:SetPos
function IGModAudioChannel:GetPos() end

---[CLIENT] Returns the sample rate for currently playing sound.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetSamplingRate)
---@return number # The sample rate in Hz. This should always be 44100.
function IGModAudioChannel:GetSamplingRate() end

---[CLIENT] Returns the state of a sound channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetState)
---@return number # The state of the sound channel, see Enums/GMOD_CHANNEL
function IGModAudioChannel:GetState() end

---[CLIENT] Retrieves HTTP headers from a bass stream channel created by sound.PlayURL, if available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetTagsHTTP)
---@return table # Returns a table of HTTP headers.Returns nil if no information is available.
function IGModAudioChannel:GetTagsHTTP() end

---[CLIENT] Retrieves the ID3 version 1 info from a bass channel created by sound.PlayFile or sound.PlayURL, if available.
---
--- ID3v2 is not supported.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetTagsID3)
---@return table # Returns a table containing the information. Returns nil if no information is available.
function IGModAudioChannel:GetTagsID3() end

---[CLIENT] Retrieves meta stream info from a bass stream channel created by sound.PlayURL, if available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetTagsMeta)
---@return string # Returns a string containing the information. Returns nil if no information is available.
function IGModAudioChannel:GetTagsMeta() end

---[CLIENT] Retrieves OGG media info tag, from a bass channel created by sound.PlayURL or sound.PlayFile, if available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetTagsOGG)
---@return table # Returns a table containing the information. Returns nil if no information is available.
function IGModAudioChannel:GetTagsOGG() end

---[CLIENT] Retrieves OGG Vendor tag, usually containing the application that created the file, from a bass channel created by sound.PlayURL or sound.PlayFile, if available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetTagsVendor)
---@return string # Returns a string containing the information. Returns nil if no information is available.
function IGModAudioChannel:GetTagsVendor() end

---[CLIENT] Returns the current time of the sound channel in seconds
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetTime)
---@return number # The current time of the stream
function IGModAudioChannel:GetTime() end

---[CLIENT] Returns volume of a sound channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:GetVolume)
---@return number # The volume of the sound channel
function IGModAudioChannel:GetVolume() end

---[CLIENT] Returns if the sound channel is in 3D mode or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Is3D)
---@return boolean # Is 3D or not.
function IGModAudioChannel:Is3D() end

---[CLIENT] Returns whether the audio stream is block streamed or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:IsBlockStreamed)
---@return boolean # Is the audio stream block streamed or not.
function IGModAudioChannel:IsBlockStreamed() end

---[CLIENT] Returns if the sound channel is looping or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:IsLooping)
---@return boolean # Is looping or not.
function IGModAudioChannel:IsLooping() end

---[CLIENT] Returns if the sound channel is streamed from the Internet or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:IsOnline)
---@return boolean # Is online or not.
function IGModAudioChannel:IsOnline() end

---[CLIENT] Returns if the sound channel is valid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:IsValid)
---@return boolean # Is the sound channel valid or not
function IGModAudioChannel:IsValid() end

---[CLIENT] Pauses the stream. It can be started again using IGModAudioChannel:Play
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Pause)
function IGModAudioChannel:Pause() end

---[CLIENT] Starts playing the stream.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Play)
function IGModAudioChannel:Play() end

---[CLIENT] Sets 3D cone of the sound channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Set3DCone)
---@param innerAngle number The angle of the inside projection cone in degrees.
---
---
---
---
--- Range is from 0 (no cone) to 360 (sphere), -1 = leave current.
---@param outerAngle number The angle of the outside projection cone in degrees.
---
---
---
---
--- Range is from 0 (no cone) to 360 (sphere), -1 = leave current.
---@param outerVolume number The delta-volume outside the outer projection cone.
---
---
---
---
--- Range is from 0 (silent) to 1 (same as inside the cone), less than 0 = leave current.
function IGModAudioChannel:Set3DCone(innerAngle, outerAngle, outerVolume) end

---[CLIENT] Sets the 3D mode of the channel. This will affect IGModAudioChannel:Get3DEnabled but not IGModAudioChannel:Is3D.
---
--- This feature **requires** the channel to be initially created in 3D mode, i.e. IGModAudioChannel:Is3D should return true or this function will do nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Set3DEnabled)
---@param enable boolean true to enable, false to disable 3D.
function IGModAudioChannel:Set3DEnabled(enable) end

---[CLIENT] Sets 3D fade distances of a sound channel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Set3DFadeDistance)
---@param min number The minimum distance. The channel's volume is at maximum when the listener is within this distance.
---
---
---
---
--- 0 or less = leave current.
---@param max number The maximum distance. The channel's volume stops decreasing when the listener is beyond this distance.
---
---
---
---
--- 0 or less = leave current.
function IGModAudioChannel:Set3DFadeDistance(min, max) end

---[CLIENT] Sets the relative volume of the left and right channels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:SetPan)
---@param pan number Relative volume between the left and right channels. `-1` means only in left channel, `0` is center (default) and `1` is only in the right channel. Fractional values are supported.
function IGModAudioChannel:SetPan(pan) end

---[CLIENT] Sets the playback rate of the sound channel. May not work with high values for radio streams.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:SetPlaybackRate)
---@param rate number Playback rate to set to. 1 is normal speed, 0.5 is half the normal speed, etc.
function IGModAudioChannel:SetPlaybackRate(rate) end

---[CLIENT] Sets position of sound channel in case the sound channel has a 3d option set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:SetPos)
---@param pos Vector The position to put the sound into
---@param dir? Vector The direction of the sound
function IGModAudioChannel:SetPos(pos, dir) end

---[CLIENT] Sets the sound channel to specified time ( Rewind to that position of the song ). Does not work on online radio streams.
---
--- Streamed sounds must have "noblock" parameter for this to work and IGModAudioChannel:IsBlockStreamed must return false.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:SetTime)
---@param secs number The time to set the stream to, in seconds.
---@param dont_decode? boolean Set to true to skip decoding to set time, and instead just seek to it which is faster. Certain streams do not support seeking and have to decode to the given position.
function IGModAudioChannel:SetTime(secs, dont_decode) end

---[CLIENT] Sets the volume of a sound channel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:SetVolume)
---@param volume number Volume to set. 1 meaning 100% volume, 0.5 is 50% and 3 is 300%, etc.
function IGModAudioChannel:SetVolume(volume) end

---[CLIENT] Stop the stream. It can be started again using IGModAudioChannel:Play.
---
--- Calling this invalidates the IGModAudioChannel object rendering it unusable for further functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IGModAudioChannel:Stop)
function IGModAudioChannel:Stop() end
