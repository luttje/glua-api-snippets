---@meta

--- The spawnmenu library is a set of functions that allow you to control the spawn (Q) menu.
spawnmenu = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Activates a tool, opens context menu and brings up the tool gun.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.ActivateTool)
---@param tool string Tool class/file name
---@param menu_only? boolean Should we activate this tool in the menu only or also the toolgun? `true` = menu only,`false` = toolgun aswell
function spawnmenu.ActivateTool(tool, menu_only) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Activates tools context menu in specified tool tab.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.ActivateToolPanel)
---@param tab number The tabID of the tab to open the context menu in
---@param cp Panel The control panel to open
function spawnmenu.ActivateToolPanel(tab, cp) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns currently opened control panel of a tool, post process effect or some other menu in spawnmenu.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.ActiveControlPanel)
---@return Panel # The currently opened control panel, if any.
function spawnmenu.ActiveControlPanel() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Registers a new content type that is saveable into spawnlists.
--- Created/called by [spawnmenu.CreateContentIcon](https://wiki.facepunch.com/gmod/spawnmenu.CreateContentIcon).
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.AddContentType)
---@param name string An unique name of the content type.
---@param constructor fun(container: Panel, data: table):(pnl: Panel) A function that is called whenever we need create a new panel for this content type.
---
--- Function argument(s):
--- * Panel `container` - The container/parent of the new panel from spawnmenu.CreateContentIcon
--- * table `data` - Data for the content type passed from spawnmenu.CreateContentIcon.
---
--- Function return value(s):
--- * Panel `pnl` - The created panel
function spawnmenu.AddContentType(name, constructor) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Inserts a new tab into the CreationMenus table, which will be used by the creation menu to generate its tabs (Spawnlists, Weapons, Entities, etc.)
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.AddCreationTab)
---@generic T : Panel
---@param name string What text will appear on the tab (I.E Spawnlists).
---@param _function fun(): T The function called to generate the content of the tab.
---@param material? string Path to the material that will be used as an icon on the tab.
---@param order? number The order in which this tab should be shown relative to the other tabs on the creation menu.
---@param tooltip? string The tooltip to be shown for this tab.
function spawnmenu.AddCreationTab(name, _function, material, order, tooltip) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Used to add addon spawnlists to the spawnmenu tree. This function should be called within [SANDBOX:PopulatePropMenu](https://wiki.facepunch.com/gmod/SANDBOX:PopulatePropMenu).
---
--- Addon spawnlists will not save to disk if edited.
---
--- **WARNING**: You should never try to modify player customized spawnlists!
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.AddPropCategory)
---@param classname string A unique classname of the list.
---@param name string The name of the category displayed to the player, e.g. `Comic Props`.
---@param contents table A table of entries for the spawn menu. It must be numerically indexed.
--[[

Each member of the table is a sub-table containing a type member, and other members depending on the type.

New content types can be added via spawnmenu.AddContentType.

| string type | Description | Other members |
| ------------- | ---------- | ----------------- |
| "header" | a simple header for organization | string text - The text that the header will display |
| "model" | spawns a model where the player is looking | string model - The path to the model file 	 number skin - The skin for the model to use (optional)  string body - The bodygroups for the model (optional)  number wide - The width of the spawnicon (optional)  number tall - The height of the spawnicon (optional) |
| "entity" | spawns an entity where the player is looking(appears in the Entities tab by default) | string spawnname - The filename of the entity, for example "sent_ball"  string nicename - The name of the entity to display  string material - The icon to display, this should be set to `entities/[sent_name].png` 	boolean admin - Whether the entity is only spawnable by admins (optional) |
| "vehicle" | spawns a vehicle where the player is looking  (appears in the Vehicles tab by default) | string spawnname - The filename of the vehicle  string nicename - The name of the vehicle to display  string material - The icon to display  boolean admin - Whether the vehicle is only spawnable by admins (optional) |
| "npc" | spawns an NPC where the player is looking  (appears in the NPCs tab by default) | string spawnname - The spawn name of the NPC 	string nicename - The name to display  string material - The icon to display  table weapon - A table of potential weapons (each a string) to give to the NPC. When spawned, one of these will be chosen randomly each time.  boolean admin - Whether the NPC is only spawnable by admins (optional) |
| "weapon" | When clicked, gives the player a weapon;  When middle-clicked, spawns a weapon where the player is looking  (appears in the Weapons tab by default) |string spawnname - The spawn name of the weapon  string nicename - The name to display  string material - The icon to display  boolean admin - Whether the weapon is only spawnable by admins (optional) | 
--]]
---@param icon string The icon to use in the tree.
---@param id? number The unique ID number for the spawnlist category. Used to make sub categories. See "parentID" parameter below. If not set, it will be automatically set to ever increasing number, starting with 1000.
---@param parentID? number The unique ID of the parent category. This will make the created category a subcategory of category with given unique ID. `0` makes this a base category (such as `Builder`).
---@param needsApp? string The needed game for this prop category, if one is needed. If the specified game is not mounted, the category isn't shown. This uses the shortcut name, e.g. `cstrike`, and not the Steam AppID.
function spawnmenu.AddPropCategory(classname, name, contents, icon, id, parentID, needsApp) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Used to create a new category in the list inside of a spawnmenu ToolTab.
---
--- You must call this function from [SANDBOX:AddToolMenuCategories](https://wiki.facepunch.com/gmod/SANDBOX:AddToolMenuCategories) for it to work properly.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.AddToolCategory)
---@param tab string The ToolTab name, as created with spawnmenu.AddToolTab.
---
--- You can also use the default ToolTab names "Main" and "Utilities".
---@param RealName string The identifier name
---@param PrintName string The displayed name
function spawnmenu.AddToolCategory(tab, RealName, PrintName) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds an option to the right side of the spawnmenu
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.AddToolMenuOption)
---@param tab string The spawnmenu tab to add into (for example "Utilities")
---@param category string The category to add into (for example "Admin")
---@param class string Unique identifier of option to add
---@param name string The nice name of item
---@param cmd string Command to execute when the item is selected
---@param config string Config name, used in older versions to load tool settings UI from a file. No longer works.
---
--- We advise against using this. It may be changed or removed in a future update.
---@param cpanel fun(pnl: Panel) A function to build the context panel.
---
--- Function argument(s):
--- * Panel `pnl` - A DForm that will be shown in the context menu
---@param table? table Allows to override the table that will be added to the tool list. Some of the fields will be overwritten by this function.
function spawnmenu.AddToolMenuOption(tab, category, class, name, cmd, config, cpanel, table) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a new tool tab to the right side of the spawnmenu via the [SANDBOX:AddToolMenuTabs](https://wiki.facepunch.com/gmod/SANDBOX:AddToolMenuTabs) hook.
---
--- This function is a inferior duplicate of [spawnmenu.GetToolMenu](https://wiki.facepunch.com/gmod/spawnmenu.GetToolMenu), just without its return value.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.AddToolTab)
---@param name string The internal name of the tab. This is used for sorting.
---@param label? string The 'nice' name of the tab (Tip: language.Add)
---@param icon? string The filepath to the icon of the tab. Should be a .png
function spawnmenu.AddToolTab(name, label, icon) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Clears all the tools from the different tool categories and the categories itself, if ran at the correct place.
---
--- Seems to only work when ran at initialization.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.ClearToolMenus)
function spawnmenu.ClearToolMenus() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a new [ContentIcon](https://wiki.facepunch.com/gmod/ContentIcon) previously defined via [spawnmenu.AddContentType](https://wiki.facepunch.com/gmod/spawnmenu.AddContentType).
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.CreateContentIcon)
---@param type string The type of the content icon.
---
--- Default content types are:
--- * model
---
--- Sandbox only content types:
--- * tool
--- * header
--- * entity
--- * vehicle
--- * npc
--- * weapon
--- * postprocess
---@param parent? Panel The parent to add the ContentIcon to.
---@param data table The data to send to the content icon in spawnmenu.AddContentType. Data required will depend on the content type.
---@return Panel # The created ContentIcon, if it was returned by spawnmenu.AddContentType.
function spawnmenu.CreateContentIcon(type, parent, data) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Calls [spawnmenu.SaveToTextFiles](https://wiki.facepunch.com/gmod/spawnmenu.SaveToTextFiles).
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.DoSaveToTextFiles)
---@param spawnlists table A table containing spawnlists.
function spawnmenu.DoSaveToTextFiles(spawnlists) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the function to create an vgui element for a specified content type, previously defined by [spawnmenu.AddContentType](https://wiki.facepunch.com/gmod/spawnmenu.AddContentType).
---
--- If a content type doesn't exist, a dummy function will be returned, and a warning printed to the console.
---
--- You probably want to use [spawnmenu.CreateContentIcon](https://wiki.facepunch.com/gmod/spawnmenu.CreateContentIcon) to create icons.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.GetContentType)
---@param contentType string The content type name.
---@return fun(container: Panel, data: table):(pnl: Panel) # The panel creation function.
---
--- Function argument(s):
--- * Panel `container` - The container panel to parent the created icon to.
--- * table `data` - Data for the content type passed from spawnmenu.CreateContentIcon.
---
--- Function return value(s):
--- * Panel `pnl` - The created panel
function spawnmenu.GetContentType(contentType) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns the list of Creation tabs. Creation tabs are added via [spawnmenu.AddCreationTab](https://wiki.facepunch.com/gmod/spawnmenu.AddCreationTab).
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.GetCreationTabs)
---@return table # The list of Creation tabs. See the Structures/CreationMenus.
function spawnmenu.GetCreationTabs() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Similar to [spawnmenu.GetPropTable](https://wiki.facepunch.com/gmod/spawnmenu.GetPropTable), but only returns spawnlists created by addons via [spawnmenu.AddPropCategory](https://wiki.facepunch.com/gmod/spawnmenu.AddPropCategory).
---
--- These spawnlists are shown in a separate menu in-game.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.GetCustomPropTable)
---@return table # See spawnmenu.GetPropTable for table format.
function spawnmenu.GetCustomPropTable() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a table of all prop categories and their props in the spawnmenu.
---
--- Note that if the spawnmenu has not been populated, this will return an empty table.
---
--- This will not return spawnlists created by addons, see  [spawnmenu.GetCustomPropTable](https://wiki.facepunch.com/gmod/spawnmenu.GetCustomPropTable) for that.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.GetPropTable)
---@return table # Table of all the prop categories and props in the following format:
---
--- ```
--- {
--- 	["settings/spawnlist/001-construction props.txt"] = {
--- 		name = "Construction Props",
--- 		icon = "icon16/page.png",
--- 		id = 1,
--- 		parentid = 0,
--- 		needsapp = "",
--- 		contents = {
--- 			{
--- 				model = "models/Cranes/crane_frame.mdl",
--- 				type = "model"
--- 			}
--- 			-- etc.
--- 		},
--- 	}
--- 	-- etc.
--- }
--- ```
function spawnmenu.GetPropTable() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a new tool tab (or returns an existing one by name) to the right side of the spawnmenu via the [SANDBOX:AddToolMenuTabs](https://wiki.facepunch.com/gmod/SANDBOX:AddToolMenuTabs) hook.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.GetToolMenu)
---@param name string The internal name of the tab. This is used for sorting.
---@param label? string The 'nice' name of the tab
---@param icon? string The filepath to the icon of the tab. Should be a .png
---@return table # A table of tables representing categories and items in the left part of the tab. See example below to example structure.
function spawnmenu.GetToolMenu(name, label, icon) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Gets a table of tools on the client.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.GetTools)
---@return table # A table with groups of tools, along with information on each tool.
function spawnmenu.GetTools() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Calls [spawnmenu.PopulateFromTextFiles](https://wiki.facepunch.com/gmod/spawnmenu.PopulateFromTextFiles).
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.PopulateFromEngineTextFiles)
function spawnmenu.PopulateFromEngineTextFiles() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Loads spawnlists from text files. You probably are looking for [spawnmenu.AddPropCategory](https://wiki.facepunch.com/gmod/spawnmenu.AddPropCategory).
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.PopulateFromTextFiles)
---@param callback fun(strFilename: string, strName: string, tabContents: table, icon: string, id: number, parentid: number, needsapp: string) The function to call.
---
--- Function argument(s):
--- * string `strFilename` - The file name for the spawnlist.
--- * string `strName` - The "nice" title for the spawnlist.
--- * table `tabContents` - The list of contents for this spawnlist.
--- * string `icon` - Path to an `.png` icon of the spawnlist, should be 16x16 image.
--- * number `id` - Unique ID of the spawnlist
--- * number `parentid` - UniqueID of the parents spawnlist ID
--- * string `needsapp` - If not empty, the internal folder name of an mountable game that is required for this spawnlist to show up.
function spawnmenu.PopulateFromTextFiles(callback) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Saves a table of spawnlists to files.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.SaveToTextFiles)
---@param spawnlists table A table containing spawnlists.
function spawnmenu.SaveToTextFiles(spawnlists) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
--- Sets currently active control panel to be returned by [spawnmenu.ActiveControlPanel](https://wiki.facepunch.com/gmod/spawnmenu.ActiveControlPanel).
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.SetActiveControlPanel)
---@param pnl Panel The panel to set.
function spawnmenu.SetActiveControlPanel(pnl) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Switches the creation tab (left side of the spawnmenu) on the spawnmenu to the given tab.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.SwitchCreationTab)
---@param id string The tab ID to open
function spawnmenu.SwitchCreationTab(id) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Opens specified tool tab in spawnmenu.
---
---[View wiki](https://wiki.facepunch.com/gmod/spawnmenu.SwitchToolTab)
---@param id number The tab ID to open
function spawnmenu.SwitchToolTab(id) end
