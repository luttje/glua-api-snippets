---@meta

--- A simple Derma Drawer
---@class DDrawer : Panel
local DDrawer = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Closes the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---
---[View wiki](https://wiki.facepunch.com/gmod/DDrawer:Close)
function DDrawer:Close() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the Open Size of DDrawer.
---
---[View wiki](https://wiki.facepunch.com/gmod/DDrawer:GetOpenSize)
---@return number # Open size.
function DDrawer:GetOpenSize() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that returns the Open Time of DDrawer.
---
---[View wiki](https://wiki.facepunch.com/gmod/DDrawer:GetOpenTime)
---@return number # Time in seconds.
function DDrawer:GetOpenTime() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Opens the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---
---[View wiki](https://wiki.facepunch.com/gmod/DDrawer:Open)
function DDrawer:Open() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the height of DDrawer
---
---[View wiki](https://wiki.facepunch.com/gmod/DDrawer:SetOpenSize)
---@param Value number Height of DDrawer. Default is `100`.
function DDrawer:SetOpenSize(Value) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that sets the time (in seconds) for DDrawer to open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DDrawer:SetOpenTime)
---@param value number Length in seconds. Default is 0.3
function DDrawer:SetOpenTime(value) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Toggles the [DDrawer](https://wiki.facepunch.com/gmod/DDrawer).
---
---[View wiki](https://wiki.facepunch.com/gmod/DDrawer:Toggle)
function DDrawer:Toggle() end
