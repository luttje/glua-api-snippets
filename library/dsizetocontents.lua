---@meta

--- A helper panel that will automatically resize itself to fit all its children using [Panel:SizeToChildren](https://wiki.facepunch.com/gmod/Panel:SizeToChildren).
---@class DSizeToContents : Panel
local DSizeToContents = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents horizontally.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSizeToContents:GetSizeX)
---@return boolean # Whether the panel should size to contents horizontally.
function DSizeToContents:GetSizeX() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents vertically.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSizeToContents:GetSizeY)
---@return boolean # Whether the panel should size to contents vertically.
function DSizeToContents:GetSizeY() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents horizontally. This is `true` by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSizeToContents:SetSizeX)
---@param sizeX boolean Whether the panel should size to contents horizontally.
function DSizeToContents:SetSizeX(sizeX) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the [DSizeToContents](https://wiki.facepunch.com/gmod/DSizeToContents) panel should size to contents vertically. This is `true` by default.
---
---[View wiki](https://wiki.facepunch.com/gmod/DSizeToContents:SetSizeY)
---@param sizeY boolean Whether the panel should size to contents vertically.
function DSizeToContents:SetSizeY(sizeY) end
