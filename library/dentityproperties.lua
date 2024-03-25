---@meta

---
--- 		**INTERNAL**: Unless you know what you are doing and you benefit from this panel, you should be using the [DProperties](https://wiki.facepunch.com/gmod/DProperties) instead.
---
--- 		A panel used by the [Editable Entities](https://wiki.facepunch.com/gmod/Editable Entities) system.
---
---@class DEntityProperties : DProperties
local DEntityProperties = {}

---[CLIENT] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally by [DEntityProperties:RebuildControls](https://wiki.facepunch.com/gmod/DEntityProperties:RebuildControls).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DEntityProperties:EditVariable)
---@param varname string
---@param editdata table
function DEntityProperties:EditVariable(varname, editdata) end

---[CLIENT] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally when an entity being edited became invalid.
---
--- You should use [DEntityProperties:OnEntityLost](https://wiki.facepunch.com/gmod/DEntityProperties:OnEntityLost) instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DEntityProperties:EntityLost)
function DEntityProperties:EntityLost() end

---[CLIENT] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called internally by [DEntityProperties:SetEntity](https://wiki.facepunch.com/gmod/DEntityProperties:SetEntity) to rebuild the controls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DEntityProperties:RebuildControls)
function DEntityProperties:RebuildControls() end

---[CLIENT] Sets the entity to be edited by this panel. The entity must support the [Editable Entities](https://wiki.facepunch.com/gmod/Editable Entities) system or nothing will happen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DEntityProperties:SetEntity)
---@param ent Entity The entity to edit
function DEntityProperties:SetEntity(ent) end
