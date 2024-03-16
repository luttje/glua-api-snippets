---@meta

--- DModelPanel is a VGUI element that projects a 3D model onto a 2D plane. See also DAdjustableModelPanelCreates a DModelPanel and sets its model to your playermodel.Creates a DModelPanel and sets its model to the Alyx playermodel, then changes its player color to red. Also disables default rotation animation.
---@class DModelPanel : DButton
local DModelPanel = {}

---[CLIENT] Used by the DModelPanel's paint hook to draw the model and background.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:DrawModel)
function DModelPanel:DrawModel() end

---[CLIENT] Returns the ambient lighting used on the rendered entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetAmbientLight)
---@return table # The color of the ambient lighting.
function DModelPanel:GetAmbientLight() end

---[CLIENT] Returns whether or not the panel entity should be animated when the default DModelPanel:LayoutEntity function is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetAnimated)
---@return boolean # True if the panel entity can be animated with Entity:SetSequence directly, false otherwise.
function DModelPanel:GetAnimated() end

---[CLIENT] Returns the animation speed of the panel entity, see DModelPanel:SetAnimSpeed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetAnimSpeed)
---@return number # The animation speed.
function DModelPanel:GetAnimSpeed() end

---[CLIENT] Returns the position of the model viewing camera.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetCamPos)
---@return Vector # The position of the camera.
function DModelPanel:GetCamPos() end

---[CLIENT] Returns the color of the rendered entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetColor)
---@return table # The color of the entity, see Color.
function DModelPanel:GetColor() end

---[CLIENT] Returns the entity being rendered by the model panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetEntity)
---@return CSEnt # The rendered entity (client-side)
function DModelPanel:GetEntity() end

---[CLIENT] Returns the FOV (field of view) the camera is using.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetFOV)
---@return number # The FOV of the camera.
function DModelPanel:GetFOV() end

---[CLIENT] Returns the angles of the model viewing camera. Is **nil** until changed with DModelPanel:SetLookAng.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetLookAng)
---@return Angle # The angles of the camera.
function DModelPanel:GetLookAng() end

---[CLIENT] Returns the position the viewing camera is pointing toward.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetLookAt)
---@return Vector # The position the camera is pointing toward.
function DModelPanel:GetLookAt() end

---[CLIENT] Gets the model of the rendered entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:GetModel)
---@return string # The model of the rendered entity.
function DModelPanel:GetModel() end

---[CLIENT] This function is used in DModelPanel:LayoutEntity. It will progress the animation, set using Entity:SetSequence. By default, it is the walking animation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:RunAnimation)
function DModelPanel:RunAnimation() end

---[CLIENT] Sets the ambient lighting used on the rendered entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetAmbientLight)
---@param color table The color of the ambient lighting.
function DModelPanel:SetAmbientLight(color) end

---[CLIENT] Sets whether or not to animate the entity when the default DModelPanel:LayoutEntity is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetAnimated)
---@param animated boolean True to animate, false otherwise.
function DModelPanel:SetAnimated(animated) end

---[CLIENT] Sets the speed used by DModelPanel:RunAnimation to advance frame on an entity sequence.
---
--- Entity:FrameAdvance doesn't seem to have any functioning arguments and therefore changing this will not have any affect on the panel entity's sequence speed without reimplementation. It only affects the value returned by DModelPanel:GetAnimSpeed
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetAnimSpeed)
---@param animSpeed number The animation speed.
function DModelPanel:SetAnimSpeed(animSpeed) end

---[CLIENT] Sets the position of the camera.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetCamPos)
---@param pos Vector The position to set the camera at.
function DModelPanel:SetCamPos(pos) end

---[CLIENT] Sets the color of the rendered entity.
---
--- This does not work on Garry's Mod player models since they use a different color system. To modify a player model color, see Example 2 on the DModelPanel page
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetColor)
---@param color table The render color of the entity.
function DModelPanel:SetColor(color) end

---[CLIENT] Sets the directional lighting used on the rendered entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetDirectionalLight)
---@param direction number The light direction, see Enums/BOX.
---@param color table The color of the directional lighting.
function DModelPanel:SetDirectionalLight(direction, color) end

---[CLIENT] Sets the entity to be rendered by the model panel.
---
--- If you set `ent` to a shared entity you must set `ent` to nil before removing this panel or else a "Trying to remove server entity on client!" error is thrown
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetEntity)
---@param ent Entity The new panel entity.
function DModelPanel:SetEntity(ent) end

---[CLIENT] Sets the panel camera's FOV (field of view).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetFOV)
---@param fov number The field of view value.
function DModelPanel:SetFOV(fov) end

---[CLIENT] Sets the angles of the camera.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetLookAng)
---@param ang Angle The angles to set the camera to.
function DModelPanel:SetLookAng(ang) end

---[CLIENT] Makes the panel's camera face the given position. Basically sets the camera's angles (DModelPanel:SetLookAng) after doing some math.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetLookAt)
---@param pos Vector The position to orient the camera toward.
function DModelPanel:SetLookAt(pos) end

---[CLIENT] Sets the model of the rendered entity.
---
--- 	This function may give a different model than expected. This is not a bug, however this problem may appear with some player models which are renamed several times in a wrong way. To solve that, you can use Entity:SetModel and Entity:SetModelName on the internal panel entity. More information : https://github.com/Facepunch/garrysmod-issues/issues/4534.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:SetModel)
---@param model string The model to apply to the entity.
function DModelPanel:SetModel(model) end

---[CLIENT] Runs a Global.ClientsideScene on the panel's entity.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DModelPanel:StartScene)
---@param path string The path to the scene file. (.vcd)
function DModelPanel:StartScene(path) end
