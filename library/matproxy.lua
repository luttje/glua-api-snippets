---@meta

matproxy = {}

---[CLIENT] Adds a material proxy.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.Add)
---@param MatProxyData table The information about the proxy. See Structures/MatProxyData
function matproxy.Add(MatProxyData) end

---[CLIENT] Called by the engine from OnBind
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.Call)
---@param uname string 
---@param mat IMaterial 
---@param ent Entity 
function matproxy.Call(uname, mat, ent) end

---[CLIENT] Called by the engine from OnBind
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.Init)
---@param name string 
---@param uname string 
---@param mat IMaterial 
---@param values table 
function matproxy.Init(name, uname, mat, values) end

---[CLIENT] Called by engine, returns true if we're overriding a proxy
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/matproxy.ShouldOverrideProxy)
---@param name string The name of proxy in question
---@return boolean Are we overriding it?
function matproxy.ShouldOverrideProxy(name) end

