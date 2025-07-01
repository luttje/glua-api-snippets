---@meta

--- The list library allows you add and retrieve values to and from lists. The list library is basically a fancy wrapper for a table, but with much more limited functionality.
---
--- It is used extensively in the built-in Sandbox gamemode for addon-extensible lists of things (list of wheel models, list of thruster effects, etc) , without using global tables for this task.
---
--- See [Default Lists](https://wiki.facepunch.com/gmod/Default_Lists) for a page of default Sandbox lists.
list = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Adds an item to a named list
---
---[View wiki](https://wiki.facepunch.com/gmod/list.Add)
---@param identifier string The list identifier
---@param item any The item to add to the list
---@return number # The index at which the item was added.
function list.Add(identifier, item) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns true if the list contains the value. (as a value - not a key)
---
--- For a function that looks for a key and not a value see [list.HasEntry](https://wiki.facepunch.com/gmod/list.HasEntry).
---
---[View wiki](https://wiki.facepunch.com/gmod/list.Contains)
---@param list string List to search through
---@param value any The value to test
---@return boolean # Returns true if the list contains the value, false otherwise
function list.Contains(list, value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a copy of the list stored at identifier
--- 	**WARNING**: This function uses [table.Copy](https://wiki.facepunch.com/gmod/table.Copy) which can be very slow for larger lists. You should avoid calling it repeatedly or in performance sensitive hooks such as [GM:Think](https://wiki.facepunch.com/gmod/GM:Think).
---
--- 	Where possible you should use the much faster helper functions:
--- 	  [list.Contains](https://wiki.facepunch.com/gmod/list.Contains),
--- 	  [list.HasEntry](https://wiki.facepunch.com/gmod/list.HasEntry), or
--- 	  [list.GetEntry](https://wiki.facepunch.com/gmod/list.GetEntry)
---
--- 	There is also the more dangerous option of calling [list.GetForEdit](https://wiki.facepunch.com/gmod/list.GetForEdit) to get the unprotected list if you absolutely must iterate through it in a think hook.
---
---[View wiki](https://wiki.facepunch.com/gmod/list.Get)
---@param identifier string The list identifier
---@return table # The copy of the list
function list.Get(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a copy of the entry in the list `list` with key `key`.
---
---[View wiki](https://wiki.facepunch.com/gmod/list.GetEntry)
---@param list string List to search through
---@param key string The key to search for
---@return any|nil # Returns the  value if the list contains the key, nil otherwise
function list.GetEntry(list, key) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the actual table of the list stored at identifier. Modifying this will affect the stored list
---
---[View wiki](https://wiki.facepunch.com/gmod/list.GetForEdit)
---@param identifier string The list identifier
---@param dontCreate? boolean If the list at given identifier does not exist, do **not** create it.
---@return table # The actual list
function list.GetForEdit(identifier, dontCreate) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns a list of all lists currently in use.
---
---[View wiki](https://wiki.facepunch.com/gmod/list.GetTable)
---@return table # The list of all lists, i.e. a table containing names of all lists.
function list.GetTable() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns true if the list contains the given key.
---
--- For a function that looks for values and not keys see [list.Contains](https://wiki.facepunch.com/gmod/list.Contains).
---
---[View wiki](https://wiki.facepunch.com/gmod/list.HasEntry)
---@param list string List to search through
---@param key any The key to test
---@return boolean # Returns true if the list contains the key, false otherwise
function list.HasEntry(list, key) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Removes a single entry from the list `list` with key `key`.
---
--- This is equivalent to `list.Set( myList, myKey, nil )`.
---
---[View wiki](https://wiki.facepunch.com/gmod/list.RemoveEntry)
---@param list string List to remove an entry in.
---@param key string The key for the entry to remove.
function list.RemoveEntry(list, key) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Sets a specific position in the named list to a value.
---
---[View wiki](https://wiki.facepunch.com/gmod/list.Set)
---@param identifier string The list identifier
---@param key any The key in the list to set
---@param item any The item to set to the list as key
function list.Set(identifier, key, item) end
