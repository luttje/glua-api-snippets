---@meta

--- The timer library is a very useful set of functions which allow you to run a function periodically or after a given delay.
timer = {}

---[SHARED AND MENU] Adjusts the timer if the timer with the given identifier exists.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Adjust)
---@param identifier any Identifier of the timer to adjust.
---@param delay number The delay interval in seconds. **Must be specified.**
---@param repetitions? number Repetitions. Use `0` for infinite or `nil` to keep previous value.
---@param func? function The new function. Use `nil` to keep previous value.
---@return boolean # `true` if succeeded.
function timer.Adjust(identifier, delay, repetitions, func) end

---[SHARED AND MENU] This function does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Check)
---@deprecated If you want to check if whether or not a timer exists, use timer.Exists.
function timer.Check() end

---[SHARED AND MENU] Creates a new timer that will repeat its function given amount of times.
--- This function also requires the timer to be named, which allows you to control it after it was created via the timer.
---
--- For a simple one-time timer with no identifiers, see timer.Simple.
---
--- Timers use Global.CurTime internally. Due to this, they won't advance while the client is timing out from the server or on an empty dedicated server due to hibernation. (unless `sv_hibernate_think` is set to `1`).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Create)
---@param identifier string Identifier of the timer to create. Must be unique. If a timer already exists with the same identifier, that timer will be updated to the new settings and reset.
---@param delay number The delay interval in seconds. If the delay is too small, the timer will fire on the next GM:Tick.
---@param repetitions number The number of times to repeat the timer. Enter `0` or any value below `0` for infinite repetitions.
---@param func function Function called when timer has finished the countdown.
function timer.Create(identifier, delay, repetitions, func) end

---[SHARED AND MENU] Stops and destroys the given timer. Alias of timer.Remove.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Destroy)
---@param identifier string Identifier of the timer to destroy.
---@deprecated You should be using timer.Remove instead.
function timer.Destroy(identifier) end

---[SHARED AND MENU] Returns whenever the given timer exists or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Exists)
---@param identifier string Identifier of the timer.
---@return boolean # Returns true if the timer exists, false if it doesn't
function timer.Exists(identifier) end

---[SHARED AND MENU] Pauses the given timer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Pause)
---@param identifier any Identifier of the timer.
---@return boolean # false if the timer didn't exist or was already paused, true otherwise.
function timer.Pause(identifier) end

---[SHARED AND MENU] Stops and removes a timer created by timer.Create.
--- The timers are removed in the next frame! Keep this in mind when storing identifiers in variables.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Remove)
---@param identifier string Identifier of the timer to remove.
function timer.Remove(identifier) end

---[SHARED AND MENU] Returns amount of repetitions/executions left before the timer destroys itself.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.RepsLeft)
---@param identifier any Identifier of the timer.
---@return number # The amount of executions left.
function timer.RepsLeft(identifier) end

---[SHARED AND MENU] Creates a simple timer that runs the given function after a specified delay.
---
--- For a more advanced version that you can control after creation, see timer.Create.
---
--- Timers use Global.CurTime internally. Due to this, they won't advance while the client is timing out from the server or on an empty dedicated server due to hibernation. (unless `sv_hibernate_think` is set to `1`).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Simple)
---@param delay number How long until the function should be ran (in seconds). Use `0` to have the function run in the next GM:Tick.
---@param func function The function to run after the specified delay.
function timer.Simple(delay, func) end

---[SHARED AND MENU] Restarts the given timer.
---
--- Timers use Global.CurTime for timing.
--- Timers won't advance while the client is timing out from the server.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Start)
---@param identifier any Identifier of the timer.
---@return boolean # true if the timer exists, false if it doesn't.
function timer.Start(identifier) end

---[SHARED AND MENU] Stops the given timer and rewinds it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Stop)
---@param identifier any Identifier of the timer.
---@return boolean # false if the timer didn't exist or was already stopped, true otherwise.
function timer.Stop(identifier) end

---[SHARED AND MENU] Returns amount of time left (in seconds) before the timer executes its function.
---
--- If the timer is paused, the amount will be negative.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.TimeLeft)
---@param identifier any Identifier of the timer.
---@return number # The amount of time left (in seconds).
function timer.TimeLeft(identifier) end

---[SHARED AND MENU] Runs either timer.Pause or timer.UnPause based on the timer's current status.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.Toggle)
---@param identifier any Identifier of the timer.
---@return boolean # status of the timer.
function timer.Toggle(identifier) end

---[SHARED AND MENU] Unpauses the timer.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/timer.UnPause)
---@param identifier any Identifier of the timer.
---@return boolean # false if the timer didn't exist or was already running, true otherwise.
function timer.UnPause(identifier) end
