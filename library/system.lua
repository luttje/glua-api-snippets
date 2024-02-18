---@meta

--- The system library provides functions that allow you to gather information about the system running the game, such as operating system, uptime and battery level.
system = {}

---[SHARED AND MENU] Returns the total uptime of the current application as reported by Steam.
---
--- This will return a similar value to Global.SysTime.
---
--- This function does not work on Dedicated Servers and will instead return no value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.AppTime)
---@return number # Seconds of game uptime as an integer.
function system.AppTime() end

---[SHARED AND MENU] Returns the current battery power.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.BatteryPower)
---@return number # 0-100 if a battery (laptop, UPS, etc) is present.  Will instead return 255 if plugged in without a battery.
function system.BatteryPower() end

---[CLIENT AND MENU] Flashes the window, turning the border to white briefly
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.FlashWindow)
function system.FlashWindow() end

---[SHARED AND MENU] Returns the country code of this computer, determined by the localisation settings of the OS.
---
--- This function does not work on Dedicated Servers and will instead return no value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.GetCountry)
---@return string # Two-letter country code, using [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) standard.
function system.GetCountry() end

---[SHARED AND MENU] Returns whether or not the game window has focus.
---
--- This function does not work on dedicated servers and will instead return no value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.HasFocus)
---@return boolean # Whether or not the game window has focus.
function system.HasFocus() end

---[SHARED AND MENU] Returns whether the current OS is Linux.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.IsLinux)
---@return boolean # Whether or not the game is running on Linux.
function system.IsLinux() end

---[SHARED AND MENU] Returns whether the current OS is OSX.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.IsOSX)
---@return boolean # Whether or not the game is running on OSX.
function system.IsOSX() end

---[CLIENT AND MENU] Returns whether the game is being run in a window or in fullscreen (you can change this by opening the menu, clicking 'Options', then clicking the 'Video' tab, and changing the Display Mode using the dropdown menu):
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.IsWindowed)
---@return boolean # Is the game running in a window?
function system.IsWindowed() end

---[SHARED AND MENU] Returns whether the current OS is Windows.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.IsWindows)
---@return boolean # Whether the system the game runs on is Windows or not.
function system.IsWindows() end

---[SHARED AND MENU] Returns the synchronized Steam time. This is the number of seconds since the [Unix epoch](http://en.wikipedia.org/wiki/Unix_time).
---
--- This function does not work on Dedicated Servers and will instead return no value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.SteamTime)
---@return number # Current Steam-synchronized Unix time.
function system.SteamTime() end

---[SHARED AND MENU] Returns the amount of seconds since the Steam user last moved their mouse.
---
--- This is a direct binding to ISteamUtils->GetSecondsSinceComputerActive, and is most likely related to Steam's automatic "Away" online status.
---
--- This function does not work on Dedicated Servers and will instead return no value.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/system.UpTime)
---@return number # The amount of seconds since the Steam user last moved their mouse.
function system.UpTime() end
