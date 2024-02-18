---@meta

--- An object representing game texture, like a .vtf file. Do not confuse with IMaterial. Returned by IMaterial:GetTexture
---@class ITexture
local ITexture = {}

---[SHARED AND MENU] Invokes the generator of the texture. Reloads file based textures from disk and clears render target textures.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:Download)
function ITexture:Download() end

---[SHARED AND MENU] Returns the color of the specified pixel, only works for textures created from PNG files.
---
--- The returned color will not have the color metatable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:GetColor)
---@param x number The X coordinate.
---@param y number The Y coordinate.
---@return table # The color of the pixel as a Color.
function ITexture:GetColor(x, y) end

---[SHARED AND MENU] Returns the true unmodified height of the texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:GetMappingHeight)
---@return number # height
function ITexture:GetMappingHeight() end

---[SHARED AND MENU] Returns the true unmodified width of the texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:GetMappingWidth)
---@return number # width
function ITexture:GetMappingWidth() end

---[SHARED AND MENU] Returns the name of the texture, in most cases the path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:GetName)
---@return string # name
function ITexture:GetName() end

---[SHARED AND MENU] Returns the number of animation frames in this texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:GetNumAnimationFrames)
---@return number # The number of animation frames in this texture.
function ITexture:GetNumAnimationFrames() end

---[SHARED AND MENU] Returns the modified height of the texture, this value may be affected by mipmapping and other factors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:Height)
---@return number # height
function ITexture:Height() end

---[SHARED AND MENU] Returns whenever the texture is valid. (i.e. was loaded successfully or not)
---
--- The "error" texture is a valid texture, and therefore this function will return false when used on it. Use ITexture:IsErrorTexture, instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:IsError)
---@return boolean # Whether the texture was loaded successfully or not.
function ITexture:IsError() end

---[SHARED AND MENU] Returns whenever the texture is the error texture (pink and black checkerboard pattern).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:IsErrorTexture)
---@return boolean # Whether the texture is the error texture or not.
function ITexture:IsErrorTexture() end

---[SHARED AND MENU] Returns the modified width of the texture, this value may be affected by mipmapping and other factors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ITexture:Width)
---@return number # width
function ITexture:Width() end
