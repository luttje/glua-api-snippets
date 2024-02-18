---@meta

--- The bitwise library contains useful functions for bitwise operations.
--- Make sure you're familiar with [Bitwise Operators](https://code.tutsplus.com/articles/understanding-bitwise-operators--active-11301)
bit = {}

---[SHARED AND MENU] Returns the arithmetically shifted value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.arshift)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to shift.
---@return number # shiftedValue
function bit.arshift(value, shiftCount) end

---[SHARED AND MENU] Performs the bitwise `and` for all values specified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.band)
---@param value number The value to be manipulated.
---@param otherValues? number Values bit to perform bitwise "and" with. Optional.
---@return number # Result of bitwise "and" operation.
function bit.band(value, otherValues) end

---[SHARED AND MENU] Returns the bitwise not of the value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.bnot)
---@param value number The value to be inverted.
---@return number # bitwiseNot
function bit.bnot(value) end

---[SHARED AND MENU] Returns the bitwise OR of all values specified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.bor)
---@param value1 number The first value.
---@param ... any Extra values to be evaluated. (must all be numbers)
---@return number # The bitwise OR result between all numbers.
function bit.bor(value1, ...) end

---[SHARED AND MENU] Swaps the byte order.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.bswap)
---@param value number The value to be byte swapped.
---@return number # swapped
function bit.bswap(value) end

---[SHARED AND MENU] Returns the bitwise xor of all values specified.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.bxor)
---@param value number The value to be manipulated.
---@param otherValues? number Values bit xor with. Optional.
---@return number # bitwiseXOr
function bit.bxor(value, otherValues) end

---[SHARED AND MENU] Returns the left shifted value.
--- 		The returned value will be clamped to a signed 32-bit integer, even on 64-bit builds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.lshift)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to shift left by.
---@return number # shiftedValue
function bit.lshift(value, shiftCount) end

---[SHARED AND MENU] Returns the left rotated value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.rol)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to rotate left by.
---@return number # shiftedValue
function bit.rol(value, shiftCount) end

---[SHARED AND MENU] Returns the right rotated value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.ror)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to rotate right by.
---@return number # shiftedValue
function bit.ror(value, shiftCount) end

---[SHARED AND MENU] Returns the right shifted value.
--- 		The returned value will be clamped to a signed 32-bit integer, even on 64-bit builds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.rshift)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to shift right by.
---@return number # shiftedValue
function bit.rshift(value, shiftCount) end

---[SHARED AND MENU] Normalizes the specified value and clamps it in the range of a signed 32bit integer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.tobit)
---@param value number The value to be normalized.
---@return number # swapped
function bit.tobit(value) end

---[SHARED AND MENU] Returns the hexadecimal representation of the number with the specified digits.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/bit.tohex)
---@param value number The value to be normalized.
---@param digits? number The number of digits. Optional
---@return string # hexString
function bit.tohex(value, digits) end
