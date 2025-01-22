---@meta

--- The frame blending library.
frame_blend = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Adds a frame to the blend. Calls [frame_blend.CompleteFrame](https://wiki.facepunch.com/gmod/frame_blend.CompleteFrame) once enough frames have passed since last [frame_blend.CompleteFrame](https://wiki.facepunch.com/gmod/frame_blend.CompleteFrame) call.
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.AddFrame)
function frame_blend.AddFrame() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Blends the frame(s).
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.BlendFrame)
function frame_blend.BlendFrame() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Renders the frame onto internal render target.
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.CompleteFrame)
function frame_blend.CompleteFrame() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Actually draws the frame blend effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.DrawPreview)
function frame_blend.DrawPreview() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether frame blend post processing effect is enabled or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.IsActive)
---@return boolean # Is frame blend enabled or not
function frame_blend.IsActive() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns whether the current frame is the last frame?
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.IsLastFrame)
---@return boolean # Whether the current frame is the last frame?
function frame_blend.IsLastFrame() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns amount of frames needed to render?
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.RenderableFrames)
---@return number # Amount of frames needed to render?
function frame_blend.RenderableFrames() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether we should skip frame or not
---
---[View wiki](https://wiki.facepunch.com/gmod/frame_blend.ShouldSkipFrame)
---@return boolean # Should the frame be skipped or not
function frame_blend.ShouldSkipFrame() end
