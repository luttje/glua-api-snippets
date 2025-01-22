---@meta

--- Allows you to set up a schedule for NPCs to follow. This lets you dictate their actions.
ai_schedule = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Creates a schedule for scripted NPC.
---
---[View wiki](https://wiki.facepunch.com/gmod/ai_schedule.New)
---@param name string Name of the schedule.
---@return table # A table containing schedule information to be used with ENTITY:StartSchedule.
function ai_schedule.New(name) end
