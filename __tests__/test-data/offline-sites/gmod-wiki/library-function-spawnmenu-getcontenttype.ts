export const markup = `<function name="GetContentType" parent="spawnmenu" type="libraryfunc">
	<description>Returns the function to create an vgui element for a specified content type, previously defined by <page>spawnmenu.AddContentType</page>.</description>
	<realm>Client</realm>
	<file line="289-L299">lua/includes/modules/spawnmenu.lua</file>
	<args>
		<arg name="contentType" type="string">The content type name.</arg>
	</args>
	<rets>
		<ret name="" type="function">The panel creation function.

<callback>
<arg type="Panel" name="container">The container panel to parent the created icon to.</arg>
<arg type="table" name="data">Data for the content type passed from <page>spawnmenu.CreateContentIcon</page>.</arg>

<ret type="Panel" name="pnl">The created panel</ret>
</callback>
</ret>
	</rets>
</function>`;

export const json = {
  url: 'https://wiki.facepunch.com/gmod/spawnmenu.GetContentType',
  type: 'libraryfunc',
  parent: 'spawnmenu',
  name: 'GetContentType',
  address: 'spawnmenu.GetContentType',
  deprecated: undefined,
  description: 'Returns the function to create an vgui element for a specified content type, previously defined by [spawnmenu.AddContentType](https://wiki.facepunch.com/gmod/spawnmenu.AddContentType).',
  realm: 'client',
  arguments: [
    {
      args: [{
      altType: undefined,
      callback: undefined,
      name: 'contentType',
      type: 'string',
      description: 'The content type name.',
    } ] },
  ],
  returns: [
    {
      callback: {
        arguments: [
          {
            default: undefined,
            description: 'The container panel to parent the created icon to.',
            name: 'container',
            type: 'Panel',
          },
          {
            default: undefined,
            description: 'Data for the content type passed from spawnmenu.CreateContentIcon.',
            name: 'data',
            type: 'table',
          },
        ],
        returns: [
          {
            default: undefined,
            description: 'The created panel',
            name: 'pnl',
            type: 'Panel',
          },
        ],
      },
      description: 'The panel creation function.\n\n\n\nFunction argument(s):\n* Panel `container` - The container panel to parent the created icon to.\n* table `data` - Data for the content type passed from spawnmenu.CreateContentIcon.\n\nFunction return value(s):\n* Panel `pnl` - The created panel\n\n',
      name: '',
      type: 'function',
    },
  ],
};
