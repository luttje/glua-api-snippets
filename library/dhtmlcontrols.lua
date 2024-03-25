---@meta

--- An element providing navigation controls for a [DHTML](https://wiki.facepunch.com/gmod/DHTML) window.
---@class DHTMLControls : Panel
local DHTMLControls = {}

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:FinishedLoading)
function DHTMLControls:FinishedLoading() end

---[CLIENT AND MENU] Sets the color of the navigation buttons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:SetButtonColor)
---@param clr table A Color
function DHTMLControls:SetButtonColor(clr) end

---[CLIENT AND MENU] Sets the [DHTML](https://wiki.facepunch.com/gmod/DHTML) element to control with these [DHTMLControls](https://wiki.facepunch.com/gmod/DHTMLControls).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:SetHTML)
---@param dhtml Panel The HTML panel
function DHTMLControls:SetHTML(dhtml) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:StartedLoading)
function DHTMLControls:StartedLoading() end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Basically adds an URL to the history.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateHistory)
---@param url string
function DHTMLControls:UpdateHistory(url) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateNavButtonStatus)
function DHTMLControls:UpdateNavButtonStatus() end
