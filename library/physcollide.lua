---@meta

--- A PhysCollide holds collision data from VPhysics. These objects can be used to run (currently quite limited) collision tests, but do not represent actual physics objects.
---
--- Created by [Global.CreatePhysCollideBox](https://wiki.facepunch.com/gmod/Global.CreatePhysCollideBox) or [Global.CreatePhysCollidesFromModel](https://wiki.facepunch.com/gmod/Global.CreatePhysCollidesFromModel).
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysCollide)
---@class PhysCollide
local PhysCollide = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Destroys the [PhysCollide](https://wiki.facepunch.com/gmod/PhysCollide) object.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysCollide:Destroy)
function PhysCollide:Destroy() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Checks whether this [PhysCollide](https://wiki.facepunch.com/gmod/PhysCollide) object is valid or not.
---
--- You should just use [Global.IsValid](https://wiki.facepunch.com/gmod/Global.IsValid) instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysCollide:IsValid)
---@return boolean # Is valid or not.
function PhysCollide:IsValid() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Performs a trace against this PhysCollide with the given parameters. This can be used for both line traces and box traces.
---
---[View wiki](https://wiki.facepunch.com/gmod/PhysCollide:TraceBox)
---@param origin Vector The origin for the PhysCollide during the trace
---@param angles Angle The angles for the PhysCollide during the trace
---@param rayStart Vector The start position of the trace
---@param rayEnd Vector The end position of the trace
---@param rayMins Vector The mins of the trace's bounds
---@param rayMaxs Vector The maxs of the trace's bounds
---@return Vector # Hit position of the trace. This is false if the trace did not hit.
---@return Vector # Hit normal of the trace
---@return number # Fraction of the trace. This is calculated from the distance between startPos, hitPos, and endPos.
function PhysCollide:TraceBox(origin, angles, rayStart, rayEnd, rayMins, rayMaxs) end
