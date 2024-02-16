---@meta

--- A progressbar, works with a fraction between 0 and 1 where 0 is 0% and 1 is 100%.Creates a DProgress set to 75% (0.75 out of 1)
---@class DProgress : Panel
local DProgress = {}

---[CLIENT AND MENU] Returns the progress bar's fraction. 0 is 0% and 1 is 100%.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProgress:GetFraction)
---@return number # Current fraction of the progress bar.
function DProgress:GetFraction() end

---[CLIENT AND MENU] Sets the fraction of the progress bar. 0 is 0% and 1 is 100%.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DProgress:SetFraction)
---@param fraction number Fraction of the progress bar. Range is 0 to 1 (0% to 100%).
function DProgress:SetFraction(fraction) end
