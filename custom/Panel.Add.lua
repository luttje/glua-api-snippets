---[CLIENT AND MENU] Adds the specified object to the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Add)
---@generic T : Panel
---@param object `T` The panel to be added (parented). Can also be:
--- * string Class Name - creates panel with the specified name and adds it to the panel.
--- * table PANEL table - creates a panel from table and adds it to the panel.
---@return `T` # The added or created panel
function Panel:Add(object) end
