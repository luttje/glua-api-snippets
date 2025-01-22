---@meta

--- CSEnt is a client-side only entity which can be created with [Global.ClientsideModel](https://wiki.facepunch.com/gmod/Global.ClientsideModel), [Global.ClientsideRagdoll](https://wiki.facepunch.com/gmod/Global.ClientsideRagdoll) and [Global.ClientsideScene](https://wiki.facepunch.com/gmod/Global.ClientsideScene).
---
--- Its base class is [Entity](https://wiki.facepunch.com/gmod/Entity) so it inherits all of the client and shared functions used by [Entity](https://wiki.facepunch.com/gmod/Entity).
---
---[View wiki](https://wiki.facepunch.com/gmod/CSEnt)
---@class CSEnt : Entity
local CSEnt = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Removes the clientside entity
---
---[View wiki](https://wiki.facepunch.com/gmod/CSEnt:Remove)
function CSEnt:Remove() end
