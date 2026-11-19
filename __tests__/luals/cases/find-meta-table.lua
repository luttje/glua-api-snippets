-- #91: FindMetaTable returns the matching class
local PLAYER = FindMetaTable("Player")

PLAYER:Nick()
PLAYER:Nick("unexpected") -- expect: redundant-parameter
