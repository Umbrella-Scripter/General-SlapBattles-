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

local Events = {
    Glovel = game:GetService("ReplicatedStorage"):FindFirstChild("GeneralHit"),
    Brick = game:GetService("ReplicatedStorage"):FindFirstChild("lbrick"),
    Phase = game:GetService("ReplicatedStorage"):FindFirstChild("PhaseA")
}

local Hook = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    local isTargetEvent = (Events.Glovel and self == Events.Glovel) 
        or (Events.Brick and self == Events.Brick) 
        or (Events.Phase and self == Events.Phase)

    if not checkcaller() and method == "FireServer" and isTargetEvent then
        if Events.Glovel and self == Events.Glovel and _G.GlovelCritInf then
            args[2] = true
            return Hook(self, unpack(args))
        elseif Events.Brick and self == Events.Brick and _G.PreventBrickSpawn and #args == 0 then
            pcall(function()
                local gui = game.Players.LocalPlayer.PlayerGui.BRICKCOUNT
                gui.ImageLabel.TextLabel.Text -= 1
            end)
            return
        elseif Events.Phase and self == Events.Phase and _G.PreventPhaseAbility and #args == 0 then
            return
        end
    end

    return Hook(self, ...)
end)
