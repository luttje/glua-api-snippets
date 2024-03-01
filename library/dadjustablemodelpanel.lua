---@meta

---
--- A derivative of the DModelPanel in which the user may modify the perspective of the model with their mouse and keyboard by clicking and dragging.
---
--- The keyboard keys W S A D Up Down Left Right Space and Ctrl can be used when the right mouse is held down, with Shift acting as a speed multiplier. When the left mouse is used, the Shift key holds the current `y` angle steady.
---
--- This is used by IconEditor for modifying spawn icons.
--- 	 Code used to create the example for `derma_controls` concmd
---@class DAdjustableModelPanel : DModelPanel
local DAdjustableModelPanel = {}

---[CLIENT] Used by the panel to perform mouse capture operations when adjusting the model.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:CaptureMouse)
function DAdjustableModelPanel:CaptureMouse() end

---[CLIENT] Used to adjust the perspective in the model panel via the keyboard, when the right mouse button is used.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:FirstPersonControls)
function DAdjustableModelPanel:FirstPersonControls() end

---[CLIENT] Gets whether mouse and keyboard-based adjustment of the perspective has been enabled. See DAdjustableModelPanel:SetFirstPerson for more information.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:GetFirstPerson)
---@return boolean # Whether first person controls are enabled. See DAdjustableModelPanel:FirstPersonControls.
function DAdjustableModelPanel:GetFirstPerson() end

---[CLIENT] Enables mouse and keyboard-based adjustment of the perspective.
---
--- This is set to `true` automatically each time mouse capture is enabled, and hence doesn't serve as a usable setting, other than to disable this functionality after the PANEL:OnMousePressed event.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:SetFirstPerson)
---@param enable boolean Whether to enable/disable first person controls. See DAdjustableModelPanel:FirstPersonControls.
function DAdjustableModelPanel:SetFirstPerson(enable) end
