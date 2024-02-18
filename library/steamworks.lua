---@meta

--- Steamworks related functions.
steamworks = {}

---[MENU] Refreshes clients addons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.ApplyAddons)
function steamworks.ApplyAddons() end

---[CLIENT AND MENU] Downloads a file from the supplied addon and saves it as a .cache file in garrysmod/cache folder.
---
--- This is mostly used to download the preview image of the addon, but the game seems to also use it to download replays and saves.
---
--- In case the retrieved file is an image and you need the IMaterial, use Global.AddonMaterial with the path supplied from the callback.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.Download)
---@param workshopPreviewID string The Preview ID of workshop item.
---@param uncompress boolean Whether to uncompress the file or not, assuming it was compressed with LZMA.
--- You will usually want to set this to true.
---@param resultCallback fun(pathToSavedFile: string) The function to process retrieved data. The first and only argument is a string, containing path to the saved file.
function steamworks.Download(workshopPreviewID, uncompress, resultCallback) end

---[CLIENT AND MENU] Downloads a Steam Workshop file by its ID and returns a path to it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.DownloadUGC)
---@param workshopID string The ID of workshop item to download. **NOT** a file ID.
---@param resultCallback fun(path: string, file: file_class) The function to process retrieved data. Arguments passed are:
--- * string path - Contains a path to the saved file, or nil if the download failed for any reason.
--- * file_class file - A file object pointing to the downloaded .gma file. The file handle will be closed after the function exits.
function steamworks.DownloadUGC(workshopID, resultCallback) end

---[CLIENT AND MENU] Retrieves info about supplied Steam Workshop addon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.FileInfo)
---@param workshopItemID string The ID of Steam Workshop item.
---@param resultCallback function The function to process retrieved data, with the following arguments:
--- * table data - The data about the item, if the request succeeded, nil otherwise. See Structures/UGCFileInfo.
function steamworks.FileInfo(workshopItemID, resultCallback) end

---[CLIENT AND MENU] Retrieves a customized list of Steam Workshop addons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.GetList)
---@param type string The type of items to retrieve. Possible values include:
--- * popular (All invalid options will equal to this)
--- * trending
--- * latest
--- * friends
--- * followed - Items of people the player is following on Steam
--- * friend_favs - Favorites of player's friends
--- * favorite - Player's favorites
---
---@param tags table A table of tags to match.
---@param offset number How much of results to skip from first one. This is useful for pagination. Negative values are invalid.
---@param numRetrieve number How many items to retrieve, up to 50 at a time. Negative values are invalid.
---@param days number When getting `popular` or `trending` content from Steam, this determines a time period, in range of days from 0 to 365. ( 7 = most popular addons in last 7 days, 30 = most popular addons in the last month, etc ). If given a zero, will automatically choose a value, which is 7 for `trending`.
---@param userID string "0" to retrieve all addons, "1" to retrieve addons only published by you, or a valid SteamID64 of a user to get workshop items of.
---@param resultCallback function The function to process retrieved data. The first and only argument is a table, containing all the info, or nil in case of error
function steamworks.GetList(type, tags, offset, numRetrieve, days, userID, resultCallback) end

---[CLIENT AND MENU] Retrieves players name by their 64bit SteamID.
---
--- You must call steamworks.RequestPlayerInfo a decent amount of time before calling this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.GetPlayerName)
---@param steamID64 string The 64bit Steam ID ( aka Community ID ) of the player
---@return string # The name of that player
---@deprecated You should use the callback of steamworks.RequestPlayerInfo instead.
function steamworks.GetPlayerName(steamID64) end

---[CLIENT AND MENU] Returns whenever the client is subscribed to the specified Steam Workshop item.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.IsSubscribed)
---@param workshopItemID string The ID of the Steam Workshop item.
---@return boolean # Is the client subscribed to the addon or not.
function steamworks.IsSubscribed(workshopItemID) end

---[CLIENT AND MENU] Opens the workshop website in the steam overlay browser.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.OpenWorkshop)
function steamworks.OpenWorkshop() end

---[MENU] Publishes dupes, saves or demos to workshop.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.Publish)
---@param tags table The workshop tags to apply
---@param filename string Path to the file to upload
---@param image string Path to the image to use as icon
---@param name string Name of the Workshop submission
---@param desc string Description of the Workshop submission
---@param callback function Callback for when the publishing process finishes. Has 2 args:
--- * number fileID - If success, file id of the published item.
--- * string error - On failure, the error message.
---@param fileid? number If set, the file ID to update
---@param changelist? string List of changes when updating an item.
function steamworks.Publish(tags, filename, image, name, desc, callback, fileid, changelist) end

---[CLIENT AND MENU] Requests information of the player with SteamID64 for later use with steamworks.GetPlayerName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.RequestPlayerInfo)
---@param steamID64 string The 64bit Steam ID of player.
---@param callback function A callback function with only 1 argument - string name.
function steamworks.RequestPlayerInfo(steamID64, callback) end

---[MENU] Sets the workshop item as "completed" by the player. There will be a visual indicator on the Steam Workshop for completed items.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.SetFileCompleted)
---@param workshopid string The Steam Workshop item id
---@return string # Whatever you have put in as first argument
function steamworks.SetFileCompleted(workshopid) end

---[MENU] Sets whether you have played this addon or not. This will be shown to the user in the Steam Workshop itself:
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.SetFilePlayed)
---@param workshopid string The Steam Workshop item ID
---@return string # Whatever you have put in as first argument
function steamworks.SetFilePlayed(workshopid) end

---[MENU] Sets if an addon should be enabled or disabled. Call steamworks.ApplyAddons afterwards to update.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.SetShouldMountAddon)
---@param workshopItemID string The ID of the Steam Workshop item we should enable/disable
---@param shouldMount boolean true to enable the item, false to disable.
function steamworks.SetShouldMountAddon(workshopItemID, shouldMount) end

---[CLIENT AND MENU] Returns whenever the specified Steam Workshop addon will be mounted or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.ShouldMountAddon)
---@param workshopItemID string The ID of the Steam Workshop
---@return boolean # Will the workshop item be mounted or not
function steamworks.ShouldMountAddon(workshopItemID) end

---[MENU] Subscribes to the specified workshop addon. Call steamworks.ApplyAddons afterwards to update.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.Subscribe)
---@param workshopItemID string The ID of the Steam Workshop item we should subscribe to
function steamworks.Subscribe(workshopItemID) end

---[MENU] Unsubscribes to the specified workshop addon. Call steamworks.ApplyAddons afterwards to update.
---
--- This function should `never` be called without a user's consent and should not be called if the addon is currently in use (aka: the user is not in the main menu) as it may result in unexpected behaviour.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.Unsubscribe)
---@param workshopItemID string The ID of the Steam Workshop item we should unsubscribe from.
function steamworks.Unsubscribe(workshopItemID) end

---[CLIENT AND MENU] Opens the workshop website for specified Steam Workshop item in the Steam overlay browser.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.ViewFile)
---@param workshopItemID string The ID of workshop item.
function steamworks.ViewFile(workshopItemID) end

---[MENU] Makes the user vote for the specified addon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.Vote)
---@param workshopItemID string The ID of workshop item.
---@param upOrDown boolean Sets if the user should vote up/down. True makes them upvote, false down
function steamworks.Vote(workshopItemID, upOrDown) end

---[CLIENT AND MENU] Retrieves vote info of supplied addon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.VoteInfo)
---@param workshopItemID string The ID of workshop item.
---@param resultCallback function The function to process retrieved data. The first and only argument is a table, containing all the info.
---@deprecated Use data steamworks.FileInfo instead.
function steamworks.VoteInfo(workshopItemID, resultCallback) end
