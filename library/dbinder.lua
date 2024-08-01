---@meta

--- Input which can bind a command to a key. Used for binding inputs and outputs of TOOLs.
---@class DBinder : DButton
local DBinder = {}

---[CLIENT] Gets the code of the key currently bound by the DBinder. Same as [DBinder:GetValue](https://wiki.facepunch.com/gmod/DBinder:GetValue). An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DBinder:GetSelectedNumber)
---@return number # The key code of the bound key. See Enums/KEY.
function DBinder:GetSelectedNumber() end

---[CLIENT] Gets the code of the key currently bound by the DBinder. Same as [DBinder:GetSelectedNumber](https://wiki.facepunch.com/gmod/DBinder:GetSelectedNumber).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DBinder:GetValue)
---@return number # The key code of the bound key. See Enums/KEY.
function DBinder:GetValue() end

---[CLIENT] Sets the current key bound by the [DBinder](https://wiki.facepunch.com/gmod/DBinder), and updates the button's text as well as the [ConVar](https://wiki.facepunch.com/gmod/ConVar).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DBinder:SetSelectedNumber)
---@param keyCode number The key code of the key to bind. See Enums/KEY.
function DBinder:SetSelectedNumber(keyCode) end

---[CLIENT] Alias of [DBinder:SetSelectedNumber](https://wiki.facepunch.com/gmod/DBinder:SetSelectedNumber).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DBinder:SetValue)
---@param keyCode number The key code of the key to bind. See Enums/KEY.
function DBinder:SetValue(keyCode) end

---[CLIENT] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used to set the text of the DBinder to the current key binding, or `NONE`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DBinder:UpdateText)
function DBinder:UpdateText() end
