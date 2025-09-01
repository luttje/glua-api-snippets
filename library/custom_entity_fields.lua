---@meta

--- Information about custom fields that are not exclusive to [Scripted Entities](https://wiki.facepunch.com/gmod/Scripted_Entities), fields that have an effect on any entity.
---
--- See also [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT)
---
---[View wiki](https://wiki.facepunch.com/gmod/Custom_Entity_Fields)
---@class Custom_Entity_Fields
local Custom_Entity_Fields = {}

---Sandbox and Sandbox derived only.
---
--- Called by the [Drive property](https://wiki.facepunch.com/gmod/Entity_Driving) to override the default drive type, which is `drive_sandbox`.
---@type function
Custom_Entity_Fields.GetEntityDriveMode = nil

---Documented at ENTITY:OnEntityCopyTableFinish.
---@type function
Custom_Entity_Fields.OnEntityCopyTableFinish = nil

---Documented at ENTITY:PostEntityCopy.
---@type function
Custom_Entity_Fields.PostEntityCopy = nil

---Documented at ENTITY:PostEntityPaste.
---@type function
Custom_Entity_Fields.PostEntityPaste = nil

---Documented at ENTITY:PreEntityCopy.
---@type function
Custom_Entity_Fields.PreEntityCopy = nil

---Documented at ENTITY:OnDuplicated.
---@type function
Custom_Entity_Fields.OnDuplicated = nil

---Sandbox or Sandbox derived only.
---
--- If set to `true`, physgun will not be able to pick this entity up. This can also be set from map, see Sandbox Specific Mapping
---@type boolean?
Custom_Entity_Fields.PhysgunDisabled = false

---Sandbox or Sandbox derived only.
---
--- Called from GM:PhysgunPickup, overrides `PhysgunDisabled`
---@type function
Custom_Entity_Fields.PhysgunPickup = nil

---Sandbox or Sandbox derived only.
---
--- Controls which tools **and** properties can be used on this entity. Format is a list of strings where each string is the tool or property classname.
---
--- This can also be set from map, see Sandbox Specific Mapping
---@type table
Custom_Entity_Fields.m_tblToolsAllowed = nil

---Documented at ENTITY:GravGunPickupAllowed.
---@type function
Custom_Entity_Fields.GravGunPickupAllowed = nil

---Documented at ENTITY:GravGunPunt.
---@type function
Custom_Entity_Fields.GravGunPunt = nil

---Documented at ENTITY:CanProperty.
---@type function
Custom_Entity_Fields.CanProperty = nil

---Documented at ENTITY:CanTool.
---@type function
Custom_Entity_Fields.CanTool = nil

---If set, the entity will not be duplicated via the built-in duplicator system.
---@type boolean?
Custom_Entity_Fields.DoNotDuplicate = false

---Documented at ENTITY:CalcAbsolutePosition.
---@type function
Custom_Entity_Fields.CalcAbsolutePosition = nil

---Documented at ENTITY:RenderOverride.
---@type function
Custom_Entity_Fields.RenderOverride = nil

---Internal. Do not use. Use Entity:SetRenderOrigin instead.
---@type Vector
Custom_Entity_Fields.m_RenderOrigin = nil

---Internal. Do not use. Use Entity:SetRenderAngles instead.
---@type Angle
Custom_Entity_Fields.m_RenderAngles = nil
