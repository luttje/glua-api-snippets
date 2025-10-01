---@meta

--- An object representing game texture, such as those loaded from a `.vtf` file.
---
--- Do not confuse with [IMaterial](https://wiki.facepunch.com/gmod/IMaterial). Materials use textures. Game uses materials.
---
--- Returned by [IMaterial:GetTexture](https://wiki.facepunch.com/gmod/IMaterial:GetTexture)
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture)
---@class ITexture
local ITexture = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Invokes the generator of the texture. Reloads file based textures from disk and clears render target textures.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:Download)
function ITexture:Download() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the color of the specified pixel, only works for textures created from PNG files.
---
--- The returned color will not have the color metatable.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:GetColor)
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return Color # The color of the pixel as a Color.
function ITexture:GetColor(x, y) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the true unmodified height of the texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:GetMappingHeight)
---@return number # height
function ITexture:GetMappingHeight() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the true unmodified width of the texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:GetMappingWidth)
---@return number # width
function ITexture:GetMappingWidth() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the name of the texture, in most cases the path.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:GetName)
---@return string # name
function ITexture:GetName() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the number of animation frames in this texture.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:GetNumAnimationFrames)
---@return number # The number of animation frames in this texture.
function ITexture:GetNumAnimationFrames() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the modified height of the texture, this value may be affected by mipmapping and other factors.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:Height)
---@return number # height
function ITexture:Height() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whenever the texture is valid. (i.e. was loaded successfully or not)
---
--- **NOTE**: The "error" texture is a valid texture, and therefore this function will return false when used on it. Use [ITexture:IsErrorTexture](https://wiki.facepunch.com/gmod/ITexture:IsErrorTexture), instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:IsError)
---@return boolean # Whether the texture was loaded successfully or not.
function ITexture:IsError() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whenever the texture is the error texture (pink and black checkerboard pattern).
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:IsErrorTexture)
---@return boolean # Whether the texture is the error texture or not.
function ITexture:IsErrorTexture() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the modified width of the texture, this value may be affected by mipmapping and other factors.
---
---[View wiki](https://wiki.facepunch.com/gmod/ITexture:Width)
---@return number # width
function ITexture:Width() end
