---@meta

--- A transparent gray speech bubble panel made up of a rounded box and point coming from the bottom.Creates a bubble container panel in the middle of the screen. The background DPanel is used to allow better control of the dialog point position.Creates a panel with Bill from Left 4 Dead talking through a speech bubble.
---@class DBubbleContainer : DPanel
local DBubbleContainer = {}

---[CLIENT] Sets the speech bubble position and size along with the dialog point position.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DBubbleContainer:OpenForPos)
---@param x number The x position of the dialog point. If this is set to a value greater than half of the set width, the entire bubble container will be moved in addition to the dialog point.
---@param y number The y position of the bubble container. Has no effect unless set to a value greater than the set height + 64 pixels.
---@param w number The width of the bubble container.
---@param h number The height of the bubble container.
function DBubbleContainer:OpenForPos(x, y, w, h) end
