---@meta

--- The mesh library allows you to create meshes. A mesh is a set of vertices that define a 3D shape, for constant meshes you should use the [IMesh](https://wiki.facepunch.com/gmod/IMesh) object instead.
mesh = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Pushes the currently set vertex data (via other `mesh.*` functions) into the mesh stack. See example on [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.AdvanceVertex)
function mesh.AdvanceVertex() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Begins creating or modifying a 3D mesh constructed from a given quantity and type of primitive 3D shapes such as triangles and quads.
---
--- The resulting mesh can be stored in an [IMesh](https://wiki.facepunch.com/gmod/IMesh) if it is intended to be drawn multiple times or on multiple frames.
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Begin)
---@param mesh IMesh The IMesh that the created mesh will be stored in.
---
--- If the mesh has already been built, it will instead have its existing verticies modified but cannot have the quantity of vertices changed.
---@param primitiveType number An enum that indicates what the format of the mesh's primitives will be.
--- For a full list of the available options, see the Enums/MATERIAL.
---@param primitiveCount number The quantity of primitives this mesh will contain as a whole integer number.
---
--- The total number of vertices must not exceed the limit of `32768`.
--- The number of vertices created by each primitive will depend on the type of primitive used to construct the mesh.
---
--- The expected value of this argument is dependent on the primitive type used.
--- For a full list of the primitive counts expected by each primitive type, see Enums/MATERIAL.
function mesh.Begin(mesh, primitiveType, primitiveCount) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Begins creating or modifying a 3D mesh constructed from a given quantity and type of primitive 3D shapes such as triangles and quads.
---
--- The resulting mesh can be stored in an [IMesh](https://wiki.facepunch.com/gmod/IMesh) if it is intended to be drawn multiple times or on multiple frames.
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Begin)
---@param primitiveType number An enum that indicates what the format of the mesh's primitives will be.
--- For a full list of the available options, see the Enums/MATERIAL.
---@param primitiveCount number The quantity of primitives this mesh will contain as a whole integer number.
---
--- The total number of vertices must not exceed the limit of `32768`.
--- The number of vertices created by each primitive will depend on the type of primitive used to construct the mesh.
---
--- The expected value of this argument is dependent on the primitive type used.
--- For a full list of the primitive counts expected by each primitive type, see Enums/MATERIAL.
function mesh.Begin(primitiveType, primitiveCount) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the color to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Color)
---@param r number Red component.
---@param g number Green component.
---@param b number Blue component.
---@param a number Alpha component.
function mesh.Color(r, g, b, a) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Ends the mesh (Started with [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin)) and renders it.
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.End)
function mesh.End() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the normal to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Normal)
---@param normal Vector The normal of the vertex.
function mesh.Normal(normal) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the normal to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Normal)
---@param x number The X part of the vertex normal.
---@param y number The Y part of the vertex normal.
---@param z number The Z part of the vertex normal.
function mesh.Normal(x, y, z) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the position to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Position)
---@param position Vector The position of the vertex.
function mesh.Position(position) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the position to be used for the next vertex. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Position)
---@param x number The X position of the vertex.
---@param y number The Y position of the vertex.
---@param z number The Z position of the vertex.
function mesh.Position(x, y, z) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a quad (4 vertices) to the currently built mesh. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Quad)
---@param vertex1 Vector The first vertex.
---@param vertex2 Vector The second vertex.
---@param vertex3 Vector The third vertex.
---@param vertex4 Vector The fourth vertex.
---@param color table The color for the vertices.
function mesh.Quad(vertex1, vertex2, vertex3, vertex4, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a quad (4 vertices) to the currently built mesh, by using position, normal and sizes. See [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
--- See also [mesh.Quad](https://wiki.facepunch.com/gmod/mesh.Quad).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.QuadEasy)
---@param position Vector The center of the quad.
---@param normal Vector The normal of the quad.
---@param sizeX number X size in pixels.
---@param sizeY number Y size in pixels.
---@param color table The color for the vertices.
function mesh.QuadEasy(position, normal, sizeX, sizeY, color) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the specular map values.
---
--- There is no known use case for this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.Specular)
---@param r number The red channel multiplier of the specular map.
---@param g number The green channel multiplier of the specular map.
---@param b number The blue channel multiplier of the specular map.
---@param a number The alpha channel multiplier of the specular map.
function mesh.Specular(r, g, b, a) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the `S` tangent to be used, also known as "binormal".
---
--- Tangents and binormals are using in bumpmap rendering.
---
--- See also [mesh.TangentT](https://wiki.facepunch.com/gmod/mesh.TangentT) and [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.TangentS)
---@param tangentS Vector The S tangent.
function mesh.TangentS(tangentS) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the `S` tangent to be used, also known as "binormal".
---
--- Tangents and binormals are using in bumpmap rendering.
---
--- See also [mesh.TangentT](https://wiki.facepunch.com/gmod/mesh.TangentT) and [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.TangentS)
---@param x number The X part of the vertex' tangent S.
---@param y number The Y part of the vertex' tangent S.
---@param z number The Z part of the vertex' tangent S.
function mesh.TangentS(x, y, z) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the `T` tangent to be used.
---
--- Tangents and binormals are using in bumpmap rendering.
---
--- See also [mesh.TangentS](https://wiki.facepunch.com/gmod/mesh.TangentS) and [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.TangentT)
---@param tangentT Vector The T tangent.
function mesh.TangentT(tangentT) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the `T` tangent to be used.
---
--- Tangents and binormals are using in bumpmap rendering.
---
--- See also [mesh.TangentS](https://wiki.facepunch.com/gmod/mesh.TangentS) and [mesh.Begin](https://wiki.facepunch.com/gmod/mesh.Begin).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.TangentT)
---@param x number The X part of the vertex' tangent T.
---@param y number The Y part of the vertex' tangent T.
---@param z number The Z part of the vertex' tangent T.
function mesh.TangentT(x, y, z) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the texture coordinates for the next vertex.
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.TexCoord)
---@param set number The texture coordinate set, 0 to 7.
---
--- Non-zero values require the currently bound material to support it. For example, any `LightmappedGeneric` material supports sets 1 and 2 (lightmap texture coordinates and bump map texture coords?).
---@param s number S coordinate.
---@param t number T coordinate.
---@param u? number U coordinate.
---@param v? number V coordinate.
function mesh.TexCoord(set, s, t, u, v) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) A set of four numbers that can be used for arbitrary purposes by [Material](https://wiki.facepunch.com/gmod/Material) shaders.
--- This is most commonly used to provide tangent information about each vertex to the Material's shader.
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.UserData)
---@param tangentX number
---@param tangentY number
---@param tangentZ number
---@param tangentHandedness number
function mesh.UserData(tangentX, tangentY, tangentZ, tangentHandedness) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the amount of vertices that have been pushed via [mesh.AdvanceVertex](https://wiki.facepunch.com/gmod/mesh.AdvanceVertex).
---
---[View wiki](https://wiki.facepunch.com/gmod/mesh.VertexCount)
---@return number # The amount of vertices.
function mesh.VertexCount() end
