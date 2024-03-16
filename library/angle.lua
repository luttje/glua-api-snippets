---@meta

---@class Angle
--- List of all possible functions to manipulate angles.
---
--- Created by Global.Angle.
---@field p number
---@field y number
---@field r number
---@field pitch number
---@field yaw number
---@field roll number
---@field x number
---@field z number
---@field [1] number
---@field [2] number
---@field [3] number
---@operator add(Angle): Angle
---@operator div(number): Angle
---@operator mul(number): Angle
---@operator sub(Angle): Angle
---@operator unm: Angle
local Angle = {}

---[SHARED AND MENU] Adds the values of the argument angle to the orignal angle.
---
--- This functions the same as angle1 + angle2 without creating a new angle object, skipping object construction and garbage collection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Add)
---@param angle Angle The angle to add.
function Angle:Add(angle) end

---[SHARED AND MENU] Divides all values of the original angle by a scalar. This functions the same as angle1 / num without creating a new angle object, skipping object construction and garbage collection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Div)
---@param scalar number The number to divide by.
function Angle:Div(scalar) end

---[SHARED AND MENU] Returns a normal vector facing in the direction that the angle points.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Forward)
---@return Vector # The forward direction of the angle
function Angle:Forward() end

---[SHARED AND MENU] Returns if the angle is equal to another angle with the given tolerance.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:IsEqualTol)
---@param compare Angle The angle to compare to.
---@param tolerance number The tolerance range.
---@return boolean # Are the angles equal or not.
function Angle:IsEqualTol(compare, tolerance) end

---[SHARED AND MENU] Returns whether the pitch, yaw and roll are 0 or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:IsZero)
---@return boolean # Whether the pitch, yaw and roll are 0 or not.
function Angle:IsZero() end

---[SHARED AND MENU] Multiplies a scalar to all the values of the orignal angle. This functions the same as num * angle without creating a new angle object, skipping object construction and garbage collection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Mul)
---@param scalar number The number to multiply.
function Angle:Mul(scalar) end

---[SHARED AND MENU] Normalizes the angles by applying a module with 360 to pitch, yaw and roll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Normalize)
function Angle:Normalize() end

---[SHARED AND MENU] Randomizes each element of this Angle object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Random)
---@param min? number The minimum value for each component.
---@param max? number The maximum value for each component.
function Angle:Random(min, max) end

---[SHARED AND MENU] Returns a normal vector facing in the direction that points right relative to the angle's direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Right)
---@return Vector # The right direction of the angle
function Angle:Right() end

---[SHARED AND MENU] Rotates the angle around the specified axis by the specified degrees.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:RotateAroundAxis)
---@param axis Vector The axis to rotate around as a normalized unit vector. When argument is not a unit vector, you will experience numerical offset errors in the rotated angle.
---@param rotation number The degrees to rotate around the specified axis.
function Angle:RotateAroundAxis(axis, rotation) end

---[SHARED AND MENU] Copies pitch, yaw and roll from the second angle to the first.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Set)
---@param originalAngle Angle The angle to copy the values from.
function Angle:Set(originalAngle) end

---[SHARED AND MENU] Sets the p, y, and r of the angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:SetUnpacked)
---@param p number The pitch component of the Angle
---@param y number The yaw component of the Angle
---@param r number The roll component of the Angle
function Angle:SetUnpacked(p, y, r) end

---[SHARED] Snaps the angle to nearest interval of degrees.
---
--- This will modify the original angle too!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:SnapTo)
---@param axis string The component/axis to snap. Can be either `p`/`pitch`, `y`/`yaw` or `r`/`roll`.
---@param target number The target angle snap interval
---@return Angle # The snapped angle.
function Angle:SnapTo(axis, target) end

---[SHARED AND MENU] Subtracts the values of the argument angle to the orignal angle. This functions the same as angle1 - angle2 without creating a new angle object, skipping object construction and garbage collection.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Sub)
---@param angle Angle The angle to subtract.
function Angle:Sub(angle) end

---[SHARED AND MENU] Returns the angle as a table with three elements.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:ToTable)
---@return table # The table with elements 1 = p, 2 = y, 3 = r.
function Angle:ToTable() end

---[SHARED AND MENU] Returns the pitch, yaw, and roll components of the angle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Unpack)
---@return number # p, pitch, x, or Angle[1].
---@return number # y, yaw, or Angle[2].
---@return number # r, roll, r, or Angle[3].
function Angle:Unpack() end

---[SHARED AND MENU] Returns a normal vector facing in the direction that points up relative to the angle's direction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Up)
---@return Vector # The up direction of the angle.
function Angle:Up() end

---[SHARED AND MENU] Sets pitch, yaw and roll to 0.
--- This function is faster than doing it manually.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Angle:Zero)
function Angle:Zero() end
