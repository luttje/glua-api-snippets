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

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs the query like [sql.QueryRow](https://wiki.facepunch.com/gmod/sql.QueryRow), but returns the first value found.
---
---[View wiki](https://wiki.facepunch.com/gmod/sql.QueryValue)
---@param query string The input query.
---@return string # The returned value.
function sql.QueryValue(query) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Escapes dangerous characters and symbols from user input used in an SQLite SQL Query.
---
--- **NOTE**: This function is not meant to be used with external database engines such as `MySQL`. Escaping strings with inadequate functions is dangerous!
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
