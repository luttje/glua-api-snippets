---@meta

--- The derma library allows you to add custom derma controls and create & modify derma skins.
derma = {}

---[CLIENT AND MENU] Gets the color from a Derma skin of a panel and returns default color if not found
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.Color)
---@param name string
---@param pnl Panel
---@param default table The default color in case of failure.
function derma.Color(name, pnl, default) end

---[CLIENT AND MENU] Defines a new Derma control with an optional base.
---
--- This calls vgui.Register internally, but also does the following:
--- * Adds the control to derma.GetControlList
--- * Adds a key "Derma" - This is returned by derma.GetControlList
--- * Makes a global table with the name of the control (This is technically deprecated and should not be relied upon)
--- * If reloading (i.e. called this function with name of an existing panel), updates all existing instances of panels with this name. (Updates functions, calls PANEL:PreAutoRefresh and PANEL:PostAutoRefresh, etc.)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.DefineControl)
---@param name string Name of the newly created control
---@param description string Description of the control
---@param tab table Table containing control methods and properties
---@param base string Derma control to base the new control off of
---@return table # A table containing the new control's methods and properties
function derma.DefineControl(name, description, tab, base) end

---[CLIENT AND MENU] Defines a new skin so that it is usable by Derma. The default skin can be found in `garrysmod/lua/skins/default.lua`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.DefineSkin)
---@param name string Name of the skin
---@param descriptions string Description of the skin
---@param skin table Table containing skin data
function derma.DefineSkin(name, descriptions, skin) end

---[CLIENT AND MENU] Returns the derma.Controls table, a list of all derma controls registered with derma.DefineControl.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.GetControlList)
---@return table # A listing of all available derma-based controls. See derma.Controls for structure and contents.
function derma.GetControlList() end

---[CLIENT AND MENU] Returns the default skin table, which can be changed with the hook GM:ForceDermaSkin
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.GetDefaultSkin)
---@return table # Skin table
function derma.GetDefaultSkin() end

---[CLIENT AND MENU] Returns the skin table of the skin with the supplied name
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.GetNamedSkin)
---@param name string Name of skin
---@return table # Skin table
function derma.GetNamedSkin(name) end

---[CLIENT AND MENU] Returns a copy of the table containing every Derma skin
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.GetSkinTable)
---@return table # Table of every Derma skin
function derma.GetSkinTable() end

---[CLIENT AND MENU] Clears all cached panels so that they reassess which skin they should be using.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.RefreshSkins)
function derma.RefreshSkins() end

---[CLIENT AND MENU] Returns how many times derma.RefreshSkins has been called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.SkinChangeIndex)
---@return number # Amount of times derma.RefreshSkins has been called.
function derma.SkinChangeIndex() end

---[CLIENT AND MENU] Calls the specified hook for the given panel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.SkinHook)
---@param type string The type of hook to run
---@param name string The name of the hook to run
---@param panel Panel The panel to call the hook for
---@param vararg1? any First parameter for the panel hook. i.e. width of the panel for PANEL:Paint hooks.
---@param vararg2? any Second parameter for the panel hook. i.e. height of the panel for PANEL:Paint hooks.
---@param vararg3? any Third parameter for the panel hook.
---@param vararg4? any Fourth parameter for the panel hook.
---@return any # The returned variable from the skin hook
function derma.SkinHook(type, name, panel, vararg1, vararg2, vararg3, vararg4) end

---[CLIENT AND MENU] Returns a function to draw a specified texture of panels skin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/derma.SkinTexture)
---@param name string The identifier of the texture
---@param pnl Panel Panel to get the skin of.
---@param fallback? any What to return if we failed to retrieve the texture
---@return function # A function that is created with the GWEN to draw a texture.
function derma.SkinTexture(name, pnl, fallback) end
