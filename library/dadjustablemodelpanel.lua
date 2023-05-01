---@meta

---@class DAdjustableModelPanel
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
---@return boolean Whether first person controls are enabled. See DAdjustableModelPanel:FirstPersonControls.
function DAdjustableModelPanel:GetFirstPerson() end

---[CLIENT] Enables mouse and keyboard-based adjustment of the perspective.
--- 
--- This is set to `true` automatically each time mouse capture is enabled, and hence doesn't serve as a usable setting, other than to disable this functionality after the PANEL:OnMousePressed event.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DAdjustableModelPanel:SetFirstPerson)
---@param enable boolean Whether to enable/disable first person controls. See DAdjustableModelPanel:FirstPersonControls.
function DAdjustableModelPanel:SetFirstPerson(enable) end

