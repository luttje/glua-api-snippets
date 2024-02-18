---@meta

---
--- 		An image button.
---
--- 		This panel inherits all methods of DButton, such as DLabel:DoClick.
--- 	The DImageButton is the same as the DImage, but you can click it. When you hover over it, you will get the default link cursor on Windows.
---@class DImageButton : DButton
local DImageButton = {}

---[CLIENT AND MENU] Used internally to briefly scale the image when clicked.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:DepressImage)
function DImageButton:DepressImage() end

---[CLIENT AND MENU] Returns whether DImageButton:DepressImage is functional or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:GetDepressImage)
---@return boolean # `true` to enable image depressing when clicked.
function DImageButton:GetDepressImage() end

---[CLIENT AND MENU] Returns the "image" of the DImageButton. Equivalent of DImage:GetImage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:GetImage)
---@return string # The path to the image that is loaded.
function DImageButton:GetImage() end

---[CLIENT AND MENU] Returns whether the image inside the button should be stretched to fit it or not
---
--- See DImageButton:SetStretchToFit
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:GetStretchToFit)
---@return boolean #
function DImageButton:GetStretchToFit() end

---[CLIENT AND MENU] Sets the color of the image. Equivalent of DImage:SetImageColor
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetColor)
---@param color table The Global.Color to set
function DImageButton:SetColor(color) end

---[CLIENT AND MENU] Controls whether DImageButton:DepressImage is functional or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetDepressImage)
---@param enable boolean `true` to enable image depressing when clicked.
function DImageButton:SetDepressImage(enable) end

---[CLIENT AND MENU] Alias of DImageButton:SetImage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetIcon)
function DImageButton:SetIcon() end

---[CLIENT AND MENU] Sets the "image" of the DImageButton. Equivalent of DImage:SetImage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetImage)
---@param strImage string The path of the image to load. When no file extension is supplied the VMT file extension is used.
---@param strBackup? string The path of the backup image.
function DImageButton:SetImage(strImage, strBackup) end

---[CLIENT AND MENU] Hides or shows the image of the image button. Internally this calls Panel:SetVisible on the internal DImage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetImageVisible)
---@param visible boolean Set true to make it visible ( default ), or false to hide the image
function DImageButton:SetImageVisible(visible) end

---[CLIENT AND MENU] Sets whether the DImageButton should keep the aspect ratio of its image. Equivalent of DImage:SetKeepAspect.
---
--- Note that this will not try to fit the image inside the button, but instead it will fill the button with the image.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetKeepAspect)
---@param keep boolean true to keep the aspect ratio, false not to
function DImageButton:SetKeepAspect(keep) end

---[CLIENT AND MENU] Sets a Global.Material directly as an image. Equivalent of DImage:SetMaterial.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetMaterial)
---@param mat IMaterial The material to set
function DImageButton:SetMaterial(mat) end

---[CLIENT AND MENU] See DImage:SetOnViewMaterial
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetOnViewMaterial)
---@param mat string
---@param backup string
function DImageButton:SetOnViewMaterial(mat, backup) end

---[CLIENT AND MENU] Sets whether the image inside the DImageButton should be stretched to fill the entire size of the button, without preserving aspect ratio.
---
--- If set to false, the image will not be resized at all.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DImageButton:SetStretchToFit)
---@param stretch boolean True to stretch, false to not to stretch
function DImageButton:SetStretchToFit(stretch) end
