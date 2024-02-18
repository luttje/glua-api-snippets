---@meta

--- A single AI task. Returned by ai_task.New.
---@class Task
local Task = {}

---[SERVER] Initialises the AI task. Called by ai_task.New.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:Init)
function Task:Init() end

---[SERVER] Initialises the AI task as an engine task.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:InitEngine)
---@param taskname string The name of the task.
---@param taskdata number
function Task:InitEngine(taskname, taskdata) end

---[SERVER] Initialises the AI task as NPC method-based.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:InitFunctionName)
---@param startname string The name of the NPC method to call on task start.
---@param runname string The name of the NPC method to call on task run.
---@param taskdata number
function Task:InitFunctionName(startname, runname, taskdata) end

---[SERVER] Determines if the task is an engine task (`TYPE_ENGINE`, 1).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:IsEngineType)
function Task:IsEngineType() end

---[SERVER] Determines if the task is an NPC method-based task (`TYPE_FNAME`, 2).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:IsFNameType)
function Task:IsFNameType() end

---[SERVER] Runs the AI task.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:Run)
---@param target NPC The NPC to run the task on.
function Task:Run(target) end

---[SERVER] Runs the AI task as an NPC method. This requires the task to be of type `TYPE_FNAME`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:Run_FName)
---@param target NPC The NPC to run the task on.
function Task:Run_FName(target) end

---[SERVER] Starts the AI task.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:Start)
---@param target NPC The NPC to start the task on.
function Task:Start(target) end

---[SERVER] Starts the AI task as an NPC method.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Task:Start_FName)
---@param target NPC The NPC to start the task on.
function Task:Start_FName(target) end
