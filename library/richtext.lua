---@meta

--- A very versatile text display element that's used to power the default chat and console.
---
--- Rich Text panels allows multicolored, highlight-able, and interactive text using individual text segment markup (segments are defined by the [Panel:AppendText](https://wiki.facepunch.com/gmod/Panel:AppendText) method).
---
--- The **RichText** element has a `64000` character limit.
---
--- You can hide the RichText scrollbar with the following function: [Panel:SetVerticalScrollbarEnabled](https://wiki.facepunch.com/gmod/Panel:SetVerticalScrollbarEnabled)
---@class RichText : Panel
local RichText = {}
