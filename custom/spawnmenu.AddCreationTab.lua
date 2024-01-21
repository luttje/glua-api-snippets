---[CLIENT] Inserts a new tab into the CreationMenus table, which will be used by the creation menu to generate its tabs (Spawnlists, Weapons, Entities, etc.)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/spawnmenu.AddCreationTab)
---@generic T : Panel
---@param name string What text will appear on the tab (I.E Spawnlists).
---@param _function fun(): T The function called to generate the content of the tab.
---@param material? string Path to the material that will be used as an icon on the tab.
---@param order? number The order in which this tab should be shown relative to the other tabs on the creation menu.
---@param tooltip? string The tooltip to be shown for this tab.
function spawnmenu.AddCreationTab(name, _function, material, order, tooltip) end
