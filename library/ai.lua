---@meta

--- The ai library.
ai = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the number of AI nodes on the map, used by the base game NPCs.
---
--- For nextbots, see [navmesh](https://wiki.facepunch.com/gmod/navmesh).
---
---[View wiki](https://wiki.facepunch.com/gmod/ai.GetNodeCount)
---@return number # The node count.
function ai.GetNodeCount() end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Translates a schedule name to its corresponding ID.
---
---[View wiki](https://wiki.facepunch.com/gmod/ai.GetScheduleID)
---@param sched string Then schedule name. In most cases, this will be the same as the Enums/SCHED name.
---@return number # The schedule ID, see Enums/SCHED. Returns -1 if the schedule name isn't valid.
function ai.GetScheduleID(sched) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the squad leader of the given squad.
---
---[View wiki](https://wiki.facepunch.com/gmod/ai.GetSquadLeader)
---@param squad string The squad name.
---@return NPC # The squad leader.
function ai.GetSquadLeader(squad) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns the amount of members a given squad has. See also [ai.GetSquadMembers](https://wiki.facepunch.com/gmod/ai.GetSquadMembers).
---
---[View wiki](https://wiki.facepunch.com/gmod/ai.GetSquadMemberCount)
---@param squad string The squad name.
---@return number # The member count.
function ai.GetSquadMemberCount(squad) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Returns all members of a given squad. See also [ai.GetSquadMemberCount](https://wiki.facepunch.com/gmod/ai.GetSquadMemberCount) and [NPC:GetSquad](https://wiki.facepunch.com/gmod/NPC:GetSquad).
---
---[View wiki](https://wiki.facepunch.com/gmod/ai.GetSquadMembers)
---@param squad string The squad name.
---@return table # A table of NPCs in the given squad.
function ai.GetSquadMembers(squad) end

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Translates a task name to its corresponding ID.
---
---[View wiki](https://wiki.facepunch.com/gmod/ai.GetTaskID)
---@param task string The task name.
---@return number # The task ID, see [ai_task.h](https://github.com/ValveSoftware/source-sdk-2013/blob/55ed12f8d1eb6887d348be03aee5573d44177ffb/mp/src/game/server/ai_task.h#L89-L502). Returns -1 if the schedule name isn't valid.
function ai.GetTaskID(task) end
