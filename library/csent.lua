---@meta

--- CSEnt is a client-side only entity which can be created with [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel), [Global.ClientsideRagdoll](https://wiki.facepunch.com/gmod/Global.ClientsideRagdoll) and [Global.ClientsideScene](https://wiki.facepunch.com/gmod/Global.ClientsideScene).
---
--- Its base class is [Entity](https://wiki.facepunch.com/gmod/Entity) so it inherits all of the client and shared functions used by [Entity](https://wiki.facepunch.com/gmod/Entity).
---@class CSEnt : Entity
local CSEnt = {}

---[CLIENT] Removes the clientside entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSEnt:Remove)
function CSEnt:Remove() end
