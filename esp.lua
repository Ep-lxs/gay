getgenv().settings = {
    DepthMode = 0,
    FillColor = Color3.fromRGB(0, 0, 0),
    FillTransparency = 0.6,
    OutlineColor = Color3.fromRGB(0, 0, 0)
    OutlineTransparency = 0
}

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer

local Highlights = {}

local function createHighlight()
    local highlight = Instance.new("Highlight")
    
    for property, value in next, settings do 
        highlight[property] = value
    end

    return highlight
end

local function connect(player)
    if player == Player then return end

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

for _, player in next, Players:GetPlayers() do
    connect(player)
end

Players.PlayerAdded:Connect(connect)

Players.PlayerRemoving:Connect(function(player)
    if Highlights[player.UserId] then
        Highlights[player.UserId]:Destroy()
        Highlights[player.UserId] = nil
    end
end)


local Main = Material.Load({
	Title = "ChibuHub",
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

--[[local H = Y.TextField({
	Text = "Country",
	Callback = function(Value)
		print(Value)
	end,
	Menu = {
		GB = function(self)
			self.SetText("GB")
		end,
		JP = function(self)
			self.SetText("JP")
		end,
		KO = function(self)
			self.SetText("KO")
		end
	}
})]]
