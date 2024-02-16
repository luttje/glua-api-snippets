---@meta

--- Allows you to set up a schedule for NPCs to follow. This lets you dictate their actions.
ai_schedule = {}

---[SERVER] Creates a schedule for scripted NPC.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ai_schedule.New)
---@param name string Name of the schedule.
---@return table # A table containing schedule information to be used with ENTITY:StartSchedule.
function ai_schedule.New(name) end
