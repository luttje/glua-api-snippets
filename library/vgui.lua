---@meta

--- The **vgui** library allows you to script and create your own panels using **V**alve's **G**raphical **U**ser **I**nterface (VGUI) system.
---
--- For an alphabetically ordered list of VGUI panels, see [VGUI Element List](https://wiki.facepunch.com/gmod/VGUI_Element_List).
vgui = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a panel by the specified classname.
--- **NOTE**: Custom VGUI elements are not loaded instantly. Use [GM:OnGamemodeLoaded](https://wiki.facepunch.com/gmod/GM:OnGamemodeLoaded) to create them on startup.
---
---[View wiki](https://wiki.facepunch.com/gmod/vgui.Create)
---@param classname string Classname of the panel to create.
---
--- Default panel classnames can be found on the VGUI Element List.
---
--- New panels can be registered via vgui.Register
---@param parent? Panel Panel to parent to.
---@param name? string Custom name of the created panel for scripting/debugging purposes. Can be retrieved with Panel:GetName.
---@return Panel # The created panel, or `nil` if creation failed for whatever reason.
---@overload fun(classname: "AchievementIcon", parent?: Panel, name?: string): AchievementIcon
---@overload fun(classname: "AvatarImage", parent?: Panel, name?: string): AvatarImage
---@overload fun(classname: "Awesomium", parent?: Panel, name?: string): Awesomium
---@overload fun(classname: "Button", parent?: Panel, name?: string): Button
---@overload fun(classname: "CheckButton", parent?: Panel, name?: string): CheckButton
---@overload fun(classname: "ContentHeader", parent?: Panel, name?: string): ContentHeader
---@overload fun(classname: "ContentIcon", parent?: Panel, name?: string): ContentIcon
---@overload fun(classname: "ContentSidebar", parent?: Panel, name?: string): ContentSidebar
---@overload fun(classname: "ContentSidebarToolbox", parent?: Panel, name?: string): ContentSidebarToolbox
---@overload fun(classname: "ContextBase", parent?: Panel, name?: string): ContextBase
---@overload fun(classname: "ControlPanel", parent?: Panel, name?: string): ControlPanel
---@overload fun(classname: "ControlPresets", parent?: Panel, name?: string): ControlPresets
---@overload fun(classname: "CtrlListBox", parent?: Panel, name?: string): CtrlListBox
---@overload fun(classname: "CtrlNumPad", parent?: Panel, name?: string): CtrlNumPad
---@overload fun(classname: "DAdjustableModelPanel", parent?: Panel, name?: string): DAdjustableModelPanel
---@overload fun(classname: "DAlphaBar", parent?: Panel, name?: string): DAlphaBar
---@overload fun(classname: "DBinder", parent?: Panel, name?: string): DBinder
---@overload fun(classname: "DBubbleContainer", parent?: Panel, name?: string): DBubbleContainer
---@overload fun(classname: "DButton", parent?: Panel, name?: string): DButton
---@overload fun(classname: "DCategoryHeader", parent?: Panel, name?: string): DCategoryHeader
---@overload fun(classname: "DCategoryList", parent?: Panel, name?: string): DCategoryList
---@overload fun(classname: "DCheckBox", parent?: Panel, name?: string): DCheckBox
---@overload fun(classname: "DCheckBoxLabel", parent?: Panel, name?: string): DCheckBoxLabel
---@overload fun(classname: "DCollapsibleCategory", parent?: Panel, name?: string): DCollapsibleCategory
---@overload fun(classname: "DColorButton", parent?: Panel, name?: string): DColorButton
---@overload fun(classname: "DColorCombo", parent?: Panel, name?: string): DColorCombo
---@overload fun(classname: "DColorCube", parent?: Panel, name?: string): DColorCube
---@overload fun(classname: "DColorMixer", parent?: Panel, name?: string): DColorMixer
---@overload fun(classname: "DColorPalette", parent?: Panel, name?: string): DColorPalette
---@overload fun(classname: "DColumnSheet", parent?: Panel, name?: string): DColumnSheet
---@overload fun(classname: "DComboBox", parent?: Panel, name?: string): DComboBox
---@overload fun(classname: "DDragBase", parent?: Panel, name?: string): DDragBase
---@overload fun(classname: "DDrawer", parent?: Panel, name?: string): DDrawer
---@overload fun(classname: "DEntityProperties", parent?: Panel, name?: string): DEntityProperties
---@overload fun(classname: "DExpandButton", parent?: Panel, name?: string): DExpandButton
---@overload fun(classname: "DFileBrowser", parent?: Panel, name?: string): DFileBrowser
---@overload fun(classname: "DForm", parent?: Panel, name?: string): DForm
---@overload fun(classname: "DFrame", parent?: Panel, name?: string): DFrame
---@overload fun(classname: "DGrid", parent?: Panel, name?: string): DGrid
---@overload fun(classname: "DHScrollBar", parent?: Panel, name?: string): DHScrollBar
---@overload fun(classname: "DHTML", parent?: Panel, name?: string): DHTML
---@overload fun(classname: "DHTMLControls", parent?: Panel, name?: string): DHTMLControls
---@overload fun(classname: "DHorizontalDivider", parent?: Panel, name?: string): DHorizontalDivider
---@overload fun(classname: "DHorizontalScroller", parent?: Panel, name?: string): DHorizontalScroller
---@overload fun(classname: "DIconBrowser", parent?: Panel, name?: string): DIconBrowser
---@overload fun(classname: "DIconLayout", parent?: Panel, name?: string): DIconLayout
---@overload fun(classname: "DImage", parent?: Panel, name?: string): DImage
---@overload fun(classname: "DImageButton", parent?: Panel, name?: string): DImageButton
---@overload fun(classname: "DKillIcon", parent?: Panel, name?: string): DKillIcon
---@overload fun(classname: "DLabel", parent?: Panel, name?: string): DLabel
---@overload fun(classname: "DLabelEditable", parent?: Panel, name?: string): DLabelEditable
---@overload fun(classname: "DLabelURL", parent?: Panel, name?: string): DLabelURL
---@overload fun(classname: "DListBox", parent?: Panel, name?: string): DListBox
---@overload fun(classname: "DListBoxItem", parent?: Panel, name?: string): DListBoxItem
---@overload fun(classname: "DListLayout", parent?: Panel, name?: string): DListLayout
---@overload fun(classname: "DListView", parent?: Panel, name?: string): DListView
---@overload fun(classname: "DListViewHeaderLabel", parent?: Panel, name?: string): DListViewHeaderLabel
---@overload fun(classname: "DListViewLabel", parent?: Panel, name?: string): DListViewLabel
---@overload fun(classname: "DListViewLine", parent?: Panel, name?: string): DListViewLine
---@overload fun(classname: "DListView_Column", parent?: Panel, name?: string): DListView_Column
---@overload fun(classname: "DListView_ColumnPlain", parent?: Panel, name?: string): DListView_ColumnPlain
---@overload fun(classname: "DListView_DraggerBar", parent?: Panel, name?: string): DListView_DraggerBar
---@overload fun(classname: "DListView_Line", parent?: Panel, name?: string): DListView_Line
---@overload fun(classname: "DMenu", parent?: Panel, name?: string): DMenu
---@overload fun(classname: "DMenuBar", parent?: Panel, name?: string): DMenuBar
---@overload fun(classname: "DMenuOption", parent?: Panel, name?: string): DMenuOption
---@overload fun(classname: "DMenuOptionCVar", parent?: Panel, name?: string): DMenuOptionCVar
---@overload fun(classname: "DModelPanel", parent?: Panel, name?: string): DModelPanel
---@overload fun(classname: "DModelSelect", parent?: Panel, name?: string): DModelSelect
---@overload fun(classname: "DModelSelectMulti", parent?: Panel, name?: string): DModelSelectMulti
---@overload fun(classname: "DNotify", parent?: Panel, name?: string): DNotify
---@overload fun(classname: "DNumPad", parent?: Panel, name?: string): DNumPad
---@overload fun(classname: "DNumSlider", parent?: Panel, name?: string): DNumSlider
---@overload fun(classname: "DNumberScratch", parent?: Panel, name?: string): DNumberScratch
---@overload fun(classname: "DNumberWang", parent?: Panel, name?: string): DNumberWang
---@overload fun(classname: "DPanPanel", parent?: Panel, name?: string): DPanPanel
---@overload fun(classname: "DPanel", parent?: Panel, name?: string): DPanel
---@overload fun(classname: "DPanelList", parent?: Panel, name?: string): DPanelList
---@overload fun(classname: "DPanelOverlay", parent?: Panel, name?: string): DPanelOverlay
---@overload fun(classname: "DPanelSelect", parent?: Panel, name?: string): DPanelSelect
---@overload fun(classname: "DProgress", parent?: Panel, name?: string): DProgress
---@overload fun(classname: "DProperties", parent?: Panel, name?: string): DProperties
---@overload fun(classname: "DPropertySheet", parent?: Panel, name?: string): DPropertySheet
---@overload fun(classname: "DProperty_Boolean", parent?: Panel, name?: string): DProperty_Boolean
---@overload fun(classname: "DProperty_Combo", parent?: Panel, name?: string): DProperty_Combo
---@overload fun(classname: "DProperty_Entity", parent?: Panel, name?: string): DProperty_Entity
---@overload fun(classname: "DProperty_Float", parent?: Panel, name?: string): DProperty_Float
---@overload fun(classname: "DProperty_Generic", parent?: Panel, name?: string): DProperty_Generic
---@overload fun(classname: "DProperty_Int", parent?: Panel, name?: string): DProperty_Int
---@overload fun(classname: "DProperty_VectorColor", parent?: Panel, name?: string): DProperty_VectorColor
---@overload fun(classname: "DRGBPicker", parent?: Panel, name?: string): DRGBPicker
---@overload fun(classname: "DScrollBarGrip", parent?: Panel, name?: string): DScrollBarGrip
---@overload fun(classname: "DScrollPanel", parent?: Panel, name?: string): DScrollPanel
---@overload fun(classname: "DShape", parent?: Panel, name?: string): DShape
---@overload fun(classname: "DSizeToContents", parent?: Panel, name?: string): DSizeToContents
---@overload fun(classname: "DSlider", parent?: Panel, name?: string): DSlider
---@overload fun(classname: "DSprite", parent?: Panel, name?: string): DSprite
---@overload fun(classname: "DTab", parent?: Panel, name?: string): DTab
---@overload fun(classname: "DTextEntry", parent?: Panel, name?: string): DTextEntry
---@overload fun(classname: "DTileLayout", parent?: Panel, name?: string): DTileLayout
---@overload fun(classname: "DTooltip", parent?: Panel, name?: string): DTooltip
---@overload fun(classname: "DTree", parent?: Panel, name?: string): DTree
---@overload fun(classname: "DTree_Node", parent?: Panel, name?: string): DTree_Node
---@overload fun(classname: "DTree_Node_Button", parent?: Panel, name?: string): DTree_Node_Button
---@overload fun(classname: "DVScrollBar", parent?: Panel, name?: string): DVScrollBar
---@overload fun(classname: "DVerticalDivider", parent?: Panel, name?: string): DVerticalDivider
---@overload fun(classname: "EditablePanel", parent?: Panel, name?: string): EditablePanel
---@overload fun(classname: "FingerVar", parent?: Panel, name?: string): FingerVar
---@overload fun(classname: "Frame", parent?: Panel, name?: string): Frame
---@overload fun(classname: "HTML", parent?: Panel, name?: string): HTML
---@overload fun(classname: "IconEditor", parent?: Panel, name?: string): IconEditor
---@overload fun(classname: "ImageCheckBox", parent?: Panel, name?: string): ImageCheckBox
---@overload fun(classname: "Label", parent?: Panel, name?: string): Label
---@overload fun(classname: "MatSelect", parent?: Panel, name?: string): MatSelect
---@overload fun(classname: "Material", parent?: Panel, name?: string): Material
---@overload fun(classname: "ModelImage", parent?: Panel, name?: string): ModelImage
---@overload fun(classname: "PanelList", parent?: Panel, name?: string): PanelList
---@overload fun(classname: "PresetEditor", parent?: Panel, name?: string): PresetEditor
---@overload fun(classname: "PropSelect", parent?: Panel, name?: string): PropSelect
---@overload fun(classname: "RadioButton", parent?: Panel, name?: string): RadioButton
---@overload fun(classname: "RichText", parent?: Panel, name?: string): RichText
---@overload fun(classname: "SlideBar", parent?: Panel, name?: string): SlideBar
---@overload fun(classname: "Slider", parent?: Panel, name?: string): Slider
---@overload fun(classname: "SpawnIcon", parent?: Panel, name?: string): SpawnIcon
---@overload fun(classname: "SpawnmenuContentPanel", parent?: Panel, name?: string): SpawnmenuContentPanel
---@overload fun(classname: "TGAImage", parent?: Panel, name?: string): TGAImage
---@overload fun(classname: "TextEntry", parent?: Panel, name?: string): TextEntry
---@overload fun(classname: "UGCPublishWindow", parent?: Panel, name?: string): UGCPublishWindow
---@overload fun(classname: "URLLabel", parent?: Panel, name?: string): URLLabel
---@overload fun(classname: "fingerposer", parent?: Panel, name?: string): fingerposer
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
