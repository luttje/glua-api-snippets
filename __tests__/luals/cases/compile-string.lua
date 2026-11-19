-- CompileString returns nil on errors the game handled, or the error string when handleError is false
local handleError = ... ---@type boolean

---@type function?
local handledByDefault = CompileString("end", "test")
---@type function?
local handledByNil = CompileString("end", "test", nil)
---@type function?
local handled = CompileString("end", "test", true)

---@type function|string
local notHandled = CompileString("end", "test", false)
---@type function?
local notHandledNoString = CompileString("end", "test", false) -- expect: assign-type-mismatch

---@type function|string|nil
local maybeHandled = CompileString("end", "test", handleError)
---@type function|string
local maybeHandledNoNil = CompileString("end", "test", handleError) -- expect: assign-type-mismatch

local compiled = CompileString("end", "test")
compiled() -- expect: need-check-nil
