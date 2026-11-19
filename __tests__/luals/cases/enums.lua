-- Real enums are globals
print(FCVAR_ARCHIVE)

-- #76: enums that only exist on the wiki for reference are not globals
print(NORTH_WEST) -- expect: undefined-global
