---@meta

---
--- 		**INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- 		The ContentSidebar is internally used by the spawnmenu and manages things like the Spawnmenu Toolbar.
--- 		It internally uses a DTree which is accessible with ContentSidebar .Tree.
--- 		When [ContentSidebar:EnableModify](https://wiki.facepunch.com/gmod/ContentSidebar:EnableModify) has been called ContentSidebar.Toolbox will return a [ContentSidebarToolbox](https://wiki.facepunch.com/gmod/ContentSidebarToolbox)
---
---@class ContentSidebar : DPanel
local ContentSidebar = {}

---[CLIENT] Creates a Save Notification which will be shown when [SANDBOX:SpawnlistContentChanged](https://wiki.facepunch.com/gmod/SANDBOX:SpawnlistContentChanged) has been called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContentSidebar:CreateSaveNotification)
---@param style string
---@param hookname? string A Populate Hook like PopulateEntities
function ContentSidebar:CreateSaveNotification(style, hookname) end

---[CLIENT] Internally calls [ContentSidebar:EnableSearch](https://wiki.facepunch.com/gmod/ContentSidebar:EnableSearch), [ContentSidebar:CreateSaveNotification](https://wiki.facepunch.com/gmod/ContentSidebar:CreateSaveNotification) and creates a ContentSidebarToolbox which is accessible under ContentSidebar.Toolbox. Call the Hook [SANDBOX:OpenToolbox](https://wiki.facepunch.com/gmod/SANDBOX:OpenToolbox) to open the created Toolbox
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContentSidebar:EnableModify)
function ContentSidebar:EnableModify() end

---[CLIENT] Creates a search bar which will be displayed over the Nodes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ContentSidebar:EnableSearch)
---@param style string
---@param hookname? string A Populate Hook like PopulateEntities
function ContentSidebar:EnableSearch(style, hookname) end
