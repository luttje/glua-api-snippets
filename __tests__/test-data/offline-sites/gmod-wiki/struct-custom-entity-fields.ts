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

<item name="CalcAbsolutePosition" type="function">Documented at <page>ENTITY:CalcAbsolutePosition</page>.</item>
<item name="RenderOverride" type="function">Documented at <page>ENTITY:RenderOverride</page>.</item>

<item name="m_RenderOrigin" type="Vector">(Clientside) Do not use.</item>
<item name="m_RenderAngles" type="Angle">(Clientside) Do not use.</item>



	</fields>

</structure>`;

export const apiDefinition = `---@class Custom_Entity_Fields
---@field GetEntityDriveMode function \`Serverside\`, Sandbox and Sandbox derived only.  Called by the Drive property to override the default drive type, which is \`drive_sandbox\`.
---@field OnEntityCopyTableFinish function Documented at ENTITY:OnEntityCopyTableFinish.
---@field PostEntityCopy function Documented at ENTITY:PostEntityCopy.
---@field PostEntityPaste function Documented at ENTITY:PostEntityPaste.
---@field PreEntityCopy function Documented at ENTITY:PreEntityCopy.
---@field OnDuplicated function Documented at ENTITY:OnDuplicated.
---@field PhysgunDisabled boolean \`Shared\`, Sandbox or Sandbox derived only.  If set to \`true\`, physgun will not be able to pick this entity up. This can also be set from map, see Sandbox Specific Mapping
---@field PhysgunPickup function \`Shared\`, Sandbox or Sandbox derived only.  Called from GM:PhysgunPickup, overrides \`PhysgunDisabled\`
---@field m_tblToolsAllowed table \`Shared\`, Sandbox or Sandbox derived only.  Controls which tools **and** properties can be used on this entity. Format is a list of strings where each string is the tool or property classname.  This can also be set from map, see Sandbox Specific Mapping
---@field GravGunPickupAllowed function Documented at ENTITY:GravGunPickupAllowed.
---@field GravGunPunt function Documented at ENTITY:GravGunPunt.
---@field CanProperty function Documented at ENTITY:CanProperty.
---@field CanTool function Documented at ENTITY:CanTool.
---@field CalcAbsolutePosition function Documented at ENTITY:CalcAbsolutePosition.
---@field RenderOverride function Documented at ENTITY:RenderOverride.
---@field m_RenderOrigin Vector (Clientside) Do not use.
---@field m_RenderAngles Angle (Clientside) Do not use.
local Custom_Entity_Fields = {}\n\n`;

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