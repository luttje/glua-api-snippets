---@meta

--- An element providing navigation controls for a [DHTML](https://wiki.facepunch.com/gmod/DHTML) window.
---@class DHTMLControls : Panel
local DHTMLControls = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTMLControls:FinishedLoading)
function DHTMLControls:FinishedLoading() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the color of the navigation buttons.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTMLControls:SetButtonColor)
---@param clr table A Color
function DHTMLControls:SetButtonColor(clr) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the [DHTML](https://wiki.facepunch.com/gmod/DHTML) element to control with these [DHTMLControls](https://wiki.facepunch.com/gmod/DHTMLControls).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTMLControls:SetHTML)
---@param dhtml Panel The HTML panel
function DHTMLControls:SetHTML(dhtml) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTMLControls:StartedLoading)
function DHTMLControls:StartedLoading() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Basically adds an URL to the history.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateHistory)
---@param url string
function DHTMLControls:UpdateHistory(url) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateNavButtonStatus)
function DHTMLControls:UpdateNavButtonStatus() end
