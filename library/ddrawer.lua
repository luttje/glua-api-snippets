---@meta

--- A simple Derma Drawer
---@class DDrawer : Panel
local DDrawer = {}

---[CLIENT AND MENU] Closes the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:Close)
function DDrawer:Close() end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the Open Size of DDrawer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:GetOpenSize)
---@return number # Open size.
function DDrawer:GetOpenSize() end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the Open Time of DDrawer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:GetOpenTime)
---@return number # Time in seconds.
function DDrawer:GetOpenTime() end

---[CLIENT AND MENU] Opens the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:Open)
function DDrawer:Open() end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the height of DDrawer
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:SetOpenSize)
---@param Value number Height of DDrawer. Default is `100`.
function DDrawer:SetOpenSize(Value) end

---[CLIENT AND MENU] An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the time (in seconds) for DDrawer to open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:SetOpenTime)
---@param value number Length in seconds. Default is 0.3
function DDrawer:SetOpenTime(value) end

---[CLIENT AND MENU] Toggles the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DDrawer:Toggle)
function DDrawer:Toggle() end
