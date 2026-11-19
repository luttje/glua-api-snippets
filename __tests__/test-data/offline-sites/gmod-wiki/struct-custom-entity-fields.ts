export const markup = `<cat>Dev</cat>
<structure>
	<description>
Information about custom fields **all** entities can have.

See also <page>Structures/ENT</page>
	</description>
	<fields>
<item name="GetEntityDriveMode" type="function">\`Serverside\`, Sandbox and Sandbox derived only.

Called by the Drive property to override the default drive type, which is \`drive_sandbox\`.</item>
<item name="OnEntityCopyTableFinish" type="function">Documented at <page>ENTITY:OnEntityCopyTableFinish</page>.</item>
<item name="PostEntityCopy" type="function">Documented at <page>ENTITY:PostEntityCopy</page>.</item>
<item name="PostEntityPaste" type="function">Documented at <page>ENTITY:PostEntityPaste</page>.</item>
<item name="PreEntityCopy" type="function">Documented at <page>ENTITY:PreEntityCopy</page>.</item>
<item name="OnDuplicated" type="function">Documented at <page>ENTITY:OnDuplicated</page>.</item>

<item name="PhysgunDisabled" type="boolean">\`Shared\`, Sandbox or Sandbox derived only.

If set to \`true\`, physgun will not be able to pick this entity up. This can also be set from map, see <page>Sandbox Specific Mapping</page></item>
<item name="PhysgunPickup" type="function">\`Shared\`, Sandbox or Sandbox derived only.

Called from <page>GM:PhysgunPickup</page>, overrides \`PhysgunDisabled\`</item>

<item name="m_tblToolsAllowed" type="table">\`Shared\`, Sandbox or Sandbox derived only.

Controls which tools **and** properties can be used on this entity. Format is a list of strings where each string is the tool or property classname.

This can also be set from map, see <page>Sandbox Specific Mapping</page></item>


<item name="GravGunPickupAllowed" type="function">Documented at <page>ENTITY:GravGunPickupAllowed</page>.</item>
<item name="GravGunPunt" type="function">Documented at <page>ENTITY:GravGunPunt</page>.</item>
<item name="CanProperty" type="function">Documented at <page>ENTITY:CanProperty</page>.</item>
<item name="CanTool" type="function">Documented at <page>ENTITY:CanTool</page>.</item>

<item name="DoNotDuplicate" type="boolean" default="false" realm="server">If set, the entity will not be duplicated via the built-in duplicator system.</item>

<item name="CalcAbsolutePosition" type="function">Documented at <page>ENTITY:CalcAbsolutePosition</page>.</item>
<item name="RenderOverride" type="function">Documented at <page>ENTITY:RenderOverride</page>.</item>

<item name="m_RenderOrigin" type="Vector">(Clientside) Do not use.</item>
<item name="m_RenderAngles" type="Angle">(Clientside) Do not use.</item>



	</fields>

</structure>`;

export const apiDefinition =
  `--- Information about custom fields **all** entities can have.
---
--- See also [Structures/ENT](https://wiki.facepunch.com/gmod/Structures/ENT)
---
---[View wiki](https://wiki.facepunch.com/gmod/Custom_Entity_Fields)
---@class Custom_Entity_Fields
local Custom_Entity_Fields = {}

---\`Serverside\`, Sandbox and Sandbox derived only.
---
--- Called by the Drive property to override the default drive type, which is \`drive_sandbox\`.
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

---\`Shared\`, Sandbox or Sandbox derived only.
---
--- If set to \`true\`, physgun will not be able to pick this entity up. This can also be set from map, see Sandbox Specific Mapping
---@type boolean
Custom_Entity_Fields.PhysgunDisabled = nil

---\`Shared\`, Sandbox or Sandbox derived only.
---
--- Called from GM:PhysgunPickup, overrides \`PhysgunDisabled\`
---@type function
Custom_Entity_Fields.PhysgunPickup = nil

---\`Shared\`, Sandbox or Sandbox derived only.
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

---(Clientside) Do not use.
---@type Vector
Custom_Entity_Fields.m_RenderOrigin = nil

---(Clientside) Do not use.
---@type Angle
Custom_Entity_Fields.m_RenderAngles = nil\n\n`;

export const json = {
  name: 'Custom_Entity_Fields',
  address: 'Custom_Entity_Fields',
  type: 'struct',
  fields: [
    {
      name: 'GetEntityDriveMode',
      type: 'function',
      description: '`Serverside`, Sandbox and Sandbox derived only.\n\nCalled by the Drive property to override the default drive type, which is `drive_sandbox`.',
    },
    {
      name: 'OnEntityCopyTableFinish',
      type: 'function',
      description: 'Documented at ENTITY:OnEntityCopyTableFinish.',
    },
    {
      name: 'PostEntityCopy',
      type: 'function',
      description: 'Documented at ENTITY:PostEntityCopy.',
    },
    {
      name: 'PostEntityPaste',
      type: 'function',
      description: 'Documented at ENTITY:PostEntityPaste.',
    },
    {
      name: 'PreEntityCopy',
      type: 'function',
      description: 'Documented at ENTITY:PreEntityCopy.',
    },
    {
      name: 'OnDuplicated',
      type: 'function',
      description: 'Documented at ENTITY:OnDuplicated.',
    },
    {
      name: 'PhysgunDisabled',
      type: 'boolean',
      description: '`Shared`, Sandbox or Sandbox derived only.\n\nIf set to `true`, physgun will not be able to pick this entity up. This can also be set from map, see Sandbox Specific Mapping',
    },
    {
      name: 'PhysgunPickup',
      type: 'function',
      description: '`Shared`, Sandbox or Sandbox derived only.\n\nCalled from GM:PhysgunPickup, overrides `PhysgunDisabled`',
    },
    {
      name: 'm_tblToolsAllowed',
      type: 'table',
      description: '`Shared`, Sandbox or Sandbox derived only.\n\nControls which tools **and** properties can be used on this entity. Format is a list of strings where each string is the tool or property classname.\n\nThis can also be set from map, see Sandbox Specific Mapping',
    },
    {
      name: 'GravGunPickupAllowed',
      type: 'function',
      description: 'Documented at ENTITY:GravGunPickupAllowed.',
    },
    {
      name: 'GravGunPunt',
      type: 'function',
      description: 'Documented at ENTITY:GravGunPunt.',
    },
    {
      name: 'CanProperty',
      type: 'function',
      description: 'Documented at ENTITY:CanProperty.',
    },
    {
      name: 'CanTool',
      type: 'function',
      description: 'Documented at ENTITY:CanTool.',
    },
    {
      name: 'CalcAbsolutePosition',
      type: 'function',
      description: 'Documented at ENTITY:CalcAbsolutePosition.',
    },
    {
      name: 'RenderOverride',
      type: 'function',
      description: 'Documented at ENTITY:RenderOverride.',
    },
    {
      name: 'm_RenderOrigin',
      type: 'Vector',
      description: '(Clientside) Do not use.',
    },
    {
      name: 'm_RenderAngles',
      type: 'Angle',
      description: '(Clientside) Do not use.',
    },
  ],
};
