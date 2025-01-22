---@meta

--- The widgets library.
---
--- Widgets allow the player to have mouse interaction with entities, such as being able to manipulate the [bones of an NPC](https://www.youtube.com/watch?v=O3gG0t39-pQ).
widgets = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Automatically called to update all widgets.
---
---[View wiki](https://wiki.facepunch.com/gmod/widgets.PlayerTick)
---@param ply Player The player
---@param mv CMoveData Player move data
function widgets.PlayerTick(ply, mv) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renders a widget. Normally you won't need to call this.
---
---[View wiki](https://wiki.facepunch.com/gmod/widgets.RenderMe)
---@param ent Entity Widget entity to render
function widgets.RenderMe(ent) end
