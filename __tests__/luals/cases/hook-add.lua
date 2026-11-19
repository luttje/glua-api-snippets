-- #84: hook.Add overloads type the callback from the hook's arguments and returns
hook.Add("PlayerSay", "test", function(ply, text)
	ply:Nick()
	ply:NotAMethod() -- expect: undefined-field

	return text
end)

hook.Add("PlayerSay", "test", function()
	return 5 -- expect: return-type-mismatch
end)

-- #86: hooks without documented returns may still return values
hook.Add("PlayerInitialSpawn", "test", function(ply, transition)
	ply:NotAMethod() -- expect: undefined-field

	return true
end)
