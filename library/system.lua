---@meta

--- The system library provides functions that allow you to gather information about the system running the game, such as operating system, uptime and battery level.
system = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the total uptime of the current application as reported by Steam.
---
--- This will return a similar value to [Global.SysTime](https://wiki.facepunch.com/gmod/Global.SysTime).
---
--- **NOTE**: This function does not work on Dedicated Servers and will instead return no value.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.AppTime)
---@return number # Seconds of game uptime as an integer.
function system.AppTime() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the current battery power.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.BatteryPower)
---@return number # 0-100 if a battery (laptop, UPS, etc) is present.
---
--- Will instead return 255 if plugged in without a battery.
function system.BatteryPower() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Flashes the window, turning the border to white briefly
---
---[View wiki](https://wiki.facepunch.com/gmod/system.FlashWindow)
function system.FlashWindow() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the country code of this computer, determined by the localisation settings of the OS.
---
--- **NOTE**: This function does not work on Dedicated Servers and will instead return no value.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.GetCountry)
---@return string # Two-letter country code, using [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) standard.
function system.GetCountry() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether or not the game window has focus.
---
--- **NOTE**: This function does not work on dedicated servers and will instead return no value.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.HasFocus)
---@return boolean # Whether or not the game window has focus.
function system.HasFocus() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the current OS is Linux.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.IsLinux)
---@return boolean # Whether or not the game is running on Linux.
function system.IsLinux() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the current OS is OSX.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.IsOSX)
---@return boolean # Whether or not the game is running on OSX.
function system.IsOSX() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the game is being run in a window or in fullscreen (you can change this by opening the menu, clicking 'Options', then clicking the 'Video' tab, and changing the Display Mode using the dropdown menu):
---
---[View wiki](https://wiki.facepunch.com/gmod/system.IsWindowed)
---@return boolean # Is the game running in a window?
function system.IsWindowed() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns whether the current OS is Windows.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.IsWindows)
---@return boolean # Whether the system the game runs on is Windows or not.
function system.IsWindows() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the synchronized Steam time. This is the number of seconds since the [Unix epoch](http://en.wikipedia.org/wiki/Unix_time).
---
--- **NOTE**: This function does not work on Dedicated Servers and will instead return no value.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.SteamTime)
---@return number # Current Steam-synchronized Unix time.
function system.SteamTime() end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Returns the amount of seconds since the Steam user last moved their mouse.
---
--- This is a direct binding to ISteamUtils->GetSecondsSinceComputerActive, and is most likely related to Steam's automatic "Away" online status.
---
--- **NOTE**: This function does not work on Dedicated Servers and will instead return no value.
---
---[View wiki](https://wiki.facepunch.com/gmod/system.UpTime)
---@return number # The amount of seconds since the Steam user last moved their mouse.
function system.UpTime() end
