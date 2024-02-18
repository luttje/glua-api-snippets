---@meta

--- An element providing navigation controls for a DHTML window.
---@class DHTMLControls : Panel
local DHTMLControls = {}

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:FinishedLoading)
function DHTMLControls:FinishedLoading() end

---[CLIENT AND MENU] Sets the color of the navigation buttons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:SetButtonColor)
---@param clr table A Color
function DHTMLControls:SetButtonColor(clr) end

---[CLIENT AND MENU] Sets the DHTML element to control with these DHTMLControls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:SetHTML)
---@param dhtml Panel The HTML panel
function DHTMLControls:SetHTML(dhtml) end

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:StartedLoading)
function DHTMLControls:StartedLoading() end

---[CLIENT AND MENU] Basically adds an URL to the history.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateHistory)
---@param url string
function DHTMLControls:UpdateHistory(url) end

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateNavButtonStatus)
function DHTMLControls:UpdateNavButtonStatus() end
