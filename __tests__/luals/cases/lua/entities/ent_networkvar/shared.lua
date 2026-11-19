-- NetworkVar creates typed getters and setters
function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Amount")
end

function ENT:Think()
	self:SetAmount(self:GetAmount() + 1)
	self:SetAmount("five") -- expect: param-type-mismatch
	self:GetNothing() -- expect: undefined-field
end

function ENT:Custom() end
