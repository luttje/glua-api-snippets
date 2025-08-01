---@meta

--- Used by the context menu in sandbox.
---@class ControlPanel : DForm
local ControlPanel = {}

--- The controlpanel library.
controlpanel = {}

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Clears ALL the control panels ( for tools )
---
---[View wiki](https://wiki.facepunch.com/gmod/controlpanel.Clear)
function controlpanel.Clear() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns (or creates if not exists) a control panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/controlpanel.Get)
---@param name string The name of the panel. For normal tools this will be equal to `TOOL.Mode` (the tool's filename without the extension).
---
--- When you create a tool/option via spawnmenu.AddToolMenuOption, the internal control panel name is `TOOL.Mode .. "_" .. tool_tab:lower() .. "_" .. tool_category:lower()`.
---@return Panel # The ControlPanel panel.
function controlpanel.Get(name) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds a control to the control panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:AddControl)
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

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Adds an item by calling [DForm:AddItem](https://wiki.facepunch.com/gmod/DForm:AddItem).
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:AddPanel)
---@param panel Panel Panel to add as an item to the control panel.
function ControlPanel:AddPanel(panel) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Alias of [Panel:Clear](https://wiki.facepunch.com/gmod/Panel:Clear).
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:ClearControls)
function ControlPanel:ClearControls() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a [CtrlColor](https://wiki.facepunch.com/gmod/CtrlColor) (a color picker) panel and adds it as an [item](https://wiki.facepunch.com/gmod/ControlPanel:AddPanel).
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:ColorPicker)
---@param label string The label for this color picker.
---@param convarR string Name of the convar that will store the R component of the selected color.
---@param convarG string Name of the convar that will store the G component of the selected color.
---@param convarB string Name of the convar that will store the B component of the selected color.
---@param convarA? string Name of the convar that will store the A component of the selected color.
---@return Panel # The created CtrlColor panel.
function ControlPanel:ColorPicker(label, convarR, convarG, convarB, convarA) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Sets control values of the control panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:ControlValues)
---@param data table A two-membered table:
--- * boolean closed - Sets if the control panel should be unexpanded.
--- * string label - The text to display inside the control's label.
function ControlPanel:ControlValues(data) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Calls the given function with this panel as the only argument. Used by the spawnmenu to populate the control panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:FillViaFunction)
---@param func fun(panelToPopulate: ControlPanel) The builder function.
---
--- Function argument(s):
--- * ControlPanel `panelToPopulate` -
---@deprecated This is dumb. Just call the builder function directly.
function ControlPanel:FillViaFunction(func) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Returns this control panel.
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:GetEmbeddedPanel)
---@return ControlPanel # The same control panel the function is being called on.
function ControlPanel:GetEmbeddedPanel() end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a CtrlNumPad (a Sandbox key binder) panel and adds it as an [item](https://wiki.facepunch.com/gmod/ControlPanel:AddPanel).
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:KeyBinder)
---@param label1 string The label for the left key binder.
---@param convar1 string The name of the convar that will store the key code for player selected key of the left key binder.
---@param label2? string If set and `convar2` is set, the label for the right key binder.
---@param convar2? string If set and `label2` is set, the name of the convar that will store the key code for player selected key of the right key binder.
---@return Panel # The created CtrlNumPad panel.
function ControlPanel:KeyBinder(label1, convar1, label2, convar2) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a [MatSelect](https://wiki.facepunch.com/gmod/MatSelect) panel and adds it as an [item](https://wiki.facepunch.com/gmod/ControlPanel:AddPanel).
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:MatSelect)
---@param convar string Calls MatSelect:ContextBase:SetConVar with this value.
---@param options? table If specified, calls MatSelect:AddMaterial(key, value) for each table entry. If the table key is a number, the function will instead be called with the value as both arguments.
---@param autostretch? boolean If specified, calls MatSelect:SetAutoHeight with this value.
---@param width? number If specified, calls MatSelect:SetItemWidth with this value.
---@param height? number If specified, calls MatSelect:SetItemHeight with this value.
---@return MatSelect # The created MatSelect panel.
function ControlPanel:MatSelect(convar, options, autostretch, width, height) end

---![(Client)](https://github.com/user-attachments/assets/a5f6ba64-374d-42f0-b2f4-50e5c964e808) Creates a [ControlPresets](https://wiki.facepunch.com/gmod/ControlPresets) panel and adds it as an [item](https://wiki.facepunch.com/gmod/ControlPanel:AddPanel).
---
---[View wiki](https://wiki.facepunch.com/gmod/ControlPanel:ToolPresets)
---@param group string The presets group. Must be unique.
---@param cvarList table A table of convar names as keys and their defaults as the values. Typically the output of Tool:BuildConVarList.
---@return Panel # The created ControlPresets panel.
function ControlPanel:ToolPresets(group, cvarList) end
