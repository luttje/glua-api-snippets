---@meta

--- This is returned from [video.Record](https://wiki.facepunch.com/gmod/video.Record).
---
---[View wiki](https://wiki.facepunch.com/gmod/IVideoWriter)
---@class IVideoWriter
local IVideoWriter = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds the current framebuffer to the video stream.
---
---[View wiki](https://wiki.facepunch.com/gmod/IVideoWriter:AddFrame)
---@param frameTime number Usually set to what Global.FrameTime is, or simply 1/fps.
---@param downsample boolean If true it will downsample the whole screenspace to the videos width and height, otherwise it will just record from the top left corner to the given width and height and therefor not the whole screen.
function IVideoWriter:AddFrame(frameTime, downsample) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Ends the video recording and dumps it to disk.
---
---[View wiki](https://wiki.facepunch.com/gmod/IVideoWriter:Finish)
function IVideoWriter:Finish() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the height of the video stream.
---
---[View wiki](https://wiki.facepunch.com/gmod/IVideoWriter:Height)
---@return number # height
function IVideoWriter:Height() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether to record sound or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/IVideoWriter:SetRecordSound)
---@param record boolean Record.
function IVideoWriter:SetRecordSound(record) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the width of the video stream.
---
---[View wiki](https://wiki.facepunch.com/gmod/IVideoWriter:Width)
---@return number # width
function IVideoWriter:Width() end
