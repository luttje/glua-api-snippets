---@meta

--- A brush surface object returned by [Entity:GetBrushSurfaces](https://wiki.facepunch.com/gmod/Entity:GetBrushSurfaces).
---
--- Brush surfaces are a part of what makes up the map geometry aside from displacements. Any primitive brush model, including most breakable windows, can be represented by this object.
---
--- **NOTE**: This object internally uses the `SurfaceHandle_t` class, which is an alias for `msurface2_t*`.
---
---[View wiki](https://wiki.facepunch.com/gmod/SurfaceInfo)
---@class SurfaceInfo
local SurfaceInfo = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the brush surface's material.
---
---[View wiki](https://wiki.facepunch.com/gmod/SurfaceInfo:GetMaterial)
---@return IMaterial # Material of one portion of a brush model.
function SurfaceInfo:GetMaterial() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a list of vertices the brush surface is built from.
---
---[View wiki](https://wiki.facepunch.com/gmod/SurfaceInfo:GetVertices)
---@return Vector[] # A list of Vector points. This will usually be 4 corners of a quadrilateral in counter-clockwise order.
function SurfaceInfo:GetVertices() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the brush surface is a nodraw surface, meaning it will not be drawn by the engine.
---
--- **NOTE**: This internally checks the SURFDRAW_NODRAW flag.
---
---[View wiki](https://wiki.facepunch.com/gmod/SurfaceInfo:IsNoDraw)
---@return boolean # Returns true if this surface won't be drawn.
function SurfaceInfo:IsNoDraw() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the brush surface is displaying the skybox.
---
--- **NOTE**: This internally checks the SURFDRAW_SKY flag.
---
---[View wiki](https://wiki.facepunch.com/gmod/SurfaceInfo:IsSky)
---@return boolean # Returns true if the surface is the sky.
function SurfaceInfo:IsSky() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks if the brush surface is water.
---
--- **NOTE**: This internally checks the SURFDRAW_WATER flag.
---
---[View wiki](https://wiki.facepunch.com/gmod/SurfaceInfo:IsWater)
---@return boolean # Returns true if the surface is water.
function SurfaceInfo:IsWater() end
