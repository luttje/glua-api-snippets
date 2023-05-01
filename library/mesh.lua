---@meta

mesh = {}

---[CLIENT] Pushes the new vertex data onto the render stack.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.AdvanceVertex)
function mesh.AdvanceVertex() end

---[CLIENT] Starts a new dynamic mesh. If an IMesh is passed, it will use that mesh instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.Begin)
---@param mesh IMesh Mesh to build. This argument can be removed if you wish to build a "dynamic" mesh. See examples below.
---@param primitiveType number Primitive type, see Enums/MATERIAL.
---@param primiteCount number The amount of primitives.
function mesh.Begin(mesh, primitiveType, primiteCount) end

---[CLIENT] Sets the color to be used for the next vertex.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.Color)
---@param r number Red component.
---@param g number Green component.
---@param b number Blue component.
---@param a number Alpha component.
function mesh.Color(r, g, b, a) end

---[CLIENT] Ends the mesh and renders it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.End)
function mesh.End() end

---[CLIENT] Sets the normal to be used for the next vertex.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.Normal)
---@param normal Vector The normal of the vertex.
function mesh.Normal(normal) end

---[CLIENT] Sets the position to be used for the next vertex.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.Position)
---@param position Vector The position of the vertex.
function mesh.Position(position) end

---[CLIENT] Draws a quad using 4 vertices.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.Quad)
---@param vertex1 Vector The first vertex.
---@param vertex2 Vector The second vertex.
---@param vertex3 Vector The third vertex.
---@param vertex4 Vector The fourth vertex.
function mesh.Quad(vertex1, vertex2, vertex3, vertex4) end

---[CLIENT] Draws a quad using a position, a normal and the size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.QuadEasy)
---@param position Vector The center of the quad.
---@param normal Vector The normal of the quad.
---@param sizeX number X size in pixels.
---@param sizeY number Y size in pixels.
function mesh.QuadEasy(position, normal, sizeX, sizeY) end

---[CLIENT] Sets the specular map values.
--- 
--- This function actually does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.Specular)
---@param r number The red channel multiplier of the specular map.
---@param g number The green channel multiplier of the specular map.
---@param b number The blue channel multiplier of the specular map.
---@param a number The alpha channel multiplier of the specular map.
function mesh.Specular(r, g, b, a) end

---[CLIENT] Sets the s tangent to be used.
--- 
--- This function actually does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.TangentS)
---@param sTanger Vector The s tangent.
function mesh.TangentS(sTanger) end

---[CLIENT] Sets the T tangent to be used.
--- 
--- This function actually does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.TangentT)
---@param tTanger Vector The t tangent.
function mesh.TangentT(tTanger) end

---[CLIENT] Sets the texture coordinates for the next vertex.
--- 
--- Non-zero values of stage require the currently bound material to support it. For example, any LightmappedGeneric material supports stages 1 and 2 (lightmap texture coordinates).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.TexCoord)
---@param stage number The stage of the texture coordinate.
---@param u number U coordinate.
---@param v number V coordinate.
function mesh.TexCoord(stage, u, v) end

---[CLIENT] It is recommended to use IMesh:BuildFromTriangles instead of the mesh library.
--- 
--- A table of four numbers. This is used by most shaders in Source to hold tangent information of the vertex ( tangentX, tangentY, tangentZ, tangentHandedness ).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.UserData)
---@param tangentX number 
---@param tangentY number 
---@param tangentZ number 
---@param tangentHandedness number 
function mesh.UserData(tangentX, tangentY, tangentZ, tangentHandedness) end

---[CLIENT] Returns the amount of vertex that have yet been pushed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/mesh.VertexCount)
---@return number vertexCount
function mesh.VertexCount() end

