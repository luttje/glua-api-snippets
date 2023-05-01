---@meta

sql = {}

---[SHARED AND MENU] Tells the engine a set of queries is coming. Will wait until sql.Commit is called to run them.
--- This is most useful when you run more than 100+ queries.
--- This is equivalent to :
--- ```
--- sql.Query( "BEGIN;" )
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.Begin)
function sql.Begin() end

---[SHARED AND MENU] Tells the engine to execute a series of queries queued for execution, must be preceded by sql.Begin.
--- 
--- This is equivalent to `sql.Query( "COMMIT;" )`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.Commit)
function sql.Commit() end

---[SHARED AND MENU] Returns true if the index with the specified name exists.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.IndexExists)
---@param indexName string The name of the index to check.
---@return boolean exists
function sql.IndexExists(indexName) end

---[SHARED AND MENU] Returns the last error from a SQLite query.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.LastError)
---@return string Last error from SQLite database.
function sql.LastError() end

---[SHARED AND MENU] Performs a query on the local SQLite database, returns a table as result set, nil if result is empty and false on error.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.Query)
---@param query string The query to execute.
---@return table false is returned if there is an error, nil if the query returned no data.
function sql.Query(query) end

---[SHARED AND MENU] Performs the query like sql.Query, but returns the first row found.
--- 
--- Basically equivalent to :
--- ```
--- sql.Query( query .. " LIMIT 1;" )
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.QueryRow)
---@param query string The input query.
---@param row number The row number. Say we receive back 5 rows, putting 3 as this argument will give us row #3.
---@return table The returned row.
function sql.QueryRow(query, row) end

---[SHARED AND MENU] Performs the query like sql.QueryRow, but returns the first value found.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.QueryValue)
---@param query string The input query.
---@return string The returned value.
function sql.QueryValue(query) end

---[SHARED AND MENU] Escapes dangerous characters and symbols from user input used in an SQLite SQL Query.
--- 
--- this function is not meant to be used with external database engines such as `MySQL`. Escaping strings with inadequate functions is dangerous!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.SQLStr)
---@param string string The string to be escaped.
---@param bNoQuotes boolean Set this as `true`, and the function will not wrap the input string in apostrophes.
---@return string The escaped input.
function sql.SQLStr(string, bNoQuotes) end

---[SHARED AND MENU] Returns true if the table with the specified name exists.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/sql.TableExists)
---@param tableName string The name of the table to check.
---@return boolean exists
function sql.TableExists(tableName) end

