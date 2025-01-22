---@meta

--- The object returned by [ai_schedule.New](https://wiki.facepunch.com/gmod/ai_schedule.New).
---
---[View wiki](https://wiki.facepunch.com/gmod/Schedule)
---@class Schedule
local Schedule = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds a task to the schedule. See also [Schedule:AddTaskEx](https://wiki.facepunch.com/gmod/Schedule:AddTaskEx) if you wish to customize task start and run function names.
---
--- See also [ENTITY:StartSchedule](https://wiki.facepunch.com/gmod/ENTITY:StartSchedule), [NPC:StartEngineTask](https://wiki.facepunch.com/gmod/NPC:StartEngineTask), and [NPC:RunEngineTask](https://wiki.facepunch.com/gmod/NPC:RunEngineTask).
---
---[View wiki](https://wiki.facepunch.com/gmod/Schedule:AddTask)
---@param taskname string Custom task name
---@param taskdata any Task data to be passed into the NPC's functions
function Schedule:AddTask(taskname, taskdata) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds a task to the schedule with completely custom function names.
---
--- See also [Schedule:AddTask](https://wiki.facepunch.com/gmod/Schedule:AddTask).
---
---[View wiki](https://wiki.facepunch.com/gmod/Schedule:AddTaskEx)
---@param start string The full name of a function on the entity's table to be ran when the task is started.
---@param run string The full name of a function on the entity's table to be ran when the task is continuously running.
---@param data number Task data to be passed into the NPC's functions
function Schedule:AddTaskEx(start, run, data) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Adds an engine task to the schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/Schedule:EngTask)
---@param taskname string Task name, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502)
---@param taskdata number Task data, can be a float.
function Schedule:EngTask(taskname, taskdata) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the task at the given index.
---
---[View wiki](https://wiki.facepunch.com/gmod/Schedule:GetTask)
---@param num number Task index.
function Schedule:GetTask(num) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Initialises the Schedule. Called by [ai_schedule.New](https://wiki.facepunch.com/gmod/ai_schedule.New) when the Schedule is created.
---
---[View wiki](https://wiki.facepunch.com/gmod/Schedule:Init)
---@param debugName string The name passed from ai_schedule.New.
function Schedule:Init(debugName) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the number of tasks in the schedule.
---
---[View wiki](https://wiki.facepunch.com/gmod/Schedule:NumTasks)
---@return number # The number of tasks in this schedule.
function Schedule:NumTasks() end
