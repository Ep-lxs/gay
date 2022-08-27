--if loaded then
--	return 
--end
--getgenv().loaded = true

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stebulous/solaris-ui-lib/main/source.lua"))()
local Util = require("./util.lua")

local Highlights = {}

if not readfile("Ep-lxs/gay/esp") then
	save({
		DepthMode = 0,
		FillColor = Color3.fromRGB(0, 0, 0),
		FillTransparency = 0.6,
		OutlineColor = Color3.fromRGB(0, 0, 0)
		OutlineTransparency = 0
	})
end
getgenv().settings = Util.HttpService:JSONDecode(readfile("Ep-lxs/gay/esp"))

function Create(className, properties)
	local instance = Instance.new(className)

	for property, value in next, properties do 
		instance[property] = value
	end

	return instance
end

function createHighlight()
    local highlight = Create("Highlight", {
		DepthMode = 0,
		FillColor = Color3.fromRGB(0, 0, 0),
		FillTransparency = 0.6,
		OutlineColor = Color3.fromRGB(0, 0, 0),
		OutlineTransparency = 0,		
	})

    return highlight
end

function ESP(player)
	if (player == Util.Player) or (Highlights[player]) then return end
	if (not player.Character) then return end

	local highlight = createHighlight()
	highlight.Adornee = player.Character
	highlight.Parent = Util.CoreGui
	highlight.Enabled = Library.Flags["ESP"]

	Highlights[player] = highlight
end

function Connect(player)
    if player == Util.Player then return end

    local function CharacterAdded(character)
        if Highlights[player] then
			Highlights[player].Adornee = character 
		else
			ESP(player)
		end
    end

    if player.Character then
        CharacterAdded(player.Character)
    end

    player.CharacterAdded:Connect(CharacterAdded)
end

for _, player in next, Util.Players:GetPlayers() do
    Connect(player)
end

Util.Players.PlayerAdded:Connect(Connect)
Util.Players.PlayerRemoving:Connect(function(player)
    if Highlights[player] then
        Highlights[player]:Destroy()
        Highlights[player] = nil
    end
end)

RunService.Heartbeat:Connect(function()
	for player, highlight in next, Highlights do
		highlight.FillColor = player.TeamColor.Color
		highlight.FillTransparency = Library.Flags["FillTransparency"]
		highlight.OutlineColor = Library.Flags["OutlineColor"]
		highlight.OutlineTransparency = Library.Flags["OutlineTransparency"]
	end
end)

local Window = Library:New({
   Name = "Ep-lxs/gay",
   FolderToSave = "Ep-lxs/gay"
})

local Visuals = Window:Tab("Visuals")

local ESP = Visuals:Section("ESP")

ESP:Toggle("Enabled", false, "ESP", function(bool) 
	if bool then
		for _, highlight in next, Highlights do 
			highlight.Enabled = true
		end
	else
		for _, highlight in next, Highlights do 
			highlight.Enabled = false
		end
	end
end)
ESP:Slider("FillTransparency", 0.6, 1, 0, 0.05, "FillTransparency", function(t) end)
ESP:Colorpicker("OutlineColor", Color3.fromRGB(0, 0, 0), "OutlineColor", function(t) end)
ESP:Slider("OutlineTransparency", 0, 1, 0, 0.05, "OutlineTransparency", function(t) end)
