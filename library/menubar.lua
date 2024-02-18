---@meta

--- The menubar library.
menubar = {}

---[CLIENT] Creates the menu bar ( The bar at the top of the screen when holding C or Q in sandbox ) and docks it to the top of the screen. It will not appear.
---
---
--- Calling this multiple times will **NOT** remove previous panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/menubar.Init)
function menubar.Init() end

---[CLIENT] Checks if the supplied panel is parent to the menubar
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/menubar.IsParent)
---@param pnl Panel The panel to check
---@return boolean # Is parent or not
function menubar.IsParent(pnl) end

---[CLIENT] Parents the menubar to the panel and displays the menubar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/menubar.ParentTo)
---@param pnl Panel The panel to parent to
function menubar.ParentTo(pnl) end
