---@meta

--- The effects library allows you to manually add scripted effects.
effects = {}

---[SHARED] Creates a "beam ring point" effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/effects.BeamRingPoint)
---@param pos Vector The origin position of the effect.
---@param lifetime number How long the effect will be drawing for, in seconds.
---@param startRad number Initial radius of the effect.
---@param endRad number Final radius of the effect, at the end of the effect's lifetime.
---@param width number How thick the beam should be.
---@param amplitude number How noisy the beam should be.
---@param color table Beam's Global.Color.
---@param extra table Extra info, all optional. A table with the following keys: (any combination)
--- * number speed - ?
--- * number spread - ?
--- * number delay - Delay in seconds after which the effect should appear.
--- * number flags- Beam flags.
--- * number framerate - texture framerate.
--- * string material - The material to use instead of the default one.
---
function effects.BeamRingPoint(pos, lifetime, startRad, endRad, width, amplitude, color, extra) end

---[SHARED] Creates a bunch of bubbles inside a defined box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/effects.Bubbles)
---@param mins Vector The lowest extents of the box.
---@param maxs Vector The highest extents of the box.
---@param count number How many bubbles to spawn. There's a hard limit of 500 tempents at any time.
---@param height number How high the bubbles can fly up before disappearing.
---@param speed? number How quickly the bubbles move.
---@param delay? number Delay in seconds after the function call and before the effect actually spawns.
function effects.Bubbles(mins, maxs, count, height, speed, delay) end

---[SHARED] Creates a bubble trail effect, the very same you get when shooting underwater.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/effects.BubbleTrail)
---@param startPos Vector The start position of the effect.
---@param endPos Vector The end position of the effects.
---@param count number How many bubbles to spawn. There's a hard limit of 500 tempents at any time.
---@param height number How high the bubbles can fly up before disappearing.
---@param speed? number How quickly the bubbles move.
---@param delay? number Delay in seconds after the function call and before the effect actually spawns.
function effects.BubbleTrail(startPos, endPos, count, height, speed, delay) end

---[CLIENT] You are looking for util.Effect.Returns the table of the effect specified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/effects.Create)
---@param name string Effect name.
---@return table # Effect table.
function effects.Create(name) end

---[CLIENT] Returns a list of all Lua-defined effects.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/effects.GetList)
---@return table # The effects table.
function effects.GetList() end

---[CLIENT] Registers a new effect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/effects.Register)
---@param effect_table table Effect table.
---@param name string Effect name.
function effects.Register(effect_table, name) end
