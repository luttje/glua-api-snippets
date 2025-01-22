export const markup = `<function name="PlayerInitialSpawn" parent="GM" type="hook">
<ishook>yes</ishook>
<description>
Called when the player spawns for the first time.

See <page>GM:PlayerSpawn</page> for a hook called every player spawn.

<note>This hook is called before the player has fully loaded, when the player is still in seeing the \`Starting Lua\` screen. For example, trying to use the <page>Entity:GetModel</page> function will return the default model (\`models/player.mdl\`).</note>

<note>You can send <page>net</page> messages starting from the player_activate event (see <page>Game_Events</page>).</note>

<warning>Due to the above note, sending <page>net</page> messages to the spawned player in this hook are highly unreliable, and they most likely won't be received (more information here: https://github.com/Facepunch/garrysmod-requests/issues/718).

Workaround without networking:
\`\`\`
local load_queue = {}

hook.Add("PlayerInitialSpawn", "myAddonName/Load", function(ply)
load_queue[ply] = true
end)

hook.Add("SetupMove", "myAddonName/Load", function(ply, _, cmd)
if load_queue[ply] and not cmd:IsForced() then
load_queue[ply] = nil

myAddon:OnPlayerNetReady(ply) -- Send what you need here!
end
end)
\`\`\`


With networking:
\`\`\`
-- CLIENT
hook.Add( "InitPostEntity", "Ready", function()
net.Start( "cool_addon_client_ready" )
net.SendToServer()
end )
\`\`\`
\`\`\`
-- SERVER
util.AddNetworkString( "cool_addon_client_ready" )

net.Receive( "cool_addon_client_ready", function( len, ply )
-- Send what you need here!
end )
\`\`\`
</warning>
</description>
<realm>Server</realm>
<predicted>No</predicted>
<args>
  <arg name="player" type="Player">The player who spawned.</arg>
  <arg name="transition" type="boolean">If \`true\`, the player just spawned from a map transition.</arg>
</args>
</function>

<example>
<description>Prints the name of the player joining.</description>
<code>
function GM:PlayerInitialSpawn(ply)
print( ply:Nick() .. " joined the server." )
end

-- That way you are overriding the default hook.
-- You can use hook.Add to make more functions get called when this event occurs.
hook.Add( "PlayerInitialSpawn", "some_unique_name", function( ply )
print( ply:Nick() .." joined the game." )
end)
</code>
<output>
\`\`\`
Player1 joined the game.
\`\`\`
</output>
</example>`;

export const json = {
  url: 'https://wiki.facepunch.com/gmod/GM:PlayerInitialSpawn',
  isHook: 'yes',
  type: 'hook',
  parent: 'GM',
  name: 'PlayerInitialSpawn',
  address: 'GM:PlayerInitialSpawn',
  description: `
Called when the player spawns for the first time.

See [GM:PlayerSpawn](https://wiki.facepunch.com/gmod/GM:PlayerSpawn) for a hook called every player spawn.

**NOTE**: This hook is called before the player has fully loaded, when the player is still in seeing the \`Starting Lua\` screen. For example, trying to use the [Entity:GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel) function will return the default model (\`models/player.mdl\`).


**NOTE**: You can send [net](https://wiki.facepunch.com/gmod/net) messages starting from the player_activate event (see [Game_Events](https://wiki.facepunch.com/gmod/Game_Events)).


**WARNING**: Due to the above note, sending [net](https://wiki.facepunch.com/gmod/net) messages to the spawned player in this hook are highly unreliable, and they most likely won't be received (more information here: https://github.com/Facepunch/garrysmod-requests/issues/718).

Workaround without networking:
\`\`\`
local load_queue = {}

hook.Add("PlayerInitialSpawn", "myAddonName/Load", function(ply)
load_queue[ply] = true
end)

hook.Add("SetupMove", "myAddonName/Load", function(ply, _, cmd)
if load_queue[ply] and not cmd:IsForced() then
load_queue[ply] = nil

myAddon:OnPlayerNetReady(ply) -- Send what you need here!
end
end)
\`\`\`


With networking:
\`\`\`
-- CLIENT
hook.Add( "InitPostEntity", "Ready", function()
net.Start( "cool_addon_client_ready" )
net.SendToServer()
end )
\`\`\`
\`\`\`
-- SERVER
util.AddNetworkString( "cool_addon_client_ready" )

net.Receive( "cool_addon_client_ready", function( len, ply )
-- Send what you need here!
end )
\`\`\`\n\n`,
  realm: 'Server',
  arguments: [ { args: [
    {
      name: 'player',
      type: 'Player',
      description: 'The player who spawned.',
    },
    {
      name: 'transition',
      type: 'boolean',
      description: 'If `true`, the player just spawned from a map transition.',
    },
  ], } ],
  returns: [],
};

export const apiDefinition = `---@class GM
GM = {}

---![(Server)](https://github.com/user-attachments/assets/d8fbe13a-6305-4e16-8698-5be874721ca1) Called when the player spawns for the first time.
---
--- See [GM:PlayerSpawn](https://wiki.facepunch.com/gmod/GM:PlayerSpawn) for a hook called every player spawn.
---
--- **NOTE**: This hook is called before the player has fully loaded, when the player is still in seeing the \`Starting Lua\` screen. For example, trying to use the [Entity:GetModel](https://wiki.facepunch.com/gmod/Entity:GetModel) function will return the default model (\`models/player.mdl\`).
---
--- **NOTE**: You can send [net](https://wiki.facepunch.com/gmod/net) messages starting from the player_activate event (see [Game_Events](https://wiki.facepunch.com/gmod/Game_Events)).
---
--- **WARNING**: Due to the above note, sending [net](https://wiki.facepunch.com/gmod/net) messages to the spawned player in this hook are highly unreliable, and they most likely won't be received (more information here: https://github.com/Facepunch/garrysmod-requests/issues/718).
---
--- Workaround without networking:
--- \`\`\`
--- local load_queue = {}
---
--- hook.Add("PlayerInitialSpawn", "myAddonName/Load", function(ply)
--- load_queue[ply] = true
--- end)
---
--- hook.Add("SetupMove", "myAddonName/Load", function(ply, _, cmd)
--- if load_queue[ply] and not cmd:IsForced() then
--- load_queue[ply] = nil
---
--- myAddon:OnPlayerNetReady(ply) -- Send what you need here!
--- end
--- end)
--- \`\`\`
---
--- With networking:
--- \`\`\`
--- -- CLIENT
--- hook.Add( "InitPostEntity", "Ready", function()
--- net.Start( "cool_addon_client_ready" )
--- net.SendToServer()
--- end )
--- \`\`\`
--- \`\`\`
--- -- SERVER
--- util.AddNetworkString( "cool_addon_client_ready" )
---
--- net.Receive( "cool_addon_client_ready", function( len, ply )
--- -- Send what you need here!
--- end )
--- \`\`\`
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/GM:PlayerInitialSpawn)
---@param player Player The player who spawned.
---@param transition boolean If \`true\`, the player just spawned from a map transition.
function GM:PlayerInitialSpawn(player, transition) end\n\n`;
