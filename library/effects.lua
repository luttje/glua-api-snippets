---@meta

--- The effects library allows you to manually add scripted effects.
effects = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a "beam ring point" effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/effects.BeamRingPoint)
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
function effects.BeamRingPoint(pos, lifetime, startRad, endRad, width, amplitude, color, extra) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a bunch of bubbles inside a defined box.
---
---[View wiki](https://wiki.facepunch.com/gmod/effects.Bubbles)
---@param mins Vector The lowest extents of the box.
---@param maxs Vector The highest extents of the box.
---@param count number How many bubbles to spawn. There's a hard limit of 500 tempents at any time.
---@param height number How high the bubbles can fly up before disappearing.
---@param speed? number How quickly the bubbles move.
---@param delay? number Delay in seconds after the function call and before the effect actually spawns.
function effects.Bubbles(mins, maxs, count, height, speed, delay) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Creates a bubble trail effect, the very same you get when shooting underwater.
---
---[View wiki](https://wiki.facepunch.com/gmod/effects.BubbleTrail)
---@param startPos Vector The start position of the effect.
---@param endPos Vector The end position of the effects.
---@param count number How many bubbles to spawn. There's a hard limit of 500 tempents at any time.
---@param height number How high the bubbles can fly up before disappearing.
---@param speed? number How quickly the bubbles move.
---@param delay? number Delay in seconds after the function call and before the effect actually spawns.
function effects.BubbleTrail(startPos, endPos, count, height, speed, delay) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: You are looking for [util.Effect](https://wiki.facepunch.com/gmod/util.Effect).
--- Returns the table of the effect specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/effects.Create)
---@param name string Effect name.
---@return table # Effect table.
function effects.Create(name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Returns a list of all Lua-defined effects.
---
---[View wiki](https://wiki.facepunch.com/gmod/effects.GetList)
---@return table # The effects table.
function effects.GetList() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Registers a new effect.
---
---[View wiki](https://wiki.facepunch.com/gmod/effects.Register)
---@param effect_table table Effect table.
---@param name string Effect name.
function effects.Register(effect_table, name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Imitates the "near miss" tracer sound, with the ability to override the sound played.
---
--- The frequency of the sound is limited internally, as to not overwhelm the player. (same as normal tracers)
---
---[View wiki](https://wiki.facepunch.com/gmod/effects.TracerSound)
---@param start Vector Start position of the tracer.
---@param endpos Vector End position of the tracer
---@param tracerType? number Tracer type. Acceptable values are:
--- * 1 - Normal bullet
--- * 2 - Gunship bullet
--- * 4 - Strider bullet
--- * 8 - Underwater bullet
---
--- This affects the default sound, as well as the distance from which the sound can be heard compared to the closest point on the tracer line to the Player:GetShootPos.
---@param soundOverride? string If set, this sound will be played instead of the default sound.
function effects.TracerSound(start, endpos, tracerType, soundOverride) end
