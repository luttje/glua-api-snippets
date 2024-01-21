---[CLIENT] Loads spawnlists from text files.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/spawnmenu.PopulateFromTextFiles)
---@param callback fun(filename: string, name: string, contents: table, icon: string, id: integer, parentid: integer, needsapp: string) The function to call. Arguments are ( strFilename, strName, tabContents, icon, id, parentid, needsapp )
function spawnmenu.PopulateFromTextFiles(callback) end
