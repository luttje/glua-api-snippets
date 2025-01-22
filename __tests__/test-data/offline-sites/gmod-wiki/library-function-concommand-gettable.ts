export const markup = `<function name="GetTable" parent="concommand" type="libraryfunc">
<description>Returns the tables of all console command callbacks, and autocomplete functions, that were added to the game with <page>concommand.Add</page>.
</description>
<realm>Shared and Menu</realm>
<file line="16-L22">lua/includes/modules/concommand.lua</file>
<rets>
  <ret name="" type="table">Table of command callback functions.</ret>
  <ret name="" type="table">Table of command autocomplete functions.</ret>
</rets>
</function>`;

export const apiDefinition =
`--- Missing description.
concommand = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the tables of all console command callbacks, and autocomplete functions, that were added to the game with [concommand.Add](https://wiki.facepunch.com/gmod/concommand.Add).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/concommand.GetTable)
---@return table # Table of command callback functions.
---@return table # Table of command autocomplete functions.
function concommand.GetTable() end\n\n`;
