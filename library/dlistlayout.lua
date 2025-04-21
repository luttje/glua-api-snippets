---@meta

--- A vertical list of panels that optionally allows child elements to be rearranged with the mouse cursor.
---
--- Child panels' widths are set to the width of the DListLayout, and it resizes vertically to accommodate the heights of all children. You can place this inside a [DScrollPanel](https://wiki.facepunch.com/gmod/DScrollPanel) when adding many panels.
---
--- To enable the drag & drop rearrangement functionality, call [DDragBase:MakeDroppable](https://wiki.facepunch.com/gmod/DDragBase:MakeDroppable) on the DListLayout with a unique identifier. All panels added following this will be moveable.
---@class DListLayout : DDragBase
local DListLayout = {}
