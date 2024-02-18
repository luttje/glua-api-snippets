---@meta

--- The ai library.
ai = {}

---[SERVER] Translates a schedule name to its corresponding ID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ai.GetScheduleID)
---@param sched string Then schedule name. In most cases, this will be the same as the Enums/SCHED name.
---@return number # The schedule ID, see Enums/SCHED. Returns -1 if the schedule name isn't valid.
function ai.GetScheduleID(sched) end

---[SERVER] Returns the squad leader of the given squad.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ai.GetSquadLeader)
---@param squad string The squad name.
---@return NPC # The squad leader.
function ai.GetSquadLeader(squad) end

---[SERVER] Returns the amount of members a given squad has. See also ai.GetSquadMembers.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ai.GetSquadMemberCount)
---@param squad string The squad name.
---@return number # The member count.
function ai.GetSquadMemberCount(squad) end

---[SERVER] Returns all members of a given squad. See also ai.GetSquadMemberCount and NPC:GetSquad.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ai.GetSquadMembers)
---@param squad string The squad name.
---@return table # A table of NPCs in the given squad.
function ai.GetSquadMembers(squad) end

---[SERVER] Translates a task name to its corresponding ID.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ai.GetTaskID)
---@param task string The task name.
---@return number # The task ID, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502). Returns -1 if the schedule name isn't valid.
function ai.GetTaskID(task) end
