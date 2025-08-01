---@meta

--- The SQL library allows you to access powerful database software included with Garry's Mod. It is the preferred and fastest method of storing large amounts of data. The database is located in sv.db serverside and cl.db clientside, both in the Garry's Mod base folder. SQL is a whole scripting language in itself although relatively simple, it's something you'll need to read up on before using this library.
---
--- Example of using sql.
--- ```
--- -- Creating a table
--- sql.Query("CREATE TABLE my_db_table( id NUMBER , name TEXT )" )
---
--- -- Inserting a value to the table
--- sql.Query("INSERT INTO my_db_table( id , name ) VALUES( 1 , 'First') ")
---
--- -- Printing the tables data
--- PrintTable( sql.Query("SELECT * FROM my_db_table ") )
---
--- -- Deleting the table
--- sql.Query("DROP TABLE my_db_table")
--- ```
---
--- Known GMod [SQLite](https://www.sqlite.org/compile.html) settings:
--- * Temp files are stored in memory (`SQLITE_TEMP_STORE = 3`)
--- * No `ATTACH` and `DETACH` operations (`SQLITE_OMIT_ATTACH = 1`)
--- * No Virtual Tables (`SQLITE_OMIT_VIRTUALTABLE = 1`)
--- * No `VACUUM` operation (`SQLITE_OMIT_VACUUM = 1`)
--- * No `LIMIT` and `ORDER BY` clauses in `DELETE` and `UPDATE` statements (`SQLITE_ENABLE_UPDATE_DELETE_LIMIT`)
sql = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Tells the engine a set of queries is coming. Will wait until [sql.Commit](https://wiki.facepunch.com/gmod/sql.Commit) is called to run them.
--- This is most useful when you run more than 100+ queries.
--- This is equivalent to :
--- ```
--- sql.Query( "BEGIN;" )
--- ```
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.Begin)
function sql.Begin() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Tells the engine to execute a series of queries queued for execution, must be preceded by [sql.Begin](https://wiki.facepunch.com/gmod/sql.Begin).
---
--- This is equivalent to `sql.Query( "COMMIT;" )`.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.Commit)
function sql.Commit() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns true if the index with the specified name exists.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.IndexExists)
---@param indexName string The name of the index to check.
---@return boolean # exists
function sql.IndexExists(indexName) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the last error from a SQLite query.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.LastError)
---@return string # Last error from SQLite database.
function sql.LastError() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs a query on the local SQLite database, returns a table as result set, nil if result is empty and false on error.
--- 	**WARNING**: To run SQL queries with this function safely, it is crucial to ensure that the concatenated variables in the query string are safe to avoid vulnerabilities like SQL injections. For this, it is recommended to use the [sql.SQLStr](https://wiki.facepunch.com/gmod/sql.SQLStr), which allows arguments to be escaped correctly.
---
--- It's best to just use [sql.QueryTyped](https://wiki.facepunch.com/gmod/sql.QueryTyped) instead if possible.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.Query)
---@param query string The query to execute.
---@return table|boolean|nil # `false` is returned if there is an error, `nil` if the query returned no data.
function sql.Query(query) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs the [sql.Query](https://wiki.facepunch.com/gmod/sql.Query) and returns the n'th row.
---
--- This function is equivalent to safely returning
--- ```lua
--- sql.Query(query)[row]
--- ```
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.QueryRow)
---@param query string The query as used in sql.Query
---@param row? number The row number.
---@return table # The returned row.
function sql.QueryRow(query, row) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs a query on the local SQLite database with proper type handling and parameter binding, returns a table as result set, empty table if no results, and false on error. Unlike [sql.Query](https://wiki.facepunch.com/gmod/sql.Query), this function properly handles SQLite data types and allows safe parameter binding to prevent SQL injection attacks.
--- **WARNING**: * This function only executes a single SQL statement, unlike [sql.Query](https://wiki.facepunch.com/gmod/sql.Query) which can execute multiple statements separated by semicolons.
---
--- * Large INTEGER values (beyond ±9,007,199,254,740,991) are returned as strings to preserve exact values. This is because Lua represents all numbers as doubles, which lose precision for integers larger than 2⁵³-1. Returning them as strings prevents data corruption from rounding errors.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.QueryTyped)
---@param query string The query to execute with optional `?` parameter placeholders.
---
---
--- * Always use parameter binding with `?` placeholders instead of string concatenation to prevent SQL injection vulnerabilities.
---@param ... any Parameters to bind to the query placeholders. Supports nil, boolean, number, and string types.
---
--- The number of query parameters must match the number of `?` placeholders, or the query will fail. See examples.
---@return table|boolean # `false` is returned if there is an error (See sql.LastError), otherwise a table with properly typed column values (empty table if no results).
function sql.QueryTyped(query, ...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs the query like [sql.QueryRow](https://wiki.facepunch.com/gmod/sql.QueryRow), but returns the first value found.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.QueryValue)
---@param query string The input query.
---@return string # The returned value.
function sql.QueryValue(query) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Escapes dangerous characters and symbols from user input used in an SQLite SQL Query.
---
--- If possible, it is recommended to use [sql.QueryTyped](https://wiki.facepunch.com/gmod/sql.QueryTyped) instead.
---
--- **WARNING**: Do not use this function with external database engines such as `MySQL`. `MySQL` and `SQLite` use different escape sequences that are incompatible with each other! Escaping strings with inadequate functions is dangerous and will lead to SQL injection vulnerabilities.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.SQLStr)
---@param string string The string to be escaped.
---@param bNoQuotes? boolean Set this as `true`, and the function will not wrap the input string in apostrophes.
---@return string # The escaped input.
function sql.SQLStr(string, bNoQuotes) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns true if the table with the specified name exists.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.TableExists)
---@param tableName string The name of the table to check.
---@return boolean # exists
function sql.TableExists(tableName) end
