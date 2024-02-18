---@meta

--- An object returned by util.Stack.
---
--- Like a Lua table, a Stack is a container. It follows the principle of LIFO (last in, first out).
---
--- The Stack works like a stack of papers: the first page you put down (push) will be the last one you remove (pop). That also means that the last page you put down, will be the first to be removed.
---@class Stack
local Stack = {}

---[SHARED AND MENU] Pop an item from the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Pop)
---@param amount? number Amount of items you want to pop.
---@return number # New length of the stack.
function Stack:Pop(amount) end

---[SHARED AND MENU] Pop an item from the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:PopMulti)
---@param amount? number Amount of items you want to pop.
---@return table # The Popped Items.
function Stack:PopMulti(amount) end

---[SHARED AND MENU] Push an item onto the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Push)
---@param object any The item you want to push
function Stack:Push(object) end

---[SHARED AND MENU] Returns the size of the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Size)
---@return number # The size of the stack
function Stack:Size() end

---[SHARED AND MENU] Get the item at the top of the stack
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Stack:Top)
---@return any # The item at the top of the stack
function Stack:Top() end
