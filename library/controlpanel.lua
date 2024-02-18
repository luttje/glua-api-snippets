---@meta

--- Used by the context menu in sandbox.
---@class ControlPanel : DForm
local ControlPanel = {}

--- The controlpanel library.
controlpanel = {}

---[CLIENT] Clears ALL the control panels ( for tools )
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/controlpanel.Clear)
function controlpanel.Clear() end

---[CLIENT] Returns (or creates if not exists) a control panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/controlpanel.Get)
---@param name string The name of the panel. For normal tools this will be equal to `TOOL.Mode` (the tool's filename without the extension).
---
--- When you create a tool/option via spawnmenu.AddToolMenuOption, the internal control panel name is `TOOL.Mode .. "_" .. tool_tab:lower() .. "_" .. tool_category:lower()`.
---@return Panel # The ControlPanel panel.
function controlpanel.Get(name) end

---[CLIENT] Adds a control to the control panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:AddControl)
---@param type string The control type to add. The complete list is:
--- * header
--- * textbox
--- * label
--- * checkbox/toggle
--- * slider
--- * propselect
--- * matselect
--- * ropematerial
--- * button
--- * numpad
--- * color
--- * combobox
--- * listbox
--- * materialgallery
---@param controlinfo table Each control takes their own table structure. You may search "AddControl" on GitHub for examples.
---
--- Here is a full list of each type and the table members it requires:
---
--- * header
--- 	* description
---
--- * textbox:
--- 	* label (def: "Untitled")
--- 	* command
---
--- * label:
--- 	* text
---
--- * checkbox, toggle (same thing):
--- 	* label (def: "Untitled")
--- 	* command
--- 	* help (boolean, if true assumes label is a language string (`#tool.toolname.stuff`) and adds `.help` at the end)
---
--- * slider: (DForm:NumSlider)
--- 	* type (optional string, if equals `float` then 2 digits after the decimal will be used, otherwise 0)
--- 	* label (def: `Untitled`)
--- 	* command
--- 	* min (def: `0`)
--- 	* max (def: `100`)
--- 	* help (boolean, see above)
---
--- * propselect:
--- 	* (data goes directly to PropSelect's :ControlValues(data))
---
--- * matselect:
--- 	* (data goes directly to MatSelect's :ControlValues(data))
---
--- * ropematerial:
--- 	* convar (notice: NOT called command this time!)
---
--- * button:
--- 	* label / text (if label is missing will use text. Def: `No Label`)
--- 	* command
---
--- * numpad:
--- 	* command
--- 	* command2
--- 	* label
--- 	* label2
---
--- * color:
--- 	* label
--- 	* red (convar)
--- 	* green (convar)
--- 	* blue (convar)
--- 	* alpha (convar)
---
--- * combobox:
--- 	* menubutton (if doesn't equal "1", becomes a listbox)
--- 	* folder
--- 	* options (optional, ha)
--- 	* cvars (optional)
---
--- * listbox:
--- 	* height (if set, becomes DListView, otherwise is CtrlListBox)
--- 	* label (def: `unknown`)
--- 	* options (optional)
---
--- * materialgallery:
--- 	* width (def: `32`)
--- 	* height (def: `32`)
--- 	* rows (def: `4`)
--- 	* convar
--- 	* options
---@return Panel # Returns created control
---@deprecated It is recommended to use DForm's members instead.
function ControlPanel:AddControl(type, controlinfo) end

---[CLIENT] Adds an item by calling DForm:AddItem.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:AddPanel)
---@param panel Panel Panel to add as an item to the control panel.
function ControlPanel:AddPanel(panel) end

---[CLIENT] Alias of Panel:Clear.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:ClearControls)
function ControlPanel:ClearControls() end

---[CLIENT] Creates a CtrlColor (a color picker) panel and adds it as an ControlPanel:AddPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:ColorPicker)
---@param label string The label for this color picker.
---@param convarR string Name of the convar that will store the R component of the selected color.
---@param convarG string Name of the convar that will store the G component of the selected color.
---@param convarB string Name of the convar that will store the B component of the selected color.
---@param convarA string Name of the convar that will store the A component of the selected color.
---@return Panel # The created CtrlColor panel.
function ControlPanel:ColorPicker(label, convarR, convarG, convarB, convarA) end

---[CLIENT] Sets control values of the control panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:ControlValues)
---@param data table A two-membered table:
--- * boolean closed - Sets if the control panel should be unexpanded.
--- * string label - The text to display inside the control's label.
function ControlPanel:ControlValues(data) end

---[CLIENT] Calls the given function with this panel as the only argument. Used by the spawnmenu to populate the control panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:FillViaFunction)
---@param func function A function that takes one argument:
--- * ControlPanel panelToPopulate
function ControlPanel:FillViaFunction(func) end

---[CLIENT] Returns this control panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:GetEmbeddedPanel)
---@return ControlPanel # The same control panel the function is being called on.
function ControlPanel:GetEmbeddedPanel() end

---[CLIENT] Creates a CtrlNumPad (a Sandbox key binder) panel and adds it as an ControlPanel:AddPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:KeyBinder)
---@param label1 string The label for the left key binder.
---@param convar1 string The name of the convar that will store the key code for player selected key of the left key binder.
---@param label2? string If set and `convar2` is set, the label for the right key binder.
---@param convar2? string If set and `label2` is set, the name of the convar that will store the key code for player selected key of the right key binder.
---@return Panel # The created CtrlNumPad panel.
function ControlPanel:KeyBinder(label1, convar1, label2, convar2) end

---[CLIENT] Creates a MatSelect panel and adds it as an ControlPanel:AddPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:MatSelect)
---@param convar string Calls MatSelect:ContextBase:SetConVar with this value.
---@param options? table If specified, calls MatSelect:AddMaterial(key, value) for each table entry. If the table key is a number, the function will instead be called with the value as both arguments.
---@param autostretch? boolean If specified, calls MatSelect:SetAutoHeight with this value.
---@param width? number If specified, calls MatSelect:SetItemWidth with this value.
---@param height? number If specified, calls MatSelect:SetItemHeight with this value.
---@return MatSelect # The created MatSelect panel.
function ControlPanel:MatSelect(convar, options, autostretch, width, height) end

---[CLIENT] Creates a ControlPresets panel and adds it as an ControlPanel:AddPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/ControlPanel:ToolPresets)
---@param group string The presets group. Must be unique.
---@param cvarList table A table of convar names as keys and their defaults as the values. Typically the output of Tool:BuildConVarList.
---@return Panel # The created ControlPresets panel.
function ControlPanel:ToolPresets(group, cvarList) end
