local util = require("./modules/util.lua")

local guis = util.ReplicatedStorage:WaitForChild("Guis")

local nameGui = guis:WaitForChild("NameGui")
local healthGui = guis:WaitForChild("HealthGui")

local function addDecor(instance)
    local folder = util.Create("Folder", {
        Parent = instance,
    })
end

nameGui.TextLabel.Font = "GothamSemibold"
addDecor(healthGui)