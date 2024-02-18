---@meta

---
--- 		Simply a DIconLayout which automatically displays all of the silkicons.
--- 		Used as a way to get the user to select an icon.
--- 	Creates a DIconBrowser which, when an icon is clicked, prints said icon's directory.
---@class DIconBrowser : DScrollPanel
local DIconBrowser = {}

---[CLIENT AND MENU] Automatically called to fill the browser with icons. Will not work if DIconBrowser:SetManual is set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:Fill)
function DIconBrowser:Fill() end

---[CLIENT AND MENU] A simple unused search feature, hides all icons that do not contain given text in their file path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:FilterByText)
---@param text string The text to search for
function DIconBrowser:FilterByText(text) end

---[CLIENT AND MENU] Returns whether or not the browser should fill itself with icons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:GetManual)
---@return boolean #
function DIconBrowser:GetManual() end

---[CLIENT AND MENU] Returns the currently selected icon's file path.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:GetSelectedIcon)
---@return string # The currently selected icon's file path.
function DIconBrowser:GetSelectedIcon() end

---[CLIENT AND MENU] Called when the selected icon was changed. Use DIconBrowser:GetSelectedIcon to get the selected icon's filepath.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:OnChange)
function DIconBrowser:OnChange() end

---[CLIENT AND MENU] Use DIconBrowser:OnChange instead
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:OnChangeInternal)
function DIconBrowser:OnChangeInternal() end

---[CLIENT AND MENU] Scrolls the browser to the selected icon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:ScrollToSelected)
function DIconBrowser:ScrollToSelected() end

---[CLIENT AND MENU] Selects an icon from file path
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:SelectIcon)
---@param icon string The file path of the icon to select. Do not include the "materials/" part.
function DIconBrowser:SelectIcon(icon) end

---[CLIENT AND MENU] Sets whether or not the browser should automatically fill itself with icons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:SetManual)
---@param manual boolean
function DIconBrowser:SetManual(manual) end

---[CLIENT AND MENU] Set the currently selected file path. Do not use. Use DIconBrowser:SelectIcon instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DIconBrowser:SetSelectedIcon)
---@param str string
function DIconBrowser:SetSelectedIcon(str) end
