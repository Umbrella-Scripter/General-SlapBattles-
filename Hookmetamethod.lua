-- Anticheat bypass
local GeneralAnticheatBypass
GeneralAnticheatBypass = hookmetamethod(game, "__namecall", function(self, ...)
   if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
       return
	end
   return GeneralAnticheatBypass(self, ...)
end)

-- for mastery glove farm hub :3 (idk if people say i use chat GPT to code those line because it have comments:< )
if not Extra_Hookmentamethod_Gloves then return end

local GlovelEvent = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralHit")
local HookGlovel
HookGlovel = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == GlovelEvent and getnamecallmethod() == "FireServer" and _G.GlovelCritInf then
        args[2] = true
        return HookGlovel(self,unpack(args))
    end
    return HookGlovel(self,...)
end)

-- This is for dumbass people who cannot wait and keep spamming ability without brain to active anti cheat to kick themselves and bark it's my fault >:(
local BrickEvent = game:GetService("ReplicatedStorage"):FindFirstChild("lbrick")
local HookBrick
HookBrick = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == BrickEvent and getnamecallmethod() == "FireServer" and _G.PreventBrickSpawn and #args == 0 then
	pcall(function() game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text) - 1 end)
        return
    end
    return HookBrick(self,...)
end)
