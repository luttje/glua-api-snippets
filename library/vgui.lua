---@meta

--- The **vgui** library allows you to script and create your own panels using **V**alve's **G**raphical **U**ser **I**nterface (VGUI) system.
---
--- For an alphabetically ordered list of VGUI panels, see [VGUI Element List](https://wiki.facepunch.com/gmod/VGUI_Element_List).
vgui = {}

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

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a panel from a table, used alongside [vgui.RegisterFile](https://wiki.facepunch.com/gmod/vgui.RegisterFile) and [vgui.RegisterTable](https://wiki.facepunch.com/gmod/vgui.RegisterTable) to efficiently define, register, and instantiate custom panels.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.CreateFromTable)
---@param metatable table Your PANEL table.
---@param parent? Panel Which panel to parent the newly created panel to.
---@param name? string Custom name of the created panel for scripting/debugging purposes. Can be retrieved with Panel:GetName.
---@return Panel # The created panel, or `nil` if creation failed for whatever reason.
function vgui.CreateFromTable(metatable, parent, name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Creates an engine panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.CreateX)
---@param class string Class of the panel to create
---@param parent? Panel If specified, parents created panel to given one
---@param name? string Name of the created panel
---@return Panel # Created panel
function vgui.CreateX(class, parent, name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whenever the cursor is currently active and visible.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.CursorVisible)
---@return boolean # Whether the cursor is visible or not.
function vgui.CursorVisible() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns true if Lua-defined panel exists by name. Uses [vgui.GetControlTable](https://wiki.facepunch.com/gmod/vgui.GetControlTable) internally.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.Exists)
---@param Panelname string The name of the panel to get test.
---@return boolean # Whether a panel with given name was registered yet or not.
function vgui.Exists(Panelname) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whether the currently focused panel is a child of the given one.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.FocusedHasParent)
---@param parent Panel The parent panel to check the currently focused one against. This doesn't need to be a direct parent (focused panel can be a child of a child and so on).
---@return boolean # Whether or not the focused panel is a child of the passed one.
function vgui.FocusedHasParent(parent) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns all Lua-created panels.
---
--- Used internally for [PANEL:PreAutoRefresh](https://wiki.facepunch.com/gmod/PANEL:PreAutoRefresh) and [PANEL:PostAutoRefresh](https://wiki.facepunch.com/gmod/PANEL:PostAutoRefresh).
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.GetAll)
---@return Panel[] # List of all Lua created panels.
function vgui.GetAll() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the table of a Lua-defined panel by name. Does not return parent members of the table!
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.GetControlTable)
---@param Panelname string The name of the panel to get the table of.
---@return table # The `PANEL` table of the a Lua-defined panel with given name.
function vgui.GetControlTable(Panelname) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the panel the cursor is hovering above.
---
--- **WARNING**: This returns a cached value that is only updated after rendering and `before` the next VGUI Think/Layout pass.
---
--- ie. it lags one frame behind panel layout and is completely unhelpful for [PANEL:Paint](https://wiki.facepunch.com/gmod/PANEL:Paint) if your panels are moving around under the mouse a lot every frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.GetHoveredPanel)
---@return Panel # The panel that the user is currently hovering over with their cursor.
function vgui.GetHoveredPanel() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the panel which is currently receiving keyboard input.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.GetKeyboardFocus)
---@return Panel # The panel with keyboard focus
function vgui.GetKeyboardFocus() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the global world panel which is the parent to all others, except for the HUD panel.
---
--- See also [Global.GetHUDPanel](https://wiki.facepunch.com/gmod/Global.GetHUDPanel).
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.GetWorldPanel)
---@return Panel # The world panel
function vgui.GetWorldPanel() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whenever the cursor is hovering the world panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.IsHoveringWorld)
---@return boolean # isHoveringWorld
function vgui.IsHoveringWorld() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Registers a panel for later creation via [vgui.Create](https://wiki.facepunch.com/gmod/vgui.Create).
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.Register)
---@param classname string Classname of the panel to register. This is what you will need to pass to vgui.Create's first argument.
---
--- This must be unique, including classnames of entities due to internal usage of baseclass.Set.
---@param panelTable table The table containing the panel information.
---@param baseName? string Classname of a panel to inherit functionality from. Functions with same names will be overwritten preferring the panel that is being registered.
---@return table # The given panel table from second argument
function vgui.Register(classname, panelTable, baseName) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Registers a new [VGUI](https://wiki.facepunch.com/gmod/VGUI) panel from a file, to be used with [vgui.CreateFromTable](https://wiki.facepunch.com/gmod/vgui.CreateFromTable).
---
--- File file must use the `PANEL` global that is provided just before the file is [Global.include](https://wiki.facepunch.com/gmod/Global.include)d, for example:
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
---[View wiki](https://wiki.facepunch.com/gmod/vgui.RegisterFile)
---@param file string The file to register
---@return table # A table containing info about the panel.
function vgui.RegisterFile(file) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Registers a table to use as a panel, to be used with [vgui.CreateFromTable](https://wiki.facepunch.com/gmod/vgui.CreateFromTable).
---
--- All this function does is assigns Base key to your table and returns the table.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.RegisterTable)
---@param panel table The PANEL table.
---@param base? string A base for the panel.
---@return table # The PANEL table
function vgui.RegisterTable(panel, base) end
