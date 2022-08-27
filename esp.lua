--if loaded then
--	return 
--end
--getgenv().loaded = true

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
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

function createHighlight()
    local highlight = Instance.new("Highlight")
    
    for property, value in next, settings do 
        highlight[property] = value
    end

    return highlight
end

function connect(player)
    if player == Util.Player then return end

    local function characterAdded(character)
        if not Highlights[player.UserId] then
            local highlight = createHighlight()
            highlight.Adornee = character
            highlight.Parent = CoreGui
            Highlights[player.UserId] = highlight
        end
    end

    if player.Character then
        characterAdded(player.Character)
    end
    player.CharacterAdded:Connect(characterAdded)
end

function save(data)
	pcall(function()
		writefile("Ep-lxs/gay/esp", Util.HttpService:JSONEncode(data))
	end)
end

for _, player in next, Util.Players:GetPlayers() do
    connect(player)
end

Util.Players.PlayerAdded:Connect(connect)

Util.Players.PlayerRemoving:Connect(function(player)
    if Highlights[player.UserId] then
        Highlights[player.UserId]:Destroy()
        Highlights[player.UserId] = nil
    end
end)


local Main = Material.Load({
	Title = "Ep-lxs/gay/main/esp.lua",
	Style = 1,
	SizeX = 300,
	SizeY = 400,
	Theme = "Dark",
	ColorOverrides = {
		--MainFrame = Color3.fromRGB(235,235,235)
	}
})

local Visuals = Main.New({
	Title = "Visuals"
})

local FillColor = Visuals.ColorPicker({
	Text = "FillColor",
	Default = Color3.fromRGB(0, 0, 0),
	Callback = function(Value)
		settings.FillColor = Color3.fromRGB(Value.R * 255, Value.G * 255, Value.B * 255)
		save(settings)
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "FillColor"
			})
		end
	}
})

local FillTransparency = Y.Slider({
	Text = "FillTransparency",
	Callback = function(Value)
		settings.FillTransparency = Value
		save(settings)
	end,
	Min = 0,
	Max = 1,
	Def = 0.6,
})

local OutlineColor = Visuals.ColorPicker({
	Text = "OutlineColor",
	Default = Color3.fromRGB(0, 0, 0),
	Callback = function(Value)
		settings.OutlineColor = Color3.fromRGB(Value.R * 255, Value.G * 255, Value.B * 255)
		save(settings)
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "OutlineColor"
			})
		end
	}
})

local OutlineTransparency = Y.Slider({
	Text = "OutlineTransparency",
	Callback = function(Value)
		settings.OutlineTransparency = Value
		save(settings)
	end,
	Min = 0,
	Max = 1,
	Def = 0,
})

RunService.Heartbeat:Connect(function()
	for _,highlight in next, Highlights do
		for property, value in next, settings do 
			highlight[property] = value
		end
	end
end)
