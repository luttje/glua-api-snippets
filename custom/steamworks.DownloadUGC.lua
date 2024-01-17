---[CLIENT AND MENU] Downloads a Steam Workshop file by its ID and returns a path to it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/steamworks.DownloadUGC)
---@param workshopID string The ID of workshop item to download. **NOT** a file ID.
---@param resultCallback fun(path: string, file: file_class) The function to process retrieved data. Arguments passed are:
--- * string path - Contains a path to the saved file, or nil if the download failed for any reason.
--- * file_class file - A file object pointing to the downloaded .gma file. The file handle will be closed after the function exits.
function steamworks.DownloadUGC(workshopID, resultCallback) end
