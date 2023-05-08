---@meta

---@class DHTML : Panel
local DHTML = {}

---[CLIENT] Defines a Javascript function that when called will call a Lua callback.
--- Must be called after the HTML document has fully loaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:AddFunction)
---@param library string Library name of the JS function you are defining.
---@param name string Name of the JS function you are defining.
---@param callback function Function called when the JS function is called. Arguments passed to the JS function will be passed here.
function DHTML:AddFunction(library, name, callback) end

---[CLIENT] Runs/Executes a string as JavaScript code in a panel.
--- This function does **NOT** evaluate expression (i.e. allow you to pass variables from JavaScript (JS) to Lua context).Because a return value is nil/no value (a.k.a. void).If you wish to pass/return values from JS to Lua, you may want to use DHTML:AddFunction function to accomplish that job.
--- This function is an alias of DHTML:QueueJavascript ([source](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/vgui/dhtml.lua#L62)).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:Call)
---@param js string Specify JavaScript code to be executed.
function DHTML:Call(js) end

---[CLIENT] Called when the page inside the DHTML window runs `console.log`. This can also be called within the Lua environment to emulate `console.log`. If the contained message begins with `RUNLUA:` the following text will be executed as code within the Lua environment (this is how Lua is called from DHTML windows).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:ConsoleMessage)
---@param msg string The message to be logged (or Lua code to be executed; see above).
function DHTML:ConsoleMessage(msg) end

---[CLIENT] Returns if the loaded page can run Lua code, set by DHTML:SetAllowLua
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:GetAllowLua)
---@return boolean #Whether or not Lua code can be called from the loaded page.
function DHTML:GetAllowLua() end

---[CLIENT] Runs/Executes a string as JavaScript code in a panel.
---
--- 		This function does **NOT** evaluate expression (i.e. allow you to pass variables from JavaScript (JS) to Lua context).Because a return value is nil/no value (a.k.a. void).If you wish to pass/return values from JS to Lua, you may want to use DHTML:AddFunction function to accomplish that job.
--- 		If Panel:IsVisible is `false`, PANEL:Think will **NOT** run, meaning the Javascript Queue will not be processed.Consider overriding PANEL:Paint to stop the panel from drawing instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:QueueJavascript)
---@param js string Specify JavaScript code to be executed.
function DHTML:QueueJavascript(js) end

---[CLIENT] Determines whether the loaded page can run Lua code or not. See DHTML for how to run Lua from a DHTML window.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:SetAllowLua)
---@param allow? boolean Whether or not to allow Lua.
function DHTML:SetAllowLua(allow) end

---[CLIENT] Broken. Use the CSS `overflow` rule instead. Sets if the loaded window should display scrollbars when the webpage is larger than the viewing window. This is similar to the CSS `overflow` rule.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:SetScrollbars)
---@param show boolean True if scrollbars should be visible.
function DHTML:SetScrollbars(show) end

---[CLIENT] Stops the loading of the HTML panel's current page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DHTML:StopLoading)
function DHTML:StopLoading() end
