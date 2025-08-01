---@meta

--- Steamworks related functions.
steamworks = {}

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Refreshes clients addons.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.ApplyAddons)
function steamworks.ApplyAddons() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) **NOTE**: You really should be using [steamworks.DownloadUGC](https://wiki.facepunch.com/gmod/steamworks.DownloadUGC) when downloading Steam Workshop items. This is a legacy function for preview images.
---
--- Downloads a file from the supplied addon and saves it as a `.cache` file in `garrysmod/cache/` folder.
---
--- This is mostly used to download the preview image of the addon.
---
--- In case the retrieved file is an image and you need the [IMaterial](https://wiki.facepunch.com/gmod/IMaterial), use [Global.AddonMaterial](https://wiki.facepunch.com/gmod/Global.AddonMaterial) with the path supplied from the callback.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.Download)
---@param workshopPreviewID string The Preview ID of workshop item.
---@param uncompress boolean Whether to uncompress the file or not, assuming it was compressed with LZMA.
--- You will usually want to set this to true.
---@param resultCallback fun(path: string) The function to process retrieved data.
---
--- Function argument(s):
--- * string `path` - Path to the downloaded file.
function steamworks.Download(workshopPreviewID, uncompress, resultCallback) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Downloads the Fire Extinguisher addon from Steam Workshop prints path to its .gma file to be used with [game.MountGMA](https://wiki.facepunch.com/gmod/game.MountGMA).
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.DownloadUGC)
---@param workshopID string The ID of workshop item to download. **NOT** a file ID.
---@param resultCallback fun(path: string, file: file_class) The function to process retrieved data.
---
--- Function argument(s):
--- * string `path` - Contains a path to the saved file, or nil if the download failed for any reason.
--- * file_class `file` - A file object pointing to the downloaded .gma file. The file handle will be closed after the function exits.
function steamworks.DownloadUGC(workshopID, resultCallback) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Retrieves info about supplied Steam Workshop addon.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.FileInfo)
---@param workshopItemID string The ID of Steam Workshop item.
---@param resultCallback fun(data: table) The function to process retrieved data.
---
--- Function argument(s):
--- * table `data` - The data about the item, if the request succeeded, `nil` otherwise. See Structures/UGCFileInfo.
function steamworks.FileInfo(workshopItemID, resultCallback) end

---![(Shared and Menu)](https://github.com/user-attachments/assets/8f5230ff-38f7-493b-b9fc-cc70ffd5b3f4) Retrieves a customized list of Steam Workshop addons.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.GetList)
---@param type string The type of items to retrieve. Possible values include:
--- * popular (All invalid options will equal to this)
--- * trending
--- * latest
--- * friends
--- * followed - Items of people the player is following on Steam
--- * friend_favs - Favorites of player's friends
--- * favorite - Player's favorites
---@param tags table A table of tags to match.
---@param offset number How much of results to skip from first one. This is useful for pagination. Negative values are invalid.
---@param numRetrieve number How many items to retrieve, up to `50` at a time. Negative values are invalid.
---@param days number When getting `popular` or `trending` content from Steam, this determines a time period, in range of days from `0` to `365`. ( `7` = most popular addons in last 7 days, `30` = most popular addons in the last month, etc ). If given a zero, will automatically choose a value, which is `7` for `trending`.
---@param userID string `"0"` to retrieve all addons, `"1"` to retrieve addons only published by you, or a valid SteamID64 of a user to get workshop items of.
---@param resultCallback fun(data: table) The function to process retrieved data.
---
--- Function argument(s):
--- * table `data` - The list of items, or nil in case of error.
function steamworks.GetList(type, tags, offset, numRetrieve, days, userID, resultCallback) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Retrieves players name by their 64bit SteamID.
---
--- You must call [steamworks.RequestPlayerInfo](https://wiki.facepunch.com/gmod/steamworks.RequestPlayerInfo) a decent amount of time before calling this function.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.GetPlayerName)
---@param steamID64 string The 64bit Steam ID ( aka Community ID ) of the player
---@return string # The name of that player
---@deprecated You should use the callback of steamworks.RequestPlayerInfo instead.
function steamworks.GetPlayerName(steamID64) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whenever the client is subscribed to the specified Steam Workshop item.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.IsSubscribed)
---@param workshopItemID string The ID of the Steam Workshop item.
---@return boolean # Is the client subscribed to the addon or not.
function steamworks.IsSubscribed(workshopItemID) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Opens the workshop website in the steam overlay browser.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.OpenWorkshop)
function steamworks.OpenWorkshop() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Publishes dupes, saves or demos to workshop.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.Publish)
---@param filename string Path to the file to upload
---@param image string Path to the image to use as icon
---@param name string Name of the Workshop submission
---@param desc string Description of the Workshop submission
---@param tags table The workshop tags to apply
---@param callback fun(fileID: number, error: string) Callback for when the publishing process finishes.
---
--- Function argument(s):
--- * number `fileID` - If success, file id of the published item.
--- * string `error` - On failure, the error message.
---@param fileid? number If set, the file ID to update
---@param changelist? string List of changes when updating an item.
function steamworks.Publish(filename, image, name, desc, tags, callback, fileid, changelist) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Requests information of the player with SteamID64 for later use with [steamworks.GetPlayerName](https://wiki.facepunch.com/gmod/steamworks.GetPlayerName).
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.RequestPlayerInfo)
---@param steamID64 string The 64bit Steam ID of player.
---@param callback fun(name: string) A callback function with the data when it arrives.
---
--- Function argument(s):
--- * string `name` - The player's name.
function steamworks.RequestPlayerInfo(steamID64, callback) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Sets the workshop item as "completed" by the player. There will be a visual indicator on the Steam Workshop for completed items.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.SetFileCompleted)
---@param workshopid string The Steam Workshop item id
---@return string # Whatever you have put in as first argument
function steamworks.SetFileCompleted(workshopid) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Sets whether you have played this addon or not. This will be shown to the user in the Steam Workshop itself:
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.SetFilePlayed)
---@param workshopid string The Steam Workshop item ID
---@return string # Whatever you have put in as first argument
function steamworks.SetFilePlayed(workshopid) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Sets if an addon should be enabled or disabled. Call [steamworks.ApplyAddons](https://wiki.facepunch.com/gmod/steamworks.ApplyAddons) afterwards to update.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.SetShouldMountAddon)
---@param workshopItemID string The ID of the Steam Workshop item we should enable/disable
---@param shouldMount boolean true to enable the item, false to disable.
function steamworks.SetShouldMountAddon(workshopItemID, shouldMount) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns whenever the specified Steam Workshop addon will be mounted or not.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.ShouldMountAddon)
---@param workshopItemID string The ID of the Steam Workshop
---@return boolean # Will the workshop item be mounted or not
function steamworks.ShouldMountAddon(workshopItemID) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Subscribes to the specified workshop addon. Call [steamworks.ApplyAddons](https://wiki.facepunch.com/gmod/steamworks.ApplyAddons) afterwards to update.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.Subscribe)
---@param workshopItemID string The ID of the Steam Workshop item we should subscribe to
function steamworks.Subscribe(workshopItemID) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Unsubscribes to the specified workshop addon. Call [steamworks.ApplyAddons](https://wiki.facepunch.com/gmod/steamworks.ApplyAddons) afterwards to update.
---
--- This function should `never` be called without a user's consent and should not be called if the addon is currently in use (aka: the user is not in the main menu) as it may result in unexpected behaviour.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.Unsubscribe)
---@param workshopItemID string The ID of the Steam Workshop item we should unsubscribe from.
function steamworks.Unsubscribe(workshopItemID) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Opens the workshop website for specified Steam Workshop item in the Steam overlay browser.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.ViewFile)
---@param workshopItemID string The ID of workshop item.
function steamworks.ViewFile(workshopItemID) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---  Makes the user vote for the specified addon
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.Vote)
---@param workshopItemID string The ID of workshop item.
---@param upOrDown boolean Sets if the user should vote up/down. True makes them upvote, false down
function steamworks.Vote(workshopItemID, upOrDown) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Retrieves vote info of supplied addon.
---
---[View wiki](https://wiki.facepunch.com/gmod/steamworks.VoteInfo)
---@param workshopItemID string The ID of workshop item.
---@param resultCallback fun(data: table) The function to process retrieved data.
---
--- Function argument(s):
--- * table `data` - The vote information. See Structures/UGCFileInfo.
---@deprecated Use data steamworks.FileInfo instead.
function steamworks.VoteInfo(workshopItemID, resultCallback) end
