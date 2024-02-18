---@meta

--- The **vgui** library allows you to script and create your own panels using **V**alve's **G**raphical **U**ser **I**nterface (VGUI) system.
---
--- For an alphabetically ordered list of VGUI panels, see VGUI Element List.
vgui = {}

---[CLIENT AND MENU] Creates a panel by the specified classname.
--- Custom VGUI elements are not loaded instantly. Use GM:OnGamemodeLoaded to create them on startup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.Create)
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

---[CLIENT AND MENU] Creates a panel from a table, used alongside vgui.RegisterFile and vgui.RegisterTable to efficiently define, register, and instantiate custom panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.CreateFromTable)
---@param metatable table Your PANEL table.
---@param parent? Panel Which panel to parent the newly created panel to.
---@param name? string Custom name of the created panel for scripting/debugging purposes. Can be retrieved with Panel:GetName.
---@return Panel # The created panel, or `nil` if creation failed for whatever reason.
function vgui.CreateFromTable(metatable, parent, name) end

---[CLIENT AND MENU] Creates an engine panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.CreateX)
---@param class string Class of the panel to create
---@param parent? Panel If specified, parents created panel to given one
---@param name? string Name of the created panel
---@return Panel # Created panel
function vgui.CreateX(class, parent, name) end

---[CLIENT AND MENU] Returns whenever the cursor is currently active and visible.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.CursorVisible)
---@return boolean # Whether the cursor is visible or not.
function vgui.CursorVisible() end

---[CLIENT AND MENU] Returns true if Lua-defined panel exists by name. Uses vgui.GetControlTable internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.Exists)
---@param Panelname string The name of the panel to get test.
---@return boolean # Whether a panel with given name was registered yet or not.
function vgui.Exists(Panelname) end

---[CLIENT AND MENU] Returns whether the currently focused panel is a child of the given one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.FocusedHasParent)
---@param parent Panel The parent panel to check the currently focused one against. This doesn't need to be a direct parent (focused panel can be a child of a child and so on).
---@return boolean # Whether or not the focused panel is a child of the passed one.
function vgui.FocusedHasParent(parent) end

---[CLIENT AND MENU] Returns the table of a Lua-defined panel by name. Does not return parent members of the table!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.GetControlTable)
---@param Panelname string The name of the panel to get the table of.
---@return table # The `PANEL` table of the a Lua-defined panel with given name.
function vgui.GetControlTable(Panelname) end

---[CLIENT AND MENU] Returns the panel the cursor is hovering above.
---
--- This returns a cached value that is only updated after rendering and `before` the next VGUI Think/Layout pass.
---
--- ie. it lags one frame behind panel layout and is completely unhelpful for PANEL:Paint if your panels are moving around under the mouse a lot every frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.GetHoveredPanel)
---@return Panel # The panel that the user is currently hovering over with their cursor.
function vgui.GetHoveredPanel() end

---[CLIENT AND MENU] Returns the panel which is currently receiving keyboard input.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.GetKeyboardFocus)
---@return Panel # The panel with keyboard focus
function vgui.GetKeyboardFocus() end

---[CLIENT AND MENU] Returns the global world panel which is the parent to all others, except for the HUD panel.
---
--- See also Global.GetHUDPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.GetWorldPanel)
---@return Panel # The world panel
function vgui.GetWorldPanel() end

---[CLIENT AND MENU] Returns whenever the cursor is hovering the world panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.IsHoveringWorld)
---@return boolean # isHoveringWorld
function vgui.IsHoveringWorld() end

---[CLIENT AND MENU] Registers a panel for later creation via vgui.Create.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.Register)
---@param classname string Classname of the panel to register. This is what you will need to pass to vgui.Create's first argument.
---@param panelTable table The table containing the panel information.
---@param baseName? string Classname of a panel to inherit functionality from. Functions with same names will be overwritten preferring the panel that is being registered.
---@return table # The given panel table from second argument
function vgui.Register(classname, panelTable, baseName) end

---[CLIENT AND MENU] Registers a new VGUI panel from a file, to be used with vgui.CreateFromTable.
---
--- File file must use the `PANEL` global that is provided just before the file is Global.included, for example:
---
---
--- ```
--- PANEL.Base = "Panel"
---
--- function PANEL:Init()
--- 	-- Your code...
--- end
---
--- function PANEL:Think()
--- 	-- Your code...
--- end
--- ```
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.RegisterFile)
---@param file string The file to register
---@return table # A table containing info about the panel.
function vgui.RegisterFile(file) end

---[CLIENT AND MENU] Registers a table to use as a panel, to be used with vgui.CreateFromTable.
---
--- All this function does is assigns Base key to your table and returns the table.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/vgui.RegisterTable)
---@param panel table The PANEL table.
---@param base? string A base for the panel.
---@return table # The PANEL table
function vgui.RegisterTable(panel, base) end
