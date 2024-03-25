---@meta

---
--- 		**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 		The panel used internally for tool tips. See [Panel:SetTooltip](https://wiki.facepunch.com/gmod/Panel:SetTooltip).
---
---@class DTooltip : DLabel
local DTooltip = {}

---[CLIENT AND MENU] Forces the tooltip to close. This will remove the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTooltip:Close)
function DTooltip:Close() end

---[CLIENT AND MENU] Used to draw a triangle beneath the [DTooltip](https://wiki.facepunch.com/gmod/DTooltip)
--- **NOTE**: Requires [DTooltip:SetContents](https://wiki.facepunch.com/gmod/DTooltip:SetContents), without this it will error
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTooltip:DrawArrow)
---@param x number arrow location on the x axis
---@param y number arrow location on the y axis
function DTooltip:DrawArrow(x, y) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Sets up the tooltip for display for given panel and starts the timer.
---
--- Normally you wouldn't call this and you'd use [Panel:SetTooltip](https://wiki.facepunch.com/gmod/Panel:SetTooltip), [Panel:SetTooltipPanel](https://wiki.facepunch.com/gmod/Panel:SetTooltipPanel) or [Panel:SetTooltipPanelOverride](https://wiki.facepunch.com/gmod/Panel:SetTooltipPanelOverride).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTooltip:OpenForPanel)
---@param pnl Panel The panel to open the tooltip for.
function DTooltip:OpenForPanel(pnl) end

---[CLIENT AND MENU] **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Positions the [DTooltip](https://wiki.facepunch.com/gmod/DTooltip) so it doesn't stay in the same draw position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTooltip:PositionTooltip)
function DTooltip:PositionTooltip() end

---[CLIENT AND MENU] What Panel you want put inside of the [DTooltip](https://wiki.facepunch.com/gmod/DTooltip)
---
--- **NOTE**: You can only have one Panel at a time; use Parenting to add more
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTooltip:SetContents)
---@param panel Panel Contents
---@param delete? boolean If set to true, the panel in the first argument will be automatically removed when DTooltip is closed via DTooltip:Close.
function DTooltip:SetContents(panel, delete) end
