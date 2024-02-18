---@meta

---
--- 		Renderable mesh object, can be used to create models on the fly.
--- 		The only way to create your own IMesh object is to call Global.Mesh.
---
---
--- 			IMeshes only respond to one projected texture.
--- 			See the render.RenderFlashlights function and example that solves this problem.
---
---
---@class IMesh
local IMesh = {}

---[CLIENT] Builds the mesh from a table mesh vertexes.
---
--- When modifying a previously built mesh, your new mesh must match the vertex count!
---
--- See Global.Mesh and util.GetModelMeshes for examples.
---
--- IMesh appears to have a limit of 65535 vertices. You should split your mesh into multiple meshes when above this limit.
---
--- Exceeding the limit may lead to undefined rendering behavior.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMesh:BuildFromTriangles)
---@param vertexes table A table consisting of Structures/MeshVertexs.
function IMesh:BuildFromTriangles(vertexes) end

---[CLIENT] Deletes the mesh and frees the memory used by it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMesh:Destroy)
function IMesh:Destroy() end

---[CLIENT] Renders the mesh with the active matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMesh:Draw)
function IMesh:Draw() end

---[CLIENT] Returns whether this IMesh is valid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMesh:IsValid)
---@return boolean # Whether this IMesh is valid or not.
function IMesh:IsValid() end
