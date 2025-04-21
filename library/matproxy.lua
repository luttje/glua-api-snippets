---@meta

--- A library that allows implementing custom [material proxies](https://developer.valvesoftware.com/wiki/Material_proxies) for materials.
---
--- Material proxies allow programmatically setting specific `.vmt` shader parameters on a per-entity basis, rather being global across all instances of a material.
matproxy = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Register a material proxy. See [matproxy](https://wiki.facepunch.com/gmod/matproxy) for more general explanation of what they are.
--- **NOTE**: The `bind` function is required. The `init` function won't run without it set.
---
---[View wiki](https://wiki.facepunch.com/gmod/matproxy.Add)
---@param matProxyData table The information about the proxy. See Structures/MatProxyData
function matproxy.Add(matProxyData) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by the engine from `OnBind`. Calls [bind](https://wiki.facepunch.com/gmod/Structures/MatProxyData#bind) method of the Lua material proxy.
---
---[View wiki](https://wiki.facepunch.com/gmod/matproxy.Call)
---@param uname string The material proxy name.
---@param mat IMaterial The material the proxy is being applied to.
---@param ent Entity The entity the material is applied to.
function matproxy.Call(uname, mat, ent) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by the engine from `OnBind`. Calls [init](https://wiki.facepunch.com/gmod/Structures/MatProxyData#init) method of the Lua material proxy.
---
---[View wiki](https://wiki.facepunch.com/gmod/matproxy.Init)
---@param name string Name of the material proxy.
---@param uname string Name for the active material proxy instance.
---@param mat IMaterial Material the material proxy is applied to.
---@param values table `.vmt` shader parameters of the material.
function matproxy.Init(name, uname, mat, values) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Called by engine to determine if a certain material proxy is registered in Lua.
---
---[View wiki](https://wiki.facepunch.com/gmod/matproxy.ShouldOverrideProxy)
---@param name string The name of proxy in question
---@return boolean # Whether the material proxy of given name is registered.
function matproxy.ShouldOverrideProxy(name) end
