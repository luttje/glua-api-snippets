---@meta

--- The bitwise library contains useful functions for bitwise operations.
--- Make sure you're familiar with [Bitwise Operators](https://code.tutsplus.com/articles/understanding-bitwise-operators--active-11301)
bit = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the arithmetically shifted value.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.arshift)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to shift.
---@return number # shiftedValue
function bit.arshift(value, shiftCount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Performs the bitwise `and` for all values specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.band)
---@param value number The value to be manipulated.
---@param ... any Values bit to perform bitwise "and" with. Optional.
---@return number # Result of bitwise "and" operation.
function bit.band(value, ...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the bitwise not of the value. Inverts every bit of the 32bit integer.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.bnot)
---@param value number The value to be inverted.
---@return number # The result of bitwise not. 0101 becomes 1010, etc.
function bit.bnot(value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the bitwise OR of all values specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.bor)
---@param value1 number The first value.
---@param ... any Extra values to be evaluated. (must all be numbers)
---@return number # The bitwise OR result between all numbers.
function bit.bor(value1, ...) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Swaps the byte order.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.bswap)
---@param value number The value to be byte swapped.
---@return number # swapped
function bit.bswap(value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the bitwise xor of all values specified.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.bxor)
---@param value number The value to be manipulated.
---@param otherValues? number Values bit xor with. Optional.
---@return number # bitwiseXOr
function bit.bxor(value, otherValues) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the result of shifting given value left bitwise by given number of bits. See [this wiki article](https://en.wikipedia.org/wiki/Bitwise_operation#Bit_shifts) for more details.
--- **NOTE**: The returned value will be clamped to a signed 32-bit integer, even on 64-bit builds.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.lshift)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to shift left by.
---@return number # The resulting value. Input of `0b1001` will become `0b10010` for one left shift, etc.
function bit.lshift(value, shiftCount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the left rotated value.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.rol)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to rotate left by.
---@return number # shiftedValue
function bit.rol(value, shiftCount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the right rotated value.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.ror)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to rotate right by.
---@return number # shiftedValue
function bit.ror(value, shiftCount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the right shifted value.
--- **NOTE**: The returned value will be clamped to a signed 32-bit integer, even on 64-bit builds.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.rshift)
---@param value number The value to be manipulated.
---@param shiftCount number Amounts of bits to shift right by.
---@return number # shiftedValue
function bit.rshift(value, shiftCount) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Normalizes the specified value and clamps it in the range of a signed 32bit integer.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.tobit)
---@param value number The value to be normalized.
---@return number # The 32 bits of the provided value.
function bit.tobit(value) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the hexadecimal representation of the number with the specified number of characters.
---
---[View wiki](https://wiki.facepunch.com/gmod/bit.tohex)
---@param value number The value to be normalized.
---@param characters? number Maximum number of characters, if set. The absolute maximum is 8.
---@return string # The hexadecimal representation, such as "00000001".
function bit.tohex(value, characters) end
