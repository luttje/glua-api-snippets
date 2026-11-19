-- Accessors are available wherever the table is used
local panel = vgui.Create("AccessorPanel")
panel:SetText("Text")
panel:SetText(5) -- expect: param-type-mismatch

local ent = ents.Create("ent_accessor")
ent:SetSpeed(1)
ent:SetSpeed("fast") -- expect: param-type-mismatch

---@class Player
local meta = FindMetaTable("Player")
AccessorFunc(meta, "foo_bar", "FooBar", FORCE_BOOL)

---@type Player
local ply
ply:SetFooBar(ply:GetFooBar())
ply:SetFooBar(1) -- expect: param-type-mismatch
