---@meta

---
--- This is the base panel for every other [VGUI](vgui) panel.
---
--- It contains all of the basic methods, some of which may only work on certain VGUI elements. See also Panel Hooks.
---
--- As their functionality is provided at the game's C/C++ level rather than by its Lua script extension, they are unfortunately unavailable for most practical purposes, however, they can still be obtained in a way similar to that provided by the baseclass library:
---
--- ```
--- -- Create a new panel type NewPanel that inherits all of its functionality from DLabel,
--- -- but has a different SetText method than DLabel does - all without the hassle of that
--- -- old DLabel's default text getting in the way. Fun stuff.
---
--- local PANEL = {}
---
--- function PANEL:Init()
---
--- 	self:SetText_Base( "" )
--- 	self:SetText( "Time for something different!" )
---
--- end
---
--- function PANEL:Paint( aWide, aTall )
---
--- 	local TextX, TextY = 0, 0
--- 	local TextColor = Color( 255, 0, 0, 255 )
---
--- 	surface.SetFont( self:GetFont() or "default" )
--- 	surface.SetTextColor( TextColor )
--- 	surface.SetTextPos( TextX, TextY )
--- 	surface.DrawText( self:GetText() )
---
--- end
---
--- -- And here we go:
--- PANEL.SetText_Base = FindMetaTable( "Panel" ).SetText
---
--- function PANEL:SetText( aText )
---
--- 	self.Text = tostring( aText )
---
--- end
---
--- function PANEL:GetText()
---
--- 	return self.Text or ""
---
--- end
---
--- vgui.Register( "NewPanel", PANEL, "DLabel" )
--- ```
---
---
---@class Panel
local Panel = {}

---
--- This is a list of hooks that are available on all panels.
---
--- Specific panels can have their own hooks, they are listed on their category.
--- These hooks are called on your panel. They can't be hook.Add
---
---@class PANEL : Panel
PANEL = {}

---[CLIENT AND MENU] Adds the specified object to the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Add)
---@generic T : Panel
---@param object `T` The panel to be added (parented). Can also be:
--- * string Class Name - creates panel with the specified name and adds it to the panel.
--- * table PANEL table - creates a panel from table and adds it to the panel.
---@return `T` # The added or created panel
function Panel:Add(object) end

---[CLIENT AND MENU] This function does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AddText)
---@deprecated Does nothing
function Panel:AddText() end

---[CLIENT AND MENU] Aligns the panel on the bottom of its parent with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AlignBottom)
---@param offset? number The align offset.
function Panel:AlignBottom(offset) end

---[CLIENT AND MENU] Aligns the panel on the left of its parent with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AlignLeft)
---@param offset? number The align offset.
function Panel:AlignLeft(offset) end

---[CLIENT AND MENU] Aligns the panel on the right of its parent with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AlignRight)
---@param offset? number The align offset.
function Panel:AlignRight(offset) end

---[CLIENT AND MENU] Aligns the panel on the top of its parent with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AlignTop)
---@param offset? number The align offset.
function Panel:AlignTop(offset) end

---[CLIENT AND MENU] Uses animation to transition the current alpha value of a panel to a new alpha, over a set period of time and after a specified delay.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AlphaTo)
---@param alpha number The alpha value (0-255) to approach.
---@param duration number The time in seconds it should take to reach the alpha.
---@param delay? number The delay before the animation starts.
---@param callback? function The function to be called once the animation finishes. Arguments are:
--- * table animData - The AnimationData that was used. See Structures/AnimationData
--- * Panel pnl - The panel object whose alpha was changed.
function Panel:AlphaTo(alpha, duration, delay, callback) end

---[CLIENT] Called every frame unless Panel:IsVisible is set to false. Similar to PANEL:Think, but can be disabled by Panel:SetAnimationEnabled as explained below.
---
--- If you are overriding this, you must call Panel:AnimationThinkInternal every frame, else animations will cease to work.
---
--- If you want to "disable" this hook with Panel:SetAnimationEnabled, you must call it after defining this hook. Once disabled, a custom hook **will not** be re-enabled by Panel:SetAnimationEnabled again - the hook will have to be re-defined.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:AnimationThink)
function PANEL:AnimationThink() end

---[CLIENT AND MENU] Performs the per-frame operations required for panel animations.
---
--- This is called every frame by PANEL:AnimationThink.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AnimationThinkInternal)
function Panel:AnimationThinkInternal() end

---[CLIENT AND MENU] Returns the Global.SysTime value when all animations for this panel object will end.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AnimTail)
---@return number # The system time value when all animations will end for this panel.
function Panel:AnimTail() end

---[CLIENT AND MENU] Appends text to a RichText element. This does not automatically add a new line.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AppendText)
---@param txt string The text to append (add on).
function Panel:AppendText(txt) end

---[CLIENT AND MENU] Appends text to a RichText element (exactly like Panel:AppendText), while also parsing and adding valid URLs (Panel:InsertClickableTextStart). This does not automatically add a new line.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:AppendTextWithURLs)
---@param txt string The text to append (add on).
function Panel:AppendTextWithURLs(txt) end

---[CLIENT AND MENU] Used by Panel:LoadGWENFile and Panel:LoadGWENString to apply a GWEN controls table to a panel object.
---
--- You can do this manually using file.Read and util.JSONToTable to import and create a GWEN table structure from a `.gwen` file. This method can then be called, passing the GWEN table's `Controls` member.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ApplyGWEN)
---@param GWENTable table The GWEN controls table to apply to the panel.
function Panel:ApplyGWEN(GWENTable) end

---[CLIENT] Called whenever the panel should apply its scheme (colors, fonts, style).
---
--- It is called a few frames after Panel's creation once.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:ApplySchemeSettings)
function PANEL:ApplySchemeSettings() end

---[CLIENT AND MENU] Centers the panel on its parent.
--- 	This will center the panel using the current size of the panel so should be called AFTER setting or adjusting the size of the 	panel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Center)
function Panel:Center() end

---[CLIENT AND MENU] Centers the panel horizontally with specified fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CenterHorizontal)
---@param fraction? number The center fraction.
function Panel:CenterHorizontal(fraction) end

---[CLIENT AND MENU] Centers the panel vertically with specified fraction.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CenterVertical)
---@param fraction? number The center fraction.
function Panel:CenterVertical(fraction) end

---[CLIENT AND MENU] Returns the amount of children of the of panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ChildCount)
---@return number # The amount of children the panel has.
function Panel:ChildCount() end

---[CLIENT AND MENU] Returns the width and height of the space between the position of the panel (upper-left corner) and the max bound of the children panels (farthest reaching lower-right corner).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ChildrenSize)
---@return number # The children size width.
---@return number # The children size height.
function Panel:ChildrenSize() end

---[CLIENT AND MENU] Removes all of the panel's children.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Clear)
function Panel:Clear() end

---[CLIENT AND MENU] Fades panels color to specified one. It won't work unless panel has SetColor function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ColorTo)
---@param color table The color to fade to
---@param length number Length of the animation
---@param delay number Delay before start fading
---@param callback function Function to execute when finished
function Panel:ColorTo(color, length, delay, callback) end

---[CLIENT AND MENU] Updates a panel object's associated console variable. This must first be set up with Global.Derma_Install_Convar_Functions, and have a ConVar set using Panel:SetConVar.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ConVarChanged)
---@param newValue string The new value to set the associated console variable to.
function Panel:ConVarChanged(newValue) end

---[CLIENT AND MENU] A think hook for Panels using ConVars as a value. Call it in the Think hook. Sets the panel's value should the convar change.
---
--- This function is best for: checkboxes, sliders, number wangs
---
--- For a string alternative, see Panel:ConVarStringThink.
---
--- Make sure your Panel has a SetValue function, else you may get errors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ConVarNumberThink)
function Panel:ConVarNumberThink() end

---[CLIENT AND MENU] A think hook for Panel using ConVars as a value. Call it in the Think hook. Sets the panel's value should the convar change.
---
--- This function is best for: text inputs, read-only inputs, dropdown selects
---
--- For a number alternative, see Panel:ConVarNumberThink.
---
--- Make sure your Panel has a SetValue function, else you may get errors.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ConVarStringThink)
function Panel:ConVarStringThink() end

---[CLIENT AND MENU] Gets the size, position and dock state of the passed panel object, and applies it to this one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CopyBase)
---@param srcPanel Panel The panel to copy the boundary and dock settings from.
function Panel:CopyBase(srcPanel) end

---[CLIENT AND MENU] Copies position and size of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CopyBounds)
---@param base Panel The panel to copy size and position from.
function Panel:CopyBounds(base) end

---[CLIENT AND MENU] Copies the height of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CopyHeight)
---@param base Panel Panel to copy the height from.
function Panel:CopyHeight(base) end

---[CLIENT AND MENU] Copies the position of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CopyPos)
---@param base Panel Panel to position the width from.
function Panel:CopyPos(base) end

---[CLIENT AND MENU] Performs the CONTROL + C key combination effect ( Copy selection to clipboard ) on selected text in a TextEntry or RichText based element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CopySelected)
function Panel:CopySelected() end

---[CLIENT AND MENU] Copies the width of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CopyWidth)
---@param base Panel Panel to copy the width from.
function Panel:CopyWidth(base) end

---[CLIENT AND MENU] Returns the cursor position relative to the top left of the panel.
---
--- This is equivalent to calling gui.MousePos and then Panel:ScreenToLocal.
---
--- This function uses a cached value for the screen position of the panel, computed at the end of the last VGUI Think/Layout pass.
---
--- ie. inaccurate results may be returned if the panel or any of its ancestors have been repositioned outside of PANEL:Think or PANEL:PerformLayout within the last frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CursorPos)
---@return number # X coordinate of the cursor, relative to the top left of the panel.
---@return number # Y coordinate of the cursor, relative to the top left of the panel.
function Panel:CursorPos() end

---[CLIENT AND MENU] Performs the CONTROL + X (delete text and copy it to clipboard buffer) action on selected text in a TextEntry or RichText based element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:CutSelected)
function Panel:CutSelected() end

---[CLIENT AND MENU] Deletes a cookie value using the panel's cookie name ( Panel:GetCookieName ) and the passed extension.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DeleteCookie)
---@param cookieName string The unique cookie name to delete.
function Panel:DeleteCookie(cookieName) end

---[CLIENT AND MENU] Resets the panel object's Panel:SetPos method and removes its animation table (`Panel.LerpAnim`). This effectively undoes the changes made by Panel:LerpPositions.
---
--- In order to use Lerp animation again, you must call Panel:Stop before setting its `SetPosReal` property to `nil`. See the example below.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DisableLerp)
function Panel:DisableLerp() end

---[CLIENT AND MENU] Returns the linear distance from the center of this panel object and another. **Both panels must have the same parent for this function to work properly.**
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Distance)
---@param tgtPanel Panel The target object with which to compare position.
---@return number # The linear (straight-line) distance between the center of the two objects.
function Panel:Distance(tgtPanel) end

---[CLIENT AND MENU] Returns the distance between the center of this panel object and a specified point **local to the parent panel**.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DistanceFrom)
---@param posX number The horizontal (x) position in pixels of the point to compare with. Local to the parent panel, or container, not the panel the function is called on.
---@param posY number The vertical (y) position in pixels of the point to compare with. Local to the parent panel, or container, not the panel the function is called on.
---@return number # The linear (straight-line) distance between the specified point local to parent panel and the center of this panel object.
function Panel:DistanceFrom(posX, posY) end

---[CLIENT AND MENU] Sets the dock type for the panel, making the panel "dock" in a certain direction, modifying it's position and size.
---
--- You can set the inner spacing of a panel's docking using Panel:DockPadding, which will affect docked child panels, and you can set the outer spacing of a panel's docking using Panel:DockMargin, which affects how docked siblings are positioned/sized.
---
--- You may need to use Panel:SetZPos to ensure child panels (DTextEntry) stay in a specific order.
---
--- After using this function, if you want to get the correct panel's bounds (position, size), use Panel:InvalidateParent (use `true` as argument if you need to update immediately)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Dock)
---@param dockType number Dock type using Enums/DOCK.
function Panel:Dock(dockType) end

---[CLIENT AND MENU] Sets the dock margin of the panel.
---
--- The dock margin is the extra space that will be left around the edge when this element is docked inside its parent element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DockMargin)
---@param marginLeft number The left margin to the parent.
---@param marginTop number The top margin to the parent.
---@param marginRight number The right margin to the parent.
---@param marginBottom number The bottom margin to the parent.
function Panel:DockMargin(marginLeft, marginTop, marginRight, marginBottom) end

---[CLIENT AND MENU] Sets the dock padding of the panel.
---
--- The dock padding is the extra space that will be left around the edge when child elements are docked inside this element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DockPadding)
---@param paddingLeft number The left padding to the parent.
---@param paddingTop number The top padding to the parent.
---@param paddingRight number The right padding to the parent.
---@param paddingBottom number The bottom padding to the parent.
function Panel:DockPadding(paddingLeft, paddingTop, paddingRight, paddingBottom) end

---[CLIENT AND MENU] Makes the panel "lock" the screen until it is removed. All input will be directed to the given panel.
---
--- It will silently fail if used while cursor is not visible.
--- Call Panel:MakePopup before calling this function.
--- This must be called on a panel derived from EditablePanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DoModal)
function Panel:DoModal() end

---[CLIENT AND MENU] Called by Panel:DragMouseRelease when a user clicks one mouse button whilst dragging with another.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DragClick)
---@return boolean # Always returns `true`.
function Panel:DragClick() end

---[CLIENT AND MENU] Called by dragndrop.HoverThink to perform actions on an object that is dragged and hovered over another.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DragHover)
---@param HoverTime number If this time is greater than 0.1, PANEL:DragHoverClick is called, passing it as an argument.
function Panel:DragHover(HoverTime) end

---[CLIENT] Called when an object is dragged and hovered over this panel for 0.1 seconds.
---
--- This is used by DPropertySheet and DTree, for example to open a tab or expand a node when an object is hovered over it.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:DragHoverClick)
---@param hoverTime number The time the object was hovered over this panel.
function PANEL:DragHoverClick(hoverTime) end

---[CLIENT AND MENU] Called to end a drag and hover action. This resets the panel's PANEL:PaintOver method, and is primarily used by dragndrop.StopDragging.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DragHoverEnd)
function Panel:DragHoverEnd() end

---[CLIENT AND MENU] Called to inform the dragndrop that a mouse button is being held down on a panel object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DragMousePress)
---@param mouseCode number The code for the mouse button pressed, passed by, for example, PANEL:OnMousePressed. See the Enums/MOUSE.
function Panel:DragMousePress(mouseCode) end

---[CLIENT AND MENU] Called to inform the dragndrop that a mouse button has been depressed on a panel object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DragMouseRelease)
---@param mouseCode number The code for the mouse button pressed, passed by, for example, PANEL:OnMouseReleased. See the Enums/MOUSE.
---@return boolean # `true` if an object was being dragged, otherwise `false`.
function Panel:DragMouseRelease(mouseCode) end

---[CLIENT AND MENU] Called to draw the drop target when an object is being dragged across another. See Panel:SetDropTarget.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DrawDragHover)
---@param x number The x coordinate of the top-left corner of the drop area.
---@param y number The y coordinate of the top-left corner of the drop area.
---@param width number The width of the drop area.
---@param height number The height of the drop area.
function Panel:DrawDragHover(x, y, width, height) end

---[CLIENT AND MENU] Draws a coloured rectangle to fill the panel object this method is called on. The colour is set using surface.SetDrawColor. This should only be called within the object's PANEL:Paint or PANEL:PaintOver hooks, as a shortcut for surface.DrawRect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DrawFilledRect)
function Panel:DrawFilledRect() end

---[CLIENT AND MENU] Draws a hollow rectangle the size of the panel object this method is called on, with a border width of 1 px. The border colour is set using surface.SetDrawColor. This should only be called within the object's PANEL:Paint or PANEL:PaintOver hooks, as a shortcut for surface.DrawOutlinedRect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DrawOutlinedRect)
function Panel:DrawOutlinedRect() end

---[CLIENT AND MENU] Used to draw the magenta highlight colour of a panel object when it is selected. This should be called in the object's PANEL:PaintOver hook. Once this is implemented, the highlight colour will be displayed only when the object is selectable and selected. This is achieved using Panel:SetSelectable and Panel:SetSelected respectively.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DrawSelections)
function Panel:DrawSelections() end

---[CLIENT AND MENU] Used to draw the text in a DTextEntry within a derma skin. This should be called within the SKIN:PaintTextEntry skin hook.
--- Will silently fail if any of arguments are not Color.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DrawTextEntryText)
---@param textCol table The colour of the main text.
---@param highlightCol table The colour of the selection highlight (when selecting text).
---@param cursorCol table The colour of the text cursor (or caret).
function Panel:DrawTextEntryText(textCol, highlightCol, cursorCol) end

---[CLIENT AND MENU] Draws a textured rectangle to fill the panel object this method is called on. The texture is set using surface.SetTexture or surface.SetMaterial. This should only be called within the object's PANEL:Paint or PANEL:PaintOver hooks, as a shortcut for surface.DrawTexturedRect.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:DrawTexturedRect)
function Panel:DrawTexturedRect() end

---[CLIENT AND MENU] Makes this panel droppable. This is used with Panel:Receiver to create drag and drop events.
---
--- Can be called multiple times with different names allowing to be dropped onto different receivers.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Droppable)
---@param name string Name of your droppable panel
---@return table # Blank table stored on the panel itself under pnl.m_DragSlot[ name ]. Is reset every time this function is called and does not appear to be used or exposed anywhere else.
function Panel:Droppable(name) end

---[CLIENT] Called when this panel is dropped onto another panel.
---
--- Only works for panels derived from DDragBase.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:DroppedOn)
---@param pnl Panel The panel we are dropped onto
function PANEL:DroppedOn(pnl) end

---[CLIENT AND MENU] Completes a box selection. If the end point of the selection box is within the selection canvas, mouse capture is disabled for the panel object, and the selected state of each child object within the selection box is toggled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:EndBoxSelection)
---@return boolean # Whether the end point of the selection box was within the selection canvas.
function Panel:EndBoxSelection() end

---[CLIENT AND MENU] Used to run commands within a DHTML window.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Exec)
---@param cmd string The command to be run.
function Panel:Exec(cmd) end

---[CLIENT AND MENU] Finds a panel in its children(and sub children) with the given name.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Find)
---@param panelName string The name of the panel that should be found.
---@return Panel # foundPanel
function Panel:Find(panelName) end

---[CLIENT AND MENU] Focuses the next panel in the focus queue.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:FocusNext)
function Panel:FocusNext() end

---[CLIENT AND MENU] Focuses the previous panel in the focus queue.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:FocusPrevious)
function Panel:FocusPrevious() end

---[CLIENT] Called when the panel should generate example use case / example code to use for this panel. Used in the panel opened by **derma_controls** console command.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:GenerateExample)
---@param class string The classname of the panel to generate example for. This will be the class name of your panel.
---@param dpropertysheet Panel A DPropertySheet to add your example to. See examples below.
---@param width number Width of the property sheet?
---@param height number Width of the property sheet?
function PANEL:GenerateExample(class, dpropertysheet, width, height) end

---[CLIENT AND MENU] Returns the alpha multiplier for this panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetAlpha)
---@return number # alphaMul
function Panel:GetAlpha() end

---[CLIENT AND MENU] Returns the background color of a panel such as a RichText, Label or DColorCube.
---
--- This doesn't apply to all VGUI elements and its function varies between them
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetBGColor)
---@return number # The Color structure
function Panel:GetBGColor() end

---[CLIENT AND MENU] Returns the position and size of the panel.
---
--- This is equivalent to calling Panel:GetPos and Panel:GetSize together.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetBounds)
---@return number # The x coordinate of the panel, relative to its parent's top left.
---@return number # The y coordinate of the panel, relative to its parent's top left.
---@return number # The width of the panel.
---@return number # The height of the panel.
function Panel:GetBounds() end

---[CLIENT AND MENU] Returns the position/offset of the caret (or text cursor) in a text-based panel object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetCaretPos)
---@return number # The caret position/offset from the start of the text. A value of `0` means the caret sits before the first character.
function Panel:GetCaretPos() end

---[CLIENT AND MENU] Gets a child by its index. For use with Panel:ChildCount.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetChild)
---@param childIndex number The index of the child to get.
---
--- This index starts at 0, except when you use this on a DMenu.
function Panel:GetChild(childIndex) end

---[CLIENT AND MENU] Gets a child object's position relative to this panel object. The number of levels is not relevant; the child may have many parents between itself and the object on which the method is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetChildPosition)
---@param pnl Panel The panel to get the position of.
---@return number # The horizontal (x) position of the child relative to this panel object.
---@return number # The vertical (y) position of the child relative to this panel object.
function Panel:GetChildPosition(pnl) end

---[CLIENT AND MENU] Returns a table with all the child panels of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetChildren)
---@return table # All direct children of this panel.
function Panel:GetChildren() end

---[CLIENT AND MENU] Returns a table of all visible, selectable children of the panel object that lie at least partially within the specified rectangle.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetChildrenInRect)
---@param x number The horizontal (x) position of the top-left corner of the rectangle, relative to the panel object.
---@param y number The vertical (y) position of the top-left corner of the rectangle, relative to the panel object.
---@param w number The width of the rectangle.
---@param h number The height of the rectangle.
---@return table # A table of panel objects that lie at least partially within the specified rectangle.
function Panel:GetChildrenInRect(x, y, w, h) end

---[CLIENT AND MENU] Returns the class name of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetClassName)
---@return string # className
function Panel:GetClassName() end

---[CLIENT AND MENU] Returns the child of this panel object that is closest to the specified point. The point is relative to the object on which the method is called. The distance the child is from this point is also returned.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetClosestChild)
---@param x number The horizontal (x) position of the point.
---@param y number The vertical (y) position of the point.
---@return Panel # The child object that was closest to the specified point.
---@return number # The distance that this child was from the point.
function Panel:GetClosestChild(x, y) end

---[CLIENT AND MENU] Gets the size of the content/children within a panel object.
---
--- Only works with Label derived panels by default such as DLabel.
---
---
--- Will also work on any panel that manually implements this method.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetContentSize)
---@return number # The content width of the object.
---@return number # The content height of the object.
function Panel:GetContentSize() end

---[CLIENT AND MENU] Gets the value of a cookie stored by the panel object. This can also be done with cookie.GetString, using the panel's cookie name, a fullstop, and then the actual name of the cookie.
---
--- Make sure the panel's cookie name has not changed since writing, or the cookie will not be accessible. This can be done with Panel:GetCookieName and Panel:SetCookieName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetCookie)
---@param cookieName string The name of the cookie from which to retrieve the value.
---@param default string The default value to return if the cookie does not exist.
---@return string # The value of the stored cookie, or the default value should the cookie not exist.
function Panel:GetCookie(cookieName, default) end

---[CLIENT AND MENU] Gets the name the panel uses to store cookies. This is set with Panel:SetCookieName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetCookieName)
---@return string # The name the panel uses when reading or writing cookies. The format used is as follows:  ``` panelCookieName.individualCookieName ```
function Panel:GetCookieName() end

---[CLIENT AND MENU] Gets the value of a cookie stored by the panel object, as a number. This can also be done with cookie.GetNumber, using the panel's cookie name, a fullstop, and then the actual name of the cookie.
---
--- Make sure the panel's cookie name has not changed since writing, or the cookie will not be accessible. This can be done with Panel:GetCookieName and Panel:SetCookieName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetCookieNumber)
---@param cookieName string The name of the cookie from which to retrieve the value.
---@param default number The default value to return if the cookie does not exist.
---@return number # The number value of the stored cookie, or the default value should the cookie not exist.
function Panel:GetCookieNumber(cookieName, default) end

---[CLIENT AND MENU] Returns a dock enum for the panel's current docking type.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetDock)
---@return number # The dock enum for the panel. See Enums/DOCK.
function Panel:GetDock() end

---[CLIENT AND MENU] Returns the docked margins of the panel. (set by Panel:DockMargin)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetDockMargin)
---@return number # Left margin.
---@return number # Top margin.
---@return number # Right margin.
---@return number # Bottom margin.
function Panel:GetDockMargin() end

---[CLIENT AND MENU] Returns the docked padding of the panel. (set by Panel:DockPadding)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetDockPadding)
---@return number # Left padding.
---@return number # Top padding.
---@return number # Right padding.
---@return number # Bottom padding.
function Panel:GetDockPadding() end

---[CLIENT AND MENU] Returns the foreground color of the panel.
---
--- For a Label or RichText, this is the color of its text.
---
--- This doesn't apply to all VGUI elements (such as DLabel) and its function varies between them
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetFGColor)
---@return table # A color structure. See Color
function Panel:GetFGColor() end

---[CLIENT AND MENU] Returns the name of the font that the panel renders its text with.
---
--- This is the same font name set with Panel:SetFontInternal.
---
--- Only works on Label and TextEntry and their derived panels by default (such as DLabel and DTextEntry), and on any panel that manually implemented the Panel:GetFont method.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetFont)
---@return string # fontName
function Panel:GetFont() end

---[CLIENT] Returns the panel's HTML material. Only works with Awesomium, HTML and DHTML panels that have been fully loaded.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetHTMLMaterial)
---@return IMaterial # The HTML material used by the panel. Typically starts with `__vgui_texture_` followed by an incremental number.
function Panel:GetHTMLMaterial() end

---[CLIENT AND MENU] Returns the height of a single line of a RichText panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetLineHeight)
---@return number # The line height.
function Panel:GetLineHeight() end

---[CLIENT AND MENU] Returns the current maximum character count.
---
--- This function will only work on RichText and TextEntry panels and their derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetMaximumCharCount)
---@return number # The maximum amount of characters this panel is allowed to contain.
function Panel:GetMaximumCharCount() end

---[CLIENT AND MENU] Returns the internal name of the panel. Can be set via Panel:SetName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetName)
---@return string # The previously set internal name of the panel.
function Panel:GetName() end

---[CLIENT AND MENU] Returns the number of lines in a RichText or a TextEntry.
---
--- You must wait a couple frames before calling this after using Panel:AppendText or Panel:SetText, otherwise it will return the number of text lines before the text change.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetNumLines)
---@return number # The number of lines.
function Panel:GetNumLines() end

---[CLIENT AND MENU] Returns the parent of the panel, returns nil if there is no parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetParent)
---@return Panel # The parent of given panel
function Panel:GetParent() end

---[CLIENT AND MENU] Returns the position of the panel relative to its Panel:GetParent.
---
--- If you require the panel's position **and** size, consider using Panel:GetBounds instead.
---
--- If you need the position in screen space, see Panel:LocalToScreen.
---
--- See also Panel:GetX and Panel:GetY.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetPos)
---@return number # X coordinate, relative to this panels parents top left corner.
---@return number # Y coordinate, relative to this panels parents top left corner.
function Panel:GetPos() end

---[CLIENT AND MENU] Returns the vertical and horizontal start indexes of a TextEntry's visible text. This is useful when the panel is scrolled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetScrollStartIndexes)
---@return number # The horizontal start index. (characters)
---@return number # The vertical start index. (lines)
function Panel:GetScrollStartIndexes() end

---[CLIENT AND MENU] Returns a table of all children of the panel object that are selected. This is recursive, and the returned table will include tables for any child objects that also have children. This means that not all first-level members in the returned table will be of type Panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetSelectedChildren)
---@return table # A table of any child objects that are selected, including tables for children of the child objects (These tables may also contain table members, as the method is recursive).
function Panel:GetSelectedChildren() end

---[CLIENT AND MENU] Returns the currently selected range of text.
---
--- This function will only work on RichText and TextEntry panels and their derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetSelectedTextRange)
---@return number # The start of the range. If no text is selected it may be 0 and/or equal to the end range.
---@return number # The end of the range. If no text is selected it may be 0 and/or equal to the start range.
function Panel:GetSelectedTextRange() end

---[CLIENT AND MENU] Returns the panel object (`self`) if it has been enabled as a selection canvas. This is achieved using Panel:SetSelectionCanvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetSelectionCanvas)
---@return Panel # The panel object this method was called on if enabled as a selection canvas, otherwise `nil`.
function Panel:GetSelectionCanvas() end

---[CLIENT AND MENU] Returns the size of the panel.
---
--- If you require both the panel's position and size, consider using Panel:GetBounds instead.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetSize)
---@return number # width
---@return number # height
function Panel:GetSize() end

---[CLIENT AND MENU] Returns the table for the derma skin currently being used by this panel object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetSkin)
---@return table # The derma skin table currently being used by this object.
function Panel:GetSkin() end

---[CLIENT AND MENU] Returns the internal Lua table of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetTable)
---@return table # A table containing all the members of given panel object.
function Panel:GetTable() end

---[CLIENT AND MENU] Returns the height of the panel.
---
--- See Panel:GetWide for the width of the panel. See also Panel:GetSize for a function that returns both.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetTall)
---@return number # height
function Panel:GetTall() end

---[CLIENT AND MENU] Returns the panel's text (where applicable).
---
--- This method returns a maximum of 1023 bytes, except for DTextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetText)
---@return string # The panel's text.
function Panel:GetText() end

---[CLIENT AND MENU] Gets the left and top text margins of a text-based panel object, such as a DButton or DLabel. This is set with Panel:SetTextInset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetTextInset)
---@return number # The left margin of the text, in pixels.
---@return number # The top margin of the text, in pixels.
function Panel:GetTextInset() end

---[CLIENT AND MENU] Gets the size of the text within a Label derived panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetTextSize)
---@return number # The width of the text in the DLabel.
---@return number # The height of the text in the DLabel.
function Panel:GetTextSize() end

---[CLIENT AND MENU] Returns the tooltip text that was set with PANEL:SetTooltip.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetTooltip)
---@return string # The tooltip text, if it was set.
function Panel:GetTooltip() end

---[CLIENT AND MENU] Returns the tooltip delay (time between hovering over the panel, and the tooltip showing up) that was set with Panel:SetTooltipDelay, or nothing if it was not set.
---
--- If the delay is not explicitly set by this function, it will fallback to the value of the `tooltip_delay` ConVar, which is `0.5` by default.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetTooltipDelay)
---@return number # The tooltip delay in seconds, if it was set.
function Panel:GetTooltipDelay() end

---[CLIENT AND MENU] Returns the tooltip panel that was set with PANEL:SetTooltipPanel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetTooltipPanel)
---@return Panel # The tooltip panel, if it was set.
function Panel:GetTooltipPanel() end

---[CLIENT AND MENU] Gets valid receiver slot of currently dragged panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetValidReceiverSlot)
---@return Panel # The panel this was called on if a valid receiver slot exists, otherwise false.
---@return table # The slot table.
function Panel:GetValidReceiverSlot() end

---[CLIENT AND MENU] Returns the value the panel holds.
---
--- In engine is only implemented for CheckButton, Label and TextEntry as a string.
---
--- This function is limited to 8092 Bytes. If using DTextEntry, use Panel:GetText for unlimited bytes.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetValue)
---@return any # The value the panel holds.
function Panel:GetValue() end

---[CLIENT AND MENU] Returns the width of the panel.
---
--- See Panel:GetTall for the height of the panel. See also Panel:GetSize for a function that returns both.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetWide)
---@return number # width
function Panel:GetWide() end

---[CLIENT AND MENU] Returns the X position of the panel relative to its Panel:GetParent.
---
--- Uses Panel:GetPos internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetX)
---@return number # X coordinate.
function Panel:GetX() end

---[CLIENT AND MENU] Returns the Y position of the panel relative to its Panel:GetParent.
---
--- Uses Panel:GetPos internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetY)
---@return number # Y coordinate.
function Panel:GetY() end

---[CLIENT AND MENU] Returns the Z position of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GetZPos)
---@return number # The Z order position of the panel.
function Panel:GetZPos() end

---[CLIENT AND MENU] Goes back one page in the HTML panel's history if available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GoBack)
function Panel:GoBack() end

---[CLIENT AND MENU] Goes forward one page in the HTML panel's history if available.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GoForward)
function Panel:GoForward() end

---[CLIENT AND MENU] Goes to the page in the HTML panel's history at the specified relative offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GoToHistoryOffset)
---@param offset number The offset in the panel's back/forward history, relative to the current page, that you would like to skip to. Because this is relative, 0 = current page while negative goes back and positive goes forward. For example, -2 will go back 2 pages in the history.
function Panel:GoToHistoryOffset(offset) end

---[CLIENT AND MENU] Causes a RichText element to scroll to the bottom of its text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GotoTextEnd)
function Panel:GotoTextEnd() end

---[CLIENT AND MENU] Causes a RichText element to scroll to the top of its text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GotoTextStart)
function Panel:GotoTextStart() end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `CheckboxText` property to a DCheckBoxLabel. This does exactly the same as Panel:GWEN_SetText, but exists to cater for the seperate GWEN properties.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetCheckboxText)
---@param txt string The text to be applied to the DCheckBoxLabel.
function Panel:GWEN_SetCheckboxText(txt) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `ControlName` property to a panel. This calls Panel:SetName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetControlName)
---@param name string The new name to apply to the panel.
function Panel:GWEN_SetControlName(name) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `Dock` property to a  panel object. This calls Panel:Dock.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetDock)
---@param dockState string The dock mode to pass to the panel's `Dock` method. This reads a string and applies the approriate Enums/DOCK.
--- * `Right`: Dock right.
--- * `Left`: Dock left.
--- * `Bottom`: Dock at the bottom.
--- * `Top`: Dock at the top.
--- * `Fill`: Fill the parent panel.
function Panel:GWEN_SetDock(dockState) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `HorizontalAlign` property to a  panel object. This calls Panel:SetContentAlignment.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetHorizontalAlign)
---@param hAlign string The alignment, as a string, to pass to Panel:SetContentAlignment. Accepts:
--- * `Right`: Align mid-right.
--- * `Left`: Align mid-left.
--- * `Center`: Align mid-center.
function Panel:GWEN_SetHorizontalAlign(hAlign) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `Margin` property to a  panel object. This calls Panel:DockMargin.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetMargin)
---@param margins table A four-membered table containing the margins as numbers:
--- * number left - The left margin.
--- * number top - The top margin.
--- * number right - The right margin.
--- * number bottom - The bottom margin.
function Panel:GWEN_SetMargin(margins) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `Max` property to a  DNumberWang, Slider, DNumSlider or DNumberScratch. This calls `SetMax` on one of the previously listed methods.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetMax)
---@param maxValue number The maximum value the element is to permit.
function Panel:GWEN_SetMax(maxValue) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `Min` property to a  DNumberWang, Slider, DNumSlider or DNumberScratch. This calls `SetMin` on one of the previously listed methods.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetMin)
---@param minValue number The minimum value the element is to permit.
function Panel:GWEN_SetMin(minValue) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `Position` property to a  panel object. This calls Panel:SetPos.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetPosition)
---@param pos table A two-membered table containing the x and y coordinates as numbers:
--- * number x - The x coordinate.
--- * number y - The y coordinate.
function Panel:GWEN_SetPosition(pos) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `Size` property to a  panel object. This calls Panel:SetSize.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetSize)
---@param size table A two-membered table containing the width and heights as numbers:
--- * number w - The width.
--- * number h - The height.
function Panel:GWEN_SetSize(size) end

---[CLIENT AND MENU] Used by Panel:ApplyGWEN to apply the `Text` property to a panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:GWEN_SetText)
---@param txt string The text to be applied to the panel.
function Panel:GWEN_SetText(txt) end

---[CLIENT AND MENU] Returns whenever the panel has child panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:HasChildren)
---@return boolean # hasChilds
function Panel:HasChildren() end

---[CLIENT AND MENU] Returns if the panel is focused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:HasFocus)
---@return boolean # hasFocus
function Panel:HasFocus() end

---[CLIENT AND MENU] Returns if the panel or any of its children(sub children and so on) has the focus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:HasHierarchicalFocus)
---@return boolean # hasHierarchicalFocus
function Panel:HasHierarchicalFocus() end

---[CLIENT AND MENU] Returns whether the panel is a descendent of the given panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:HasParent)
---@param parentPanel Panel
---@return boolean # True if the panel is contained within parentPanel.
function Panel:HasParent(parentPanel) end

---[CLIENT AND MENU] Makes a panel invisible.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Hide)
function Panel:Hide() end

---[CLIENT] Called when the panel is created. This is called for each base type that the panel has.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:Init)
function PANEL:Init() end

---[CLIENT AND MENU] Marks the end of a clickable text segment in a RichText element, started with Panel:InsertClickableTextStart.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:InsertClickableTextEnd)
function Panel:InsertClickableTextEnd() end

---[CLIENT AND MENU] Starts the insertion of clickable text for a RichText element. Any text appended with Panel:AppendText between this call and Panel:InsertClickableTextEnd will become clickable text.
---
--- The hook PANEL:OnTextClicked is called when the text is clicked.
---
--- The clickable text is a separate Derma panel which will not inherit the current font from the `RichText`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:InsertClickableTextStart)
---@param signalValue string The text passed as the action signal's value.
function Panel:InsertClickableTextStart(signalValue) end

---[CLIENT AND MENU] Inserts a color change in a RichText element, which affects the color of all text added with Panel:AppendText until another color change is applied.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:InsertColorChange)
---@param r number The red value `(0 - 255)`.
---@param g number The green value `(0 - 255)`.
---@param b number The blue value `(0 - 255)`.
---@param a number The alpha value `(0 - 255)`.
function Panel:InsertColorChange(r, g, b, a) end

---[CLIENT AND MENU] Begins a text fade for a RichText element where the last appended text segment is fully faded out after a specific amount of time, at a specific speed.
---
--- The alpha of the text at any given time is determined by the text's base alpha * ((`sustain` - Global.CurTime) / `length`) where Global.CurTime is added to `sustain` when this method is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:InsertFade)
---@param sustain number The number of seconds the text remains visible.
---@param length number The number of seconds it takes the text to fade out.
---
--- If set **lower** than `sustain`, the text will not begin fading out until (`sustain` - `length`) seconds have passed.
---
--- If set **higher** than `sustain`, the text will begin fading out immediately at a fraction of the base alpha.
---
--- If set to **-1**, the text doesn't fade out.
function Panel:InsertFade(sustain, length) end

---[CLIENT AND MENU] Invalidates the layout of this panel object and all its children. This will cause these objects to re-layout immediately, calling PANEL:PerformLayout. If you want to perform the layout in the next frame, you will have loop manually through all children, and call Panel:InvalidateLayout on each.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:InvalidateChildren)
---@param recursive? boolean If `true`, the method will recursively invalidate the layout of all children. Otherwise, only immediate children are affected.
function Panel:InvalidateChildren(recursive) end

---[CLIENT AND MENU] Causes the panel to re-layout in the next frame. During the layout process  PANEL:PerformLayout will be called on the target panel.
---
--- You should avoid calling this function every frame.
---
--- Using this on a panel after clicking on a docked element will cause docked elements to reorient themselves incorrectly. This can be fixed by assigning a unique Panel:SetZPos to each docked element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:InvalidateLayout)
---@param layoutNow? boolean If true the panel will re-layout instantly and not wait for the next frame.
function Panel:InvalidateLayout(layoutNow) end

---[CLIENT AND MENU] Calls Panel:InvalidateLayout on the panel's Panel:GetParent. This function will silently fail if the panel has no parent.
---
--- This will cause the parent panel to re-layout, calling PANEL:PerformLayout.
---
--- Internally sets `LayingOutParent` to `true` on this panel, and will silently fail if it is already set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:InvalidateParent)
---@param layoutNow? boolean If `true`, the re-layout will occur immediately, otherwise it will be performed in the next frame.
function Panel:InvalidateParent(layoutNow) end

---[CLIENT AND MENU] Determines whether the mouse cursor is hovered over one of this panel object's children. This is a reverse process using vgui.GetHoveredPanel, and looks upward to find the parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsChildHovered)
---@param immediate? boolean Set to true to check only the immediate children of given panel ( first level )
---@return boolean # Whether or not one of this panel object's children is being hovered over.
function Panel:IsChildHovered(immediate) end

---[CLIENT AND MENU] Returns whether this panel is draggable ( if user is able to drag it ) or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsDraggable)
---@return boolean # Whether this panel is draggable ( if user is able to drag it ) or not.
function Panel:IsDraggable() end

---[CLIENT AND MENU] Returns whether this panel is currently being dragged or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsDragging)
---@return boolean # Whether this panel is currently being dragged or not.
function Panel:IsDragging() end

---[CLIENT AND MENU] Returns whether the the panel is enabled or disabled.
---
--- See Panel:SetEnabled for a function that makes the panel enabled or disabled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsEnabled)
---@return boolean # Whether the panel is enabled or disabled.
function Panel:IsEnabled() end

---[CLIENT AND MENU] Returns whether the mouse cursor is hovering over this panel or not
---
--- Uses vgui.GetHoveredPanel internally.
---
--- Requires Panel:SetMouseInputEnabled to be set to true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsHovered)
---@return boolean # true if the panel is hovered
function Panel:IsHovered() end

---[CLIENT AND MENU] Returns true if the panel can receive keyboard input.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsKeyboardInputEnabled)
---@return boolean # keyboardInputEnabled
function Panel:IsKeyboardInputEnabled() end

---[CLIENT AND MENU] Determines whether or not a HTML or DHTML element is currently loading a page.
---
--- Before calling Panel:SetHTML or DHTML:OpenURL, the result seems to be `false` with the Awesomium web renderer and `true` for the Chromium web renderer. This difference can be used to determine the available HTML5 capabilities.
--- On Awesomium, the result remains `true` until the root document is loaded and when in-page content is loading (when adding pictures, frames, etc.). During this state, the HTML texture is not refreshed and the panel is not painted (it becomes invisible).
---
--- On Chromium, the value is only `true` when the root document is not ready. The rendering is not suspended when in-page elements are loading.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsLoading)
---@return boolean # Whether or not the (D)HTML object is loading.
function Panel:IsLoading() end

---[CLIENT AND MENU] Returns if the panel is going to be deleted in the next frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsMarkedForDeletion)
---@return boolean # markedForDeletion
function Panel:IsMarkedForDeletion() end

---[CLIENT AND MENU] Returns whether the panel was made modal or not. See Panel:DoModal.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsModal)
---@return boolean # True if the panel is modal.
function Panel:IsModal() end

---[CLIENT AND MENU] Returns true if the panel can receive mouse input.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsMouseInputEnabled)
---@return boolean # mouseInputEnabled
function Panel:IsMouseInputEnabled() end

---[CLIENT AND MENU] Determines whether or not a TextEntry panel is in multi-line mode. This is set with Panel:SetMultiline.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsMultiline)
---@return boolean # Whether the object is in multi-line mode or not.
function Panel:IsMultiline() end

---[CLIENT AND MENU] Returns whether the panel contains the given panel, recursively.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsOurChild)
---@param childPanel Panel
---@return boolean # True if the panel contains childPanel.
function Panel:IsOurChild(childPanel) end

---[CLIENT AND MENU] Returns if the panel was made popup or not. See Panel:MakePopup
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsPopup)
---@return boolean # `true` if the panel was made popup.
function Panel:IsPopup() end

---[CLIENT AND MENU] Determines if the panel object is selectable (like icons in the Spawn Menu, holding Shift). This is set with Panel:SetSelectable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsSelectable)
---@return boolean # Whether the panel is selectable or not.
function Panel:IsSelectable() end

---[CLIENT AND MENU] Returns if the panel object is selected (like icons in the Spawn Menu, holding Shift). This can be set in Lua using Panel:SetSelected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsSelected)
---@return boolean # Whether the panel object is selected or not. Always returns false if the object is not selectable. This can be modified using Panel:SetSelectable.
function Panel:IsSelected() end

---[CLIENT AND MENU] Determines if the panel object is a selection canvas or not. This is set with Panel:SetSelectionCanvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsSelectionCanvas)
---@return any # The value (if any) set by Panel:SetSelectionCanvas.
function Panel:IsSelectionCanvas() end

---[CLIENT AND MENU] Returns if the panel is valid and not marked for deletion.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsValid)
---@return boolean # True if the object is valid.
function Panel:IsValid() end

---[CLIENT AND MENU] Returns if the panel is visible. This will **NOT** take into account visibility of the parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsVisible)
---@return boolean # `true` if the panel ls visible, `false` otherwise.
function Panel:IsVisible() end

---[CLIENT AND MENU] Returns if a panel allows world clicking set by Panel:SetWorldClicker.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:IsWorldClicker)
---@return boolean # If the panel allows world clicking.
function Panel:IsWorldClicker() end

---[CLIENT AND MENU] Remove the focus from the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:KillFocus)
function Panel:KillFocus() end

---[CLIENT AND MENU] Redefines the panel object's Panel:SetPos method to operate using frame-by-frame linear interpolation (Global.Lerp). When the panel's position is changed, it will move to the target position at the speed defined. You can undo this with Panel:DisableLerp.
---
--- Unlike the other panel animation functions, such as Panel:MoveTo, this animation method will not operate whilst the game is paused. This is because it relies on Global.FrameTime.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LerpPositions)
---@param speed number The speed at which to move the panel. This is affected by the value of `easeOut`. Recommended values are:
--- * **0.1 - 10** when `easeOut` is `false`.
--- * **0.1 - 1** when `easeOut` is `true`.
---@param easeOut boolean This causes the panel object to 'jump' at the target, slowing as it approaches. This affects the `speed` value significantly, see above.
function Panel:LerpPositions(speed, easeOut) end

---[CLIENT AND MENU] Similar to Panel:LoadControlsFromString but loads controls from a file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LoadControlsFromFile)
---@param path string The path to load the controls from.
function Panel:LoadControlsFromFile(path) end

---[CLIENT AND MENU] Loads controls(positions, etc) from given data. This is what the default options menu uses.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LoadControlsFromString)
---@param data string The data to load controls from. Format unknown.
function Panel:LoadControlsFromString(data) end

---[CLIENT] Called after Panel:SetCookieName is called on this panel to apply the just loaded cookie values for this panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:LoadCookies)
function PANEL:LoadCookies() end

---[CLIENT AND MENU] Loads a .gwen file (created by GWEN Designer) and calls Panel:LoadGWENString with the contents of the loaded file.
---
--- Used to load panel controls from a file.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LoadGWENFile)
---@param filename string The file to open. The path is relative to garrysmod/garrysmod/.
---@param path? string The path used to look up the file.
---
--- * "GAME" Structured like base folder (garrysmod/), searches all the mounted content (main folder, addons, mounted games etc)
--- * "LUA" or "lsv" - All Lua folders (lua/) including gamesmodes and addons
--- * "DATA" Data folder (garrysmod/data)
--- * "MOD" Strictly the game folder (garrysmod/), ignores mounting.
function Panel:LoadGWENFile(filename, path) end

---[CLIENT AND MENU] Loads controls for the panel from a JSON string.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LoadGWENString)
---@param str string JSON string containing information about controls to create.
function Panel:LoadGWENString(str) end

---[CLIENT AND MENU] Sets a new image to be loaded by a TGAImage.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LoadTGAImage)
---@param imageName string The file path.
---@param strPath string The PATH to search in. See File Search Paths.
---
--- This isn't used internally.
function Panel:LoadTGAImage(imageName, strPath) end

---[CLIENT AND MENU] Returns the cursor position local to the position of the panel (usually the upper-left corner).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LocalCursorPos)
---@return number # The x coordinate
---@return number # The y coordinate
function Panel:LocalCursorPos() end

---[CLIENT AND MENU] Gets the absolute screen position of the position specified relative to the panel.
---
--- See also Panel:ScreenToLocal.
---
--- This function uses a cached value for the screen position of the panel, computed at the end of the last VGUI Think/Layout pass, so inaccurate results may be returned if the panel or any of its ancestors have been re-positioned outside of PANEL:Think or PANEL:PerformLayout within the last frame.
---
--- If the panel uses Panel:Dock, this function will return 0, 0 when the panel was created. The position will be updated in the next frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:LocalToScreen)
---@param posX number The X coordinate of the position on the panel to translate.
---@param posY number The Y coordinate of the position on the panel to translate.
---@return number # The X coordinate relative to the screen.
---@return number # The Y coordinate relative to the screen.
function Panel:LocalToScreen(posX, posY) end

---[CLIENT AND MENU] Focuses the panel and enables it to receive input.
---
--- This automatically calls Panel:SetMouseInputEnabled and Panel:SetKeyboardInputEnabled(lowercase) and sets them to `true`.
---
--- Panels derived from Panel will not work properly with this function. Due to this, any children will not be intractable with keyboard. Derive from EditablePanel instead.
---
--- For non gui related mouse focus, you can use gui.EnableScreenClicker.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MakePopup)
function Panel:MakePopup() end

---[CLIENT AND MENU] Allows the panel to receive mouse input even if the mouse cursor is outside the bounds of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MouseCapture)
---@param doCapture boolean Set to true to enable, set to false to disable.
function Panel:MouseCapture(doCapture) end

---[CLIENT AND MENU] Places the panel above the passed panel with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveAbove)
---@param panel Panel Panel to position relatively to.
---@param offset? number The align offset.
function Panel:MoveAbove(panel, offset) end

---[CLIENT AND MENU] Places the panel below the passed panel with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveBelow)
---@param panel Panel Panel to position relatively to.
---@param offset? number The align offset.
function Panel:MoveBelow(panel, offset) end

---[CLIENT AND MENU] Moves the panel by the specified coordinates using animation.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveBy)
---@param moveX number The number of pixels to move by in the horizontal (x) direction.
---@param moveY number The number of pixels to move by in the vertical (y) direction.
---@param time number The time (in seconds) in which to perform the animation.
---@param delay? number The delay (in seconds) before the animation begins.
---@param ease? number The easing of the start and/or end speed of the animation. See Panel:NewAnimation for how this works.
---@param callback? function The function to be called once the animation is complete. Arguments are:
--- * table animData - The AnimationData that was used.
--- * Panel pnl - The panel object that was moved.
function Panel:MoveBy(moveX, moveY, time, delay, ease, callback) end

---[CLIENT AND MENU] Places the panel left to the passed panel with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveLeftOf)
---@param panel Panel Panel to position relatively to.
---@param offset? number The align offset.
function Panel:MoveLeftOf(panel, offset) end

---[CLIENT AND MENU] Places the panel right to the passed panel with the specified offset.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveRightOf)
---@param panel Panel Panel to position relatively to.
---@param offset? number The align offset.
function Panel:MoveRightOf(panel, offset) end

---[CLIENT AND MENU] Moves the panel to the specified position using animation.
---     Setting the ease argument to 0 will result in the animation happening instantly, this applies to all MoveTo/SizeTo functions
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveTo)
---@param posX number The target x coordinate of the panel.
---@param posY number The target y coordinate of the panel.
---@param time number The time to perform the animation within.
---@param delay? number The delay before the animation starts.
---@param ease? number The easing of the start and/or end speed of the animation. See Panel:NewAnimation for how this works.
---@param callback function The function to be called once the animation finishes. Arguments are:
--- * table animData - The Structures/AnimationData that was used.
--- * Panel pnl - The panel object that was moved.
function Panel:MoveTo(posX, posY, time, delay, ease, callback) end

---[CLIENT AND MENU] Moves this panel object in front of the specified sibling (child of the same parent) in the render order, and shuffles up the Z-positions of siblings now behind.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveToAfter)
---@param siblingPanel Panel The panel to move this one in front of. Must be a child of the same parent panel.
---@return boolean # `false` if the passed panel is not a sibling, otherwise `nil`.
function Panel:MoveToAfter(siblingPanel) end

---[CLIENT AND MENU] Moves the panel object behind all other panels on screen. If the panel has been made a pop-up with Panel:MakePopup, it will still draw in front of any panels that haven't.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveToBack)
function Panel:MoveToBack() end

---[CLIENT AND MENU] Moves this panel object behind the specified sibling (child of the same parent) in the render order, and shuffles up the Panel:SetZPos of siblings now in front.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveToBefore)
---@param siblingPanel Panel The panel to move this one behind. Must be a child of the same parent panel.
---@return boolean # `false` if the passed panel is not a sibling, otherwise `nil`.
function Panel:MoveToBefore(siblingPanel) end

---[CLIENT AND MENU] Moves the panel in front of all other panels on screen. Unless the panel has been made a pop-up using Panel:MakePopup, it will still draw behind any that have.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:MoveToFront)
function Panel:MoveToFront() end

---[CLIENT AND MENU] Creates a new animation for the panel object.
---
--- Methods that use this function:
--- * Panel:MoveTo
--- * Panel:SizeTo
--- * Panel:SlideUp
--- * Panel:SlideDown
--- * Panel:ColorTo
--- * Panel:AlphaTo
--- * Panel:MoveBy
--- * Panel:LerpPositions
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:NewAnimation)
---@param length number The length of the animation in seconds.
---@param delay? number The delay before the animation starts.
---@param ease? number The power/index to use for easing.
--- * Positive values greater than 1 will ease in; the higher the number, the sharper the curve's gradient (less linear).
--- * A value of 1 removes all easing.
--- * Positive values between 0 and 1 ease out; values closer to 0 increase the curve's gradient (less linear).
--- * A value of 0 will break the animation and should be avoided.
--- * Any value less than zero will ease in/out; the value has no effect on the gradient.
---@param callback? function The function to be called when the animation ends. Arguments passed are:
--- * table animTable - The Structures/AnimationData that was used.
--- * Panel tgtPanel - The panel object that was animated.
---@return table # Partially filled Structures/AnimationData with members:  * number EndTime - Equal to `length` and `delay` arguments added together, plus either the Global.SysTime if there is no other animation queued or the end time of the last animation in the queue. * number StartTime - Equal to the `delay` argument, plus either the Global.SysTime if there is no other animation queued or the end time of the last animation in the queue. * number Ease - Equal to the `ease` argument. * function OnEnd - Equal to the `callback` argument.
function Panel:NewAnimation(length, delay, ease, callback) end

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:NewObject)
---@param objectName string
function Panel:NewObject(objectName) end

---[CLIENT AND MENU]
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:NewObjectCallback)
---@param objectName string
---@param callbackName string
function Panel:NewObjectCallback(objectName, callbackName) end

---[CLIENT AND MENU] Sets whether this panel's drawings should be clipped within the parent panel's bounds.
---
---
--- This only disabled clipping for the Paint Related functions (as far as i can tell at the current moment, more testing should be done) so things like the text of a DLabel will still be clipped to the parent.
---
--- To fully disable the clipping of any children see Global.DisableClipping.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:NoClipping)
---@param clip boolean Whether to clip or not.
function Panel:NoClipping(clip) end

---[CLIENT AND MENU] Returns the number of children of the panel object that are selected. This is equivalent to calling Panel:IsSelected on all child objects and counting the number of returns that are `true`.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:NumSelectedChildren)
---@return number # The number of child objects that are currently selected. This does not include the parent object you are calling the method from.
function Panel:NumSelectedChildren() end

---[CLIENT AND MENU] Called when we are activated during level load. Used by the loading screen panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnActivate)
function PANEL:OnActivate() end

---[CLIENT] Called whenever a child was parented to the panel.
---
--- This is called before the panel's metatable is set.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnChildAdded)
---@param child Panel The child which was added.
function PANEL:OnChildAdded(child) end

---[CLIENT] Called whenever a child of the panel is about to removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnChildRemoved)
---@param child Panel The child which is about to be removed.
function PANEL:OnChildRemoved(child) end

---[CLIENT] Called whenever the cursor entered the panels bounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnCursorEntered)
function PANEL:OnCursorEntered() end

---[CLIENT] Called whenever the cursor left the panels bounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnCursorExited)
function PANEL:OnCursorExited() end

---[CLIENT] Called whenever the cursor was moved with the panels bounds.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnCursorMoved)
---@param cursorX number The new x position of the cursor relative to the panels origin.
---@param cursorY number The new y position of the cursor relative to the panels origin.
---@return boolean # Return true to suppress default action.
function PANEL:OnCursorMoved(cursorX, cursorY) end

---[CLIENT AND MENU] Called when we are deactivated during level load. Used by the loading screen panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnDeactivate)
function PANEL:OnDeactivate() end

---[CLIENT] We're being dropped on something
--- We can create a new panel here and return it, so that instead of dropping us - it drops the new panel instead! We remain where we are!
---
--- Only works for panels derived from DDragBase.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnDrop)
---@return Panel # The panel to drop instead of us. By default you should return self.
function PANEL:OnDrop() end

---[CLIENT] Called whenever the panel gained or lost focus.
---
--- Panel:HasFocus will only be updated on the next frame and will return the "old" value at the time this hook is run. Same goes for vgui.GetKeyboardFocus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnFocusChanged)
---@param gained boolean If the focus was gained (`true`) or lost (`false`).
function PANEL:OnFocusChanged(gained) end

---[CLIENT] Called when the panel a child DHScrollBar is scrolled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnHScroll)
---@param offset number The new horizontal scroll offset.
function PANEL:OnHScroll(offset) end

---[CLIENT] Called whenever a keyboard key was pressed while the panel is focused.
---
--- This is not run for ESC/"cancelselect" binding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnKeyCodePressed)
---@param keyCode number The key code of the pressed key, see Enums/KEY.
---@return boolean # Return true to suppress default action.
function PANEL:OnKeyCodePressed(keyCode) end

---[CLIENT] Called whenever a keyboard key was released while the panel is focused.
---
--- This is not run for TILDE/"toggleconsole" binding.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnKeyCodeReleased)
---@param keyCode number The key code of the released key, see Enums/KEY.
---@return boolean # Return true to suppress default action.
function PANEL:OnKeyCodeReleased(keyCode) end

---[CLIENT] Called whenever a mouse key was pressed while the panel is focused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnMousePressed)
---@param keyCode number They key code of the key pressed, see Enums/MOUSE.
---@return boolean # Return true to suppress default action such as right click opening edit menu for DTextEntry.
function PANEL:OnMousePressed(keyCode) end

---[CLIENT] Called whenever a mouse key was released while the panel is focused.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnMouseReleased)
---@param keyCode number They key code of the key released, see Enums/MOUSE.
---@return boolean # Return true to suppress default action.
function PANEL:OnMouseReleased(keyCode) end

---[CLIENT] Called whenever the mouse wheel was used.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnMouseWheeled)
---@param scrollDelta number The scroll delta, indicating how much the user turned the mouse wheel.
---@return boolean # Return true to suppress default action.
function PANEL:OnMouseWheeled(scrollDelta) end

---[CLIENT] Called when the panel is about to be removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnRemove)
function PANEL:OnRemove() end

---[CLIENT] Called when the player's screen resolution of the game changes.
---
--- Global.ScrW and Global.ScrH will return the new values when this hook is called.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnScreenSizeChanged)
---@param oldWidth number The previous width  of the game's window
---@param oldHeight number The previous height of the game's window
---@param newWidth number The new/current width of the game's window.
---@param newHeight number The new/current height of the game's window.
function PANEL:OnScreenSizeChanged(oldWidth, oldHeight, newWidth, newHeight) end

---[CLIENT] Called when the panel a child DVScrollBar or DHScrollBar becomes visible.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnScrollbarAppear)
function PANEL:OnScrollbarAppear() end

---[CLIENT] Called just after the panel size changes.
---
--- All size functions will return the new values when this hook is called.
---
--- Changing the panel size in this hook will cause an infinite loop!
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnSizeChanged)
---@param newWidth number The new width of the panel
---@param newHeight number The new height of the panel
function PANEL:OnSizeChanged(newWidth, newHeight) end

---[CLIENT] Called by dragndrop.StartDragging when the panel starts being dragged.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnStartDragging)
function PANEL:OnStartDragging() end

---[CLIENT] Called by Panel:DragMouseRelease when the panel object is released after being dragged.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnStopDragging)
function PANEL:OnStopDragging() end

---[CLIENT] Called whenever clickable text is clicked within a RichText.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnTextClicked)
---@param id string The identifier of the text clicked. The one passed to Panel:InsertClickableTextStart.
function PANEL:OnTextClicked(id) end

---[CLIENT] Called when the panel a child DVScrollBar is scrolled.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:OnVScroll)
---@param offset number The new vertical scroll offset.
function PANEL:OnVScroll(offset) end

---[CLIENT AND MENU] Instructs a HTML control to download and parse a HTML script using the passed URL.
---
--- This function can only be used on [HTML](HTML) panel and its derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:OpenURL)
---@param URL string URL to open. It has to start or be one of the following:
--- * `http://`
--- * `https://`
--- * `asset://`
--- * `about:blank`
--- * `chrome://credits/`
---
function Panel:OpenURL(URL) end

---[CLIENT] Called whenever the panel should be drawn.
---
--- You can create panels with a customized appearance by overriding their Paint() function, which will prevent the default appearance from being drawn.
---
--- Render operations from the surface (and consequentially the draw) are always offset by the global position of this panel, as seen in the example below
---
--- This hook will not run if the panel is completely off the screen. The hook will still run however if any parts of the panel are still on screen.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:Paint)
---@param width number The panel's width.
---@param height number The panel's height.
---@return boolean # Returning true prevents the background from being drawn.
function PANEL:Paint(width, height) end

---[CLIENT AND MENU] Paints a ghost copy of the panel at the given position.
---
--- 			This function sets Z pos of panel's children (PANEL:SetZPos)
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:PaintAt)
---@param posX number The x coordinate to draw the panel from.
---@param posY number The y coordinate to draw the panel from.
function Panel:PaintAt(posX, posY) end

---[CLIENT AND MENU] Paints the panel at its current position. To use this you must call Panel:SetPaintedManually(true).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:PaintManual)
---@param unclamp? boolean  If set, overrides panels' clipping so that it can render fully when its size is larger than the game's resolution.
function Panel:PaintManual(unclamp) end

---[CLIENT] Called whenever the panel and all its children were drawn, return true to override the default drawing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:PaintOver)
---@param width number The panels current width.
---@param height number The panels current height.
---@return boolean # Should we disable default PaintOver rendering? This is useful in case with Derma panels that use Derma hooks.
function PANEL:PaintOver(width, height) end

---[CLIENT] Parents the panel to the HUD.
--- Makes it invisible on the escape-menu and disables controls.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ParentToHUD)
function Panel:ParentToHUD() end

---[CLIENT AND MENU] Only works for TextEntries.
---
--- Pastes the contents of the clipboard into the TextEntry.
---
--- Tab characters will be dropped from the pasted text
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Paste)
---@deprecated Due to privacy concerns, this function has been disabled
function Panel:Paste() end

---[CLIENT] Called whenever the panels' layout needs to be performed again. This means all child panels must be re-positioned to fit the possibly new size of this panel.
---
--- This can be triggered in numerous ways:
--- * Panel:InvalidateLayout was called this or previous frame (depending on the argument)
--- * Panel:SetPos called more than once on the same panel ([Issue](https://github.com/Facepunch/garrysmod-issues/issues/5519))
--- * A child element was added to this panel (TODO: Verify me)
--- * The size of this panel has changed
---
--- You should not call this function directly. Use Panel:InvalidateLayout instead.
---
--- You can use `vgui_visualizelayout 1` to visualize panel layouts as they happen for debugging purposes. Panels should not be doing this every frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:PerformLayout)
---@param width number The panels current width.
---@param height number The panels current height.
function PANEL:PerformLayout(width, height) end

---[CLIENT AND MENU] Sets the width and position of a DLabel and places the passed panel object directly to the right of it. Returns the `y` value of the bottom of the tallest object. The panel on which this method is run is not relevant; only the passed objects are affected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:PositionLabel)
---@param lblWidth number The width to set the label to.
---@param x number The horizontal (x) position at which to place the label.
---@param y number The vertical (y) position at which to place the label.
---@param lbl Panel The label to resize and position.
---@param panelObj Panel The panel object to place to the right of the label.
---@return number # The distance from the top of the parent panel to the bottom of the tallest object (the `y` position plus the height of the label or passed panel, depending on which is tallest).
function Panel:PositionLabel(lblWidth, x, y, lbl, panelObj) end

---[CLIENT] Only works on elements defined with derma.DefineControl and only if the panel has **AllowAutoRefresh** set to true.
---
--- Called after derma.DefineControl is called with panel's class name.
---
--- See also PANEL:PreAutoRefresh
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:PostAutoRefresh)
function PANEL:PostAutoRefresh() end

---[CLIENT] Only works on elements defined with derma.DefineControl and only if the panel has **AllowAutoRefresh** set to true.
---
--- Called when derma.DefineControl is called with this panel's class name before applying changes to this panel.
---
--- See also PANEL:PostAutoRefresh
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:PreAutoRefresh)
function PANEL:PreAutoRefresh() end

---[CLIENT AND MENU] Installs Lua defined functions into the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Prepare)
function Panel:Prepare() end

---[CLIENT AND MENU] Enables the queue for panel animations. If enabled, the next new animation will begin after all current animations have ended. This must be called before Panel:NewAnimation to work, and only applies to the next new animation. If you want to queue many, you must call this before each.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Queue)
function Panel:Queue() end

---[CLIENT] Causes a SpawnIcon to rebuild its model image.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:RebuildSpawnIcon)
function Panel:RebuildSpawnIcon() end

---[CLIENT] Re-renders a spawn icon with customized cam data.
---
--- Global.PositionSpawnIcon can be used to easily calculate the necessary camera parameters.
---
--- This function does **not** accept the standard Structures/CamData.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:RebuildSpawnIconEx)
---@param data table A four-membered table containing the information needed to re-render:
--- * Vector cam_pos - The relative camera position the model is viewed from.
--- * Angle cam_ang - The camera angle the model is viewed from.
--- * number cam_fov - The camera's field of view (FOV).
--- * Entity ent - The entity object of the model.
--- See the example below for how to retrieve these values.
function Panel:RebuildSpawnIconEx(data) end

---[CLIENT AND MENU] Allows the panel to receive drag and drop events. Can be called multiple times with different names to receive multiple different draggable panel events.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Receiver)
---@param name string Name of DnD panels to receive. This is set on the drag'n'drop-able panels via  Panel:Droppable
---@param func function This function is called whenever a panel with valid name is hovering above and dropped on this panel. It has next arguments:
--- * Panel pnl - The receiver panel
--- * table tbl - A table of panels dropped onto receiver panel
--- * boolean dropped - False if hovering over, true if dropped onto
--- * number menuIndex - Index of clicked menu item from third argument of Panel:Receiver
--- * number x - Cursor pos, relative to the receiver
--- * number y - Cursor pos, relative to the receiver
---@param menu table A table of strings that will act as a menu if drag'n'drop was performed with a right click
function Panel:Receiver(name, func, menu) end

---[CLIENT AND MENU] Refreshes the HTML panel's current page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Refresh)
---@param ignoreCache? boolean If true, the refresh will ignore cached content similar to "ctrl+f5" in most browsers.
function Panel:Refresh(ignoreCache) end

---[CLIENT AND MENU] Marks a panel for deletion so it will be deleted on the next frame.
---
--- This will not mark child panels for deletion this frame, but they will be marked and deleted in the next frame.
---
--- See also Panel:IsMarkedForDeletion
---
--- Will automatically call Panel:InvalidateParent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Remove)
function Panel:Remove() end

---[CLIENT AND MENU] Attempts to obtain focus for this panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:RequestFocus)
function Panel:RequestFocus() end

---[CLIENT AND MENU] Resets all text fades in a RichText element made with Panel:InsertFade.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ResetAllFades)
---@param hold boolean True to reset fades, false otherwise.
---@param expiredOnly boolean Any value equating to `true` will reset fades only on text segments that are completely faded out.
---@param newSustain number The new sustain value of each faded text segment. Set to -1 to keep the old sustain value.
function Panel:ResetAllFades(hold, expiredOnly, newSustain) end

---[CLIENT AND MENU] Runs/Executes a string as JavaScript code in a panel.
--- This function does **NOT** evaluate expression (i.e. allow you to pass variables from JavaScript (JS) to Lua context).Because a return value is nil/no value (a.k.a. void).If you wish to pass/return values from JS to Lua, you may want to use DHTML:AddFunction function to accomplish that job.
--- The Awesomium web renderer automatically delays the code execution if the document is not ready, but the Chromium web renderer does not!
---
--- This means that with Chromium, you cannot JavaScript run code immediatly after calling Panel:SetHTML or DHTML:OpenURL. You should wait for the events PANEL:OnDocumentReady or PANEL:OnFinishLoadingDocument to be triggered before proceeding, otherwise you may manipulate an empty / incomplete document.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:RunJavascript)
---@param js string Specify JavaScript code to be executed.
function Panel:RunJavascript(js) end

---[CLIENT AND MENU] Saves the current state (caret position and the text inside) of a TextEntry as an undo state.
---
--- See also Panel:Undo.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SaveUndoState)
function Panel:SaveUndoState() end

---[CLIENT AND MENU] Translates global screen coordinate to coordinates relative to the panel.
---
--- See also Panel:LocalToScreen.
---
--- This function uses a cached value for the screen position of the panel, computed at the end of the last VGUI Think/Layout pass, so inaccurate results may be returned if the panel or any of its ancestors have been re-positioned outside of PANEL:Think or PANEL:PerformLayout within the last frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ScreenToLocal)
---@param screenX number The x coordinate of the screen position to be translated.
---@param screenY number The y coordinate of the screed position be to translated.
---@return number # Relativeposition X
---@return number # Relativeposition Y
function Panel:ScreenToLocal(screenX, screenY) end

---[CLIENT AND MENU] Selects all items within a panel or object. For text-based objects, selects all text.
---
--- Only works on RichText and TextEntry and their derived panels by default (such as DTextEntry), and on any panel that manually reimplemented this method.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SelectAll)
function Panel:SelectAll() end

---[CLIENT AND MENU] If called on a TextEntry, clicking the text entry for the first time will automatically select all of the text ready to be copied by the user.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SelectAllOnFocus)
function Panel:SelectAllOnFocus() end

---[CLIENT AND MENU] Selects all the text in a panel object. Will not select non-text items; for this, use Panel:SelectAll.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SelectAllText)
---@param resetCursorPos boolean Reset cursor pos?
---@deprecated Duplicate of Panel:SelectAll.
function Panel:SelectAllText(resetCursorPos) end

---[CLIENT AND MENU] Deselects all items in a panel object. For text-based objects, this will deselect all text.
---
--- Only works on RichText and TextEntry and their derived panels by default (such as DTextEntry), and on any panel that manually reimplemented this method.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SelectNone)
function Panel:SelectNone() end

---[CLIENT AND MENU] Sets the achievement to be displayed by AchievementIcon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetAchievement)
---@param id number Achievement number ID
function Panel:SetAchievement(id) end

---[CLIENT AND MENU] Configures a TextEntry to allow user to type characters that are not included in the US-ASCII (7-bit ASCII) character set.
---
--- Characters not included in US-ASCII are multi-byte characters in UTF-8. They can be accented characters, non-Latin characters and special characters.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetAllowNonAsciiCharacters)
---@param allowed boolean Set to true in order not to restrict input characters.
function Panel:SetAllowNonAsciiCharacters(allowed) end

---[CLIENT AND MENU] Sets the alpha multiplier for the panel
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetAlpha)
---@param alpha number The alpha value in the range of 0-255.
function Panel:SetAlpha(alpha) end

---[CLIENT AND MENU] Enables or disables animations for the panel object by overriding the PANEL:AnimationThink hook to nil and back.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetAnimationEnabled)
---@param enable boolean Whether to enable or disable animations.
function Panel:SetAnimationEnabled(enable) end

---[CLIENT AND MENU] Sets whenever the panel should be removed if the parent was removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetAutoDelete)
---@param autoDelete boolean Whenever to delete if the parent was removed or not.
function Panel:SetAutoDelete(autoDelete) end

---[CLIENT AND MENU] Sets the background color of a panel such as a RichText, Label or DColorCube.
---
--- This doesn't apply to all VGUI elements and its function varies between them
---
--- For DLabel elements, you must use Panel:SetPaintBackgroundEnabled( true ) before applying the color.
---
--- This will not work on setup of the panel - you should use this function in a hook like PANEL:ApplySchemeSettings or PANEL:PerformLayout.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetBGColor)
---@param rOrColor number The red channel of the color, or a Color. If you pass the latter, the following three arguments are ignored.
---@param g number The green channel of the color.
---@param b number The blue channel of the color.
---@param a number The alpha channel of the color.
function Panel:SetBGColor(rOrColor, g, b, a) end

---[CLIENT AND MENU] Sets the background color of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetBGColorEx)
---@param r number The red channel of the color.
---@param g number The green channel of the color.
---@param b number The blue channel of the color.
---@param a number The alpha channel of the color.
function Panel:SetBGColorEx(r, g, b, a) end

---[CLIENT AND MENU] Sets the position of the caret (or text cursor) in a text-based panel object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetCaretPos)
---@param offset number Caret position/offset from the start of text. A value of `0` places the caret before the first character.
function Panel:SetCaretPos(offset) end

---[CLIENT AND MENU] Sets the alignment of the contents.
---
--- This function only works on Label panels and its derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetContentAlignment)
---@param alignment number The direction of the content, based on the number pad.
---
--- 1: **bottom-left**
--- 2: **bottom-center**
--- 3: **bottom-right**
--- 4: **middle-left**
--- 5: **center**
--- 6: **middle-right**
--- 7: **top-left**
--- 8: **top-center**
--- 9: **top-right**
---
function Panel:SetContentAlignment(alignment) end

---[CLIENT AND MENU] This function does not exist on all panels
--- This function cannot interact with serverside convars unless you are host
--- Blocked convars will not work with this, see Blocked ConCommands
---
--- Sets this panel's convar. When the convar changes this panel will update automatically.
---
--- For developer implementation, see Global.Derma_Install_Convar_Functions.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetConVar)
---@param convar string The console variable to check.
function Panel:SetConVar(convar) end

---[CLIENT AND MENU] Stores a string in the named cookie using Panel:GetCookieName as prefix.
---
--- You can also retrieve and modify this cookie by using the cookie. Cookies are stored in this format:
---
--- ```
--- panelCookieName.cookieName
--- ```
---
---
--- The panel's cookie name MUST be set for this function to work. See Panel:SetCookieName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetCookie)
---@param cookieName string The unique name used to retrieve the cookie later.
---@param value string The value to store in the cookie. This can be retrieved later as a string or number.
function Panel:SetCookie(cookieName, value) end

---[CLIENT AND MENU] Sets the panel's cookie name. Calls PANEL:LoadCookies if defined.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetCookieName)
---@param name string The panel's cookie name. Used as prefix for Panel:SetCookie
function Panel:SetCookieName(name) end

---[CLIENT AND MENU] Sets the appearance of the cursor. You can find a list of all available cursors with image previews [here](https://wiki.facepunch.com/gmod/Cursors).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetCursor)
---@param cursor string The cursor to be set. Can be one of the following:
---
--- * [arrow](https://wiki.facepunch.com/gmod/Cursors#:~:text=arrow)
--- * [beam](https://wiki.facepunch.com/gmod/Cursors#:~:text=beam)
--- * [hourglass](https://wiki.facepunch.com/gmod/Cursors#:~:text=hourglass)
--- * [waitarrow](https://wiki.facepunch.com/gmod/Cursors#:~:text=waitarrow)
--- * [crosshair](https://wiki.facepunch.com/gmod/Cursors#:~:text=crosshair)
--- * [up](https://wiki.facepunch.com/gmod/Cursors#:~:text=up)
--- * [sizenwse](https://wiki.facepunch.com/gmod/Cursors#:~:text=sizenwse)
--- * [sizenesw](https://wiki.facepunch.com/gmod/Cursors#:~:text=sizenesw)
--- * [sizewe](https://wiki.facepunch.com/gmod/Cursors#:~:text=sizewe)
--- * [sizens](https://wiki.facepunch.com/gmod/Cursors#:~:text=sizens)
--- * [sizeall](https://wiki.facepunch.com/gmod/Cursors#:~:text=sizeall)
--- * [no](https://wiki.facepunch.com/gmod/Cursors#:~:text=no)
--- * [hand](https://wiki.facepunch.com/gmod/Cursors#:~:text=hand)
--- * [blank](https://wiki.facepunch.com/gmod/Cursors#:~:text=blank)
---
--- Set to anything else to set it to "none", the default fallback. Do note that a value of "none" does not, as one might assume, result in no cursor being drawn - hiding the cursor requires a value of "blank" instead.
function Panel:SetCursor(cursor) end

---[CLIENT AND MENU] Sets the drag parent.
---
--- Drag parent means that when we start to drag this panel, we'll really start dragging the defined parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetDragParent)
---@param parent Panel The panel to set as drag parent.
function Panel:SetDragParent(parent) end

---[CLIENT AND MENU] Sets the visibility of the language selection box when typing in non-English mode.
---
--- 		See Panel:SetDrawLanguageIDAtLeft for a function that changes the position of the language selection box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetDrawLanguageID)
---@param visible boolean true to make it visible, false to hide it.
function Panel:SetDrawLanguageID(visible) end

---[CLIENT AND MENU] Sets where to draw the language selection box.
---
--- See Panel:SetDrawLanguageID for a function that hides or shows the language selection box.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetDrawLanguageIDAtLeft)
---@param left boolean true = left, false = right
function Panel:SetDrawLanguageIDAtLeft(left) end

---[CLIENT AND MENU] Makes the panel render in front of all others, including the spawn menu and main menu.
---
--- Priority is given based on the last call, so of two panels that call this method, the second will draw in front of the first.
---
--- This only makes the panel **draw** above other panels. If there's another panel that would have otherwise covered it, users will not be able to interact with it.
---
--- Completely disregards PANEL:ParentToHUD.
---
--- This does not work when using PANEL:SetPaintedManually or PANEL:PaintAt.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetDrawOnTop)
---@param drawOnTop? boolean Whether or not to draw the panel in front of all others.
function Panel:SetDrawOnTop(drawOnTop) end

---[CLIENT AND MENU] Sets the target area for dropping when an object is being dragged around this panel using the dragndrop.
---
--- This draws a target box of the specified size and position, until Panel:DragHoverEnd is called. It uses Panel:DrawDragHover to draw this area.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetDropTarget)
---@param x number The x coordinate of the top-left corner of the drop area.
---@param y number The y coordinate of the top-left corner of the drop area.
---@param width number The width of the drop area.
---@param height number The height of the drop area.
function Panel:SetDropTarget(x, y, width, height) end

---[CLIENT AND MENU] Sets the enabled state of a disable-able panel object, such as a DButton or DTextEntry.
---
--- See Panel:IsEnabled for a function that retrieves the "enabled" state of a panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetEnabled)
---@param enable boolean Whether to enable or disable the panel object.
function Panel:SetEnabled(enable) end

---[CLIENT AND MENU] Adds a shadow falling to the bottom right corner of the panel's text.
---
--- This works only on  panels that derive from Label.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetExpensiveShadow)
---@param distance number The distance of the shadow from the panel.
---@param Color table The color of the shadow. Uses the Color.
function Panel:SetExpensiveShadow(distance, Color) end

---[CLIENT AND MENU] Sets the foreground color of a panel.
---
--- For a Label or RichText, this is the color of its text.
---
--- This function calls Panel:SetFGColorEx internally.
---
--- This doesn't apply to all VGUI elements (such as DLabel) and its function varies between them
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetFGColor)
---@param rOrColor number The red channel of the color, or a Color. If you pass the latter, the following three arguments are ignored.
---@param g number The green channel of the color.
---@param b number The blue channel of the color.
---@param a number The alpha channel of the color.
function Panel:SetFGColor(rOrColor, g, b, a) end

---[CLIENT AND MENU] Sets the foreground color of the panel.
---
--- For labels, this is the color of their text.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetFGColorEx)
---@param r number The red channel of the color.
---@param g number The green channel of the color.
---@param b number The blue channel of the color.
---@param a number The alpha channel of the color.
function Panel:SetFGColorEx(r, g, b, a) end

---[CLIENT AND MENU] Sets the panel that owns this FocusNavGroup to be the root in the focus traversal hierarchy. This function will only work on EditablePanel class panels and its derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetFocusTopLevel)
---@param state boolean
function Panel:SetFocusTopLevel(state) end

---[CLIENT AND MENU] Sets the font used to render this panel's text. This works for Label, TextEntry and RichText, but it's a better idea to use their local `SetFont` (DTextEntry:SetFont, DLabel:SetFont) methods when available.
---
--- To retrieve the font used by a panel, call Panel:GetFont.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetFontInternal)
---@param fontName string The name of the font.
---
--- See Default_Fonts for a list of existing fonts.
--- Alternatively, use surface.CreateFont to create your own custom font.
function Panel:SetFontInternal(fontName) end

---[CLIENT AND MENU] Sets the height of the panel.
---
--- Calls PANEL:OnSizeChanged and marks this panel for layout (Panel:InvalidateLayout).
---
---
--- See also Panel:SetSize.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetHeight)
---@param height number The height to be set.
function Panel:SetHeight(height) end

---[CLIENT AND MENU] Allows you to set HTML code within a panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetHTML)
---@param HTML string The HTML code to set.
function Panel:SetHTML(HTML) end

---[CLIENT AND MENU] Enables or disables the keyboard input for the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetKeyBoardInputEnabled)
---@param keyboardInput boolean Whether to enable or disable keyboard input.
---@deprecated Alias of Panel:SetKeyboardInputEnabled(lowercase)
function Panel:SetKeyBoardInputEnabled(keyboardInput) end

---[CLIENT] Allows or disallows the panel to receive keyboard focus and input. This is recursively applied to all children.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetKeyboardInputEnabled(lowercase))
---@param enable boolean Whether keyboard input should be enabled for this panel.
function Panel:SetKeyboardInputEnabled(enable) end

---[CLIENT AND MENU] Sets the height of a single line of a RichText panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetLineHeight)
---@return number # The new line height. Values below zero mean no override.
function Panel:SetLineHeight() end

---[CLIENT AND MENU] Sets the maximum character count this panel should have.
---
--- This function will only work on RichText and TextEntry panels and their derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetMaximumCharCount)
---@param maxChar number The new maximum amount of characters this panel is allowed to contain.
function Panel:SetMaximumCharCount(maxChar) end

---[CLIENT AND MENU] Sets the minimum dimensions of the panel or object.
---
--- You can restrict either or both values.
---
--- Calling the function without arguments will remove the minimum size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetMinimumSize)
---@param minW? number The minimum width of the object.
---@param minH? number The minimum height of the object.
function Panel:SetMinimumSize(minW, minH) end

---[CLIENT] Sets the model to be displayed by SpawnIcon.
---
--- This must be called after setting size if you wish to use a different size spawnicon
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetModel)
---@param ModelPath string The path of the model to set
---@param skin? number The skin to set
---@param bodygroups? string The body groups to set. Each single-digit number in the string represents a separate bodygroup, **This argument must be 9 characters in total**.
function Panel:SetModel(ModelPath, skin, bodygroups) end

---[CLIENT AND MENU] Enables or disables the mouse input for the panel.
--- 		Panels parented to the context menu will not be clickable unless Panel:SetKeyboardInputEnabled(lowercase) is enabled or Panel:MakePopup has been called. If you want the panel to have mouse input but you do not want to prevent players from moving, set Panel:SetKeyboardInputEnabled(lowercase) to false immediately after calling Panel:MakePopup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetMouseInputEnabled)
---@param mouseInput boolean Whenever to enable or disable mouse input.
function Panel:SetMouseInputEnabled(mouseInput) end

---[CLIENT AND MENU] Enables or disables the multi-line functionality of TextEntry panel and its derivatives.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetMultiline)
---@param multiline boolean Whether to enable multiline or not.
function Panel:SetMultiline(multiline) end

---[CLIENT AND MENU] Sets the internal name of the panel. Can be retrieved with Panel:GetName.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetName)
---@param name string The new name of the panel.
function Panel:SetName(name) end

---[MENU] Set to true to open links in an external browser. This only functions on the `x86-64` beta.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetOpenLinksExternally)
---@param openExternally boolean
function Panel:SetOpenLinksExternally(openExternally) end

---[CLIENT AND MENU] Sets whenever all the default background of the panel should be drawn or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetPaintBackgroundEnabled)
---@param paintBackground boolean Whenever to draw the background or not.
function Panel:SetPaintBackgroundEnabled(paintBackground) end

---[CLIENT AND MENU] Sets whenever all the default border of the panel should be drawn or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetPaintBorderEnabled)
---@param paintBorder boolean Whenever to draw the border or not.
function Panel:SetPaintBorderEnabled(paintBorder) end

---[CLIENT AND MENU] Enables or disables painting of the panel manually with Panel:PaintManual.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetPaintedManually)
---@param paintedManually boolean True if the panel should be painted manually.
function Panel:SetPaintedManually(paintedManually) end

---[CLIENT AND MENU] Sets the parent of the panel.
--- 	Panels parented to the context menu will not be clickable unless Panel:SetMouseInputEnabled and Panel:SetKeyboardInputEnabled(lowercase) are both true or Panel:MakePopup has been called. If you want the panel to have mouse input but you do not want to prevent players from moving, set Panel:SetKeyboardInputEnabled(lowercase) to false immediately after calling Panel:MakePopup.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetParent)
---@param parent Panel The new parent of the panel.
function Panel:SetParent(parent) end

---[CLIENT] Used by AvatarImage to load an avatar for given player.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetPlayer)
---@param player Player The player to use avatar of.
---@param size? number The size of the avatar to use. Acceptable sizes are `32`, `64`, `184`. Non matching sizes will be clamped down to the highest valid number.
function Panel:SetPlayer(player, size) end

---[CLIENT AND MENU] If this panel object has been made a popup with Panel:MakePopup, this method will prevent it from drawing in front of other panels when it receives input focus.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetPopupStayAtBack)
---@param stayAtBack boolean If `true`, the popup panel will not draw in front of others when it gets focus, for example when it is clicked.
function Panel:SetPopupStayAtBack(stayAtBack) end

---[CLIENT AND MENU] Sets the position of the panel's top left corner.
---
--- This will trigger PANEL:PerformLayout. You should avoid calling this function in PANEL:PerformLayout to avoid infinite loops.
---
--- See also Panel:SetX and Panel:SetY.
---
--- If you wish to position and re-size panels without much guesswork and have them look good on different screen resolutions, you may find Panel:Dock useful
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetPos)
---@param posX number The x coordinate of the position.
---@param posY number The y coordinate of the position.
function Panel:SetPos(posX, posY) end

---[CLIENT AND MENU] Sets whenever the panel should be rendered in the next screenshot.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetRenderInScreenshots)
---@param renderInScreenshot boolean Whether to render in the screenshot or not.
function Panel:SetRenderInScreenshots(renderInScreenshot) end

---[CLIENT AND MENU] Sets whether the panel object can be selected or not (like icons in the Spawn Menu, holding Shift). If enabled, this will affect the function of a DButton whilst Shift is pressed. Panel:SetSelected can be used to select/deselect the object.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetSelectable)
---@param selectable boolean Whether the panel object should be selectable or not.
function Panel:SetSelectable(selectable) end

---[CLIENT AND MENU] Sets the selected state of a selectable panel object. This functionality is set with Panel:SetSelectable and checked with Panel:IsSelectable.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetSelected)
---@param selected? boolean Whether the object should be selected or deselected. Panel:IsSelected can be used to determine the selected state of the object.
function Panel:SetSelected(selected) end

---[CLIENT AND MENU] Enables the panel object for selection (much like the spawn menu).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetSelectionCanvas)
---@param set boolean Whether to enable selection.
function Panel:SetSelectionCanvas(set) end

---[CLIENT AND MENU] Sets the size of the panel.
---
--- Calls PANEL:OnSizeChanged and marks this panel for layout (Panel:InvalidateLayout).
---
---
--- See also Panel:SetWidth and Panel:SetHeight.
---
--- If you wish to position and re-size panels without much guesswork and have them look good on different screen resolutions, you may find Panel:Dock useful
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetSize)
---@param width number The width of the panel.
---@param height number The height of the panel.
function Panel:SetSize(width, height) end

---[CLIENT AND MENU] Sets the derma skin that the panel object will use, and refreshes all panels with derma.RefreshSkins.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetSkin)
---@param skinName string The name of the skin to use. The default derma skin is `Default`.
function Panel:SetSkin(skinName) end

---[CLIENT] Sets the `.png` image to be displayed on a  SpawnIcon or the panel it is based on - ModelImage.
---
--- Only `.png` images can be used with this function.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetSpawnIcon)
---@param icon string A path to the .png material, for example one of the Silkicons shipped with the game.
function Panel:SetSpawnIcon(icon) end

---[CLIENT] Used by AvatarImage panels to load an avatar by its 64-bit Steam ID (community ID).
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetSteamID)
---@param steamid string The 64bit SteamID of the player to load avatar of
---@param size number The size of the avatar to use. Acceptable sizes are 32, 64, 184.
function Panel:SetSteamID(steamid, size) end

---[CLIENT AND MENU] When TAB is pressed, the next selectable panel in the number sequence is selected.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTabPosition)
---@param position number
function Panel:SetTabPosition(position) end

---[CLIENT AND MENU] Sets height of a panel. An alias of Panel:SetHeight.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTall)
---@param height number Desired height to set
function Panel:SetTall(height) end

---[CLIENT AND MENU] Removes the panel after given time in seconds.
--- This function will not work if PANEL:AnimationThink is overridden, unless Panel:AnimationThinkInternal is called every frame.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTerm)
---@param delay number Delay in seconds after which the panel should be removed.
function Panel:SetTerm(delay) end

---[CLIENT AND MENU] Sets the text value of a panel object containing text, such as a Label, TextEntry or  RichText and their derivatives, such as DLabel, DTextEntry or DButton.
---
--- When used on a Label or its derivatives ( DLabel and DButton ), it will automatically call Panel:InvalidateLayout, meaning that you should avoid running this function every frame on these panels to avoid unnecessary performance loss.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetText)
---@param text string The text value to set.
function Panel:SetText(text) end

---[CLIENT AND MENU] Sets the left and top text margins of a text-based panel object, such as a DButton or DLabel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTextInset)
---@param insetX number The left margin for the text, in pixels. This will only affect centered text if the margin is greater than its x-coordinate.
---@param insetY number The top margin for the text, in pixels.
function Panel:SetTextInset(insetX, insetY) end

---[CLIENT AND MENU] Sets text selection colors of a RichText element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTextSelectionColors)
---@param textColor table The Global.Color to set for selected text.
---@param backgroundColor table The Global.Color to set for selected text background.
function Panel:SetTextSelectionColors(textColor, backgroundColor) end

---[CLIENT AND MENU] Sets the height of a RichText element to accommodate the text inside.
---
--- This function internally relies on Panel:GetNumLines, so it should be called at least a couple frames after modifying the text using Panel:AppendText
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetToFullHeight)
function Panel:SetToFullHeight() end

---[CLIENT AND MENU] Sets the tooltip to be displayed when a player hovers over the panel object with their cursor.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTooltip)
---@param str string The text to be displayed in the tooltip. Set false to disable it.
function Panel:SetTooltip(str) end

---[CLIENT AND MENU] Sets the tooltip delay. (time between hovering over the panel, and the tooltip showing up)
---
--- Can be retrieved with Panel:GetTooltipDelay.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTooltipDelay)
---@param tooltip number The tooltip delay to set.
function Panel:SetTooltipDelay(tooltip) end

---[CLIENT AND MENU] Sets the panel to be displayed as contents of a DTooltip when a player hovers over the panel object with their cursor. See Panel:SetTooltipPanelOverride if you are looking to override DTooltip itself.
---
--- Panel:SetTooltip will override this functionality.
---
---
--- 	Calling this from PANEL:OnCursorEntered is too late! The tooltip will not be displayed or be updated.
---
--- 	Given panel or the previously set one will **NOT** be automatically removed.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTooltipPanel)
---@param tooltipPanel? Panel The panel to use as the tooltip.
function Panel:SetTooltipPanel(tooltipPanel) end

---[CLIENT AND MENU] Sets the panel class to be created instead of DTooltip when the player hovers over this panel and a tooltip needs creating.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetTooltipPanelOverride)
---@param override string The panel class to override the default DTooltip. The new panel class must have the following methods:
--- * Panel:SetText - If you are using Panel:SetTooltip.
--- * DTooltip:SetContents - If you are using Panel:SetTooltipPanel.
--- * DTooltip:OpenForPanel - A "hook" type function that gets called shortly after creation (and after the above 2) to open and position the tooltip. You can see this logic in `lua/includes/util/tooltips.lua`.
---
function Panel:SetTooltipPanelOverride(override) end

---[CLIENT AND MENU] Sets the underlined font for use by clickable text in a RichText. See also Panel:InsertClickableTextStart
---
--- This function will only work on RichText panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetUnderlineFont)
---@param fontName string The name of the font.
---
--- See Default_Fonts for a list of existing fonts.
--- Alternatively, use surface.CreateFont to create your own custom font.
function Panel:SetUnderlineFont(fontName) end

---[CLIENT AND MENU] Sets the URL of a link-based panel such as DLabelURL.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetURL)
---@param url string The URL to set. It **must** begin with either `http://` or `https://`.
function Panel:SetURL(url) end

---[CLIENT AND MENU] Sets the visibility of the vertical scrollbar.
---
--- Works for RichText and TextEntry.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetVerticalScrollbarEnabled)
---@param display? boolean True to display the vertical text scroll bar, false to hide it.
function Panel:SetVerticalScrollbarEnabled(display) end

---[CLIENT AND MENU] Sets the "visibility" of the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetVisible)
---@param visible boolean The visibility of the panel.
function Panel:SetVisible(visible) end

---[CLIENT AND MENU] Sets width of a panel. An alias of Panel:SetWidth.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetWide)
---@param width number Desired width to set
function Panel:SetWide(width) end

---[CLIENT AND MENU] Sets the width of the panel.
---
--- Calls PANEL:OnSizeChanged and marks this panel for layout (Panel:InvalidateLayout).
---
---
--- See also Panel:SetSize.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetWidth)
---@param width number The new width of the panel.
function Panel:SetWidth(width) end

---[CLIENT AND MENU] This makes it so that when you're hovering over this panel you can "click" on the world. Your weapon aim (and its viewmodel) will follow the cursor. This is primarily used for the Sandbox context menu.
---
--- This function doesn't scale with custom FOV specified by GM:CalcView or WEAPON:TranslateFOV.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetWorldClicker)
---@param enable boolean Whether to enable or disable the feature for this panel.
function Panel:SetWorldClicker(enable) end

---[CLIENT AND MENU] Sets whether text wrapping should be enabled or disabled on Label and DLabel panels.
---
--- Use DLabel:SetAutoStretchVertical to automatically correct vertical size; Panel:SizeToContents will not set the correct height.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetWrap)
---@param wrap boolean `True` to enable text wrapping, `false` otherwise.
function Panel:SetWrap(wrap) end

---[CLIENT AND MENU] Sets the X position of the panel.
---
--- Uses Panel:SetPos internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetX)
---@param x number The X coordinate of the position.
function Panel:SetX(x) end

---[CLIENT AND MENU] Sets the Y position of the panel.
---
--- Uses Panel:SetPos internally.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetY)
---@param y number The Y coordinate of the position.
function Panel:SetY(y) end

---[CLIENT AND MENU] Sets the panels z position which determines the rendering order.
---
--- Panels with lower z positions appear behind panels with higher z positions.
---
--- This also controls in which order panels docked with Panel:Dock appears.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SetZPos)
---@param zIndex number The z position of the panel.
--- Can't be lower than -32768 or higher than 32767.
function Panel:SetZPos(zIndex) end

---[CLIENT AND MENU] Makes a panel visible.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Show)
function Panel:Show() end

---[CLIENT AND MENU] Uses animation to resize the panel to the specified size.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SizeTo)
---@param sizeW? number The target width of the panel. Use -1 to retain the current width.
---@param sizeH? number The target height of the panel. Use -1 to retain the current height.
---@param time number The time to perform the animation within.
---@param delay? number The delay before the animation starts.
---@param ease? number Easing of the start and/or end speed of the animation. See Panel:NewAnimation for how this works.
---@param callback function The function to be called once the animation finishes. Arguments are:
--- * table animData - The Structures/AnimationData that was used.
--- * Panel pnl - The panel object that was resized.
function Panel:SizeTo(sizeW, sizeH, time, delay, ease, callback) end

---[CLIENT AND MENU] Resizes the panel to fit the bounds of its children.
---
--- Your panel must have its layout updated (Panel:InvalidateLayout) for this function to work properly.
--- The sizeW and sizeH parameters are false by default. Therefore, calling this function with no arguments will result in a no-op.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SizeToChildren)
---@param sizeW? boolean Resize with width of the panel.
---@param sizeH? boolean Resize the height of the panel.
function Panel:SizeToChildren(sizeW, sizeH) end

---[CLIENT AND MENU] Resizes the panel so that its width and height fit all of the content inside.
---
--- Only works on Label derived panels such as DLabel by default, and on any panel that manually implemented the Panel:SizeToContents method, such as DNumberWang and DImage.
---
--- You must call this function **AFTER** setting text/font, adjusting child panels or otherwise altering the panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SizeToContents)
function Panel:SizeToContents() end

---[CLIENT AND MENU] Resizes the panel object's width to accommodate all child objects/contents.
---
--- Only works on Label derived panels such as DLabel by default, and on any panel that manually implemented Panel:GetContentSize method.
---
--- You must call this function **AFTER** setting text/font or adjusting child panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SizeToContentsX)
---@param addVal? number The number of extra pixels to add to the width. Can be a negative number, to reduce the width.
function Panel:SizeToContentsX(addVal) end

---[CLIENT AND MENU] Resizes the panel object's height to accommodate all child objects/contents.
---
--- Only works on Label derived panels such as DLabel by default, and on any panel that manually implemented Panel:GetContentSize method.
---
--- You must call this function **AFTER** setting text/font or adjusting child panels.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SizeToContentsY)
---@param addVal? number The number of extra pixels to add to the height.
function Panel:SizeToContentsY(addVal) end

---[CLIENT AND MENU] Slides the panel in from above.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SlideDown)
---@param Length number Time to complete the animation.
function Panel:SlideDown(Length) end

---[CLIENT AND MENU] Slides the panel out to the top.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:SlideUp)
---@param Length number Time to complete the animation.
function Panel:SlideUp(Length) end

---[CLIENT AND MENU] Begins a box selection, enables mouse capture for the panel object, and sets the start point of the selection box to the mouse cursor's position, relative to this object. For this to work, either the object or its parent must be enabled as a selection canvas. This is set using Panel:SetSelectionCanvas.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:StartBoxSelection)
function Panel:StartBoxSelection() end

---[CLIENT AND MENU] Stops all panel animations by clearing its animation list. This also clears all delayed animations.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Stop)
function Panel:Stop() end

---[CLIENT AND MENU] Stops the loading of the HTML panel's current page.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:StopLoading)
function Panel:StopLoading() end

---[CLIENT AND MENU] Resizes the panel object's height so that its bottom is aligned with the top of the passed panel. An offset greater than zero will reduce the panel's height to leave a gap between it and the passed panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:StretchBottomTo)
---@param tgtPanel Panel The panel to align the bottom of this one with.
---@param offset? number The gap to leave between this and the passed panel. Negative values will cause the panel's height to increase, forming an overlap.
function Panel:StretchBottomTo(tgtPanel, offset) end

---[CLIENT AND MENU] Resizes the panel object's width so that its right edge is aligned with the left of the passed panel. An offset greater than zero will reduce the panel's width to leave a gap between it and the passed panel.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:StretchRightTo)
---@param tgtPanel Panel The panel to align the right edge of this one with.
---@param offset? number The gap to leave between this and the passed panel. Negative values will cause the panel's width to increase, forming an overlap.
function Panel:StretchRightTo(tgtPanel, offset) end

---[CLIENT AND MENU] Sets the dimensions of the panel to fill its parent. It will only stretch in directions that aren't nil.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:StretchToParent)
---@param offsetLeft? number The left offset to the parent.
---@param offsetTop? number The top offset to the parent.
---@param offsetRight? number The right offset to the parent.
---@param offsetBottom? number The bottom offset to the parent.
function Panel:StretchToParent(offsetLeft, offsetTop, offsetRight, offsetBottom) end

---[CLIENT] Called to test if the panel is being `hovered` by the mouse. This will only be called if the panel's parent is being hovered.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:TestHover)
---@param x number The x coordinate of the cursor, in screen space.
---@param y number The y coordinate of the cursor, in screen space.
---@return boolean # Return false when the cursor is not considered on the panel, true if it is considered on the panel. Do not return anything for default behavior.
function PANEL:TestHover(x, y) end

---[CLIENT] Called every frame while Panel:IsVisible is true.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/PANEL:Think)
function PANEL:Think() end

---[CLIENT AND MENU] Toggles the selected state of a selectable panel object. This functionality is set with Panel:SetSelectable and checked with Panel:IsSelectable. To check whether the object is selected or not, Panel:IsSelected is used.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ToggleSelection)
function Panel:ToggleSelection() end

---[CLIENT AND MENU] Toggles the visibility of a panel and all its children.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:ToggleVisible)
function Panel:ToggleVisible() end

---[CLIENT AND MENU] Restores the last saved state (caret position and the text inside) of a TextEntry. Should act identically to pressing CTRL+Z in a TextEntry.
---
--- See also Panel:SaveUndoState.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Undo)
function Panel:Undo() end

---[CLIENT AND MENU] Recursively deselects this panel object and all of its children. This will cascade to all child objects at every level below the parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:UnselectAll)
function Panel:UnselectAll() end

---[CLIENT AND MENU] Forcibly updates the panels' HTML Material, similar to when Paint is called on it.This is only useful if the panel is not normally visible, i.e the panel exists purely for its HTML Material.
--- Only works on with panels that have a HTML Material. See Panel:GetHTMLMaterial for more details.
--- A good place to call this is in the GM:PreRender hook
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:UpdateHTMLTexture)
function Panel:UpdateHTMLTexture() end

---[CLIENT AND MENU] Returns if a given panel is valid or not.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/Panel:Valid)
---@return boolean # Whether the panel is valid or not, true being it is, false being it isn't.
---@deprecated Use Panel:IsValid instead.
function Panel:Valid() end
