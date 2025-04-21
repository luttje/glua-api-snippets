---@meta

---@class Vector
--- List of all possible functions to manipulate vectors.
---
--- Created by Global.Vector.
---@field x number
---@field y number
---@field z number
---@field [1] number
---@field [2] number
---@field [3] number
---@operator add(Vector): Vector
---@operator div(number|Vector): Vector
---@operator mul(number|Vector): Vector
---@operator sub(Vector): Vector
---@operator unm: Vector
local Vector = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Adds the values of the argument vector to the original vector. This function is the same as vector1 + vector2 without creating a new vector object, skipping object construction and garbage collection.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Add)
---@param vector Vector The vector to add.
function Vector:Add(vector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an angle representing the normal of the vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Angle)
---@return Angle # The angle/direction of the vector.
function Vector:Angle() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the angle of this vector (normalized), but instead of assuming that up is [Global.Vector](https://wiki.facepunch.com/gmod/Global.Vector)( 0, 0, 1 ) (Like [Vector:Angle](https://wiki.facepunch.com/gmod/Vector:Angle) does) you can specify which direction is 'up' for the angle.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:AngleEx)
---@param up Vector The up direction vector
---@return Angle # The angle
function Vector:AngleEx(up) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Calculates the cross product of this vector and the passed one.
---
--- The cross product of two vectors is a 3-dimensional vector with a direction perpendicular (at right angles) to both of them (according to the [right-hand rule](https://en.wikipedia.org/wiki/Right-hand_rule)), and magnitude equal to the area of parallelogram they span. This is defined as the product of the magnitudes, the sine of the angle between them, and unit (normal) vector `n` defined by the right-hand rule:
--- :**a** &times; **b** = |**a**| |**b**| sin(&theta;) **n̂**
--- where **a** and **b** are vectors, and **n̂** is a unit vector (magnitude of 1) perpendicular to both.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Cross)
---@param otherVector Vector Vector to calculate the cross product with.
---@return Vector # The cross product of the two vectors.
function Vector:Cross(otherVector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the Euclidean distance between the vector and the other vector.
---
--- **NOTE**: This function is more expensive than [Vector:DistToSqr](https://wiki.facepunch.com/gmod/Vector:DistToSqr). However, please see the notes for [Vector:DistToSqr](https://wiki.facepunch.com/gmod/Vector:DistToSqr) before using it as squared distances are not the same as euclidean distances.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Distance)
---@param otherVector Vector The vector to get the distance to.
---@return number # Distance between the vectors.
function Vector:Distance(otherVector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the Euclidean distance between the vector and the other vector in 2D space. The Z axis is ignored.
---
--- **NOTE**: This function is more expensive than [Vector:Distance2DSqr](https://wiki.facepunch.com/gmod/Vector:Distance2DSqr). However, please see the notes for [Vector:Distance2DSqr](https://wiki.facepunch.com/gmod/Vector:Distance2DSqr) before using it as squared distances are not the same as Euclidean distances.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Distance2D)
---@param otherVector Vector The vector to get the distance to.
---@return number # Distance between the vectors in 2D space.
function Vector:Distance2D(otherVector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the squared distance between 2 vectors in 2D space, ignoring the Z axis. This is faster than [Vector:Distance2D](https://wiki.facepunch.com/gmod/Vector:Distance2D) as calculating the square root is an expensive process.
---
--- 	**NOTE**: Squared distances should not be summed. If you need to sum distances, use [Vector:Distance2D](https://wiki.facepunch.com/gmod/Vector:Distance2D).
---
--- When performing a distance check, ensure the distance being checked against is squared.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Distance2DSqr)
---@param otherVec Vector The vector to calculate the distance to.
---@return number # Squared distance to the vector in 2D space.
function Vector:Distance2DSqr(otherVec) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the squared distance of 2 vectors, this is quicker to call than [Vector:Distance](https://wiki.facepunch.com/gmod/Vector:Distance) as DistToSqr does not need to calculate the square root, which is an expensive process.
---
--- 	**NOTE**: Squared distances should not be summed. If you need to sum distances, use [Vector:Distance](https://wiki.facepunch.com/gmod/Vector:Distance).
---
--- When performing a distance check, ensure the distance being checked against is squared. See example code below.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:DistToSqr)
---@param otherVec Vector The vector to calculate the distance to.
---@return number # Squared distance to the vector.
function Vector:DistToSqr(otherVec) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Divide the vector by the given number, that means x, y and z are divided by that value. This will change the value of the original vector, see example 2 for division without changing the value.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Div)
---@param divisor number The value to divide the vector with.
function Vector:Div(divisor) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the [dot product](https://en.wikipedia.org/wiki/Dot_product#Geometric_definition)  of this vector and the passed one.
---
--- The dot product of two vectors is the product of their magnitudes (lengths), and the cosine of the angle between them:
--- **a · b** = |**a**| |**b**| cos(θ)
--- where **a** and **b** are vectors.
--- See [Vector:Length](https://wiki.facepunch.com/gmod/Vector:Length) for obtaining magnitudes.
---
--- A dot product returns just the cosine of the angle if both vectors are normalized, and zero if the vectors are at right angles to each other.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Dot)
---@param otherVector Vector The vector to calculate the dot product with
---@return number # The dot product between the two vectors
function Vector:Dot(otherVector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the dot product of the two vectors.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:DotProduct)
---@param Vector Vector The other vector.
---@return number # Dot Product
---@deprecated This is an alias of Vector:Dot. Use that instead.
function Vector:DotProduct(Vector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the negative version of this vector, i.e. a vector with every component to the negative value of itself.
---
--- See also [Vector:Negate](https://wiki.facepunch.com/gmod/Vector:Negate).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:GetNegated)
---@return Vector # The negative of this vector.
function Vector:GetNegated() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a normalized version of the vector. This is a alias of [Vector:GetNormalized](https://wiki.facepunch.com/gmod/Vector:GetNormalized).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:GetNormal)
---@return Vector # Normalized version of the vector.
---@deprecated Use Vector:GetNormalized instead.
function Vector:GetNormal() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a normalized version of the vector. Normalized means vector with same direction but with length of 1.
---
--- This does not affect the vector you call it on; to do this, use [Vector:Normalize](https://wiki.facepunch.com/gmod/Vector:Normalize).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:GetNormalized)
---@return Vector # Normalized version of the vector.
function Vector:GetNormalized() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns if the vector is equal to another vector with the given tolerance.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:IsEqualTol)
---@param compare Vector The vector to compare to.
---@param tolerance number The tolerance range.
---@return boolean # Are the vectors equal or not.
function Vector:IsEqualTol(compare, tolerance) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Checks whenever all fields of the vector are 0.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:IsZero)
---@return boolean # Do all fields of the vector equal 0 or not
function Vector:IsZero() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the [Euclidean length](https://en.wikipedia.org/wiki/Euclidean_vector#Length) of the vector: &radic;(x&sup2; + y&sup2; + z&sup2;).
---
--- **WARNING**: This is a relatively expensive process since it uses the square root. It is recommended that you use [Vector:LengthSqr](https://wiki.facepunch.com/gmod/Vector:LengthSqr) whenever possible.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Length)
---@return number # Length of the vector.
function Vector:Length() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the length of the vector in two dimensions, without the Z axis.
---
--- **WARNING**: This is a relatively expensive process since it uses the square root. It is recommended that you use [Vector:Length2DSqr](https://wiki.facepunch.com/gmod/Vector:Length2DSqr) whenever possible.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Length2D)
---@return number # Length of the vector in two dimensions, √(x² + y²)
function Vector:Length2D() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the squared length of the vectors x and y value, x&sup2; + y&sup2;.
---
--- This is faster than [Vector:Length2D](https://wiki.facepunch.com/gmod/Vector:Length2D) as calculating the square root is an expensive process.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Length2DSqr)
---@return number # Squared length of the vector in two dimensions
function Vector:Length2DSqr() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the squared length of the vector, x&sup2; + y&sup2; + z&sup2;.
---
--- This is faster than [Vector:Length](https://wiki.facepunch.com/gmod/Vector:Length) as calculating the square root is an expensive process.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:LengthSqr)
---@return number # Squared length of the vector
function Vector:LengthSqr() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Scales the vector by the given [number](https://wiki.facepunch.com/gmod/number) (that means x, y and z are multiplied by that value), a [Vector](https://wiki.facepunch.com/gmod/Vector) (X, Y, and Z of each vector are multiplied) or a [VMatrix](https://wiki.facepunch.com/gmod/VMatrix) (Transforms the vector by the matrix's rotation/translation).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Mul)
---@param multiplier number The value to scale the vector with.
function Vector:Mul(multiplier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Negates this vector, i.e. sets every component to the negative value of itself. Same as `Vector( -vec.x, -vec.y, -vec.z )`
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Negate)
function Vector:Negate() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Normalizes the given vector. This changes the vector you call it on, if you want to return a normalized copy without affecting the original, use [Vector:GetNormalized](https://wiki.facepunch.com/gmod/Vector:GetNormalized).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Normalize)
function Vector:Normalize() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Randomizes each element of this Vector object.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Random)
---@param min? number The minimum value for each component.
---@param max? number The maximum value for each component.
function Vector:Random(min, max) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Rotates a vector by the given angle.
--- Doesn't return anything, but rather changes the original vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Rotate)
---@param rotation Angle The angle to rotate the vector by.
function Vector:Rotate(rotation) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Copies the values from the second vector to the first vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Set)
---@param vector Vector The vector to copy from.
function Vector:Set(vector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the x, y, and z of the vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:SetUnpacked)
---@param x number The x component
---@param y number The y component
---@param z number The z component
function Vector:SetUnpacked(x, y, z) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Substracts the values of the second vector from the orignal vector, this function can be used to avoid garbage collection.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Sub)
---@param vector Vector The other vector.
function Vector:Sub(vector) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Translates the [Vector](https://wiki.facepunch.com/gmod/Vector) (values ranging from 0 to 1) into a [Color](https://wiki.facepunch.com/gmod/Color). This will also range the values from 0 - 1 to 0 - 255.
---
--- x * 255 -> r
--- y * 255 -> g
--- z * 255 -> b
---
--- This is the opposite of [Color:ToVector](https://wiki.facepunch.com/gmod/Color:ToVector)
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:ToColor)
---@return Color # The created Color.
function Vector:ToColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns where on the screen the specified position vector would appear. A related function is [gui.ScreenToVector](https://wiki.facepunch.com/gmod/gui.ScreenToVector), which converts a 2D coordinate to a 3D direction.
---
--- **NOTE**: Should be called from a 3D rendering environment or after [cam.Start3D](https://wiki.facepunch.com/gmod/cam.Start3D) or it may not work correctly.
---
--- Errors in a render hook can make this value incorrect until the player restarts their game.
---
--- [cam.Start3D](https://wiki.facepunch.com/gmod/cam.Start3D) or 3D context [cam.Start](https://wiki.facepunch.com/gmod/cam.Start) with non-default parameters incorrectly sets the reference FOV for this function, causing incorrect return values. This can be fixed by creating and ending a default 3D context ([cam.Start3D](https://wiki.facepunch.com/gmod/cam.Start3D) with no arguments).
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:ToScreen)
---@return ToScreenData # The created Structures/ToScreenData.
function Vector:ToScreen() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the vector as a table with three elements.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:ToTable)
---@return table # The table with elements 1 = x, 2 = y, 3 = z.
function Vector:ToTable() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the x, y, and z of the vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Unpack)
---@return number # x or Vector[1].
---@return number # y or Vector[2].
---@return number # z or Vector[3].
function Vector:Unpack() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whenever the given vector is in a box created by the 2 other vectors.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:WithinAABox)
---@param boxStart Vector The first vector.
---@param boxEnd Vector The second vector.
---@return boolean # Is the vector in the box or not.
function Vector:WithinAABox(boxStart, boxEnd) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets x, y and z to 0.
---
---[View wiki](https://wiki.facepunch.com/gmod/Vector:Zero)
function Vector:Zero() end
