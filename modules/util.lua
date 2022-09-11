local module = {}

function module:Refresh()
    module.Players = game:GetService("Players")
    module.ReplicatedStorage = game:GetService("ReplicatedStorage")
    module.TeleportService = game:GetService("TeleportService")
    module.RunService = game:GetService("RunService")
    module.HttpService = game:GetService("HttpService")
    module.CoreGui = game:GetService("CoreGui")
    module.TweenService = game:GetService("TweenService")
    module.PathfindingService = game:GetService("PathfindingService")

    module.Player = module.Players.LocalPlayer
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

    function module.RGB(Color, Value)
        return Color3.fromRGB(Color.R * Value, Color.G * Value, Color.B * Value)
    end
end

module:Refresh()
module.RunService.RenderStepped:Connect(function()
    module:Refresh()
end)

return module
