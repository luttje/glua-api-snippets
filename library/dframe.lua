---@meta

--- The DFrame is the moma of basically all VGUI elements. 98% of the time you will parent your element to this.
---@class DFrame : EditablePanel
local DFrame = {}

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Centers the frame relative to the whole screen and invalidates its layout. This overrides [Panel:Center](https://wiki.facepunch.com/gmod/Panel:Center).
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:Center)
function DFrame:Center() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Hides or removes the DFrame, and calls [DFrame:OnClose](https://wiki.facepunch.com/gmod/DFrame:OnClose).
---
--- To set whether the frame is hidden or removed, use [DFrame:SetDeleteOnClose](https://wiki.facepunch.com/gmod/DFrame:SetDeleteOnClose).
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:Close)
function DFrame:Close() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets whether the background behind the frame is being blurred.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetBackgroundBlur)
---@return boolean # Whether or not background blur is enabled.
function DFrame:GetBackgroundBlur() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Determines whether or not the DFrame will be removed when it is closed. This is set with [DFrame:SetDeleteOnClose](https://wiki.facepunch.com/gmod/DFrame:SetDeleteOnClose).
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetDeleteOnClose)
---@return boolean # Whether or not the frame will be removed on close.
function DFrame:GetDeleteOnClose() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets whether or not the frame is draggable by the user.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetDraggable)
---@return boolean # Whether the frame is draggable or not.
function DFrame:GetDraggable() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets whether or not the frame is part of a derma menu. This is set with [DFrame:SetIsMenu](https://wiki.facepunch.com/gmod/DFrame:SetIsMenu).
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetIsMenu)
---@return boolean # Whether or not this frame is a menu component.
function DFrame:GetIsMenu() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the minimum height the DFrame can be resized to by the user.
---
--- You must call [DFrame:SetSizable](https://wiki.facepunch.com/gmod/DFrame:SetSizable) before the user can resize the frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetMinHeight)
---@return number # The minimum height the user can resize the frame to.
function DFrame:GetMinHeight() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets the minimum width the DFrame can be resized to by the user.
---
--- You must call [DFrame:SetSizable](https://wiki.facepunch.com/gmod/DFrame:SetSizable) before the user can resize the frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetMinWidth)
---@return number # The minimum width the user can resize the frame to.
function DFrame:GetMinWidth() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets whether or not the shadow effect bordering the DFrame is being drawn.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetPaintShadow)
---@return boolean # Whether or not the shadow is being drawn.
function DFrame:GetPaintShadow() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets whether or not the DFrame is restricted to the boundaries of the screen resolution.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetScreenLock)
---@return boolean # Whether or not the frame is restricted.
function DFrame:GetScreenLock() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Gets whether or not the DFrame can be resized by the user.
---
--- This is achieved by clicking and dragging in the bottom right corner of the frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetSizable)
---@return boolean # Whether the frame can be resized or not.
function DFrame:GetSizable() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Returns the title of the frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:GetTitle)
---@return string # Title of the frame.
function DFrame:GetTitle() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Determines if the frame or one of its children has the screen focus.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:IsActive)
---@return boolean # Whether or not the frame has focus.
function DFrame:IsActive() end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Indicate that the background elements won't be usable.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetBackgroundBlur)
---@param blur boolean Whether or not to block mouse on background panels or not.
function DFrame:SetBackgroundBlur(blur) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Determines whether or not the DFrame is removed when it is closed with [DFrame:Close](https://wiki.facepunch.com/gmod/DFrame:Close).
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetDeleteOnClose)
---@param shouldDelete boolean Whether or not to delete the frame on close. This is `true` by default.
function DFrame:SetDeleteOnClose(shouldDelete) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the frame should be draggable by the user. The DFrame can only be dragged from its title bar.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetDraggable)
---@param draggable boolean Whether to be draggable or not.
function DFrame:SetDraggable(draggable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Adds or removes an icon on the left of the [DFrame](https://wiki.facepunch.com/gmod/DFrame)'s title.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetIcon)
---@param path string Set to nil to remove the icon.
---
--- Otherwise, set to file path to create the icon.
function DFrame:SetIcon(path) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the frame is part of a derma menu or not.
---
--- If this is set to `true`, [Global.CloseDermaMenus](https://wiki.facepunch.com/gmod/Global.CloseDermaMenus) will not be called when the frame is clicked, and thus any open menus will remain open.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetIsMenu)
---@param isMenu boolean Whether or not this frame is a menu component.
function DFrame:SetIsMenu(isMenu) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the minimum height the DFrame can be resized to by the user.
---
--- This only applies to users attempting to resize the frame; [Panel:SetTall](https://wiki.facepunch.com/gmod/Panel:SetTall) and similar methods will not be affected. You must call [DFrame:SetSizable](https://wiki.facepunch.com/gmod/DFrame:SetSizable) before the user can resize the frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetMinHeight)
---@param minH number The minimum height the user can resize the frame to.
function DFrame:SetMinHeight(minH) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the minimum width the DFrame can be resized to by the user.
---
--- This only applies to users attempting to resize the frame; [Panel:SetWide](https://wiki.facepunch.com/gmod/Panel:SetWide) and similar methods will not be affected. You must call [DFrame:SetSizable](https://wiki.facepunch.com/gmod/DFrame:SetSizable) before the user can resize the frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetMinWidth)
---@param minW number The minimum width the user can resize the frame to.
function DFrame:SetMinWidth(minW) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the shadow effect bordering the DFrame should be drawn.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetPaintShadow)
---@param shouldPaint boolean Whether or not to draw the shadow. This is `true` by default.
function DFrame:SetPaintShadow(shouldPaint) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether the DFrame is restricted to the boundaries of the screen resolution.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetScreenLock)
---@param lock boolean If `true`, the frame cannot be dragged outside of the screen bounds
function DFrame:SetScreenLock(lock) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets whether or not the [DFrame](https://wiki.facepunch.com/gmod/DFrame) can be resized by the user.
---
--- This is achieved by clicking and dragging in the bottom right corner of the frame.
---
--- You can set the minimum size using [DFrame:SetMinWidth](https://wiki.facepunch.com/gmod/DFrame:SetMinWidth) and [DFrame:SetMinHeight](https://wiki.facepunch.com/gmod/DFrame:SetMinHeight).
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetSizable)
---@param sizeable boolean Whether the frame should be resizeable or not.
function DFrame:SetSizable(sizeable) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Sets the title of the frame.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:SetTitle)
---@param title string New title of the frame.
function DFrame:SetTitle(title) end

---![(Client and menu)](https://github.com/user-attachments/assets/25d1a1c8-4288-4a51-9867-5e3bb51b9981) Determines whether the DFrame's control box (close, minimise and maximise buttons) is displayed.
---
---[View wiki](https://wiki.facepunch.com/gmod/DFrame:ShowCloseButton)
---@param show boolean `false` hides the control box; this is `true` by default.
function DFrame:ShowCloseButton(show) end
