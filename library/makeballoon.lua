---@meta

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This function makes a balloon appear, similar to the one from the Toolgun.
---
--- **WARNING**: This function doesn't make the rope attached to the balloon appear.
---
---[View wiki](https://wiki.facepunch.com/gmod/MakeBalloon)
---@param ply player The player who spawns the balloon. This argument can be nil
---@param r? number Balloon color (red)
---@param g? number Balloon color (green)
---@param b? number Balloon color (blue).
---@param force? number The lift force applied to the balloon.
---@param data BalloonData Data applied to the balloon. This data is required for correctly spawning the balloon.
--- For more information, please see: Structures/BalloonData
---@return Entity # Returns the created balloon entity.
function _G.MakeBalloon(ply, r, g, b, force, data) end
