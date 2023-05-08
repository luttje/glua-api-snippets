---@meta

jit = {}

---[SHARED AND MENU] You can attach callbacks to a number of compiler events with jit.attach. The callback can be called:
---
--- * when a function has been compiled to bytecode ("bc");
--- * when trace recording starts or stops ("trace");
--- * as a trace is being recorded ("record");
--- * or when a trace exits through a side exit ("texit").
---
--- Set a callback with jit.attach(callback, "event") and clear the same callback with jit.attach(callback)
---
--- This function isn't officially documented on LuaJIT wiki, use it at your own risk.
--- Using these constantly (especially bytecode) can be very performance heavy due to the constant stream of data being compiled at a time.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.attach)
---@param callback function The callback function.
---
--- The arguments passed to the callback depend on the event being reported:
---
--- * "bc":
--- function func - The function that's just been recorded
---
---
---
--- * "trace":
--- string what - description of the trace event: "flush", "start", "stop", "abort". Available for all events.
---
---
--- number tr - The trace number. Not available for flush.
---
---
--- function func - The function being traced. Available for start and abort.
---
---
--- number pc - The program counter - the bytecode number of the function being recorded (if this a Lua function). Available for start and abort.
---
---
--- number otr - start: the parent trace number if this is a side trace, abort: abort code
---
---
--- string oex - start: the exit number for the parent trace, abort: abort reason (string)
---
---
---
--- * "record":
--- number tr - The trace number. Not available for flush.
---
---
--- function func - The function being traced. Available for start and abort.
---
---
--- number pc - The program counter - the bytecode number of the function being recorded (if this a Lua function). Available for start and abort.
---
---
--- number depth  - The depth of the inlining of the current bytecode.
---
---
---
--- * "texit":
--- number tr - The trace number. Not available for flush.
---
---
--- number ex - The exit number
---
---
--- number ngpr - The number of general-purpose and floating point registers that are active at the exit.
---
---
--- number nfpr - The number of general-purpose and floating point registers that are active at the exit.
---@param event string The event to hook into.
function jit.attach(callback, event) end

---[SHARED AND MENU] Flushes the whole cache of compiled code.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.flush)
function jit.flush() end

---[SHARED AND MENU] Disables LuaJIT Lua compilation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.off)
function jit.off() end

---[SHARED AND MENU] Enables LuaJIT Lua compilation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.on)
function jit.on() end

---[SHARED AND MENU] JIT compiler optimization control. The opt sub-module provides the backend for the -O command line LuaJIT option.
--- You can also use it programmatically, e.g.:
---
--- ```
--- jit.opt.start(2) -- same as -O2
--- jit.opt.start("-dce")
--- jit.opt.start("hotloop=10", "hotexit=2")
--- ```
---
--- 	A list of LuaJIT -O command line options can be found here(a table of various optimization levels are displayed towards the bottom of the page along with exactly which optimization options are enabled for each level): http://luajit.org/running.html
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.opt.start)
---@param ... ...
function jit.opt.start(...) end

---[SHARED AND MENU] Returns the status of the JIT compiler and the current optimizations enabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.status)
---@return boolean, any #boolean - Is JIT enabled
---@return boolean, any #any - Strings for CPU-specific features and enabled optimizations
function jit.status() end

---[SHARED AND MENU] Returns bytecode of a function at a position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.funcbc)
---@param func function Function to retrieve bytecode from.
---@param pos number Position of the bytecode to retrieve.
---@return number, number #number - bytecode instruction
---@return number, number #number - bytecode opcode
function jit.util.funcbc(func, pos) end

---[SHARED AND MENU] Retrieves LuaJIT information about a given function, similarly to debug.getinfo. Possible table fields:
--- * linedefined: as for debug.getinfo
--- * lastlinedefined: as for debug.getinfo
--- * params: the number of parameters the function takes
--- * stackslots: the number of stack slots the function's local variable use
--- * upvalues: the number of upvalues the function uses
--- * bytecodes: the number of bytecodes it the compiled function
--- * gcconsts: the number of garbage collectable constants
--- * nconsts: the number of lua_Number (double) constants
--- * children: Boolean representing whether the function creates closures
--- * currentline: as for debug.getinfo
--- * isvararg: if the function is a vararg function
--- * source: as for debug.getinfo
--- * loc: a string describing the source and currentline, like "<source>:<line>"
--- * ffid: the fast function id of the function (if it is one). In this case only upvalues above and addr below are valid
--- * addr: the address of the function (if it is not a Lua function). If it's a C function rather than a fast function, only upvalues above is valid*
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.funcinfo)
---@param func function Function or Proto to retrieve info about.
---@param pos? number
---@return table #Information about the supplied function/proto.
function jit.util.funcinfo(func, pos) end

---[SHARED AND MENU] Gets a constant at a certain index in a function.
--- This function isn't officially documented on LuaJIT wiki, use it at your own risk.
--- Numbers constants goes from 0 (included) to n-1, n being the value of nconsts in jit.util.funcinfo in other words, the consts goes from (nconsts-1) to -n
--- This function only works for Lua defined functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.funck)
---@param func function Function to get constant from
---@param index number Constant index (counting down from the top of the function at -1)
---@return any #The constant found.  This will return a proto for functions that are created inside the target function - see Example 2.
function jit.util.funck(func, index) end

---[SHARED AND MENU] Does the exact same thing as debug.getupvalue except it only returns the name, not the name and the object. The upvalue indexes also start at 0 rather than 1, so doing jit.util.funcuvname(func, 0) will get you the same name as debug.getupvalue(func, 1)
--- This function isn't officially documented on LuaJIT wiki, use it at your own risk.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.funcuvname)
---@param func function Function to get the upvalue indexed from
---@param index number The upvalue index, starting from 0
---@return string #The function returns nil if there is no upvalue with the given index, otherwise the name of the upvalue is returned
function jit.util.funcuvname(func, index) end

---[SHARED AND MENU] Gets the address of a function from a list of functions, for the list see Ircalladdr Functions
--- This function isn't officially documented on LuaJIT wiki, use it at your own risk.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.ircalladdr)
---@param index number The index of the function address to get from the ircalladdr func array (starting from 0)
---@return number #The address of the function. 			 				It will return `0` if the index is reserved.   				in the x86-64 versions the index is reserved up to 102.   				in all other versions it is reserved until 71.
function jit.util.ircalladdr(index) end

---[SHARED AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.traceexitstub)
---@param exitno number exit number to retrieve exit stub address from (gotten via jit.attach with the texit event)
---@return number #exitstub trace address
function jit.util.traceexitstub(exitno) end

---[SHARED AND MENU] Return table fields:
--- * link (number): the linked trace (0 for link types: none, return, interpreter)
--- * nk (number): the lowest IR constant (???)
--- * nins (number): the next IR instruction (???)
--- * linktype (string): the link type (none, root, loop, tail-recursion, up-recursion, down-recursion, interpreter, return)
--- * nexit (number): number of snapshots (for use with jit.util.tracesnap)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.traceinfo)
---@param trace number trace index to retrieve info for (gotten via jit.attach)
---@return table #trace info
function jit.util.traceinfo(trace) end

---[SHARED AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.traceir)
---@param tr number
---@param index number
---@return number, number, number, number, number #number - m
---@return number, number, number, number, number #number - ot
---@return number, number, number, number, number #number - op1
---@return number, number, number, number, number #number - op2
---@return number, number, number, number, number #number - prev
function jit.util.traceir(tr, index) end

---[SHARED AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.tracek)
---@param tr number
---@param index number
---@return any, number, number #any - k
---@return any, number, number #number - t
---@return any, number, number #number - slot; optional
function jit.util.tracek(tr, index) end

---[SHARED AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.tracemc)
---@param tr number
---@return string, number, number #string - mcode
---@return string, number, number #number - address
---@return string, number, number #number - loop
function jit.util.tracemc(tr) end

---[SHARED AND MENU] Return table fields:
--- * 0 (ref) (number): first IR ref for the snapshot
--- * 1 (nslots) (number): the number of valid slots
--- * all indexes except first 2 and last (there might not be any of these): the snapshot map
--- * last index in table (number): -16777216 (255 << 24)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/jit.util.tracesnap)
---@param tr number trace index to retrieve snapshot for (gotten via jit.attach)
---@param sn number snapshot index for trace (starting from 0 to nexit - 1, nexit gotten via jit.util.traceinfo)
---@return table #snapshot
function jit.util.tracesnap(tr, sn) end
