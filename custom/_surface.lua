---@meta

---[CLIENT AND MENU] Set the color of any future shapes to be drawn, can be set by either using R, G, B, A as separate values or by a Color. Using a color structure is not recommended to be created procedurally.
--- 		Providing a Color structure is slower than providing four numbers. You may use Color:Unpack for this.
--- 		The alpha value may not work properly if you're using a material without `$vertexalpha`.
--- 		Due to post processing and gamma correction the color you set with this function may appear differently when rendered. This problem does not occur on materials drawn with surface.DrawTexturedRect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/surface.SetDrawColor)
---@param color Color The color to set.
function surface.SetDrawColor(color) end

---[CLIENT AND MENU] Set the color of any future text to be drawn, can be set by either using R, G, B, A as separate numbers or by a Color.
---
--- Using a color structure is not recommended to be created procedurally.
--- Providing a Color structure is slower than providing four numbers. You may use Color:Unpack for this.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/surface.SetTextColor)
---@param color Color The color to set.
function surface.SetTextColor(color) end
