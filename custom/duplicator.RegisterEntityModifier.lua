---[SHARED] This allows you to register tweaks to entities. For instance, if you were making an "unbreakable" addon, you would use this to enable saving the "unbreakable" state of entities between duplications.
---
--- This function registers a piece of generic code that is run on all entities with this modifier. In order to have it actually run, use duplicator.StoreEntityModifier.
---
--- This function does nothing when run clientside.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/duplicator.RegisterEntityModifier)
---@param name string An identifier for your modification. This is not limited, so be verbose. `Person's 'Unbreakable' mod` is far less likely to cause conflicts than `unbreakable`
---@param func fun(ply: Player, ent: Entity, data: table) The function to be called for your modification. It should have the arguments (`Player`, `Entity`, `Data`), where data is what you pass to duplicator.StoreEntityModifier.
function duplicator.RegisterEntityModifier(name, func) end
