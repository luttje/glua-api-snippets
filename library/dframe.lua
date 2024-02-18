---@meta

---
--- 		The DFrame is the moma of basically all VGUI elements. 98% of the time you will parent your element to this.
--- 	Creates a basic DFrame.Create an advanced customized DFrame.
---@class DFrame : EditablePanel
local DFrame = {}

---[CLIENT AND MENU] Centers the frame relative to the whole screen and invalidates its layout. This overrides Panel:Center.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:Center)
function DFrame:Center() end

---[CLIENT AND MENU] Hides or removes the DFrame, and calls DFrame:OnClose.
---
--- To set whether the frame is hidden or removed, use DFrame:SetDeleteOnClose.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:Close)
function DFrame:Close() end

---[CLIENT AND MENU] Gets whether the background behind the frame is being blurred.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetBackgroundBlur)
---@return boolean # Whether or not background blur is enabled.
function DFrame:GetBackgroundBlur() end

---[CLIENT AND MENU] Determines whether or not the DFrame will be removed when it is closed. This is set with DFrame:SetDeleteOnClose.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetDeleteOnClose)
---@return boolean # Whether or not the frame will be removed on close.
function DFrame:GetDeleteOnClose() end

---[CLIENT AND MENU] Gets whether or not the frame is draggable by the user.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetDraggable)
---@return boolean # Whether the frame is draggable or not.
function DFrame:GetDraggable() end

---[CLIENT AND MENU] Gets whether or not the frame is part of a derma menu. This is set with DFrame:SetIsMenu.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetIsMenu)
---@return boolean # Whether or not this frame is a menu component.
function DFrame:GetIsMenu() end

---[CLIENT AND MENU] Gets the minimum height the DFrame can be resized to by the user.
---
--- You must call DFrame:SetSizable before the user can resize the frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetMinHeight)
---@return number # The minimum height the user can resize the frame to.
function DFrame:GetMinHeight() end

---[CLIENT AND MENU] Gets the minimum width the DFrame can be resized to by the user.
---
--- You must call DFrame:SetSizable before the user can resize the frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetMinWidth)
---@return number # The minimum width the user can resize the frame to.
function DFrame:GetMinWidth() end

---[CLIENT AND MENU] Gets whether or not the shadow effect bordering the DFrame is being drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetPaintShadow)
---@return boolean # Whether or not the shadow is being drawn.
function DFrame:GetPaintShadow() end

---[CLIENT AND MENU] Gets whether or not the DFrame is restricted to the boundaries of the screen resolution.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetScreenLock)
---@return boolean # Whether or not the frame is restricted.
function DFrame:GetScreenLock() end

---[CLIENT AND MENU] Gets whether or not the DFrame can be resized by the user.
---
--- This is achieved by clicking and dragging in the bottom right corner of the frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetSizable)
---@return boolean # Whether the frame can be resized or not.
function DFrame:GetSizable() end

---[CLIENT AND MENU] Returns the title of the frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:GetTitle)
---@return string # Title of the frame.
function DFrame:GetTitle() end

---[CLIENT AND MENU] Determines if the frame or one of its children has the screen focus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:IsActive)
---@return boolean # Whether or not the frame has focus.
function DFrame:IsActive() end

---[CLIENT AND MENU] Indicate that the background elements won't be usable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetBackgroundBlur)
---@param blur boolean Whether or not to block mouse on background panels or not.
function DFrame:SetBackgroundBlur(blur) end

---[CLIENT AND MENU] Determines whether or not the DFrame is removed when it is closed with DFrame:Close.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetDeleteOnClose)
---@param shouldDelete boolean Whether or not to delete the frame on close. This is `true` by default.
function DFrame:SetDeleteOnClose(shouldDelete) end

---[CLIENT AND MENU] Sets whether the frame should be draggable by the user. The DFrame can only be dragged from its title bar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetDraggable)
---@param draggable boolean Whether to be draggable or not.
function DFrame:SetDraggable(draggable) end

---[CLIENT AND MENU] Adds or removes an icon on the left of the DFrame's title.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetIcon)
---@param path string Set to nil to remove the icon.
---
--- Otherwise, set to file path to create the icon.
function DFrame:SetIcon(path) end

---[CLIENT AND MENU] Sets whether the frame is part of a derma menu or not.
---
--- If this is set to `true`, Global.CloseDermaMenus will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetIsMenu)
---@param isMenu boolean Whether or not this frame is a menu component.
function DFrame:SetIsMenu(isMenu) end

---[CLIENT AND MENU] Sets the minimum height the DFrame can be resized to by the user.
---
--- This only applies to users attempting to resize the frame; Panel:SetTall and similar methods will not be affected. You must call DFrame:SetSizable before the user can resize the frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetMinHeight)
---@param minH number The minimum height the user can resize the frame to.
function DFrame:SetMinHeight(minH) end

---[CLIENT AND MENU] Sets the minimum width the DFrame can be resized to by the user.
---
--- This only applies to users attempting to resize the frame; Panel:SetWide and similar methods will not be affected. You must call DFrame:SetSizable before the user can resize the frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetMinWidth)
---@param minW number The minimum width the user can resize the frame to.
function DFrame:SetMinWidth(minW) end

---[CLIENT AND MENU] Sets whether or not the shadow effect bordering the DFrame should be drawn.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetPaintShadow)
---@param shouldPaint boolean Whether or not to draw the shadow. This is `true` by default.
function DFrame:SetPaintShadow(shouldPaint) end

---[CLIENT AND MENU] Sets whether the DFrame is restricted to the boundaries of the screen resolution.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetScreenLock)
---@param lock boolean If `true`, the frame cannot be dragged outside of the screen bounds
function DFrame:SetScreenLock(lock) end

---[CLIENT AND MENU] Sets whether or not the DFrame can be resized by the user.
---
--- This is achieved by clicking and dragging in the bottom right corner of the frame.
---
--- You can set the minimum size using DFrame:SetMinWidth and DFrame:SetMinHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetSizable)
---@param sizeable boolean Whether the frame should be resizeable or not.
function DFrame:SetSizable(sizeable) end

---[CLIENT AND MENU] Sets the title of the frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:SetTitle)
---@param title string New title of the frame.
function DFrame:SetTitle(title) end

---[CLIENT AND MENU] Determines whether the DFrame's control box (close, minimise and maximise buttons) is displayed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DFrame:ShowCloseButton)
---@param show boolean `false` hides the control box; this is `true` by default.
function DFrame:ShowCloseButton(show) end
