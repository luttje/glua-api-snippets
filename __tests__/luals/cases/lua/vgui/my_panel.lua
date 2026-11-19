-- Registered panels get a class inheriting from their base
local PANEL = {}

function PANEL:Custom() end

function PANEL:Init()
	self:Custom()
	self:SetTitle(5) -- expect: param-type-mismatch
end

vgui.Register("MyPanel", PANEL, "DFrame")
