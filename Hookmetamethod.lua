-- Anticheat bypass
local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
   if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
       return
	end
   return Namecall(self, ...)
end)

if not Extra_Hookmentamethod_Gloves then return end
local oldRemoteglovel = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralHit")
local namecallglovel

namecallglovel = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod():lower()
    if not checkcaller() and self == oldRemoteglovel and method == "fireserver" and _G.GlovelCritInf then
        args[2] = true
        return namecallglovel(self,unpack(args))
    end
    return namecallglovel(self,...)
end)
