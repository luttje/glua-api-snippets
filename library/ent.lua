---@meta

---[SERVER] Called by the engine when NPC's state changes.
---
--- This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENT:OnStateChange)
---@param oldState number The old state. See Enums/NPC_STATE.
---@param newState number The new state. See Enums/NPC_STATE.
function ENTITY:OnStateChange(oldState, newState) end

---[SERVER] Called to completely override NPC movement. This can be used for example for flying NPCs.
---
--- This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENT:OverrideMove)
---@param interval number Time interval for the movement, in seconds. Usually time since last movement.
---@return boolean # Return `true` to disable the default movement code.
function ENTITY:OverrideMove(interval) end

---[SERVER] Called to completely override NPC movement facing.
---
--- This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENT:OverrideMoveFacing)
---@param interval number Time interval for the movement, in seconds. Usually time since last movement.
---@param data table Extra data for the movement. A table containing the following data:
--- * boolean hasTraced - The result if a forward probing trace has been done
--- * number expectedDist - The distance expected to move this think
--- * number flags - AILMG flags
--- * number maxDist - The distance maximum distance intended to travel in path length
--- * number navType - Enums/NAV
--- * number speed - The sequence ground speed. Note these need not always agree with "target"
--- * Entity moveTarget- Target entity
--- * Vector dir - The actual move. Note these need not always agree with "target"
--- * Vector facing - The actual move. Note these need not always agree with "target"
--- * Vector target - Object of the goal
---
---@return boolean # Return `true` to disable the default movement facing code.
function ENTITY:OverrideMoveFacing(interval, data) end

---[SERVER] Called by the engine to alter NPC schedules, if desired by the NPC.
---
--- This hook only exists for `ai` type SENTs.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ENT:TranslateSchedule)
---@param schedule number The schedule to translate. See Enums/SCHED.
---@return number # The schedule that should override the incoming schedule. See Enums/SCHED.  Do not return anything to not override.
function ENTITY:TranslateSchedule(schedule) end
