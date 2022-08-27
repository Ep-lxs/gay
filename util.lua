local Util = {}

function Util:Refresh()
    Util.Players = game:GetService("Players")
    Util.ReplicatedStorage = game:GetService("ReplicatedStorage")
    Util.TeleportService = game:GetService("TeleportService")
    Util.RunService = game:GetService("RunService")
    Util.HttpService = game:GetService("HttpService")
    Util.CoreGui = game:GetService("CoreGui")
    Util.TweenService = game:GetService("TweenService")

    Util.Player = Util.Players.LocalPlayer
    Util.Character = Util.Player.Character
    Util.Humanoid = Util.Character.Humanoid
    if Util.Humanoid ~= nil then
        Util.Health = Util.Humanoid.Health
        Util.MaxHealth = Util.Humanoid.MaxHealth
        Util.WalkSpeed = Util.Humanoid.WalkSpeed
        Util.JumpPower = Util.Humanoid.JumpPower
    end
end

Util.RunService.RenderStepped:Connect(function()
    Util:Refresh()
end)

return Util
