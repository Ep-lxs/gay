local util = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ep-lxs/gay/main/modules/util.lua"))()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/sol"))()

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
        if (v.Name == "Plant Box") and (util.HumanoidRootPart.Position - v.PrimaryPart.Position).magnitude < 69 then
            util.ReplicatedStorage.Events.InteractStructure:FireServer(v, settings.Autofarm.fruit)
        end
    end
end

getgenv().collect = function()
    for _, v in pairs(workspace:GetChildren()) do
        if (v.Name == growsInto[settings.Autofarm.fruit]) and (util.HumanoidRootPart.Position - v.PrimaryPart.Position).magnitude < 69 then
            util.ReplicatedStorage.Events.Pickup:FireServer(v)
        end
    end
end

local window = library:New({
    Name = "???",
    FolderToSave = "12345"
 })
 
local Main = window:Tab("Main")
 
local sec = Main:Section("Autofarm")

sec:Dropdown("Fruit", {"Bloodfruit", "Bluefruit", "Berry", "Apple", "Lemon"},"Bloodfruit","Dropdown", function(value)
    settings.Autofarm.fruit = value
end)
sec:Button("Plant", function()
    plant()
end)
sec:Button("Collect", function()
    collect()
end)
sec:Button("Place 112 plant boxes", function()
    for y = -3.5, 0, 0.5 do 
        for i = 9, 6, -0.5 do
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.HumanoidRootPart.CFrame * CFrame.new(i, y, 0),
                0
            )
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.HumanoidRootPart.CFrame * CFrame.new(0, y, i),
                0
            )
        end
        for i = -9, -6, 0.5 do
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.HumanoidRootPart.CFrame * CFrame.new(i, y, 0),
                0
            )
            util.ReplicatedStorage.Events.PlaceStructure:FireServer(
                "Plant Box",
                util.HumanoidRootPart.CFrame * CFrame.new(0, y, i),
                0
            )
        end
    end
end)