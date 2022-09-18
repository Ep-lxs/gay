local util = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ep-lxs/gay/main/modules/util.lua"))
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/matas3535/PoopLibrary/main/Library.lua"))()

--[[local keys = {
    plant = "["
    collect = "]"
}]]

getgenv().settings = {
    fruit = "Bloodfruit"
}

getgenv().plant = function()
    for _, v in pairs(workspace.Deployables:GetChildren()) do
        if v.Name == "Plant Box" and (util.Character.Head.Position - v.PrimaryPart.Position).magnitude < 69 then
            util.ReplicatedStorage.Events.InteractStructure:FireServer(v, "Bloodfruit")
        end
    end
end

getgenv().collect = function()
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "Bloodfruit Bush" and (util.Character.Head.Position - v.PrimaryPart.Position).magnitude < 69 then
            util.ReplicatedStorage.Events.Pickup:FireServer(v)
        end
    end
end
local LocalPlayer = game:GetService("Players").LocalPlayer
local RootPart = LocalPlayer.Character.HumanoidRootPart
local cframe = RootPart.CFrame
local Remote = game:GetService("ReplicatedStorage").Events.PlaceStructure


Remote:FireServer("Plant Box", cframe * CFrame.new(9, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(8.5, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(8, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(7.5, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(7, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(6.5, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(6, -3.5, -0), 0)

local util = loadstring(game:HttpGet("raw.githubusercontent.com/Ep-lxs/gay/blob/main/modules/util.lua"))

for y = -3.5, -2, 0.5 do 
    for x = 9, 6, -0.5 do
        util.ReplicatedStorage.Events.PlaceStructure:FireServer(
            "Plant Box",
            util.Character.HumanoidRootPart.CFrame * CFrame.new(x, y, 0),
            0
        )
    end
end

Remote:FireServer("Plant Box", cframe * CFrame.new(9, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(8.5, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(8, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(7.5, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(7, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(6.5, -3.5, -0), 0)
Remote:FireServer("Plant Box", cframe * CFrame.new(6, -3.5, -0), 0)

--[[util.Mouse.KeyUp:connect(function(key)
    if key == keys.plant then
        plant()
    elseif key == keys.collect then
        collect()
    end
end)]]

local Window = Library:New({Name = "???", Accent = Color3.fromRGB(49, 106, 212)})

local Main = Window:Page({Name = "Main"})

local Autofarm = Autofarm:Section({Name = "Autofarm", Side = "Left"})
Autofarm:Toggle({Name = "Enabled", Default = false, Pointer = "Enabled", Callback = function()

end})

local Plantboxes = Autofarm:Section({Name = "Plantboxes", Side = "Right"})
Plantboxes:Slider({Name = "Amount", Minimum = 1, Maximum = 1000, Default = 1000, Decimals = 10, Pointer = "Amount"})
Plantboxes:Button({Name = "Place", Callback = function() 
     print("boop")
end})


:Keybind({Default = Enum.KeyCode.E, KeybindName = "Aimbot", Mode = "Hold", Pointer = "AimbotMain_Bind"})
Aimbot_Main:Slider({Name = "Smoothness", Minimum = 1, Maximum = 30, Default = 1.5, Decimals = 0.1, Pointer = "AimbotMain_Smoothness"})
Aimbot_Main:Multibox({Name = "Hit-Part", Minimum = 1, Options = {"Head", "Torso", "Arms", "Legs"}, Default = {"Head", "Torso"}, Pointer = "AimbotMain_Hitpart"})
--
Aimbot_Extra:Keybind({Name = "Readjustment", Default = Enum.UserInputType.MouseButton2, KeybindName = "Readjustment", Mode = "Hold", Pointer = "AimbotExtra_Readjustment"})
Aimbot_Extra:Dropdown({Name = "Aimbot-Type", Options = {"Relative", "Absolute", "Camera", "Camera Relative"}, Default = "Relative", Pointer = "AimbotExtra_Type"})
Aimbot_Extra:Colorpicker({Name = "Locking-Color", Info = "Aimbot Locked Color", Alpha = 0.5, Default = Color3.fromRGB(255, 0, 0), Pointer = "AimbotExtra_Color"})
-- // Visuals
local VisualsEnemies_BoxEsp = Visuals_Enemies:Toggle({Name = "Box-Esp", Default = false, Pointer = "VisualsEnemies_BoxEsp"})
VisualsEnemies_BoxEsp:Colorpicker({Info = "ESP-Box Color", Alpha = 0.75, Default = Color3.fromRGB(200, 200, 200), pointer = "VisualsEnemies_BoxColor"})
VisualsEnemies_BoxEsp:Colorpicker({Info = "ESP-Box Visible Color", Alpha = 0.25, Default = Color3.fromRGB(200, 100, 100), pointer = "VisualsEnemies_BoxVisibleColor"})
--
Visuals_Self:Toggle({Name = "Enabled", Default = true, Pointer = "VisualsSelf_Enabled"})
-- // Settings
Settings_Main:ConfigBox({})
Settings_Main:ButtonHolder({Buttons = {{"Load", function() end}, {"Save", function() end}}})
Settings_Main:Label({Name = "Unloading will fully unload\neverything, so save your\nconfig before unloading.", Middle = true})
Settings_Main:Button({Name = "Unload", Callback = function() Window:Unload() end})
-- // Initialisation
Window:Initialize()