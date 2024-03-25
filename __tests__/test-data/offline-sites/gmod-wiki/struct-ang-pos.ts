export const markup = `<cat>struct</cat>
<structure>
  <realm>Shared</realm>
  <description>Table used by various functions, such as <page>Entity:GetAttachment</page>.</description>
  <fields>
<item name="Ang" type="Angle">Angle object</item>
<item name="Pos" type="Vector">Vector object</item>
  </fields>

</structure>`;

export const json = {
  url: 'https://wiki.facepunch.com/gmod/Structures/AngPos',
  type: 'struct',
  name: 'AngPos',
  address: 'AngPos',
  description: 'Table used by various functions, such as [Entity:GetAttachment](https://wiki.facepunch.com/gmod/Entity:GetAttachment).',
  realm: 'Shared',
  fields: [
    {
      name: 'Ang',
      type: 'Angle',
      description: 'Angle object',
    },
    {
      name: 'Pos',
      type: 'Vector',
      description: 'Vector object',
    },
  ],
};
