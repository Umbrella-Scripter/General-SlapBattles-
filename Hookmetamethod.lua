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

local Events = {
    Glovel = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralHit"),
    Brick = game:GetService("ReplicatedStorage"):FindFirstChild("lbrick"),
    Phase = game:GetService("ReplicatedStorage"):FindFirstChild("PhaseA")
}

local Hook = hookmetamethod(game, "__namecall", function(self, ...)
    local args, method = {...}, getnamecallmethod()
    
    if not checkcaller() and method == "FireServer" then
        if self == Events.Glovel and _G.GlovelCritInf then
            args[2] = true
            return Hook(self, unpack(args))
        elseif #args == 0 then
            if self == Events.Brick and _G.PreventBrickSpawn then
                pcall(function()
                    local gui = game.Players.LocalPlayer.PlayerGui.BRICKCOUNT
                    gui.ImageLabel.TextLabel.Text -= 1
                end)
                return
            elseif self == Events.Phase and _G.PreventPhaseAbility then
                return
            end
        end
    end
    return Hook(self, ...)
end)

