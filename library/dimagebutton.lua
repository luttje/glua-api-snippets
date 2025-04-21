---@meta

--- An image button.
---
--- This panel inherits all methods of [DButton](https://wiki.facepunch.com/gmod/DButton), such as [DLabel:DoClick](https://wiki.facepunch.com/gmod/DLabel:DoClick).
---@class DImageButton : DButton
local DImageButton = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to briefly scale the image when clicked.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:DepressImage)
function DImageButton:DepressImage() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether [DImageButton:DepressImage](https://wiki.facepunch.com/gmod/DImageButton:DepressImage) is functional or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:GetDepressImage)
---@return boolean # `true` to enable image depressing when clicked.
function DImageButton:GetDepressImage() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the "image" of the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton). Equivalent of [DImage:GetImage](https://wiki.facepunch.com/gmod/DImage:GetImage).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:GetImage)
---@return string # The path to the image that is loaded.
function DImageButton:GetImage() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the image inside the button should be stretched to fit it or not
---
--- See [DImageButton:SetStretchToFit](https://wiki.facepunch.com/gmod/DImageButton:SetStretchToFit)
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:GetStretchToFit)
---@return boolean #
function DImageButton:GetStretchToFit() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color of the image. Equivalent of [DImage:SetImageColor](https://wiki.facepunch.com/gmod/DImage:SetImageColor)
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetColor)
---@param color table The Global.Color to set
function DImageButton:SetColor(color) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Controls whether [DImageButton:DepressImage](https://wiki.facepunch.com/gmod/DImageButton:DepressImage) is functional or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetDepressImage)
---@param enable boolean `true` to enable image depressing when clicked.
function DImageButton:SetDepressImage(enable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Alias of [DImageButton:SetImage](https://wiki.facepunch.com/gmod/DImageButton:SetImage).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetIcon)
function DImageButton:SetIcon() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the "image" of the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton). Equivalent of [DImage:SetImage](https://wiki.facepunch.com/gmod/DImage:SetImage).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetImage)
---@param strImage string The path of the image to load. When no file extension is supplied the VMT file extension is used.
---@param strBackup? string The path of the backup image.
function DImageButton:SetImage(strImage, strBackup) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Hides or shows the image of the image button. Internally this calls [Panel:SetVisible](https://wiki.facepunch.com/gmod/Panel:SetVisible) on the internal [DImage](https://wiki.facepunch.com/gmod/DImage).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetImageVisible)
---@param visible boolean Set true to make it visible ( default ), or false to hide the image
function DImageButton:SetImageVisible(visible) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) should keep the aspect ratio of its image. Equivalent of [DImage:SetKeepAspect](https://wiki.facepunch.com/gmod/DImage:SetKeepAspect).
---
--- Note that this will not try to fit the image inside the button, but instead it will fill the button with the image.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetKeepAspect)
---@param keep boolean true to keep the aspect ratio, false not to
function DImageButton:SetKeepAspect(keep) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets a [Global.Material](https://wiki.facepunch.com/gmod/Global.Material) directly as an image. Equivalent of [DImage:SetMaterial](https://wiki.facepunch.com/gmod/DImage:SetMaterial).
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetMaterial)
---@param mat IMaterial The material to set
function DImageButton:SetMaterial(mat) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) See [DImage:SetOnViewMaterial](https://wiki.facepunch.com/gmod/DImage:SetOnViewMaterial)
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetOnViewMaterial)
---@param mat string
---@param backup string
function DImageButton:SetOnViewMaterial(mat, backup) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the image inside the [DImageButton](https://wiki.facepunch.com/gmod/DImageButton) should be stretched to fill the entire size of the button, without preserving aspect ratio.
---
--- If set to false, the image will not be resized at all.
---
---[View wiki](https://wiki.facepunch.com/gmod/DImageButton:SetStretchToFit)
---@param stretch boolean True to stretch, false to not to stretch
function DImageButton:SetStretchToFit(stretch) end
