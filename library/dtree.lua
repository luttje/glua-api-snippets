---@meta

---
--- A tree view element for Derma.
---
--- See also DTree_Node.
--- 	Example of using DTree
---@class DTree : DScrollPanel
local DTree = {}

---[CLIENT AND MENU] Add a node to the DTree
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:AddNode)
---@param name string Name of the option.
---@param icon? string The icon that will show nexto the node in the DTree.
---@return Panel # Returns the created DTree_Node panel.
function DTree:AddNode(name, icon) end

---[CLIENT AND MENU] Does nothing. Used as a placeholder empty function alongside DTree:MoveChildTo, DTree:SetExpanded and DTree:ChildExpanded.
---
--- The DTree acts a root node and methods with the same name in DTree_Node call to the parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:ExpandTo)
---@param bExpand boolean
function DTree:ExpandTo(bExpand) end

---[CLIENT AND MENU] Returns the status of DTree:SetClickOnDragHover. See that for more info.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:GetClickOnDragHover)
---@return boolean #
function DTree:GetClickOnDragHover() end

---[CLIENT AND MENU] Returns the indentation size of the DTree, the distance between each "level" of the tree is offset on the left from the previous level.
---
--- Currently this feature has no effect on the DTree element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:GetIndentSize)
---@return number # The indentation size.
function DTree:GetIndentSize() end

---[CLIENT AND MENU] Returns the height of each DTree_Node in the tree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:GetLineHeight)
---@return number # The height of each DTree_Node in the tree.
function DTree:GetLineHeight() end

---[CLIENT AND MENU] Returns the currently selected node.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:GetSelectedItem)
---@return Panel # Curently selected node.
function DTree:GetSelectedItem() end

---[CLIENT AND MENU] Returns whether or not the Silkicons next to each node of the DTree will be displayed.
---
--- Individual icons can be set with DTree_Node:SetIcon or passed as the second argument in DTree:AddNode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:GetShowIcons)
---@return boolean # Whether or not the silkicons next to each node will be displayed.
function DTree:GetShowIcons() end

---[CLIENT AND MENU] Does nothing.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:LayoutTree)
function DTree:LayoutTree() end

---[CLIENT AND MENU] Moves given node to the top of DTrees children. (Makes it the topmost mode)
---
--- Used as a placeholder function alongside DTree:ExpandTo, DTree:SetExpanded and DTree:ChildExpanded.
---
--- The DTree acts a root node and methods with the same name in DTree_Node call to the parent.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:MoveChildTo)
---@param child Panel The node to move
---@param pos number  Unused, does nothing.
function DTree:MoveChildTo(child, pos) end

---[CLIENT AND MENU] Returns the root DTree_Node, the node that is the parent to all other nodes of the DTree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:Root)
---@return Panel # Root node.
function DTree:Root() end

---[CLIENT AND MENU] Enables the "click when drag-hovering" functionality.
---
--- If enabled, when hovering over any DTree_Node of this DTree while dragging a panel, the node will be automatically clicked on (and subsequently DTree:OnNodeSelected will be called) to open any attached panels, such as spawnlists in spawnmenu.
---
--- See also: PANEL:DragHoverClick.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:SetClickOnDragHover)
---@param enable boolean
function DTree:SetClickOnDragHover(enable) end

---[CLIENT AND MENU] Does nothing. Is not called by the DTree itself.
---
--- Used as a placeholder empty function alongside DTree:ExpandTo, DTree:MoveChildTo and DTree:ChildExpanded to prevent errors when DTree_Node:SetExpanded is incorrectly used on a DTree.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:SetExpanded)
---@param bExpand boolean
function DTree:SetExpanded(bExpand) end

---[CLIENT AND MENU] Sets the indentation size of the DTree, the distance between each "level" of the tree is offset on the left from the previous level.
---
--- Currently this feature has no effect on the DTree element.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:SetIndentSize)
---@param size number The new indentation size.
function DTree:SetIndentSize(size) end

---[CLIENT AND MENU] Sets the height of each DTree_Node in the tree.
---
--- The default value is 17.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:SetLineHeight)
---@param h number The height to set.
function DTree:SetLineHeight(h) end

---[CLIENT AND MENU] Set the currently selected top-level node.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:SetSelectedItem)
---@param node Panel DTree_Node to select.
function DTree:SetSelectedItem(node) end

---[CLIENT AND MENU] Sets whether or not the Silkicons next to each node of the DTree will be displayed.
---
--- Individual icons can be set with DTree_Node:SetIcon or passed as the second argument in DTree:AddNode.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:SetShowIcons)
---@param show boolean Whether or not to show icons.
function DTree:SetShowIcons(show) end

---[CLIENT AND MENU] Returns whether or not the Silkicons next to each node of the DTree will be displayed.
---
--- Alias of DTree:GetShowIcons.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/DTree:ShowIcons)
---@return boolean # Whether or not the silkicons next to each node will be displayed.
function DTree:ShowIcons() end
