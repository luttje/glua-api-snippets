-- AccessorFunc adds typed getters and setters
local PANEL = {}

AccessorFunc(PANEL, "text", "Text", FORCE_STRING)
AccessorFunc(PANEL, "amount", "Amount", FORCE_NUMBER)
AccessorFunc(PANEL, "data", "Data")

-- Names only known at runtime are skipped
local suffix = "Dynamic"
AccessorFunc(PANEL, "dynamic", suffix)
AccessorFunc(PANEL, "prefixed", "Prefix" .. suffix)

function PANEL:Init()
	self:SetText("Text")
	self:SetText(self:GetAmount()) -- expect: param-type-mismatch
	self:SetAmount(self:GetAmount() + 1)
	self:SetData({})
	self:SetDynamic() -- expect: undefined-field
	self:GetPrefix() -- expect: undefined-field
end

vgui.Register("AccessorPanel", PANEL, "DFrame")
