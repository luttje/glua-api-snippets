--- A scripted entity with a class annotated by the user
--- @class ent_annotated : Entity

ENT.Type = "anim"

function ENT:Annotated() end

function ENT:Initialize()
	self:Annotated()
	self:NotAMethod() -- expect: undefined-field
end
