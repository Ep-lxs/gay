-- variables
local util = require("./modules/util.lua")
local colors = require("./modules/colors.lua")

local highlight = {
    instances = {},
}

local ui_holder = util.Create("ScreenGui", {
    Name = Util.HttpService:GenerateGUID(),
    Parent = util.CoreGui,
})

-- functions
function highlight:Create(player)
    local character = player.Character

    instances[player] = util.Create("Highlight", {
        Adornee = character,
        
    })
end

function highlight:Destroy(player)
    instances[player]:Destroy()
    instances[player] = nil
end

-- code




































--[[
local Util = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ep-lxs/gay/main/util.lua"))()

local Prefix = "/"
local Commands = {
    {
        name = "start",
        aliases = {"run"},
        run = function()
            getgenv().enabled = true
        end,
    }
    {
        name = "stop",
        aliases = {},
        run = function()
            getgenv().enabled = false
        end,
    }
}

Util.Player.Chatted:Connect(function(message)
    for _,command in next, Commands do
        if string.lower(message) == Prefix..command.name then
            command.run()
        end

        for _,alias in next, command.aliases do
            if string.lower(message) == Prefix..alias then
                command.run()
            end
        end
    end
end)]]

