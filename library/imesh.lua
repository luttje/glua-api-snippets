---@meta

--- Renderable mesh object, can be used to create models on the fly.
--- The only way to create your own IMesh object is to call [Global.Mesh](https://wiki.facepunch.com/gmod/Global.Mesh).
---
--- **NOTE**: IMeshes only respond to one projected texture.
--- 	See the [render.RenderFlashlights](https://wiki.facepunch.com/gmod/render.RenderFlashlights) function and example that solves this problem.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMesh)
---@class IMesh
local IMesh = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Builds the mesh from a table mesh vertexes.
---
--- When modifying a previously built mesh, your new mesh must match the vertex count!
---
--- See [Global.Mesh](https://wiki.facepunch.com/gmod/Global.Mesh) and [util.GetModelMeshes](https://wiki.facepunch.com/gmod/util.GetModelMeshes) for examples.
---
--- **WARNING**: [IMesh](https://wiki.facepunch.com/gmod/IMesh) appears to have a limit of 65535 vertices. You should split your mesh into multiple meshes when above this limit.
---
--- Exceeding the limit may lead to undefined rendering behavior.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMesh:BuildFromTriangles)
---@param vertexes table A table consisting of Structures/MeshVertexs.
function IMesh:BuildFromTriangles(vertexes) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Deletes the mesh and frees the memory used by it.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMesh:Destroy)
function IMesh:Destroy() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders the mesh with the active matrix.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMesh:Draw)
function IMesh:Draw() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether this [IMesh](https://wiki.facepunch.com/gmod/IMesh) is valid or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMesh:IsValid)
---@return boolean # Whether this IMesh is valid or not.
function IMesh:IsValid() end
