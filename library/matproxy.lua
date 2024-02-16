---@meta

--- A library that allows implementing custom [material proxies](https://developer.valvesoftware.com/wiki/Material_proxies) for materials.
---
--- Material proxies allow programmatically setting specific `.vmt` shader parameters on a per-entity basis, rather being global across all instances of a material.
---
matproxy = {}

---[CLIENT] Register a material proxy. See matproxy for more general explanation of what they are.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.Add)
---@param matProxyData table The information about the proxy. See Structures/MatProxyData
function matproxy.Add(matProxyData) end

---[CLIENT] Called by the engine from `OnBind`. Calls Structures/MatProxyData#bind method of the Lua material proxy.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.Call)
---@param uname string The material proxy name.
---@param mat IMaterial The material the proxy is being applied to.
---@param ent Entity The entity the material is applied to.
function matproxy.Call(uname, mat, ent) end

---[CLIENT] Called by the engine from `OnBind`. Calls Structures/MatProxyData#init method of the Lua material proxy.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.Init)
---@param name string Name of the material proxy.
---@param uname string Name for the active material proxy instance.
---@param mat IMaterial Material the material proxy is applied to.
---@param values table `.vmt` shader parameters of the material.
function matproxy.Init(name, uname, mat, values) end

---[CLIENT] Called by engine to determine if a certain material proxy is registered in Lua.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.ShouldOverrideProxy)
---@param name string The name of proxy in question
---@return boolean # Whether the material proxy of given name is registered.
function matproxy.ShouldOverrideProxy(name) end
