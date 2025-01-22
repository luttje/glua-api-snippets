export const markup = `<function name="resume" parent="coroutine" type="libraryfunc">
<description>Resumes the given coroutine and passes the given vararg to either the function arguments or the <page>coroutine.yield</page> that is inside that function and returns whatever yield is called with the next time or by the final return in the function.</description>
<realm>Shared and Menu</realm>
<args>
  <arg name="coroutine" type="thread">Coroutine to resume.</arg>
  <arg name="args" type="vararg">Arguments to be returned by <page>coroutine.yield</page>.</arg>
</args>
<rets>
  <ret name="" type="boolean">If the executed thread code had no errors occur within it.</ret>
  <ret name="" type="vararg">If an error occurred, this will be a string containing the error message. Otherwise, this will be arguments that were yielded.</ret>
</rets>
</function>`;

export const apiDefinition =
`--- Missing description.
coroutine = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Resumes the given coroutine and passes the given vararg to either the function arguments or the [coroutine.yield](https://wiki.facepunch.com/gmod/coroutine.yield) that is inside that function and returns whatever yield is called with the next time or by the final return in the function.
---
---[View wiki](https://wiki.facepunch.com/gmod/coroutine.resume)
---@param coroutine thread Coroutine to resume.
---@param ... any Arguments to be returned by coroutine.yield.
---@return boolean # If the executed thread code had no errors occur within it.
---@return any ... # If an error occurred, this will be a string containing the error message. Otherwise, this will be arguments that were yielded.
function coroutine.resume(coroutine, ...) end\n\n`;
