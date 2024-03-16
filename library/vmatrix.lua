---@meta

---@class VMatrix
--- A 4x4 matrix.
---
--- This page lists all possible functions to manipulate matrices.
---
--- This object can be created by Global.Matrix.
---@operator add(VMatrix): VMatrix
---@operator mul(Vector): Vector
---@operator mul(VMatrix): VMatrix
---@operator sub(VMatrix): VMatrix
---@operator unm: VMatrix
local VMatrix = {}

---[SHARED] Adds given matrix to this matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Add)
---@param input VMatrix The input matrix to add.
function VMatrix:Add(input) end

---[SHARED] Returns the absolute rotation of the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetAngles)
---@return Angle # Absolute rotation of the matrix
function VMatrix:GetAngles() end

---[SHARED] Returns a specific field in the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetField)
---@param row number Row of the field whose value is to be retrieved, from 1 to 4
---@param column number Column of the field whose value is to be retrieved, from 1 to 4
---@return number # The value of the specified field
function VMatrix:GetField(row, column) end

---[SHARED] Gets the forward direction of the matrix.
---
--- ie. The first column of the matrix, excluding the w coordinate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetForward)
---@return Vector # The forward direction of the matrix.
function VMatrix:GetForward() end

---[SHARED] Returns an inverted matrix without modifying the original matrix.
---
--- Inverting the matrix will fail if its [determinant](https://en.wikipedia.org/wiki/Determinant) is 0 or close to 0. (ie. its "scale" in any direction is 0.)
---
--- See also VMatrix:GetInverseTR.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetInverse)
---@return VMatrix # The inverted matrix if possible, nil otherwise
function VMatrix:GetInverse() end

---[SHARED] Returns an inverted matrix without modifying the original matrix. This function will not fail, but only works correctly on matrices that contain only translation and/or rotation.
---
--- Using this function on a matrix with modified scale may return an incorrect inverted matrix.
---
--- To get the inverse of a matrix that contains other modifications, see VMatrix:GetInverse.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetInverseTR)
---@return VMatrix # The inverted matrix.
function VMatrix:GetInverseTR() end

---[SHARED] Gets the right direction of the matrix.
---
--- ie. The second column of the matrix, negated, excluding the w coordinate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetRight)
---@return Vector # The right direction of the matrix.
function VMatrix:GetRight() end

---[SHARED] Returns the absolute scale of the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetScale)
---@return Vector # Absolute scale of the matrix
function VMatrix:GetScale() end

---[SHARED] Returns the absolute translation of the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetTranslation)
---@return Vector # Absolute translation of the matrix
function VMatrix:GetTranslation() end

---[SHARED] Returns the transpose (each row becomes a column) of this matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetTransposed)
---@return VMatrix # The transposed matrix.
function VMatrix:GetTransposed() end

---[SHARED] Gets the up direction of the matrix.
---
--- ie. The third column of the matrix, excluding the w coordinate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:GetUp)
---@return Vector # The up direction of the matrix.
function VMatrix:GetUp() end

---[SHARED] Initializes the matrix as Identity matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Identity)
function VMatrix:Identity() end

---[SHARED] Inverts the matrix.
---
--- Inverting the matrix will fail if its [determinant](https://en.wikipedia.org/wiki/Determinant) is 0 or close to 0. (ie. its "scale" in any direction is 0.)
---
--- If the matrix cannot be inverted, it does not get modified.
---
--- See also VMatrix:InvertTR.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Invert)
---@return boolean # Whether the matrix was inverted or not
function VMatrix:Invert() end

---[SHARED] Inverts the matrix. This function will not fail, but only works correctly on matrices that contain only translation and/or rotation.
---
--- Using this function on a matrix with modified scale may return an incorrect inverted matrix.
---
--- To invert a matrix that contains other modifications, see VMatrix:Invert.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:InvertTR)
function VMatrix:InvertTR() end

---[SHARED] Returns whether the matrix is equal to Identity matrix or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:IsIdentity)
---@return boolean # Is the matrix an Identity matrix or not
function VMatrix:IsIdentity() end

---[SHARED] Returns whether the matrix is a rotation matrix or not.
---
--- Technically it checks if the forward, right and up vectors are orthogonal and normalized.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:IsRotationMatrix)
---@return boolean # Is the matrix a rotation matrix or not
function VMatrix:IsRotationMatrix() end

---[SHARED] Checks whenever all fields of the matrix are 0, aka if this is a [null matrix](https://en.wikipedia.org/wiki/Zero_matrix).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:IsZero)
---@return boolean # If the matrix is a null matrix.
function VMatrix:IsZero() end

---[SHARED] Multiplies this matrix by given matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Mul)
---@param input VMatrix The input matrix to multiply by.
function VMatrix:Mul(input) end

---[SHARED] Rotates the matrix by the given angle.
---
--- Postmultiplies the matrix by a rotation matrix (A = AR).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Rotate)
---@param rotation Angle Rotation.
function VMatrix:Rotate(rotation) end

---[SHARED] Scales the matrix by the given vector.
---
--- Postmultiplies the matrix by a scaling matrix (A = AS).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Scale)
---@param scale Vector Vector to scale with matrix with.
function VMatrix:Scale(scale) end

---[SHARED] Scales the absolute translation with the given value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:ScaleTranslation)
---@param scale number Value to scale the translation with.
function VMatrix:ScaleTranslation(scale) end

---[SHARED] Copies values from the given matrix object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Set)
---@param src VMatrix The matrix to copy values from.
function VMatrix:Set(src) end

---[SHARED] Sets the absolute rotation of the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetAngles)
---@param angle Angle New angles.
function VMatrix:SetAngles(angle) end

---[SHARED] Sets a specific field in the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetField)
---@param row number Row of the field to be set, from 1 to 4
---@param column number Column of the field to be set, from 1 to 4
---@param value number The value to set in that field
function VMatrix:SetField(row, column, value) end

---[SHARED] Sets the forward direction of the matrix.
---
--- ie. The first column of the matrix, excluding the w coordinate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetForward)
---@param forward Vector The forward direction of the matrix.
function VMatrix:SetForward(forward) end

---[SHARED] Sets the right direction of the matrix.
---
--- ie. The second column of the matrix, negated, excluding the w coordinate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetRight)
---@param forward Vector The right direction of the matrix.
function VMatrix:SetRight(forward) end

---[SHARED] Modifies the scale of the matrix while preserving the rotation and translation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetScale)
---@param scale Vector The scale to set.
function VMatrix:SetScale(scale) end

---[SHARED] Sets the absolute translation of the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetTranslation)
---@param translation Vector New translation.
function VMatrix:SetTranslation(translation) end

---[SHARED] Sets each component of the matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetUnpacked)
---@param e11 number
---@param e12 number
---@param e13 number
---@param e14 number
---@param e21 number
---@param e22 number
---@param e23 number
---@param e24 number
---@param e31 number
---@param e32 number
---@param e33 number
---@param e34 number
---@param e41 number
---@param e42 number
---@param e43 number
---@param e44 number
function VMatrix:SetUnpacked(e11, e12, e13, e14, e21, e22, e23, e24, e31, e32, e33, e34, e41, e42, e43, e44) end

---[SHARED] Sets the up direction of the matrix.
---
--- ie. The third column of the matrix, excluding the w coordinate.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:SetUp)
---@param forward Vector The up direction of the matrix.
function VMatrix:SetUp(forward) end

---[SHARED] Subtracts given matrix from this matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Sub)
---@param input VMatrix The input matrix to subtract.
function VMatrix:Sub(input) end

---[SHARED] Converts the matrix to a 4x4 table. See Global.Matrix function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:ToTable)
---@return table # The 4x4 table.
function VMatrix:ToTable() end

---[SHARED] Translates the matrix by the given vector aka. adds the vector to the translation.
---
--- Postmultiplies the matrix by a translation matrix (A = AT).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Translate)
---@param translation Vector Vector to translate the matrix by.
function VMatrix:Translate(translation) end

---[SHARED] Returns each component of the matrix, expanding rows before columns.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Unpack)
---@return number # VMatrix:GetField(1, 1)
---@return number # VMatrix:GetField(1, 2)
---@return number # VMatrix:GetField(1, 3)
---@return number # VMatrix:GetField(1, 4)
---@return number # VMatrix:GetField(2, 1)
---@return number # VMatrix:GetField(2, 2)
---@return number # VMatrix:GetField(2, 3)
---@return number # VMatrix:GetField(2, 4)
---@return number # VMatrix:GetField(3, 1)
---@return number # VMatrix:GetField(3, 2)
---@return number # VMatrix:GetField(3, 3)
---@return number # VMatrix:GetField(3, 4)
---@return number # VMatrix:GetField(4, 1)
---@return number # VMatrix:GetField(4, 2)
---@return number # VMatrix:GetField(4, 3)
---@return number # VMatrix:GetField(4, 4)
function VMatrix:Unpack() end

---[SHARED] Sets all components of the matrix to 0, also known as a [null matrix](https://en.wikipedia.org/wiki/Zero_matrix).
---
--- This function is more efficient than setting each element manually.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/VMatrix:Zero)
function VMatrix:Zero() end
