---@meta

--- This is returned from video.Record.
---@class IVideoWriter
local IVideoWriter = {}

---[CLIENT AND MENU] Adds the current framebuffer to the video stream.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IVideoWriter:AddFrame)
---@param frameTime number Usually set to what Global.FrameTime is, or simply 1/fps.
---@param downsample boolean If true it will downsample the whole screenspace to the videos width and height, otherwise it will just record from the top left corner to the given width and height and therefor not the whole screen.
function IVideoWriter:AddFrame(frameTime, downsample) end

---[CLIENT AND MENU] Ends the video recording and dumps it to disk.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IVideoWriter:Finish)
function IVideoWriter:Finish() end

---[CLIENT AND MENU] Returns the height of the video stream.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IVideoWriter:Height)
---@return number # height
function IVideoWriter:Height() end

---[CLIENT AND MENU] Sets whether to record sound or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IVideoWriter:SetRecordSound)
---@param record boolean Record.
function IVideoWriter:SetRecordSound(record) end

---[CLIENT AND MENU] Returns the width of the video stream.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IVideoWriter:Width)
---@return number # width
function IVideoWriter:Width() end
