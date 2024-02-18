---@meta

---
--- 		DImage is an advanced, more robust version of the Material panel.
---
--- 		See DImageButton for a click-able version of this panel.
--- 	Creates a DImage of Dr. Breen inside a DFrame panel.Creates three DImage panels and arranges them into a new image.
---@class DImage : DPanel
local DImage = {}

---[CLIENT AND MENU] Actually loads the IMaterial to render it. Called from DImage:LoadMaterial.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:DoLoadMaterial)
function DImage:DoLoadMaterial() end

---[CLIENT AND MENU] "Fixes" the current material of the DImage if it has VertexLit shader by creating a new one with the same name and a prefix of "_DImage" and automatically calling DImage:SetMaterial with the new material.
---
--- This fixes the problem where using materials using shaders that expect lighting information causing "weird" flickering when displayed in 2D/Unlit environment.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:FixVertexLitMaterial)
function DImage:FixVertexLitMaterial() end

---[CLIENT AND MENU] Returns the texture path set by DImage:SetFailsafeMatName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:GetFailsafeMatName)
---@return string #
function DImage:GetFailsafeMatName() end

---[CLIENT AND MENU] Returns the image loaded in the image panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:GetImage)
---@return string # The path to the image that is loaded.
function DImage:GetImage() end

---[CLIENT AND MENU] Returns the color override of the image panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:GetImageColor)
---@return table # The color override of the image. Uses the Color.
function DImage:GetImageColor() end

---[CLIENT AND MENU] Returns whether the DImage should keep the aspect ratio of its image when being resized.
---
--- See DImage:SetKeepAspect for more info on how it works.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:GetKeepAspect)
---@return boolean # Whether the DImage should keep the aspect ratio of its image when being resized.
function DImage:GetKeepAspect() end

---[CLIENT AND MENU] Returns the current Global.Material of the DImage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:GetMaterial)
---@return IMaterial #
function DImage:GetMaterial() end

---[CLIENT AND MENU] Returns the texture path set by DImage:SetMatName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:GetMatName)
---@return string #
function DImage:GetMatName() end

---[CLIENT AND MENU] Initializes the loading process of the material to render if it is not loaded yet.
---
--- You do not need to call this function. It is done for you automatically.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:LoadMaterial)
function DImage:LoadMaterial() end

---[CLIENT AND MENU] Paints a ghost copy of the DImage panel at the given position and dimensions. This function overrides Panel:PaintAt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:PaintAt)
---@param posX number The x coordinate to draw the panel from.
---@param posY number The y coordinate to draw the panel from.
---@param width number The width of the panel image to be drawn.
---@param height number The height of the panel image to be drawn.
function DImage:PaintAt(posX, posY, width, height) end

---[CLIENT AND MENU] Sets the backup material to be loaded when the image is first rendered. Used by DImage:SetOnViewMaterial.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:SetFailsafeMatName)
---@param backupMat string
function DImage:SetFailsafeMatName(backupMat) end

---[CLIENT AND MENU] Sets the image to load into the frame. If the first image can't be loaded and `strBackup` is set, that image will be loaded instead.
---
--- This eventually calls DImage:SetMaterial.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:SetImage)
---@param strImage string The path of the image to load. When no file extension is supplied the VMT file extension is used.
---@param strBackup? string The path of the backup image.
function DImage:SetImage(strImage, strBackup) end

---[CLIENT AND MENU] Sets the image's color override.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:SetImageColor)
---@param col table The color override of the image. Uses the Color.
function DImage:SetImageColor(col) end

---[CLIENT AND MENU] Sets whether the DImage should keep the aspect ratio of its image when being resized.
---
--- Note that this will not try to fit the image inside the button, but instead it will fill the button with the image.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:SetKeepAspect)
---@param keep boolean true to keep the aspect ratio, false not to
function DImage:SetKeepAspect(keep) end

---[CLIENT AND MENU] Sets a Global.Material directly as an image.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:SetMaterial)
---@param mat IMaterial The material to set
function DImage:SetMaterial(mat) end

---[CLIENT AND MENU] Sets the material to be loaded when the image is first rendered. Used by DImage:SetOnViewMaterial.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:SetMatName)
---@param mat string
function DImage:SetMatName(mat) end

---[CLIENT AND MENU] Similar to DImage:SetImage, but will only do the expensive part of actually loading the textures/material if the material is about to be rendered/viewed.
---
--- Useful for cases like DIconBrowser, where there are hundreds of small icons in 1 panel in a list that do not need all to be loaded at the same time.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial)
---@param mat string
---@param backupMat string
function DImage:SetOnViewMaterial(mat, backupMat) end

---[CLIENT AND MENU] Returns true if the image is **not** yet loaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImage:Unloaded)
---@return boolean #
function DImage:Unloaded() end
