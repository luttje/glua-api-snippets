DEFINE_BASECLASS("base_anim")

-- DEFINE_BASECLASS on the first line declares a local BaseClass
function ENT:Initialize()
	BaseClass.Initialize(self)
end
