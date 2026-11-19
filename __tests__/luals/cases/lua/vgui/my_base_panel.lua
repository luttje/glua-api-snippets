-- Without a base, panels inherit from Panel
local PANEL = {}

function PANEL:Init()
	self:SetSize(1, 1)
	self:SetTitle("Title") -- expect: undefined-field
end

vgui.Register("MyBasePanel", PANEL)
