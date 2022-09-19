local module = {}

module.Players = game:GetService("Players")
module.ReplicatedStorage = game:GetService("ReplicatedStorage")
module.TeleportService = game:GetService("TeleportService")
module.RunService = game:GetService("RunService")
module.HttpService = game:GetService("HttpService")
module.CoreGui = game:GetService("CoreGui")
module.TweenService = game:GetService("TweenService")
module.PathfindingService = game:GetService("PathfindingService")

module.Player = module.Players.LocalPlayer
module.Mouse = module.Player:GetMouse()
module.Character = module.Player.Character
module.Humanoid = module.Character.Humanoid
if module.Humanoid ~= nil then
    module.Health = module.Humanoid.Health
    module.MaxHealth = module.Humanoid.MaxHealth
    module.WalkSpeed = module.Humanoid.WalkSpeed
    module.JumpPower = module.Humanoid.JumpPower
end

function module.Create(ClassName, Properties)
    local instance = Instance.new(ClassName)

    for property, value in next, Properties do
        instance[property] = value
    end
    
    return instance
end

function Refresh()
    module.Players = game:GetService("Players")
    module.ReplicatedStorage = game:GetService("ReplicatedStorage")
    module.TeleportService = game:GetService("TeleportService")
    module.RunService = game:GetService("RunService")
    module.HttpService = game:GetService("HttpService")
    module.CoreGui = game:GetService("CoreGui")
    module.TweenService = game:GetService("TweenService")
    module.PathfindingService = game:GetService("PathfindingService")

    module.Player = module.Players.LocalPlayer
    module.Mouse = module.Player:GetMouse()
    module.Character = module.Player.Character
    module.HumanoidRootPart = module.Character.HumanoidRootPart
    module.Humanoid = module.Character.Humanoid
    if module.Humanoid ~= nil then
        module.Health = module.Humanoid.Health
        module.MaxHealth = module.Humanoid.MaxHealth
        module.WalkSpeed = module.Humanoid.WalkSpeed
        module.JumpPower = module.Humanoid.JumpPower
    end

    function module.Create(ClassName, Properties)
        local instance = Instance.new(ClassName)

        for property, value in next, Properties do
            instance[property] = value
        end
        
        return instance
    end
end

Refresh()
while task.wait() do
    Refresh()
end

return module
