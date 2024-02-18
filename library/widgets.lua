---@meta

--- The widgets library.
---
--- Widgets allow the player to have mouse interaction with entities, such as being able to manipulate the [bones of an NPC](https://www.youtube.com/watch?v=O3gG0t39-pQ).
widgets = {}

---[SHARED] Automatically called to update all widgets.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/widgets.PlayerTick)
---@param ply Player The player
---@param mv CMoveData Player move data
function widgets.PlayerTick(ply, mv) end

---[CLIENT] Renders a widget. Normally you won't need to call this.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/widgets.RenderMe)
---@param ent Entity Widget entity to render
function widgets.RenderMe(ent) end
