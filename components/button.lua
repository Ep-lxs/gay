local util = require("../modules/util.lua")
local colors = require("../modules/colors.lua")

return function(Activated)
    local toggle = false
    
    local button = util.Create("TextButton", {
        AutoButtonColor = false
        BackgroundColor3 = colors.background
    })
    local uicorner = util.Create("UICorner", {
        Parent = button,
        CornerRadius = UDim.new(0, 4),
    })
    local uistroke = util.Create("UIStroke", {
        Parent = button,
        ApplyStrokeMode = 1, -- Border
        Color = colors.foreground,
        Enabled = true,
        Thickness = 1,
        Transparency = 0.8,
    })

    button.Activated:Connect(function()
        if Activated and typeof(Activated) == "function" then 
            Activated()
        end

        toggle = not toggle
        if toggle then
            button.BackgroundColor3 = colors.accent
        else
            button.BackgroundColor3 = colors.background
        end
    end)

    return button
end