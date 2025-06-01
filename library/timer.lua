---@meta

--- The timer library is a very useful set of functions which allow you to run a function periodically or after a given delay.
timer = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Adjusts a previously created ([timer.Create](https://wiki.facepunch.com/gmod/timer.Create)) timer with the given identifier.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Adjust)
---@param identifier any Identifier of the timer to adjust.
---@param delay number The delay interval in seconds. **Must be specified.**
---@param repetitions? number Repetitions. Use `0` for infinite or `nil` to keep previous value.
---@param func? function The new function. Use `nil` to keep previous value.
---@return boolean # `true` if succeeded.
function timer.Adjust(identifier, delay, repetitions, func) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) This function does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Check)
---@deprecated If you want to check if whether or not a timer exists, use timer.Exists.
function timer.Check() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a new timer that will repeat its function given amount of times.
--- This function also requires the timer to be named, which allows you to control it after it was created via the [timer](https://wiki.facepunch.com/gmod/timer).
---
--- For a simple one-time timer with no identifiers, see [timer.Simple](https://wiki.facepunch.com/gmod/timer.Simple).
---
--- **WARNING**: Timers use [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) internally. Due to this, they won't advance while the client is timing out from the server or on an empty dedicated server due to hibernation. (unless `sv_hibernate_think` is set to `1` or `delay` is set to `0` ).
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Create)
---@param identifier string Identifier of the timer to create. Must be unique. If a timer already exists with the same identifier, that timer will be updated to the new settings and reset.
---@param delay number The delay interval in seconds. If the delay is too small, the timer will fire on the next GM:Tick.
---@param repetitions number The number of times to repeat the timer. Enter `0` or any value below `0` for infinite repetitions.
---@param func function Function called when timer has finished the countdown.
function timer.Create(identifier, delay, repetitions, func) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Stops and destroys the given timer. Alias of [timer.Remove](https://wiki.facepunch.com/gmod/timer.Remove).
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Destroy)
---@param identifier string Identifier of the timer to destroy.
---@deprecated You should be using timer.Remove instead.
function timer.Destroy(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whenever the given timer exists or not.
---
--- For debugging purposes you can use the following commands:
--- * `lua_dumptimers_cl`
--- * `lua_dumptimers_sv`
--- * `lua_dumptimers_menu`
---
--- These will list all active timers in each realm.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Exists)
---@param identifier string Identifier of the timer.
---@return boolean # Returns true if the timer exists, false if it doesn't
function timer.Exists(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Pauses the given timer.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Pause)
---@param identifier any Identifier of the timer.
---@return boolean # false if the timer didn't exist or was already paused, true otherwise.
function timer.Pause(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Stops and removes a timer created by [timer.Create](https://wiki.facepunch.com/gmod/timer.Create).
--- **WARNING**: The timers are removed in the next frame! Keep this in mind when storing identifiers in variables.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Remove)
---@param identifier string Identifier of the timer to remove.
function timer.Remove(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns amount of repetitions/executions left before the timer destroys itself.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.RepsLeft)
---@param identifier any Identifier of the timer.
---@return number # The amount of executions left.
function timer.RepsLeft(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a simple timer that runs the given function after a specified delay.
---
--- For a more advanced version that you can control after creation, see [timer.Create](https://wiki.facepunch.com/gmod/timer.Create).
---
--- **WARNING**: Timers use [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) internally. Due to this, they won't advance while the client is timing out from the server or on an empty dedicated server due to hibernation. (unless `sv_hibernate_think` is set to `1`).
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Simple)
---@param delay number How long until the function should be ran (in seconds). Use `0` to have the function run in the next GM:Tick.
---@param func function The function to run after the specified delay.
function timer.Simple(delay, func) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Restarts the given timer.
---
--- **NOTE**: Timers use [Global.CurTime](https://wiki.facepunch.com/gmod/Global.CurTime) for timing.
---
--- **WARNING**: Timers won't advance while the client is timing out from the server.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Start)
---@param identifier any Identifier of the timer.
---@return boolean # true if the timer exists, false if it doesn't.
function timer.Start(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Stops the given timer and rewinds it.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Stop)
---@param identifier any Identifier of the timer.
---@return boolean # false if the timer didn't exist or was already stopped, true otherwise.
function timer.Stop(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns amount of time left (in seconds) before the timer executes its function.
---
--- **NOTE**: If the timer is paused, the amount will be negative.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.TimeLeft)
---@param identifier any Identifier of the timer.
---@return number # The amount of time left (in seconds).
function timer.TimeLeft(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Runs either [timer.Pause](https://wiki.facepunch.com/gmod/timer.Pause) or [timer.UnPause](https://wiki.facepunch.com/gmod/timer.UnPause) based on the timer's current status.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.Toggle)
---@param identifier any Identifier of the timer.
---@return boolean # status of the timer.
function timer.Toggle(identifier) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Unpauses the timer.
---
---[View wiki](https://wiki.facepunch.com/gmod/timer.UnPause)
---@param identifier any Identifier of the timer.
---@return boolean # false if the timer didn't exist or was already running, true otherwise.
function timer.UnPause(identifier) end
