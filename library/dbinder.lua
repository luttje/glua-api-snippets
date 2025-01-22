---@meta

--- Input which can bind a command to a key. Used for binding inputs and outputs of TOOLs.
---@class DBinder : DButton
local DBinder = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets the code of the key currently bound by the DBinder. Same as [DBinder:GetValue](https://wiki.facepunch.com/gmod/DBinder:GetValue). An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DBinder:GetSelectedNumber)
---@return number # The key code of the bound key. See Enums/KEY.
function DBinder:GetSelectedNumber() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets the code of the key currently bound by the DBinder. Same as [DBinder:GetSelectedNumber](https://wiki.facepunch.com/gmod/DBinder:GetSelectedNumber).
---
---[View wiki](https://wiki.facepunch.com/gmod/DBinder:GetValue)
---@return number # The key code of the bound key. See Enums/KEY.
function DBinder:GetValue() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the current key bound by the [DBinder](https://wiki.facepunch.com/gmod/DBinder), and updates the button's text as well as the [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
---[View wiki](https://wiki.facepunch.com/gmod/DBinder:SetSelectedNumber)
---@param keyCode number The key code of the key to bind. See Enums/KEY.
function DBinder:SetSelectedNumber(keyCode) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Alias of [DBinder:SetSelectedNumber](https://wiki.facepunch.com/gmod/DBinder:SetSelectedNumber).
---
---[View wiki](https://wiki.facepunch.com/gmod/DBinder:SetValue)
---@param keyCode number The key code of the key to bind. See Enums/KEY.
function DBinder:SetValue(keyCode) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used to set the text of the DBinder to the current key binding, or `NONE`.
---
---[View wiki](https://wiki.facepunch.com/gmod/DBinder:UpdateText)
function DBinder:UpdateText() end
