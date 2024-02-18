---@meta

--- The list library allows you add and retrieve values to and from lists. The list library is basically a fancy wrapper for a table, but with much more limited functionality. See Default Lists for a page of default Sandbox lists.
list = {}

---[SHARED AND MENU] Adds an item to a named list
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/list.Add)
---@param identifier string The list identifier
---@param item any The item to add to the list
---@return number # The index at which the item was added.
function list.Add(identifier, item) end

---[SHARED AND MENU] Returns true if the list contains the value. (as a value - not a key)
---
--- For a function that looks for a key and not a value see list.HasEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/list.Contains)
---@param list string List to search through
---@param value any The value to test
---@return boolean # Returns true if the list contains the value, false otherwise
function list.Contains(list, value) end

---[SHARED AND MENU] Returns a copy of the list stored at identifier
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/list.Get)
---@param identifier string The list identifier
---@return table # The copy of the list
function list.Get(identifier) end

---[SHARED AND MENU] Returns the actual table of the list stored at identifier. Modifying this will affect the stored list
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/list.GetForEdit)
---@param identifier string The list identifier
---@param dontCreate? boolean If the list at given identifier does not exist, do **not** create it.
---@return table # The actual list
function list.GetForEdit(identifier, dontCreate) end

---[SHARED AND MENU] Returns a list of all lists currently in use.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/list.GetTable)
---@return table # The list of all lists, i.e. a table containing names of all lists.
function list.GetTable() end

---[SHARED AND MENU] Returns true if the list contains the given key.
---
--- For a function that looks for values and not keys see list.Contains.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/list.HasEntry)
---@param list string List to search through
---@param key any The key to test
---@return boolean # Returns true if the list contains the key, false otherwise
function list.HasEntry(list, key) end

---[SHARED AND MENU] Sets a specific position in the named list to a value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/list.Set)
---@param identifier string The list identifier
---@param key any The key in the list to set
---@param item any The item to set to the list as key
function list.Set(identifier, key, item) end
