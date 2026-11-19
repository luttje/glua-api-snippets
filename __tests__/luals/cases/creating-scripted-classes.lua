-- Creating a scripted entity by name returns its class
local ent = ents.Create("ent_networkvar")
ent:SetAmount(1)
ent:SetAmount("one") -- expect: param-type-mismatch
ent:Custom()
ent:Spawn()
ent:NotAMethod() -- expect: undefined-field

local clientside = ents.CreateClientside("ent_networkvar")
clientside:Custom()

-- Classes without a definition, or names in variables, are still entities
local prop = ents.Create("prop_physics")
prop:Spawn()
prop:NotAMethod() -- expect: undefined-field

-- NetworkVar accessors belong to their own class, not to every entity
ent.SetAmount(prop, 1) -- expect: param-type-mismatch

local className = "prop_" .. "physics"
local dynamic = ents.Create(className)
dynamic:Spawn()
dynamic:NotAMethod() -- expect: undefined-field

-- Same for weapons given to players
---@type Player
local ply

local weapon = ply:Give("weapon_a")
weapon:CustomFunction()
weapon:Clip1()

local crowbar = ply:Give("weapon_crowbar")
crowbar:Clip1()
crowbar:NotAMethod() -- expect: undefined-field

-- Classes annotated by the user still work
local annotated = ents.Create("ent_annotated")
annotated:Annotated()
annotated:Spawn()
annotated:NotAMethod() -- expect: undefined-field
