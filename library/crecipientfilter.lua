---@meta

--- List of all possible functions to manipulate Recipient Filters. Can be created with Global.RecipientFilter.
---@class CRecipientFilter
local CRecipientFilter = {}

---[SERVER] Adds all players to the recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:AddAllPlayers)
function CRecipientFilter:AddAllPlayers() end

---[SERVER] Adds all players that are in the same [PAS (Potentially Audible Set)](https://developer.valvesoftware.com/wiki/PAS "PAS - Valve Developer Community") as this position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:AddPAS)
---@param pos Vector A position that players may be able to hear, usually the position of an entity the sound is playing played from.
function CRecipientFilter:AddPAS(pos) end

---[SERVER] Adds a player to the recipient filter
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:AddPlayer)
---@param Player Player Player to add to the recipient filter.
function CRecipientFilter:AddPlayer(Player) end

---[SERVER] Adds players to the recipient filter from a given table or another recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:AddPlayers)
---@param input CRecipientFilter The filter to add players from. This can also be a sequential table of players. Non player entities or duplicate players will be ignored.
function CRecipientFilter:AddPlayers(input) end

---[SERVER] Adds all players that are in the same [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") as this position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:AddPVS)
---@param Position Vector PVS position that players may be able to see.
function CRecipientFilter:AddPVS(Position) end

---[SERVER] Adds all players that are on the given team to the filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:AddRecipientsByTeam)
---@param teamid number Team index to add players from.
function CRecipientFilter:AddRecipientsByTeam(teamid) end

---[SERVER] Returns the number of valid players in the recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:GetCount)
---@return number # Number of valid players in the recipient filter.
function CRecipientFilter:GetCount() end

---[SERVER] Returns a table of all valid players currently in the recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:GetPlayers)
---@return table # A table of all valid players currently in the recipient filter.
function CRecipientFilter:GetPlayers() end

---[SERVER] Removes all players from the recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemoveAllPlayers)
function CRecipientFilter:RemoveAllPlayers() end

---[SERVER] Remove players from this recipient filter that are **NOT** present in a given table or recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemoveMismatchedPlayers)
---@param input CRecipientFilter The filter that contains a list of players to test against. Players **NOT** in the given filter will be removed from this filter.
---
--- This can also be a sequential table of players. Non player entities will be ignored.
function CRecipientFilter:RemoveMismatchedPlayers(input) end

---[SERVER] Removes all players from the filter that are in [PAS (Potentially Audible Set)](https://developer.valvesoftware.com/wiki/PAS "PAS - Valve Developer Community") for given position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemovePAS)
---@param position Vector The position to test
function CRecipientFilter:RemovePAS(position) end

---[SERVER] Removes the player from the recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemovePlayer)
---@param Player Player The player that should be in the recipient filter if you call this function.
function CRecipientFilter:RemovePlayer(Player) end

---[SERVER] Remove players from this recipient filter that are present in a given table or recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemovePlayers)
---@param input CRecipientFilter The filter that contains a list of players to remove. This can also be a sequential table of players. Non player entities will be ignored. If a player in the given table/filter is not present in this filter, it is ignored.
function CRecipientFilter:RemovePlayers(input) end

---[SERVER] Removes all players that can see this [PVS (Potential Visibility Set)](https://developer.valvesoftware.com/wiki/PVS "PVS - Valve Developer Community") from the recipient filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemovePVS)
---@param pos Vector Position that players may be able to see.
function CRecipientFilter:RemovePVS(pos) end

---[SERVER] Removes all players that are on the given team from the filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemoveRecipientsByTeam)
---@param teamid number Team index to remove players from.
function CRecipientFilter:RemoveRecipientsByTeam(teamid) end

---[SERVER] Removes all players that are not on the given team from the filter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CRecipientFilter:RemoveRecipientsNotOnTeam)
---@param teamid number Team index.
function CRecipientFilter:RemoveRecipientsNotOnTeam(teamid) end
