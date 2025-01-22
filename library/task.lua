---@meta

--- A single AI task. Returned by [ai_task.New](https://wiki.facepunch.com/gmod/ai_task.New).
---
---[View wiki](https://wiki.facepunch.com/gmod/Task)
---@class Task
local Task = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Initialises the AI task. Called by [ai_task.New](https://wiki.facepunch.com/gmod/ai_task.New).
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:Init)
function Task:Init() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Initialises the AI task as an engine task.
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:InitEngine)
---@param taskname string The name of the task.
---@param taskdata number
function Task:InitEngine(taskname, taskdata) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Initialises the AI task as NPC method-based.
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:InitFunctionName)
---@param startname string The name of the NPC method to call on task start.
---@param runname string The name of the NPC method to call on task run.
---@param taskdata number
function Task:InitFunctionName(startname, runname, taskdata) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Determines if the task is an engine task (`TYPE_ENGINE`, 1).
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:IsEngineType)
function Task:IsEngineType() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Determines if the task is an NPC method-based task (`TYPE_FNAME`, 2).
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:IsFNameType)
function Task:IsFNameType() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Runs the AI task.
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:Run)
---@param target NPC The NPC to run the task on.
function Task:Run(target) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Runs the AI task as an NPC method. This requires the task to be of type `TYPE_FNAME`.
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:Run_FName)
---@param target NPC The NPC to run the task on.
function Task:Run_FName(target) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Starts the AI task.
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:Start)
---@param target NPC The NPC to start the task on.
function Task:Start(target) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Starts the AI task as an NPC method.
---
---[View wiki](https://wiki.facepunch.com/gmod/Task:Start_FName)
---@param target NPC The NPC to start the task on.
function Task:Start_FName(target) end
