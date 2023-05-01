---@meta

---@class Stack
local Stack = {}

---[SHARED AND MENU] Pop an item from the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Pop)
---@param amount number Amount of items you want to pop.
---@return number New length of the stack.
function Stack:Pop(amount) end

---[SHARED AND MENU] Pop an item from the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:PopMulti)
---@param amount number Amount of items you want to pop.
---@return table The Popped Items.
function Stack:PopMulti(amount) end

---[SHARED AND MENU] Push an item onto the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Push)
---@param object any The item you want to push
function Stack:Push(object) end

---[SHARED AND MENU] Returns the size of the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Size)
---@return number The size of the stack
function Stack:Size() end

---[SHARED AND MENU] Get the item at the top of the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Top)
---@return any The item at the top of the stack
function Stack:Top() end

