---@meta

--- The utf8 library provides basic support for UTF-8 encoding. This library does not provide any support for Unicode other than the handling of the encoding. Any operation that needs the meaning of a character, such as character classification, is outside its scope.
---
--- Unless stated otherwise, all functions that expect a byte position as a parameter assume that the given position is either the start of a byte sequence or one plus the length of the subject string. As in the string library, negative indices count from the end of the string.
utf8 = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Receives zero or more integers, converts each one to its corresponding UTF-8 byte sequence and returns a string with the concatenation of all these sequences.
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.char)
---@param ... any Unicode code points to be converted in to a UTF-8 string.
---@return string # UTF-8 string generated from given arguments.
function utf8.char(...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the codepoints (as numbers) from all characters in the given string that start between byte position startPos and endPos. It raises an error if it meets any invalid byte sequence. This functions similarly to [string.byte](https://wiki.facepunch.com/gmod/string.byte).
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.codepoint)
---@param string string The string that you will get the code(s) from.
---@param startPos? number The starting byte of the string to get the codepoint of.
---@param endPos? number The ending byte of the string to get the codepoint of.
---@return any ... # The codepoint number(s).
function utf8.codepoint(string, startPos, endPos) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns an iterator (like [string.gmatch](https://wiki.facepunch.com/gmod/string.gmatch)) which returns both the position and codepoint of each utf8 character in the string. It raises an error if it meets any invalid byte sequence.
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.codes)
---@param string string The string that you will get the codes from.
---@return function # The iterator (to be used in a for loop).
function utf8.codes(string) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Forces a string to contain only valid UTF-8 data. Invalid sequences are replaced with U+FFFD (the Unicode replacement character).
---
--- This is a lazy way for users to ensure a string contains only valid UTF-8 data.
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.force)
---@param string string The string that will become a valid UTF-8 string.
---@return string # The UTF-8 string.
function utf8.force(string) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) A UTF-8 compatible version of [string.GetChar](https://wiki.facepunch.com/gmod/string.GetChar).
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.GetChar)
---@param str string The string that you will be searching with the supplied index.
---@param index number The index's value of the string to be returned.
---@return string # str
function utf8.GetChar(str, index) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the number of UTF-8 sequences in the given string between positions startPos and endPos (both inclusive). If it finds any invalid UTF-8 byte sequence, returns false as well as the position of the first invalid byte.
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.len)
---@param string string The string to calculate the length of.
---@param startPos? number The starting position to get the length from.
---@param endPos? number The ending position to get the length from.
---@return number # The number of UTF-8 characters in the string. If there are invalid bytes, this will be false.
---@return number # The position of the first invalid byte. If there were no invalid bytes, this will be nil.
function utf8.len(string, startPos, endPos) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the byte-index of the n'th UTF-8-character after the given startPos (nil if none). startPos defaults to 1 when n is positive and -1 when n is negative. If n is zero, this function instead returns the byte-index of the UTF-8-character startPos lies within.
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.offset)
---@param string string The string that you will get the byte position from.
---@param n number The position to get the beginning byte position from.
---@param startPos? number The offset for n.
---@return number # Starting byte-index of the given position.
function utf8.offset(string, n, startPos) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) A UTF-8 compatible version of [string.sub](https://wiki.facepunch.com/gmod/string.sub).
--- 	**WARNING**: Avoid using this function on large strings every tick/frame, as it may cause lags.
---
---[View wiki](https://wiki.facepunch.com/gmod/utf8.sub)
---@param string string The string you'll take a sub-string out of.
---@param StartPos number The position of the first character that will be included in the sub-string.
---@param EndPos? number The position of the last character to be included in the sub-string. It can be negative to count from the end.
---@return string # The substring.
function utf8.sub(string, StartPos, EndPos) end
