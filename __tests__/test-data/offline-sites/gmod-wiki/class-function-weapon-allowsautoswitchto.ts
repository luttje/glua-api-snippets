export const markup = `<function name="AllowsAutoSwitchTo" parent="Weapon" type="classfunc">
<description>Returns whether the weapon allows to being switched to when a better ( <page>Weapon:GetWeight</page> ) weapon is being picked up.</description>
<realm>Shared</realm>
<rets>
  <ret name="" type="boolean">Whether the weapon allows to being switched to.</ret>
</rets>
</function>`;

export const json = {
  url: 'https://wiki.facepunch.com/gmod/Weapon:AllowsAutoSwitchTo',
  type: 'classfunc',
  parent: 'Weapon',
  name: 'AllowsAutoSwitchTo',
  address: 'Weapon:AllowsAutoSwitchTo',
  description: 'Returns whether the weapon allows to being switched to when a better ( [Weapon:GetWeight](https://wiki.facepunch.com/gmod/Weapon:GetWeight) ) weapon is being picked up.',
  realm: 'Shared',
  arguments: [],
  returns: [
    {
      name: '',
      type: 'boolean',
      description: 'Whether the weapon allows to being switched to.',
    },
  ],
};
