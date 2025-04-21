---@meta

--- The DHTML control wraps the internal Awesomium framework, supports calling Javascript functions from Lua,
--- as well as running Lua from within the HTML. Running Lua code is disabled by default.
---@class DHTML : Awesomium
DHTML = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Defines a Javascript function that when called will call a Lua callback.
--- **NOTE**: Must be called after the HTML document has fully loaded.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:AddFunction)
---@param library string Library name of the JS function you are defining.
---@param name string Name of the JS function you are defining.
---@param callback function Function called when the JS function is called. Arguments passed to the JS function will be passed here.
function DHTML:AddFunction(library, name, callback) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Runs/Executes a string as JavaScript code in a panel.
--- **NOTE**: This function does **NOT** evaluate expression (i.e. allow you to pass variables from JavaScript (JS) to Lua context).Because a return value is nil/no value (a.k.a. void).If you wish to pass/return values from JS to Lua, you may want to use [DHTML:AddFunction](https://wiki.facepunch.com/gmod/DHTML:AddFunction) function to accomplish that job.
---
--- **NOTE**: This function is an alias of [DHTML:QueueJavascript](https://wiki.facepunch.com/gmod/DHTML:QueueJavascript) ([source](https://github.com/Facepunch/garrysmod/blob/master/garrysmod/lua/vgui/dhtml.lua#L62)).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:Call)
---@param js string Specify JavaScript code to be executed.
function DHTML:Call(js) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Called when the page inside the [DHTML](https://wiki.facepunch.com/gmod/DHTML) window runs the `console.log` javascript function. On the x86-64 beta, it's called for all built-in `console.*` javascript functions.
---
--- If [DHTML:SetAllowLua](https://wiki.facepunch.com/gmod/DHTML:SetAllowLua) is set to `true` and the message begins with `RUNLUA:`, the text following `RUNLUA:` will be executed as code within the Lua environment (this is how Lua is called from DHTML windows).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:ConsoleMessage)
---@param msg string The message to be logged (or Lua code to be executed; see above).
function DHTML:ConsoleMessage(msg) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns if the loaded page can run Lua code, set by [DHTML:SetAllowLua](https://wiki.facepunch.com/gmod/DHTML:SetAllowLua)
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:GetAllowLua)
---@return boolean # Whether or not Lua code can be called from the loaded page.
function DHTML:GetAllowLua() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the value set by [DHTML:SetScrollbars](https://wiki.facepunch.com/gmod/DHTML:SetScrollbars).
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:GetScrollbars)
---@return boolean # True if scrollbars should be visible.
---@deprecated Broken. Use the CSS `overflow` rule instead.
function DHTML:GetScrollbars() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Runs/Executes a string as JavaScript code in a panel.
---
--- **NOTE**: This function does **NOT** evaluate expression (i.e. allow you to pass variables from JavaScript (JS) to Lua context).Because a return value is nil/no value (a.k.a. void).If you wish to pass/return values from JS to Lua, you may want to use [DHTML:AddFunction](https://wiki.facepunch.com/gmod/DHTML:AddFunction) function to accomplish that job.
---
--- **NOTE**: If [Panel:IsVisible](https://wiki.facepunch.com/gmod/Panel:IsVisible) is `false`, [PANEL:Think](https://wiki.facepunch.com/gmod/PANEL:Think) will **NOT** run, meaning the Javascript Queue will not be processed.Consider overriding [PANEL:Paint](https://wiki.facepunch.com/gmod/PANEL:Paint) to stop the panel from drawing instead.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:QueueJavascript)
---@param js string Specify JavaScript code to be executed.
function DHTML:QueueJavascript(js) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Determines whether the loaded page can run Lua code or not. See [DHTML](https://wiki.facepunch.com/gmod/DHTML) for how to run Lua from a DHTML window.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:SetAllowLua)
---@param allow? boolean Whether or not to allow Lua.
function DHTML:SetAllowLua(allow) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets if the loaded window should display scrollbars when the webpage is larger than the viewing window. This is similar to the CSS `overflow` rule.
---
---[View wiki](https://wiki.facepunch.com/gmod/DHTML:SetScrollbars)
---@param show boolean True if scrollbars should be visible.
---@deprecated Broken. Use the CSS `overflow` rule instead.
function DHTML:SetScrollbars(show) end
