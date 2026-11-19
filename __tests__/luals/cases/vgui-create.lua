-- vgui.Create returns the created panel class
local frame = vgui.Create("DFrame")

frame:SetTitle("Title")
frame:SetTitle(5) -- expect: param-type-mismatch
