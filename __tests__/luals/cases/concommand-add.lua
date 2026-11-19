-- #72: callback arguments are typed
concommand.Add("test", function(ply, cmd, args, argStr)
	ply:NotAMethod() -- expect: undefined-field
end)

-- #92: enum-or-table flags accept enums, tables and plain numbers
concommand.Add("test", function() end, nil, nil, FCVAR_ARCHIVE)
concommand.Add("test", function() end, nil, nil, { FCVAR_ARCHIVE, FCVAR_CHEAT })
concommand.Add("test", function() end, nil, nil, 128)
concommand.Add("test", function() end, nil, nil, "flags") -- expect: param-type-mismatch
