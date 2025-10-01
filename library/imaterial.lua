---@meta

--- A Material object. It represents a game material, similarly to how a `.vmt` file does, which are in fact loaded into an **IMaterial** object.
---
--- In most cases the game works with materials as far as file paths go. Materials then point to different [ITexture](https://wiki.facepunch.com/gmod/ITexture)s (`.vtf` files) they might be using.
--- They are not the same and cannot be interchanged.
---
--- A material object can be created with [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) or [Global.CreateMaterial](https://wiki.facepunch.com/gmod/Global.CreateMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial)
---@class IMaterial
local IMaterial = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the color of the specified pixel of the `$basetexture`, only works for materials created from PNG files.
---
--- Basically identical to [ITexture:GetColor](https://wiki.facepunch.com/gmod/ITexture:GetColor) used on [IMaterial:GetTexture](https://wiki.facepunch.com/gmod/IMaterial:GetTexture)`( "$basetexture" )`.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetColor)
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return Color # The color of the pixel as a Color.
function IMaterial:GetColor(x, y) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the specified material value as a float, or nil if the value is not set.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetFloat)
---@param materialFloat string The name of the material value.
---@return number # float
function IMaterial:GetFloat(materialFloat) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the specified material value as a int, rounds the value if its a float, or nil if the value is not set.
---
--- **NOTE**: Please note that certain material flags such as `$model` are stored in the `$flags` variable and cannot be directly retrieved with this function. See the full list here: [Material Flags](https://wiki.facepunch.com/gmod/Material_Flags)
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetInt)
---@param materialInt string The name of the material integer.
---@return number # The retrieved value as an integer
function IMaterial:GetInt(materialInt) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets all the key values defined for the material.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetKeyValues)
---@return table<string, any> # The material's key values.
function IMaterial:GetKeyValues() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the specified material matrix as a int, or nil if the value is not set or is not a matrix.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetMatrix)
---@param materialMatrix string The name of the material matrix.
---@return VMatrix # matrix
function IMaterial:GetMatrix(materialMatrix) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the name of the material, in most cases the path.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetName)
---@return string # Material name/path
function IMaterial:GetName() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the name of the materials shader.
---
--- This function does not work serverside on Linux SRCDS.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetShader)
---@return string # shaderName
function IMaterial:GetShader() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the specified material string, or nil if the value is not set or if the value can not be converted to a string.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetString)
---@param materialString string The name of the material string.
---@return string # The value as a string
function IMaterial:GetString(materialString) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an [ITexture](https://wiki.facepunch.com/gmod/ITexture) based on the passed shader parameter.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetTexture)
---@param param string The [shader parameter](https://developer.valvesoftware.com/wiki/Category:List_of_Shader_Parameters) to retrieve. This should normally be `$basetexture`.
---@return ITexture # The value of the shader parameter. Returns nothing if the param doesn't exist.
function IMaterial:GetTexture(param) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the specified material vector, or nil if the value is not set.
---
--- See also [IMaterial:GetVectorLinear](https://wiki.facepunch.com/gmod/IMaterial:GetVectorLinear)
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetVector)
---@param materialVector string The name of the material vector.
---@return Vector # The color vector
function IMaterial:GetVector(materialVector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the specified material vector as a 4 component vector.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetVector4D)
---@param name string The name of the material vector to retrieve.
---@return number # The x component of the vector.
---@return number # The y component of the vector.
---@return number # The z component of the vector.
---@return number # The w component of the vector.
function IMaterial:GetVector4D(name) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the specified material linear color vector, or nil if the value is not set.
---
--- See https://en.wikipedia.org/wiki/Gamma_correction
---
--- See also [IMaterial:GetVector](https://wiki.facepunch.com/gmod/IMaterial:GetVector)
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:GetVectorLinear)
---@param materialVector string The name of the material vector.
---@return Vector # The linear color vector
function IMaterial:GetVectorLinear(materialVector) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the height of the member texture set for `$basetexture`.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:Height)
---@return number # Height of the base texture.
function IMaterial:Height() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whenever the material is valid, i.e. whether it was not loaded successfully from disk or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:IsError)
---@return boolean # Is this material the error material? (___error)
function IMaterial:IsError() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Recomputes the material's snapshot. This needs to be called if you have changed variables on your material and it isn't changing.
---
--- Be careful though - this function is slow - so try to call it only when needed!
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:Recompute)
function IMaterial:Recompute() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Changes the Material into the give Image.
--- **INTERNAL**: This is used by the Background to change the Image.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetDynamicImage)
---@param path string The path to a Image.
function IMaterial:SetDynamicImage(path) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the specified material float to the specified float, does nothing on a type mismatch.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetFloat)
---@param materialFloat string The name of the material float.
---@param float number The new float value.
function IMaterial:SetFloat(materialFloat, float) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the specified material value to the specified int, does nothing on a type mismatch.
---
--- **NOTE**: Please note that certain material flags such as `$model` are stored in the `$flags` variable and cannot be directly set with this function. See the full list here: [Material Flags](https://wiki.facepunch.com/gmod/Material_Flags)
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetInt)
---@param materialInt string The name of the material int.
---@param int number The new int value.
function IMaterial:SetInt(materialInt, int) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the specified material value to the specified matrix, does nothing on a type mismatch.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetMatrix)
---@param materialMatrix string The name of the material int.
---@param matrix VMatrix The new matrix.
function IMaterial:SetMatrix(materialMatrix, matrix) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) The functionality of this function was removed due to the amount of crashes it caused.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetShader)
---@param shaderName string Name of the shader
---@deprecated This function does nothing
function IMaterial:SetShader(shaderName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the specified material value to the specified string, does nothing on a type mismatch.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetString)
---@param materialString string The name of the material string.
---@param string string The new string.
function IMaterial:SetString(materialString, string) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the specified material texture to the specified texture, does nothing on a type mismatch.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetTexture)
---@param materialTexture string The name of the keyvalue on the material to store the texture on.
---@param texture ITexture The new texture. This can also be a string, the name of the new texture.
function IMaterial:SetTexture(materialTexture, texture) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Unsets the value for the specified material value.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetUndefined)
---@param materialValueName string The name of the material value to be unset.
function IMaterial:SetUndefined(materialValueName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the specified material vector to the specified vector, does nothing on a type mismatch.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetVector)
---@param MaterialVector string The name of the material vector.
---@param vec Vector The new vector.
function IMaterial:SetVector(MaterialVector, vec) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets the specified material vector to the specified 4 component vector, does nothing on a type mismatch.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:SetVector4D)
---@param name string The name of the material vector.
---@param x number The x component of the new vector.
---@param y number The y component of the new vector.
---@param z number The z component of the new vector.
---@param w number The w component of the new vector.
function IMaterial:SetVector4D(name, x, y, z, w) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the width of the member texture set for `$basetexture`.
---
---[View wiki](https://wiki.facepunch.com/gmod/IMaterial:Width)
---@return number # Width of the base texture.
function IMaterial:Width() end
