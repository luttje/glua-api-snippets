export const markup = `<enum>
<realm>Shared</realm>
<description>\nEnumerations used by <page>ENTITY:Use</page>.\n\nNot to be confused with <page>Enums/_USE</page> used by <page>Entity:SetUseType</page>.\n</description>
<items>
  <item key="USE_OFF" value="0"></item>
  <item key="USE_ON" value="1"></item>
  <item key="USE_SET" value="2"></item>
  <item key="USE_TOGGLE" value="3"></item>
</items>
</enum>`;

export const json = {
  url: 'https://wiki.facepunch.com/gmod/Enums/USE',
  type: 'enum',
  name: 'USE',
  description: `\nEnumerations used by ENTITY:Use.\n\nNot to be confused with Enums/_USE used by Entity:SetUseType.\n`,
  realm: 'Shared',
  items: [
    {
      key: 'USE_OFF',
      value: '0',
      description: '',
    },
    {
      key: 'USE_ON',
      value: '1',
      description: '',
    },
    {
      key: 'USE_SET',
      value: '2',
      description: '',
    },
    {
      key: 'USE_TOGGLE',
      value: '3',
      description: '',
    },
  ],
};