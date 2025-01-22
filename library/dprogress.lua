---@meta

--- A progressbar, works with a fraction between 0 and 1 where 0 is 0% and 1 is 100%.
---@class DProgress : Panel
local DProgress = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the progress bar's fraction. 0 is 0% and 1 is 100%.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProgress:GetFraction)
---@return number # Current fraction of the progress bar.
function DProgress:GetFraction() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the fraction of the progress bar. 0 is 0% and 1 is 100%.
---
---[View wiki](https://wiki.facepunch.com/gmod/DProgress:SetFraction)
---@param fraction number Fraction of the progress bar. Range is 0 to 1 (0% to 100%).
function DProgress:SetFraction(fraction) end
