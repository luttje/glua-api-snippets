---@meta

--- The frame blending library.
frame_blend = {}

---[CLIENT] Adds a frame to the blend. Calls frame_blend.CompleteFrame once enough frames have passed since last frame_blend.CompleteFrame call.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.AddFrame)
function frame_blend.AddFrame() end

---[CLIENT] Blends the frame(s).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.BlendFrame)
function frame_blend.BlendFrame() end

---[CLIENT] Renders the frame onto internal render target.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.CompleteFrame)
function frame_blend.CompleteFrame() end

---[CLIENT] Actually draws the frame blend effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.DrawPreview)
function frame_blend.DrawPreview() end

---[CLIENT] Returns whether frame blend post processing effect is enabled or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.IsActive)
---@return boolean # Is frame blend enabled or not
function frame_blend.IsActive() end

---[CLIENT] Returns whether the current frame is the last frame?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.IsLastFrame)
---@return boolean # Whether the current frame is the last frame?
function frame_blend.IsLastFrame() end

---[CLIENT] Returns amount of frames needed to render?
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.RenderableFrames)
---@return number # Amount of frames needed to render?
function frame_blend.RenderableFrames() end

---[CLIENT] Returns whether we should skip frame or not
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/frame_blend.ShouldSkipFrame)
---@return boolean # Should the frame be skipped or not
function frame_blend.ShouldSkipFrame() end
