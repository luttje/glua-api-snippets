---@meta

--- A derivative of the DModelPanel in which the user may modify the perspective of the model with their mouse and keyboard by clicking and dragging.
---
--- The keyboard keys W S A D Up Down Left Right Space and Ctrl can be used when the right mouse is held down, with Shift acting as a speed multiplier. When the left mouse is used, the Shift key holds the current `y` angle steady.
---
--- This is used by [IconEditor](https://wiki.facepunch.com/gmod/IconEditor) for modifying spawn icons.
---@class DAdjustableModelPanel : DModelPanel
local DAdjustableModelPanel = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used by the panel to perform mouse capture operations when adjusting the model.
---
---[View wiki](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:CaptureMouse)
function DAdjustableModelPanel:CaptureMouse() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Used to adjust the perspective in the model panel via the keyboard, when the right mouse button is used.
---
---[View wiki](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:FirstPersonControls)
function DAdjustableModelPanel:FirstPersonControls() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets whether mouse and keyboard-based adjustment of the perspective has been enabled. See [DAdjustableModelPanel:SetFirstPerson](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:SetFirstPerson) for more information.
---
--- This is an [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:GetFirstPerson)
---@return boolean # Whether first person controls are enabled. See DAdjustableModelPanel:FirstPersonControls.
function DAdjustableModelPanel:GetFirstPerson() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the movement speed multiplier set by [DAdjustableModelPanel:SetMovementScale](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:SetMovementScale).
---
--- 	An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:GetMovementScale)
---@return number # The movement scale, where `1` is normal, `2` is double, etc.
function DAdjustableModelPanel:GetMovementScale() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Enables mouse and keyboard-based adjustment of the perspective.
---
--- This is set to `true` automatically each time mouse capture is enabled, and hence doesn't serve as a usable setting, other than to disable this functionality after the [PANEL:OnMousePressed](https://wiki.facepunch.com/gmod/PANEL:OnMousePressed) event.
---
--- An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc)
---
---[View wiki](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:SetFirstPerson)
---@param enable boolean Whether to enable/disable first person controls. See DAdjustableModelPanel:FirstPersonControls.
function DAdjustableModelPanel:SetFirstPerson(enable) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets the movement speed multiplier. Currently this only affects first person camera controls.
---
---[View wiki](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:SetMovementScale)
---@param number number The movement scale, where `1` is normal, `2` is double, etc.
function DAdjustableModelPanel:SetMovementScale(number) end
