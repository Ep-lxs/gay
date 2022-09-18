local util = loadstring(game:HttpGet("raw.githubusercontent.com/Ep-lxs/gay/blob/main/modules/util.lua"))()

local guis = util.ReplicatedStorage:WaitForChild("Guis")

local nameGui = guis:WaitForChild("NameGui")
local healthGui = guis:WaitForChild("HealthGui")

local function addDecor(instance)
    local folder = util.Create("Folder", {
        Parent = instance,
        Name = "Decor"
    })
    util.Create("Frame", {
        Parent = Decor,
        Name = "Light",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.new(1, 0, 0, 6),
        BackgroundColor = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.6,
    })
    util.Create("Frame", {
        Parent = Decor,
        Name = "Light",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 3),
        Size = UDim2.new(0, 6, 1, -6),
        BackgroundColor = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.6,
    })
    util.Create("Frame", {
        Parent = Decor,
        Name = "Dark",
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 3),
        Size = UDim2.new(0, 6, 1, -6),
        BackgroundColor = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.6,
    })
    util.Create("Frame", {
        Parent = Decor,
        Name = "Dark",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, 0),
        Size = UDim2.new(1, -12, 0, -6),
        BackgroundColor = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.6,
    })
end

nameGui.TextLabel.Font = "GothamSemibold"
addDecor(healthGui)

for _,player in next, util.Players:GetPlayers() do
    if player ~= util.Player then
        local character
        if character then
            local instance = character.HumanoidRootPart:FindFirstChild("NameGui") 
            if instance then
                if instance.TextLabel.Font ~= "GothamSemibold" then
                    instance.TextLabel.Font = "GothamSemibold"
                    addDecor(character.HumanoidRootPart.HealthGui)
                end
            end
        end
    end
end