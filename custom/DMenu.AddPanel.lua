---[CLIENT] Adds a panel to the DMenu as if it were an option.
--- 
--- This invokes DScrollPanel:AddItem and will not create a new panel if a class name is passed, unlike Panel:Add.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DMenu:AddPanel)
---@generic T : Panel
---@param pnl `T` The panel that you want to add.
function DMenu:AddPanel(pnl) end
