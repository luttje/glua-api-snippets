---@meta

--- [DImage](https://wiki.facepunch.com/gmod/DImage) is an advanced, more robust version of the [Material](https://wiki.facepunch.com/gmod/Material) panel.
---
--- See [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) for a click-able version of this panel.
---@class DImage : DPanel
local DImage = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Actually loads the [IMaterial](https://wiki.facepunch.com/gmod/IMaterial) to render it. Called from [DImage:LoadMaterial](https://wiki.facepunch.com/gmod/DImage:LoadMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:DoLoadMaterial)
function DImage:DoLoadMaterial() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- "Fixes" the current material of the [DImage](https://wiki.facepunch.com/gmod/DImage) if it has VertexLit shader by creating a new one with the same name and a prefix of "_DImage" and automatically calling [DImage:SetMaterial](https://wiki.facepunch.com/gmod/DImage:SetMaterial) with the new material.
---
--- This fixes the problem where using materials using shaders that expect lighting information causing "weird" flickering when displayed in 2D/Unlit environment.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:FixVertexLitMaterial)
function DImage:FixVertexLitMaterial() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the texture path set by [DImage:SetFailsafeMatName](https://wiki.facepunch.com/gmod/DImage:SetFailsafeMatName).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:GetFailsafeMatName)
---@return string #
function DImage:GetFailsafeMatName() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the image loaded in the image panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:GetImage)
---@return string # The path to the image that is loaded.
function DImage:GetImage() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the color override of the image panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:GetImageColor)
---@return table # The color override of the image. Uses the Color.
function DImage:GetImageColor() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DImage](https://wiki.facepunch.com/gmod/DImage) should keep the aspect ratio of its image when being resized.
---
--- See [DImage:SetKeepAspect](https://wiki.facepunch.com/gmod/DImage:SetKeepAspect) for more info on how it works.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:GetKeepAspect)
---@return boolean # Whether the DImage should keep the aspect ratio of its image when being resized.
function DImage:GetKeepAspect() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the current [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) of the [DImage](https://wiki.facepunch.com/gmod/DImage).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:GetMaterial)
---@return IMaterial #
function DImage:GetMaterial() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Returns the texture path set by [DImage:SetMatName](https://wiki.facepunch.com/gmod/DImage:SetMatName).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:GetMatName)
---@return string #
function DImage:GetMatName() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Initializes the loading process of the material to render if it is not loaded yet.
---
--- You do not need to call this function. It is done for you automatically.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:LoadMaterial)
function DImage:LoadMaterial() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Paints a ghost copy of the DImage panel at the given position and dimensions. This function overrides [Panel:PaintAt](https://wiki.facepunch.com/gmod/Panel:PaintAt).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:PaintAt)
---@param posX number The x coordinate to draw the panel from.
---@param posY number The y coordinate to draw the panel from.
---@param width number The width of the panel image to be drawn.
---@param height number The height of the panel image to be drawn.
function DImage:PaintAt(posX, posY, width, height) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the backup material to be loaded when the image is first rendered. Used by [DImage:SetOnViewMaterial](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:SetFailsafeMatName)
---@param backupMat string
function DImage:SetFailsafeMatName(backupMat) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the image to load into the frame. If the first image can't be loaded and `strBackup` is set, that image will be loaded instead.
---
--- This eventually calls [DImage:SetMaterial](https://wiki.facepunch.com/gmod/DImage:SetMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:SetImage)
---@param strImage string The path of the image to load. When no file extension is supplied the VMT file extension is used.
---@param strBackup? string The path of the backup image.
function DImage:SetImage(strImage, strBackup) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the image's color override.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:SetImageColor)
---@param col table The color override of the image. Uses the Color.
function DImage:SetImageColor(col) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the [DImage](https://wiki.facepunch.com/gmod/DImage) should keep the aspect ratio of its image when being resized.
---
--- Note that this will not try to fit the image inside the button, but instead it will fill the button with the image.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:SetKeepAspect)
---@param keep boolean true to keep the aspect ratio, false not to
function DImage:SetKeepAspect(keep) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets a [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) directly as an image.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:SetMaterial)
---@param mat IMaterial The material to set
function DImage:SetMaterial(mat) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets the material to be loaded when the image is first rendered. Used by [DImage:SetOnViewMaterial](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:SetMatName)
---@param mat string
function DImage:SetMatName(mat) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Similar to [DImage:SetImage](https://wiki.facepunch.com/gmod/DImage:SetImage), but will only do the expensive part of actually loading the textures/material if the material is about to be rendered/viewed.
---
--- Useful for cases like [DIconBrowser](https://wiki.facepunch.com/gmod/DIconBrowser), where there are hundreds of small icons in 1 panel in a list that do not need all to be loaded at the same time.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial)
---@param mat string
---@param backupMat string
function DImage:SetOnViewMaterial(mat, backupMat) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns true if the image is **not** yet loaded.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImage:Unloaded)
---@return boolean #
function DImage:Unloaded() end
