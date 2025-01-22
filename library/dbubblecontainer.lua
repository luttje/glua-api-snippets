---@meta

--- A transparent gray speech bubble panel made up of a rounded box and point coming from the bottom.
---@class DBubbleContainer : DPanel
local DBubbleContainer = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns Background Color, See [DBubbleContainer:SetBackgroundColor](https://wiki.facepunch.com/gmod/DBubbleContainer:SetBackgroundColor)
---
---[View wiki](https://wiki.facepunch.com/gmod/DBubbleContainer:GetBackgroundColor)
function DBubbleContainer:GetBackgroundColor() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the speech bubble position and size along with the dialog point position.
---
---[View wiki](https://wiki.facepunch.com/gmod/DBubbleContainer:OpenForPos)
---@param x number The x position of the dialog point. If this is set to a value greater than half of the set width, the entire bubble container will be moved in addition to the dialog point.
---@param y number The y position of the bubble container. Has no effect unless set to a value greater than the set height + 64 pixels.
---@param w number The width of the bubble container.
---@param h number The height of the bubble container.
function DBubbleContainer:OpenForPos(x, y, w, h) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets Background Color, See Also [DBubbleContainer:GetBackgroundColor](https://wiki.facepunch.com/gmod/DBubbleContainer:GetBackgroundColor)
---
---[View wiki](https://wiki.facepunch.com/gmod/DBubbleContainer:SetBackgroundColor)
---@param color Color The New Color
function DBubbleContainer:SetBackgroundColor(color) end
