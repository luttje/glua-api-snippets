---@meta

--- A class used to store the player inputs, such as mouse movement, view angles, [Enums/IN](https://wiki.facepunch.com/gmod/Enums/IN) buttons pressed and analog movement, the data from this class is then transfered to a [CMoveData](https://wiki.facepunch.com/gmod/CMoveData) during actual movement simulation.
---
--- Can be modified during [GM:CreateMove](https://wiki.facepunch.com/gmod/GM:CreateMove), [GM:StartCommand](https://wiki.facepunch.com/gmod/GM:StartCommand) and used in read only with [GM:SetupMove](https://wiki.facepunch.com/gmod/GM:SetupMove) and [Player:GetCurrentCommand](https://wiki.facepunch.com/gmod/Player:GetCurrentCommand).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd)
---@class CUserCmd
local CUserCmd = {}

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Adds a single key to the active buttons bitflag. See also [CUserCmd:SetButtons](https://wiki.facepunch.com/gmod/CUserCmd:SetButtons).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:AddKey)
---@param key number Key to add, see Enums/IN.
function CUserCmd:AddKey(key) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Removes all keys from the command.
---
--- **NOTE**: If you are looking to affect player movement, you may need to use [CUserCmd:ClearMovement](https://wiki.facepunch.com/gmod/CUserCmd:ClearMovement) instead of clearing the buttons.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:ClearButtons)
function CUserCmd:ClearButtons() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Clears the movement from the command.
---
--- See also [CUserCmd:SetForwardMove](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove), [CUserCmd:SetSideMove](https://wiki.facepunch.com/gmod/CUserCmd:SetSideMove) and  [CUserCmd:SetUpMove](https://wiki.facepunch.com/gmod/CUserCmd:SetUpMove).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:ClearMovement)
function CUserCmd:ClearMovement() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns an increasing number representing the index of the user cmd.
---
--- **WARNING**: The value returned is occasionally 0 inside [GM:CreateMove](https://wiki.facepunch.com/gmod/GM:CreateMove) and [GM:StartCommand](https://wiki.facepunch.com/gmod/GM:StartCommand). It is advised to check for a non-zero value if you wish to get the correct number.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:CommandNumber)
---@return number # The command number
function CUserCmd:CommandNumber() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns a bitflag indicating which buttons are pressed.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetButtons)
---@return number # Pressed buttons, see Enums/IN
function CUserCmd:GetButtons() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) The speed the client wishes to move forward with, negative if the clients wants to move backwards.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetForwardMove)
---@return number # The desired speed
function CUserCmd:GetForwardMove() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the current impulse from the client, usually 0. [See impulses list](https://developer.valvesoftware.com/wiki/Impulse) and some [GMod specific impulses](https://wiki.facepunch.com/gmod/CUserCmd:SetImpulse).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetImpulse)
---@return number # The impulse
function CUserCmd:GetImpulse() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the scroll delta as whole number.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetMouseWheel)
---@return number # Scroll delta
function CUserCmd:GetMouseWheel() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the delta of the angular horizontal mouse movement of the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetMouseX)
---@return number # xDelta
function CUserCmd:GetMouseX() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns the delta of the angular vertical mouse movement of the player.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetMouseY)
---@return number # yDelta
function CUserCmd:GetMouseY() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) The speed the client wishes to move sideways with, positive if it wants to move right, negative if it wants to move left.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetSideMove)
---@return number # requestSpeed
function CUserCmd:GetSideMove() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) The speed the client wishes to move up with, negative if the clients wants to move down.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetUpMove)
---@return number # requestSpeed
function CUserCmd:GetUpMove() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Gets the direction the player is looking in.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:GetViewAngles)
---@return Angle # The direction the player is looking in.
function CUserCmd:GetViewAngles() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) When players are not sending usercommands to the server (often due to lag), their last usercommand will be executed multiple times as a backup. This function returns true if that is happening.
---
--- This will never return true clientside.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:IsForced)
---@return boolean # isForced
function CUserCmd:IsForced() end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns true if the specified button(s) is pressed.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:KeyDown)
---@param key number Bitflag representing which button to check, see Enums/IN.
---@return boolean # Is key down or not
function CUserCmd:KeyDown(key) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Removes a key bit from the current key bitflag.
---
--- For movement you will want to use [CUserCmd:SetForwardMove](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove), [CUserCmd:SetUpMove](https://wiki.facepunch.com/gmod/CUserCmd:SetUpMove) and [CUserCmd:SetSideMove](https://wiki.facepunch.com/gmod/CUserCmd:SetSideMove).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:RemoveKey)
---@param button number Bitflag to be removed from the key bitflag, see Enums/IN.
function CUserCmd:RemoveKey(button) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Forces the associated player to select a weapon. This is used internally in the default HL2 weapon selection HUD.
---
--- This may not work immediately if the current command is in prediction. Use [input.SelectWeapon](https://wiki.facepunch.com/gmod/input.SelectWeapon) to switch the weapon from the client when the next available command can do so.
---
--- **NOTE**: This is the ideal function to use to create a custom weapon selection HUD, as it allows prediction to run properly for [WEAPON:Deploy](https://wiki.facepunch.com/gmod/WEAPON:Deploy) and [GM:PlayerSwitchWeapon](https://wiki.facepunch.com/gmod/GM:PlayerSwitchWeapon)
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SelectWeapon)
---@param weapon Weapon The weapon entity to select.
function CUserCmd:SelectWeapon(weapon) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the buttons as a bitflag. See also [CUserCmd:GetButtons](https://wiki.facepunch.com/gmod/CUserCmd:GetButtons).
---
--- **NOTE**: If you are looking to affect player movement, you may need to use [CUserCmd:SetForwardMove](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove) instead of setting the keys.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetButtons)
---@param buttons number Bitflag representing which buttons are "down", see Enums/IN.
function CUserCmd:SetButtons(buttons) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets speed the client wishes to move forward with, negative if the clients wants to move backwards.
---
--- See also [CUserCmd:ClearMovement](https://wiki.facepunch.com/gmod/CUserCmd:ClearMovement), [CUserCmd:SetSideMove](https://wiki.facepunch.com/gmod/CUserCmd:SetSideMove) and [CUserCmd:SetUpMove](https://wiki.facepunch.com/gmod/CUserCmd:SetUpMove).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove)
---@param speed number The new speed to request. The client will not be able to move faster than their set walk/sprint speed.
function CUserCmd:SetForwardMove(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the impulse command to be sent to the server.
---
--- Here are a few examples of impulse numbers:
--- - `100` toggles their flashlight
--- - `101` gives the player all Half-Life 2 weapons with `sv_cheats` set to `1`
--- - `200` toggles holstering / restoring the current weapon
---   When holstered, the `EF_NODRAW` flag is set on the active weapon.
--- - `154` toggles noclip
---
--- [See full list](https://developer.valvesoftware.com/wiki/Impulse)
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetImpulse)
---@param impulse number The impulse to send.
function CUserCmd:SetImpulse(impulse) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the scroll delta.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetMouseWheel)
---@param speed number The scroll delta.
function CUserCmd:SetMouseWheel(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the delta of the angular horizontal mouse movement of the player.
---
--- See also [CUserCmd:SetMouseY](https://wiki.facepunch.com/gmod/CUserCmd:SetMouseY).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetMouseX)
---@param speed number Angular horizontal move delta.
function CUserCmd:SetMouseX(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the delta of the angular vertical mouse movement of the player.
---
--- See also [CUserCmd:SetMouseX](https://wiki.facepunch.com/gmod/CUserCmd:SetMouseX).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetMouseY)
---@param speed number Angular vertical move delta.
function CUserCmd:SetMouseY(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets speed the client wishes to move sidewards with, positive to move right, negative to move left.
---
--- See also [CUserCmd:SetForwardMove](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove) and  [CUserCmd:SetUpMove](https://wiki.facepunch.com/gmod/CUserCmd:SetUpMove).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetSideMove)
---@param speed number The new speed to request.
function CUserCmd:SetSideMove(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets speed the client wishes to move upwards with, negative to move down.
---
--- See also [CUserCmd:SetSideMove](https://wiki.facepunch.com/gmod/CUserCmd:SetSideMove) and  [CUserCmd:SetForwardMove](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove).
--- **NOTE**: This function does **not** move the client up/down ladders. To force ladder movement, consider [CUserCMD:SetButtons](https://wiki.facepunch.com/gmod/CUserCMD:SetButtons) and use IN_FORWARD from [Enums/IN](https://wiki.facepunch.com/gmod/Enums/IN).
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetUpMove)
---@param speed number The new speed to request.
function CUserCmd:SetUpMove(speed) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Sets the direction the client wants to move in.
---
--- **NOTE**: For human players, the pitch (vertical) angle should be clamped to +/- 89&deg; to prevent the player's view from glitching.
---
--- **NOTE**: For fake clients (those created with [player.CreateNextBot](https://wiki.facepunch.com/gmod/player.CreateNextBot)), this functionally dictates the 'move angles' of the bot. This typically functions separately from the colloquial view angles. This can be utilized by [CUserCmd:SetForwardMove](https://wiki.facepunch.com/gmod/CUserCmd:SetForwardMove) and its related functions.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:SetViewAngles)
---@param viewAngle Angle New view angles.
function CUserCmd:SetViewAngles(viewAngle) end

---![(Shared)](https://github.com/user-attachments/assets/a356f942-57d7-4915-a8cc-559870a980fc) Returns tick count since joining the server.
---
--- **NOTE**: This will always return 0 for bots.
---
--- **NOTE**: Returns 0 clientside during prediction calls. If you are trying to use CUserCmd:Set*() on the client in a movement or command hook, keep doing so till TickCount returns a non-zero number to maintain prediction.
---
---[View wiki](https://wiki.facepunch.com/gmod/CUserCmd:TickCount)
---@return number # The amount of ticks passed since joining the server.
function CUserCmd:TickCount() end
