---@meta

killicon = {}

---[CLIENT] Creates new kill icon using a texture.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/killicon.Add)
---@param class string Weapon or entity class
---@param texture string Path to the texture
---@param color table Color of the kill icon
function killicon.Add(class, texture, color) end

---[CLIENT] Creates kill icon from existing one.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/killicon.AddAlias)
---@param new_class string New class of the kill icon
---@param existing_class string Already existing kill icon class
function killicon.AddAlias(new_class, existing_class) end

---[CLIENT] Adds kill icon for given weapon/entity class using special font.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/killicon.AddFont)
---@param class string Weapon or entity class
---@param font string Font to be used
---@param symbol string The symbol to be used
---@param color table Color of the killicon
function killicon.AddFont(class, font, symbol, color) end

---[CLIENT] Draws a kill icon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/killicon.Draw)
---@param x number X coordinate of the icon
---@param y number Y coordinate of the icon
---@param name string Classname of the kill icon
---@param alpha number Alpha/transparency value ( 0 - 255 ) of the icon
function killicon.Draw(x, y, name, alpha) end

---[CLIENT] Checks if kill icon exists for given class.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/killicon.Exists)
---@param class string The class to test
---@return boolean #Returns true if kill icon exists
function killicon.Exists(class) end

---[CLIENT] Returns the size of a kill icon.
---
---[(View on wiki)](https://wiki.facepunch.com/gmod/killicon.GetSize)
---@param name string Classname of the kill icon
---@return number, number #number - Width of the kill icon
---@return number, number #number - Height of the kill icon
function killicon.GetSize(name) end
