---@meta

---@class Custom_Entity_Fields
---@field GetEntityDriveMode function `Serverside`, Sandbox and Sandbox derived only.  Called by the Drive property to override the default drive type, which is `drive_sandbox`.
---@field OnEntityCopyTableFinish function Documented at ENTITY:OnEntityCopyTableFinish.
---@field PostEntityCopy function Documented at ENTITY:PostEntityCopy.
---@field PostEntityPaste function Documented at ENTITY:PostEntityPaste.
---@field PreEntityCopy function Documented at ENTITY:PreEntityCopy.
---@field OnDuplicated function Documented at ENTITY:OnDuplicated.
---@field PhysgunDisabled boolean `Shared`, Sandbox or Sandbox derived only.  If set to `true`, physgun will not be able to pick this entity up. This can also be set from map, see Sandbox Specific Mapping
---@field PhysgunPickup function `Shared`, Sandbox or Sandbox derived only.  Called from GM:PhysgunPickup, overrides `PhysgunDisabled`
---@field m_tblToolsAllowed table `Shared`, Sandbox or Sandbox derived only.  Controls which tools **and** properties can be used on this entity. Format is a list of strings where each string is the tool or property classname.  This can also be set from map, see Sandbox Specific Mapping
---@field GravGunPickupAllowed function Documented at ENTITY:GravGunPickupAllowed.
---@field GravGunPunt function Documented at ENTITY:GravGunPunt.
---@field CanProperty function Documented at ENTITY:CanProperty.
---@field CanTool function Documented at ENTITY:CanTool.
---@field CalcAbsolutePosition function Documented at ENTITY:CalcAbsolutePosition.
---@field RenderOverride function Documented at ENTITY:RenderOverride.
---@field m_RenderOrigin Vector (Clientside) Do not use.
---@field m_RenderAngles Angle (Clientside) Do not use.
local Custom_Entity_Fields = {}

