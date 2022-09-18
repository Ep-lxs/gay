local util = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ep-lxs/gay/main/modules/util.lua"))()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/matas3535/PoopLibrary/main/Library.lua"))()

local growsInto = {
    ["Apple"] = "Apple Tree",
    ["Lemon"] = "Lemon Tree",
    ["Bloodfruit"] = "Bloodfruit Bush",
    ["Bluefruit"] = "Bluefruit Bush",
    ["Berry"] = "Berry Bush",
}

getgenv().settings = {
    Autofarm = {
        fruit = "Bloodfruit",
    }
}

getgenv().plant = function()
    for _, v in pairs(workspace.Deployables:GetChildren()) do
        if (v.Name == "Plant Box") and (util.Character.Head.Position - v.PrimaryPart.Position).magnitude < 69 then
            util.ReplicatedStorage.Events.InteractStructure:FireServer(v, settings.Autofarm.fruit)
        end
    end
end

getgenv().collect = function()
    for _, v in pairs(workspace:GetChildren()) do
        if (v.Name == growsInto[settings.Autofarm.fruit]) and (util.Character.Head.Position - v.PrimaryPart.Position).magnitude < 69 then
            util.ReplicatedStorage.Events.Pickup:FireServer(v)
        end
    end
end

local Window = library:New({Name = "???", Size = Vector2.new(250, 350), Accent = Color3.fromRGB(49, 106, 212)})

local Main = Window:Page({Name = "Main"})

local Autofarm = Main:Section({Name = "Autofarm", Side = "Left"})
Autofarm:Dropdown({Name = "Fruit", Options = {"Bloodfruit", "Bluefruit", "Berry", "Lemon", "Apple"}, Default = "Bloodfruit", Pointer = "Fruit", Callback = function(v)
    settings.Autofarm.fruit = v
end})
Autofarm:Button({Name = "Plant", Callback = function()
    plant()
end})
Autofarm:Button({Name = "Collect", Callback = function()
    collect()
end})
Autofarm:Button({Name = "Place 112 plantboxes", Callback = function()
    for y = -3.5, 0, 0.5 do 
        for i = 9, 6, -0.5 do
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.Character.HumanoidRootPart.CFrame * CFrame.new(i, y, 0),
                0
            )
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.Character.HumanoidRootPart.CFrame * CFrame.new(0, y, i),
                0
            )
        end
        for i = -9, -6, 0.5 do
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.Character.HumanoidRootPart.CFrame * CFrame.new(i, y, 0),
                0
            )
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.Character.HumanoidRootPart.CFrame * CFrame.new(0, y, i),
                0
            )
        end
    end
end})

Window:Initialize()