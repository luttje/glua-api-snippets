---@meta

--- The os library is a standard Lua library originally intended to allow Lua access to various features of the Operating System it's running on, however many of the features and functions have been removed in Garry's Mod due to security issues. It's only used in Garry's Mod for date & time operations.
os = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the approximate cpu time the application ran.
--- See also [Global.SysTime](https://wiki.facepunch.com/gmod/Global.SysTime)
--- **NOTE**: This function has different precision on Linux (1/100).
---
---[View wiki](https://wiki.facepunch.com/gmod/os.clock)
---@return number # runtime
function os.clock() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the date/time as a formatted string or in a table.
---
---[View wiki](https://wiki.facepunch.com/gmod/os.date)
---@param format string The format string.
--[[

If this is equal to `*t` or `!*t` then this function will return a Structures/DateData, otherwise it will return a string.

If this starts with an `!`, the returned data will use the UTC timezone rather than the local timezone.

See http://www.mkssoftware.com/docs/man3/strftime.3.asp for available format flags.

**Not all flags are available on all operating systems** and the result of using an invalid flag is undefined. This currently crashes the game on Windows. Most or all flags are available on OS X and Linux but considerably fewer are available on Windows. See http://msdn.microsoft.com/en-us/library/fe06s4ak.aspx for a list of available flags on Windows. Note that the **#** flags also crashes the game on Windows.

Known formats that work on all platforms:

| Format | Description | Example of the output |
|:------:|:-----------:|:---------------------:|
| `%a` | Abbreviated weekday name | `Wed` |
| `%A` | Full weekday name | `Wednesday` |
| `%b` | Abbreviated month name | `Sep` |
| `%B` | Full month name | `September` |
| `%c` | Locale-appropriate date and time | Varies by platform and language settings |
| `%d` | Day of the month [01-31] | `16` |
| `%H` | Hour, using a 24-hour clock [00-23] | `23` |
| `%I` | Hour, using a 12-hour clock [01-12] | `11` |
| `%j` | Day of the year [001-365] | `259` |
| `%m` | Month [01-12] | `09` |
| `%M` | Minute [00-59] | `48` |
| `%p` | Either `am` or `pm` | `pm` |
| `%S` | Second [00-60] | `10` |
| `%w` | Weekday [0-6 = Sunday-Saturday] | `3` |
| `%W` | Week of the year [00-53] | `37` |
| `%x` | Date (Same as `%m/%d/%y`) | `09/16/98` |
| `%X` | Time (Same as `%H:%M:%S`) | `23:48:10` |
| `%y` | Two-digit year [00-99] | `98` |
| `%Y` | Full year | `1998` |
| `%z` | Timezone | `-0300` |
| `%%` | A percent sign | `%` |
--]]
---@param time? number Time to use for the format.
---@return string # Formatted date
--- This will be a [Structures/DateData](https://wiki.facepunch.com/gmod/Structures/DateData) if the first argument equals to `*t` or `!*t`
function os.date(format, time) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Subtracts the second from the first value and rounds the result.
---
---[View wiki](https://wiki.facepunch.com/gmod/os.difftime)
---@param timeA number The first value.
---@param timeB number The value to subtract.
---@return number # diffTime
function os.difftime(timeA, timeB) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the system time in seconds past the unix epoch. If a table is supplied, the function attempts to build a system time with the specified table members.
---
---[View wiki](https://wiki.facepunch.com/gmod/os.time)
---@param dateData? table Table to generate the time from. This table's data is interpreted as being in the local timezone. See Structures/DateData
---@return number # Seconds passed since Unix epoch
function os.time(dateData) end
