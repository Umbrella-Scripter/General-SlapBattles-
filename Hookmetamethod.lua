if not hookmetamethod then return end
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

_G.GlovelCritInf = false
_G.PreventPhaseAbility = false
_G.PreventBrickSpawn = false
_G.BusPreventSpawn = false
_G.PreventWellSpawn = false
_G.PreventObbySpawn = false
local GlovelEvent = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralHit")
if GlovelEvent then
local HookGlovel
HookGlovel = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == GlovelEvent and getnamecallmethod() == "FireServer" and _G.GlovelCritInf then
        args[2] = true
        return HookGlovel(self,unpack(args))
    end
    return HookGlovel(self,...)
end)
end

-- This is for dumbass people who cannot wait and keep spamming ability without brain to active anti cheat to kick themselves and bark it's my fault >:(
local BrickEvent = game:GetService("ReplicatedStorage"):FindFirstChild("lbrick")
local HookBrick
if BrickEvent then
HookBrick = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == BrickEvent and getnamecallmethod() == "FireServer" and _G.PreventBrickSpawn and #args == 0 then
	pcall(function() game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text = tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text) - 1 end)
        return
    end
    return HookBrick(self,...)
end)
end

local PhaseEvent = game:GetService("ReplicatedStorage"):FindFirstChild("PhaseA")
local HookPhase
if PhaseEvent then
HookPhase = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == PhaseEvent and getnamecallmethod() == "FireServer" and _G.PreventPhaseAbility and #args == 0 then
		return
	end 
    return HookPhase(self,...)
end)
end


local BusEvent = game:GetService("ReplicatedStorage"):FindFirstChild("busmoment")
local HookBus
if BusEvent then
HookBus = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == BusEvent and getnamecallmethod() == "FireServer" and _G.BusPreventSpawn and #args == 0 then
		return
	end 
    return HookBus(self,...)
end)
end

local WellEvent = game:GetService("ReplicatedStorage"):FindFirstChild("Well")
local HookWell
if WellEvent then
HookWell = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == WellEvent and getnamecallmethod() == "FireServer" and _G.PreventWellSpawn and #args == 0 then
		return
	end 
    return HookWell(self,...)
end)
end

local ObbyEvent = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralAbility")
local HookObby
if ObbyEvent then
HookObby = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    if not checkcaller() and self == ObbyEvent and getnamecallmethod() == "FireServer" and _G.PreventObbySpawn and #args == 2 and args[2] == 1 then
		return
	end 
    return HookObby(self,...)
end)
end
