---@meta

---[CLIENT AND MENU] Returns whether the DSizeToContents panel should size to contents vertically.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSizeToContents:GetSizeY)
---@return number # Whether the panel should size to contents vertically.
function DSizeToContents:GetSizeY() end

---[CLIENT AND MENU] Returns whether the DSizeToContents panel should size to contents horizontally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSizeToContents:GetSizeX)
---@return number # Whether the panel should size to contents horizontally.
function DSizeToContents:GetSizeX() end

---[CLIENT AND MENU] Sets whether the DSizeToContents panel should size to contents vertically. This is `true` by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSizeToContents:SetSizeY)
---@param number number Whether the panel should size to contents vertically.
function DSizeToContents:SetSizeY(number) end

---@class DSizeToContents : Panel
local DSizeToContents = {}

---[CLIENT AND MENU] Sets whether the DSizeToContents panel should size to contents horizontally. This is `true` by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DSizeToContents:SetSizeX)
---@param number number Whether the panel should size to contents horizontally.
function DSizeToContents:SetSizeX(number) end
