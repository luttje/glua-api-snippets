---@meta

--- Used to display notifications on the screen (mid-right).
notification = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a standard notification to your screen.
---
---[View wiki](https://wiki.facepunch.com/gmod/notification.AddLegacy)
---@param text string The text to display.
---@param type number Determines the notification method (e.g. icon) for displaying the notification. See the Enums/NOTIFY.
---@param length number The number of seconds to display the notification for.
function notification.AddLegacy(text, type, length) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a notification with an animated progress bar.
---
---[View wiki](https://wiki.facepunch.com/gmod/notification.AddProgress)
---@param id any Can be any type. It's used as an index.
---@param strText string The text to show
---@param frac? number If set, overrides the progress bar animation with given percentage. Range is 0 to 1.
function notification.AddProgress(id, strText, frac) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Removes the notification after 0.8 seconds.
---
---[View wiki](https://wiki.facepunch.com/gmod/notification.Kill)
---@param uid any The unique ID of the notification
function notification.Kill(uid) end
