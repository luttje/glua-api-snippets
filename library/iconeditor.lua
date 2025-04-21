---@meta

--- An icon editor that permits a user to modify a [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon) and re-render it. This is used by the spawn menu and is what is shown when you right-click an icon and select `Edit Icon`.
---
--- This makes use of the [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel) element.
---
--- **NOTE**: This panel is only available in Sandbox and Sandbox derived gamemodes!
---@class IconEditor : DFrame
local IconEditor = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Applies the top-down view camera settings for the model in the [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel).
---
--- Called when a user clicks the `Above` (third) button (See [IconEditor](https://wiki.facepunch.com/gmod/IconEditor)).
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:AboveLayout)
function IconEditor:AboveLayout() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Applies the best camera settings for the model in the [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel), using the values returned by [Global.PositionSpawnIcon](https://wiki.facepunch.com/gmod/Global.PositionSpawnIcon).
---
--- Called when a user clicks the `wand` button (See the ) and when [IconEditor:Refresh](https://wiki.facepunch.com/gmod/IconEditor:Refresh) is called.
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:BestGuessLayout)
function IconEditor:BestGuessLayout() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Fills the [DListView](https://wiki.facepunch.com/gmod/DListView) on the left of the editor with the model entity's animation list. Called by [IconEditor:Refresh](https://wiki.facepunch.com/gmod/IconEditor:Refresh).
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:FillAnimations)
---@param ent Entity The entity being rendered within the model panel.
function IconEditor:FillAnimations(ent) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Applies the front view camera settings for the model in the [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel).
---
--- Called when a user clicks the `Front` (second) button (See the ).
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:FullFrontalLayout)
function IconEditor:FullFrontalLayout() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Places the camera at the origin (0,0,0), relative to the entity, in the [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel).
---
--- Called when a user clicks the `Center` (fifth) button (See the ).
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:OriginLayout)
function IconEditor:OriginLayout() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Updates the internal [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel) and [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon).
---
--- This should be called immediately after setting the SpawnIcon with [IconEditor:SetIcon](https://wiki.facepunch.com/gmod/IconEditor:SetIcon).
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:Refresh)
function IconEditor:Refresh() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Re-renders the [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon).
---
--- Called when a user clicks the `RENDER` button, this retrieves the render data from the internal [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel) and passes it as a table to [Panel:RebuildSpawnIconEx](https://wiki.facepunch.com/gmod/Panel:RebuildSpawnIconEx).
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:RenderIcon)
function IconEditor:RenderIcon() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Applies the right side view camera settings for the model in the [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel).
---
--- Called when a user clicks the `Right` (fourth) button (See the ). (Note: The icon for this points left.)
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:RightLayout)
function IconEditor:RightLayout() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Sets up the default ambient and directional lighting for the [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel). Called by [IconEditor:Refresh](https://wiki.facepunch.com/gmod/IconEditor:Refresh).
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:SetDefaultLighting)
function IconEditor:SetDefaultLighting() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the editor's model and icon from an entity. Alternative to [IconEditor:SetIcon](https://wiki.facepunch.com/gmod/IconEditor:SetIcon), with uses a [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon).
---
--- You do not need to call [IconEditor:Refresh](https://wiki.facepunch.com/gmod/IconEditor:Refresh) after this.
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:SetFromEntity)
---@param ent Entity The entity to retrieve the model and skin from.
function IconEditor:SetFromEntity(ent) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the [SpawnIcon](https://wiki.facepunch.com/gmod/SpawnIcon) to modify. You should call [Panel:Refresh](https://wiki.facepunch.com/gmod/Panel:Refresh) immediately after this, as the user will not be able to make changes to the icon beforehand.
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:SetIcon)
---@param icon Panel The SpawnIcon object to be modified.
function IconEditor:SetIcon(icon) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Updates the entity being rendered in the internal [DAdjustableModelPanel](https://wiki.facepunch.com/gmod/DAdjustableModelPanel). Called by the model panel's [DModelPanel:LayoutEntity](https://wiki.facepunch.com/gmod/DModelPanel:LayoutEntity) method.
---
---[View wiki](https://wiki.facepunch.com/gmod/IconEditor:UpdateEntity)
---@param ent Entity The entity being rendered within the model panel.
function IconEditor:UpdateEntity(ent) end
