---@meta

--- A window that is used to publish dupes and saves
---@class UGCPublishWindow : DFrame
local UGCPublishWindow = {}

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Checks if the Tags and Title are valid and if so it enables the publish button.
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:CheckInput)
function UGCPublishWindow:CheckInput() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Displays the given error message.
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:DisplayError)
---@param err string The error message.
function UGCPublishWindow:DisplayError(err) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Publishes the Item or throws an error if the Title or Tags are invalid
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:DoPublish)
---@param wsid string The workshop id
---@param err string If wsid is nil, this will be the error message
function UGCPublishWindow:DoPublish(wsid, err) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Rezises the panel to nicely fit all children
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:FitContents)
function UGCPublishWindow:FitContents() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Returns the name of the current selected tag.
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:GetChosenTag)
---@return string # The choosen tag, or nil if none is selected.
function UGCPublishWindow:GetChosenTag() end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) Called when the Item was published or if any error occurred while publishing
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:OnPublishFinished)
---@param wsid string The workshop id
---@param err string If wsid is nil, this will be the error message
function UGCPublishWindow:OnPublishFinished(wsid, err) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) updated the Workshop items list.
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:Setup)
---@param ugcType string The type / namespace of the WorkshopFileBase that created this panel
---@param file string The File to publish
---@param imageFile string The Image
---@param handler WorkshopFileBase The WorkshopFileBase that created this panel
function UGCPublishWindow:Setup(ugcType, file, imageFile, handler) end

---![(Menu)](https://github.com/user-attachments/assets/62703d98-767e-4cf2-89b3-390b1c2c5cd9) updated the Workshop items list.
---
---[View wiki](https://wiki.facepunch.com/gmod/UGCPublishWindow:UpdateWorkshopItems)
function UGCPublishWindow:UpdateWorkshopItems() end
