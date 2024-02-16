---@meta

--- CSEnt is a client-side only entity which can be created with Global.ClientsideModel, Global.ClientsideRagdoll and Global.ClientsideScene.
---
--- Its base class is Entity so it inherits all of the client and shared functions used by Entity.
---@class CSEnt : Entity
local CSEnt = {}

---[CLIENT] Removes the clientside entity
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/CSEnt:Remove)
function CSEnt:Remove() end
