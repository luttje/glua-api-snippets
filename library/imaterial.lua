---@meta

--- A Material object. It represents a game material, similarly to how a .vmt file does.
---
--- It can be created with Global.Material or Global.CreateMaterial.
---@class IMaterial
local IMaterial = {}

---[SHARED AND MENU] Returns the color of the specified pixel of the $basetexture, only works for materials created from PNG files.
---
--- Basically identical to ITexture:GetColor used on IMaterial:GetTexture( "$basetexture" ).
---
--- The returned color will not have the color metatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetColor)
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return table # The color of the pixel as a Color.
function IMaterial:GetColor(x, y) end

---[SHARED AND MENU] Returns the specified material value as a float, or nil if the value is not set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetFloat)
---@param materialFloat string The name of the material value.
---@return number # float
function IMaterial:GetFloat(materialFloat) end

---[SHARED AND MENU] Returns the specified material value as a int, rounds the value if its a float, or nil if the value is not set.
---
--- Please note that certain material flags such as `$model` are stored in the `$flags` variable and cannot be directly retrieved with this function. See the full list here: Material Flags
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetInt)
---@param materialInt string The name of the material integer.
---@return number # The retrieved value as an integer
function IMaterial:GetInt(materialInt) end

---[SHARED] Gets all the key values defined for the material.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetKeyValues)
---@return table # The material's key values.
function IMaterial:GetKeyValues() end

---[SHARED] Returns the specified material matrix as a int, or nil if the value is not set or is not a matrix.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetMatrix)
---@param materialMatrix string The name of the material matrix.
---@return VMatrix # matrix
function IMaterial:GetMatrix(materialMatrix) end

---[SHARED AND MENU] Returns the name of the material, in most cases the path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetName)
---@return string # Material name/path
function IMaterial:GetName() end

---[SHARED AND MENU] Returns the name of the materials shader.
---
--- This function does not work serverside on Linux SRCDS.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetShader)
---@return string # shaderName
function IMaterial:GetShader() end

---[SHARED AND MENU] Returns the specified material string, or nil if the value is not set or if the value can not be converted to a string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetString)
---@param materialString string The name of the material string.
---@return string # The value as a string
function IMaterial:GetString(materialString) end

---[SHARED AND MENU] Returns an ITexture based on the passed shader parameter.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetTexture)
---@param param string The [shader parameter](https://developer.valvesoftware.com/wiki/Category:List_of_Shader_Parameters) to retrieve. This should normally be `$basetexture`.
---@return ITexture # The value of the shader parameter. Returns nothing if the param doesn't exist.
function IMaterial:GetTexture(param) end

---[SHARED AND MENU] Returns the specified material vector, or nil if the value is not set.
---
--- See also IMaterial:GetVectorLinear
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetVector)
---@param materialVector string The name of the material vector.
---@return Vector # The color vector
function IMaterial:GetVector(materialVector) end

---[SHARED AND MENU] Returns the specified material vector as a 4 component vector.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetVector4D)
---@param name string The name of the material vector to retrieve.
---@return number # The x component of the vector.
---@return number # The y component of the vector.
---@return number # The z component of the vector.
---@return number # The w component of the vector.
function IMaterial:GetVector4D(name) end

---[SHARED AND MENU] Returns the specified material linear color vector, or nil if the value is not set.
---
--- See https://en.wikipedia.org/wiki/Gamma_correction
---
--- See also IMaterial:GetVector
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:GetVectorLinear)
---@param materialVector string The name of the material vector.
---@return Vector # The linear color vector
function IMaterial:GetVectorLinear(materialVector) end

---[SHARED AND MENU] Returns the height of the member texture set for $basetexture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:Height)
---@return number # height
function IMaterial:Height() end

---[SHARED AND MENU] Returns whenever the material is valid, i.e. whether it was not loaded successfully from disk or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:IsError)
---@return boolean # Is this material the error material? (___error)
function IMaterial:IsError() end

---[SHARED AND MENU] Recomputes the material's snapshot. This needs to be called if you have changed variables on your material and it isn't changing.
---
--- Be careful though - this function is slow - so try to call it only when needed!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:Recompute)
function IMaterial:Recompute() end

---[MENU] Changes the Material into the give Image.
--- 		This is used by the Background to change the Image.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetDynamicImage)
---@param path string The path to a Image.
function IMaterial:SetDynamicImage(path) end

---[SHARED AND MENU] Sets the specified material float to the specified float, does nothing on a type mismatch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetFloat)
---@param materialFloat string The name of the material float.
---@param float number The new float value.
function IMaterial:SetFloat(materialFloat, float) end

---[SHARED AND MENU] Sets the specified material value to the specified int, does nothing on a type mismatch.
---
--- Please note that certain material flags such as `$model` are stored in the `$flags` variable and cannot be directly set with this function. See the full list here: Material Flags
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetInt)
---@param materialInt string The name of the material int.
---@param int number The new int value.
function IMaterial:SetInt(materialInt, int) end

---[SHARED] Sets the specified material value to the specified matrix, does nothing on a type mismatch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetMatrix)
---@param materialMatrix string The name of the material int.
---@param matrix VMatrix The new matrix.
function IMaterial:SetMatrix(materialMatrix, matrix) end

---[SHARED AND MENU] The functionality of this function was removed due to the amount of crashes it caused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetShader)
---@param shaderName string Name of the shader
---@deprecated This function does nothing
function IMaterial:SetShader(shaderName) end

---[SHARED AND MENU] Sets the specified material value to the specified string, does nothing on a type mismatch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetString)
---@param materialString string The name of the material string.
---@param string string The new string.
function IMaterial:SetString(materialString, string) end

---[SHARED AND MENU] Sets the specified material texture to the specified texture, does nothing on a type mismatch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetTexture)
---@param materialTexture string The name of the keyvalue on the material to store the texture on.
---@param texture ITexture The new texture. This can also be a string, the name of the new texture.
function IMaterial:SetTexture(materialTexture, texture) end

---[SHARED AND MENU] Unsets the value for the specified material value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetUndefined)
---@param materialValueName string The name of the material value to be unset.
function IMaterial:SetUndefined(materialValueName) end

---[SHARED AND MENU] Sets the specified material vector to the specified vector, does nothing on a type mismatch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetVector)
---@param MaterialVector string The name of the material vector.
---@param vec Vector The new vector.
function IMaterial:SetVector(MaterialVector, vec) end

---[SHARED AND MENU] Sets the specified material vector to the specified 4 component vector, does nothing on a type mismatch.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:SetVector4D)
---@param name string The name of the material vector.
---@param x number The x component of the new vector.
---@param y number The y component of the new vector.
---@param z number The z component of the new vector.
---@param w number The w component of the new vector.
function IMaterial:SetVector4D(name, x, y, z, w) end

---[SHARED AND MENU] Returns the width of the member texture set for $basetexture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/IMaterial:Width)
---@return number # width
function IMaterial:Width() end
