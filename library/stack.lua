---@meta

--- An object returned by [util.Stack](https://wiki.facepunch.com/gmod/util.Stack).
---
--- Like a Lua table, a Stack is a container. It follows the principle of LIFO (last in, first out).
---
--- The Stack works like a stack of papers: the first page you put down (push) will be the last one you remove (pop). That also means that the last page you put down, will be the first to be removed.
---
---[View wiki](https://wiki.facepunch.com/gmod/Stack)
---@class Stack
local Stack = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Pop an item from the stack
---
---[View wiki](https://wiki.facepunch.com/gmod/Stack:Pop)
---@param amount? number Amount of items you want to pop.
---@return any # Latest popped item.
function Stack:Pop(amount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Pop an item from the stack
---
---[View wiki](https://wiki.facepunch.com/gmod/Stack:PopMulti)
---@param amount? number Amount of items you want to pop.
---@return table # The Popped Items.
function Stack:PopMulti(amount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Push an item onto the stack
---
---[View wiki](https://wiki.facepunch.com/gmod/Stack:Push)
---@param object any The item you want to push
function Stack:Push(object) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the size of the stack
---
---[View wiki](https://wiki.facepunch.com/gmod/Stack:Size)
---@return number # The size of the stack
function Stack:Size() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Get the item at the top of the stack
---
---[View wiki](https://wiki.facepunch.com/gmod/Stack:Top)
---@return any # The item at the top of the stack
function Stack:Top() end
