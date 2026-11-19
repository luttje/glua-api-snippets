-- Fields of other weapons do not leak into this one
SWEP.PrintName = "Other gun"

function SWEP:PrimaryAttack()
	self:CustomFunction() -- expect: undefined-field
end
