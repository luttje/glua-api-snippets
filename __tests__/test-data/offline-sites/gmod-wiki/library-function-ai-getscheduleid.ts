export const markup = `<function name="GetScheduleID" parent="ai" type="libraryfunc">
<description>Translates a schedule name to its corresponding ID.</description>
<realm>Server</realm>
<args>
  <arg name="sched" type="string">Then schedule name. In most cases, this will be the same as the <page>Enums/SCHED</page> name.</arg>
</args>
<rets>
  <ret name="" type="number">The schedule ID, see <page>Enums/SCHED</page>. Returns -1 if the schedule name isn't valid.</ret>
</rets>
</function>`;

export const json = {
  url: 'https://wiki.facepunch.com/gmod/ai.GetScheduleID',
  type: 'libraryfunc',
  parent: 'ai',
  name: 'GetScheduleID',
  address: 'ai.GetScheduleID',
  description: 'Translates a schedule name to its corresponding ID.',
  realm: 'server',
  arguments: [
    { args: [ {
      name: 'sched',
      type: 'string',
      description: 'Then schedule name. In most cases, this will be the same as the Enums/SCHED name.',
    } ] },
  ],
  returns: [
    {
      name: '',
      type: 'number',
      description: 'The schedule ID, see Enums/SCHED. Returns -1 if the schedule name isn\'t valid.',
    },
  ],
};
