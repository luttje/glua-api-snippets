---@meta

--- The presets library lets you add and modify the pre-set options for scripted tools (selected via the white bar at the top of each tools control panel).
presets = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds preset to a preset group.
---
---[View wiki](https://wiki.facepunch.com/gmod/presets.Add)
---@param groupname string The preset group name, usually it's tool class name.
---@param name string Preset name, must be unique.
---@param values table A table of preset console commands.
function presets.Add(groupname, name, values) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to tell the player that the name they tried to use in their preset is not acceptable.
---
---[View wiki](https://wiki.facepunch.com/gmod/presets.BadNameAlert)
function presets.BadNameAlert() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns whether a preset with given name exists or not
---
---[View wiki](https://wiki.facepunch.com/gmod/presets.Exists)
---@param type string The preset group name, usually it's tool class name.
---@param name string Name of the preset to test
---@return boolean # true if the preset does exist
function presets.Exists(type, name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns a table with preset names and values from a single preset group.
---
---[View wiki](https://wiki.facepunch.com/gmod/presets.GetTable)
---@param groupname string Preset group name.
---@return table # All presets in specified group.
function presets.GetTable(groupname) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) **INTERNAL**: This is used internally - although you're able to use it you probably shouldn't.
---
--- Used internally to ask the player if they want to override an already existing preset.
---
---[View wiki](https://wiki.facepunch.com/gmod/presets.OverwritePresetPrompt)
---@param callback function
function presets.OverwritePresetPrompt(callback) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Removes a preset entry from a preset group.
---
---[View wiki](https://wiki.facepunch.com/gmod/presets.Remove)
---@param groupname string Preset group to remove from
---@param name string Name of preset to remove
function presets.Remove(groupname, name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Renames preset.
---
---[View wiki](https://wiki.facepunch.com/gmod/presets.Rename)
---@param groupname string Preset group name
---@param oldname string Old preset name
---@param newname string New preset name
function presets.Rename(groupname, oldname, newname) end
