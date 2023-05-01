---@meta

---@class DForm
local DForm = {}

---[CLIENT] Adds one or two items to the DForm.
--- If this method is called with only one argument, it is added to the bottom of the form. If two arguments are passed, they are placed side-by-side at the bottom of the form.
--- 
--- Internally, this function is used by the various DForm functions to, for example, add labels to the left of buttons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:AddItem)
---@param left Panel Left-hand element to add to the DForm.
---@param right Panel Right-hand element to add to the DForm.
function DForm:AddItem(left, right) end

---[CLIENT] Adds a DButton onto the DForm
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:Button)
---@param text string The text on the button
---@param concommand string The concommand to run when the button is clicked
---@param ... ... The arguments to pass on to the concommand when the button is clicked
---@return Panel The created DButton
function DForm:Button(text, concommand, ...) end

---[CLIENT] Adds a DCheckBoxLabel onto the DForm.
--- This will run DCheckBoxLabel:OnChange when being added. This is caused by Panel:SetConVar being used when this function is used. To avoid this, use DForm:AddItem with a DCheckBoxLabel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:CheckBox)
---@param label string The label to be set next to the check box
---@param convar string The console variable to change when this is changed
---@return Panel The created DCheckBoxLabel
function DForm:CheckBox(label, convar) end

---[CLIENT] Adds a DComboBox onto the DForm
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:ComboBox)
---@param title string Text to the left of the combo box
---@param convar string Console variable to change when the user selects something from the dropdown.
---@return Panel, Panel Panel - The created DComboBox
---@return Panel, Panel Panel - The created DLabel
function DForm:ComboBox(title, convar) end

---[CLIENT] Adds a DLabel onto the DForm. Unlike DForm:Help, this is indented and is colored blue, depending on the derma skin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:ControlHelp)
---@param help string The help message to be displayed.
---@return Panel The created DLabel
function DForm:ControlHelp(help) end

---[CLIENT] Adds a DLabel onto the DForm as a helper
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:Help)
---@param help string The help message to be displayed
---@return Panel The created DLabel
function DForm:Help(help) end

---[CLIENT] Adds a DListBox onto the DForm
--- Use DListView with DForm:AddItem instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:ListBox)
---@param label string The label to set on the DListBox
---@return Panel, Panel Panel - The created DListBox
---@return Panel, Panel Panel - The created DLabel
function DForm:ListBox(label) end

---[CLIENT] Adds a DNumberWang onto the DForm
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:NumberWang)
---@param label string The label to be placed next to the DNumberWang
---@param convar string The console variable to change when the slider is changed
---@param min number The minimum value of the slider
---@param max number The maximum value of the slider
---@param decimals number The number of decimals to allow in the slider (Optional)
---@return Panel, Panel Panel - The created DNumberWang
---@return Panel, Panel Panel - The created DLabel
function DForm:NumberWang(label, convar, min, max, decimals) end

---[CLIENT] Adds a DNumSlider onto the DForm
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:NumSlider)
---@param label string The label of the DNumSlider
---@param convar string The console variable to change when the slider is changed
---@param min number The minimum value of the slider
---@param max number The maximum value of the slider
---@param decimals number The number of decimals to allow on the slider. (Optional)
---@return Panel The created DNumSlider
function DForm:NumSlider(label, convar, min, max, decimals) end

---[CLIENT] This is derived from the deprecated DPanelSelect.Creates a DPanelSelect and docks it to the top of the DForm.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:PanelSelect)
---@return Panel The created DPanelSelect.
function DForm:PanelSelect() end

---[CLIENT] Creates a PropSelect panel and docks it to the top of the DForm.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:PropSelect)
---@param label string The label to display above the prop select.
---@param convar string The convar to set the selected model to.
---@param models table A table of models to display for selection. Supports 2 formats:
--- 1) Key is the model and value are the convars to set when that model is selected in format `convar=value`
--- 2) An table of tables where each table must have the following keys:
--- * string model - The model.
--- * number skin - Model's skin. Defaults to 0
--- * string tooltip - Displayed when user hovers over the model. Defaults to the model path.
--- * The key of the table is the value of the convar.
--- 
--- 
---@param height number The height of the prop select panel, in 64px icon increments.
---@return Panel The created PropSelect panel.
function DForm:PropSelect(label, convar, models, height) end

---[CLIENT] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:Rebuild)
function DForm:Rebuild() end

---[CLIENT] Sets the title (header) name of the DForm. This is `Label` until set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:SetName)
---@param name string The new header name.
function DForm:SetName(name) end

---[CLIENT] Adds a DTextEntry to a DForm
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DForm:TextEntry)
---@param label string The label to be next to the text entry
---@param convar string The console variable to be changed when the text entry is changed
---@return Panel, Panel Panel - The created DTextEntry
---@return Panel, Panel Panel - The created DLabel
function DForm:TextEntry(label, convar) end

