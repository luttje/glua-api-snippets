AccessorFunc(ENT, "speed", "Speed", FORCE_NUMBER)

function ENT:Think()
	self:SetSpeed(self:GetSpeed() * 2)
end
