---@meta

--- The table `type` is an object that can store multiple values.
---
--- The table `library` is a standard Lua library which provides functions to manipulate tables. In Garry's Mod there are several extra useful functions added to this library.
---
--- This category lists the functions available in the table `library`.
table = {}

---[SHARED AND MENU] Adds all values from `source` table into the `target` table. This is most useful for sequential tables, not "dictionary" or "map" tables. See table.Merge if you want to merge 2 tables into one.
---
--- See table.insert for a function that adds a single value, and table.Inherit for a function that inherits keys from one table to another.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Add)
---@param target table The table to insert the new values into.
---@param source table The table to retrieve the values from.
---@return table # The target table.
function table.Add(target, source) end

---[SHARED AND MENU] Changes all keys to sequential integers. This creates a new table object and does not affect the original.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.ClearKeys)
---@param table table The original table to modify.
---@param saveKeys? boolean Save the keys within each member table. This will insert a new field `__key` into each value, and should not be used if the table contains non-table values.
---@return table # Table with integer keys.
function table.ClearKeys(table, saveKeys) end

---[SHARED AND MENU] Collapses a table with keyvalue structure
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.CollapseKeyValue)
---@param input table Input table
---@return table # Output table
function table.CollapseKeyValue(input) end

---[SHARED AND MENU] Concatenates the contents of a table to a string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.concat)
---@param tbl table The table to concatenate.
---@param concatenator? string A separator to insert between strings
---@param startPos? number The key to start at
---@param endPos? number The key to end at
---@return string # Concatenated values
function table.concat(tbl, concatenator, startPos, endPos) end

---[SHARED AND MENU] Creates a deep copy and returns that copy.
---
--- This function does NOT copy userdata, such as Vectors and Angles!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Copy)
---@param originalTable table The table to be copied.
---@return table # A deep copy of the original table
function table.Copy(originalTable) end

---[SHARED AND MENU] Empties the target table, and merges all values from the source table into it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.CopyFromTo)
---@param source table The table to copy from.
---@param target table The table to write to.
function table.CopyFromTo(source, target) end

---[SHARED AND MENU] Counts the amount of keys in a table. This should only be used when a table is not numerically and sequentially indexed. For those tables, consider the length (**#**) operator.
---
--- If you only want to test if the table is empty or not, use table.IsEmpty instead as it is a lot faster.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Count)
---@param tbl table The table to count the keys of.
---@return number # The number of keyvalue pairs. This includes non-numeric and non-sequential keys, unlike the length (**#**) operator.
function table.Count(tbl) end

---[SHARED AND MENU] Converts a table that has been sanitised with table.Sanitise back to its original form
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.DeSanitise)
---@param tbl table Table to be de-sanitised
---@return table # De-sanitised table
function table.DeSanitise(tbl) end

---[SHARED AND MENU] Removes all values from a table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Empty)
---@param tbl table The table to empty.
function table.Empty(tbl) end

---[SHARED AND MENU] Returns the value positioned after the supplied value in a table. If it isn't found then the first element in the table is returned
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.FindNext)
---@param tbl table Table to search
---@param value any Value to return element after
---@return any # Found element
---@deprecated Instead, iterate the table using ipairs or increment from the previous index using Global.next. Non-numerically indexed tables are not ordered.
function table.FindNext(tbl, value) end

---[SHARED AND MENU] Returns the value positioned before the supplied value in a table. If it isn't found then the last element in the table is returned
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.FindPrev)
---@param tbl table Table to search
---@param value any Value to return element before
---@return any # Found element
---@deprecated Instead, iterate your table with ipairs, storing the previous value and checking for the target. Non-numerically indexed tables are not ordered.
function table.FindPrev(tbl, value) end

---[SHARED AND MENU] Flips key-value pairs of each element within a table, so that each value becomes the key, and each key becomes the value.
---
--- Take care when using this function, as a Lua table cannot contain multiple instances of the same key. As such, data loss is possible when using this function on tables with duplicate values.
---
--- ```
--- local test = { test = 1, test2 = 1 }
--- local f = table.Flip( test )
--- PrintTable( f )
--- -- Outputs "1	=	test2"
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Flip)
---@param input table The table to flip items of.
---@return table # The flipped table.
function table.Flip(input) end

---[SHARED AND MENU] Inserts a value in to the given table even if the table is non-existent
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.ForceInsert)
---@param tab? table Table to insert value in to
---@param value any Value to insert
---@return table # The supplied or created table
function table.ForceInsert(tab, value) end

---[SHARED AND MENU] Iterates for each key-value pair in the table, calling the function with the key and value of the pair. If the function returns anything, the loop is broken.
---
--- The GLua interpretation of this is table.ForEach.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.foreach)
---@param tbl table The table to iterate over.
---@param callback function The function to run for each key and value.
---@deprecated This was deprecated in Lua 5.1 and removed in 5.2. You should use Global.pairs instead.
function table.foreach(tbl, callback) end

---[SHARED AND MENU] Iterates for each numeric index in the table in order.
---
--- This is inherited from the original Lua implementation and is deprecated in Lua as of 5.1; see [here](http://lua-users.org/wiki/TableLibraryTutorial). You should use Global.ipairs() instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.foreachi)
---@param table table The table to iterate over.
---@param func function The function to run for each index.
---@deprecated This was deprecated in Lua 5.1 and removed in 5.2. You should use Global.ipairs() instead.
function table.foreachi(table, func) end

---[SHARED AND MENU] Returns the first key found in the given table
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.GetFirstKey)
---@param tab table Table to retrieve key from
---@return any # Key
---@deprecated Instead, expect the first key to be 1.  Non-numerically indexed tables are not ordered and do not have a first key.
function table.GetFirstKey(tab) end

---[SHARED AND MENU] Returns the first value found in the given table
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.GetFirstValue)
---@param tab table Table to retrieve value from
---@return any # Value
---@deprecated Instead, index the table with a key of 1.  Non-numerically indexed tables are not ordered and do not have a first key.
function table.GetFirstValue(tab) end

---[SHARED AND MENU] Returns all keys of a table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.GetKeys)
---@param tabl table The table to get keys of
---@return table # Table of keys
function table.GetKeys(tabl) end

---[SHARED AND MENU] Returns the last key found in the given table
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.GetLastKey)
---@param tab table Table to retrieve key from
---@return any # Key
---@deprecated Instead, use the result of the length (#) operator, ensuring it is not zero. Non-numerically indexed tables are not ordered and do not have a last key.
function table.GetLastKey(tab) end

---[SHARED AND MENU] Returns the last value found in the given table
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.GetLastValue)
---@param tab table Table to retrieve value from
---@return any # Value
---@deprecated Instead, index the table with the result of the length (#) operator, ensuring it is not zero. Non-numerically indexed tables are not ordered and do not have a last key.
function table.GetLastValue(tab) end

---[SHARED AND MENU] Returns the length of the table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.getn)
---@param tbl table The table to check.
---@return number # Sequential length.
---@deprecated This function was deprecated in Lua 5.1 and is removed in 5.2. Use the length (#) operator instead.
function table.getn(tbl) end

---[SHARED AND MENU] Returns a key of the supplied table with the highest number value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.GetWinningKey)
---@param inputTable table The table to search in.
---@return any # winningKey
function table.GetWinningKey(inputTable) end

---[SHARED AND MENU] Checks if a table has a value.
--- This function is **very inefficient for large tables** (O(n)) and should probably not be called in things that run each frame. Instead, consider a table structure such as example 2 below. Also see: Tables: Bad Habits
--- For optimization, functions that look for a value by sorting the table should never be needed if you work on a table that you built yourself.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.HasValue)
---@param tbl table Table to check
---@param value any Value to search for
---@return boolean # Returns true if the table has that value, false otherwise
function table.HasValue(tbl, value) end

---[SHARED AND MENU] Copies any missing data from `base` to `target`, and sets the `target`'s `BaseClass` member to the `base` table's pointer.
---
--- See table.Merge, which overrides existing values and doesn't add a BaseClass member.
---
---
--- See also table.Add, which simply adds values of one table to another.
---
--- Sub-tables aren't inherited. The target's table value will take priority.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Inherit)
---@param target table Table to copy data to
---@param base table Table to copy data from
---@return table # Target
function table.Inherit(target, base) end

---[SHARED AND MENU] Inserts a value into a table at the end of the table or at the given position.
--- 	This function does not call the `__newindex` [metamethod](Metamethods).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.insert)
---@param tbl table The table to insert the variable into.
---@param position number The position in the table to insert the variable. If the third argument is nil this argument becomes the value to insert at the end of given table.
---@param value any The variable to insert into the table.
---@return number # The index the object was placed at.
function table.insert(tbl, position, value) end

---[SHARED AND MENU] Returns whether or not the given table is empty.
---
--- This works on both sequential and non-sequential tables, and is a lot faster for non-sequential tables than `table.Count(tbl) == 0`.
--- If you want to check if a table is not empty, use `next(tbl) ~= nil`, as it is slightly faster.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.IsEmpty)
---@param tab table Table to check.
---@return boolean # Is empty?
function table.IsEmpty(tab) end

---[SHARED AND MENU] Returns whether or not the table's keys are sequential
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.IsSequential)
---@param tab table Table to check
---@return boolean # Is sequential
function table.IsSequential(tab) end

---[SHARED AND MENU] Returns the first key found to be containing the supplied value
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.KeyFromValue)
---@param tab table Table to search
---@param value any Value to search for
---@return any # Key
function table.KeyFromValue(tab, value) end

---[SHARED AND MENU] Returns a table of keys containing the supplied value
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.KeysFromValue)
---@param tab table Table to search
---@param value any Value to search for
---@return table # Keys
function table.KeysFromValue(tab, value) end

---[SHARED AND MENU] Returns a copy of the input table with all string keys converted to be lowercase recursively
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.LowerKeyNames)
---@param tbl table Table to convert
---@return table # New table
function table.LowerKeyNames(tbl) end

---[SHARED AND MENU] Returns the highest numerical key.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.maxn)
---@param tbl table The table to search.
---@return number # The highest numerical key.
function table.maxn(tbl) end

---[SHARED AND MENU] Returns an array of values of given with given key from each table of given table.
---
--- See also table.KeysFromValue.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.MemberValuesFromKey)
---@param inputTable table The table to search in.
---@param keyName any The key to lookup.
---@return table # A list of found values, or an empty table.
function table.MemberValuesFromKey(inputTable, keyName) end

---[SHARED AND MENU] Recursively merges the key-value pairs of the `source` table with the key-value pairs in the `destination` table.
---
--- See table.Inherit, which doesn't override existing values.
---
---
--- See also table.Add, which simply adds values of one table to another.
--- This function can cause a stack overflow under certain circumstances.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Merge)
---@param destination table The table you want the source table to merge with.
---@param source table The table you want to merge with the destination table.
---@param forceOverride? boolean If `true`, does not recursively merge sub-tables, and simply replaces them.
---@return table # Destination table
function table.Merge(destination, source, forceOverride) end

---[SHARED AND MENU] Moves elements from one part of a table to another part a given table. This is similar to assigning elements from the source table to the destination table in multiple assignments.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.move)
---@param sourceTbl table The source table from which the elements are to be moved.
---@param from number The start index of the source range from which the elements are to be moved.
---@param to number The end index of the source range until which the elements are to be moved.
---@param dest number The index within the destination table where the moved elements should be inserted.
---@param destTbl? table The destination table to which the elements are to be moved. By default, this is the same as the source table.
---@return table # The modified destination table.
function table.move(sourceTbl, from, to, dest, destTbl) end

---[SHARED AND MENU] Packs a set of items into a table and returns the new table. It is meant as an alternative implementation of `table.pack` from newer versions of Lua.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Pack)
---@param ... any The items to pack into a table.
---@return table # A table containing the `items`.
---@return number # The amount of items that were added to the table.
function table.Pack(...) end

---[SHARED AND MENU] Returns a random value from the supplied table.
---
--- This function iterates over the given table **twice**, therefore with sequential tables you should instead use following:
---
--- ```
--- mytable[ math.random( #mytable ) ]
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Random)
---@param haystack table The table to choose from.
---@return any # A random value from the table.
---@return any # The key associated with the random value.
function table.Random(haystack) end

---[SHARED AND MENU] Removes a value from a table and shifts any other values down to fill the gap.
--- Does nothing if index is less than 1 or greater than `#tbl`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.remove)
---@param tbl table The table to remove the value from.
---@param index? number The index of the value to remove.
---@return any # The value that was removed.
function table.remove(tbl, index) end

---[SHARED AND MENU] Removes the first instance of a given value from the specified table with table.remove, then returns the key that the value was found at.
---
--- Avoid usage of this function. It does not remove all instances of given value in the table, only the first found, and it does not work with non sequential tables!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.RemoveByValue)
---@param tbl table The table that will be searched.
---@param val any The value to find within the table.
---@return any # The key at which the value was found, or false if the value was not found.
function table.RemoveByValue(tbl, val) end

---[SHARED AND MENU] Returns a reversed copy of a sequential table. Any non-sequential and non-numeric keyvalue pairs will not be copied.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Reverse)
---@param tbl table Table to reverse.
---@return table # A reversed copy of the table.
function table.Reverse(tbl) end

---[SHARED AND MENU] Converts Vectors, Angles and booleans to be able to be converted to and from key-values via util.TableToKeyValues.
---
--- table.DeSanitise performs the opposite transformation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Sanitise)
---@param tab table Table to sanitise
---@return table # Sanitised table
function table.Sanitise(tab) end

---[SHARED AND MENU] Performs an inline [Fisher-Yates shuffle](https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle) on the table in `O(n)` time
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.Shuffle)
---@param target table The table to shuffle.
function table.Shuffle(target) end

---[SHARED AND MENU] Sorts a sequential table either ascending or by the given sort function.
--- This function modifies the table you give to it and internally uses the [quick sort algorithm](http://www.lua.org/source/5.2/ltablib.c.html#sort).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.sort)
---@param tbl table The table to sort.
---@param sorter function If specified, the function will be called with 2 parameters each.
--- Return true in this function if you want the first parameter to come first in the sorted array.
function table.sort(tbl, sorter) end

---[SHARED AND MENU] Returns a list of keys sorted based on values of those keys.
---
--- For normal sorting see table.sort.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.SortByKey)
---@param tab table Table to sort. All values of this table must be of same type.
---@param descending? boolean Should the order be descending?
---@return table # A table of keys sorted by values from supplied table.
function table.SortByKey(tab, descending) end

---[SHARED AND MENU] Sorts a table by a named member.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.SortByMember)
---@param tab table Table to sort.
---@param memberKey any The key used to identify the member.
---@param ascending? boolean Whether or not the order should be ascending.
function table.SortByMember(tab, memberKey, ascending) end

---[SHARED AND MENU] Sorts a table in reverse order from table.sort.
--- This function modifies the table you give to it. Like table.sort, it does not return anything.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.SortDesc)
---@param tbl table The table to sort in descending order.
function table.SortDesc(tbl) end

---[SHARED AND MENU] Converts a table into a string
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/table.ToString)
---@param tbl table The table to iterate over.
---@param displayName string Optional. A name for the table.
---@param niceFormatting boolean Adds new lines and tabs to the string.
---@return string # The table formatted as a string.
function table.ToString(tbl, displayName, niceFormatting) end
