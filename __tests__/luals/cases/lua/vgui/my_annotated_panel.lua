-- A class annotated by the user is kept as is
--- @class MyAnnotatedPanel : DFrame
--- @field Value number
local PANEL = {}

function PANEL:Annotated()
	self.Value = 1
	self.Value = "one" -- expect: assign-type-mismatch
end

vgui.Register("MyAnnotatedPanel", PANEL, "DFrame")
