---@meta

---@class DHTMLControls : Panel
local DHTMLControls = {}

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:FinishedLoading)
function DHTMLControls:FinishedLoading() end

---[CLIENT] Sets the color of the navigation buttons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:SetButtonColor)
---@param clr table A Color
function DHTMLControls:SetButtonColor(clr) end

---[CLIENT] Sets the DHTML element to control with these DHTMLControls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:SetHTML)
---@param dhtml Panel The HTML panel
function DHTMLControls:SetHTML(dhtml) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:StartedLoading)
function DHTMLControls:StartedLoading() end

---[CLIENT] Basically adds an URL to the history.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateHistory)
---@param url string
function DHTMLControls:UpdateHistory(url) end

---[CLIENT]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTMLControls:UpdateNavButtonStatus)
function DHTMLControls:UpdateNavButtonStatus() end
