-- Scripted weapons get their own class, inheriting from SWEP
SWEP.PrintName = "Gun"

function SWEP:CustomFunction() end

function SWEP:PrimaryAttack()
	self:CustomFunction()
end
