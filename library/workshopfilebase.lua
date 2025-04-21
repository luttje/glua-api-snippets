---@meta

--- **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- This object is created by [Global.WorkshopFileBase](https://wiki.facepunch.com/gmod/Global.WorkshopFileBase) which is used internally to fetch data of the specific namespace
--- or to publish saves and dupes.
---
--- This also exists on the Server but most functions may throw an error. It's meant to be used clientside.
--- **NOTE**: You need to set the `HTML` field to a [DHTML](https://wiki.facepunch.com/gmod/DHTML) panel that is set up correctly like [here](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/creationmenu/content/contenttypes/dupes.lua#L12), or else you might get errors.
---
---[View wiki](https://wiki.facepunch.com/gmod/WorkshopFileBase)
---@class WorkshopFileBase
local WorkshopFileBase = {}

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Fetches all subscriptions for the set namespace and type
--- **NOTE**: If you want to use the type `local` you need to implement the `:FetchLocal(offset, perpage)` function!
---
---[View wiki](https://wiki.facepunch.com/gmod/WorkshopFileBase:Fetch)
---@param type string The type to search for. (`local`, `subscribed`, `subscribed_ugc`, `mine`, `favorite`)
---@param offset number Skips the first x results.
---@param perpage number How many results per page should be returned.
---@param extratags table additional tags to filter the results.
---@param searchText string text that needs to be in the addon title. Use an empty string for none
---@param filter? number The filter for the results. (`enabledonly`, `disabledonly`)
---@param sort? string How it should be sorted. If set to `nil`, it will fallback to `timeadded`. (`title`, `size`, `updated`)
function WorkshopFileBase:Fetch(type, offset, perpage, extratags, searchText, filter, sort) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Fetches all subscriptions for the set namespace and passes the result to [WorkshopFileBase:FillFileInfo](https://wiki.facepunch.com/gmod/WorkshopFileBase:FillFileInfo).
---
---[View wiki](https://wiki.facepunch.com/gmod/WorkshopFileBase:FetchSubscribed)
---@param offset number Skips the first x results.
---@param perpage number How many results per page should be returned.
---@param tags table additional tags to filter the results.
---@param searchText string text that needs to be in the addon title. Use an empty string for none
---@param isUGC? boolean if true it will use engine.GetUserContent instead of engine.GetAddons
---@param filter? number The filter for the results. (`enabledonly`, `disabledonly`)
---@param sort? string How it should be sorted. If set to `nil`, it will fallback to `timeadded`. (`title`, `size`, `updated`)
function WorkshopFileBase:FetchSubscribed(offset, perpage, tags, searchText, isUGC, filter, sort) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Updates the set HTML panel with the newly fetched results
---
---[View wiki](https://wiki.facepunch.com/gmod/WorkshopFileBase:FillFileInfo)
---@param results table The type to search for. (`local`, `subscribed`, `subscribed_ugc`, `mine`, `favorite`)
---@param isUGC boolean Skips the first x results.
function WorkshopFileBase:FillFileInfo(results, isUGC) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Creates a [UGCPublishWindow](https://wiki.facepunch.com/gmod/UGCPublishWindow) to publish the dupe or save
---
---[View wiki](https://wiki.facepunch.com/gmod/WorkshopFileBase:Publish)
---@param filename string The type to search for. (`local`, `subscribed`, `subscribed_ugc`, `mine`, `favorite`)
---@param image string The image to use
function WorkshopFileBase:Publish(filename, image) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Retrieves the username for the given SteamID.
---
---[View wiki](https://wiki.facepunch.com/gmod/WorkshopFileBase:RetrieveUserName)
---@param steamid string SteamID to retrieve the name for
---@param callback fun(name: string) Callback function.
---
---
--- Function argument(s):
--- * string `name` - The retrieved name
function WorkshopFileBase:RetrieveUserName(steamid, callback) end
