---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a panel by the specified classname.
--- Custom VGUI elements are not loaded instantly. Use GM:OnGamemodeLoaded to create them on startup.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.Create)
---@generic T: Panel
---@param classname `T` Classname of the panel to create.
---
--- Default panel classnames can be found on the VGUI Element List.
---
--- New panels can be registered via vgui.Register
---
---@param parent Panel? Panel to parent to.
---@param name string? Custom name of the created panel for scripting/debugging purposes. Can be retrieved with Panel:GetName.
---@return T #The created panel, or `nil` if creation failed for whatever reason.
function vgui.Create(classname, parent, name) end
