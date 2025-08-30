export const markup = `<enum>
	<realm>Server</realm>
	<description>
Enumerations used by <page>CNavArea</page> methods.
These Enums correspond to each corner of a <page>CNavArea</page>

<warning>These enumerations do not exist in game and are listed here only for reference</warning>
	</description>
	<items>
<item key="NORTH_WEST" value="0">North West Corner</item>
<item key="NORTH_EAST" value="1">North East Corner</item>
<item key="SOUTH_EAST" value="2">South East Corner</item>
<item key="SOUTH_WEST" value="3">South West Corner</item>
<item key="NUM_CORNERS" value="4">Represents all corners, only applicable to certain functions, such as <page>CNavArea:PlaceOnGround</page>.</item>
	</items>

</enum>`;

export const json = {
  url: 'https://wiki.facepunch.com/gmod/Enums/NavCorner',
  type: 'enum',
  name: 'NavCorner',
  address: 'NavCorner',
  description: `\nEnumerations used by <page>CNavArea</page> methods.\nThese Enums correspond to each corner of a <page>CNavArea</page>\n\n<warning>These enumerations do not exist in game and are listed here only for reference</warning>\n`,
  realm: 'server',
  items: [
    {
      key: 'NORTH_WEST',
      value: '0',
      description: 'North West Corner',
    },
    {
      key: 'NORTH_EAST',
      value: '1',
      description: 'North East Corner',
    },
    {
      key: 'SOUTH_EAST',
      value: '2',
      description: 'South East Corner',
    },
    {
      key: 'SOUTH_WEST',
      value: '3',
      description: 'South West Corner',
    },
    {
      key: 'NUM_CORNERS',
      value: '4',
      description: 'Represents all corners, only applicable to certain functions, such as CNavArea:PlaceOnGround.',
    },
  ],
};

export const apiDefinition = `---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Enumerations used by [CNavArea](https://wiki.facepunch.com/gmod/CNavArea) methods.
--- These Enums correspond to each corner of a [CNavArea](https://wiki.facepunch.com/gmod/CNavArea)
---
--- **WARNING**: These enumerations do not exist in game and are listed here only for reference
--- * \`NORTH_WEST\` = \`0\`
--- * \`NORTH_EAST\` = \`1\`
--- * \`SOUTH_EAST\` = \`2\`
--- * \`SOUTH_WEST\` = \`3\`
--- * \`NUM_CORNERS\` = \`4\`
---
--- [View wiki](https://wiki.facepunch.com/gmod/Enums/NavCorner)
--- @alias NavCorner 0 | 1 | 2 | 3 | 4


`;
