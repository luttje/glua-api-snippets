-- vgui.Create returns the class of library panels
local frame = vgui.Create("DFrame")
frame:SetTitle("Title")
frame:SetTitle(5) -- expect: param-type-mismatch
frame:SetSize(1, 1)

-- Unknown names, or names in variables, are still panels
local unknown = vgui.Create("NotRegistered")
unknown:SetSize(1, 1)
unknown:SetTitle("Title") -- expect: undefined-field

local className = "D" .. "Frame"
local dynamic = vgui.Create(className)
dynamic:SetSize(1, 1)
dynamic:NotAMethod() -- expect: undefined-field

-- Panels registered with vgui.Register or derma.DefineControl return their own class
local custom = vgui.Create("MyPanel")
custom:Custom()
custom:SetTitle(5) -- expect: param-type-mismatch
custom:NotAMethod() -- expect: undefined-field

local withoutBase = vgui.Create("MyBasePanel")
withoutBase:SetSize(1, 1)
withoutBase:SetTitle("Title") -- expect: undefined-field

local control = vgui.Create("MyControl")
control:Control()
control:SetTitle("Title")

-- Classes annotated by the user are kept
local annotated = vgui.Create("MyAnnotatedPanel")
annotated:Annotated()
annotated:SetTitle(5) -- expect: param-type-mismatch

local renamed = vgui.Create("My.RenamedPanel")
renamed:Renamed()
renamed:SetTitle("Title")
renamed:NotAMethod() -- expect: undefined-field

---@param panel My.PanelClass
local function UseAnnotatedClass(panel)
	panel:Renamed()
end
