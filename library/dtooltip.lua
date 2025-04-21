---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- The panel used internally for tool tips. See [Panel:SetTooltip](https://wiki.facepunch.com/gmod/Panel:SetTooltip).
---@class DTooltip : DLabel
local DTooltip = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Forces the tooltip to close. This will remove the panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTooltip:Close)
function DTooltip:Close() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Used to draw a triangle beneath the [DTooltip](https://wiki.facepunch.com/gmod/DTooltip)
--- **NOTE**: Requires [DTooltip:SetContents](https://wiki.facepunch.com/gmod/DTooltip:SetContents), without this it will error
---
---[View wiki](https://wiki.facepunch.com/gmod/DTooltip:DrawArrow)
---@param x number arrow location on the x axis
---@param y number arrow location on the y axis
function DTooltip:DrawArrow(x, y) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets up the tooltip for display for given panel and starts the timer.
---
--- Normally you wouldn't call this and you'd use [Panel:SetTooltip](https://wiki.facepunch.com/gmod/Panel:SetTooltip), [Panel:SetTooltipPanel](https://wiki.facepunch.com/gmod/Panel:SetTooltipPanel) or [Panel:SetTooltipPanelOverride](https://wiki.facepunch.com/gmod/Panel:SetTooltipPanelOverride).
---
---[View wiki](https://wiki.facepunch.com/gmod/DTooltip:OpenForPanel)
---@param pnl Panel The panel to open the tooltip for.
function DTooltip:OpenForPanel(pnl) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Positions the [DTooltip](https://wiki.facepunch.com/gmod/DTooltip) so it doesn't stay in the same draw position.
---
---[View wiki](https://wiki.facepunch.com/gmod/DTooltip:PositionTooltip)
function DTooltip:PositionTooltip() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) What Panel you want put inside of the [DTooltip](https://wiki.facepunch.com/gmod/DTooltip)
---
--- **NOTE**: You can only have one Panel at a time; use Parenting to add more
---
---[View wiki](https://wiki.facepunch.com/gmod/DTooltip:SetContents)
---@param panel Panel Contents
---@param delete? boolean If set to true, the panel in the first argument will be automatically removed when DTooltip is closed via DTooltip:Close.
function DTooltip:SetContents(panel, delete) end
