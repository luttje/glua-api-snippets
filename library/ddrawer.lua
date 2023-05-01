---@meta

---@class DDrawer
local DDrawer = {}

---[CLIENT] Closes the DDrawer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:Close)
function DDrawer:Close() end

---[CLIENT] Return the Open Size of DDrawer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:GetOpenSize)
---@return number Open size.
function DDrawer:GetOpenSize() end

---[CLIENT] Return the Open Time of DDrawer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:GetOpenTime)
---@return number Time in seconds.
function DDrawer:GetOpenTime() end

---[CLIENT] Opens the DDrawer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:Open)
function DDrawer:Open() end

---[CLIENT] Set the height of DDrawer
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:SetOpenSize)
---@param Value number Height of DDrawer. Default is 100.
function DDrawer:SetOpenSize(Value) end

---[CLIENT] Set the time (in seconds) for DDrawer to open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:SetOpenTime)
---@param value number Length in seconds. Default is 0.3
function DDrawer:SetOpenTime(value) end

---[CLIENT] Toggles the DDrawer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:Toggle)
function DDrawer:Toggle() end

