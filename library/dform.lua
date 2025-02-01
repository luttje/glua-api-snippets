---@meta

--- An easy form with functions to quickly add form elements
---@class DForm : DCollapsibleCategory
local DForm = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds one or two items to the DForm.
--- If this method is called with only one argument, it is added to the bottom of the form. If two arguments are passed, they are placed side-by-side at the bottom of the form.
---
--- Internally, this function is used by the various DForm functions to, for example, add labels to the left of buttons.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:AddItem)
---@param left Panel Left-hand element to add to the DForm.
---@param right? Panel Right-hand element to add to the DForm.
function DForm:AddItem(left, right) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DButton](https://wiki.facepunch.com/gmod/DButton) onto the [DForm](https://wiki.facepunch.com/gmod/DForm)
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:Button)
---@param text string The text on the button
---@param concommand string The concommand to run when the button is clicked
---@param ...? any The arguments to pass on to the concommand when the button is clicked
---@return Panel # The created DButton
function DForm:Button(text, concommand, ...) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel) onto the [DForm](https://wiki.facepunch.com/gmod/DForm).
--- **NOTE**: This will run [DCheckBoxLabel:OnChange](https://wiki.facepunch.com/gmod/DCheckBoxLabel:OnChange) when being added. This is caused by [Panel:SetConVar](https://wiki.facepunch.com/gmod/Panel:SetConVar) being used when this function is used. To avoid this, use [DForm:AddItem](https://wiki.facepunch.com/gmod/DForm:AddItem) with a [DCheckBoxLabel](https://wiki.facepunch.com/gmod/DCheckBoxLabel).
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:CheckBox)
---@param label string The label to be set next to the check box
---@param convar string The console variable to change when this is changed
---@return Panel # The created DCheckBoxLabel
function DForm:CheckBox(label, convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DComboBox](https://wiki.facepunch.com/gmod/DComboBox) onto the [DForm](https://wiki.facepunch.com/gmod/DForm)
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:ComboBox)
---@param title string Text to the left of the combo box
---@param convar string Console variable to change when the user selects something from the dropdown.
---@return Panel # The created DComboBox
---@return Panel # The created DLabel
function DForm:ComboBox(title, convar) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DLabel](https://wiki.facepunch.com/gmod/DLabel) onto the [DForm](https://wiki.facepunch.com/gmod/DForm). Unlike [DForm:Help](https://wiki.facepunch.com/gmod/DForm:Help), this is indented and is colored blue, depending on the derma skin.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:ControlHelp)
---@param help string The help message to be displayed.
---@return Panel # The created DLabel
function DForm:ControlHelp(help) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An Accessor Function in DForm that does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:GetAutoSize)
---@return boolean #
function DForm:GetAutoSize() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:GetSpacing)
---@return number #
function DForm:GetSpacing() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DLabel](https://wiki.facepunch.com/gmod/DLabel) onto the [DForm](https://wiki.facepunch.com/gmod/DForm) as a helper
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:Help)
---@param help string The help message to be displayed
---@return Panel # The created DLabel
function DForm:Help(help) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DListBox](https://wiki.facepunch.com/gmod/DListBox) onto the [DForm](https://wiki.facepunch.com/gmod/DForm)
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:ListBox)
---@param label string The label to set on the DListBox
---@return Panel # The created DListBox
---@return Panel # The created DLabel
---@deprecated Use DListView with DForm:AddItem instead.
function DForm:ListBox(label) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DNumberWang](https://wiki.facepunch.com/gmod/DNumberWang) onto the [DForm](https://wiki.facepunch.com/gmod/DForm)
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:NumberWang)
---@param label string The label to be placed next to the DNumberWang
---@param convar string The console variable to change when the slider is changed
---@param min number The minimum value of the slider
---@param max number The maximum value of the slider
---@param decimals? number The number of decimals to allow in the slider (Optional)
---@return Panel # The created DNumberWang
---@return Panel # The created DLabel
function DForm:NumberWang(label, convar, min, max, decimals) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DNumSlider](https://wiki.facepunch.com/gmod/DNumSlider) onto the [DForm](https://wiki.facepunch.com/gmod/DForm)
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:NumSlider)
---@param label string The label of the DNumSlider
---@param convar string The console variable to change when the slider is changed
---@param min number The minimum value of the slider
---@param max number The maximum value of the slider
---@param decimals? number The number of decimals to allow on the slider.
---@return Panel # The created DNumSlider
function DForm:NumSlider(label, convar, min, max, decimals) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a [DPanelSelect](https://wiki.facepunch.com/gmod/DPanelSelect) and docks it to the top of the DForm.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:PanelSelect)
---@return Panel # The created DPanelSelect.
---@deprecated This is derived from the deprecated DPanelSelect.
function DForm:PanelSelect() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Creates a [PropSelect](https://wiki.facepunch.com/gmod/PropSelect) panel and docks it to the top of the DForm.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:PropSelect)
---@param label string The label to display above the prop select.
---@param convar string The convar to set the selected model to.
---@param models table A table of models to display for selection. Supports 2 formats:
--- 1) Key is the model and value are the convars to set when that model is selected in format `convar=value`
--- 2) An table of tables where each table must have the following keys:
--- * string model - The model.
--- * number skin - Model's skin. Defaults to 0
--- * string tooltip - Displayed when user hovers over the model. Defaults to the model path.
--- * The key of the table is the value of the convar.
---@param height? number The height of the prop select panel, in 64px icon increments.
---@return Panel # The created PropSelect panel.
function DForm:PropSelect(label, convar, models, height) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:Rebuild)
function DForm:Rebuild() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) an [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that does nothing
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:SetAutoSize)
---@param boolean boolean
function DForm:SetAutoSize(boolean) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the title (header) name of the DForm. This is `Label` until set.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:SetName)
---@param name string The new header name.
---@deprecated This is an alias of derived DCollapsibleCategory:SetLabel
function DForm:SetName(name) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) An [Global.AccessorFunc](https://wiki.facepunch.com/gmod/Global.AccessorFunc) that does nothing.
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:SetSpacing)
---@param number number
function DForm:SetSpacing(number) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds a [DTextEntry](https://wiki.facepunch.com/gmod/DTextEntry) to a [DForm](https://wiki.facepunch.com/gmod/DForm)
---
---[View wiki](https://wiki.facepunch.com/gmod/DForm:TextEntry)
---@param label string The label to be next to the text entry
---@param convar string The console variable to be changed when the text entry is changed
---@return Panel # The created DTextEntry
---@return Panel # The created DLabel
function DForm:TextEntry(label, convar) end
