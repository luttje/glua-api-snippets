---@meta

--- The halo library is used to draw glowing outlines around entities, an example of this can be seen by picking up props with the physgun in Garry's Mod 13.
halo = {}

---[CLIENT] Applies a halo glow effect to one or multiple entities.
--- Using this function outside of the GM:PreDrawHalos hook can cause instability or crashes.
--- The ignoreZ parameter will cause the halos to draw over the player's viewmodel. You can work around this using render.DepthRange in the GM:PreDrawViewModel, GM:PostDrawViewModel, GM:PreDrawPlayerHands and GM:PostDrawPlayerHands hooks.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/halo.Add)
---@param entities table A table of entities to add the halo effect to.
---@param color table The desired color of the halo. See Color.
---@param blurX? number The strength of the halo's blur on the x axis.
---@param blurY? number The strength of the halo's blur on the y axis.
---@param passes? number The number of times the halo should be drawn per frame. **Increasing this may hinder player FPS**.
---@param additive? boolean Sets the render mode of the halo to additive.
---@param ignoreZ? boolean Renders the halo through anything when set to `true`.
function halo.Add(entities, color, blurX, blurY, passes, additive, ignoreZ) end

---[CLIENT] Renders a halo according to the specified table, only used internally, called from a GM:PostDrawEffects hook added by the halo library.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/halo.Render)
---@param entry table Table with info about the halo to draw.
function halo.Render(entry) end

---[CLIENT] Returns the entity the halo library is currently rendering the halo for.
---
--- The main purpose of this function is to be used in ENTITY:Draw in order not to draw certain parts of the entity when the halo is being rendered, so there's no halo around unwanted entity parts, such as lasers, 3D2D displays, etc.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/halo.RenderedEntity)
---@return Entity # If set, the currently rendered entity by the halo library.
function halo.RenderedEntity() end
